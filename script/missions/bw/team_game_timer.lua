Include("\\script\\missions\\bw\\bwhead.lua");

nDelayState = 0;

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
		--StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2);		
	end
end

--׼���׶���Ϣ����
function ReportReadyState(nTimeState)

local news_str = "";
local nMin = 0; 
local nSec = 0;
local nReportTime = 0;
local nTeamNum = GetGameTeamNum();
local i = 0;

	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	--׼��ʱ�䵽��15�����Ժ��жϳ��ڵ�ǰ���
	if nTimeState >= TEAM_READY_TIME_AWARD then 
	
		--������ʼʱ���������ٵ���1��
		if nTeamNum <= 1 then			
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(CAPTAIN_ID);
			if PlayerIndex > 0 then
				if GetMissionV(GAME_TYPE) == 4 then
					--�����볡�Ѹ��ӳ�
					Earn(TEAM_GAME_MONEY);
					for i=1,gf_GetTeamSize() do
						if gf_GetTeamMember(i) > 0 then					
							PlayerIndex = gf_GetTeamMember(i)
							Say("Do s� ��i trong L�i ��i �t h�n <color=yellow>2<color>, thi ��u b� h�y b�, ph� b�o danh s� ���c tr� l�i cho ��i tr��ng. Xin ��i gi�y l�t! ��u s� s� ���c chuy�n ra!",0);
						end
					end
				end
			end
			PlayerIndex = OldPlayer
			
			news_str = "Do s� ��i trong tr�n ��a kh�ng ��, thi ��u b� h�y b�! Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
			Msg2MSAll(TEAM_MISSION_ID,news_str);	
			--�����漰�볡����˲�����ʱ�������������ʱ�׶ν�����ʹ��ȡ�볡�Ѳ����˻�				
			SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--ɾȥ�˳�Npc			 
			SetMissionV(TEAM_GAME_STATE,3);
			CloseMission(TEAM_MISSION_ID);
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
	
	--������Ϣ����
	
	nMin = floor((TEAM_READY_TIME_AWARD - nTimeState) / 3);
	nReportTime = mod(floor((TEAM_READY_TIME_AWARD - nTimeState) / 3),3);
	nSec = mod((TEAM_READY_TIME_AWARD - nTimeState),3) * 20;
	
	--ÿ��������һ����Ϣ
	if nReportTime == 0 and nSec == 0 and nMin > 0 then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:"..nMin.." ph�t, s� ��i trong tr�n hi�n l� "..nTeamNum.."! ";
		Msg2MSAll(TEAM_MISSION_ID, news_str);
		Msg2SubWorld("��i Ch� C��ng thay m�t ch� nh�n t� ch�c ��i chi�n t�i l�i ��i Th�nh ��! Hoan ngh�nh c�c anh h�ng h�o h�n ��n b�o danh! C�ch gi� khai chi�n c�n "..nMin.." ph�t, ��i ng� tham chi�n hi�n t�i l� "..nTeamNum..". ");
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
local k=0;
local nMin = 0; 
local nSec = 0;
local nWinCaptianName = "";
local nKillNum = 0;
local nDeadNum = 0;
local nPlayerMSIndex = 0;
local nDate = 0;
local nCaptainState = 0;
local nTeamNum = 0;
local nTeamNumLife = 0;
local WinnerTab = {};
local Winner_info = {};
local Winner_News = {};
local nCaptainName = "";
local nBonus = 0;
local Bonus_str = "";
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
--						if GetMissionV(GAME_TYPE) == 3 then
--							PayAward(3);
--						end
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
	
	--�ӳ��˳�
 	if GetMissionV(DELAY_STATE) == 1 then
 		SetMissionV(DELAY_STATE,0);
 		SetMissionV(TEAM_GAME_STATE,3);
 		CloseMission(TEAM_MISSION_ID);
 		return
 	end
 	
 	nTeamNumLife = GetGameTeamNumByLife();
	
	--ֻʣ��һ������
	if nTeamNumLife <= 1 then
		if GetMissionV(DELAY_STATE) == 0 then		
			OldPlayer = PlayerIndex;
			for i=1,10 do
				if GetMissionV(CAPTAIN_ID+i-1) > 0 then				
					PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
					if GetMissionV(GAME_TYPE) == 4 then
						nBonus = floor(GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)
						Bonus_str = TurnMoneyFormat(nBonus);
						Earn(nBonus);
					end
					nWinCaptianName = GetName();
					--��ʤ�����鷢�ų��潱��
					for j=1,gf_GetTeamSize() do
						PlayerIndex = gf_GetTeamMember(j);
						if PlayerIndex > 0 then
							if GetMissionV(GAME_TYPE) == 3 then
								PayAward(4);
								news_str = "Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do <color=yellow>"..nWinCaptianName.."<color> d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
							elseif GetMissionV(GAME_TYPE) == 4 then
								news_str = "Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do <color=yellow>"..nWinCaptianName.."<color> d�n d�t, Theo quy t�c s� nh�n ���c ph�n th��ng"..Bonus_str..". Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
							else
								news_str = "Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do <color=yellow>"..nWinCaptianName.."<color> d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
							end
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
			Msg2SubWorld(nWinCaptianName.." ��i n�o ti�u di�t to�n b� ��i ph��ng b�n kia tr��c khi k�t th�c thi ��u, s� l�p t�c gi�nh th�ng l�i!");
			AddGlobalNews(nWinCaptianName.." ��i n�o ti�u di�t to�n b� ��i ph��ng b�n kia tr��c khi k�t th�c thi ��u, s� l�p t�c gi�nh th�ng l�i!");
			return
		end
	end
	
	--ս������
 	if nTimeState >= TEAM_GAME_TIME_AWARD then
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
							break;
						--end
					end
				end
 				SetMissionV(DELAY_STATE,1);
 				return
 			end
			
			WinnerTab = GetMurderCaptainIDTab(nTeamNumLife);--��ö���ɱ����Ŀ�ɴ�С����Ķӳ�index��list
			
			nBonus = floor((GetMissionV(TEAM_GAME_BONUS)*TEAM_BONUS_RATE)/getn(WinnerTab[1]));
			Bonus_str = TurnMoneyFormat(nBonus);

			for i=1,getn(WinnerTab[1]) do
				nKillNum = 0;
				OldPlayer = PlayerIndex
				PlayerIndex = WinnerTab[1][i];
				nWinCaptianName = GetName();
				if GetMissionV(GAME_TYPE) == 4 then
					Earn(nBonus);
				end
				for j=1,gf_GetTeamSize() do
					PlayerIndex = gf_GetTeamMember(j);
					if PlayerIndex > 0 then
						nKillNum = nKillNum + GetTaskTemp(TOTAL_KILL_NUM);
					end
				end
				tinsert(Winner_info,nWinCaptianName);
				tinsert(Winner_info,nKillNum);
				tinsert(Winner_News,Winner_info);
				PlayerIndex = OldPlayer
				Winner_info = {};
			end
			
			--���ж���ɱ����Ŀ��Ϊ0��������Ϊ�;�
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Do m�i ��i thi ��u tr�n n�y ��u kh�ng c� th��ng vong, thi ��u ���c x� h�a! Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
			else
				news_str = "Thi ��u k�t th�c, ��u th� chi�n th�ng tr�n n�y l� do"
				for i=1,getn(Winner_News) do			
					if i == getn(Winner_News) then
						nPlayerName = nPlayerName..Winner_News[i][1].."."
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."d�n d�t, <color> ��nh b�i: <color=yellow>"..Winner_News[i][2].."<color> ng��i.";
						if GetMissionV(GAME_TYPE) == 4 then 
							news_str = news_str.."��i chi�n th�ng s� nh�n ���c ph�n th��ng"..Bonus_str..". Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
						end
						nCaptainName = nCaptainName..Winner_News[i][1];
					else
						nPlayerName = nPlayerName..Winner_News[i][1]..","
						news_str = news_str.."<color=yellow>"..Winner_News[i][1].."d�n d�t, <color> ��nh b�i: <color=yellow>"..Winner_News[i][2].."<color> ng��i; "
						nCaptainName = nCaptainName..Winner_News[i][1]..",";
					end
				end
			end
			
			--�������н�ɫ���ͱ������
			OldPlayer = PlayerIndex;
			nPlayerMSIndex = 0;
			for i=1,GetMSPlayerCount(TEAM_MISSION_ID,0) do	
				nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
				if PlayerIndex > 0 then
					Say(news_str,0);
				end
			end
			PlayerIndex = OldPlayer;
			
			--��ʤ�����鷢���潱��
			if GetMissionV(DECEDEND_NUM) ~= 0 and GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex;
				for i=1,getn(WinnerTab[1]) do
					PlayerIndex = WinnerTab[1][i];
					if PlayerIndex > 0 then
						for j=1,gf_GetTeamSize() do
							PlayerIndex = gf_GetTeamMember(i);
							if PlayerIndex > 0 then
								PayAward(4);
							end
						end
					end
				end
				PlayerIndex = OldPlayer;
			end

			--��ʧ�ܶ��鷢�ų��潱��
			if GetMissionV(GAME_TYPE) == 3 then
				OldPlayer = PlayerIndex
				for i=1,10 do
					nPlayerMSIndex = 0;
					for j=1,GetMSPlayerCount(TEAM_MISSION_ID,i) do
						nPlayerMSIndex,PlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,i);
						if PlayerIndex > 0 then
							--���û��ʤ���������˾��ܵý���
							if GetMissionV(DECEDEND_NUM) == 0 then
								PayAward(3);
							else
								for k=1,getn(WinnerTab[1]) do
									if gf_GetTeamMember(0) == WinnerTab[1][k] then
										nCaptainState = 1;
										break
									end
								end
								--���Ϊʤ�������򲻷�����
								if nCaptainState ~= 1 then
									PayAward(3);
								end
								nCaptainState = 0;
							end
						end
					end
				end			
				PlayerIndex = OldPlayer;
			end
			
			SetMissionV(DELAY_STATE,1);
			if GetMissionV(DECEDEND_NUM) == 0 then
				news_str = "Thi ��u k�t th�c, hai ��i h�a nhau!"
			else 
				news_str = "Thi ��u k�t th�c, ng��i chi�n th�ng thu�c ��i ng�:"..nCaptainName.." d�n d�t."
			end
			Msg2MSAll(TEAM_MISSION_ID,news_str);
			return
		end
 		
 	end
 	
	nMin = floor((TEAM_GAME_TIME_AWARD - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME_AWARD - nTimeState),3) * 20;
	
	nTeamNum = GetGameTeamNum();
	
	if (nMin == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai �o�n thi ��u: Thi ��u �ang ti�n h�nh, trong L�i ��i hi�n c�"..nTeamNum.." ��i, th�i gian thi ��u c�n l�i "..nSec.." gi�y.");
	elseif (nSec == 0) then
		Msg2MSAll(TEAM_MISSION_ID, "Giai �o�n thi ��u: Thi ��u �ang ti�n h�nh, trong L�i ��i hi�n c�"..nTeamNum.." ��i, th�i gian thi ��u c�n l�i "..nMin.." ph�t.");
	end
	
end
