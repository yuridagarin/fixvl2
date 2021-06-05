Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i, "");
	end
	
	SetMissionV(TEAM_GAME_STATE,1);
	StartMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID,SINGLE_TEAM_TIMER);
	
end

function RunMission()

local i = 0;
local nPlayerMSIndex = 0;

	OldPlayer = PlayerIndex;

	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,1) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,1);
		if PlayerIndex > 0 then
		  SetFightState(1);
		end
	end

	nPlayerMSIndex = 0;
	
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,2) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,2);
		if PlayerIndex > 0 then
		  SetFightState(1);
		end
	end

	PlayerIndex = OldPlayer;
	
 	--ɾȥ�˳�Npc
	SetNpcLifeTime(GetMissionV(NPC_INDEX),0);
 	SetMissionV(TEAM_GAME_STATE,2);
 	
end

function EndMission()

local i = 0;
local nPlayerIndex = 0;
local nPlayerMSIndex = 0;
local PlayerTab = {}; 

	OldPlayer = PlayerIndex;
	
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerTab,nPlayerIndex);
		end
	end
	
	for i=1,getn(PlayerTab) do
		PlayerIndex = PlayerTab[i];
		
		--�˳�mission��ʱ����Ѻ��������
		if GetMissionV(MS_YAJING_NUM) > 0 and PlayerIndex == gf_GetTeamMember(0) then
			local pWin = GetMissionV(MS_WIN_CAMP);
			local pCamp = GetTaskTemp(PLAYER_CAMP);
			if pCamp == 1 or pCamp == 2 then
				--�����ʤ����
				if pWin == pCamp then
					yajin_leitai_pay(GetMissionV(MS_YAJING_NUM) * 2);
					Talk(1,"",format("<color=green>Ch� l�i ��i<color>: ch�c m�ng b�n �� gi�nh chi�n th�ng, �o�t ���c v�ng ��t c��c <color=green>%d*2<color> v�ng.", GetMissionV(MS_YAJING_NUM)));
					gf_Msg2Team(format("Ch� l�i ��i ch�c m�ng b�n �� gi�nh chi�n th�ng, %s nh�n ���c v�ng c��c %d*2 v�ng", GetName(), GetMissionV(MS_YAJING_NUM)), 1);
				end
				--�����ƽ��
				if pWin == 0 then
					yajin_leitai_pay(GetMissionV(MS_YAJING_NUM));
					if GetMissionV(READY_STATE) == 1 or GetMissionV(CAPTAIN_STATE) == 1 then
						Talk(1,"",format("<color=green>Ch� l�i ��i<color>: tr�n ��u k�t th�c b�t th��ng, tr� l�i v�ng c��c l�i ��i<color=green>%d<color> v�ng.",GetMissionV(MS_YAJING_NUM)));
					else
						Talk(1,"",format("<color=green>Ch� l�i ��i<color>: tr�n ��u 2 b�n h�a nhau, tr� l�i v�ng c��c l�i ��i <color=green>%d<color> v�ng.",GetMissionV(MS_YAJING_NUM)));
					end
				end
			end
		end
		
		SetTaskTemp(PLAYER_CAMP,0);
		DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer;

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i,"");
	end
	
	--SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--ɾȥ�˳�Npc
	StopMissionTimer(SINGLE_TEAM_MISSION_ID,SINGLE_TEAM_TIME_ID);

end

function OnLeave(RoleIndex)

	local i=0;
	local j=0;
	local nPlayerMSIndex = 0;
	local nPlayerIndex = 0;
	local nDeaNum = 0;
	local nOldPlayer = 0;
	local CaptainIdTab = {};
	local TeamMemberTab = {};
	local str_news = "";

	PlayerIndex = RoleIndex;

	if PlayerIndex == gf_GetTeamMember(0) then
		if PlayerIndex == GetMissionV(CAPTAIN_ID) and GetMissionV(TEAM_GAME_STATE) == 1 then
			SetMissionV(CAPTAIN_STATE,1);
			Msg2MSAll(SINGLE_TEAM_MISSION_ID,"Do ��i ��ng k� thi ��u r�i kh�i tr�n ��a n�n thi ��u b� h�y b�! Xin ��i gi�y l�t! ��u s� s� ���c chuy�n ra!")
		end
		nOldPlayer = PlayerIndex;

		if IsPlayerDeath() ~= 0 then
			nDeaNum = 1;
		end
		for i=1,gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 and PlayerIndex ~= gf_GetTeamMember(0) then
				if IsPlayerDeath() ~= 0 then
					nDeaNum = nDeaNum + 1;
				end
				tinsert(TeamMemberTab,PlayerIndex);
			end
		end
		
		if nDeaNum == gf_GetTeamSize() then
			str_news = "Do ��i ng� hi�n t�i b� ��i ph��ng di�t s�ch, thi ��u th�t b�i, l�p t�c chuy�n ra kh�i ��u tr��ng!";
		elseif GetMissionV(TEAM_GAME_STATE) == 3 then
			str_news = "";
		else
			str_news = "Do ��i tr��ng r�i kh�i tr�n ��a, t�t c� ��i vi�n s� b� chuy�n ra kh�i ��u tr��ng!";
		end
		
		PlayerIndex = nOldPlayer;
		Msg2Player(str_news);
		nOldPlayer = PlayerIndex;
		
		for i=1,getn(TeamMemberTab) do
			PlayerIndex = TeamMemberTab[i];
			if PlayerIndex > 0 then
				Msg2Player(str_news);
				DelMSPlayer(SINGLE_TEAM_MISSION_ID,0);
			end
		end
		PlayerIndex = nOldPlayer;
	end

	str_news = GetName().."R�i tr�n ��a.";
	Msg2MSAll(SINGLE_TEAM_MISSION_ID,str_news);
	
	SetTaskTemp(PLAYER_CAMP,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--��־��ɫ�뿪������̨
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end
	
	SetPlayerState(3,1,1);
	
	--������ʱ�������
	SetTaskTemp(TMP_TASK_BW_YAJIN_LEITAI, 0);
	
	SetCreateTeam(0); --����ӹ���
	
  NewWorld(GetLeavePos());
  
  --����ɫΪ����뿪mission�Ľ�ɫʱ�ر�mission
	if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,0) <= 0 then
		CloseMission(SINGLE_TEAM_MISSION_ID);
	end
    
end