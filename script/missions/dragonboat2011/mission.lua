--脚本功能：海上龙舟站关卡调用
--功能设计：大熊、小宇宙
--功能开发：波波、村长
--功能测试：小熊、饭姐
--开发时间：2011-8-23
--修改记录：
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function InitMission()
	--print("InitMission called")
	-- 初始化一些设置
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
	WriteLog("[H秈 Chi課 Long Ch﹗ k誸 th骳]: th阨 gian t筰"..GetMissionV(MV_LZZ_LOG_TIME).."H秈 Chi課 Long Ch﹗  k誸 th骳, s? ngi cu鑙 c飊g:["..nPlayerOne.."]:["..nPlayerTwo.."], t鎛g s? ngi l?: "..(nPlayerOne+nPlayerTwo))  
	LZZ_ProcessBattleOver() 
	local nMapID = GetMissionV(MV_LZZ_MAP_ID) 	
	ClearMapNpc(nMapID) 
	local nMapIdx = GetMissionV(MV_LZZ_MAP_INDEX) 
	LZZ_ClearMissionData() 
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx) 	--FreeDynamicMap也会调用CloseMisssion
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
