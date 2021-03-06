Include("\\script\\lib\\missionfunctions.lua");
MISSION_ID = 46;									--Mission的ID
TIMER_ID = 75;										--计时器的ID
LOG_ID = 3001;										--登陆触发器ID
LOG_CUSTOM_ID = 2501;								--登陆触发器自定义编号
HUASHAN_MAP_ID = 969								--华山地图的ID
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，只能填非0正整数==================================================
READY_TIME = 30;									--准备时间，30分钟
STARTED_TIME = 60;									--进行时间时间，60分钟
ENDING_TIME = 0.5;									--等待结束时间，0.5分钟
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 2;							--计时器触发的时间间隔，单位分钟
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 2;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 0.5;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================

--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
MV_TEAM_NUM = 4;									--记录进入Mission的队伍总数
MV_BOX_NPC_INDEX = 5;								--记录华山宝箱的索引
MV_HUASHAN_NPC_INDEX = 6;							--记录华山npc的索引
MV_OPENBOX_FLAG = 7;								--记录华山宝箱已被夺取
--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开战阶段
MS_STATE_ENDING = 3;								--等待结束阶段
--=========================================================================================

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	mf_ClearMissionData();

	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器
	local nMSUID = MS_CreateMSUID();	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
end;
--Mission开始
function MS_StartMission()
--	SetNpcLifeTime(GetMissionV(MV_HUASHAN_NPC_INDEX),0)--删去退出Npc
	Msg2MSAll(MISSION_ID,"Ho箃 ng bang h閕 tinh anh  b総 u, c竎 v? bang ph竔 ? th? 甶 畂箃 b秓 rng.");
	mf_Talk2Camp(MISSION_ID,0,"Ho箃 ng bang h閕 tinh anh  b総 u, c竎 v? bang ph竔 ? th? 甶 畂箃 b秓 rng.");

	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--设置Mission的状态为开始状态
	SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--设置开始状态的持续时间
	StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
	StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	MS_SetPlayerState(2);
end;
--Mission结束
function MS_EndMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	local nMSUID = GetMissionV(MV_MISSION_UID);
--	mf_DelAllMSPlayer(MISSION_ID,0);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	SetGlbValue(1001,0)
end;
--离开Mission
function MS_LeaveMission()
	local i = 0;
	local nOldPlayer = 0;
	local nDeaNum = 0;
	local nCamptainState = 0;
	local TeamMemberTab = {};
	
	if GetMissionV(MV_MISSION_STATE) < 3 and GetMissionV(MV_MISSION_STATE) > 0 then
		nDeaNum = 0;
		nCamptainState = 0;
		if PlayerIndex == GetTeamMember(0) then
			nOldPlayer = PlayerIndex;
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 then
					if IsPlayerDeath() ~= 0 then
						nDeaNum = nDeaNum + 1;
					end
					tinsert(TeamMemberTab,GetTeamMember(i))
				end
			end
			
			if nDeaNum == GetTeamSize() then
				nCamptainState = 1;
			end

			for i=1,getn(TeamMemberTab) do
				PlayerIndex = TeamMemberTab[i];
				if PlayerIndex > 0 then
					if PlayerIndex ~= nOldPlayer then						
						if nCamptainState ~= 1 then
							Msg2Player("Do i trng r阨 kh醝 tr薾 a, t蕋 c? i vi猲 s? b? chuy觧 ra kh醝 u trng!");
						else
							Msg2Player("Do v? t蕋 c? m鋓 ngi trong i  ch誸 n猲 t? i c馻 b筺 s? chuy觧 ra khu v鵦.");
						end
						DelMSPlayer(MISSION_ID,0);
					end
				end
			end
			PlayerIndex = nOldPlayer;
			if nCamptainState ~= 1 then
				Msg2Player("Do i trng r阨 kh醝 tr薾 a, t蕋 c? i vi猲 s? b? chuy觧 ra kh醝 u trng!");
			else
				Msg2Player("Do v? t蕋 c? m鋓 ngi trong i  ch誸 n猲 t? i c馻 b筺 s? chuy觧 ra khu v鵦.");
			end
		end
	end
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end

	MS_SetPlayerState(3);
	NewWorld(100,1420,2989);

end;
--加入Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState(1);
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("C遪 %d ph髏 n鱝 ch輓h th鴆 b総 u ho箃 ng bang h閕 tinh anh ", (nLoop*READY_TIMER_INTERVAL)));
	end;
end;
--处理Mission开始后的计时器函数
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		
--		SetNpcLifeTime(GetMissionV(MV_BOX_NPC_INDEX),0)--删去华山宝箱
		Msg2MSAll(MISSION_ID,"Ho箃 ng bang h閕 tinh anh  k誸 th骳 ");
		mf_Talk2Camp(MISSION_ID,0,"Ho箃 ng bang h閕 tinh anh  k誸 th骳 ");
	else
		if GetMissionV(MV_OPENBOX_FLAG) == 1 then		--夺取宝箱后延时退出
			CloseMission(MISSION_ID);
		end
		
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("C遪 %d ph髏 n鱝 k誸 th骳 ho箃 ng bang h閕 tinh anh ", (nLoop*STARTED_TIMER_INTERVAL)));
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_SetPlayerState(3);
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;

--设置玩家不同条件下的状态
function MS_SetPlayerState(nMissionState)
	if nMissionState == 1 then					--准备阶段角色状态处理
		CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
		SetLogoutRV(1);							--设置登陆点为城市重生点
		SetDeathPunish(0);						--无死亡惩罚
		SetCreateTeam(1);						--关闭组队功能
		ForbitTrade(1);							--禁止交易
		SetFightState(1);						--战斗状态
  		InteractiveEnable(0);					--交互开关，0关闭，1打开
  		CleanInteractive();						--解散牵手状态
  		StallEnable(0); 						--摆摊开关		  
		UseScrollEnable(0);						--回程符开关			
		SetPKFlag(2,0);							--屠杀模式
		ForbidChangePK(1);						--禁止转换PK状态
--		SetTempRevPos(100,1420,2989);			--死亡重生点
		SetDeathScript("");

	elseif nMissionState == 2 then				--战斗阶段角色状态处理
		SetFightState(1);

	elseif nMissionState == 3 then				--比赛结束阶段角色状态处理
		RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
		SetLogoutRV(0);
		SetFightState(0);
		SetDeathPunish(1);
		ForbidChangePK(0);
		ForbitTrade(0);
		SetCreateTeam(0);
		SetPKFlag(0,0)							--关闭PK开关
  		InteractiveEnable(1);
  		StallEnable(1);
  		UseScrollEnable(1);
  		UseSkillEnable(1);
--		SetTempRevPos(0,0,0);					--删除临时重生点
		RemvoeTempEffect();
  		SetDeathScript("");
	end
end

