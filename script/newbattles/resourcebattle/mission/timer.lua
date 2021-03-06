--filename:timer.lua
--create date:2006-06-16
--describe:粮草争夺战场中主计时器脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
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
			AddGlobalNews("Thu Th藀 Lng Th秓, B秓 V? Th祅h Tr?, Gi秈 C鴘 N玭g Trang s緋 khai cu閏, nh鱪g ai  b竜 danh nhanh ch鉵g v祇 trong chu萵 b?.");
			Msg2Global("Thu Th藀 Lng Th秓, B秓 V? Th祅h Tr?, Gi秈 C鴘 N玭g Trang s緋 khai cu閏, nh鱪g ai  b竜 danh nhanh ch鉵g v祇 trong chu萵 b?.");
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
	local nResSong = Get_ResCount(SONG_ID);
	local nResLiao = Get_ResCount(LIAO_ID);
	local sResult = "";
	if nLoop == 0 then	
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."  k誸 th骳.");
		if nResSong > nResLiao then
			sResult = "Phe T鑞g gi祅h th緉g l頸 chung cu閏 t筰 chi課 d辌h Thu Th藀 Lng Th秓"
		elseif nResLiao > nResSong then
			sResult = "Phe Li猽 gi祅h th緉g l頸 chung cu閏 t筰 chi課 d辌h Thu Th藀 Lng Th秓"
		else
			sResult = "T鑞g-Li猽 i b猲 b蕋 ph﹏ th緉g b筰 t筰 chi課 d辌h Thu Th藀 Lng Th秓"
		end;
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,"Lng th秓 hai b猲 n閜 cu鑙 c飊g l?: T鑞g ["..nResSong.."], Li猽 ["..nResLiao.."]."..sResult);
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"Lng th秓 T鑞g-Li猽 hi謓 c?"..nResSong..":"..nResLiao..", ti課  th阨 gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			Reflash_Res();	--40秒刷新一次粮草点
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--每一分钟公布一下当前双方人数
			Msg2MSAll(MISSION_ID,"S? ngi T鑞g-Li猽 hi謓 t筰: T鑞g ["..nPlayerSong.."]:["..nPlayerLiao.."] Li猽");
			Create_Res_Npc(ceil(GetMSPlayerCount(MISSION_ID,ALL_ID)/2));	--一分钟刷一次高级粮草堆
		end;
		if mod(nLoop,15) == 0 then	--每五分钟触发一次山贼打劫后营事件
			Create_Cateran_Even();
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

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].." k誸 th骳, s? n? l鵦 c馻 c竎 v? s? 頲 ban thng x鴑g ng.",0);
	SetFightState(0);
end;