--奥运七夕点灯Mission
--by vivi
--2008/07/18
Include("\\script\\online\\qixi08\\light\\light_head.lua")

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_READY);
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(AOYUN_LIGHT_MISSION_UID,nMSUID);
	aoyun_light_InitFieldNpc(1);
	WriteLog("[Th? v薾 h閕 th緋 n]: Mission khu 1 b総 u, MSUID l?: "..nMSUID);
end;
--Mission开始
function MS_StartMission()
	local nGuanType = GetMissionV(AOYUN_LIGHT_GUAN_TYPE);
	if nGuanType == 3 or nGuanType == 5 then
		aoyun_light_InitFieldNpc(nGuanType);
	end
	Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"H閕 th緋 n 秈 "..nGuanType.." ch輓h th鴆 b総 u, h穣 ch? ? th鴆 t? n c莕 th緋.");
	local nBackStr = "";
	if nGuanType == 1 then
		nBackStr = aoyun_light_random(1,8,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);
	elseif nGuanType == 2 then
		nBackStr = aoyun_light_random(1,8,1);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 3 then
		nBackStr = aoyun_light_random(1,12,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 4 then
		nBackStr = aoyun_light_random(1,12,1);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 5 then
		nBackStr = aoyun_light_random(1,16,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	end	
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_DIANDENG);
end;
--Mission结束
function MS_EndMission()
	local nMSUID = GetMissionV(AOYUN_LIGHT_MISSION_UID);
	mf_DelAllMSPlayer(AOYUN_LIGHT_MISSION_ID,0);	--从Mission里面删除所有的玩家
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_IDEL);
	mf_ClearMissionData();
	WriteLog("[Th? v薾 h閕 th緋 n]: Mission khu 1 k誸 th骳, MSUID l?: "..nMSUID);
end;
--离开Mission
function MS_LeaveMission()
	MS_RestorePlayerState();
	for i=1,getn(tMapId[2]) do
		if SubWorldID2Idx(tMapId[2][i][1]) ~= -1 then
			NewWorld(tMapId[2][i][1],tMapId[2][i][2],tMapId[2][i][3]);
			break
		end
	end
end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState();
	AddMSPlayer(AOYUN_LIGHT_MISSION_ID,nCamp);
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(AOYUN_LIGHT_MISSION_ID);
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Th阨 gian th緋 n c遪 "..tf_GetTimeString(nLoop*AOYUN_LIGHT_READY_TIMER_INTERVAL));
	end;
end;

--处理系统点灯计时器函数
function MS_ProcessDiandengTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_STARTED);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"B総 u th緋 n, xin th緋 theo th? t? m? h? th鑞g  th緋.");
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
		local nLetter = strsub(GetMissionS(AOYUN_LIGHT_DENG_SEQ),strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ))+1-nLoop,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ))+1-nLoop);
		local nIdx = 0;
		for i=1,getn(tLetter) do
			if nLetter == tLetter[i] then
				nIdx = i;
				break;
			end
		end
		if nIdx ~= 0 then
			SetCurrentNpcSFX(GetMissionV(nIdx+10),909,2,0);
		end
	end
end

--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_ENDING);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Th緋 n th蕋 b筰, b筺 kh玭g th緋 trong th阨 gian quy nh. чi ng? chuy觧 ra ngo礽 秈 sau 20 gi﹜.");
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"K誸 th骳 th緋 n c遪 "..tf_GetTimeString(nLoop*AOYUN_LIGHT_STARTED_TIMER_INTERVAL));
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_CloseField();
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"H玭 l? s緋 k誸 th骳, ch? c遪"..tf_GetTimeString(nLoop*AOYUN_LIGHT_ENDING_TIMER_INTERVAL));
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[Th? v薾 h閕 th緋 n]: Ngi ch琲  "..GetName().." R阨 Mission kh玭g b譶h thng, 產ng trong qu? tr譶h x? l? ng nh藀.");
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()
	local nMapID = gf_GetCurMapID();
	CreateTrigger(3,AOYUN_LIGHT_LOG_ID,AOYUN_LIGHT_LOG_CUSTOM_ID);
	SetFightState(1);	--战斗状态
	SetPKFlag(1,1);	--PK状态
	ForbidChangePK(1);	--禁止转换PK状态
	UseScrollEnable(0);	--禁止使用回城符
	ForbitTrade(1);	--禁止交易
	StallEnable(0);	--禁止摆摊
	SetDeathPunish(0);	--无死亡惩罚
	InteractiveEnable(0);	--禁止互动
	NewWorld(nMapID,tMapId[1][2],tMapId[1][3]);	
end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()
	RemoveTrigger(GetTrigger(AOYUN_LIGHT_LOG_CUSTOM_ID));
	SetFightState(0);	--和平状态
	ForbidChangePK(0);	--可以转换PK状态
	SetPKFlag(0,0);	--无PK状态
	UseScrollEnable(1);	--允许使用回城符
	ForbitTrade(0);	--允许交易
	StallEnable(1);	--允许摆摊
	SetDeathPunish(1);	--有死亡惩罚
	InteractiveEnable(1);	--允许互动
end;



