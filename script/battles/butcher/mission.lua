Include("\\script\\battles\\butcher\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
end

function RunMission()
	SetMissionV(MS_STATE,2);
	
--	bt_assignrank(1) --给宋方的玩家分配官衔
--	bt_assignrank(2) --给辽方的玩家分配官衔

	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
		break
		end
 		if (pidx > 0) then
 			PlayerIndex = pidx;
		end
	--此时为GM发布命令，正式打响战斗
	PutMessage("Qu﹏ ch  b総 u h祅h ng! C竎 tng s? mau x玭g pha ti襫 tuy課, anh d騨g chi課 u!") 
end

end;

function EndMission()
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 39);
	StopMissionTimer(MISSIONID ,40);
	
	GameOver()
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("T鑞g"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧")
	DeleteChannel("Li猽"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧")


	SetGlbValue(GLB_BATTLESTATE, 0) --设置该全局变量为1，标志当前服务器正处于宋辽战役阶段，此时襄阳或朱仙镇的出口点自动设在宋辽战役的报名点，否则则设在原宋辽战场地图
	sl_clearbattledata()	--本次战斗结束后，清除战场信息
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--计算战功系数，重置战功
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	ForbidChangePK(0);

	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "T鑞g"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧")
	else
		LeaveChannel(PlayerIndex, "Li猽"..szGAME_GAMELEVEL[level].."D筺g th鴆 c鮱 s竧")
	end
	SetPKFlag(0, 0)

	--在战场开战以后离开战场则视为“逃离”，限制本场次不可再进入任何一方
	--具体实现为1小时之内不能再次进入战场
--	if GetMissionV(MS_STATE) == 2 then
--		local nLeaveTime = tonumber(date("%y%m%d%H%M"));
--		BT_SetData(PL_LEAVETIME, nLeaveTime);
--	end

	sf_onplayerleave()
--	SyncTaskValue(700 + PL_BATTLEPOINT);--同步玩家的总战功给客户端，用于战功购买功能
	if( GetMissionV( MS_STATE ) ~= 3 ) then
		BT_UpdateMemberCount();
		ResetBonus()		--计算战功系数，重置战功
	end
	
	if( GetMissionV( MS_STATE ) == 2 and wl_search_memcount() == 1 ) then
		CloseMission( MISSIONID )
	end
end;

