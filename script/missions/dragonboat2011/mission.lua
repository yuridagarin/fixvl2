--�ű����ܣ���������վ�ؿ�����
--������ƣ����ܡ�С����
--���ܿ������������峤
--���ܲ��ԣ�С�ܡ�����
--����ʱ�䣺2011-8-23
--�޸ļ�¼��
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function InitMission()
	--print("InitMission called")
	-- ��ʼ��һЩ����
	LZZ_InitBattle()
end
function RunMission()
	--print("RunMission() called!")
	local nMapId = gf_GetCurMapID()
	local nNpcIdx = 0
	LZZ_RunBattle()
end
function EndMission()
	--print("EndMisssion() called!")
	local nPlayerOne = GetMSPlayerCount(MISSIONID,CampSong_ID) 
	local nPlayerTwo = GetMSPlayerCount(MISSIONID,CampLiao_ID) 	
	WriteLog("[H�i Chi�n Long Ch�u k�t th�c]: th�i gian t�i"..GetMissionV(MV_LZZ_LOG_TIME).."H�i Chi�n Long Ch�u �� k�t th�c, s� ng��i cu�i c�ng:["..nPlayerOne.."]:["..nPlayerTwo.."], t�ng s� ng��i l�: "..(nPlayerOne+nPlayerTwo))  
	LZZ_ProcessBattleOver() 
	local nMapID = GetMissionV(MV_LZZ_MAP_ID) 	
	ClearMapNpc(nMapID) 
	local nMapIdx = GetMissionV(MV_LZZ_MAP_INDEX) 
	LZZ_ClearMissionData() 
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx) 	--FreeDynamicMapҲ�����CloseMisssion
	if nRetCode ~= 1 then
		WriteLog(tSTRING_MISSION_LOG[2]..nRetCode) 
	end 		
end
function JoinMission(RoleIndex,nCamp)
	--print("JoinMission called!")
	PlayerIndex = RoleIndex
	LZZ_JoinBattle(nCamp)
	PlayerIndex = RoleIndex
end
function OnLeave(RoleIndex)
	--print("OnLeave() called!")
	PlayerIndex = RoleIndex
	LZZ_LeaveBattle()
	PlayerIndex = RoleIndex
end
