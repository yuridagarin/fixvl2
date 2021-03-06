--filename:timer.lua
--create date:2006-06-5
--describe:村落战计时器
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");
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
		if mod(nGlobalState,10) == 1 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--变为xx2
			AddGlobalNews("Th秓 c鑓 chi課, Ph竜 i chi課, Th玭 trang chi課 s緋 khai cu閏, nh鱪g ai  b竜 danh nhanh ch鉵g v祇 trong chu萵 b?.");
			Msg2Global("Th秓 c鑓 chi課, Ph竜 i chi課, Th玭 trang chi課 s緋 khai cu閏, nh鱪g ai  b竜 danh nhanh ch鉵g v祇 trong chu萵 b?.");
		end;
	else
--		if mod(nLoop,10) == 0 then
--			AddGlobalNews("距雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战三场战役打响还有"..(floor(nLoop/10)*5).."分钟，请各路英雄速速报名参战，御敌勤王！");
--			Msg2Global("距雁门关草谷场争夺战、雁门关炮台争夺战、雁门关村落争夺战三场战役打响还有"..(floor(nLoop/10)*5).."分钟，请各路英雄速速报名参战，御敌勤王！");
--		end;
		Msg2MSAll(MISSION_ID," c遪 "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s緋 b総 u. S? ngi T鑞g-Li猽 hi謓 l?: T鑞g ["..nPlayerSong.."]:["..nPlayerLiao.."] Li猽");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	--处理目标战斗NPC打斗超时
	process_fight_timeout(SONG_ID)
	process_fight_timeout(LIAO_ID)
	local nStepSong = GetMissionV(MV_SONG_TASKSTEP);
	local nStepLiao = GetMissionV(MV_LIAO_TASKSTEP);
	local sResult = "";
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_WINNER,ALL_ID);	--时间结束时双方都没有找到首领，会在EndMission处处理胜负关系
		if nStepSong > nStepLiao then
			sResult = "Phe T鑞g gi祅h th緉g l頸 chung cu閏 t筰 chi課 d辌h Th玭 trang";
		elseif nStepLiao > nStepSong then
			sResult = "Phe Li猽 gi祅h th緉g l頸 chung cu閏 t筰 chi課 d辌h Th玭 trang";
		else
			sResult = "T鑞g-Li猽 hai b猲 b蕋 ph﹏ th緉g b筰 t筰 chi課 d辌h Th玭 trang";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."  k誸 th骳, T鑞g-Li猽 hai b猲 v蒼 ch璦 t譵 ra th? l躰h.");
		Msg2MSAll(MISSION_ID,"Nhi謒 v? t譵 th? l躰h th? d﹏ hai b猲 l?: T鑞g ["..nStepSong.."], Li猽 ["..nStepLiao.."]."..sResult);
		Msg2MSAll(MISSION_ID,"");
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"Ti課  nhi謒 v? c馻 T鑞g-Li猽 hi謓 l?: T鑞g ["..nStepSong.."]:["..nStepLiao.."] Li猽, ti課  th阨 gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"S? ngi T鑞g-Li猽 hi謓 t筰: T鑞g ["..nPlayerSong.."]:["..nPlayerLiao.."] Li猽");
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID," c遪 "..(COMPLETE_TIME/18*nLoop).." gi﹜ r阨 kh醝 chi課 trng");
	end;
end;
--处理与目标NPC战斗超时的情况
function process_fight_timeout(nCamp)
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local sNewTargetName = "";
	local nTaskFailed = 0;
	if GetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1) == 1 then	--如果目前任务NPC为战斗状态
		local nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		local nBeginTime = GetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT1 then
				BT_ShowDebugInfor("Qu? gi? th? h薾 NPC");
				Modify_Task_Step(nCamp,-2);
				nTaskFailed = 1;
			end;
		elseif nNpcType == ANGRY_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT2 then
				BT_ShowDebugInfor("Qu? gi? ph蒼 n? NPC");
				Modify_Task_Step(nCamp,-3);
				nTaskFailed = 1;
			end;		
		else
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT3 then
				BT_ShowDebugInfor("Qu? gi? cu錸g b筼 NPC");
				Modify_Task_Step(nCamp,-5);
				nTaskFailed = 1;
			end;		
		end;
		if nTaskFailed == 1 then
			sNewTargetName = Go_To_Next_Step(nCamp);
			if sNewTargetName == "" then	--nCamp方人数为0
				return 0;
			end;
			BT_OperateAllPlayer(tell_fail,{sNewTargetName,nCamp},nCamp);
		end
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "Цng ti誧! Nhi謒 v?  th蕋 b筰. Nh璶g ta v鮝 nh薾 頲 tin t鴆: Th? d﹏ <color=yellow>"..sName.."<color> c? th? bi誸 v? tr? c馻 th? l躰h, m阨 <color=yellow>"..GetMissionS(MSTR_SONG_ONE+nCamp-1)..","..GetMissionS(MSTR_SONG_TWO+nCamp-1)..","..GetMissionS(MSTR_SONG_THREE+nCamp-1).."<color> mau n  t譵 B竎h S? Th玭g c? li猲 quan  t譵 ra t玭g t輈h <color=yellow>"..sName.."<color>.";
	Say(sContent,0);
end;

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].." k誸 th骳, s? n? l鵦 c馻 c竎 v? s? 頲 ban thng x鴑g ng.",0);
	SetFightState(0);
	--store_battle_infor();
end;

function store_battle_infor()
	local nSongStep = GetMissionV(MV_SONG_TASKSTEP);
	local nLiaoStep = GetMissionV(MV_LIAO_TASKSTEP);
	local tPointRank = BT_SortMSPlayerByTaskValue(PT_BATTLEPOINT,0)
	local tRankTable = {
					[1] = "",
					[2] = "",
					[3] = "",
					[4] = "",
					[5] = "",
					}
	for i=1,5 do
		if tPointRank[i] == nil then
			break;
		else
			tRankTable[i] = tPointRank[i];
		end;
	end;
	CustomDataSave(CD_BTS_VILLAGE,"ddsssss",nSongStep,nLiaoStep,tRankTable[1],tRankTable[2],tRankTable[3],tRankTable[4],tRankTable[5]);
end;