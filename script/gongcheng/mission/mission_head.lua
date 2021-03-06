Include("\\script\\gongcheng\\gongcheng_function.lua");
Include("\\script\\lib\\writelog.lua");

--Mission函数==============================================================================
--初始化Mission
function MS_InitMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--设置Mission的状态为准备状态
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--设置计时器总计时次数
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个计时器
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local szCityName,nCityMapID,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	local szGongName,szShouName = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	SetMissionS(MS_GONG_TONG_NAME,szGongName);
	SetMissionS(MS_SHOU_TONG_NAME,szShouName);
	SetMissionS(MS_CITY_NAME,szCityName);
	local nMSUID = MS_CreateMSUID(nCityIdx);	--创建一个Mission唯一ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	GCZ_InitGraveyard();
	GCZ_CreateTrap(nBattleMapID);
	GCZ_InitTrap();	--三个城门双方均可通过直到某一方派人驻守后
	GCZ_CreateNpc(nBattleMapID);
	WriteLog("[C玭g th祅h chi課] C玭g th祅h : 1 tr薾 Mission  b総 u, MSUID l?: "..nMSUID..". Phe c玭g: "..szGongName.."; Phe th?: "..szShouName);
end;
--Mission开始
function MS_StartMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_GONGMEN);	--设置Mission的状态为开始状态
	SetMissionV(MV_TIMER_LOOP,GONGMEN_TIMER_COUNT);	--设置开始状态的持续时间
	StopMissionTimer(MISSION_ID,TIMER_ID);	--结束前一个计时器
	StartMissionTimer(MISSION_ID,TIMER_ID,GONGMEN_TIMER_INTERVAL*FRAME_PER_MIN);	--开始一个新的计时器
	mf_Talk2Camp(MISSION_ID,ALL_ID,"Чi qu﹏  n, tr鑞g tr薾  vang...C玭g th祅h chi課 b総 u!!!!!");
	Msg2MSAll(MISSION_ID,"Чi qu﹏  n, tr鑞g tr薾  vang...C玭g th祅h chi課 b総 u!!!!!");
	GCZ_PlaySound(ALL_ID,"战斗开始.wav");
	SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_WEIJI);	--设置最初的背景音乐
	SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_YOUSHI);
	GCZ_PlayBackGroundMusic(ALL_ID);
	SetMissionV(MV_DESTROY_EAST_DOOR,0);	--这三条指令方便测试时使用RunMission
	SetMissionV(MV_DESTROY_SOUTH_DOOR,0);
	SetMissionV(MV_DESTROY_WEST_DOOR,0);
end;
--Mission结束
function MS_EndMission()
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL)
	local nMSUID = GetMissionV(MV_MISSION_UID);
	--	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	mf_DelAllMSPlayer(MISSION_ID,ALL_ID);	--从Mission里面删除所有的玩家
	mf_ClearMissionData();
	ClearMapNpc(nBattleMapID);
	ClearMapTrap(nBattleMapID);
	WriteLog("[C玭g th祅h C玭g th祅h chi課]:1 tr薾 Mission  k誸 th骳, MSUID l?: "..nMSUID);
end;
--离开Mission
function MS_LeaveMission()
	local nGuardID = GetTaskTemp(TEMP_GURAD_ID);
	local nCamp = GCZ_GetPlayerCamp();
	local nOldPlayerIdx = PlayerIndex;
	if nGuardID ~= 0 then	--如果是守卫离开
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nCamp-1,0);	--相应的记录守卫索引的MissionV清0
		if nCamp == GONG_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,SHOU_ID);
		elseif nCamp == SHOU_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,ALL_ID);
		end;
	end;
	local bFighting = GetTaskTemp(TEMP_ARENA_FIGHTING);
	if bFighting ~= 0 then	--如果正在单挑
		local nEnemyCamp = GCZ_GetEnemyCamp();
		local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,0);	--获取单挑对手的索引
		if nEnemyIdx > 0 then
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,nEnemyIdx);	--设置新的守卫
		end;
		PlayerIndex = nEnemyIdx;
		SetMissionV(MV_EAST_DOOR_DRAW+nGuardID-1,0);
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetFightState(0);
		Restore();
		RestoreNeili();
		SetPos(tEntrancePos[nEnemyCamp][1],tEntrancePos[nEnemyCamp][2]);
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		Say("цi th? r阨 m筺g, b筺 gi祅h 頲 th緉g l頸 khi猽 chi課 n u",0);
		Msg2Player("T? chi課 trng n u quay v? h藆 doanh!");
		PlaySound("\\sound\\单挑胜利.wav");
		SetTaskTemp(TEMP_CHALLENGER,0);	--赢了的就不是挑战者了
		Msg2MSAll(MISSION_ID,GetName(nEnemyIdx).."("..tCampNameZ[nEnemyCamp]..") khi猽 chi課 n u  th緉g "..GetName(nOldPlayerIdx).."("..tCampNameZ[nCamp].."), tr? th祅h t﹏ Th? v? c馻 "..tDoorName[nGuardID]..".");
		PlayerIndex = nOldPlayerIdx;
	end;
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_RestorePlayerState();	--这个要在NewWorld之前，不然切换不了PK状态
	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."-"..GetName().."  r阨 kh醝 chi課 trng");
end;
--加入Mission
function MS_JoinMission(nCamp)
	SetTaskTemp(TEMP_CAMP,nCamp);
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local _,_,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	SetTaskTemp(TEMP_CITY_INDEX,nCityIdx);
	NewWorld(nBattleMapID,tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);
	if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
		AddMSPlayer(MISSION_ID,nCamp+2);
		SetTaskTemp(TEMP_REINFORCEMENT,nCamp);
	else
		AddMSPlayer(MISSION_ID,nCamp);
	end;
	Msg2MSAll(MISSION_ID,"Чi hi謕"..GetName().."  gia nh藀 "..tCampNameZ[nCamp]);
	MS_SetPlayerState();
	if nCamp == GONG_ID then
		Say("Phe c玭g: ph? h駓 v? chi誱 l躰h <color=yellow>8<color>k? phn ho芻 khi C玭g th祅h chi課 k誸 th骳 ph? h駓 v? chi誱 l躰h <color=yellow>6<color>k? phn l? gi祅h th緉g l頸. C? quan th祅h m玭 ch璦 b? ph? h駓 ho芻 trc khi chi誱 l躰h kh玭g th? ti課 v祇 th祅h.",0);
	elseif nCamp == SHOU_ID then
		Say("phe th?: C玭g th祅h chi課 k誸 th骳, n誹 b秓 v? 頲 <color=yellow>5<color>k? phn t鴆 gi祅h chi課 th緉g. Ch? ?: N誹 phe c玭g ph? h駓 v? chi誱 l躰h 頲 <color=yellow>8<color> k? phn th? C玭g th祅h chi課 l藀 t鴆 k誸 th骳, th? th祅h th蕋 b筰. Phe ta khi tr蕁 th? th祅h, ch phng s? kh玭g th? v祇 頲 th祅h.",0);
	end;
end;
--处理准备阶段的计时器函数
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,GetMissionS(MS_CITY_NAME).." chi課 s? c遪 "..(nLoop*READY_TIMER_INTERVAL).." ph髏 n鱝 s? b総 u ");
	end;
end;
--攻门阶段计时器
function MS_ProcessGongMenTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		GCZ_ComeToGongmeng();
		for i=1,getn(tChengMenJiGuanPos) do
			local nJiGuanIdx = GetMissionV(MV_EAST_JIGUAN_INDEX+i-1);
			if nJiGuanIdx ~= 0 then
				--SetNpcLifeTime(nJiGuanIdx,0);	--让没消失的城门机关消失
				AddUnitStates(nJiGuanIdx,1,-100000000);	--将城门机关的生命设为0
				SetMissionV(MV_DESTROY_EAST_DOOR+i-1,1);	--城门为永久打开状态
				SetMissionV(MV_EAST_JIGUAN_INDEX+i-1,0);
			end;
		end;
		GCZ_Msg2Camp("C玭g th祅h i ph竜 頲 khai h醓, th祅h m玭 b? ph? h駓 ho祅 to祅",ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C竎h th阨 gian C玭g th祅h i ph竜 c遪 "..(nLoop*GONGMEN_TIMER_INTERVAL).." ph髏 ");
	end;
end;
--攻城阶段计时器
function MS_ProcessGongChengTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		local nCurFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		local szResult = "";
		local nBattleMapID = SubWorldIdx2ID(SubWorld);
		local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
		if nCurFlagCount >= FLAG_COUNT_END_WIN then	--攻城方赢了
			SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
			szResult = "C玭g th祅h chi課  k誸 th骳, cu鑙 c飊g bang h閕 <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color> chi誱 l躰h th祅h c玭g (do bang h閕 <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> th? v?) <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(GONG_ID,"攻城战胜利.wav");
			GCZ_PlaySound(SHOU_ID,"攻城战失败.wav");
			SetMissionV(MV_WAR_RESULT,GONG_ID);	--设置结果
		else	--守城方赢了
			SetCityWarWinner(nCityMapID,GetMissionS(MS_SHOU_TONG_NAME));
			szResult = "C玭g th祅h chi課  k誸 th骳, cu鑙 c飊g bang h閕 <color=yellow>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> tr蕁 竝 th祅h c玭g bang h閕 <color=red>"..GetMissionS(MS_GONG_TONG_NAME).."<color>, gi? v鱪g 頲 <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(SHOU_ID,"攻城战胜利.wav");
			GCZ_PlaySound(GONG_ID,"攻城战失败.wav");
			SetMissionV(MV_WAR_RESULT,SHOU_ID);	--设置结果
		end;
		local lfFunc = function(tArg)
			Say(%szResult,0);
			SetFightState(0);
			if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
				SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			else
				SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			end;
		end;
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
		AddGlobalCountNews(szResult,1);
		Msg2Global(sf_RemoveTag(szResult,"<",">"));
		PlayMusic("\\music\\themusicisnotexist.mp3",1);
		Msg2MSAll(MISSION_ID,"C玭g th祅h chi課  k誸 th骳, m鋓 ngi r阨 kh醝 chi課 trng th玦");
		WriteLog("[c玭g th祅h C玭g th祅h chi課]:"..sf_RemoveTag(szResult,"<",">").."MSUID l? "..GetMissionV(MV_MISSION_UID));
		WriteLogEx("Cong Thanh Chien",szResult)
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Th阨 gian c玭g th祅h c遪 "..(nLoop*GONGMEN_TIMER_INTERVAL).." ph髏 ");
	end;
end;
--处理等待结束的计时器函数
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then		
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C玭g th祅h chi課 trng s緋 k誸 th骳, ch? c遪"..(nLoop*ENDING_TIMER_INTERVAL).." ph髏 ");
	end;
end;
--登陆触发器函数
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[c玭g th祅h C玭g th祅h chi課]: Hi謕 kh竎h  "..GetName().." R阨 Mission kh玭g b譶h thng, 產ng trong qu? tr譶h x? l? ng nh藀.");
end;
--=====================================================================================
--创建一个MSUID（当前Mission唯一标识）
function MS_CreateMSUID(nCityIdx)
	local nMSUID = tonumber(date("%y%m%d"))*10+nCityIdx+random(1,1000);	--后面的加数是用来方便测试的
	return nMSUID;
end;
--进入场地时统一进行的操作
function MS_SetPlayerState()
	SetTask(TNC_MUID,GetMissionV(MV_MISSION_UID));
	local nCamp = GCZ_GetPlayerCamp();
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	SetTask(TNC_CAMP,nCamp);
	SetCampToPlayer(tCampNameP[nCamp]);
	EnterChannel(tCityChannel[nCity][1]);
	EnterChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	LeaveTeam();
	SetLogoutRV(1);	--设置登陆点为城市重生点
	SetDeathPunish(0);	--无死亡惩罚
	InteractiveEnable(0);	--关闭交互	必须在NewWorld之后执行才有效
	StallEnable(0);	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(0);	--禁止使用回城符
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--禁止改变PK状态
	SetFightState(0);
	KillFollower();	--删除跟班
	ClearStolenSkill();	--清除已偷取的技能，针对棍子
	SetDeathScript("\\script\\gongcheng\\player_death.lua");
	local nCurMapID = tCityInfo[nCity][3];
	SetTempRevPos(nCurMapID,tEntrancePos[nCamp][1]*32,tEntrancePos[nCamp][2]*32);	--设置重生点
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	PlayMusic("\\music\\"..tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG+nCamp-1)],1);	--播放背景音乐
end;
--离开场地时统一进行的操作
function MS_RestorePlayerState()
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	local nCamp = GCZ_GetPlayerCamp();
	SetLogoutRV(0)
	SetDeathPunish(1);
	InteractiveEnable(1)
	StallEnable(1)
	UseScrollEnable(1);
	ForbidChangePK(0);
	SetPKFlag(0,0);
	LeaveTeam();
	SetFightState(0)
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	SetCampToPlayer("");
	--下面三条指令主要是针对单挑的玩家
	DesaltPlayer(0);
	UseSkillEnable(1);--  (1可以使用武功，0禁止使用武功)
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_ClearTempTaskValue();
	if nCity > 0 then	--如果是OnLogin触发的，nCity就是0,于是不用处理了
		LeaveChannel(tCityChannel[nCity][1]);
		LeaveChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	end;
end;
--清除所有的战场临时变量
function MS_ClearTempTaskValue()
	for i=TEMP_BEGIN,TEMP_END do
		SetTaskTemp(i,0);
	end;
end;