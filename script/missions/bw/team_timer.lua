Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;
nReadyState = 0;

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(TEAM_GAME_STATE);
	nTimeState = GetMissionV(TEAM_NEWS_STATE) + 1;
	SetMissionV(TEAM_NEWS_STATE,nTimeState);

	--׼���׶�
	if nMapState == 1 then
		ReportReadyState(nTimeState);
	--������
	elseif nMapState == 2 then 
		ReportBattleState(nTimeState);
	--��������
	elseif nMapState == 3 then 
		Msg2MSAll(TEAM_MISSION_ID,"Thi ��u k�t th�c!");
		--StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID1);
	end
end

--׼���׶���Ϣ����
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nTeamNum = GetGameTeamNum();

	if GetMissionV(READY_STATE) == 1 then
		SetMissionV(READY_STATE,0);
		SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--ɾȥ�˳�Npc			 
		SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
		return
	end

	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	--׼��ʱ�䵽��3�����Ժ��жϳ��ڵ�ǰ���
	if nTimeState >= TEAM_READY_TIME then 
		
		--������ʼʱ�����������ٵ���1��
		if nTeamNum <= 1 then
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				for i=1,gf_GetTeamSize() do
					if gf_GetTeamMember(i) > 0 then					
						PlayerIndex = gf_GetTeamMember(i)
						Say("Do s� ��i trong L�i ��i �t h�n <color=yellow>2 ��i<color>, thi ��u b� h�y b�, ph� b�o danh s� ���c tr� l�i cho ��i tr��ng. Xin ��i gi�y l�t! ��u s� s� ���c chuy�n ra!",0);
					end
				end
			end
			PlayerIndex = OldPlayer
			news_str = "Do s� ��i trong tr�n ��a kh�ng ��, thi ��u b� h�y b�!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			SetMissionV(READY_STATE,1);
			return
		end
		
		--������ʼ����
		
		OldPlayer = PlayerIndex
		
		for i=1,nTeamNum do	
			nCaptainIndex = GetMissionV(CAPTAIN_ID+i-1);
			if nCaptainIndex > 0 then
				PlayerIndex = nCaptainIndex;
				for j=1,gf_GetTeamSize() do
					if gf_GetTeamMember(j) > 0 then
						PlayerIndex = gf_GetTeamMember(j);
						Talk(1,"","Thi ��u ch�nh th�c b�t ��u, s� ��i trong tr�n hi�n l� <color=yellow>"..nTeamNum.."<color> ��i!")
					end
				end
			end
		end
		
		PlayerIndex = OldPlayer
		
		news_str = "Thi ��u ch�nh th�c b�t ��u!";
		Msg2MSAll(TEAM_MISSION_ID,news_str);             
		RunMission(TEAM_MISSION_ID);
		return
	end
	
	--������δ��ʼǰ����Ϣ����
	
	nMin = floor((TEAM_READY_TIME - nTimeState) / 3);
	nSec = mod((TEAM_READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:"..nMin.." ph�t, s� ��i trong tr�n hi�n l� "..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	elseif (nMin == 0) then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:" ..nSec.. " gi�y, s� ��i trong tr�n hi�n l�"..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID,news_str);
	end
	
end


--��ս�׶�ս������
function ReportBattleState(nTimeState)

local news_str = "";
local i=0;
local j=0;
local nMin = 0; 
local nSec = 0;
local nWinCaptianName = "";
local nKillNum = 0;
local nDeadNum = 0;
local nPlayerMSIndex = 0;
local nTeamNum = 0;
local nTeamNumLife = 0;
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nCaptainName = "";
local nPlayerName = "";
local TeamMember = {};

	--�����鱻ȫ�����ͳ�����
	OldPlayer = PlayerIndex;
	for i=1,10 do
		nDeadNum = 0;
		PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
		if PlayerIndex > 0 then
			for j=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(j);
				if PlayerIndex > 0 then
					if IsPlayerDeath() ~= 0 then
						nDeadNum = nDeadNum + 1;
					end
				end 
			end
			if nDeadNum == gf_GetTeamSize() then
--				for j=1,gf_GetTeamSize() do
--					PlayerIndex = gf_GetTeamMember(j);
--					if PlayerIndex > 0 then
--						tinsert(TeamMember,PlayerIndex);
--					end
--				end
--				for j=1,getn(TeamMember) do
--					PlayerIndex = TeamMember[j];
					PlayerIndex = gf_GetTeamMember(0);
					--Msg2Player("���������ڵĶ���ȫ���ְ����Ƕ��鴫��������");
					DelMSPlayer(TEAM_MISSION_ID,0);
				--end
			end
		end	
	end
	PlayerIndex = OldPlayer
	
	--��ʱ�˳�
	if GetMissionV(DELAY_STATE) == 1 then
		SetMissionV(DELAY_STATE,0);
		SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
		return
	end
	
	nTeamNumLife = GetGameTeamNumByLife();

	--��ǰ����ֻʣ��һ������
	if nTeamNumLife <= 1 then
	
		if GetMissionV(DELAY_STATE) == 0 then
		
			OldPlayer = PlayerIndex;
			
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					nWinCaptianName = GetName();
					for j=1,gf_GetTeamSize() do
						if gf_GetTeamMember(j) > 0 then
							PlayerIndex = gf_GetTeamMember(j);
							news_str = "Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do <color=yellow>"..nWinCaptianName.."<color> d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
							Say(news_str,0);
						end
					end
					break;
				end
			end
					
			PlayerIndex = OldPlayer; 	
			
			SetMissionV(DELAY_STATE,1);
			
			news_str = "Thi ��u k�t th�c, ng��i chi�n th�ng thu�c ��i ng� "..nWinCaptianName.." d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			return
		end
		
	end
	
	--ս������
	
 	if nTimeState >= TEAM_GAME_TIME then
 		
 		if GetMissionV(DELAY_STATE) == 0 then
 			
 			--��������ȥ����ɫ��������״̬��ֹͣս��
 			nPlayerMSIndex = 0;
 			OldPlayer = PlayerIndex;
 			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do
 				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
 				if PlayerIndex > 0 then
 					SetFightState(0);
 					RemvoeTempEffect();
 				end
 			end
 			PlayerIndex = OldPlayer;
 		
 			if nTeamNumLife <= 1 then
 			
 				for i=1,10 do
					if GetMissionV(CAPTAIN_ID+i-1) > 0 then
						PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
						--if IsPlayerDeath() == 0 then
							nWinCaptianName = GetName();
							for j=1,gf_GetTeamSize() do
								if gf_GetTeamMember(j) > 0 then
									PlayerIndex = gf_GetTeamMember(j);
									news_str = "Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do <color=yellow>"..nWinCaptianName.."<color> d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
									Say(news_str,0);
									news_str = "Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do"..nWinCaptianName.."d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!"
									Msg2MSAll(TEAM_MISSION_ID,news_str);
								end
							end
						--end
						break;
					end
				end
 				SetMissionV(DELAY_STATE,1);
 				return
 			end
			
			WinnerTab = GetMurderCaptainIDTab(nTeamNumLife);--��ö���ɱ����Ŀ�ɴ�С����Ķӳ�index��list
			
			for i=1,getn(WinnerTab[1]) do
				nKillNum = 0;
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				nWinCaptianName = GetName();
				for j=1,gf_GetTeamSize() do
					if gf_GetTeamMember(j) > 0 then
						PlayerIndex = gf_GetTeamMember(j);
						nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
					end
				end
				tinsert(Winner_info,nWinCaptianName);
				tinsert(Winner_info,nKillNum);
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {};
			end
			
			news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng tr�n n�y l� do"
			
			for i=1,getn(Winner_News) do
				if i == getn(Winner_News) then
					nPlayerName = nPlayerName..Winner_News[i][1].."."
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."d�n d�t, <color> ��nh b�i: <color=yellow>"..Winner_News[i][2].."<color> ng��i. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
					nCaptainName = nCaptainName..Winner_News[i][1];
				else
					nPlayerName = nPlayerName..Winner_News[i][1]..","
					news_str = news_str.."<color=yellow>"..Winner_News[i][1].."d�n d�t, <color> ��nh b�i: <color=yellow>"..Winner_News[i][2].."<color> ng��i; "
					nCaptainName = nCaptainName..Winner_News[i][1]..",";
				end
			end
			
			--�������н�ɫ���ͱ������
			OldPlayer = PlayerIndex
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then
					nPlayerName = nPlayerName..GetName();
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					for j=1,gf_GetTeamSize() do
						if gf_GetTeamMember(j) > 0 then
							PlayerIndex = gf_GetTeamMember(j);
							Say(news_str,0);
						end
					end
				end
			end
			PlayerIndex = OldPlayer;
			SetMissionV(DELAY_STATE,1);
			news_str = "Thi ��u k�t th�c, ng��i chi�n th�ng thu�c ��i ng�:"..nCaptainName.." d�n d�t. Xin ��i gi�y l�t, c�c anh h�ng s� ���c chuy�n ra!"
			Msg2MSAll(TEAM_MISSION_ID, news_str);    	
 			return
 		end 		
 	end
 	
	nMin = floor((TEAM_GAME_TIME - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME - nTimeState),3) * 20;
	
	nTeamNum = GetGameTeamNum();
	
	if (nMin == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai �o�n thi ��u: Thi ��u �ang ti�n h�nh, trong L�i ��i hi�n c�"..nTeamNum.." ��i, th�i gian thi ��u c�n l�i "..nSec.." gi�y.");
	elseif (nSec == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai �o�n thi ��u: Thi ��u �ang ti�n h�nh, trong L�i ��i hi�n c�"..nTeamNum.." ��i, th�i gian thi ��u c�n l�i "..nMin.." ph�t.");
	end
	
end