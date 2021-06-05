Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\missions\\nvn\\battle\\battle_head.lua")
Include("\\script\\lib\\floyd.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\global\\xvx_callback.lua")

thisCBFile = "\\script\\missions\\nvn\\3v3.lua";

MATCH_CYCLE_TIME = 27
MAX_ROUND_DAILY = 12
WARTEAM_SIZE = 3
SIFT_LOSE_COUNT = 2
FINALS_TEAM_COUNT = 32

BS_REST = 0
BS_DAYMATCH = 1
BS_PRELIMINARY = 2
BS_FINALS = 3
----sdb data-------------------------------------------
SDBKEY_3V3 = " _3V3_DATA_";
--nkey = 0, 0		-- ��������
--  Item["BattleDate"] = {"ddddd", self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
--			PreLiminaryFinish or 0, FinalsFinish or 0, nMatchRound or 1}
--nKey = 1, gsId	-- ÿ�ճ�������
--	Item["DailyData"] = {"dd", gf_TodayDate(), nRound};
--nkey = 2, 0		-- ����
--	Item["GlobalMatchRound"] = {"dd", nMatchRound, 0};
--nkey = 3, 1		-- ��������
--	Item[i] = {"s", tTeams[i].name};

----sdb data-------------------------------------------
SDBKEY_RANK_LOCAL = "XVX_RANK_LOCAL";
SDBKEY_RANK_GLOBAL = "XVX_RANK_GLOBAL";
SDBKEY_RANK_LOCAL_COPY = "XVX_RANK_LOCAL_COPY";
SDBKEY_RANK_GLOBAL_COPY = "XVX_RANK_GLOBAL_COPY";
--nKey = 0, 0		-- ��������
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_RANK = " _3v3_Match_Rank";
--nKey = 0, nMatchRound
--	Item[i] = {"fsfsfs...", FightTeamID, FightTeamName,...}
----sdb data-------------------------------------------
SDBKEY_3V3_FIGHTTEAM_RANK = " _3V3_FT_RANK";
--nKey = 0, 0		-- ս����������
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_AWARD = " _3V3_MATCH_AWARD";
--nKey = 0, nMatchRound
--	Item[Name] = {"d", nRank}
----sdb data end---------------------------------------

g_t3v3Data = {}

K3v3Hall = {
	SetBattleState = P3v3_SetBattleState,
	SetProgress = P3v3_SetProgress,
	SetTimer = P3v3_SetTimer,
}

DayMatch = {}

Preliminary = {
	tLoser = {},
}

Finals = {
	tMatchList = {
		01,32,16,17,09,24,08,25,05,28,12,21,13,20,04,29,
		02,31,15,18,10,23,07,26,06,27,11,22,14,19,03,30,
	},
}


-- DailyCleaner & K3v3Hall::Init
function OnInit()
	DebugOutput("3v3 OnInit--->")
--	SendGlbDBData(2, 
--[[CREATE TABLE IF NOT EXISTS `XvX_FightTeam_Rank` (
--	`TeamName` CHAR(64) NOT NULL, 
--	`LeaderName` CHAR(64),
--	`Score` INTEGER(11), 
--	PRIMARY KEY  (`TeamName`))]]);
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		SDBCallBack(SDBKEY_3V3, 0, 0, cbGetData);
	end
end

function cbGetData(nCount, sdbData)
	DebugOutput("cbGetData",CALL_SCRIPT_NAME)
	DebugOutput("cbGetData",nCount, sdbData)
	local tdata = {}
	if nCount > 0 then
		tdata = sdbData["BattleDate"];
	end
	DebugOutput("Th�i gian h�a s� li�u",Val2Str(tdata));
	g_t3v3Data:Init(tdata)
end

function g_t3v3Data:Init(tData)
	local today = Date();
	DebugOutput("today =", Val2Str(today))
	----------------------
	self:resetDate(tData);	
	DebugOutput("dateMatchStart =", Val2Str(self.dateMatchStart))
	DebugOutput("datePreLiminary =", Val2Str(self.datePreLiminary))
	DebugOutput("dateFinals =", Val2Str(self.dateFinals))
	if today >= self.datePreLiminary and self.PreLiminaryFinish < 1 then
		self.battleState = BS_PRELIMINARY;
	elseif today >= self.dateFinals and self.FinalsFinish < 1 then
		if today:week() ~= 0 and today:week() ~= 6 then
			self.battleState = BS_REST;
		else
			self.battleState = BS_FINALS;
		end
	elseif today >= self.datePreLiminary then
		self.battleState = BS_REST;
	elseif today >= self.dateMatchStart then
		self.battleState = BS_DAYMATCH;
	else
		self.battleState = BS_REST;
	end
	K3v3Hall.SetBattleState(self.battleState);
	if self.battleState ~= BS_REST then
		SetStartTime();
	else
		SetStartTime(1);
	end
	if self.battleState == BS_DAYMATCH then
		CurProgress = today - self.dateMatchStart + 1;
		DebugOutput("CurProgress, self.nDay_Match",CurProgress, self.nDay_Match)
		K3v3Hall.SetProgress(CurProgress, self.nDay_Match);
	elseif self.battleState == BS_REST then
		DebugOutput("today:week(), self.nDay_Rest",today:week(), self.nDay_Rest)
		K3v3Hall.SetProgress(today:week(), self.nDay_Rest);
	end
	DebugOutput("===========================>")
	DebugOutput("L�ch thi ��u:",Val2Str(self))
	DebugOutput("===========================<")

	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		if self.battleState == BS_FINALS then
			Finals.Init();
		elseif self.battleState == BS_DAYMATCH then
			DayMatch:Init();
		end
	end
end

function g_t3v3Data:resetDate(tData)
	tData = tData or {}
	local ndateMatchStart, ndateFinal, PreLiminaryFinish, FinalsFinish, nMatchRound = tData[1], tData[2], tData[3] or 0, tData[4] or 0, tData[5] or 1;
	DebugOutput("Th�i gian h�a s� li�u",ndateMatchStart, ndateFinal, PreLiminaryFinish, FinalsFinish, nMatchRound);
	local today = Date();
	
	--��������1
	if ndateMatchStart and ndateFinal then
		local dateMatchStart = ndateMatchStart and nDate2Date(ndateMatchStart);
		DebugOutput("dateMatchStart =", Val2Str(dateMatchStart));
		local dateFinal = ndateFinal and nDate2Date(ndateFinal);
		DebugOutput("dateFinal = ", Val2Str(dateFinal));
		
		--�Ƿ�ǿ�ƿ�����
		if today > dateFinal and FinalsFinish < 1  then
			DebugOutput("C��ng ch� l�ch tr�nh li�n ��u")
			FinalsFinish = 1;
		end
			
		if FinalsFinish > 0 then					--������1.1
			DebugOutput("T�i thi�t l�ch thi li�n ��u");
			nMatchRound = nMatchRound + 1;
			if not self:MatchProcess(nMatchRound) then
				return
			end
			self.nMatchRound = nMatchRound;
			self.PreLiminaryFinish = 0;
			self.FinalsFinish = 0;
			self.nDay_Rest =  dateFinal:week();
			if self.nDay_Rest ~= 0 then 
				self.nDay_Rest = 7 - dateFinal:week();
			end
			self.dateMatchStart = dateFinal + self.nDay_Rest + 1;
			self.dateFinals = self.dateFinals or (self.dateMatchStart + MATCH_CYCLE_TIME - 1);
			self.datePreLiminary = self.dateFinals - 1;
			self.nDay_Match = self.dateFinals - self.dateMatchStart + 1;
			
			local s = SDB(SDBKEY_3V3, 0, 0);
			--�������Ƕ�GS������������Ҫ�޶�һ��GSִ��
			--if GetGSIndex()[0] == 1 then
			DebugOutput("T�i thi�t l�ch ��u:",self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
				self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1);
			s["BattleDate"] = {"ddddd", self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
				self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1};
			--end
			--ȫ���������ݿ����
			_CrossMatchCopyDatabase(SDBKEY_RANK_GLOBAL, SDBKEY_RANK_GLOBAL_COPY);
			
			local msg = "Li�n ��u ��i H�i T� V� 3V3 s� m� gi�i ��u qu� m�i v�o 10 gi� s�ng h�m nay, xin c�c ��i hi�p ��ng nh�p l�i game tr��c khi m� gi�i ��u qu� m�i, �� ��m b�o x�p h�ng qu� tr��c b�nh th��ng!"
			Msg2Global(msg);
			AddGlobalNews(msg, 1);
		else											--���磬��ʼ������1.2
			DebugOutput("T�i thi�t l�ch thi li�n ��u".."-NOT");
			self.nMatchRound = nMatchRound;
			self.PreLiminaryFinish = PreLiminaryFinish;
			self.FinalsFinish = FinalsFinish;
			self.nDay_Rest = 0;
			self.dateMatchStart = dateMatchStart;
			self.dateFinals = dateFinal;
			self.datePreLiminary = dateFinal - 1;
			self.nDay_Match = dateFinal - dateMatchStart + 1;
		end
	--��û����2
	else
		DebugOutput("***Init Match***");
		nMatchRound = nMatchRound;
		if not self:MatchProcess(nMatchRound) then
			return
		end
		self.nMatchRound = nMatchRound;
		self.PreLiminaryFinish = 0;
		self.FinalsFinish = 0;
		local dateFinal = today - 1;
		self.nDay_Rest =  dateFinal:week();
		if self.nDay_Rest ~= 0 then 
			self.nDay_Rest = 7 - dateFinal:week();
		end
		self.dateMatchStart = dateFinal + self.nDay_Rest + 1;
		self.dateFinals = self.dateFinals or (self.dateMatchStart + MATCH_CYCLE_TIME - 1);
		self.datePreLiminary = self.dateFinals - 1;
		self.nDay_Match = self.dateFinals - self.dateMatchStart + 1;
		
		local s = SDB(SDBKEY_3V3, 0, 0);
		--�������Ƕ�GS������������Ҫ�޶�һ��GSִ��
		--if GetGSIndex()[0] == 1 then
		DebugOutput("T�i thi�t l�ch ��u:",self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
			self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1);
		s["BattleDate"] = {"ddddd", self.dateMatchStart:tonumber(), self.dateFinals:tonumber(), 
			self.PreLiminaryFinish or 0, self.FinalsFinish or 0, self.nMatchRound or 1};
		--end
		--ȫ���������ݿ����
		_CrossMatchCopyDatabase(SDBKEY_RANK_GLOBAL, SDBKEY_RANK_GLOBAL_COPY);
	end
end

function g_t3v3Data:MatchProcess(nMatchRound)
	local s = SDB(SDBKEY_3V3, 2, 0)
	s["GlobalMatchRound"] = {"dd", nMatchRound, 0};
	return 1;
end

function SetStartTime(bTodayOver)
	local nHour, nMinute, nSecond = tonumber(date("%H")), tonumber(date("%M")), tonumber(date("%S"));
	--����ʱ��(����)
	local nStart = 21;
	local nEnd = 22;
	if bTodayOver == 1 or (nHour >= nEnd and nMinute >= 30) then
		nHour = nStart - nHour - 1 + 24;
		nMinute = 59 - nMinute;
		nSecond = 60 - nSecond;
	elseif nHour < nStart then
		nHour = nStart - nHour - 1;
		nMinute = 59 - nMinute;
		nSecond = 60 - nSecond;
	else
		nHour = 0;
		nMinute = 5 - mod(nMinute, 5);
		nSecond = 60 - nSecond;
	end
	local nTime = nHour * 3600 + nMinute * 60 + nSecond;
	DebugOutput(format("[3v3 init] v�o l�c %d gi� %d ph�t %d gi�y (%d gi�y) sau khi m�!",nHour, nMinute, nSecond, nTime));
	K3v3Hall.SetTimer(nTime * 18);
end

function GetRoundToday(cb)
	if g_nTodayRoundDate ~= gf_TodayDate() or not g_nTodayRound then
		local gsId = GetGSIndex()[0];
		SDBCallBack(SDBKEY_3V3, 1, gsId, callout(GetRoundTodayCB, cb));
		return
	end
	return g_nTodayRound;
end

function GetRoundTodayCB(cb, nCount, sdbData)
	DebugOutput(nCount, sdbData)
	local tData = sdbData["DailyData"];
	local ndate, nRound = tData[1], tData[2];
	if ndate ~= gf_TodayDate() then
		nRound = 0;
		sdbData["DailyData"] = {"dd", gf_TodayDate(), nRound};
	end
	g_nTodayRound = nRound;
	g_nTodayRoundDate = gf_TodayDate();
	cb(nRound);	
end

function SetRoundToday(nCount)
	local gsId = GetGSIndex()[0];
	local sdbData = SDB(SDBKEY_3V3, 1, gsId);
	sdbData["DailyData"] = {"dd", gf_TodayDate(), nCount};
	g_nTodayRound = nCount;
	g_nTodayRoundDate = gf_TodayDate();
end

--��ɫ������
function _3v3_CrossMatchRetsetPlayerTask(nCount, data)
	local nMapId, nX, nY = GetWorldPos();
	local nVersion, nCurGs = GetRealmType();
	if nCurGs == 0 and nMapId == 200 then
		DebugOutput("_3v3_CrossMatchRetsetPlayerTask", nCount, data);
		if not nCount then
			return g_3v3DataMgr:getData("LocalMatchRound", _3v3_CrossMatchRetsetPlayerTask);
		end
		local nCurMatchRound = data["LocalMatchRound"][1] or 0;
		DebugOutput("nCurMatchRound , GetTask(TASKID_3V3_MATCH_ROUND)", nCurMatchRound, GetTask(TASKID_3V3_MATCH_ROUND));
		if GetTask(TASKID_3V3_MATCH_ROUND) < nCurMatchRound then
			DebugOutput("_3v3_CrossMatchRetsetPlayerTask -------> YES");
			local lastScore = GetTask(TASKID_3V3_SCORE_TOTAL);
			local historyScore = GetTask(TASKID_3V3_MAX_SCORE_HISTORY);
			SetTask(TASKID_3V3_BATTLE_SCORE, 0);		-- Rank��
			SetTask(TASKID_3V3_VIC_RATE, 0);		-- ʤ�� = ��ʤ�� / �ܳ�
			SetTask(TASKID_3V3_SCORE_TOTAL, 0);		-- ��������
			SetTask(TASKID_3V3_SCORE_LAST, lastScore);		-- ����������
			SetTask(TASKID_3V3_MAX_SCORE_HISTORY, max(lastScore, historyScore));		-- ��ʷ��߻���
			SetTask(TASKID_3V3_WIN_ROUND_MATCH, 0);		-- ������ʤ��
			SetTask(TASKID_3V3_WIN_ROUND_TOTAL, 0);
			SetTask(TASKID_3V3_TOTAL_ROUND_MATCH, 0);		-- �����ܳ�
			SetTask(TASKID_3V3_TOTAL_ROUND, 0); -- �ܳ���
			SetTask(TASKID_3V3_KILL_TOTAL, 0);
			SetTask(TASKID_3V3_DEAD_TOTAL, 0);
			SetTask(TASKID_3V3_KILL_MATCH, 0);		-- ������ͷ
			SetTask(TASKID_3V3_DEAD_MATCH, 0);		-- ��������
			SetTask(TASKID_3V3_BATTLE_POWER, 0);		-- ս���� = rank����*1.5+ʤ��*3000*(�ܳ�/(�ܳ�+10))+min(��ʤ��*1, 3000)
			SetTask(TASKID_3V3_ESCAPE_MATCH, 0);		-- ������Ŷ��
			SetTask(TASKID_3V3_ESCAPE_TOTAL, 0);
			SetTask(TASKID_3V3_LOSE_ROUND_MATCH, 0);
			SetTask(TASKID_3V3_MATCH_ROUND, nCurMatchRound);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_TOTAL	, 0);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE, 0);	-- ս�ӻ���
			local lastDay = GetTask(TASKID_3V3_AWARD_DAILY_DATE);
			if lastDay < gf_TodayDate() then
				SetTask(TASKID_3V3_WIN_ROUND_DAILY, 0);
				SetTask(TASKID_3V3_AWARD_DAILY_DATE, gf_TodayDate());
			end
			--����������----
			gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 3, 1);
			gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 4, 1);
			----------------
			WriteLog(format("[3V3 PassMatch] [Role:%s Acc:%s] [lastScore=%d, newMatchRound=%d]",
				GetName(), GetAccount(), lastScore, nCurMatchRound));
		elseif GetTask(TASKID_3V3_MATCH_ROUND) > nCurMatchRound then
			DebugOutput("_3v3_CrossMatchRetsetPlayerTask -------> season exception");
			local myMatchRound = GetTask(TASKID_3V3_MATCH_ROUND);
			SetTask(TASKID_3V3_BATTLE_SCORE, 0);		-- Rank��
			SetTask(TASKID_3V3_VIC_RATE, 0);		-- ʤ�� = ��ʤ�� / �ܳ�
			SetTask(TASKID_3V3_SCORE_TOTAL, 0);		-- ��������
			SetTask(TASKID_3V3_SCORE_LAST, 0);		-- ����������
			SetTask(TASKID_3V3_MAX_SCORE_HISTORY, 0);		-- ��ʷ��߻���
			SetTask(TASKID_3V3_WIN_ROUND_MATCH, 0);		-- ������ʤ��
			SetTask(TASKID_3V3_WIN_ROUND_TOTAL, 0);
			SetTask(TASKID_3V3_TOTAL_ROUND_MATCH, 0);		-- �����ܳ�
			SetTask(TASKID_3V3_TOTAL_ROUND, 0); -- �ܳ���
			SetTask(TASKID_3V3_KILL_TOTAL, 0);
			SetTask(TASKID_3V3_DEAD_TOTAL, 0);
			SetTask(TASKID_3V3_KILL_MATCH, 0);		-- ������ͷ
			SetTask(TASKID_3V3_DEAD_MATCH, 0);		-- ��������
			SetTask(TASKID_3V3_BATTLE_POWER, 0);		-- ս���� = rank����*1.5+ʤ��*3000*(�ܳ�/(�ܳ�+10))+min(��ʤ��*1, 3000)
			SetTask(TASKID_3V3_ESCAPE_MATCH, 0);		-- ������Ŷ��
			SetTask(TASKID_3V3_ESCAPE_TOTAL, 0);
			SetTask(TASKID_3V3_LOSE_ROUND_MATCH, 0);
			SetTask(TASKID_3V3_MATCH_ROUND, nCurMatchRound);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_TOTAL	, 0);
			SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED	, 0);
			SetTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE, 0);	-- ս�ӻ���
			local lastDay = GetTask(TASKID_3V3_AWARD_DAILY_DATE);
			if lastDay < gf_TodayDate() then
				SetTask(TASKID_3V3_WIN_ROUND_DAILY, 0);
				SetTask(TASKID_3V3_AWARD_DAILY_DATE, gf_TodayDate());
			end
			--��������
			local nLastRank = GetTask(TASKID_LAST_MATCH_RANK);
			local nCurRank = GetTask(TASKID_CUR_MATCH_RANK);
			SetTask(TASKID_LAST_MATCH_RANK, 0);
			SetTask(TASKID_CUR_MATCH_RANK, 0);
			--������¼����
			SetTask(TASKID_3V3_LASTWEEK_FIGHT_TIMES, 0); --����ս������
			SetTask(TASKID_3V3_WEEK_FIGHT_TIMES, 0); --����ս������
			SetTask(TASKID_3V3_AWARD_TAG, 0); 			--�콱�������
			Msg2Player("S� li�u 3v3 kh�c th��ng, �� reset")
			local msg = format("[3V3 ERROR] [season exception] [Role:%s Acc:%s] [myMatchRound=%d, curMatchRound = %d, last rank value=%d, cur rank value=%d]",
				GetName(), GetAccount(), myMatchRound, nCurMatchRound, nLastRank, nCurRank);
			DebugOutput(msg);
			WriteLog(msg);
		end
	end
	--����������(�����ڿ�������֮��)����Ҫ��������
	DebugOutput("_3v3_CrossMatchRetsetPlayerTask -------> tag =", gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 3), gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 4))
	Update3v3RankData(gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 3));
end

--ÿ��3v3����
function _3v3_every_match_award()
	local nExp = GetTask(TASKID_3V3_EVERY_MATCH_EXP);
	local nYinJuan = GetTask(TASKID_3V3_EVERY_MATCH_YINJUAN);
	DebugOutput("_3v3_every_match_award",nExp, nYinJuan)
	if nExp > 0 then
		SetTask(TASKID_3V3_EVERY_MATCH_EXP, 0);
		gf_ModifyExp(nExp);
	end
	if nYinJuan > 0 then
		SetTask(TASKID_3V3_EVERY_MATCH_YINJUAN, 0);
		ModifyYinJuan(nYinJuan, 1);
	end
end

--Դ��������
--ɾ���������ݿ�
function _3v3_System_Task()
	DebugOutput("_3v3_System_Task")
	if GetGSIndex()[0] == 2 then
		SDBCallBack(SDBKEY_3V3, 2, 0, update3v3MatchRank)
	end
end

function update3v3MatchRank(nCount, s)
	DebugOutput("update3v3MatchRank", nCount, s)
	local nRound, bAwarded = 1, 0
	if nCount > 0 then
		local tData = s["LocalMatchRound"];
		nRound, bAwarded = tData[1] or 1, tData[2] or 0;
	end
	local s = SDB(SDBKEY_3V3, 2, 0, 2)
	DebugOutput(format("Qu� hi�n t�i: %d", nRound));
	s:apply2(callout(update3v3MatchRankCB2, nRound, bAwarded));
end

function update3v3MatchRankCB2(nRound, bAwarded, nCount, s)
	DebugOutput("update3v3MatchRankCB2",nRound, bAwarded, nCount, s)
	if nCount <= 0 then
		DebugOutput("Kh�ng c� s� li�u to�n cu�c, ph�t th��ng th�t b�i");
		return
	end
	local tData = s["GlobalMatchRound"];
	DebugOutput("GlobalMatchRound =",tData[1])
	local nGlbMatchRound = tData[1] or 0;
	if nRound < nGlbMatchRound then
		local localSDB = SDB(SDBKEY_3V3, 2, 0);
		localSDB["LocalMatchRound"] = {"dd", nGlbMatchRound, 1};
		localSDB:reflash();
		DebugOutput(format("To�n cu�c ��u qu�: %d", nGlbMatchRound));
		_CrossMatchCopyDatabase(SDBKEY_RANK_LOCAL, SDBKEY_RANK_LOCAL_COPY);
	end
end

--Դ����������Ϣ
function _3v3_System_Task_Msg()
	DebugOutput("_3v3_System_Task_Msg")
	if GetGSIndex()[0] == 2 then
		SDBCallBack(SDBKEY_3V3, 2, 0, update3v3MatchRank_Msg)
	end
end

function update3v3MatchRank_Msg(nCount, s)
	DebugOutput("update3v3MatchRank_Msg", nCount, s)
	local nRound, bAwarded = 1, 0
	if nCount > 0 then
		local tData = s["LocalMatchRound"];
		nRound, bAwarded = tData[1] or 1, tData[2] or 0;
	end
	DebugOutput("nRound, bAwarded =", nRound, bAwarded)
	if bAwarded == 1 then
		local msg = "��i h�i t� v� 3 v 3 �� �i ��n qu� ��u m�i!"
		msg = msg.."Gamer c� th� �i b�n �� Bi�n Kinh ��i m�i x�p h�ng 3v3 qu� tr��c v� nh�n th��ng."
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
		local localSDB = SDB(SDBKEY_3V3, 2, 0);
		localSDB["LocalMatchRound"] = {"dd", nRound, 0};
		localSDB:reflash();
		--����Core��������
		OnArrive_LocalRank();
		OnArrive_GlobalRank();
	end
end

--SDBKEY_RANK_GLOBAL_COPY
function _CrossMatchCopyDatabase(szKey, szKeyCopy)
	--ɾ����ǰ�ı�������
	local sdbRankCopy = SDB(szKeyCopy, 0, 0);
	sdbRankCopy:delete();
	--��ǰ���ݿ⿽��
	local sdbRank = SDB(szKey, 0, 0);
	sdbRank:apply2(callout(_CrossMatchCopyDatabaseCB, szKey, szKeyCopy));
end

function _CrossMatchCopyDatabaseCB(szKey, szKeyCopy, nCount, sdb)
	DebugOutput("_CrossMatchCopyDatabaseCB nCount, sdb =",nCount, sdb);
	if nCount <= 0 then
		DebugOutput("_CrossMatchCopyDatabaseCB nCount <= 0 return 0");
		return 0;
	end
	--��������
	local sdbCopy = SDB(szKeyCopy, 0, 0);
	sdbCopy.sortType = 2;
	--copy
	local nSum = 0;
	for i = 0, nCount - 1 do
		local tData = sdb[i];
		if tData and tData[1] then
			DebugOutput(tData[1], tData[2], tData[3], tData[4]);
			sdbCopy[tData[1]] = {"dds", tData[2], tData[3], tData[4]};
			nSum = nSum + 1;
		end
	end
	DebugOutput("_CrossMatchCopyDatabaseCB copy Sum = ", nSum);
	--������ɣ�ɾ������������ݿ⣬��ɿ�����
	local sdbOrg = SDB(szKey, 0, 0); 
	sdbOrg:delete();
	sdbOrg:reflash();
	DebugOutput("[3v3] [GGS] cross match ---------> seccussful!!!");
	WriteLog("[3v3] [GGS] cross match ---------> seccussful!!!");
end
