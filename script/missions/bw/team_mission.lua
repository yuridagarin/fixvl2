Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i,0);
	end;
	
	for i = 1, 100 do 
		SetMissionS(i, "")
	end;
	
	SetMissionV(TEAM_GAME_STATE,1);
	
	--nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	--SetMissionV(START_TIME,nTime)
	--WriteLog("[������̨] ��ʼ���ɹ�!ʱ��Ϊ"..nTime);

end;

function RunMission()

local i=0;
local j=0;

	--WriteLog("[������̨] ������ʼ����������Ϊ:"..nTotalFigtherNum.."�ˣ��볡������Ϊ��"..GetMissionV(MULTIMAP_BONUS))

	OldPlayer = PlayerIndex;
	
	for i=1,10 do	
		if GetMissionV(CAPTAIN_ID+i-1) > 0 then
			PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
			for j=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(j);
				if PlayerIndex > 0 then
	  			SetPlayerState(2,1);--���ÿ�սʱѡ��״̬
	  		--else
	  		--WriteLog("[������̨] RunMissionʱת����ɫ״̬����������������Ϊ"..PlayerIndex);
	  		end
	  	end
	  end
	end

	PlayerIndex = OldPlayer;
	--ɾȥ�˳�Npc
	SetNpcLifeTime(GetMissionV(NPC_INDEX),0)
 	SetMissionV(TEAM_GAME_STATE,2);
end;

function EndMission()

local i = 0;
local nPlayerIndex = 0;
local nPlayerMSIndex = 0;
local PlayerIdxTab = {};
local nTotalNum = GetMSPlayerCount(TEAM_MISSION_ID,0)

	OldPlayer = PlayerIndex
	
	for i=1,nTotalNum do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(TEAM_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerIdxTab,nPlayerIndex);
		end
	end
	
	--if nTotalNum ~= getn(PlayerIdxTab) then
		--WriteLog("[������̨] ������ʼʱ��ȡPlayerIndexʱ����������������");
	--end
	
	for i=1,getn(PlayerIdxTab) do
		PlayerIndex = PlayerIdxTab[i];
		SetTaskTemp(PLAYER_CAMP,0);
		SetTaskTemp(TOTAL_KILL_NUM,0);
		DelMSPlayer(TEAM_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer;
	
	--nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	--SetMissionV(OVER_TIME,nTime);
	--WriteLog("[������̨] ����!!!���ؿ���ʱ��Ϊ:"..GetMissionV(START_TIME).."����ʱ��Ϊ:"..nTime);

	SetNpcLifeTime(GetMissionV(NPC_INDEX),0)--ɾȥ�˳�Npc

	for i=1,100 do 
		SetMissionV(i,0);
	end
	
	for i=1,10 do 
		SetMissionS(i,"");
	end

	StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID1);
	StopMissionTimer(TEAM_MISSION_ID,TEAM_TIME_ID2);
	
end

function OnLeave(RoleIndex)

local i = 0;
local j = 0;
local nOldPlayer = 0;
local nDeaNum = 0;
local nCamptainState = 0;
local TeamMemberTab = {};

	PlayerIndex = RoleIndex
	
	if GetMissionV(TEAM_GAME_STATE) < 3 then	
		for i=1,10 do
			nDeaNum = 0;
			nCamptainState = 0;
			if PlayerIndex == GetMissionV(CAPTAIN_ID+i-1) then
				nOldPlayer = PlayerIndex;
				SetMissionS(i,"");
				SetMissionV(CAPTAIN_ID+i-1,0);
				for j=1,gf_GetTeamSize() do
					PlayerIndex = gf_GetTeamMember(j)
					if PlayerIndex > 0 then
						if IsPlayerDeath() ~= 0 then
							nDeaNum = nDeaNum + 1;
						end
						tinsert(TeamMemberTab,gf_GetTeamMember(j))
					end
				end
				
				if nDeaNum == gf_GetTeamSize() then
					nCamptainState = 1;
				end
				
				for j=1,getn(TeamMemberTab) do
					OldPlayer = PlayerIndex;
					PlayerIndex = TeamMemberTab[j];
					if PlayerIndex > 0 then
						if GetMissionV(GAME_TYPE) == 3 and GetMissionV(TEAM_GAME_STATE) >= 2 then
							PayAward(3);
						end
						if PlayerIndex ~= nOldPlayer then						
							if nCamptainState ~= 1 then
								Msg2Player("Do ��i tr��ng r�i kh�i tr�n ��a, t�t c� ��i vi�n s� b� chuy�n ra kh�i ��u tr��ng!");
							else
								Msg2Player("��i c�a b�n b� ti�u di�t s�ch, hi�n chuy�n ��i ng� c�a b�n ra kh�i tr�n ��a!");
							end
							DelMSPlayer(TEAM_MISSION_ID,0);
						end
					end
					PlayerIndex = OldPlayer;
				end
				PlayerIndex = nOldPlayer;
				if nCamptainState ~= 1 then
					Msg2Player("Do ��i tr��ng r�i kh�i tr�n ��a, t�t c� ��i vi�n s� b� chuy�n ra kh�i ��u tr��ng!");
				else
					Msg2Player("��i c�a b�n b� ti�u di�t s�ch, hi�n chuy�n ��i ng� c�a b�n ra kh�i tr�n ��a!");
				end
			end
		end	
	end
	
	SetTaskTemp(PLAYER_CAMP,0);
	SetTaskTemp(TOTAL_KILL_NUM,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--��־��ɫ�뿪������̨
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end
	
	SetPlayerState(3,1,1);
	
  NewWorld(GetLeavePos());
  
  --����ɫΪ����뿪mission�Ľ�ɫʱ�ر�mission
	if GetMSPlayerCount(TEAM_MISSION_ID,0) <= 0 and GetMissionV(GAME_TYPE) == 0 then
		--SetMissionV(TEAM_GAME_STATE,3);
		CloseMission(TEAM_MISSION_ID);
	end

end