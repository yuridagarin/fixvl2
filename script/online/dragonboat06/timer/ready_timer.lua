--File name:ready_timer.lua
--Describe:报名阶段计时器脚本
--		　 报名截止后执行这个脚本
--Create Date:2006-4-19
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	local timeleft = GetMissionV(MV_TIMELEFT);
	if timeleft == 0 then
		if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) < LEASTPLAYER then
			Msg2MSAll(MISSION_ID,"Do s? ngi tham gia di"..LEASTPLAYER.." ngi, cu閏 畊a kh玭g th? ti課 h祅h!");
			CloseMission(MISSION_ID);
			return 0;
		end;
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSTART);
		SetMissionV(MV_TIMELEFT,WAITSTART_TIMER_LOOP);	--初始化报时次数
		Msg2MSAll(MISSION_ID,"Th阨 gian b竜 danh  k誸 th骳, m阨 c竎 tuy觧 th? chu萵 b? l猲 thuy襫, sau 30 gi﹜ cu閏 畊a s? ch輓h th鴆 b総 u.");
	else
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,READY_TIMER_ID,READY_TIME);
		SetMissionV(MV_TIMELEFT,timeleft-1);
		timeleft = timeleft*READY_TIME/18;
		Msg2MSAll(MISSION_ID,"Tr薾 u s? sau"..timeleft.." gi﹜ k誸 th骳 b竜 danh");		
	end;
end;