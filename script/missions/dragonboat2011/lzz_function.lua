--海上龙舟战公共函数文件
--by liubo
Include("\\script\\missions\\dragonboat2011\\head.lua")

--返回天数
function zgc_pub_day_turn(day_num)
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400*day_num))
	return time_return
end

--获取当前已开启的地图中最适合进去的
--先看双方差距，再比较总人数，都一样就随机
--传入需要进入战场的人数，返回合适的地图id，返回0表示目前没有合适的，需要新开启
function LZZ_GetSuitMap()
	--print("LZZ_GetSuitMap() called!")
	local tbMapID = gf_GetDataTable(GetSameMaps(MAPID)) 
	local i = 1 
	while i <= getn(tbMapID) do
		if tbMapID[i] == MAPID then
			tremove(tbMapID,i) 
		--双方是否满员
		elseif mf_GetPlayerCount(MISSIONID,CampSong_ID,tbMapID[i]) + 1 > PLAYER_MAX_NUM
			and mf_GetPlayerCount(MISSIONID,CampLiao_ID,tbMapID[i]) + 1 > PLAYER_MAX_NUM then
			tremove(tbMapID, i) 
		--是否是战斗结束状态
		elseif mf_GetMissionV(MISSIONID,MV_LZZ_STATE,tbMapID[i]) == MS_STATE_COMPLETE then
			tremove(tbMapID, i) 
		--出错了4次以上不要了
		elseif mf_GetMissionV(MISSIONID,MV_LZZ_ERROR_NUM,tbMapID[i]) >= 4 then
			tremove(tbMapID, i) 
		--开战后JOIN_TIMER_ALLOW分钟的不要了
		elseif mf_GetMissionV(MISSIONID,MV_LZZ_STATE,tbMapID[i]) == MS_STATE_FIGHT then
			if mf_GetMissionV(MISSIONID,MV_TIMER_LOOP,tbMapID[i]) < JOIN_TIMER_ALLOW then
				tremove(tbMapID,i) 
			else
				i = i + 1 
			end
		else
			i = i+1 
		end
	end
	if getn(tbMapID) == 0 then
		return 0 
	end
	if getn(tbMapID) > 1 then
		local  _sort = function(nMapID1,nMapID2)
			local bFightState1 = mf_GetMissionV(MISSIONID,MV_LZZ_STATE,nMapID1) 
			local bFightState2 = mf_GetMissionV(MISSIONID,MV_LZZ_STATE,nMapID2) 
			if bFightState1 == MS_STATE_FIGHT and bFightState2 ~= MS_STATE_FIGHT then
				return 1 
			end
			if bFightState1 ~= MS_STATE_FIGHT and bFightState2 == MS_STATE_FIGHT then
				return nil 
			end
			local nTotalNumOne = mf_GetPlayerCount(MISSIONID,CampSong_ID,nMapID1)+mf_GetPlayerCount(MISSIONID,CampLiao_ID,nMapID1) 
			local nTotalNumTwo = mf_GetPlayerCount(MISSIONID,CampSong_ID,nMapID2)+mf_GetPlayerCount(MISSIONID,CampLiao_ID,nMapID2) 
			if nTotalNumOne > nTotalNumTwo then
				return 1 
			else
				return nil 
			end
		end
		sort(tbMapID,_sort) 
	end
	return tbMapID[1] or 0 
end

--获得动态加载地图ID、索引与加载次数，没有多余地图时返回0,0,0
function LZZ_FindIdleRoom()
	--print("LZZ_FindIdleRoom() called! new map")
	local nCount = 0 
	nCount = LZZ_GetDynamicMapCount() 
	if nCount >= MAX_ROOM_COUNT then
		return 0,0,0 
	end 
	local nMapID,nMapIdx = DynamicLoadMap(MAPID) 
	if nMapID == 0 and nMapIdx == 0 then
		--print(format("DynamicLoadMap(%d)",MAPID))
	end
	return nMapID,nMapIdx,nCount 
end 

--获取当前已用地图数量
function LZZ_GetDynamicMapCount()
	local tbMapID = gf_GetDataTable(GetSameMaps(MAPID)) 
	local nCount = 0 
	local nMapID = 0 
	for i = 1,getn(tbMapID) do
		if tbMapID[i] == MAPID then
			tremove(tbMapID,i) 
		end
	end
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i] 
		if mf_GetMissionV(MISSIONID,MV_LZZ_LOAD,nMapID) == 1 then
			nCount = nCount + 1 
		end 
	end 
	return nCount 
end 

--初始化时要设置的一些状态
function LZZ_InitBattle()
	--print("LZZ_InitBattle() called!")
	local nDate = tonumber(date("%m%d%H%M%S")) 
	SetMissionV(MV_LZZ_LOG_TIME,nDate) 
	WriteLog("[H秈 Chi課 Long Ch﹗ mission]:("..nDate..")  m? 1 tr薾 h秈 chi課 mission#") 
	SetMissionV(MV_TIMER_LOOP,PEACE_TIMER_LOOP) 
	--print(MISSIONID)
	--print(TIMERID)
	--print(PEACE_TIME)
	StartMissionTimer(MISSIONID,TIMERID,PEACE_TIME) 
	SetMissionV(MV_LZZ_STATE,MS_STATE_PEACE) 
	SetMissionV(MV_LZZ_GAME_LOOP,GetGameLoop()) 
	--创建NPC
	local nMapId = gf_GetCurMapID()
	local nNpcIdx = 0
	--创建宋NPC军需官
	nNpcIdx = CreateNpc("Thi猲 Vng Ph? bang","T鑞g Qu﹏ Nhu Quan",nMapId,tMsNpcPos[CampSong_ID][1],tMsNpcPos[CampSong_ID][2],6)
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\song_npc.lua")
	--创建辽NPC军需官
	nNpcIdx = CreateNpc("Nam nh﹏ phng B綾1","Li猽 Qu﹏ Nhu Quan",nMapId,tMsNpcPos[CampLiao_ID][1],tMsNpcPos[CampLiao_ID][2],6)	
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\liao_npc.lua")
	--创建宋NPC领航员
	nNpcIdx = CreateNpc("Thi猲 Vng h? ph竝","Th鑞g L躰h T鑞g Qu﹏",nMapId,tMsNpcPos[3][1],tMsNpcPos[3][2],6)
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\song_pilot_npc.lua")
	--创建辽NPC领航员
	nNpcIdx = CreateNpc("Nam nh﹏ phng B綾3","Th鑞g L躰h Li猽 Qu﹏",nMapId,tMsNpcPos[4][1],tMsNpcPos[4][2],6)
	SetNpcScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\liao_pilot_npc.lua")
	--面板显示
	LZZ_Panel_Show()
end

--正式开打时要设置的一些状态
function LZZ_RunBattle()
	--print("LZZ_RunBattle() called!")
	StartMissionTimer(MISSIONID,TIMERID,FIGHT_TIME) 
	SetMissionV(MV_TIMER_LOOP,FIGHT_TIMER_LOOP) 
	SetMissionV(MV_LZZ_STATE,MS_STATE_FIGHT) 
	SetMissionV(MV_LZZ_SONGBOAT_IDX,0)
	SetMissionV(MV_LZZ_LIAOBOAT_IDX,0)
	SetMissionV(MV_LZZ_SONGFIREBOAT_TAG1,0)
	SetMissionV(MV_LZZ_SONGFIREBOAT_TAG2,0)
	SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1,0)
	SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG2,0)
end


--结束后处理，包括变量的写入和奖励的公布
function LZZ_ProcessBattleOver()
	--print("LZZ_ProcessBattleOver() called!")
	local OldPlayerIndex = PlayerIndex
	local IDTab = LZZ_GetMSPlayerIndex(ALL_ID)
	local nPlayerCount = getn(IDTab)
	local nDate = tonumber(date("%Y%m%d"))
	for i = 1,nPlayerCount do
		PlayerIndex = IDTab[i]
		if PlayerIndex > 0 then
			local nCamp = LZZ_GetCamp()
			local sName = GetName()
			local nWhoWin = GetMissionV(MV_LZZ_WINNER_CAMP) 
			local tCampPoint = {GetMissionV(MV_LZZ_CAMPONE_POINT),GetMissionV(MV_LZZ_CAMPTWO_POINT)}
			--写入分数
			SetTask(VET_LZZ_PLAYER_POINT,tCampPoint[nCamp]) 
			if GetTask(VET_LZZ_PLAYER_DATE) < nDate then
				SetTask(VET_LZZ_PLAYER_DATE,nDate)
			end
			if GetTask(VET_LZZ_PLAYER_TAG) == 1 and GetTask(VET_LZZ_PLAYER_TAG2) == 1 then
				if tCampPoint[nCamp] > tCampPoint[3-nCamp] then
				--胜利
					SetTask(VET_LZZ_PLAYER_RESULT,1)
				elseif tCampPoint[nCamp] == tCampPoint[3-nCamp] then
				--平局
					SetTask(VET_LZZ_PLAYER_RESULT,3)
				else
				--失败
					SetTask(VET_LZZ_PLAYER_RESULT,2)
				end
				SetTask(VET_LZZ_PLAYER_TAG,0)
				SetTask(VET_LZZ_PLAYER_TAG2,0)
			end
			DelMSPlayer(MISSIONID,nCamp)
		end
	end
	PlayerIndex = OldPlayerIndex
end

--得到某Mission某阵营的所有玩家的索引，存于一个数组作函数的返回值
function LZZ_GetMSPlayerIndex(nCamp)
	local tIndex = {}
	local nTotalPlayerNum = GetMSPlayerCount(MISSIONID,nCamp)
	local msidx,sidx = 0,0
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(MISSIONID,msidx,nCamp)
			if sidx > 0 then
				tIndex[i] = sidx
			end
		end
	end
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog(tSTRING_MISSION_LOG[3]..nTotalPlayerNum..", getn(tIndex) ch猲h l謈h l?:"..getn(tIndex)) 
	end
	return tIndex
end

--得到玩家在战场中的阵营，战场外不可用此函数
function LZZ_GetCamp()
	local nSignUpInfo = GetTask(VET_LZZ_PLAYER_CAMP)
	if nSignUpInfo == 0 then
		return 0
	end
	if nSignUpInfo == 1 then
		return CampSong_ID
	else
		return CampLiao_ID
	end
end

--清除所有Mission变量
function LZZ_ClearMissionData()
	for i=1,10 do
		SetMissionS(i,"")
	end
	for i=1,100 do
		SetMissionV(i,0)
	end
end

--玩家离开战场
--需要分几种情况
function LZZ_LeaveBattle()
	--print("LZZ_LeaveBattle() called!")
	local nCamp = LZZ_GetCamp() 
	LZZ_RestorePlayerState() 
	local nCurMapId = GetWorldPos() 
	if NewWorld(tMsLogOutPos[nCamp][1],tMsLogOutPos[nCamp][2],tMsLogOutPos[nCamp][3]) == 1 then
		local nBattleState = mf_GetMissionV(MISSIONID,MV_LZZ_STATE,nCurMapId) 
		if nBattleState == MS_STATE_READY or nBattleState == MS_STATE_FIGHT then
			Msg2MSAll(MISSIONID,tCampName[nCamp].."-"..GetName().."  r阨 kh醝 chi課 trng") 
			WriteLogEx(LONGCHAU_LOG_TITLE,GetName().." r阨 kh醝 chi課 trng")	
		end 
		return 1 
	else
		return 0 
	end 
end 

--离开战场时所作的处理
function LZZ_RestorePlayerState()
	--print("LZZ_RestorePlayerState() called!@@@@@@")
	-------------------
	SetLogoutRV(0) 	--设置登陆点为城市重生点
	SetDeathPunish(1) 	--无死亡惩罚
	SetCreateTeam(0) 	--关闭组建队伍(下线后会被清掉)
	ForbitTrade(0) 	--禁止交易
	InteractiveEnable(1) 	--关闭交互	必须在NewWorld之后执行才有效
	StallEnable(1) 	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(1) 	--禁止使用回城符
	ForbidChangePK(0) 	--允许改变PK状态
	SetPKFlag(0,0) 
	--ForbidChangePK(1) 	--禁止改变PK状态
	SetFightState(0) 
	----------------------------------------
	SetDeathScript("") 
	SetTempRevPos(0,0,0) 
	SetCampToPlayer("") 
	RemvoeTempEffect()  --清除玩家身上的所有临时状态
	LZZ_LeaveOperate()
	LZZ_DeleteAllBattleItem()
	LZZ_RestoreAll()
end 

--删除所有战场相关的物品（不能带出战场外的）
function LZZ_DeleteAllBattleItem()
	--解除座寄上的装备
	UnEquipAtPosition(10)
	local nResult = 0
	if BigDelItem(0,105,30034,1) ~= 1 then
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30035,1) ~= 1 then 
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30036,1) ~= 1 then 
		nResult = nResult + 1
	end
	if BigDelItem(0,105,30037,1) ~= 1 then 
		nResult = nResult + 1
	end
	if nResult == 4 and GetTask(VET_LZZ_PLAYER_DRAG) ~= 0 then 
		--print("删除龙舟失败")
		WriteLog(tSTRING_MISSION_LOG[7])
		return 0
	end
	--重置任务变量
	SetTask(VET_LZZ_PLAYER_DRAG,0)
end

--离开mission时解除限制操作
function LZZ_LeaveOperate()
	--解除禁止上下马
	SetTask(PLAYER_STATUS,0)
	SetTask(VET_LZZ_PLAYER_1715,0)	
	SetTask(VET_LZZ_DRAGBOAT_KIND,0)
	--操作玩家，解除禁止使用技能
	--去除面板显示
	FloatMsg2Player()
end

--进入mission时限制操作
function LZZ_JoinOperate()
	Msg2Player(tSRING_SYS_MSG[2])
end

--玩家加入战场
function LZZ_JoinBattle(nCamp)
	--print("LZZ_JoinBattle:nCamp="..nCamp)
	--在NewWorld前解散双人互动动作
	CleanInteractive() 
	local nCampPlace = nCamp 
	local nMapID = gf_GetCurMapID() 
	if NewWorld(nMapID,tMsLogInPos[nCampPlace][1],tMsLogInPos[nCampPlace][2]) == 1 then
		Msg2MSAll(MISSIONID,GetName().."  gia nh藀 "..tCampName[nCamp]) 
		Msg2Player("C竎 h?  gia nh藀 r錳"..tCampName[nCamp]) 
		LZZ_SetPlayerState(nCamp) 
		AddMSPlayer(MISSIONID,nCamp) 
		SetTask(VET_LZZ_PLAYER_CAMP,nCamp) 
		LZZ_Get_Game_Loop()
		--治疗所有和平状态的玩家
		--LZZ_CureAllPlayer()	
		--加入限制操作
		LZZ_JoinOperate()
		WriteLogEx(LONGCHAU_LOG_TITLE,GetName().." gia nh藀 chi課 trng")			
		return 1 
	else
		return 0 
	end 
end 

--进入战时对玩家进行的操作
function LZZ_SetPlayerState(nCamp)
	local nMapId = GetMissionV(MV_LZZ_MAP_ID) 
	--创建登出触发器
	if CreateTrigger(3,LOG_ID,LOG_TRIGGER_ID) == 0 then
		WriteLog(tSTRING_MISSION_LOG[5])
		--print("CreateTrigger 失败")
	end
	-------------------
	SetLogoutRV(1) 	--设置登陆点为城市重生点
	SetDeathPunish(0) 	--无死亡惩罚
	SetCreateTeam(1) 	--关闭组建队伍(下线后会被清掉)
	ForbitTrade(1) 	--禁止交易
	InteractiveEnable(0) 	--关闭交互	必须在NewWorld之后执行才有效
	StallEnable(0) 	--禁止摆摊(下线后会被清掉)
	UseScrollEnable(0) 	--禁止使用回城符
	ForbidChangePK(0) 	--允许改变PK状态
	SetPKFlag(1,nCamp) 
	ForbidChangePK(1) 	--禁止改变PK状态
	SetFightState(0)  --设置和平状态
	----------------------------------------
	KillFollower() 	--删除跟班
	SetMomentumBoundSwitch(1) 	--不可增加杀气值	
	local nDate = tonumber(date("%Y%m%d")) 
	if GetTask(VET_LZZ_PLAYER_DATE) < nDate then
		SetTask(VET_LZZ_PLAYER_DATE,nDate) 
	end	
	SetTempRevPos(nMapId,tMsLogInPos[nCamp][1]*32,tMsLogInPos[nCamp][2]*32) 	--设置重生点
	SetDeathScript(PLAYER_DEATH_SCRIPT) 
	if nCamp == CampSong_ID then
		--print("SetCamp Song")
		SetCampToPlayer(CampSong_Type) 
	else
		--print("SetCamp Liao")
		SetCampToPlayer(CampLiao_Type) 
	end
end

function LZZ_Get_Game_Loop()
	local nState = GetMissionV(MV_LZZ_STATE)+1 
	local tTimeDiff = {PEACE_TIME,READY_TIME,FIGHT_TIME,WAITOUT_TIME} 
	local tTimeLoop = {PEACE_TIMER_LOOP,READY_TIMER_LOOP,FIGHT_TIMER_LOOP,WAITOUT_TIMER_LOOP} 
	if GetGameLoop() - GetMissionV(MV_LZZ_GAME_LOOP) > tTimeDiff[nState] then
		SetMissionV(MV_TIMER_LOOP,tTimeLoop[nState]) 
		StartMissionTimer(MISSIONID,TIMERID,tTimeDiff[nState]) 
		SetMissionV(MV_LZZ_GAME_LOOP,GetGameLoop()) 
		SetMissionV(MV_LZZ_ERROR_NUM,GetMissionV(MV_LZZ_ERROR_NUM)+1) 
		WriteLog("[H秈 Chi課 Long Ch﹗]: "..GetMissionV(MV_LZZ_LOG_TIME).."Mission th?"..GetMissionV(MV_LZZ_ERROR_NUM).."T筼 m韎 th阨 gian v? giai 畂筺 chi課 trng: "..(nState-1)) 
	end
end

--对Mission中某一阵营玩家进行统一操作
--使用方法：先定义一个执行函数，这个函数的输入参数为一table。
--然后把这个函数作为第一个输入参数给OP_AllMSPlayer函数。
--通过传table的方式可以传多个参数给执行函数。
function LZZ_OperateAllPlayer(func,tArg,nCamp)
	local OldPlayerIndex = PlayerIndex 
	local IDTab = LZZ_GetMSPlayerIndex(nCamp) 
	local nPlayerCount = getn(IDTab) 
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i] 
			if PlayerIndex > 0 then
				func(tArg) 
			else
				WriteLog(tSTRING_MISSION_LOG[4]) 
			end 
		end 
	end 
	PlayerIndex = OldPlayerIndex 
end 

function lzz_tell_end()
	local nWhoWin = GetMissionV(MV_LZZ_WINNER_CAMP) 
	if nWhoWin == 1 then
		szResult = tCampName[nWhoWin].."Gi祅h chi課 th緉g" 
		Say(format(tSTRING_MISSION[9],tCampName[nWhoWin]),0)
	elseif nWhoWin == 2 then
		szResult = tCampName[nWhoWin].."Gi祅h chi課 th緉g"
		Say(format(tSTRING_MISSION[10],tCampName[nWhoWin]),0) 
	else
		szResult = "hai phe h遖 nhau" 
		Say(tSTRING_MISSION[11],0) 
	end 
	SetTask(VET_LZZ_PLAYER_TAG2,1)
	SetFightState(0) 
end 

--把睡觉的玩家踢出去
function lzz_kicksleep()
	local nCmap = LZZ_GetCamp() 
	if IsSleeping() == 1 then
		Talk(1,"",sNpcNameEntrance..tSTRING_MISSION[12]) 
		DelMSPlayer(MISSIONID,nCmap)  
		Msg2MSAll(MISSIONID,GetName().."R阨 kh醝 chi課 trng.") 
		WriteLogEx(LONGCHAU_LOG_TITLE,GetName().." b? kick v? ng? g藅")		
		return 1 
	end 
	return 0 
end

--设置参加战斗标志
function lzz_set_fight()
	SetTask(VET_LZZ_PLAYER_TAG,1)
end

--治疗所有和平状态的玩家
function LZZ_CureAllPlayer() 
	local Func = function(tArg)
		if GetFightState() == 0 then
			LZZ_RestoreAll()
		end
	end
	LZZ_OperateAllPlayer(Func,{},ALL_ID)
end 

function LZZ_RestoreAll()
	Restore()
	RestoreNeili()
end

--杨七秀NPC
function LZZ_Yangqixiu_Npc()
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_FIGHT then
		local nMapID = gf_GetCurMapID()
		local nIndex = CreateNpc("Dng Th蕋 T?","T鑞g Th駓 Qu﹏ Th鑞g L躰h",nMapID,tMsNpcPos[5][1],tMsNpcPos[5][2],0)
		SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\yqx_death.lua")
		SetCampToNpc(nIndex,CampSong_Type)
		Msg2MSAll(MISSIONID,tSTRING_MISSION[13])
	end
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_COMPLETE then
		Msg2MSAll(MISSIONID,tSTRING_MISSION[14])
	end
end

--萧泰NPC
function LZZ_Xiaotai_Npc()
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_FIGHT then
		local nMapID = gf_GetCurMapID()
		local nIndex = CreateNpc("Ti猽 T莕","Li猽 Th駓 Qu﹏ Th鑞g L躰h",nMapID,tMsNpcPos[6][1],tMsNpcPos[6][2],0)
		SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\xt_death.lua")
		SetCampToNpc(nIndex,CampLiao_Type)
		Msg2MSAll(MISSIONID,tSTRING_MISSION[15])
	end
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_COMPLETE then
		Msg2MSAll(MISSIONID,tSTRING_MISSION[16])
	end
end

--辽火船
function LZZ_Liao_Fireboat()
	--print("LZZ_Liao_Fireboat called********")
	--设置标志
	if GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1) == 0 then
		SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1,1)
	elseif GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1) == 1 and GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG2) == 0 then
		SetMissionV(MV_LZZ_LIAOFIREBOAT_TAG2,1)
	else
		return 0
	end
	--创建火船
	local nMapID = gf_GetCurMapID()
	local nNpcIdx = CreateNpc("H醓 Thuy襫","Li猽 H醓 Thuy襫",nMapID,tMsFireBoat[2][1],tMsFireBoat[2][2],0)
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\liao_fireboat_death.lua")
	SetCurrentNpcSFX(nNpcIdx,970,1,1)
	SetCampToNpc(nNpcIdx,CampLiao_Type)
	SetMissionV(MV_LZZ_LIAOBOAT_IDX,nNpcIdx)
	--print("辽火船index=",nNpcIdx)
	--print("MV_LZZ_LIAOBOAT_IDX=",GetMissionV(MV_LZZ_LIAOBOAT_IDX))
	--播放音效
	--PlaySound("\\sound\\vn\\scene\\scene_waring.wav")
	LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_waring.wav",ALL_ID)
	--公告
	Msg2MSAll(MISSIONID,tSTRING_MISSION[17])
	Msg2MSAll(MISSIONID,tSTRING_MISSION[18])
	--设置ＡＩ
	g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE)
	g_NpcAI:setWayPoint(nNpcIdx,tMsLiaoBoat)
end

--宋火船
function LZZ_Song_Fireboat()
	--print("LZZ_Song_Fireboat called********")
	--设置标志
	if GetMissionV(MV_LZZ_SONGFIREBOAT_TAG1) == 0 then
		SetMissionV(MV_LZZ_SONGFIREBOAT_TAG1,1)
	elseif GetMissionV(MV_LZZ_SONGFIREBOAT_TAG1) == 1 and GetMissionV(MV_LZZ_SONGFIREBOAT_TAG2) == 0 then
		SetMissionV(MV_LZZ_SONGFIREBOAT_TAG2,1)
	else
		return 0
	end
	--创建火船
	local nMapID = gf_GetCurMapID()
	local nNpcIdx = CreateNpc("H醓 Thuy襫","T鑞g H醓 Thuy襫",nMapID,tMsFireBoat[1][1],tMsFireBoat[1][2],0)
	SetNpcDeathScript(nNpcIdx,"\\script\\missions\\dragonboat2011\\npc\\song_fireboat_death.lua")
	SetCurrentNpcSFX(nNpcIdx,970,1,1)
	SetCampToNpc(nNpcIdx,CampSong_Type)
	SetMissionV(MV_LZZ_SONGBOAT_IDX,nNpcIdx)
	--print("宋火船index=",nNpcIdx)
	--print("MV_LZZ_SONGBOAT_IDX=",GetMissionV(MV_LZZ_SONGBOAT_IDX))
	--播放音效
	--PlaySound("\\sound\\vn\\scene\\scene_waring.wav")
	LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_waring.wav",ALL_ID)
	--公告
	Msg2MSAll(MISSIONID,tSTRING_MISSION[19])
	Msg2MSAll(MISSIONID,tSTRING_MISSION[20])
	--设置ＡＩ
	g_NpcAI:setAI(nNpcIdx,AT_SM_MOVE)
	g_NpcAI:setWayPoint(nNpcIdx,tMsSongBoat)
end

--刷新出漂流箱
function LZZ_Drifting_Box()
	local nMapID = gf_GetCurMapID()
	local nSize,nNum,nIndex,nCount
	local tFourBox = {
		[1] = {0,0},
		[2] = {0,0},
		[3] = {0,0},
		[4] = {0,0},
	}
	for i = 1,4 do 
		nSize = getn(tMsBoxCopy)
		if nSize == 0 then
			return 0
		end
		nCount = nSize / 4
		--print("nSize = "..nSize)
		nNum = random(nSize)
		--print("nNum = "..nNum)
		tFourBox[i][1] = tMsBoxCopy[nNum][1]
		tFourBox[i][2] = tMsBoxCopy[nNum][2]
		tremove(tMsBoxCopy,nNum)
		--print("tFourBox",tFourBox[i][1],tFourBox[i][2])
	end
	nIndex = CreateNpc("Gi? v? kh?","Gi? v? kh?",nMapID,tFourBox[1][1],tFourBox[1][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\weapon_npc.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	nIndex = CreateNpc("Gi? khi猲","H? gi竝",nMapID,tFourBox[2][1],tFourBox[2][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\armor_npc.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	nIndex = CreateNpc("Gi祔 gi?","Gi祔 t╪g t鑓",nMapID,tFourBox[3][1],tFourBox[3][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\speedboots_npx.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	nIndex = CreateNpc("L? th秓 dc","Sng m?",nMapID,tFourBox[4][1],tFourBox[4][2],0)
	SetNpcDeathScript(nIndex,"\\script\\missions\\dragonboat2011\\npc\\box\\densefog_npc.lua")
	SetNpcLifeTime(nIndex,nCount*90)
	Msg2MSAll(MISSIONID,tSTRING_MISSION[21])
end

--禁止使用技能
function lzz_forbid_skill()

end

--容许使用技能
function lzz_allow_skill()

end

--火船位置判断
function LZZ_FireBoat_Position()
	--print("LZZ_FireBoat_Position() called!!!")
	local nSongIndex = GetMissionV(MV_LZZ_SONGBOAT_IDX)
	local nLiaoIndex = GetMissionV(MV_LZZ_LIAOBOAT_IDX)
	--print("%%%%%%nSongIndex",nSongIndex)
	--print("%%%%%%nLiaoIndex",nLiaoIndex)
	if nSongIndex == 0 and nLiaoIndex == 0 then
		return 0
	end
--	local nMap,nX,nY
	local nAllow = 3 --容许误差范围
	--宋
	if nSongIndex ~= 0 then
		local nMap,nX,nY = GetNpcWorldPos(nSongIndex)
		--print("nX",nX)
		--print("tMsSongBoat[2][1]-3=",tMsSongBoat[2][1]-nAllow)
		if tonumber(nX) == 0 then
			return 0
		end
		if tonumber(nX) >= tonumber(tMsSongBoat[2][1]-nAllow) then
			SetNpcLifeTime(nSongIndex,0)
			SetMissionV(MV_LZZ_CAMPONE_POINT,GetMissionV(MV_LZZ_CAMPONE_POINT)+FIREBOAT_POINT)
			SetMissionV(MV_LZZ_SONGBOAT_IDX,0)
			--print("Song index after",GetMissionV(MV_LZZ_LIAOBOAT_IDX))
			--更新面板
			LZZ_Panel_Show()
			Msg2MSAll(MISSIONID,tSTRING_MISSION[22])
		end
	end
	--辽
	if nLiaoIndex ~= 0 then  
		local nMap,nX,nY = GetNpcWorldPos(nLiaoIndex)
		--print("nX",nX)
		--print("tMsLiaoBoat[2][1]+3=",tMsLiaoBoat[2][1]+nAllow)
		if tonumber(nX) == 0 then
			return 0
		end
		if tonumber(nX) <= tonumber(tMsLiaoBoat[2][1]+nAllow) then
			SetNpcLifeTime(nLiaoIndex,0)
			SetMissionV(MV_LZZ_CAMPTWO_POINT,GetMissionV(MV_LZZ_CAMPTWO_POINT)+FIREBOAT_POINT)
			SetMissionV(MV_LZZ_LIAOBOAT_IDX,0)
			--print("Liao index after",GetMissionV(MV_LZZ_LIAOBOAT_IDX))
			--更新面板
			LZZ_Panel_Show()
			Msg2MSAll(MISSIONID,tSTRING_MISSION[23])
		end
	end
end

--面板显示
function LZZ_Panel_Show()
	--print("LZZ_Panel_Show() called#####")
	local str1,str2,num1,num2,fight1,fight2
	local nLoop,nSecond
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_PEACE then
		str1 = "H遖 b譶h"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 5*(PEACE_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_READY then
		str1 = "Chu萵 b?"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 5*(READY_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_FIGHT then
		str1 = "Chi課 u"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 15*(FIGHT_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_COMPLETE then
		str1 = "K誸 th骳"
		nLoop = GetMissionV(MV_TIMER_LOOP)
		nSecond = 5*(WAITOUT_TIMER_LOOP - nLoop + 1)
		str2 = lzz_second_format(nSecond)
		num1 = GetMSPlayerCount(MISSIONID,CampSong_ID)
		num2 = GetMSPlayerCount(MISSIONID,CampLiao_ID)
		fight1 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPTWO_POINT)
		fight2 = OVER_GAME_POINT - GetMissionV(MV_LZZ_CAMPONE_POINT)
		if fight1 < 0 then
			fight1 = 0
		end
		if fight2 < 0 then
			fight2 = 0
		end
		LZZ_OperateAllPlayer(FloatMsg2Player,format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2),ALL_ID)
		--print(format(tSRING_SYS_MSG[4],str1,str2,num1,num2,fight1,fight2))
	else 
		--print("FloatMsg2Player ERROR %%%%%")
		WriteLog(tSTRING_MISSION_LOG[1])
	end	
end

--秒换算成时间,返回字符串
function lzz_second_format(nSecond)
	local nM = floor(nSecond/60)
	local nS = nSecond - nM*60
	if nM < 10 and nS < 10 then
		return format("00:0%d:0%d",nM,nS)
	elseif nM < 10 and nS >= 10 then
		return format("00:0%d:%d",nM,nS)
	elseif nM >= 10 and nS <10 then
		return format("00:%d:0%d",nM,nS)
	else
		return format("00:%d:%d",nM,nS)
	end
end