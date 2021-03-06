
-- Creator : lizhi
-- mission room 2007-3-29 15:44

Include("\\script\\class\\mem.lua")

function my_setmissions(nIndex, str)
	SetMissionS(10 + nIndex, str)
end

function my_getmissions(nIndex)
	return GetMissionS(10 + nIndex)
end

KMissionRoom =
{
	-- 为了能够Reload,这些数值不记录在脚本变量中,记录在对应的MISSION变量中,所以以下变量记录的是对应Mission变量的索引
	-- 但这样的做法使得KMissionRoom不能生成一个Object
	m_nMapID = 51,
	m_nMissionID = 52,
	m_nTimerID = 53,
	m_nTimerInterVal = 54,
	m_nTimeStep = 55,
	
	-- ChangeSubWorld时临时存贮
	_tempSubWorld = 0,
	
	ChangeSubWorld = function(self, nMapID)
		local nMapIdx = SubWorldID2Idx(nMapID)
		if nMapIdx ~= -1 then
			self._tempSubWorld = SubWorld
			SubWorld = nMapIdx
			return 1
		end
		return 0
	end,
	
	ReSetSubWorld = function(self)
		SubWorld  = self._tempSubWorld
	end,
	
	GetPlayerCount = function(self, nGroup, nMapID, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		
		local nCount = GetMSPlayerCount(nMissionID, nGroup)
		self:ReSetSubWorld()
		return nCount
	end,
}

KMissionRecordAppend =
{
	-- 这些变量同样是mission变量的索引
	
	m_nSignupTimeEnd = 60,	-- 报名时间结束
	m_nRing1Begin = 61,		-- 第一轮比赛开始
	m_nRing1Fight = 62,		-- 第一轮比赛开打
	m_nRing2Begin = 63,		-- 第二轮比赛开始
	m_nRing2Fight = 64,		-- 第二轮比赛开打
	m_nRing3Begin = 65,		-- 第三轮比赛开始
	m_nRing3Fight = 66,		-- 第三轮比赛开打
	m_nAllEnd = 67,			-- 整个擂台结束
	
	m_nSlotIndex = 70,		-- 报名序号,其实就是表示有多少个队伍报名
	m_nState = 71,			-- 当前Mission的状态
	m_nFightCity = 72,		-- 当前进行是哪个城市的资格赛
	
	Open = function(self, nMapID, nMissionID, nFightCity)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		OpenMission(nMissionID)
		self:Init(nMapID, nMissionID, nFightCity)
		--	RunMission(nMissionID)	-- 用下面的self:Run替代
		self:Run()
		self:ReSetSubWorld()
	end,
	
	Close = function(self)
		CloseMission(GetMissionV(self.m_nMissionID))
	end,
	
	CloseMe = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		self:CloseArenaRoom()
		self:Close()
		self:ReSetSubWorld()
	end,
	
	Init = function(self, nMapID, nMissionID, nFightCity)
		for i = 50, 100 do
			SetMissionV(i, 0)
		end
		for i = 1, 10 do
			my_setmissions(i, "")
		end
		
		SetMissionV(self.m_nMapID, nMapID)
		SetMissionV(self.m_nMissionID, nMissionID)
		SetMissionV(self.m_nTimerID, TIMER_ID)
		SetMissionV(self.m_nTimerInterVal, TIMER_INTERVAL)
		SetMissionV(self.m_nTimeStep, 0)
		SetMissionV(self.m_nFightCity, nFightCity)
	end,
	
	UnInit = function(self)
		for i = 50, 100 do
			SetMissionV(i, 0)
		end
		for i = 1, 10 do
			my_setmissions(i, "")
		end
		-- 停止计时器
		StopMissionTimer(GetMissionV(self.m_nMissionID), GetMissionV(self.m_nTimerID))
	end,
	
	Run = function(self)
		-- 计算各个时间点
		local nSignupTimeEnd = RECORD_SIGNUP_TIME_INTERVAL
		local nRing1Begin = nSignupTimeEnd + RECORD_RAND_TIME_INTERVAL
		local nRing1Fight = nRing1Begin + ARENA_PREPARE_TIME_INTERVAL
		local nRing2Begin = nRing1Fight + ARENA_FIGHT_TIME_INTERVAL
		local nRing2Fight = nRing2Begin + ARENA_PREPARE_TIME_INTERVAL
		local nRing3Begin = nRing2Fight + ARENA_FIGHT_TIME_INTERVAL
		local nRing3Fight = nRing3Begin + ARENA_PREPARE_TIME_INTERVAL
		local nAllEnd = nRing3Fight + ARENA_FIGHT_TIME_INTERVAL
		
		SetMissionV(self.m_nSignupTimeEnd, nSignupTimeEnd)
		SetMissionV(self.m_nRing1Begin, nRing1Begin)
		SetMissionV(self.m_nRing1Fight, nRing1Fight)
		SetMissionV(self.m_nRing2Begin, nRing2Begin)
		SetMissionV(self.m_nRing2Fight, nRing2Fight)
		SetMissionV(self.m_nRing3Begin, nRing3Begin)
		SetMissionV(self.m_nRing3Fight, nRing3Fight)
		SetMissionV(self.m_nAllEnd, nAllEnd)
		SetMissionV(self.m_nState, SIGNUP_TIME)					-- 报名开始了
		
		-- 开始计时器
		StartMissionTimer(GetMissionV(self.m_nMissionID), GetMissionV(self.m_nTimerID), GetMissionV(self.m_nTimerInterVal))
	end,
	
	GetState = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nState = GetMissionV(self.m_nState)
		self:ReSetSubWorld()
		return nState
	end,
	
	GetTeamInfo = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local t = {}
		for i=1, MAX_TEAM_COUNT do
			t[i] = my_getmissions(i)
		end
		self:ReSetSubWorld()
		return t
	end,
	
	GetSignLeftTime = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nMin = 0
		local nSec = 0
		if GetMissionV(self.m_nState) == SIGNUP_TIME then
			local nTimeStep = GetMissionV(self.m_nTimeStep)
			local nSignEnd = GetMissionV(self.m_nSignupTimeEnd)
			local nStep = nSignEnd - nTimeStep
			local nAllSec = nStep * TIME_SEC
			nMin = floor(nAllSec / 60)
			nSec = mod(nAllSec, 60)
		end
		self:ReSetSubWorld()
		return nMin, nSec
	end,
	
	GetPrepareLeftTime = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nMin = 0
		local nSec = 0
		if GetMissionV(self.m_nState) == PREPARE_TIME then
			local nTimeStep = GetMissionV(self.m_nTimeStep)
			local nSignEnd = 0
			if nTimeStep < GetMissionV(self.m_nRing1Fight) then
				nSignEnd = GetMissionV(self.m_nRing1Fight)
			elseif nTimeStep < GetMissionV(self.m_nRing2Fight) then
				nSignEnd = GetMissionV(self.m_nRing2Fight)
			elseif nTimeStep < GetMissionV(self.m_nRing3Fight) then
				nSignEnd = GetMissionV(self.m_nRing3Fight)
			end
			
			local nStep = nSignEnd - nTimeStep
			if nStep > ARENA_PREPARE_TIME_INTERVAL or nStep < 0 then
				nStep = 0
			end
			local nAllSec = nStep * TIME_SEC
			nMin = floor(nAllSec / 60)
			nSec = mod(nAllSec, 60)
		end
		self:ReSetSubWorld()
		return nMin, nSec
	end,
	
	OnTimer = function(self)
		local nTimeStep = GetMissionV(self.m_nTimeStep)
		SetMissionV(self.m_nTimeStep, nTimeStep + 1)		-- 就算下面哪个流程出错了,时间计步器还是要一直走下去
		if nTimeStep == GetMissionV(self.m_nSignupTimeEnd) then
			SetMissionV(self.m_nState, VIEW_TIME)
			self:RandTeam()				-- 随机排序
		elseif nTimeStep == GetMissionV(self.m_nRing1Begin) then
			self:DoOpenArenaRoom(0)		-- 开房间
			self:NotifyTeam()			-- 通告队伍的对阵情况
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing1Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- 第一轮开打
		elseif nTimeStep == GetMissionV(self.m_nRing2Begin) then
			self:NextFight()			-- 下一轮对阵
			self:CloseArenaRoom()		-- 结束了一轮比赛
			self:DoOpenArenaRoom(0)		-- 开始新的一轮
			self:NotifyTeam()
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing2Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- 第二轮开打
		elseif nTimeStep == GetMissionV(self.m_nRing3Begin) then
			self:NextFight()			-- 下一轮对阵
			self:CloseArenaRoom()		-- 结束了一轮比赛
			self:DoOpenArenaRoom(1)		-- 开始新的一轮
			self:NotifyTeam()
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing3Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- 第三轮开打
		elseif nTimeStep == GetMissionV(self.m_nAllEnd) then
			self:NextFight()
			self:ReferResult()			-- 提交最终结果
			self:CloseArenaRoom()		-- 结束一轮比赛
			self:Close()				-- 关闭MISSION
		end
	end,
	
	DoOpenArenaRoom = function(self, nFinal)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		for index, value in tArenaRoom do
			KMissionArenaRoom:Open(value, ARENA_MISSION_ID, nFinal)
		end
	end,
	
	CloseArenaRoom = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		if tArenaRoom == nil then
			return
		end
		for index, value in tArenaRoom do
			KMissionArenaRoom:Close(value)
		end
	end,
	
	RandTeam = function(self)
		local nSlotIndex = GetMissionV(self.m_nSlotIndex)
		if nSlotIndex == 0 then	-- 如果没有队伍,则整个结束吧
			if GetGlbValue(1019) == 1 then
				Msg2SubWorld("Do kh玭g c? nh鉳 n祇 tham gia tr薾 L玦 i C玭g th祅h chi課, tr薾 n祔 h駓 b?.")
			end
			self:ReferResult()
			self:CloseArenaRoom()
			self:Close()
			return
		end
		-- 随机排序
		local tStr = {}
		for i=1, nSlotIndex do
			local nChangeIndex = random(1, nSlotIndex)
			local _tempstr = my_getmissions(nChangeIndex)
			my_setmissions(nChangeIndex, my_getmissions(i))
			my_setmissions(i, _tempstr)
		end
		for i=1, nSlotIndex do
			tStr[i] = my_getmissions(i)
			my_setmissions(i, "")
		end
		-- 先排满奇数，再排偶数
		local nIndex = 1
		for i=1, MAX_TEAM_COUNT, 2 do
			my_setmissions(i, tStr[nIndex])
			nIndex = nIndex + 1
		end
		
		for i=2, MAX_TEAM_COUNT, 2 do
			my_setmissions(i, tStr[nIndex])
			nIndex = nIndex + 1
		end
	end,
	
	NextFight = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		local tWinner = {}
		for index, value in tArenaRoom do
			tWinner[index] = KMissionArenaRoom:GetWinner(value)
		end
		
		for i=1, MAX_TEAM_COUNT do
			if i <= getn(tWinner) then
				my_setmissions(i, tWinner[i])
			else
				my_setmissions(i, "")
			end
		end
	end,
	
	NotifyTeam = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		local tTeamName1 = {}
		local tTeamName2 = {}
		for i=1, floor(MAX_TEAM_COUNT / 2) do
			tTeamName1[i] = my_getmissions(i * 2 - 1)
			tTeamName2[i] = my_getmissions(i * 2)
		end

		for i = 1, getn(tTeamName1) do	-- 宣告对阵情况,并设置相应mission的对阵双方
			if tTeamName1[i] == "" or tTeamName2[i] == "" then
				--print("对阵 : "..tTeamName1[i]..tTeamName2[i].." 此轮轮空")
			else
				--print("对阵 : "..tTeamName1[i].." 对 "..tTeamName2[i].."\tMapID = "..tArenaRoom[i])
			end
			-- 轮空的队伍也加入mission中
			KMissionArenaRoom:SetTeamName(tArenaRoom[i], ARENA_MISSION_ID, tTeamName1[i], tTeamName2[i])
		end
		Msg2SubWorld("M阨 tham gia L玦 i C玭g th祅h, trong 3 ph髏 ph秈 v祇 tr薾, n誹 kh玭g s? x? l? v? h駓 b? quy襫 l頸")
		AddGlobalNews("M阨 tham gia L玦 i C玭g th祅h, trong 3 ph髏 ph秈 v祇 tr薾, n誹 kh玭g s? x? l? v? h駓 b? quy襫 l頸")
	end,
	
	DoFight = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		for index, value in tArenaRoom do
			KMissionArenaRoom:DoFight(value, ARENA_MISSION_ID)
		end
	end,
	
	ReferResult = function(self)
		local nFightCity = GetMissionV(self.m_nFightCity)
		local szFinalWinner = my_getmissions(1)
		if szFinalWinner == "" then
			LOG_SIEGE(LOG_SIEGE_ERROR, "Tr薾 quy誸 chi課 cu鑙 c飊g kh玭g c? ngi th緉g cu閏")
			return
		end
		-- 提交结果
		local szA, szD = GetCityWarAD(nFightCity)
		if szD ~= "" then						-- 如果有守城方
			SetCityWarAttack(nFightCity, szFinalWinner)
			Msg2SubWorld("Ch骳 m鮪g bang h閕:"..szFinalWinner.."Bang h閕 nh薾 頲 "..tFightCityName[nFightCity].."_t? c竎h c玭g th祅h")
			AddGlobalNews("Ch骳 m鮪g bang h閕:"..szFinalWinner.."Bang h閕 nh薾 頲 "..tFightCityName[nFightCity].."_t? c竎h c玭g th祅h")
			WriteLogEx("Cong Thanh Chien",szFinalWinner.." nh薾 頲 "..tFightCityName[nFightCity].."_t? c竎h c玭g th祅h")
		elseif szD == "" then					-- 如果没有守城方，则直接占有城市
			SetCityWarWinner(nFightCity, szFinalWinner)
			Msg2SubWorld("Ch骳 m鮪g bang h閕:"..szFinalWinner.."  chi誱 頲 "..tFightCityName[nFightCity])
			AddGlobalNews("Ch骳 m鮪g bang h閕:"..szFinalWinner.."  chi誱 頲 "..tFightCityName[nFightCity])
			WriteLogEx("Cong Thanh Chien",szFinalWinner.."  chi誱 頲 "..tFightCityName[nFightCity])
		end
	end,
	
	GetFreeSlot = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nCount = MAX_TEAM_COUNT - GetMissionV(self.m_nSlotIndex)
		self:ReSetSubWorld()
		return nCount
	end,
	
	GetMemberCount = function(self, nPlaceIdx, nCamp, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		local nCount = KMissionArenaRoom:GetMemberCount(tArenaRoom[nPlaceIdx], nCamp, ARENA_MISSION_ID)
		self:ReSetSubWorld()
		return nCount
	end,
	
	AddTeam = function(self, szTeamName, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nIndex = GetMissionV(self.m_nSlotIndex) + 1
		my_setmissions(nIndex, szTeamName)
		SetMissionV(self.m_nSlotIndex, nIndex)
		local nOldPlayer = PlayerIndex
		for i=1, gf_GetTeamSize() do	-- 把当前组内的人都记录上
			PlayerIndex = gf_GetTeamMember(i)
			if PlayerIndex > 0 then
				Talk(1,"","m阨 i trong th祅h, thuy襫 甶 kh玭g i ngi, qu? th阨 h筺 ch璦 v? xem nh? t? b? quy襫 l頸.")
			end
		end
		PlayerIndex = nOldPlayer
		self:ReSetSubWorld()
	end,
	
	AddTeamMember = function(self, nPlaceIdx, nCamp, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		KMissionArenaRoom:AddTeamMember(tArenaRoom[nPlaceIdx], nCamp, ARENA_MISSION_ID)
		self:ReSetSubWorld()
	end,
	
	AddViewer = function(self, nPlaceIdx, nCamp, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		KMissionArenaRoom:AddViewer(tArenaRoom[nPlaceIdx], nCamp, ARENA_MISSION_ID)
		self:ReSetSubWorld()
	end,
	
	FightingInfo = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local szInfo = ""
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		for index, value in tArenaRoom do
			szInfo = szInfo..KMissionArenaRoom:GetFightInfo(value)
		end
		self:ReSetSubWorld()
		if strfind(szInfo, GetTongName()) ~= nil then
			return "<color=green>"..szInfo.."<color>"
		else
			return szInfo
		end
	end,
}

KMissionArenaAppend =
{
	-- 这些变量同样是mission变量的索引
	m_nPrepareTimeEnd = 60,		-- 准备时间到
	m_nFightTimeEnd = 61,		-- 结束时间到
	m_nFinal = 62,				-- 是否为决赛
	m_nFinalLost = 63,			-- 如果平局的话，最终谁失败，有点奇怪的逻辑，不过为了好处理
	
	m_nEndTick = 64,			-- 胜利以后留一个缓冲时间
	
	m_sCamp1Team = 1,			-- 1队的名字
	m_sCamp2Team = 2,			-- 2队的名字
	
	m_sCamp1TeamBak = 3,		-- 记录参赛1队的名字
	m_sCamp2TeamBak = 4,		-- 记录参赛2队的名字
	
	Open = function(self, nMapID, nMissionID, nFinal)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		OpenMission(nMissionID)
		self:Init(nMapID, nMissionID)
		self:Run(nFinal)
		self:ReSetSubWorld()
	end,
	
	Run = function(self, nFinal)
		-- 计算各个时间点
		local nPrepareTimeEnd = SUB_ARENA_PREPARE_TIME_END
		local nFightTimeEnd = nPrepareTimeEnd + SUB_ARENA_FIGHT_TIME_END
		
		SetMissionV(self.m_nPrepareTimeEnd, nPrepareTimeEnd)
		SetMissionV(self.m_nFightTimeEnd, nFightTimeEnd)
		SetMissionV(self.m_nFinal, nFinal)
		
		-- 开始计时器
		StartMissionTimer(GetMissionV(self.m_nMissionID), GetMissionV(self.m_nTimerID), GetMissionV(self.m_nTimerInterVal))
	end,
	
	Close = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		CloseMission(GetMissionV(self.m_nMissionID))
		self:ReSetSubWorld()
	end,
	
	Init = function(self, nMapID, nMissionID)
		for i = 50, 100 do 
			SetMissionV(i, 0)
		end
		for i = 1, 10 do 
			my_setmissions(i, "")
		end
		
		SetMissionV(self.m_nMapID, nMapID)
		SetMissionV(self.m_nMissionID, nMissionID)
		SetMissionV(self.m_nTimerID, TIMER_ID)
		SetMissionV(self.m_nTimerInterVal, ARENA_TIME_INTERVAL)
		SetMissionV(self.m_nTimeStep, 0)
	end,
	
	UnInit = function(self)
		-- 善后处理
		local idx = 0
		local pidx = 0
		local nAlive = 0
		local nMissionID = GetMissionV(self.m_nMissionID)
		local tPlayer = {}
		for i=1, GetMSPlayerCount(nMissionID, 0) do
			idx, pidx = GetNextPlayer(nMissionID, idx, 0)
	 		tPlayer[i] = pidx
		end
		
		for index, value in tPlayer do
			DelMSPlayer(nMissionID, value, 0)
		end		
		StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))
	end,
	
	OnTimer = function(self)
		local nTimeStep = GetMissionV(self.m_nTimeStep)
		SetMissionV(self.m_nTimeStep, nTimeStep + 1)
		local nPrepareTimeEnd = GetMissionV(self.m_nPrepareTimeEnd)
		local nFightTimeEnd = GetMissionV(self.m_nFightTimeEnd)
		if nTimeStep < nPrepareTimeEnd then
			-- 通报距离开战时间还有多少
			self:NotifyMsg("Th阨 gian khai chi課 c遪  ", nPrepareTimeEnd, nTimeStep)
		elseif nTimeStep < nFightTimeEnd then
			local nMissionID = GetMissionV(self.m_nMissionID)
			if GetMissionV(self.m_nEndTick) == 2 then	-- 缓冲时间到
				local idx = 0
				local pidx = 0
				local tPlayer = {}
				for i=1, GetMSPlayerCount(nMissionID, 0) do
					idx, pidx = GetNextPlayer(nMissionID, idx, 0)
			 		tPlayer[i] = pidx
				end
				for index, value in tPlayer do
					DelMSPlayer(nMissionID, value, 0)
				end
				StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))		-- 已经结束，也停止计时器返回
				return
			end
			if GetMissionV(self.m_nEndTick) > 0 then	-- 如果是结束了，递增缓冲时间
				SetMissionV(self.m_nEndTick, GetMissionV(self.m_nEndTick) + 1)
				return
			end
			-- 如果是一方轮空，或者已决出胜负，则停止计时器返回
			if my_getmissions(self.m_sCamp1Team) == "" or my_getmissions(self.m_sCamp2Team) == "" then
				StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))
				return
			end
			
			-- 如果此期间没有对手了，就把自己和观众也传出去
			local nIsEnd = 0
			local szMsg = ""
			if GetMSPlayerCount(nMissionID, 1) == 0 and GetMSPlayerCount(nMissionID, 2) == 0 then
				local nLost = GetMissionV(self.m_nFinalLost)
				szMsg = my_getmissions(self.m_sCamp1Team).."c飊g v韎 "..my_getmissions(self.m_sCamp2Team).."qua m閠 h錳 t? th? k辌h li謙, cu鑙 c飊g: "..my_getmissions(nLost).." kinh nghi謒 giang h? non k衜, thua tr薾 th藅 ng ti誧"
				my_setmissions(nLost, "")
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			elseif GetMSPlayerCount(nMissionID, 1) == 0 then
				my_setmissions(self.m_sCamp1Team, "")
				szMsg = my_getmissions(self.m_sCamp2Team).." gi祅h 頲 chi課 th緉g L玦 i l莕 n祔"
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			elseif GetMSPlayerCount(nMissionID, 2) == 0 then
				my_setmissions(self.m_sCamp2Team, "")
				szMsg = my_getmissions(self.m_sCamp1Team).." gi祅h 頲 chi課 th緉g L玦 i l莕 n祔"
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			end
			
			if nIsEnd == 1 then
				SetMissionV(self.m_nEndTick, 1)
				Msg2MSAll(nMissionID, szMsg)
				return
			end
			
			-- 如果此期间队伍全灭,就把整个队伍传出去
			---------这几个是平局才会用的-------
			local tLevel = {}
			local tExp = {}
			local nDeadTeamCount = 0
			---------这几个是平局才会用的-------
			for i=1, 2 do
				tLevel[i] = 0
				tExp[i] = 0
				local idx = 0
				local pidx = 0
				local nAlive = 0
				local t = {}
				local nCount = 1
				for j=1, GetMSPlayerCount(nMissionID, i) do
					idx, pidx = GetNextPlayer(nMissionID, idx, i)
					if pidx > 0 then
						t[nCount] = pidx
				   		PlayerIndex = pidx
				   		if IsPlayerDeath() == 0 then
				   			nAlive = nAlive + 1
				   			break
				   		end
				   		nCount = nCount + 1
					end
				end
				if nAlive == 0 then
					nDeadTeamCount = nDeadTeamCount + 1
					for k = 1, nCount - 1 do
						PlayerIndex = t[k]
						Msg2Player("чi c馻 b筺 b? ti猽 di謙 s筩h, hi謓 chuy觧 i ng? c馻 b筺 ra kh醝 tr薾 a!")
						-- 计算一下挂掉一方的经验和等级，以防万一两边同时挂了
				   		tLevel[i] = tLevel[i] + GetLevel()
				   		tExp[i] = tExp[i] + GetExp()
						DelMSPlayer(nMissionID, PlayerIndex, 0)
					end
				end
			end
			
			if nDeadTeamCount == 2 then		-- 如果是两边都挂掉了
				if tLevel[1] > tLevel[2] then
					SetMissionV(self.m_nFinalLost, self.m_sCamp2Team)
				elseif tLevel[1] < tLevel[2] then
					SetMissionV(self.m_nFinalLost, self.m_sCamp1Team)
				else
					if tExp[1] > tExp[2] then
						SetMissionV(self.m_nFinalLost, self.m_sCamp2Team)
					elseif tExp[1] < tExp[2] then
						SetMissionV(self.m_nFinalLost, self.m_sCamp1Team)
					else
						SetMissionV(self.m_nFinalLost, random(self.m_sCamp1Team,self.m_sCamp2Team))
					end
				end
			end
			
			self:NotifyMsg("th阨 gian thi u c遪  ", nFightTimeEnd, nTimeStep)
		end
	end,
	
	SetTeamName = function(self, nMapID, nMissionID, szTeamName1, szTeamName2)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		my_setmissions(self.m_sCamp1Team, szTeamName1)
		my_setmissions(self.m_sCamp2Team, szTeamName2)
		---------------------------------------------
		my_setmissions(self.m_sCamp1TeamBak, szTeamName1)
		my_setmissions(self.m_sCamp2TeamBak, szTeamName2)
		self:ReSetSubWorld()
	end,
	
	GetMemberCount = function(self, nMapID, nCamp, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return -1
		end
		local nCount = 0
		nCount = GetMSPlayerCount(nMissionID, nCamp)
		self:ReSetSubWorld()
		return nCount
	end,
	
	AddTeamMember = function(self, nMapID, nCamp, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nOldPlayer = PlayerIndex
		for i=1, gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i)
			if PlayerIndex > 0 then
				CleanInteractive()
				if NewWorld(nMapID, tArenaMapPos[nMapID][1], tArenaMapPos[nMapID][2]) == 1 then
					AddMSPlayer(nMissionID, nCamp)
					tongcitywar_setpstate(nCamp, 0)
				end
			end
		end
		self:ReSetSubWorld()
	end,
	
	AddViewer = function(self, nMapID, nCamp, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		-- 观众有上限
		if GetMSPlayerCount(nMission, nCamp) > MAX_VIEWER then
			Talk(1,"","Ngi xem tr薾 L玦 i  y r錳")
		else
			CleanInteractive()
			if NewWorld(nMapID, tArenaMapPos[nMapID][1], tArenaMapPos[nMapID][2]) == 1 then
				AddMSPlayer(nMissionID, nCamp)
				tongcitywar_setpstate(nCamp, 0)
			end
		end
		self:ReSetSubWorld()
	end,
	
	GetWinner = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local szWinner = ""
		if my_getmissions(self.m_sCamp1Team) == "" then		-- 如果轮空的，或者把对方直接杀出去了，自然就进入下一轮了
			szWinner = my_getmissions(self.m_sCamp2Team)
		elseif my_getmissions(self.m_sCamp2Team) == "" then
			szWinner = my_getmissions(self.m_sCamp1Team)
		else								-- 判断活着的人数,如果相等则判断活人的总经验值,如果还相等就随机一个
			local nMissionID = GetMissionV(self.m_nMissionID)
			local idx = 0
			local pidx = 0
			local nTeam1Alive = 0
			local nTeam1Level = 0
			local nTeam1Exp = 0
			for i=1, GetMSPlayerCount(nMissionID, 1) do
				idx, pidx = GetNextPlayer(nMissionID, idx, 1)
				if pidx > 0 then
			   		PlayerIndex = pidx
			   		if IsPlayerDeath() == 0 then
			   			nTeam1Alive = nTeam1Alive + 1
			   			nTeam1Level = nTeam1Level + GetLevel()
			   			nTeam1Exp = nTeam1Exp + GetExp()
			   		end
				end
			end
			idx = 0
			local nTeam2Alive = 0
			local nTeam2Level = 0
			local nTeam2Exp = 0
			for i=1, GetMSPlayerCount(nMissionID, 2) do
				idx, pidx = GetNextPlayer(nMissionID, idx, 2)
				if pidx > 0 then
				   	PlayerIndex = pidx
				   	if IsPlayerDeath() == 0 then
			   			nTeam2Alive = nTeam2Alive + 1
			   			nTeam2Level = nTeam2Level + GetLevel()
			   			nTeam2Exp = nTeam2Exp + GetExp()
			   		end
				end
			end
			
			if nTeam1Alive < nTeam2Alive then
				szWinner = my_getmissions(self.m_sCamp2Team)
			elseif nTeam1Alive > nTeam2Alive then
				szWinner = my_getmissions(self.m_sCamp1Team)
			else
				if nTeam1Level > nTeam2Level then
					szWinner = my_getmissions(self.m_sCamp1Team)
				elseif nTeam1Level < nTeam2Level then
					szWinner = my_getmissions(self.m_sCamp2Team)
				else
					if nTeam1Exp > nTeam2Exp then
						szWinner = my_getmissions(self.m_sCamp1Team)
					elseif nTeam1Exp < nTeam2Exp then
						szWinner = my_getmissions(self.m_sCamp2Team)
					elseif nTeam1Exp == nTeam2Exp then		-- 随机一个
						szWinner = my_getmissions(random(self.m_sCamp1Team, self.m_sCamp2Team))
					end
				end
			end
		end
		if szWinner ~= "" then
			Msg2SubWorld("Bang h閕: "..szWinner.." gi祅h th緉g l頸.")
		end
		self:ReSetSubWorld()
		return szWinner
	end,
	
	DoFight = function(self, nMapID, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		
		local idx = 0
		local pidx = 0
		for i=1, GetMSPlayerCount(nMissionID, 1) do
			idx, pidx = GetNextPlayer(nMissionID, idx, 1)
			if pidx > 0 then
			   	PlayerIndex = pidx
			   	SetFightState(1)
			   	Talk(1,"","Tr薾 chi課 b総 u!")
			end
		end
		
		idx = 0
		for i=1, GetMSPlayerCount(nMissionID, 2) do
			idx, pidx = GetNextPlayer(nMissionID, idx, 2)
			if pidx > 0 then
			   	PlayerIndex = pidx
			   	SetFightState(1)
			   	Talk(1,"","Tr薾 chi課 b総 u!")
			end
		end
		self:ReSetSubWorld()
	end,
	
	GetFightInfo = function(self, nMapID)
		local szInfo = ""
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		if my_getmissions(self.m_sCamp1TeamBak) == "" and my_getmissions(self.m_sCamp2TeamBak) == "" then
			
		elseif my_getmissions(self.m_sCamp1TeamBak) == "" then
			szInfo = my_getmissions(self.m_sCamp2TeamBak).."Tr薾 n祔 tr鑞g, tr鵦 ti誴 v祇 hi謕 sau\n"
		elseif my_getmissions(self.m_sCamp2TeamBak) == "" then
			szInfo = my_getmissions(self.m_sCamp1TeamBak).."Tr薾 n祔 tr鑞g, tr鵦 ti誴 v祇 hi謕 sau\n"
		else
			if my_getmissions(self.m_sCamp1Team) == "" and my_getmissions(self.m_sCamp2Team) == "" then
				szInfo = "Bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v? bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> c飊g r阨 tr薾, ra kh醝 tr薾 L玦 i n祔\n"
			elseif my_getmissions(self.m_sCamp1Team) == "" then
				szInfo = "Bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v? bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr薾 u, bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2Team).."<color> cu鑙 c飊g  th緉g\n"
			elseif my_getmissions(self.m_sCamp2Team) == "" then
				szInfo = "Bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v? bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr薾 u, bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1Team).."<color> cu鑙 c飊g  th緉g\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 1) == 0 and GetMSPlayerCount(ARENA_MISSION_ID, 2) == 0 then
				szInfo = "Bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v? bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> u kh玭g v祇 u trng thi u\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 1) == 0 then
				szInfo = "Bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v? bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr薾 u, bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1Team).."<color> kh玭g v祇 u trng thi u\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 2) == 0 then
				szInfo = "Bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v? bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr薾 u, bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2Team).."<color> kh玭g v祇 u trng thi u\n"
			else
				szInfo = "Bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v? bang h閕 <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> 產ng h錳 k辌h li謙\n"
			end
		end
		self:ReSetSubWorld()
		return szInfo
	end,
	
	NotifyMsg = function(self, szPreMsg, nEndStep, nNowStep)
		-- 注意:ARENA_TIME_SEC必须能被10整除,否则这些提示条件都不成立
		local nAllSec = ((nEndStep - nNowStep) * ARENA_TIME_SEC)
		local nMin = floor(nAllSec / 60)
		local nSec = mod(nAllSec, 60)
		
		if nMin > 1 and nSec == 0 then		-- 大于1分钟则1分钟一报
			Msg2MSAll(GetMissionV(self.m_nMissionID), szPreMsg..nMin.." Ph髏 ")
		elseif nMin == 0 and mod(nSec, 10) == 0 then	-- 小于1分钟则10秒一报
			Msg2MSAll(GetMissionV(self.m_nMissionID), szPreMsg..nSec.." Gi﹜ ")
		end
	end,
	
}

KMissionRecordRoom = inherit(KMissionRoom, KMissionRecordAppend)
KMissionArenaRoom = inherit(KMissionRoom, KMissionArenaAppend)
