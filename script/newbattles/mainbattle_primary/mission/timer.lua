--filename:timer.lua
--create date:2006-06-22
--describe:主战场中主计时器脚本
Include("\\script\\newbattles\\mainbattle_primary\\mainbattle_head.lua");
function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		if mod(nGlobalState,10) == 3 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--变为xx4
			AddGlobalNews("Chi課 trng Ng鋍 M玭 quan  khai chi課. Xin m阨 ch? v? anh h飊g  b竜 danh nhanh ch鉵g v祇 trong chu萵 b?");
			Msg2Global("Chi課 trng Ng鋍 M玭 quan  khai chi課. Xin m阨 ch? v? anh h飊g  b竜 danh nhanh ch鉵g v祇 trong chu萵 b?");
		end;
	else
		if mod(nLoop,10) == 0 then
			AddGlobalNews("Th阨 gian Chi課 trng Ng鋍 M玭 quan khai chi課 c遪 "..(floor(nLoop/10)*5).." ph髏, m阨 c竎 v? anh h飊g nhanh ch鉵g b竜 danh tham gia!");
			Msg2Global("Th阨 gian Chi課 trng Ng鋍 M玭 quan khai chi課 c遪 "..(floor(nLoop/10)*5).." ph髏, m阨 c竎 v? anh h飊g nhanh ch鉵g b竜 danh tham gia!");
		end;
		Msg2MSAll(MISSION_ID," c遪 "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s緋 b総 u. S? ngi T鑞g-Li猽 hi謓 l?: T鑞g ["..nPlayerSong.."]:["..nPlayerLiao.."] Li猽");
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."  k誸 th骳.");
		if nPubPointSong > nPubPointLiao then
			SetMissionV(MV_WINNER,SONG_ID);
		elseif nPubPointSong < nPubPointLiao then
			SetMissionV(MV_WINNER,LIAO_ID);
		else
			SetMissionV(MV_WINNER,ALL_ID);
		end;
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		local nVillageResult = GetGlbValue(GLB_VILLAGE);
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"Ti課  th阨 gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"S? ngi T鑞g-Li猽 hi謓 t筰: T鑞g ["..nPlayerSong.."]:["..nPlayerLiao.."] Li猽");
		end;
		if mod(nLoop,9) == 0 then	--三分钟刷一次宝箱
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
			Msg2MSAll(MISSION_ID,"觤 t輈h l騳 c玭g c閚g T鑞g-Li猽 hi謓 l?: T鑞g ["..nPubPointSong.."]:["..nPubPointLiao.."] Li猽");
		end;
		if mod(nLoop,30) == 0 then	--十分钟刷一次奇人异士和土民首领
			Create_Nonaligned_Hero();
			Create_VillagerHeader(nVillageResult);
			BT_ShowBattleRank(10);	--显示个人积分排行榜前10名
		end;
		if mod(nLoop,9) == 0 then
			BT_ShowDebugInfor("L藀 th? d﹏, s? ngi:"..GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Random_Pos_Villager(nVillageResult,GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT),SONG_ID);
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_LIAO_SOLDIER_COUNT),LIAO_ID);
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID," c遪 "..(COMPLETE_TIME/18*nLoop).." gi﹜ r阨 kh醝 chi課 trng");
	end;
end;

function tell_end(tArg)
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == SONG_ID then
		szResult = "Phe T鑞g th緉g l頸";
	elseif nWhoWin == LIAO_ID then
		szResult = "Phe Li猽 th緉g l頸 ";
	else
		szResult = "hai phe h遖 nhau";
	end;
	SetFightState(0);
	RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));	--删除单挑时间触发器
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--清除单挑信息
	BT_SetTempData(PTT_ROOMINDEX,0);
	Say(tBattleName[BATTLE_TYPE].."  k誸 th骳, b筺 gi誸 頲 <color=yellow>"..BT_GetData(PTNC_KILL).."<color> ngi, t? tr薾 <color=yellow>"..BT_GetData(PTNC_DEATH).."<color> l莕. <color=yellow>觤 t輈h l騳 phe T鑞g: "..nPubPointSong..", t輈h l騳 c玭g c閚g phe Li猽:"..nPubPointLiao..", cu鑙 c飊g "..szResult.."<color>. C竎 v?  r蕋 n? l鵦, chu萵 b? n nh薾 ban thng c馻 ho祅g thng.",0);
end;