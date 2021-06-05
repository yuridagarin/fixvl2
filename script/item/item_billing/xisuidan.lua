------------------------------------------------------------
-- ϴ�赤�Ľű� xisuidan.lua
--
-- comment: ϴ����5��Ǳ�ܵ㡣
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,136
------------------------------------------------------------

CHANGE_POINTS = -5

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Sau khi d�ng <color=yellow>T�y T�y ��n<color> c� th� s�a ��i 5 �i�m n�ng l�c c� b�n, b�n mu�n ��i n�ng l�c c� b�n n�o?",
		6,
		"S�c m�nh/change_strength_5_points",
		"N�i c�ng /change_energy_5_points",
		"G�n c�t/change_vitality_5_points",
		"Th�n ph�p/change_dexterity_5_points",
		"Linh ho�t/change_observe_5_points",
		"Ta kh�ng mu�n s�a ��i--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;


-- ����5������
function change_strength_5_points()
	Say("B�n x�c nh�n mu�n s�a ��i 5 �i�m <color=yellow>S�c m�nh<color> ch�?",
		2,
		"���c/confirm_strength_5",
		"Ta kh�ng mu�n s�a ��i--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ���5������
function confirm_strength_5()

	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y ��n!", 0)
		return
	end
	
	if (DelItem(2, 0, 136, 1) == 1) then
		SetStrength(CHANGE_POINTS)
		Say("B�n �� thay ��i th�nh c�ng 5 �i�m <color=yellow>S�c m�nh<color>!", 0)
		Msg2Player("B�n �� thay ��i th�nh c�ng 5 �i�m S�c m�nh!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y ��n<color>!")
	end
end;


-- ����5�����
function change_vitality_5_points()
	Say("B�n x�c nh�n mu�n s�a ��i 5 �i�m <color=yellow>G�n c�t<color> ch�?",
		2,
		"���c/confirm_vitality_5",
		"Ta kh�ng mu�n s�a ��i--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ���5�����
function confirm_vitality_5()
	
	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y ��n!", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetVitality(CHANGE_POINTS)
		Say("B�n �� thay ��i th�nh c�ng 5 �i�m <color=yellow>G�n c�t<color>!", 0)
		Msg2Player("B�n �� thay ��i th�nh c�ng 5 �i�m G�n c�t!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y ��n<color>!")
	end
end;


-- ����5����
function change_dexterity_5_points()
	Say("B�n x�c nh�n mu�n s�a ��i 5 �i�m <color=yellow>Th�n ph�p<color> ch�?",
		2,
		"���c/confirm_dexterity_5",
		"Ta kh�ng mu�n s�a ��i--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ���5����
function confirm_dexterity_5()
	
	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y ��n!", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetDexterity(CHANGE_POINTS)
		Say("B�n �� thay ��i th�nh c�ng 5 �i�m <color=yellow>Th�n ph�p<color>!", 0)
		Msg2Player("B�n �� thay ��i th�nh c�ng 5 �i�m Th�n ph�p!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y ��n<color>!")
	end
end;


-- ����5���ڹ�
function change_energy_5_points()
	Say("B�n x�c nh�n mu�n s�a ��i 5 �i�m <color=yellow>N�i c�ng<color> ch�?",
		2,
		"���c/confirm_energy_5",
		"Ta kh�ng mu�n s�a ��i--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ���5���ڹ�
function confirm_energy_5()
	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y ��n!", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetEnergy(CHANGE_POINTS)
		Say("B�n �� thay ��i th�nh c�ng 5 �i�m <color=yellow>N�i c�ng<color>!", 0)
		Msg2Player("B�n �� thay ��i th�nh c�ng 5 �i�m N�i c�ng!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y ��n<color>!")
	end
end;


-- ����5�㶴��
function change_observe_5_points()
	Say("B�n x�c nh�n mu�n s�a ��i 5 �i�m <color=yellow>Linh ho�t<color> ch�?",
		2,
		"���c/confirm_observe_5",
		"Ta kh�ng mu�n s�a ��i--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ���5�㶴��
function confirm_observe_5()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y ��n!", 0)
		return
	end
	
	if (DelItem(2, 0, 136, 1) == 1) then
		SetObserve(CHANGE_POINTS)
		Say("B�n �� thay ��i th�nh c�ng 5 �i�m <color=yellow>Linh ho�t<color>!", 0)
		Msg2Player("B�n �� thay ��i th�nh c�ng 5 �i�m Linh ho�t!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y ��n<color>!")
	end
end;

