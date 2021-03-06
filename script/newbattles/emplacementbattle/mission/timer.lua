--filename:timer.lua
--create date:2006-06-19
--describe:炮台争夺战场中主计时器脚本
Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");
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
		if mod(nLoop,10) == 0 then
			AddGlobalNews("Gi? khai chi課 ba n琲: Thu Th藀 Lng Th秓, B秓 V? Th祅h Tr?, Gi秈 C鴘 N玭g Trang ch? c遪"..(floor(nLoop/10)*5).." ph髏, m阨 c竎 v? anh h飊g nhanh ch鉵g b竜 danh tham gia!");
			Msg2Global("Gi? khai chi課 ba n琲: Thu Th藀 Lng Th秓, B秓 V? Th祅h Tr?, Gi秈 C鴘 N玭g Trang ch? c遪"..(floor(nLoop/10)*5).." ph髏, m阨 c竎 v? anh h飊g nhanh ch鉵g b竜 danh tham gia!");
		end;
		Msg2MSAll(MISSION_ID," c遪 "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s緋 b総 u. S? ngi T鑞g-Li猽 hi謓 l?: T鑞g ["..nPlayerSong.."]:["..nPlayerLiao.."] Li猽");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nOccupyTime = 0;
	if nLoop == 0 then
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--如果目前还占领着炮台
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			SetMissionV(MV_OCCUPY_TIME_SONG,GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_SONG,0);		
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			SetMissionV(MV_OCCUPY_TIME_LIAO,GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_LIAO,0);			
		end;
		local nTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		local sResult = "";
		if nTimeSong > nTimeLiao then
			SetMissionV(MV_WINNER,SONG_ID);--宋赢
		elseif nTimeSong == nTimeLiao then
			SetMissionV(MV_WINNER,ALL_ID);--打平
		else
			SetMissionV(MV_WINNER,LIAO_ID);--辽赢
		end;
		if nTimeSong > nTimeLiao then
			sResult = "B秓 V? Th祅h Tr? k誸 th骳, phe T鑞g gi祅h th緉g l頸 chung cu閏!";
		elseif nTimeLiao > nTimeSong then
			sResult = "B秓 V? Th祅h Tr? k誸 th骳, phe Li猽 gi祅h th緉g l頸 chung cu閏!";
		else
			sResult = "B秓 V? Th祅h Tr? k誸 th骳, hai b猲 h遖 nhau!";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].."  k誸 th骳.");
		Msg2MSAll(MISSION_ID,"Th阨 gian chi誱 l躰h ph竜 i gi鱝 T鑞g-Li猽 l?: T鑞g ["..nTimeSong.." gi﹜], Li猽 ["..nTimeLiao.." gi﹜]."..sResult);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		local nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--如果目前还占领着炮台
			nOccupyTimeSong = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTimeSong;
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTimeLiao = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTimeLiao;	
		end;
		Msg2MSAll(MISSION_ID,"Ti課  th阨 gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		local nScaleSong = floor(100*(nOccupyTimeSong/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		local nScaleLiao = floor(100*(nOccupyTimeLiao/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		Msg2MSAll(MISSION_ID,"Th阨 gian chi誱 l躰h ph竜 i hi謓 t筰 gi鱝 T鑞g-Li猽 l?: T鑞g ["..nScaleSong.."]:["..nScaleLiao.."] Li猽");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--一分钟报一次双方人数
			Msg2MSAll(MISSION_ID,"S? ngi T鑞g-Li猽 trong chi課 trng hi謓 l?: T鑞g ["..nPlayerSong.."]:["..nPlayerLiao.."] Li猽");
		end;
		if mod(nLoop,5*3) == 0 then	--五分钟刷一次NPC
			Create_Npc("Th? d﹏",GetMissionV(MV_KILL_NATIVE_COUNT));
			SetMissionV(MV_KILL_NATIVE_COUNT,0);
			Create_Npc("V? binh Ph竜 i",GetMissionV(MV_KILL_GUARD_COUNT));
			SetMissionV(MV_KILL_GUARD_COUNT,0);		
		end;
		if mod(nLoop,4) == 0 then
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
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