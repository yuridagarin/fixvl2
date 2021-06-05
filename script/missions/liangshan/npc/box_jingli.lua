--��ɽ������
--����20�㾫���򿪣��򿪺���ʧ��ÿ��ÿ�ؿ��Կ���һ��
--Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")
Include("\\script\\missions\\liangshan\\head.lua");

JINGLI_BOX_INDEX=0
function main()
	--SendScript2VM("\\script\\missions\\liangshan\\mission\\mission.lua", format("jingli_box_main()"))
	Say("Ng��i quy�t ��nh ti�u hao 20 �i�m tinh l�c �� m� tinh l�c b�o r��ng kh�ng?", 2, "X�c ��nh m�/ensure_openBox", "T�i h� ch� xem qua th�i/do_nothing");
end

--function jingli_box_main()	
--	Say("��ȷ������20�㾫����������������", 2, "ȷ������/ensure_openBox", "��ֻ�ǿ�������/do_nothing");
--end

--������ɽ������
function drop_jingli_box(nBossNpcIdx)
	do return end
--	if JINGLI_BOX_INDEX ~= 0 then--һ�ε�һ������
--		return
--	end
--	set_jingli_box_open_flag(0)--�������־λ
--	local nLifeTime = nil
--	local m, x, y = GetNpcWorldPos(nBossNpcIdx);
--	if m and x and y then
--		local x2, y2 = x + random(-5, 5), y + random(-5, 5);
--    	local npc = CreateNpc("����Ǯ", "��������", m, x2, y2);
--    	if npc and npc > 0 then
--    		JINGLI_BOX_INDEX=npc
--    		if nLifeTime then
--        		SetNpcLifeTime(npc, nLifeTime);
--        	end
--        	SetNpcScript(npc, "\\script\\missions\\liangshan\\npc\\box_jingli.lua");
--    	else
--    		print(format("create npc jinglibox fail"))
--    	end
--	end
end

function remove_jingli_box()
	if JINGLI_BOX_INDEX ~= 0 then--һ�ε�һ������
		SetNpcLifeTime(JINGLI_BOX_INDEX, 0);
	end
	JINGLI_BOX_INDEX=0
end

function set_jingli_box_open_flag(nVal)
	if 0 == nVal then
		JINGLI_BOX_INDEX=0
	end
	SetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG, nVal);
end

tJingLiAward = {
	{1, 300, "M�nh Thi�n Cang", {2, 1, 30390, 1, 4}, 0},
	{1, 200, "M�nh Thi�n Cang", {2, 1, 30390, 2, 4}, 0},
	{1, 100, "M�nh Thi�n Cang", {2, 1, 30390, 4, 4}, 0},
	{31, 1000, "rand_start_equip()", 1},
	{1, 600, "Thi�t Tinh c�p 2", {2, 1, 30534, 1, 4}, 0},
	{1, 200, "Thi�t Tinh c�p 3", {2, 1, 30535, 1, 4}, 0},
	{1, 100, "B� Ng�n To�n", {2, 1, 30538, 1, 4}, 0},
	{1, 100, "B� Ng�n Ch�y", {2, 1, 30539, 1, 4}, 0},
	{1, 500, "B�ng Tinh Th�ch", {2, 1, 30554, 1, 4}, 0},
	{1, 250, "M�nh Thi�n th�ch", {2, 2, 7, 1, 4}, 0},
	{1, 525, "Thi�n th�ch", {2, 2, 8, 1, 4}, 0},
	{1, 25, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1, 4}, 0, 0, 0, 1},
	{1, 300, "Linh Th�ch Nguy�n Th�ch c�p 4", {2, 1, 30416, 1, 4}, 0},
	{1, 200, "Linh Th�ch Nguy�n Th�ch c�p 5", {2, 1, 30417, 1, 4}, 0},
	{1, 100, "Linh Th�ch Nguy�n Th�ch c�p 6", {2, 1, 30418, 1, 4}, 0, 0, 0, 1},
	{31, 800, "api_daily_limit_award_yinquan(10,0)", 1},
	{31, 200, "api_daily_limit_award_yinquan(20,0)", 1},
	{31, 100, "api_daily_limit_award_yinquan(100,0)", 1},
	{1, 500, "C�p 2 T�y T�m Th�ch", {2, 1, 30522, 1, 4}, 0},
	{1, 500, "C�p 2 Luy�n L� Thi�t", {2, 1, 30528, 1, 4}, 0},
	{1, 100, "C�p 3 T�y T�m Th�ch", {2, 1, 30523, 1, 4}, 0, 0, 0, 1},
	{1, 100, "C�p 3 Luy�n L� Thi�t", {2, 1, 30529, 1, 4}, 0, 0, 0, 1},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (s�c m�nh)", {1, 0, 261, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (n�i c�ng)", {1, 0, 262, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (g�n c�t)", {1, 0, 263, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (th�n ph�p)", {1, 0, 264, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (nhanh nh�n)", {1, 0, 265, 1}, 0},
	{1, 600, "H�c Ng�c �o�n T�c Cao", {1, 0, 6, 1, 4}, 0},
	{1, 600, "Sinh Sinh H�a T�n", {1, 0, 16, 1, 4}, 0},
	{1, 600, "V�n V�t Quy Nguy�n ��n", {1, 0, 11, 1, 4}, 0},
	{1, 400, "C�u chuy�n h�i h�n ��n", {1, 0, 32, 1, 4}, 0},
}
function ensure_openBox()
	local nOpenFlag = GetMissionV(MV_LS_OPEN_JINGLI_BOX_FLAG)
	local nTeamMemberBitIdx = getIndexAtTeam() + 1
	local bOpened = SafeGetBit(nOpenFlag, nTeamMemberBitIdx)
	if bOpened ~= 0 then
		Say("Ng��i �� m� b�o r��ng tinh l�c r�i, kh�ng th� m� ti�p.", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		set_jingli_box_open_flag(SafeSetBit(nOpenFlag, nTeamMemberBitIdx, 1))
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "L��ng S�n", "M� b�o r��ng tinh l�c L��ng S�n");
		
		
--		--�������俪������ͳ��
--		AddRuntimeStat(1,10,0,1);
--		--ͳ�Ƶ���
--		if tJingLiAward[nRandIndex] then
--			if tJingLiAward[nRandIndex][3] == "3����¯��" then
--				AddRuntimeStat(1,16,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "3��ϴ��ʯ" then
--				AddRuntimeStat(1,17,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "������" then
--				AddRuntimeStat(1,18,0,tJingLiAward[nRandIndex][4][4]);
--			elseif tJingLiAward[nRandIndex][3] == "������" then
--				AddRuntimeStat(1,19,0,tJingLiAward[nRandIndex][4][4]);
--			end
--		end
	else
		Say("Tinh l�c kh�ng ��, kh�ng th� m� b�o r��ng tinh l�c.",0);	
	end
end

function do_nothing()
--do nothing
end

function getIndexAtTeam()
	for i = 1, GetTeamSize() do
		if PlayerIndex == GetTeamMember(i) then
			return i - 1;
		end
	end	
end

function rand_start_equip()
	local tAward = {
		{1, 7000, "Huy Ch��ng ��ng Ch�", {0, 153, 1, 1, 4}, 0},
		{1, 2500, "Huy Ch��ng Thi�t Ch�", {0, 153, 2, 1, 4}, 0},
		{1, 380, "Huy Ch��ng Ng�c Ch�", {0, 153, 3, 1, 4}, 0},
		{1, 20, "Huy Ch��ng Kim Ch� ng� h�nh", {0, 153, 4, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch��ng M�c Ch� ng� h�nh", {0, 153, 5, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch��ng Th�y Ch� ng� h�nh", {0, 153, 6, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch��ng H�a Ch� ng� h�nh", {0, 153, 7, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch��ng Th� Ch� ng� h�nh", {0, 153, 8, 1, 4}, 0, 0, 0, 1},
		{1, 20, "Huy Ch��ng �m Ch� ng� h�nh", {0, 153, 9, 1, 4}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "L��ng S�n", "M� b�o r��ng tinh l�c");
end