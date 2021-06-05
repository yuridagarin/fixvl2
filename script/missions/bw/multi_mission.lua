Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()
	for i = 1, 100 do 
		SetMissionV(i,0);
	end;
	
	for i = 1, 100 do 
		SetMissionS(i, "")
	end;
	
	SetMissionV(MULTIMAP_STATE, 1);
	
	nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	SetMissionV(START_TIME,nTime)
	WriteLog("[Qu�n h�ng chi�n]Th�nh c�ng ban ��u! Th�i gian l�"..nTime);

end;

function RunMission()

local nTotalFigtherNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local i = 0;
local PlayerMSIndex = 0;

	WriteLog("[Qu�n h�ng chi�n]Thi ��u b�t ��u, s� ng��i tham chi�n l�:"..nTotalFigtherNum.." ng��i, t�ng ph� v�o tr�n l�:"..GetMissionV(MULTIMAP_BONUS))

	OldPlayer = PlayerIndex;
	
	for i=1,nTotalFigtherNum do	
		PlayerMSIndex,PlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,1);
		if PlayerIndex > 0 then
	  	SetPlayerState(2,1);--���ÿ�սʱѡ��״̬
	  else
	  	WriteLog("[Qu�n h�ng chi�n]Khi RunMission, h��ng d�n tr�ng th�i chuy�n ��i nh�n v�t b�o l�i l�"..PlayerIndex);
	  end
	end

	PlayerIndex = OldPlayer;
	--ɾȥ�˳�Npc
	SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)
 	SetMissionV(MULTIMAP_STATE, 2);
end;

function EndMission()

local i = 0;
local nPlayerIndex = 0;
local nPlayerMSIndex = 0;
local PlayerIdxTab = {};
local nTotalNum = GetMSPlayerCount(MULIT_MISSION_ID,0)

	OldPlayer = PlayerIndex
	
	for i=1, nTotalNum do 
		nPlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,nPlayerMSIndex,0);
		if nPlayerIndex > 0 then
			tinsert(PlayerIdxTab,nPlayerIndex);
		end
	end
	
	if nTotalNum ~= getn(PlayerIdxTab) then
		WriteLog("[Qu�n h�ng chi�n]Khi thi ��u b�t ��u, nh�n PlayerIndex kh�ng ph� h�p v�i s� l��ng tr�n h�nh!");
	end
	
	for i=1,getn(PlayerIdxTab) do
		PlayerIndex = PlayerIdxTab[i];
		SetTaskTemp(PLAYER_CAMP,0);
		SetTaskTemp(TOTAL_KILL_NUM,0);
		DelMSPlayer(MULIT_MISSION_ID,0);
	end
	
	PlayerIndex = OldPlayer
	
	nTime  = tonumber(date("%m")..date("%d")..date("%H")..date("%M"))	
	SetMissionV(OVER_TIME,nTime);
	WriteLog("[Qu�n h�ng chi�n]K�t th�c!!! Th�i gian m� tr�n ��a l�:"..GetMissionV(START_TIME).."Th�i gian k�t th�c l� :"..nTime);

	SetNpcLifeTime(GetMissionV(MULTIMAP_NPC_INDEX),0)--ɾȥ�˳�Npc

	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;

	StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID1);
	StopMissionTimer(MULIT_MISSION_ID, MULTI_TIME_ID2);
	
end;

function OnLeave(RoleIndex)

	PlayerIndex = RoleIndex
	
	SetTaskTemp(PLAYER_CAMP,0);
	SetTaskTemp(TOTAL_KILL_NUM,0);
	SetTask(MULTIMAP_PLAYER_STATE,0);--��־��ɫ�뿪������̨
	
	SetPlayerState(3);
	
  NewWorld(GetLeavePos());
  
  --����ɫΪ����뿪mission�Ľ�ɫʱ�ر�mission
	if GetMSPlayerCount(MULIT_MISSION_ID,0) <= 0 and GetMissionV(GAME_TYPE) == 0 then
		SetMissionV(MULTIMAP_STATE, 3);
		CloseMission(MULIT_MISSION_ID);
	end

end;