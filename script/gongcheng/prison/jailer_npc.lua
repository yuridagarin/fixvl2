-- 2007-5-9 9:38
-- ����

Include("\\script\\gongcheng\\prison\\prison_head.lua")

tCityWarOutPos =
{
	[1] = {200, 1385, 2829},
	[2] = {300, 1769, 3555},
	[3] = {100, 1413, 2958},
	[4] = {400, 1520, 2981},
	[5] = {150, 1682, 3125},
	[6] = {350, 1460, 2948},
}

function main()
	Say("�i hay �, t�y ng��i quy�t ��nh!",2,"��a ta ra ngo�i/go_outside", "�� ta suy ngh� ��!/no_say")
end

function go_outside()
	local tMap = 
	{
		[730] = 1801,
		[731] = 1802,
		[732] = 1803,
		[733] = 1804,
		[734] = 1805,
	}
	local nMapID = GetWorldPos()
	if tMap[nMapID] == nil then
		return
	end
	CreateTrigger(2, tMap[nMapID], CITYWAR_LEAVE_PRISON)
	
	local nTrigger = GetTrigger(CITYWAR_STEP_TRIGGER)
	local nStep = GetTriggerParam(nTrigger, 2)
	if nTrigger == 0 then					-- ��̽���
		local selTab = 
		{
			"Bi�n Kinh/#go_out_safe(1)",
			"Th�nh ��/#go_out_safe(2)",
			"Tuy�n Ch�u/#go_out_safe(3)",
			"��i L�/#go_out_safe(4)",
			"D��ng Ch�u/#go_out_safe(5)",
			"T��ng D��ng/#go_out_safe(6)",
			"H�y b�/no_say"
		}
		Say("<color=green>L�nh g�c lao<color>: Ta c� th� ��a ng��i ��n nh�ng n�i sau: ", getn(selTab), selTab)
	elseif  nStep > CITYWAR_MAX_STEP then	-- ��ץ�������Ѿ���ʱ���
		chose_go_out()
	else
		Talk(1,"","<color=green>L�nh g�c lao<color>: ng��i ch�a h�t th�i gian th� h�nh, h�y ng�i �� �i!")
		--chose_want_bail()
	end
end

function chose_go_out()
	local nValue = GetPKValue()
	local nPay = nValue * 80
	if nValue > 0 then
		Say("<color=green>L�nh g�c lao<color>: �i�m PK c�a ng��i hi�n l� "..nValue..", ��a cho ta "..nPay.." l��ng v�ng h� �i�m PK xu�ng c�n 0, sao h�?",
			2,
			"Ra ng�c v� t�y �i�m PK/chose_go_out_xi",
			"Ta kh�ng c�n!/no_say")
			--"Ra ng�c nh�ng kh�ng t�y �i�m PK/chose_go_out_buxi")
	else
		chose_go_out_buxi()
	end
end

function chose_go_out_xi()
	local selTab = 
	{
		"Bi�n Kinh/#go_out_safe_xi(1)",
		"Th�nh ��/#go_out_safe_xi(2)",
		"Tuy�n Ch�u/#go_out_safe_xi(3)",
		"��i L�/#go_out_safe_xi(4)",
		"D��ng Ch�u/#go_out_safe_xi(5)",
		"T��ng D��ng/#go_out_safe_xi(6)",
		"H�y b�/no_say"
	}
	Say("Ng��i �� ch�n ra ng�c v� t�y �i�m PK. Ta c� th� ��a ng��i ��n nh�ng n�i sau: ", getn(selTab), selTab)
end

function chose_go_out_buxi()
	local selTab = 
	{
		"Bi�n Kinh/#go_out_safe(1)",
		"Th�nh ��/#go_out_safe(2)",
		"Tuy�n Ch�u/#go_out_safe(3)",
		"��i L�/#go_out_safe(4)",
		"D��ng Ch�u/#go_out_safe(5)",
		"T��ng D��ng/#go_out_safe(6)",
		"H�y b�/no_say"
	}
	Say("Ta c� th� ��a ng��i ��n nh�ng n�i sau: ", getn(selTab), selTab)
end

function chose_want_bail()
	local nValue = GetPKValue()
	if nValue > 0 then
		Say("<color=green>L�nh g�c lao<color>: �i�m PK c�a ng��i hi�n l� "..nValue..", khi ra ng�c b�n c� th� ng�u nhi�n b� tr� "..(nValue*80).." l��ng h� �i�m PK xu�ng c�n 0, sao h�?",
			2,
			"Ra ng�c v� t�y �i�m PK/want_bail_xi",
			"Ta kh�ng c�n!/no_say")
			--"Ra ng�c nh�ng kh�ng t�y �i�m PK/want_bail_buxi")
	else
		want_bail_buxi()
	end
end

function want_bail_xi()
	local _, nArrestPay = CustomDataRead("tongcitywar_arrest_tong")
	print(_, nArrestPay)
	if nArrestPay == nil then
		nArrestPay = 0
	end
	local nValue = GetPKValue() * 80
	local nPay = nArrestPay + nValue
	
	local selTab = 
	{
		"X�c nh�n b�o l�nh, ��n Khai Phong/#go_outside_yes(1,"..nPay..",1)",
		"X�c nh�n b�o l�nh, ��n Th�nh ��/#go_outside_yes(2,"..nPay..",1)",
		"X�c nh�n b�o l�nh, ��n Tuy�n Ch�u /#go_outside_yes(3,"..nPay..",1)",
		"X�c nh�n b�o l�nh, ��n ��i L�/#go_outside_yes(4,"..nPay..",1)",
		"X�c nh�n b�o l�nh, ��n D��ng Ch�u/#go_outside_yes(5,"..nPay..",1)",
		"X�c nh�n b�o l�nh, ��n T��ng D��ng/#go_outside_yes(6,"..nPay..",1)",
		"H�y b�/no_say",
	}
	Say("Ch�a ��n h�n ra lao, gi� mu�n �i ph�i ��ng ti�n b�o l�nh <color=yellow>"..nArrestPay.." l��ng<color> v� (ng�u nhi�n) "..nValue.." l��ng t�y �i�m PK, sao h�?",getn(selTab),selTab)
end

function want_bail_buxi()	
	local _, nPay = CustomDataRead("tongcitywar_arrest_tong")
	if nPay == nil then
		nPay = 0
	end
	
	local selTab = 
	{
		"X�c nh�n b�o l�nh, ��n Khai Phong/#go_outside_yes(1,"..nPay..",0)",
		"X�c nh�n b�o l�nh, ��n Th�nh ��/#go_outside_yes(2,"..nPay..",0)",
		"X�c nh�n b�o l�nh, ��n Tuy�n Ch�u /#go_outside_yes(3,"..nPay..",0)",
		"X�c nh�n b�o l�nh, ��n ��i L�/#go_outside_yes(4,"..nPay..",0)",
		"X�c nh�n b�o l�nh, ��n D��ng Ch�u/#go_outside_yes(5,"..nPay..",0)",
		"X�c nh�n b�o l�nh, ��n T��ng D��ng/#go_outside_yes(6,"..nPay..",0)",
		"H�y b�/no_say",
	}
	
	if nPay == 0 then
		Say("Ch�a ��n h�n ra lao, gi� mu�n �i ph�i ��ng ti�n b�o l�nh. Tuy nhi�n khi ng��i b� truy n� kh�ng �� 70 c�p, kh�ng c�n n�p ti�n b�o l�nh",getn(selTab),selTab)
	else
		Say("Ch�a ��n h�n ra lao, gi� mu�n �i ph�i ��ng ti�n b�o l�nh <color=yellow>"..nPay.." l��ng<color>, sao h�?",getn(selTab),selTab)
	end
end;

function go_outside_yes(index, nPay, subPK)
	if nPay == 0 then
		--��ͼ��NewWorld�������ƣ�Ҫ����Ĳ�����Ȩ�����òο�\GameSvr\maps\god_power.ini�����ļ�
		CleanInteractive()
		NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
		CustomDataRemove("tongcitywar_arrest_tong")
		RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
		SetPlayerRevivalPos(tCityWarOutPos[index][1], tCityWarOutPos[index][1])
	else
		if Pay(nPay * 10000) == 1 then
			if subPK == 1 then
				AddPKValue(-GetPKValue())
			end
			--��ͼ��NewWorld�������ƣ�Ҫ����Ĳ�����Ȩ�����òο�\GameSvr\maps\god_power.ini�����ļ�
			CleanInteractive()
			NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
			CustomDataRemove("tongcitywar_arrest_tong")
			RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
			SetPlayerRevivalPos(tCityWarOutPos[index][1], tCityWarOutPos[index][1])
			-- ��˰�ռӵ�ץ�Լ��������Ǹ�������
--			local szTong = CustomDataRead("tongcitywar_arrest_tong")
--			if szTong ~= nil and szTong ~= "" then
--				local nMoney = GetTongAttr("TONG_MONEY", szTong)
--				nMoney = nMoney + floor(nPay * 0.8)
--				if nMoney > 20000 then
--					nMoney = 20000
--				end
--				SetTongAttr("TONG_MONEY", szTong, nMoney)
--			end
		else
			Talk(1,"","Kh�ng ti�n m� ��i b�o l�nh, l�m ta m�t th�i gian qu�!")
		end
	end
end

function go_out_safe_xi(index)
	local nValue = GetPKValue()
	local nPay = nValue * 80
	if Pay(nPay * 10000) == 1 then
		RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
		CleanInteractive()
		AddPKValue(-nValue)
		NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
		local szTong = CustomDataRead("tongcitywar_arrest_tong")
		if szTong ~= nil and szTong ~= "" then
			local nMoney = GetTongAttr("TONG_MONEY", szTong)
			nMoney = nMoney + floor(nPay * 0.8)
			if nMoney > 20000 then
				nMoney = 20000
			end
			SetTongAttr("TONG_MONEY", szTong, nMoney)
		end
	else
		Talk(1,"","Kh�ng ti�n m� ��i t�y PK! L�m ta m�t th�i gian qu�!")
	end
end

function go_out_safe(index)
	--��ͼ��NewWorld�������ƣ�Ҫ����Ĳ�����Ȩ�����òο�\GameSvr\maps\god_power.ini�����ļ�
	RemoveTrigger(GetTrigger(CITYWAR_STEP_TRIGGER))
	CleanInteractive()
	NewWorld(tCityWarOutPos[index][1], tCityWarOutPos[index][2], tCityWarOutPos[index][3], 100)
end

function no_say()
end