Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()

local nTimeState = 0;

	nMapState = GetMissionV(TEAM_GAME_STATE);
	nTimeState = GetMissionV(TEAM_NEWS_STATE) + 1;
	SetMissionV(TEAM_NEWS_STATE,nTimeState);

	--׼���׶�
	if nMapState == 1 then
		ReportReadyState(nTimeState);
	--������
	elseif nMapState >= 2 then 
		ReportBattleState(nTimeState);
	--��������
	--elseif nMapState == 3 then 
		--Msg2MSAll(SINGLE_TEAM_MISSION_ID,"��������!");
		--StopMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID);
	end
end

--׼���׶���Ϣ����
function ReportReadyState(nTimeState)

local i = 0;
local j = 0;
local nMin = 0; 
local nSec = 0;
local nPlayerMSIndex = 0;
local news_str = "";

	if GetMissionV(READY_STATE) == 1 or GetMissionV(CAPTAIN_STATE) == 1 then
		--SetMissionV(READY_STATE,0);
		--SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--ɾȥ�˳�Npc
		CloseMission(SINGLE_TEAM_MISSION_ID);
		return
	end

	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������
	--׼��ʱ�䵽��3�����Ժ��жϳ��ڵ�ǰ���
	if nTimeState >= TEAM_READY_TIME then  
		--������ʼʱ�����������ٵ���1��
		if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) <= 0 or GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) <= 0 then				
			if GetMissionV(READY_STATE) == 0 then
				OldPlayer = PlayerIndex;
				if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) <= 0 then
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,2);
				else
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,0,1);
				end
				
				if PlayerIndex > 0 then
					for i=1,gf_GetTeamSize() do
						PlayerIndex = gf_GetTeamMember(i);
						if PlayerIndex > 0 then
							Talk(1,"","Do s� ��i trong L�i ��i �t h�n <color=yellow>2 ��i<color>, thi ��u b� h�y b�. Xin ��i gi�y l�t! ��u s� s� ���c chuy�n ra!");
						end
					end
				end
				PlayerIndex = OldPlayer;
				
				news_str = "Do s� ��i trong tr�n ��a kh�ng ��, thi ��u b� h�y b�!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
				--SetMissionV(TEAM_GAME_STATE,3);
				SetMissionV(READY_STATE,1);
				return
			end
		end

		news_str = "Thi ��u ch�nh th�c b�t ��u!";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);             
		RunMission(SINGLE_TEAM_MISSION_ID);
		return
		
	end
	
	--������δ��ʼǰ����Ϣ����
	
	nMin = floor((TEAM_READY_TIME - nTimeState) / 3);
	nSec = mod((TEAM_READY_TIME - nTimeState),3) * 20;
	
	if nMin > 0 and nSec == 0 then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:"..nMin.." ph�t.";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
	elseif nMin == 0 then
		news_str = "C�ch gi� khai chi�n l�i ��i c�n:" ..nSec.. " gi�y.";
		Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
	end
	
end


--��ս�׶�ս������
function ReportBattleState(nTimeState)

local i=0;
local j=0;
local nMin = 0; 
local nSec = 0;
local nPlayerMSIndex = 0;
local news_str = "";
local TeamMemberTab = {};

	--��ʱ�˳�
	if GetMissionV(DELAY_STATE) == 1 then
		SetMissionV(DELAY_STATE,0);
		CloseMission(SINGLE_TEAM_MISSION_ID);
		return
	end

	--��֧���鶼����
	if GetTeamState(1) == 0 and GetTeamState(2) == 0 then
		if GetMissionV(DELAY_STATE) == 0 then
			OldPlayer = PlayerIndex;
			for i=1,2 do
				nPlayerMSIndex = 0;
				for j=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,i) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,i);
					if PlayerIndex > 0 then
						tinsert(TeamMemberTab,PlayerIndex);
					end
				end
				for j=1,getn(TeamMemberTab) do
					PlayerIndex = TeamMemberTab[j];
					Talk(1,"","Thi ��u k�t th�c, hai b�n h�a nhau!");
					DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
				end
			end
			PlayerIndex = OldPlayer;
			news_str = "Thi ��u k�t th�c, hai b�n h�a nhau! Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!";
			Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			SetMissionV(TEAM_GAME_STATE,3);			
			SetMissionV(DELAY_STATE,1);
			return
		end
	end
	
	--��ǰ����ֻʣ��һ������
	if GetTeamState(1) == 0 or GetTeamState(2) == 0 then
		if GetMissionV(DELAY_STATE) == 0 then
			OldPlayer = PlayerIndex;			
			if GetTeamState(1) == 0 then
--				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
					if PlayerIndex > 0 then
						PlayerIndex = gf_GetTeamMember(0);
						if PlayerIndex > 0 then
--						tinsert(TeamMemberTab,PlayerIndex);
--					end
--				end
--				for i=1,getn(TeamMemberTab) do
--					PlayerIndex = TeamMemberTab[i];
							DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
						end
					end
				nPlayerMSIndex = 0;
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
					if PlayerIndex > 0 then
						Talk(1,"","Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do <color=yellow>"..gf_GetCaptainName().."<color> d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!");
					end
				end
				SetMissionV(MS_WIN_CAMP,2);
				news_str = "Thi ��u k�t th�c, ng��i chi�n th�ng thu�c ��i ng� "..gf_GetCaptainName().." d�n d�t!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			else
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
					if PlayerIndex > 0 then
						--tinsert(TeamMemberTab,PlayerIndex);
						PlayerIndex = gf_GetTeamMember(0);
						if PlayerIndex > 0 then
							DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
						end
					end
				end
--				for i=1,getn(TeamMemberTab) do
--					PlayerIndex = TeamMemberTab[i];
--					DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
--				end
				nPlayerMSIndex = 0;
				for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
					nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
					if PlayerIndex > 0 then
						Talk(1,"","Thi ��u k�t th�c, tr�n n�y ��i ng� chi�n th�ng do <color=yellow>"..gf_GetCaptainName().."<color> d�n d�t. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!");
					end
				end
				SetMissionV(MS_WIN_CAMP,1);
				news_str = "Thi ��u k�t th�c, ng��i chi�n th�ng thu�c ��i ng� "..gf_GetCaptainName().." d�n d�t!";
				Msg2MSAll(SINGLE_TEAM_MISSION_ID,news_str);
			end		
			PlayerIndex = OldPlayer;
			SetMissionV(TEAM_GAME_STATE,3);
			SetMissionV(DELAY_STATE,1);
			return
		end
	end
	
	--ս������
 	if nTimeState == TEAM_GAME_TIME then
 	
		OldPlayer = PlayerIndex; 	

 		--���ս��˫�����ϵ�״̬����ֹ�����ս��
 		for i=1,2 do
 			nPlayerMSIndex = 0;
 			for j=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,i) do
 				nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,i);
 				if PlayerIndex > 0 then
 					RemvoeTempEffect();
 					SetFightState(0);
 				end
 			end
 		end
 		
 		--�������н�ɫ���ͱ������
		nPlayerMSIndex = 0;
 		
 		for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) do
 			nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,0);
 			if PlayerIndex > 0 then
 				Talk(1,"","Thi ��u k�t th�c, hai b�n tham chi�n ��u h�a. Xin ��i gi�y l�t, c�c ��u th� s� ���c chuy�n ra!");
 			end
 		end
 		
 		PlayerIndex = OldPlayer;
 		
		news_str = "Thi ��u k�t th�c, hai phe h�a nhau!"
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, news_str);
		SetMissionV(TEAM_GAME_STATE,3);
 		SetMissionV(DELAY_STATE,1);
 		return
 	end
 	
	nMin = floor((TEAM_GAME_TIME - nTimeState) / 3);
	nSec = mod((TEAM_GAME_TIME - nTimeState),3) * 20;
	
	if nMin == 0 then
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, "Giai �o�n thi ��u: Thi ��u �ang ti�n h�nh, th�i gian thi ��u c�n"..nSec.." gi�y.");
	elseif nSec == 0 then
		Msg2MSAll(SINGLE_TEAM_MISSION_ID, "Giai �o�n thi ��u: Thi ��u �ang ti�n h�nh, th�i gian thi ��u c�n"..nMin.." ph�t.");
	end
	
end