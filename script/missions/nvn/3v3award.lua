Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3.lua")
--Include("\\script\\mail\\mail_head.lua");


function sendMail(szTo, szFrom, szTitle, szContent, script, check)
	local tMailInfo = 
	{
		szTo				= szTo,
		szFrom				= szFrom,		-- 32 char
		szTitle				= szTitle,
		byPRI				= eMAIL_PRI_HIGH,
	};
	local tMailAttachmentInfo = 
	{
		{
			nType		= eMAIL_ATTACHMENT_T_TEXT,
			szContent	= szContent,
		},
		{
			nType		= eMAIL_ATTACHMENT_T_SCRIPT,
			szContent	= script,
		},
	};

	local tMailConditionInfo = 
	{
		{
			nType		= eMAIL_CONDIFION_T_TAKEOUT,
			szContent	= check,
		},
	};
	nRet, guid = SendOneMail(tMailInfo, tMailAttachmentInfo, tMailConditionInfo);
	WriteLog(format("[Mail %s] [%s] [GGUID:%d from:%s to:%s title:%s] [Con:%s Scr:%s Chk:%s]", 
		(nRet >= 1 and "Success") or "Failed", szTitle,
		guid, szFrom, tMailInfo.szTo, szTitle, szContent, script, check));
	return nRet;
end

g_3v3MatchAward = {
	2500,
	2400,
	2300,
	2200,
	2100,
	2000,
	1900,
	1800,
	1700,
	1600,
	1500,
	1400,
	1300,
	1200,
	1100,
	1000,
	900 ,
	800 ,
	700 ,
	600 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
	300 ,
}

SDBKEY_3V3 = " _3V3_DATA_";
SDBKEY_RANK_LOCAL = "XVX_RANK_LOCAL";
SDBKEY_RANK_LOCAL_LASTWEEK = "XVX_RANK_LOCAL_LASTWEEK";


function OnMatchRankAward(nCount, data)
	if gf_TodayDate() >= 20130116 and gf_TodayDate() <= 20130201 then
		return
	end
	if not data then
		return SDBCallBack(SDBKEY_RANK_LOCAL, 0, 0, OnMatchRankAward);
	end
	nCount = min(nCount, 30);

	local g_szContent = 
[[尊敬的玩家：
    您好，恭喜您在比武大会联赛上个赛季中获得本服第%d名，请点击附件接受奖励。

                       比武大会联赛官方
]]
	for i = 0, nCount - 1 do
		local szContent = format(g_szContent, i + 1);
		local szTo = data[i][1];
		local script = format("gf_AdditemEx({2,95,1511,%d}, 'u Ph竎h L謓h');", g_3v3MatchAward[i+1] or 250);
		sendMail(szTo, "Quan Li猲 u Чi H閕 T? V?", "Ph莕 thng qu? li猲 u Чi H閕 T? V?", szContent, script, "check_room_1");
	end	
end

function on3V3AwardTimer()
	DebugOutput("on3V3AwardTimer")
	if GetGSIndex()[0] == 1 then
		SDBCallBack(SDBKEY_3V3, 2, 0, update3v3MatchRank)
--	else
--		Msg2Player("请在汴京执行此操作，奖励发放失败");
	end
end

function update3v3MatchRank(nCount, s)
	DebugOutput("update3v3MatchRank", nCount, s)
	local nRound, bAwarded = 0, 0
	if nCount > 0 then
		local tData = s["LocalMatchRound"];
		nRound, bAwarded = tData[1] or 0, tData[2] or 0;
	end
	local s = SDB(SDBKEY_3V3, 2, 0, 2)
	DebugOutput(format("Qu? hi謓 t筰: %d", nRound));
	s:apply2(callout(update3v3MatchRankCB2, nRound, bAwarded));
end

function update3v3MatchRankCB2(nRound, bAwarded, nCount, s)
	DebugOutput("update3v3MatchRankCB2",nRound, bAwarded, nCount, s)
	if nCount <= 0 then
		DebugOutput("Kh玭g c? s? li謚 to祅 cu閏, ph竧 thng th蕋 b筰");
		return
	end
	local tData = s["GlobalMatchRound"];
	DebugOutput("GlobalMatchRound =",tData[1])
	local nGlbMatchRound = tData[1] or 0;
	if nRound < nGlbMatchRound then
		local localSDB = SDB(SDBKEY_3V3, 2, 0);
		localSDB["LocalMatchRound"] = {"dd", nGlbMatchRound, 1};
		DebugOutput(format("To祅 cu閏 u qu?: %d", nGlbMatchRound));
--		OnMatchRankAward();
		local s = SDB(SDBKEY_RANK_LOCAL, 0, 0);
		s:delete();
		local s = SDB(SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0);
		s:delete();
		local msg = "Li猲 u Чi H閕 T? V? 3V3 s? m? gi秈 u qu? m韎 v祇 10 gi? s竛g h玬 nay, xin c竎 i hi謕 ng nh藀 l筰 game trc khi m? gi秈 u qu? m韎,  m b秓 x誴 h祅g qu? trc b譶h thng!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
		--ReloadAllScript(); --由于执行了跨赛季，缓存还存在，我勒个去
	end
end
