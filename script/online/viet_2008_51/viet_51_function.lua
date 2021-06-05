-- Խ��2008 51�

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\randomitem.lua");

SWITCH_2008_51			= 1;
DATE_2008_51_START_V	= 20080430;		-- 51���ʼ����(ս��&�̻�)
DATE_2008_51_END_V		= 20080501;		-- 51���������(ս��&�̻�)

DATE_2008_51_START_GEM	= 20080426;		-- 51���ʼ����(��ʯ)
DATE_2008_51_END_GEM	= 20080518;		-- 51���ʼ����(��ʯ)

DATE_2008_51_ITEM_END	= 20080530;		-- ��Ʒʹ�ý�������

TASK_ID_VIET_2008_51_GEM_EXP	= 2422;	-- ��ʯ��������

G_MAX_EXP	= 30000000;

function viet_51_battle_award(is_main_batter, is_winner)
	if is_viet_51_opened() == 1 then
		gf_SetLogCaption("20080501");
		Msg2Player("Nh�n ���c ph�n th��ng chi�n tr��ng T�ng Li�u.");
		gf_Modify( "Exp", 500000 * (1 + is_winner) * (1 + is_main_batter) );
		gf_SetLogCaption("");
	end
end

function is_viet_51_opened(is_gem)
	local nDate = tonumber(date("%Y%m%d"));

	if is_gem == nil or is_gem == 0 then
		if nDate >= DATE_2008_51_START_V and nDate <= DATE_2008_51_END_V then
			return SWITCH_2008_51;
		end
	else
		if nDate >= DATE_2008_51_START_GEM and nDate <= DATE_2008_51_END_GEM then
			return SWITCH_2008_51;
		end
	end
	return 0;
end

function viet_2008_51_business_award(nFinishedTimes)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if nFinishedTimes > 0 and mod(nFinishedTimes, 2) == 0 then
		gf_SetLogCaption("viet_2008_51_business_award");
		gf_AddItemEx( {2,1,30004, 1, 1}, "R��ng B�o Th�ch");
		gf_SetLogCaption("");
	end
end

function viet_2008_51_faction_award(nTimes)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if nTimes >= 20 then
		return
	end
	local tAward = {3,3,6,6,9,12,15,18};
	local nAward = floor(GetLevel()/10 - 1);
	if nAward == 0 then
		return
	end

	gf_SetLogCaption("viet_2008_51_faction_award");
	gf_AddItemEx( {2,1,30004,tAward[nAward], 1}, "R��ng B�o Th�ch");
	gf_SetLogCaption("");
end

-- �ؽ�ɱ��1����
function viet_2008_51_cangjian_award(nNpcIdx)
	if is_viet_51_opened(1) == 0 then
		return
	end
	if random(100) < 3 then
		gf_SetLogCaption("viet_2008_51_cangjian_award");
--		gf_AddItemEx( {2,1,30004,1, 1}, "��ʯ��");
		DropItem(2,1,30004,GetNpcWorldPos(nNpcIdx));
		gf_SetLogCaption("");
	end
end

-- �������˶Ի�
function viet_2008_51_gem_talk()
	if is_viet_51_opened(1) == 0 then
		Say("Ha ha, cu�c ��i v�n ��p sao...", 0);
		return
	end
	Say("Ch�c m�ng ng�y l� 30 th�ng 4 v� Qu�c t� lao ��ng.",
		3,
		"\n��i ph�n th��ng/talk_award",
		"\nN�i dung ho�t ��ng/talk_help_1",
		"R�i kh�i/nothing");
end
function talk_help_1()
	Say( "Trong th�i gian ho�t ��ng, tham gia ho�t ��ng th��ng h�i, nhi�m v� s� m�n ho�c T�ng Ki�m S�n Trang c� th� nh�n ���c R��ng b�o th�ch, b�n trong c� ch�a 1 vi�n Ng� Linh Th�ch, Lam Tinh Th�ch ho�c Ho�ng B�o Th�ch, c� th� d�ng c�c lo�i b�o th�ch n�y �� ��i ph�n th��ng t�i ��y.",
		2,
		"Ph�n th��ng g�m nh�ng g�?/talk_help_2",
		"Ch�ng c� g� vui c�/nothing()");
end
function talk_help_2()
	Say( " 2 Lam Tinh Th�ch + 2 Ho�ng B�o Thach + 10 b�c = 20.000 �i�m kinh nghi�m\n 1 Ng� Linh Th�ch + 2 Lam Tinh Th�ch + 2Ho�ng B�o Th�ch + 50 b�c = 80.000 �i�m kinh nghi�m, c� kh� n�ng nh�n ���c ph�n th��ng kh�c.\nNg��i ch�i <color=red>c�p 20<color> tr� l�n m�i c� th� tham gia ho�t ��ng n�y, th�i gian ho�t ��ng t� <color=red>26-04-2008 ��n 24h00 18-05-2008<color>..",
		1,
		"Ta �� hi�u r�i./viet_2008_51_gem_talk",
		"R�i kh�i/nothing");
end
function talk_award()
	if GetLevel() < 20 then
		Say("��i ��n c�p 20 h�y gh� l�i..", 0);
		return
	end
	if GetTask(TASK_ID_VIET_2008_51_GEM_EXP) >= 30000000 then
		Say("Th�ng qua ho�t ��ng n�y, m�i ng��i ch�i ch� c� th� nh�n ���c t�i �a 30 tri�u �i�m kinh nghi�m.", 0);
		return
	end
	Say("Mu�n ��i ph�n th��ng n�o??",
		3,
		"\n2 Lam Tinh Th�ch + 2 Ho�ng B�o Th�ch + 10 b�c = 20.000 �i�m kinh nghi�m./talk_award_1",
		"\n1 Ng� Linh Th�ch + 2 Lam Tinh Th�ch + 2 Ho�ng B�o Th�ch + 50 b�c = 80.000 �i�m kinh nghi�m, ngo�i ra c� kh� n�ng nh�n ���c ph�n th��ng kh�c../talk_award_2",
		"R�i kh�i/nothing");
end

function talk_award_1()
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local msg = "C� ��ng � d�ng 2 Lam Tinh Th�ch + 2 Ho�ng B�o Th�ch + 10 b�c ��i l�y 20.000 �i�m kinh nghi�m kh�ng??";
	if gem_exp + 20000 > G_MAX_EXP then
		local exp = G_MAX_EXP - gem_exp;
		msg = "Th�ng qua ho�t ��ng n�y, m�i ng��i ch�i ch� c� th� nh�n ���c t�i �a 30 tri�u �i�m kinh nghi�m."..gem_exp.." �i�m kinh nghi�m, v� th� l�n trao ��i n�y ch� c� th� nh�n ���c "..exp.." �i�m kinh nghi�m.\n��ng � d�ng 2 Lam Tinh Th�ch + 2 Ho�ng B�o Th�ch + 10 b�c ��i l�y "..exp.." �i�m kinh nghi�m kh�ng??";
	end
	Say(msg,
		2,
		"Ta ��ng � ��i./talk_award_1_yes",
		"Ta suy ngh� l�i!/talk_award");
end

function talk_award_1_yes()
	if GetItemCount(2, 1, 30006) < 2 then
		Say("Lam Tinh Th�ch mang theo kh�ng ��.!", 0);
		return
	end
	if GetItemCount(2, 1, 30007) < 2 then
		Say("Ho�ng B�o Th�ch mang theo kh�ng ��.!", 0);
		return
	end
	if GetCash() < 1000 then
		Say("Kh�ng �� ng�n l��ng..", 0);
		return
	end
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local exp = 20000;
	if gem_exp + 20000 > G_MAX_EXP then
		exp = G_MAX_EXP - gem_exp;
	end

	if DelItem(2, 1, 30006,2) and DelItem(2, 1, 30007,2) and Pay(1000) then
		SetTask(TASK_ID_VIET_2008_51_GEM_EXP, GetTask(TASK_ID_VIET_2008_51_GEM_EXP) + exp);
		gf_SetLogCaption("viet_2008_51_gem_award");
		gf_Modify("Exp", exp);
		gf_SetLogCaption("");
	end
end

function talk_award_2()
	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local msg = "C� ��ng � d�ng 1 Ng� Linh Th�ch + 2 Lam Tinh Th�ch + 2 Ho�ng B�o Th�ch + 50 b�c = 80.000 �i�m kinh nghi�m kh�ng? Ngo�i ra c�n c� th� nh�n ���c ph�n th��ng kh�c..";
	if gem_exp + 80000 > G_MAX_EXP then
		local exp = G_MAX_EXP - gem_exp;
		msg = "Th�ng qua ho�t ��ng n�y, m�i ng��i ch�i ch� c� th� nh�n ���c t�i �a 30 tri�u �i�m kinh nghi�m."..gem_exp.." �i�m kinh nghi�m, v� th� l�n trao ��i n�y ch� c� th� nh�n ���c "..exp.." �i�m kinh nghi�m.\n��ng � d�ng 1 Ng� Linh Th�ch + 2 Lam Tinh Th�ch + 2 Ho�ng B�o Th�ch + 10 b�c ��i l�y "..exp.." �i�m kinh nghi�m kh�ng? Ngo�i ra c�n c� x�c su�t nh�n ���c ph�n th��ng kh�c..";
	end
	Say(msg,
		2,
		"Ta ��ng � ��i./talk_award_2_yes",
		"Ta suy ngh� l�i!/talk_award");
end
t_gem_item_award = {
	{68489,         "Ch�a", {0,0,0,1,1} },
	{    1,     "Chi�m Y Ph�", {0,107,66,1,1} },
	{    5,   "Thi�n H� M�t t�ch", {0,107,64,1,1} },
	{    5,   "T� H� M�t t�ch", {0,107,65,1,1} },
	{  500,   "B� Kim M�t t�ch", {0,107,61,1,1} },
	{  500,   "B� Th�ch M�t t�ch", {0,107,62,1,1} },
	{  500,   "Ng� Qu� M�t t�ch", {0,107,63,1,1} },
	{  500,   "M�nh Thi�n th�ch", {2,2,7,1,1} },
	{  500,       "Thi�n th�ch", {2,2,8,1,1} },
	{ 5000,       "B�ng th�ch", {2,1,149,1,1} },
	{ 5000,   "M�nh B�ng th�ch", {2,1,148,1,1} },
	{ 3500,   "C�y B�t Nh�", {2,0,398,1,1} },
	{ 5500, "C�y B�t Nh� nh�", {2,0,504,1,1} },
	{10000,       "L� th�y", {2,0,351,1,1} },
}
function talk_award_2_yes()
	if GetItemCount(2, 1, 30005) < 1 then
		Say("Ng� Linh Th�ch mang theo kh�ng ��.!", 0);
		return
	end
	if GetItemCount(2, 1, 30006) < 2 then
		Say("Lam Tinh Th�ch mang theo kh�ng ��.!", 0);
		return
	end
	if GetItemCount(2, 1, 30007) < 2 then
		Say("Ho�ng B�o Th�ch mang theo kh�ng ��.!", 0);
		return
	end
	if GetCash() < 5000 then
		Say("Kh�ng �� ng�n l��ng..", 0);
		return
	end

	local gem_exp = GetTask(TASK_ID_VIET_2008_51_GEM_EXP);
	local nItem = get_random_item(t_gem_item_award);
	if nItem == 0 then
		print("error table: t_gem_item_award!!!");
		return
	end

	local exp = 80000;
	if gem_exp + 80000 > G_MAX_EXP then
		exp = G_MAX_EXP - gem_exp;
	end

	if DelItem(2, 1, 30005,1) and DelItem(2, 1, 30006,2) and DelItem(2, 1, 30007,2) and Pay(5000) then
		SetTask(TASK_ID_VIET_2008_51_GEM_EXP, GetTask(TASK_ID_VIET_2008_51_GEM_EXP) + exp);
		gf_SetLogCaption("viet_2008_51_gem_award");
		gf_Modify("Exp", exp);
		if nItem ~= 1 then
			gf_AddItemEx( t_gem_item_award[nItem][3], t_gem_item_award[nItem][2] );
		end
		gf_SetLogCaption("");
	end
end

function nothing()
end
