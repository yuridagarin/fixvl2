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
[[�𾴵���ң�
    ���ã���ϲ���ڱ����������ϸ������л�ñ�����%d���������������ܽ�����

                       �����������ٷ�
]]
	for i = 0, nCount - 1 do
		local szContent = format(g_szContent, i + 1);
		local szTo = data[i][1];
		local script = format("gf_AdditemEx({2,95,1511,%d}, '��u Ph�ch L�nh');", g_3v3MatchAward[i+1] or 250);
		sendMail(szTo, "Quan Li�n ��u ��i H�i T� V�", "Ph�n th��ng qu� li�n ��u ��i H�i T� V�", szContent, script, "check_room_1");
	end	
end

function on3V3AwardTimer()
	DebugOutput("on3V3AwardTimer")
	if GetGSIndex()[0] == 1 then
		SDBCallBack(SDBKEY_3V3, 2, 0, update3v3MatchRank)
--	else
--		Msg2Player("�����꾩ִ�д˲�������������ʧ��");
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
		DebugOutput(format("To�n cu�c ��u qu�: %d", nGlbMatchRound));
--		OnMatchRankAward();
		local s = SDB(SDBKEY_RANK_LOCAL, 0, 0);
		s:delete();
		local s = SDB(SDBKEY_3V3_FIGHTTEAM_RANK, 0, 0);
		s:delete();
		local msg = "Li�n ��u ��i H�i T� V� 3V3 s� m� gi�i ��u qu� m�i v�o 10 gi� s�ng h�m nay, xin c�c ��i hi�p ��ng nh�p l�i game tr��c khi m� gi�i ��u qu� m�i, �� ��m b�o x�p h�ng qu� tr��c b�nh th��ng!"
		Msg2Global(msg);
		AddGlobalNews(msg, 1);
		--ReloadAllScript(); --����ִ���˿����������滹���ڣ����ո�ȥ
	end
end
