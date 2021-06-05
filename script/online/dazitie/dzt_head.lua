Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\dazitie\\dzt_define.lua")
Include("\\script\\online\\zgc_public_fun.lua")

--�ʱ��
DZT_ACTIVITY_START = 2012102600
DZT_ACTIVITY_END = 2012111900

--���ʱ�������
--�ؿ����Ҫע����
DZT_ACTIVITY_TASK_GROUP = TaskManager:Create(1,11);
DZT_ACTIVITY_TASK_GROUP.HHYY = 1;
DZT_ACTIVITY_TASK_GROUP.PTTQ = 2;
DZT_ACTIVITY_TASK_GROUP.COUNT = 3;
DZT_ACTIVITY_TASK_GROUP.DAYSEQ = 4;


--��Ƿ���
function dzt_activity_isopen()
	return gf_CheckEventDateEx2(DZT_ACTIVITY_START, DZT_ACTIVITY_END);
end

--��μ�����
function dzt_check_condition(bTag)
	return gf_CheckBaseCondition(80, bTag or 0);
end

--�һ�������Բ
function dzt_get_award_hhyy()
	-- �����������200��
	local nTaskCount = DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.HHYY);
	if nTaskCount >= DZT_HHYY_MAX then
		Talk(1,"",format("Nh�n qu� %d l�n, kh�ng th� ��i th�m ph�n th��ng.", DZT_HHYY_MAX));
		return 0;
	end
	-- ����������������ֵ
	local nCount = 99999999;
	for i = 1, getn(DZT_ITEM_TABLE) do
		local nNum = GetItemCount(DZT_ITEM_TABLE[i][1], DZT_ITEM_TABLE[i][2], DZT_ITEM_TABLE[i][3]);
		if nCount > nNum then
			nCount = nNum;
		end
	end
	nCount = min(GetFreeItemRoom(), nCount);
	nCount = min(DZT_HHYY_MAX - nTaskCount, nCount);
	AskClientForNumber("dzt_hhyy_award", 0, min(nCount, 20), "H�y nh�p s� l��ng v�o", "");
end

function dzt_hhyy_award(nNum)
	local nTaskCount = DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.HHYY);
	if nTaskCount + nNum > DZT_HHYY_MAX then
		return 0;
	end
	for i = 1, nNum do
		--ɾ������
		for i = 1, getn(DZT_ITEM_TABLE) do
			if DelItem(DZT_ITEM_TABLE[i][1], DZT_ITEM_TABLE[i][2], DZT_ITEM_TABLE[i][3], 1) ~= 1 then
				return 0;
			end
		end
		--��������
		DZT_ACTIVITY_TASK_GROUP:SetTask(DZT_ACTIVITY_TASK_GROUP.HHYY, DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.HHYY) + 1);
		--������
		dzt_get_award_free();
	end
	 gf_WriteLogEx("EVENT KS THANG 10", "kick ho�t th�nh c�ng", nNum, "Hoa H�o Nguy�t")
end

--��Ѷһ���������
function dzt_get_award_free()
	--����
	gf_Modify("Exp", 100000);
	--�������
	local tbAward = {};
	local nRand = gf_GetRandItemByTable(DZT_AWARD_HHYY_TABLE, 100, 1);	
	if DZT_AWARD_HHYY_TABLE[nRand][3] == "Ph� Thi�n ��ng Kh�nh" then
		if dzt_pttq_limit(DZT_AWARD_HHYY_TABLE[nRand][4][4]) == 0 then
			for i = 1, getn(DZT_AWARD_HHYY_TABLE) do
				if DZT_AWARD_HHYY_TABLE[i][3] ~= "Ph� Thi�n ��ng Kh�nh" then
					tinsert(tbAward, DZT_AWARD_HHYY_TABLE[i]);
				end
			end
			nRand = 0;
		else
			tbAward = DZT_AWARD_HHYY_TABLE;
		end
	else
		tbAward = DZT_AWARD_HHYY_TABLE;
	end
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "��i Hoa H�o Nguy�t Vi�n",nRand);
end

--�һ�����ͬ��
function dzt_get_award_pttq()
	-- ����������������ֵ
	local nCount =  min(GetFreeItemRoom(), GetItemCount(2, 1, 30446));
	AskClientForNumber("dzt_pttq_award", 0, min(nCount, 20), "H�y nh�p s� l��ng v�o", "");
end

function dzt_pttq_award(nNum)
	for i = 1, nNum do
		--ɾ������
		if DelItem(2, 1, 30446, 1) ~= 1 then
			return 0;
		end
		--��������
		DZT_ACTIVITY_TASK_GROUP:SetTask(DZT_ACTIVITY_TASK_GROUP.PTTQ, DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.PTTQ) + 1);
		--������
		dzt_get_award_ib();
	end
	 gf_WriteLogEx("EVENT KS THANG 10", "kick ho�t th�nh c�ng", nNum, "Ph� Thi�n ��ng")	
end

function dzt_get_award_ib()
	--������
	gf_Modify("Exp", 150000);
	--�������
	gf_EventGiveRandAward(DZT_AWARD_PTTQ_TABLE, 100000, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "��i Ph� Thi�n ��ng Kh�nh");
	--���⽱��
	local nIndex = DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.PTTQ);
	if DZT_SPECIAL_AWARD_TB[nIndex] ~= nil then
		gf_AddItemEx2(DZT_SPECIAL_AWARD_TB[nIndex][3], DZT_SPECIAL_AWARD_TB[nIndex][2], "��i t�c chi�n truy t�m l�i ch� vi�t", "Ph�n th��ng ��i IB", DZT_SPECIAL_AWARD_TB[nIndex][6], 1);
		if DZT_SPECIAL_AWARD_TB[nIndex][5] == 1 then
			Msg2Global(format("Ch�c m�ng ng��i ch�i %s t�m l�i ch� vi�t �Ph� Thi�n ��ng Kh�nh�%d l�n nh�n ���c ph�n th��ng %s*%d", GetName(), nIndex, DZT_SPECIAL_AWARD_TB[nIndex][2], DZT_SPECIAL_AWARD_TB[nIndex][3][4]));
		end
		if nIndex >= DZT_SPECIAL_AWARD_TB[getn(DZT_SPECIAL_AWARD_TB)][1] then
			DZT_ACTIVITY_TASK_GROUP:SetTask(DZT_ACTIVITY_TASK_GROUP.PTTQ, 0);
		end
	end
end

function dzt_relay_allow_time()
	local sTime = tonumber(date("%H%M%S"));
	if sTime > 020000 and sTime < 100000 then
		return 0;
	end
	return 1;
end

function dzt_rc_boss()
	local sTime = tonumber(date("%M%S"));
	if sTime > 3000 then
		return 0;
	end
	local tbTempPoint = DZT_BOSS_POINT;
	local nRand = random(getn(tbTempPoint));
	local nKind = gf_GetRandItemByTable(DZT_BOSS_NPC, 100, 1);
	local npcIndex = CreateNpc(DZT_BOSS_NPC[nKind][3], DZT_BOSS_NPC[nKind][4], 207, tbTempPoint[nRand][1], tbTempPoint[nRand][2]);
	SetNpcDeathScript(npcIndex, DZT_BOSS_DEATH_SCRIPT[DZT_BOSS_NPC[nKind][1]]);
	SetNpcLifeTime(npcIndex, 20 * 60);
	return 1;
end

function dzt_relay_create_boss()
	local tbTempPoint = DZT_BOSS_POINT;
	local tbRezult = {};
	for i = 1, 12 do 
		local nRand = random(getn(tbTempPoint));
		tinsert(tbRezult, tbTempPoint[nRand]);
		tremove(tbTempPoint, nRand);
	end
	for i = 1, getn(tbRezult) do
		local nKind = gf_GetRandItemByTable(DZT_BOSS_NPC, 100, 1);
		local npcIndex = CreateNpc(DZT_BOSS_NPC[nKind][3], DZT_BOSS_NPC[nKind][4], 207, tbRezult[i][1], tbRezult[i][2]);
		SetNpcDeathScript(npcIndex, DZT_BOSS_DEATH_SCRIPT[DZT_BOSS_NPC[nKind][1]]);
		SetNpcLifeTime(npcIndex, 20 * 60);
	end
	Msg2Global("C� ng��i ph�t hi�n h�nh tung c�a ��o t�c ��nh c�p ch� tr�n Nh� Long S�n T�, ch� v� mau ch�ng �i t�m l�i.")
end

function dzt_pttq_limit(nNum)
	if DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.DAYSEQ) ~= zgc_pub_day_turn() then
		DZT_ACTIVITY_TASK_GROUP:SetTask(DZT_ACTIVITY_TASK_GROUP.DAYSEQ, zgc_pub_day_turn());
		DZT_ACTIVITY_TASK_GROUP:SetTask(DZT_ACTIVITY_TASK_GROUP.COUNT, 0);
	end 
	if DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.COUNT) >= 6 then
		return 0;
	else
		DZT_ACTIVITY_TASK_GROUP:SetTask(DZT_ACTIVITY_TASK_GROUP.COUNT, DZT_ACTIVITY_TASK_GROUP:GetTask(DZT_ACTIVITY_TASK_GROUP.COUNT) + nNum);
		return 1;
	end
end

function dzt_get_award_1()
	--������
	gf_TeamOperate(ModifyExp, 100000);
	--�������
	local tbAward = {};
	local nRand = gf_GetRandItemByTable(DZT_AWARD_1_TABLE, 10000, 1);	
	if DZT_AWARD_1_TABLE[nRand][3] == "Ph� Thi�n ��ng Kh�nh" then
		if dzt_pttq_limit(DZT_AWARD_1_TABLE[nRand][4][4]) == 0 then
			for i = 1, getn(DZT_AWARD_1_TABLE) do
				if DZT_AWARD_1_TABLE[i][3] ~= "Ph� Thi�n ��ng Kh�nh" then
					tinsert(tbAward, DZT_AWARD_1_TABLE[i]);
				end
			end
			nRand = 0;
		else
			tbAward = DZT_AWARD_1_TABLE;
		end
	else
		tbAward = DZT_AWARD_1_TABLE;
	end
	gf_EventGiveRandAward(tbAward, 10000, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Mao t�c", nRand);
end

function dzt_get_award_2()
	--������
	gf_TeamOperate(ModifyExp, 150000);
	--�������
	local tbAward = {};
	local nRand = gf_GetRandItemByTable(DZT_AWARD_2_TABLE, 10000, 1);	
	if DZT_AWARD_2_TABLE[nRand][3] == "Ph� Thi�n ��ng Kh�nh" then
		if dzt_pttq_limit(DZT_AWARD_2_TABLE[nRand][4][4]) == 0 then
			for i = 1, getn(DZT_AWARD_2_TABLE) do
				if DZT_AWARD_2_TABLE[i][3] ~= "Ph� Thi�n ��ng Kh�nh" then
					tinsert(tbAward, DZT_AWARD_2_TABLE[i]);
				end
			end
			nRand = 0;
		else
			tbAward = DZT_AWARD_3_TABLE;
		end
	else
		tbAward = DZT_AWARD_2_TABLE;
	end
	gf_EventGiveRandAward(tbAward, 10000, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "��o t�c", nRand);
end

function dzt_get_award_3()
	--������
	gf_TeamOperate(ModifyExp, 200000);
	--�������
	local tbAward = {};
	local nRand = gf_GetRandItemByTable(DZT_AWARD_3_TABLE, 10000, 1);	
	if DZT_AWARD_3_TABLE[nRand][3] == "Ph� Thi�n ��ng Kh�nh" then
		if dzt_pttq_limit(DZT_AWARD_3_TABLE[nRand][4][4]) == 0 then
			for i = 1, getn(DZT_AWARD_3_TABLE) do
				if DZT_AWARD_3_TABLE[i][3] ~= "Ph� Thi�n ��ng Kh�nh" then
					tinsert(tbAward, DZT_AWARD_3_TABLE[i]);
				end
			end
			nRand = 0;
		else
			tbAward = DZT_AWARD_3_TABLE;
		end
	else
		tbAward = DZT_AWARD_3_TABLE;
	end
	gf_EventGiveRandAward(tbAward, 10000, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "C��ng t�c", nRand);
end

function dzt_get_award_4()
	--������
	gf_TeamOperate(ModifyExp, 300000);
	--�������
	local tbAward = {};
	local nRand = gf_GetRandItemByTable(DZT_AWARD_4_TABLE, 10000, 1);	
	if DZT_AWARD_4_TABLE[nRand][3] == "Ph� Thi�n ��ng Kh�nh" then
		if dzt_pttq_limit(DZT_AWARD_4_TABLE[nRand][4][4]) == 0 then
			for i = 1, getn(DZT_AWARD_4_TABLE) do
				if DZT_AWARD_4_TABLE[i][3] ~= "Ph� Thi�n ��ng Kh�nh" then
					tinsert(tbAward, DZT_AWARD_4_TABLE[i]);
				end
			end
			nRand = 0;
		else
			tbAward = DZT_AWARD_4_TABLE;
		end
	else
		tbAward = DZT_AWARD_4_TABLE;
	end
	gf_EventGiveRandAward(tbAward, 10000, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "��i ��o t�c", nRand);
end

function dzt_ls_14()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 40, "Hoa", {2, 1, 30447, 2}, 0},
    {1, 20, "H�o", {2, 1, 30448, 2}, 0},
    {1, 20, "Nguy�t", {2, 1, 30449, 2}, 0},
    {1, 20, "Vi�n", {2, 1, 30450, 2}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� L��ng S�n")
end

function dzt_ls_58()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 40, "Hoa", {2, 1, 30447, 4}, 0},
    {1, 20, "H�o", {2, 1, 30448, 4}, 0},
    {1, 20, "Nguy�t", {2, 1, 30449, 4}, 0},
    {1, 20, "Vi�n", {2, 1, 30450, 4}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� L��ng S�n")
end

function dzt_wj_13()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 20, "Hoa", {2, 1, 30447, 2}, 0},
    {1, 40, "H�o", {2, 1, 30448, 2}, 0},
    {1, 20, "Nguy�t", {2, 1, 30449, 2}, 0},
    {1, 20, "Vi�n", {2, 1, 30450, 2}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� V�n Ki�m Tr�ng")
end

function dzt_wj_4()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 20, "Hoa", {2, 1, 30447, 4}, 0},
    {1, 40, "H�o", {2, 1, 30448, 4}, 0},
    {1, 20, "Nguy�t", {2, 1, 30449, 4}, 0},
    {1, 20, "Vi�n", {2, 1, 30450, 4}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� V�n Ki�m Tr�ng")
end

function dzt_ttd_13()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 20, "Hoa", {2, 1, 30447, 2}, 0},
    {1, 20, "H�o", {2, 1, 30448, 2}, 0},
    {1, 40, "Nguy�t", {2, 1, 30449, 2}, 0},
    {1, 20, "Vi�n", {2, 1, 30450, 2}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Th�ng Thi�n Huy�n C�nh")
end

function dzt_ttd_47()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 20, "Hoa", {2, 1, 30447, 4}, 0},
    {1, 20, "H�o", {2, 1, 30448, 4}, 0},
    {1, 40, "Nguy�t", {2, 1, 30449, 4}, 0},
    {1, 20, "Vi�n", {2, 1, 30450, 4}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Th�ng Thi�n Huy�n C�nh")
end

function dzt_tmz_fail()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 20, "Hoa", {2, 1, 30447, 3}, 0},
    {1, 20, "H�o", {2, 1, 30448, 3}, 0},
    {1, 20, "Nguy�t", {2, 1, 30449, 3}, 0},
    {1, 40, "Vi�n", {2, 1, 30450, 3}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Thi�n M�n Tr�n")
	local tbAward2 = {
		{1, 10, "Ph� Thi�n ��ng Kh�nh", {2, 1, 30446, 1}, 0},
		{31, 90, "nothing()", 0},
	}
	gf_EventGiveRandAward(tbAward2, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Thi�n M�n Tr�n")
end

function dzt_tmz_succ()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
		{1, 20, "Hoa", {2, 1, 30447, 9}, 0},
    {1, 20, "H�o", {2, 1, 30448, 9}, 0},
    {1, 20, "Nguy�t", {2, 1, 30449, 9}, 0},
    {1, 40, "Vi�n", {2, 1, 30450, 9}, 0},
	}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Thi�n M�n Tr�n")
	local tbAward2 = {
		{1, 30, "Ph� Thi�n ��ng Kh�nh", {2, 1, 30446, 1}, 0},
		{31, 70, "nothing()", 0},
	}
	gf_EventGiveRandAward(tbAward2, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Thi�n M�n Tr�n")
end

function dzt_tmz_kill()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local nMapIndex, nMapID = SubWorldIdx2ID();
	if nMapID ~= 6006 then
		return 0;
	end
	local	tbAward = {
			{1, 6, "Hoa", {2, 1, 30447, 1}, 0},
	    {1, 6, "H�o", {2, 1, 30448, 1}, 0},
	    {1, 6, "Nguy�t", {2, 1, 30449, 1}, 0},
	    {1, 12, "Vi�n", {2, 1, 30450, 1}, 0},
	    {31, 70, "nothing()", 0},
		}
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Thi�n M�n Tr�n")
end

function dzt_tmz_kill_player()
	if dzt_activity_isopen() ~= 1 or dzt_check_condition(1) ~= 1 then
		return 0;
	end
	local tbAward = {
			{1, 12, "Hoa", {2, 1, 30447, 1}, 0},
	    {1, 12, "H�o", {2, 1, 30448, 1}, 0},
	    {1, 12, "Nguy�t", {2, 1, 30449, 1}, 0},
	    {1, 24, "Vi�n", {2, 1, 30450, 1}, 0},
	    {31, 40, "nothing()", 0},
		}  
	gf_EventGiveRandAward(tbAward, 100, 1, "��i t�c chi�n truy t�m l�i ch� vi�t", "Sinh ra t� Thi�n M�n Tr�n")
end