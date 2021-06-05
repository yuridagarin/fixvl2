Include("\\script\\system_switch_config.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3.lua")
Include("\\script\\lib\\itemfunctions.lua")
Include("\\script\\lib\\message.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\missions\\nvn\\data_mgr.lua")

function main()
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","T�nh n�ng n�y t�m th�i kh�ng m�");
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if 1 == nCurGs then
		main_ggs();
	else
		main_3v3();
	end	
end

function main_ggs()
	local tSel = {
		"\nTr� v� Bi�n Kinh/leave_3v3_map",
		"Kh�ng c� g�!/nothing",
	}
	Say(g_szInfoHead.."Tri�u ��nh �� h� ch�, chu�n b� ��i H�i T� V�, c�c anh h�ng h�o ki�t c� th� b�o danh tham gia. �� ki�m tra n�ng l�c c�a m�i ng��i ch�n ra nh�n s� c� v� ngh� cao c��ng.",
		getn(tSel), tSel);
end

function leave_3v3_map()
	ChangeGroupWorld(200,1391,2820);
end

function main_3v3()
	if Is3v3SystemOpen() ~= 1 then
		Talk(1,"","T�nh n�ng n�y t�m th�i kh�ng m�");
		return 0;
	end
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"",g_szInfoHead.."Th�t ng�i qu�, ng��i c�n ph�i gia nh�p m�n ph�i tr��c m�i c� th� b�o danh tham gia ��i H�i T� V� ���c.");
		return 0;
	end;
--	if GetLevel() < 80 then
--		Talk(1,"",g_szInfoHead.."���ĵȼ�����80���������ڽ����ж�����Щ�ɡ�");
--		return 0;
--	end
	g_3v3DataMgr:getData("BattleDate", updateMatchInfo);
end

function updateMatchInfo(nCount, tData, bUpdate)
	DebugOutput("updateMatchInfo",nCount,tData,bUpdate);
	if nCount and bUpdate then
		g_t3v3Data:Init(tData["BattleDate"]);
	end
	main_3v3_2();
end

function main_3v3_2()
	local tSel = {
		--"��ȡ��������/getAward_3v3",
		"H��ng d�n ��i H�i T� V�/info_3v3",
		--"����/main",
		"Kh�ng c� g�!/nothing",
	}
	--����Ԥѡ���;���
--	if g_t3v3Data.battleState == BS_PRELIMINARY then
--		tinsert(tSel, 1, "�μӱ���������Ԥѡ��/before_GLB_3v3_Goto_Preliminary");
--	elseif g_t3v3Data.battleState == BS_FINALS then
--		tinsert(tSel, 1, "�μӱ�������������/before_GLB_3v3_Goto_Finals");
--		tinsert(tSel, 2, "�鿴��������/seePerliminaryRank");
--	else
	if g_t3v3Data.battleState == BS_DAYMATCH then
		tinsert(tSel, 1, "V�o ��u tr��ng ��i H�i T� V�/before_GLB_3v3_Goto_Field");
		--tinsert(tSel, 2, "�鿴��������������/seeFinalMatchRank");
	else
		tinsert(tSel, 1, "Hi�n t�i kh�ng ph�i l� th�i gian thi ��u/main_3v3");
	end
	--tinsert(tSel, 3, "�鿴����ս������/seeMatchTeamRank");
	if TEST_MODAL == 1 then
		tinsert(tSel, getn(tSel), "TEST!!!/test");
	end
	Say(g_szInfoHead.."Tri�u ��nh �� h� ch�, chu�n b� ��i H�i T� V�, c�c anh h�ng h�o ki�t c� th� b�o danh tham gia. �� ki�m tra n�ng l�c c�a m�i ng��i ch�n ra nh�n s� c� v� ngh� cao c��ng.",
		getn(tSel), tSel);
end

function test()
	local tSel = {}
	if TEST_MODAL == 1 then
		tinsert(tSel, "Xem x�p h�ng tu�n tr��c/seeLastWeekRank");
		tinsert(tSel, "Ki�m tra ph�n th��ng qu�/xxxcheckMatchAward");
		tinsert(tSel, "Xem x�p h�ng qu�/seeLastMatchRank");
		tinsert(tSel, "�i ��n khu v�c ��u ng�y/#ChangeGroupWorld(8000,1393,2822,1)");
		tinsert(tSel, "�i ��n khu v�c chung k�t/#ChangeGroupWorld(8000,1393,2822,3)");
		tinsert(tSel, "tr� l�i/main_3v3")
	end
	Say(g_szInfoHead.."TEST!!!", getn(tSel), tSel);
end

function before_GLB_3v3_Goto_Field(nCount, data)
	if not nCount then
		return g_3v3DataMgr:getData("LocalMatchRound", before_GLB_3v3_Goto_Field);
	end

	if check_CGW() ~= 1 then return end
	GLB_3v3_Goto_Field()
end

function GLB_3v3_Goto_Field(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		local szInfo		= "Ng��i �� �i v�o ��i H�i T� V� li�n ��u 3v3";
		local strtab = {
			"Ta �� chu�n b� xong!			/#GLB_3v3_Goto_Field(1)",
			"tr� l�i/main",
			"K�t th�c ��i tho�i/nothing",
		};
		Say(g_szInfoHead..""..szInfo,
		getn(strtab),
		strtab)

		return
	end
	
	if 1 == _check_to_kuafu_condition() then
		--cdkey�
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(2)");	
		
		SetTask(TASKID_EXCHG_SVR_TAG, 1, TASK_ACCESS_CODE_EXGSVR);
		SetTask(TASKID_NEED_SYNC_REALM_DATA,1);
		ChangeGroupWorld(8000,1399,2847,1);
	end
end

function before_GLB_3v3_Goto_Preliminary(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FIGHTTEAM_RANK2", before_GLB_3v3_Goto_Preliminary)
	--	return Talk(1, "", g_szInfoHead.."ǰ����·��ͨ, ���Ժ�����");
	end
	if bUpdate then
		nCount = min(nCount, PRELIMINARY_TEAM_PER_GROUP);
		g_t3v3_PreliminaryTeams = {}
		for i = 1, nCount do
			local tFTInfo = tData[i-1];
			local name = tFTInfo[1];
			local aa,bb,strGbGroup,strTeamName = strfind(name,"(.-)*(.*)");
			local score = tFTInfo[2];
			local ftID = tFTInfo[3];
			DebugOutput(i, gf_UnPack(tFTInfo), strTeamName);
			g_t3v3_PreliminaryTeams[strTeamName] = ftID;
		end
	end
	DebugOutput(Val2Str(g_t3v3_PreliminaryTeams))
	if not g_t3v3_PreliminaryTeams then
		return Talk(1, "", "L�y danh s�ch v�ng lo�i b� l�i, hi�n t�i kh�ng th� �i v�o ��u tr��ng");
	end
	local ftName = GetFightTeamInfo();
	if not ftName or ftName == "" then
		return Talk(1, "", "Ng��i ch�a gia nh�p chi�n ��i, kh�ng th� tham gia v�ng lo�i");
	end
	if not g_t3v3_PreliminaryTeams[ftName] then
		return Talk(1, "", "Chi�n ��i c�a ng��i kh�ng c� t� c�ch tham gia v�ng lo�i, l�n sau h�y c� g�ng nh�");
	end
	GLB_3v3_Goto_Preliminary();
end

function GLB_3v3_Goto_Preliminary()
	if check_CGW() ~= 1 then return end
	ChangeGroupWorld(8000,1393,2822,3);
end

function before_GLB_3v3_Goto_Finals(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FINALS_TEAMS", before_GLB_3v3_Goto_Finals)
	--	return Talk(1, "", g_szInfoHead.."ǰ����·��ͨ, ���Ժ�����");
	end
	if bUpdate then
		g_t3v3_FinalsTeams = {}
		for i = 1, nCount do
			local tFTInfo = tData[i - 1];
			local name = tFTInfo[1];
			local ftID = tFTInfo[2];
			g_t3v3_FinalsTeams[ftID] = name;
			DebugOutput(ftID, name)
		end
	end
	DebugOutput(Val2Str(g_t3v3_FinalsTeams))
	if not g_t3v3_FinalsTeams or getn(g_t3v3_FinalsTeams) == 0 then
		return Talk(1, "", "L�y danh s�ch chung k�t b� l�i, hi�n t�i kh�ng th� �i v�o ��u tr��ng");
	end
	local ftID = GetFightTeamID();
	DebugOutput("my ftid=", ftID)
	if ftID == 0 then
		return Talk(1, "", "Ng��i ch�a gia nh�p chi�n ��i, kh�ng th� tham gia chung k�t");
	end
	if not g_t3v3_FinalsTeams[ftID] then
		return Talk(1, "", "Chi�n ��i c�a ng��i kh�ng c� t� c�ch tham gia chung k�t, l�n sau h�y c� g�ng nh�");
	end
	GLB_3v3_Goto_Finals()
end

function GLB_3v3_Goto_Finals()
	if check_CGW() ~= 1 then return end
	ChangeGroupWorld(8000,1393,2822,3);
end

function check_CGW()
	if 1 == TEST_MODAL then
		return 1;
	end
	local nTime = tonumber(date("%H%M"));
	if nTime < 2100 or nTime >= 2200 then
		Talk(1,"",g_szInfoHead..format("Hi�n nay kh�ng ph�i th�i gian li�n ��u c�a ��i H�i V� L�m, xin ��i hi�p ��n tham gia tr��c %s m�i ng�y.", "21:00-22:00"));
		return 0;
	end
	if gf_JudgeRoomWeight(15,100,"") == 0 then
		return 0;
	end;
	if GetPKValue() >= 10 then
		Talk(1,"",g_szInfoHead.."S�t � c�a ng��i qu� cao ( PK>=10), kh�ng th� �i v�o ��i H�i T� V�.");
		return 0;		
	end
	return 1;
end

g_tAward_3v3 = {
	--����	�ȼ�*�ȼ�*120*ʤ����
	{giveClause = function (nCount)
		gf_Modify("Exp", GetLevel() * GetLevel() * 120 * nCount);
	end},
	--���г�����Ϊ������	ʤ����*10
	{giveClause = function (nCount)
		ItemCreate.giveSeriesLowStone(nCount * 10)
	end},
	--�����񣨾�Ϊ������	ʤ����-9
	{giveClause = function (nCount)
		nCount = nCount - 9;
		if nCount > 0 then
			ItemCreate.giveSeriesHighStone(nCount)
		end
	end},
	--��ҵ����	ʤ����*150
	{giveClause = function (nCount)
		gf_Modify("SYJY", nCount * 150);
	end},		
	--PVP����	ʤ����*3
	{giveClause = function (nCount)
		gf_Modify("Pvp", nCount * 3);
	end},		
	--��Ǯ	ʤ����*50000��ͭ��
	{giveClause = function (nCount)
		gf_Modify("Money", nCount * 50000);
	end},
	--��ս����	ʤ����*3
	{giveClause = function (nCount)
		gf_Modify("Dzjy", nCount * 3);
	end},		
	--�����Ƭ	ʤ����*1
	{giveClause = function (nCount)
		gf_AddItemEx2(
			{"M�nh H�ng Hoang", {2,95,1506,1,4}}, 
			nCount);
	end},
	{giveClause = function (nCount)
		if nCount >= 11 then
			gf_AddItemEx({2,95,1511,1,4}, "��u Ph�ch L�nh", 25);
		elseif nCount >= 8 then
			gf_AddItemEx({2,95,1511,1,4}, "��u Ph�ch L�nh", 10);
		end
	end},
	{giveClause = function (nCount)
		soul_GivePoint(nCount * 30);
	end},
}

function getAward_3v3()
	local tSel = {
--		"��ȡ3v3�������������ս���/getAward_3v3_daily",
--		"��ȡ3v3�������������ܽ���/getAward_3v3_week",
--		"���˲��뽱��/getAward_3v3_personal",
--		"ս�Ӳ��뽱��/getAward_3v3_fightteam",
--    "ս�Ӿ�������/getAward_3v3_match_before",
    	"tr� l�i/main_3v3",
    }
	Say(g_szInfoHead.."Nh�n ph�n th��ng qu�", getn(tSel), tSel);
end

function getAward_3v3_personal(bSure)
	if gf_JudgeRoomWeight(3,100, "") ~= 1 then return end
	local maxcount = min(60,GetTask(TASKID_3V3_WIN_ROUND_MATCH))
	local count = maxcount - GetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED);
	if not bSure then
		if count <= 0 then
			return Talk(1, "", g_szInfoHead..format("T�ng s� ph�n th��ng c� nh�n c� th� nh�n qu� n�y %d, s� l�n nh�n th��ng d� l�i hi�n t�i %d", maxcount, count));
		end
		local tSel = {
			"Nh�n l�y ph�n th��ng./#getAward_3v3_personal(1)",
			"tr� l�i/getAward_3v3",
			"K�t th�c/nothing",
		}
		Say(g_szInfoHead..format("T�ng s� ph�n th��ng c� nh�n c� th� nh�n qu� n�y %d, s� l�n nh�n th��ng d� l�i hi�n t�i %d, c� mu�n ti�p t�c nh�n kh�ng?", maxcount, count),
			getn(tSel), tSel);
		return
	elseif count > 0 then
		gf_SetLogCaption("3v3_PersonalAward");
		local times = GetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED) + count;
		SetTask(TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED, times);
		
--����	�ȼ�*�ȼ�*120*ʤ����
		gf_Modify("Exp", GetLevel() * GetLevel() * 120 * count);
--���г�����Ϊ������	100
		ItemCreate.giveSeriesLowStone(100 * count)
--��ҵ����	150
		gf_Modify("SYJY", 150 * count);
--PVP����	3
		gf_Modify("Pvp", 3 * count);
--��ս����	3
		gf_Modify("Dzjy", 3 * count);
--�����Ƭ	1
		gf_AddItemEx2({"M�nh H�ng Hoang", {2,95,1506,1,4}}, 1 * count);
--����������	1
		gf_AddItemEx2({"T� v� ��i h�i b�i", {2,0,1064,1,4}}, 1 * count);
		if times == 60 then
			gf_Modify("Money", 600 * 10000);
		end
		--Observer:onEvent(OE_3V3_DAILY_AWARD,{count});
		gf_SetLogCaption("");
	end
end

function getAward_3v3_fightteam(bSure)
	if gf_JudgeRoomWeight(3,100, "") ~= 1 then return end
	local maxcount = min(30, GetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL));
	local count = maxcount - GetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED);
	if not bSure then
		if count <= 0 then
			return Talk(1, "", g_szInfoHead..format("T�ng s� ph�n th��ng chi�n ��i c� th� nh�n qu� n�y %d, s� l�n nh�n th��ng d� l�i hi�n t�i %d", maxcount, count));
		end
		local tSel = {
			"Nh�n l�y ph�n th��ng./#getAward_3v3_fightteam(1)",
			"tr� l�i/getAward_3v3",
			"K�t th�c/nothing",
		}
		Say(g_szInfoHead..format("T�ng s� ph�n th��ng chi�n ��i c� th� nh�n qu� n�y %d, s� l�n nh�n th��ng d� l�i hi�n t�i %d, c� mu�n ti�p t�c nh�n kh�ng?", maxcount, count),
			getn(tSel), tSel);
		return
	elseif count > 0 then
		gf_SetLogCaption("3v3_FightTeamAward");
		local times = GetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED) + count;
		SetTask(TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED, times);
--1������ʯ��2,22,1����	1��
		AddSkillAppCount(1, 1 * count);
		Msg2Player(format("Ng��i nh�n ���c %d c�p 1 k� n�ng th�ch �� l�u gi� v�o trong t�i",count));
--����	�ȼ�*�ȼ�*120*ʤ����
		gf_Modify("Exp", GetLevel() * GetLevel() * 120 * count);
--���г�	100
		ItemCreate.giveSeriesLowStone(100 * count)
--��ҵ����	150
		gf_Modify("SYJY", 150 * count);
--PVP����	3
		gf_Modify("Pvp", 3 * count);
--��ս����	3
		gf_Modify("Dzjy", 3 * count);
--�����Ƭ	1
		gf_AddItemEx2({"M�nh H�ng Hoang", {2,95,1506,1,4}}, 1 * count);
--���������ƣ��󶨣�	1
		gf_AddItemEx2({"T� v� ��i h�i b�i", {2,0,1064,1,4}}, 1 * count);
		if times == 30 then
--�������1�����������衰�����������ƺ�
			ItemCreate.giveSeriesHighStone(1);
		end
		if mod(times, 3) == 0 then
			local titleLv = max(1, min(10, 11 - floor(times / 3)));
			DebugOutput("titleLv", titleLv);
			if titleLv < 10 then
				local sName, nID1, nID2 = gf_UnPack(g_tRankTitle[titleLv + 1]);
				RemoveTitle(nID1, nID2);
				Msg2Player(format("Ng��i �� m�t �i [%s] danh hi�u", sName));
			end
			local sName, nID1, nID2 = gf_UnPack(g_tRankTitle[titleLv]);
			if AddTitle(nID1, nID2) > 0 then
				SetTitleTime(nID1,nID2, GetTime() + 28*24*3600);
				SetCurTitle(nID1,nID2)
				Msg2Player("Ng��i nh�n ���c ["..sName.."] danh hi�u");
				WriteLog(format("[3v3_FightTeamAward] [Role:%s Acc:%s] [danh hi�u:%s]", GetName(), GetAccount(), sName));
			end
		end
		gf_SetLogCaption("");
	end
end

function getAward_3v3_match_before(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("BattleDate", getAward_3v3_match_before);
	end
	if bUpdate or not g_nLastMatchRound then
		local nCurMatchRound = data["LocalMatchRound"][1] or 0;
		if g_nLastMatchRound ~= nCurMatchRound then
			g_nLastMatchRound = nCurMatchRound;
			sdb = SDB(SDBKEY_3V3_MATCH_RANK, 0, nCurMatchRound, 2);
			g_3v3DataMgr:resetSDB("MATCH_RANK", sdb, 3600);
		end
	end
	g_3v3DataMgr:getData("MATCH_RANK", callout(getAward_3v3_match, nCurMatchRound));
end

function getAward_3v3_match(nCurMatchRound, nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("MATCH_RANK", callout(getAward_3v3_match, nCurMatchRound));
	end
	if bUpdate then
		g_3v3MatchRank = {}
		g_FightTeamID2Rank = {}
		for i = 1, nCount do
			DebugOutput("C�p nh�t x�p h�ng cu�i c�ng");
			local tRankData = tData[i-1];
			DebugOutput(gf_UnPack(tRankData));
			local tRank = {};
			for j = 2, getn(tRank), 2 do
				tinsert(tRank, {tRankData[j], tRankData[j+1]});
				g_FightTeamID2Rank[tRankData[j]] = {tRankData[j+1], i};
			end
			g_3v3MatchRank[i] = tRank;
		end
	end
	if not g_3v3MatchRank or getn(g_3v3MatchRank) == 0 or not g_FightTeamID2Rank then
		return Talk(1, "", "T�m th�i kh�ng th� nh�n th�ng tin ph�n th��ng");
	end
	local ftID = GetFightTeamID();
	if not ftID == 0 then
		return Talk(1, "", "Ng��i kh�ng c� chi�n ��i, kh�ng th� nh�n th��ng");
	end
	local rank = g_FightTeamID2Rank[ftID];
	if not rank then
		return Talk(1, "", "Chi�n ��i c�a ng��i qu� tr��c kh�ng c� trong danh s�ch chung k�t, kh�ng th� nh�n th��ng");
	end
	if GetTask(TASKID_3V3_MATCH_FINALS_AWARD_ROUND) >= nCurMatchRound then
		return Talk(1, "", "Ng��i �� nh�n th��ng qu� tr��c r�i");
	end
	SetTask(TASKID_3V3_MATCH_FINALS_AWARD_ROUND, nCurMatchRound);
	getAward_3v3_match_real();
end
function getAward_3v3_match_real(rank)
--1		������12������ʯ1��*180��������*2500��������*2500�����ղعҼ�0,120,138;0,120,139;0,120,140;0,120,141  
--2		������10������ʯ1��*150��������*2000��������*2000	
--4-3	������8������ʯ1��*120��������*1500��������*1500	
--8-5	������6������ʯ1��*90��������*1000��������*1000	
--16-9	������4������ʯ1��*60��������*500��������*500	
--32-17	������2������ʯ1��*30��������*250��������*250	
	local tcount = {
		{4	,60  ,800	,800   	},
		{3	,50  ,700	,700	},
		{3	,40  ,500	,500	},
		{2	,30	 ,300	,300	},
		{1	,20	 ,200	,200	},
		{1	,10	 ,80	,80		},
	}
	local count = tcount[rank];
	if not count then
		return Talk(1, "", "Danh s�ch chi�n ��i trong qu� c�a ng��i h�nh nh� c� v�n ��, h�y li�n h� v�i Ngh�nh Kh�ch ���ng");
	end
	gf_SetLogCaption("3v3_MatchAward "..rank);
--������
	ItemCreate.giveSeriesHighStone(count[1]);
--����ʯ1��
	AddSkillAppCount(1, count[2]);
	Msg2Player(format("Ng��i nh�n ���c %d c�p 1 k� n�ng th�ch �� l�u gi� v�o trong t�i", count[2]));

--������
	gf_AddItemEx2({"Th�i X�n M�ch Kh�", {2,92,9,1,4}}, count[3]);
--������
	gf_AddItemEx({2,95,1511,1,4}, "��u Ph�ch L�nh", nCount[4]);
	if rank == 1 then
		local tItem = {
			{0,120,138,1,4},
			{0,120,139,1,4},
			{0,120,140,1,4},
			{0,120,141,1,4},
		}
		gf_AddItemEx(tItem[GetBody()], "Trang s�c �eo h�ng");
	end
	gf_SetLogCaption("");	
end

function getAward_3v3_daily()
	if gf_Judge_Room_Weight(2,100,"") ~= 1 then return end

	local today = gf_TodayDate()
	local lastDay = GetTask(TASKID_3V3_AWARD_DAILY_DATE);
	if lastDay < today then
		nCount = GetTask(TASKID_3V3_WIN_ROUND_DAILY);
		SetTask(TASKID_3V3_WIN_ROUND_DAILY, 0);
		if nCount > 0 then
			gf_SetLogCaption("3v3_DailyAward");
			nCount = min(nCount, 12);
			for i = 1, getn(g_tAward_3v3) do
				g_tAward_3v3[i].giveClause(nCount);
			end
			gf_SetLogCaption("");
		else
			Talk(1, "", g_szInfoHead.."Tr�n th�ng c�a ng��i h�m qua ch�a �� ho�c �� nh�n th��ng r�i!");
		end
		SetTask(TASKID_3V3_AWARD_DAILY_DATE, today);
		--Observer:onEvent(OE_3V3_DAILY_AWARD,{GetTask(TASKID_3V3_TOTAL_ROUND_DAILY),nCount});
	else
		Talk(1, "", g_szInfoHead.."Tr�n th�ng c�a ng��i h�m qua ch�a �� ho�c �� nh�n th��ng r�i!");
	end
end

function getAward_3v3_week()
	if tonumber(date("%H")) < 12 then
		return Talk(1, "", g_szInfoHead.."Sau 12 gi� h�y ��n nh�n th��ng!");
	end
	g_3v3DataMgr:getData("RANK_LOCAL_LASTWEEK", updateXvXRank);
end

function updateXvXRank(nCount, s)
	if (nCount <= 0) then
		return
	end
	nCount = min(nCount, 10) - 1;
	g_tXvXRankLocak = {}
	for i = 0, nCount do
		g_tXvXRankLocak[s[i][1]] = i + 1;
	end
	getWeeklyAward_3v3();
end

g_tRankTitle = {
	{"V� L�m Minh Th�p V� Th�nh", 67, 20	},
	{"V� L�m Minh C�u V� T�n", 67, 19	},
	{"V� L�m Minh B�t V� Qu�", 67, 18	},
	{"V� L�m Minh Th�t V� Ho�ng", 67, 17	},
	{"V� L�m Minh L�c V� Linh", 67, 16	},
	{"V� L�m Minh Ng� V� T�ng", 67, 15	},
	{"V� L�m Minh T� V� Hi�p", 67, 14	},
	{"V� L�m Minh Tam V� S�", 67, 13	},
	{"V� L�m Minh Nh� V� S�", 67, 12	},
	{"V� L�m Minh Nh�t V� Gi�", 67, 11	},
}
g_3v3DailyAward = {
	50,
	45,
	40,
	35,
	30,
	25,
	20,
	15,
	10,
	5,
}

function getWeeklyAward_3v3()
	if not g_tXvXRankLocak then return end
	local nRank = g_tXvXRankLocak[GetName()];
	if not nRank or nRank <= 0 or nRank > 10 then
		return Talk(1, "", g_szInfoHead.."Tu�n tr��c x�p h�ng trong server ng��i ch�a n�m trong top 10, kh�ng th� nh�n th��ng!");
	end
	if GetTask(TASKID_3V3_WEEKLY_AWARD_DATE) >= tonumber(date("%Y%W")) then
		Talk(1, "", g_szInfoHead.."Ng��i �� nh�n ph�n th��ng tu�n tr��c, hy v�ng ��i hi�p ti�p t�c c� g�ng!");
		return
	end
	SetTask(TASKID_3V3_WEEKLY_AWARD_DATE, tonumber(date("%Y%W")));
	gf_SetLogCaption("3v3 WeeklyAward");
	local sName, nID1, nID2 = g_tRankTitle[nRank][1], g_tRankTitle[nRank][2], g_tRankTitle[nRank][3]
	if AddTitle(nID1,nID2) > 0 then
		SetTitleTime(nID1,nID2, GetTime() + 7*24*3600);
		SetCurTitle(nID1,nID2)
		Msg2Player("B�n nh�n ���c ["..sName.."] danh hi�u");
		WriteLog(format("[3v3 ph�n th��ng tu�n] [Role:%s Acc:%s] nh�n ���c h�ng %d li�n ��u", GetName(), GetAccount(), nRank));
		if gf_TodayDate() >= 20121224 and gf_TodayDate() <= 20121230 then
			local nCount = 100 - (nRank - 1) * 5;
			Msg2Player(format("Do thu�c t�nh danh hi�u tu�n n�y v� hi�u, ng��I nh�n ���c %d ��u Ph� L�nh", nCount));
			gf_AddItemEx({2,95,1511,1,4}, "��u Ph�ch L�nh", nCount);
		end
	end
	gf_SetLogCaption("");
end

function info_3v3(nPage)
	if not nPage then
		local tSel = {
			"Gi�i thi�u c� ch�/#info_3v3(1)",
			"Quy t�c thi ��u/#info_3v3(2)",
			"Ph�n �o�n th�ng b�i/#info_3v3(3)",
			"Gi�i th�ch ch� s�/#info_3v3(4)",
			"Thuy�t minh ph�n th��ng/#info_3v3(5)",
			"tr� l�i/main_3v3",
		}
		Say(g_szInfoHead.."Ng��i mu�n bi�t n�i dung v� m�t n�o?", getn(tSel), tSel);
		return
	end
	local tInfo = {
	"[Gi�i thi�u c� ch�] Li�n ��u ��i H�i T� V� m� v�i h�nh th�c qu�. C� th� tham gia v�i h�nh th�c c� nh�n ho�c ��i ng�.M�i qu� c� 28 ng�y, chia th�nh 25 ng�y ��u, 3 ng�y ngh�. M�i qu� m�i nh�t ��nh b�t ��u v�o th� hai.Ti�n �� c� th� v� gi�i ��u qu�, c� th� b�m n�t K xem giao di�n m� ra sau khi �i vao ��u tr��ng. Gi�i ��u m� v�o 19:00, k�t th�c v�o 20:00. M�i tr�n 5 ph�t, t�ng c�ng c� 12 tr�n. n�u kh�ng m� b�nh th��ng, th� mu�n nh�t k�o d�i ��n 22 gi� 30 ph�t. ti�p theo , m�c d� kh�ng �� 12 tr�n, c�ng kh�ng m� n�a.",
	"[Quy t�c thi ��u] Sau khi ��i hi�p v�o ��u tr��ng, c� th� b�m n�t K m� ra giao di�n tham gia, b�m n�t tham gia s� �i v�o ��i ng� ph�i h�p; Ho�c t� ��i th�nh ��i ng� c� ba l�u ph�i kh�c nhau, do ��i tr��ng b�m n�t tham gia �� �i v�o ��i ng� ph�i h�p.��i ng� ho�c c� nh�n �ang ph�i h�p ��i vi�n s� kh�ng th� ti�n h�nh ��i ng� thao th�c. Sau khi �i v�o ��u tr��ng, hai b�n c� 30 gi�y �� chu�n b�, sau �� ch�nh th�c b�t ��u chi�n ��u.",
	"[Ph�n �o�n th�ng b�i] M�t phe to�n b� b� tr�ng th��ng kh�ng th� ��nh ti�p, ��i ph��ng th�ng l�i. Khi hai b�n ��u c� ��i vi�n � tr�ng th�i c� th� ��nh ti�p, l��ng s�t th��ng c�a phe n�o cao nh�t th� phe �� chi�n th�ng.",
	"[Gi�i th�ch ch� s�] L�c chi�n ��u: � l� kh� n�ng chi�n ��u c�a ng��i ch�i, do t� l� th�ng, s� tr�n tham gia,v,v..quy�t ��nh. sau khi k�t th�c gi�i ��u qu�, l�c chi�n ��u s� gi�m xu�ng.�i�m t� c�ch: c�n c� s� tr�n chi�n th�ng m�i ng�y c�a ng��i ch�i, c� th� ��i th�nh �i�m t� c�ch t��ng �ng. D�ng �� x�p h�ng, c� th� t�nh t�ng c�ng. Gi�i ��u qu� k�t th�c s� tr� v� 0. Thi�t h�i: � l� gi� tr� chi�n ��u c�a ng��i ch�i, do s� l��ng gi�t ng��i v� s� l��ng t� vong quy�t ��nh. s� l��ng c�ng cao, gi� tr� c�ng l�n.",
	"[Gi�i th�ch gi�i th��ng] ��i hi�p c� th� nh�n gi�i th��ng tu�n v� qu� trong giao di�n Thi�n H� �� Nh�t ��i H�i T� V�, c�n c� c�c gi�i th��ng kh�c, xin vui l�ng ch� ��i!",
	}

	suTalk("info_3v3", g_szInfoHead..tInfo[nPage]);
end

function seeLastWeekRank(nCount, data)
	if not nCount then
		return g_3v3DataMgr:getData(SDBKEY_RANK_LOCAL_LASTWEEK, seeLastWeekRank);
	end
	if nCount < 1 then
		return Talk(1, "", "T�m th�i kh�ng c� d� li�u, ��n sau nh�");
	end
	nCount = min(nCount, 10) - 1;
	local msg = "X�p h�ng tu�n tr��c nh� sau:\n"
	for i = 0, nCount do
		local name = data[i][1];
		msg = msg .. format("%d    %s\n", i + 1, name);
	end
	Talk(1, "", msg);
end

function seeLastMatchRank(nCount, data)
	if not data then
		return SDBCallBack(SDBKEY_RANK_LOCAL, 0, 0, seeLastMatchRank);
	end
	nCount = min(nCount, 30);
	local msg = "X�p h�ng qu� hi�n t�i nh� sau: \n"
	for i = 0, nCount - 1 do
		local szTo = data[i][1];
		msg = msg .. format("%d    %s\n", i + 1, szTo);
	end	
	Talk(1, "", msg);
end

function xxxcheckMatchAward(nCount, data)
	Msg2Player("checkMatchAward...", nCount);
	if not nCount then
		return SDBCallBack(SDBKEY_3V3, 2, 0, xxxcheckMatchAward);
	end
	Msg2Player("Analysis Local Match data...")
	if nCount < 1 then
		Msg2Player("no local data!");
	else
		local tData = data["LocalMatchRound"];
		nLocalRound, bGiveAward = tData[1], tData[2];
		Msg2Player("LocalRound = ", nLocalRound, bGiveAward);
	end
	Msg2Player(" ");
	Msg2Player("Try GlobalData...");
	local s = SDB(SDBKEY_3V3, 2, 0, 2);
	s:apply2(xxxcheckMatchAward2);
end

function xxxcheckMatchAward2(nCount, data)
	Msg2Player("Analysis Global Match data...")
	nCount = nCount or 0;
	if nCount < 1 then
		Msg2Player("no global data!");
	else
		local tData = data["GlobalMatchRound"];
		nGlbRound = tData[1];
		Msg2Player("nGlbRound = ", nGlbRound);
	end
	
	Msg2Player(" ");
	Msg2Player("Try AwardData...");
	SDBCallBack(SDBKEY_RANK_LOCAL, 0, 0, xxxcheckAwardData);
end

function xxxcheckAwardData(nCount, data)
	Msg2Player("Analysis Award data...")
	if nCount < 1 then
		Msg2Player("no award data!");
	else
		Msg2Player("NO  Score  Name");
		local m = min(nCount, 20) - 1;
		for i = 0, m do
			local tData = data[i];
			Msg2Player(format("%02d  %4d  %s", i + 1, tData[2], tData[1]));
		end
	end
	
end

function seeMatchTeamRank(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FIGHTTEAM_RANK", seeMatchTeamRank)
	--	return Talk(1, "", g_szInfoHead.."ǰ����·��ͨ, ���Ժ�����");
	end
	if bUpdate then
		g_MatchTeamRank = {}
		g_MatchTeamRankMsg = ""
		nCount = min(nCount, 30)
		for i = 1, nCount do
			local tFTInfo = tData[i-1];
			local name = tFTInfo[1];
			local aa,bb,strGbGroup,strGbName = strfind(name,"(.-)*(.*)");
			local score = tFTInfo[2];
			local ftID = tFTInfo[3];
			DebugOutput(i, gf_UnPack(tFTInfo));
			g_MatchTeamRank[ftID] = i;
			g_MatchTeamRankMsg = g_MatchTeamRankMsg .. format("H�ng %2d li�n ��u %-16s %8d �i�m", i, strGbName, score);
			if mod(i, 2) == 1 then
				g_MatchTeamRankMsg = g_MatchTeamRankMsg.. "        ";
			else
				g_MatchTeamRankMsg = g_MatchTeamRankMsg.."\n";
			end
--			if mod(i, 8) == 0 then
--				g_MatchTeamRankMsg = g_MatchTeamRankMsg .. "\\p";
--			end
		end
	end
	if not g_MatchTeamRankMsg or not g_MatchTeamRank then
		return Talk(1, "", "Hi�n t�i kh�ng th� l�y s� li�u x�p h�ng");
	end
	local msg = g_MatchTeamRankMsg;
	local myFTID = GetFightTeamID();
	if myFTID ~= 0 then
		nRank = g_MatchTeamRank[myFTID];
		if nRank then
			msg = msg .. format("\n x�p h�ng chi�n ��i c�a ng��i: h�ng %d li�n ��u", nRank);
		else
			msg = msg .. "\n x�p h�ng chi�n ��i c�a ng��i kh�ng n�m trong top 30";
		end
	else
		msg = msg .. "\n Ng��i ch�a gia nh�p chi�n ��i";
	end
	local tSel = {
		"tr� l�i/main_3v3_2",
		"K�t th�c ��i tho�i/nothing",
	}
	suSay(msg, getn(tSel), tSel);
end

function seePerliminaryRank(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("FINALS_TEAMS2", seePerliminaryRank)
	--	return Talk(1, "", g_szInfoHead.."ǰ����·��ͨ, ���Ժ�����");
	end
	if bUpdate then
		nCount = min(nCount, PRELIMINARY_TEAM_PER_GROUP);
		g_FinalsRankMsg = "Danh s�ch tham gia chung k�t: \n"
		for i = 1, nCount do
			local tFTInfo = tData[i - 1];
			DebugOutput(gf_UnPack(tFTInfo));
			local name = tFTInfo[3];
			g_FinalsRankMsg = g_FinalsRankMsg .. format("H�ng %2d li�n ��u %-32s", i, name);
			g_FinalsRankMsg = g_FinalsRankMsg.."\n";
		end
	end
	DebugOutput(g_FinalsRankMsg)
	if not g_FinalsRankMsg == 0 then
		return Talk(1, "", "L�y danh s�ch tham gia chung k�t b� l�i");
	end
	local tSel = {
		"tr� l�i/main_3v3_2",
		"K�t th�c ��i tho�i/nothing",
	}
	local msg = g_FinalsRankMsg;
	PAGE_SIZE = 350
	suSay(msg, getn(tSel), tSel);
end

function seeFinalMatchRank(nCount, tData, bUpdate)
	if not nCount then
		return g_3v3DataMgr:getData("BattleDate", seeFinalMatchRank);
	end
	if bUpdate or not g_nLastMatchRound then
		local nCurMatchRound = tData["LocalMatchRound"][1] or 0;
		if g_nLastMatchRound ~= nCurMatchRound then
			g_nLastMatchRound = nCurMatchRound;
			sdb = SDB(SDBKEY_3V3_MATCH_RANK, 0, nCurMatchRound, 2);
			g_3v3DataMgr:resetSDB("MATCH_RANK", sdb, 3600);
		end
	end
	DebugOutput(g_nLastMatchRound)
	g_3v3DataMgr:getData("MATCH_RANK", callout(seeFinalMatchRank_cb, nCurMatchRound));
end

function seeFinalMatchRank_cb(nCurMatchRound, nCount, data, bUpdate)
	if bUpdate then
		nCount = nCount;
		g_FinalsRankMsg2 = ""
		for i = 0, nCount - 1 do
			local tFTInfo = tData[i];
			DebugOutput(gf_UnPack(tFTInfo));
			local count = getn(tFTInfo) / 2
			local name = tFTInfo[1];
			local ftID = tFTInfo[2];
			g_FinalsRankMsg2 = g_FinalsRankMsg2 .. format("X�p h�ng %2d li�n ��u \n", nTop);
			for n = 1, count do
				g_FinalsRankMsg2 = g_FinalsRankMsg2 .. tRoundTop[n*2] .. "\n";
			end
		end
	end
	DebugOutput(g_FinalsRankMsg2)
	if not g_FinalsRankMsg2 then
		return Talk(1, "", "L�y danh s�ch x�p h�ng chung k�t qu� tr��c b� l�i");
	end
	local tSel = {
		"tr� l�i/main_3v3_2",
		"K�t th�c ��i tho�i/nothing",
	}
	local msg = g_FinalsRankMsg2 .. "\n ph�n th��ng s� th�ng qua h� th�ng th� t�n �� ph�t";
	suSay(msg, getn(tSel), tSel);
end
