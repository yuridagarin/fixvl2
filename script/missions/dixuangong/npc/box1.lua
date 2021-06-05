--����������
--����20�㾫���򿪣��򿪺���ʧ��ÿ��ÿ�ؿ��Կ���һ��
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

function main()
	Say("Ng��i x�c ��nh ti�u hao 20 �i�m Tinh L�c �� m� B�o R��ng Thi�n �m Tinh L�c kh�ng?", 2, "X�c ��nh m�/ensure_openBox", "T�i h� ch� xem qua th�i/do_nothing");
end

tJingLiAward = {
	{1, 600, "M�nh Thi�n M�n", {2, 1, 30410, 1, 4}, 0},
	--{1, 200, "������Ƭ", {2, 1, 30410, 2, 4}, 0},
	--{1, 100, "������Ƭ", {2, 1, 30410, 4, 4}, 0},
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
	{1, 200, "Ng� Hoa T� Nguy�n T�n (s�c m�nh)", {1, 0, 261, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (n�i c�ng)", {1, 0, 262, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (g�n c�t)", {1, 0, 263, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (th�n ph�p)", {1, 0, 264, 1, 1}, 0},
	{1, 200, "Ng� Hoa T� Nguy�n T�n (nhanh nh�n)", {1, 0, 265, 1, 1}, 0},
	{1, 600, "H�c Ng�c �o�n T�c Cao", {1, 0, 6, 1, 4}, 0},
	{1, 600, "Sinh Sinh H�a T�n", {1, 0, 16, 1, 4}, 0},
	{1, 600, "V�n V�t Quy Nguy�n ��n", {1, 0, 11, 1, 4}, 0},
	{1, 400, "C�u chuy�n h�i h�n ��n", {1, 0, 32, 1, 4}, 0},
}
function ensure_openBox()
	local nTeamIndex = MV_IS_OPENED_BOX_BEGIN + getIndexAtTeam();
	if GetMissionV(nTeamIndex) ~= 0 then
		Say("Ng��i �� m� B�o R��ng Thi�n �m Tinh L�c r�i, kh�ng th� m� l�i", 0);
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0
	end
	local nRet1, nRet2 = ModifyEnergy(-20, 1);
	if -1 ~= nRet1 then
		local nRandIndex = gf_EventGiveRandAward(tJingLiAward, gf_SumRandBase(tJingLiAward), 1, "��a Huy�n Cung", "M� R��ng ��a Huy�n Cung Thi�n �m Tinh L�c");
		SetMissionV(nTeamIndex, 1);
		--�������俪������ͳ��
		AddRuntimeStat(1,10,0,1);
		--ͳ�Ƶ���
		if tJingLiAward[nRandIndex] then
			if tJingLiAward[nRandIndex][3] == "C�p 3 Luy�n L� Thi�t" then
				AddRuntimeStat(1,16,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "C�p 3 T�y T�m Th�ch" then
				AddRuntimeStat(1,17,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "B� Ng�n To�n" then
				AddRuntimeStat(1,18,0,tJingLiAward[nRandIndex][4][4]);
			elseif tJingLiAward[nRandIndex][3] == "B� Ng�n Ch�y" then
				AddRuntimeStat(1,19,0,tJingLiAward[nRandIndex][4][4]);
			end
		end
	else
		Say("Tinh L�c kh�ng ��, kh�ng th� m� R��ng Thi�n �m Tinh L�c.",0);	
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
		{1, 7000, "�o Cho�ng T�o B�", {0, 152, 1, 1, 4}, 0},
		{1, 2500, "�o Cho�ng C�m �o�n", {0, 152, 2, 1, 4}, 0},
		{1, 380, "�o Cho�ng H�a V�n", {0, 152, 3, 1, 4}, 0},
		{1, 20, "�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1, 4}, 0, 0, 0, 1},
		{1, 20, "�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1, 4}, 0, 0, 0, 1},
		{1, 20, "�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1, 4}, 0, 0, 0, 1},
		{1, 20, "�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1, 4}, 0, 0, 0, 1},
		{1, 20, "�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1, 4}, 0, 0, 0, 1},
		{1, 20, "�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1, 4}, 0, 0, 0, 1},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "��a Huy�n Cung", "M� R��ng ��a Huy�n Cung Thi�n �m Tinh L�c");
end