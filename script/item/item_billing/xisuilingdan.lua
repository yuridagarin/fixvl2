------------------------------------------------------------
-- ϴ���鵤�Ľű� xisuilingdan.lua
--
-- comment: ϴ����ȫ����һ��Ǳ�ܵ㣨ֻ��һ�㣩��
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,137
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Sau khi d�ng <color=yellow>T�y T�y Linh ��n<color> c� th� kh�i ph�c 1 n�ng l�c t�y �, b�n mu�n kh�i ph�c n�ng l�c n�o?",
		6,
		"S�c m�nh/change_strength_all_points",
		"N�i c�ng /change_energy_all_points",
		"G�n c�t/change_vitality_all_points",
		"Th�n ph�p/change_dexterity_all_points",
		"Linh ho�t/change_observe_all_points",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;


-- ������������
function change_strength_all_points()
	Say("B�n x�c nh�n mu�n kh�i ph�c <color=yellow>S�c m�nh<color>?",
		2,
		"���c/confirm_strength_all",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ�����������
function confirm_strength_all()

	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y Linh ��n!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetStrength(1 - nCurStrength)
		Say("B�n �� th�nh c�ng kh�i ph�c <color=yellow>S�c m�nh<color>!", 0)
		Msg2Player("B�n �� th�nh c�ng kh�i ph�c S�c m�nh!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y Linh ��n<color>!", 0)
	end
end;


-- �������и���
function change_vitality_all_points()
	Say("B�n x�c nh�n mu�n kh�i ph�c <color=yellow>G�n c�t<color> ch�?",
		2,
		"���c/confirm_vitality_all",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ������и���
function confirm_vitality_all()

	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y Linh ��n!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetVitality(1 - nCurVitality)
		Say("B�n �� th�nh c�ng kh�i ph�c <color=yellow>G�n c�t<color>!", 0)
		Msg2Player("B�n �� th�nh c�ng kh�i ph�c G�n c�t!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y Linh ��n<color>!", 0)
	end
end;


-- ����������
function change_dexterity_all_points()
	Say("B�n x�c nh�n mu�n kh�i ph�c <color=yellow>Th�n ph�p<color> ch�?",
		2,
		"���c/confirm_dexterity_all",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ���������
function confirm_dexterity_all()

	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y Linh ��n!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetDexterity(1 - nCurDexterity)
		Say("B�n �� th�nh c�ng kh�i ph�c <color=yellow>Th�n ph�p<color>!", 0)
		Msg2Player("B�n �� th�nh c�ng kh�i ph�c Th�n ph�p!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y Linh ��n<color>!", 0)
	end
end;


-- ���������ڹ�
function change_energy_all_points()
	Say("B�n x�c nh�n mu�n kh�i ph�c <color=yellow>N�i c�ng<color> ch�?",
		2,
		"���c/confirm_energy_all",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ��������ڹ�
function confirm_energy_all()

	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y Linh ��n!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetEnergy(1 - nCurEnergy)
		Say("B�n �� th�nh c�ng kh�i ph�c <color=yellow>N�i c�ng<color>!", 0)
		Msg2Player("B�n �� th�nh c�ng kh�i ph�c N�i c�ng!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y Linh ��n<color>!", 0)
	end
end;


-- �������ж���
function change_observe_all_points()
	Say("B�n x�c nh�n mu�n kh�i ph�c <color=yellow>Linh ho�t<color> ch�?",
		2,
		"���c/confirm_observe_all",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;
-- ȷ�ϸ������ж���
function confirm_observe_all()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("Hi�n b�n kh�ng c�n d�ng T�y T�y Linh ��n!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetObserve(1 - nCurObserve)
		Say("B�n �� th�nh c�ng kh�i ph�c <color=yellow>Linh ho�t<color>!", 0)
		Msg2Player("B�n �� th�nh c�ng kh�i ph�c Linh ho�t!")
	else
		Say("B�n kh�ng mang theo <color=yellow>T�y T�y Linh ��n<color>!", 0)
	end
end;

