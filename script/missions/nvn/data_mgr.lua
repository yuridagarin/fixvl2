Include("\\script\\lib\\sdb.lua")

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
SDBKEY_RANK_GLOBAL = "XVX_RANK_GLOBAL";
--nKey = 0, 0		-- ��������
----sdb data end---------------------------------------

----sdb data-------------------------------------------
SDBKEY_RANK_LOCAL = "XVX_RANK_LOCAL";
--nKey = 0, 0		-- ��������
----sdb data end---------------------------------------

----sdb data-------------------------------------------
SDBKEY_3V3_FIGHTTEAM_RANK = " _3V3_FT_RANK";
--nKey = 0, 0		-- ս����������
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_RANK = " _3v3_Match_Rank";
--nKey = 0, nMatchRound
--	Item[i] = {"fsfsfs...", FightTeamID, FightTeamName,...}
----sdb data-------------------------------------------
SDBKEY_3V3_MATCH_AWARD = " _3V3_MATCH_AWARD";
--nKey = 0, nMatchRound		-- ս����������
--	Item[Name] = {"d", nRank}
----sdb data end---------------------------------------

PRELIMINARY_TEAM_PER_GROUP = 20


SDBKEY = {
	BattleDate = {SDBKEY_3V3, 0, 0, 2, 3600},	--����ʱ��
	GlobalMatchRound = {SDBKEY_3V3, 2, 0, 2, 1200},--����������
	LocalMatchRound = {SDBKEY_3V3, 2, 0, 0, 1200}, --Դ���������
	GlobalRank = {SDBKEY_RANK_GLOBAL, 0, 0, 2, 1200},
	LocalRank = {SDBKEY_RANK_LOCAL, 0, 0, 0, 1200},
	SDBKEY_RANK_LOCAL_LASTWEEK = {SDBKEY_RANK_LOCAL_LASTWEEK, 0, 0, 0, 3600},
	FIGHTTEAM_RANK  = {SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0, 0, 3600},
	FIGHTTEAM_RANK2  = {SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0, 0, 3600},
	FINALS_TEAMS = {SDBKEY_3V3, 3, 1, 2, 3600},
	FINALS_TEAMS2 = {SDBKEY_3V3, 3, 1, 2, 3600},
	MATCH_RANK = {SDBKEY_3V3_MATCH_RANK, 0, -1, 2, 3600},
	MATCH_AWARD = {SDBKEY_3V3_MATCH_AWARD, 0, -1, 2, 3600},
}

g_3v3DataMgr = DataMgr();
g_3v3DataMgr:Init(SDBKEY);

--print(Val2Str(g_3v3DataMgr))
--g_3v3DataMgr:getData("BattleData", print)
