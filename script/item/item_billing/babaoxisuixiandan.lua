------------------------------------------------------------
-- �˱�ϴ���ɵ��Ľű� babaoxisuixiandan.lua
--
-- comment: ϴȫ�������������������Կ۵�1�㣩��
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,138
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Sau khi d�ng <color=yellow>B�t B�o T�y T�y Ti�n ��n<color> c� th� t�o l�i to�n b� n�ng l�c c�a b�n, b�n x�c nh�n mu�n t�o l�i kh�ng?",
		2,
		"���c/change_all_points",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ȷ��Ҫ����ȫ������
function change_all_points()
	Say("Qu� tr�nh kh�i ph�c n�y s� ti�u ph� 1 vi�n <color=yellow>B�t B�o T�y T�y Ti�n ��n<color> qu� b�u, b�n x�c nh�n mu�n t�o l�i kh�ng?",
		2,
		"���c/confirm_change_all_points",
		"Ta kh�ng mu�n kh�i ph�c--H�y b�/cancel_dialog")
end;

-- ���ȷ��Ҫ����ȫ������
function confirm_change_all_points()
	local nCurStrength = GetStrength()
	local nCurVitality = GetVitality()
	local nCurDexterity = GetDexterity()
	local nCurEnergy = GetEnergy()
	local nCurObserve = GetObserve()
	
	if ((nCurStrength <= 1) and 
		(nCurVitality <= 1) and 
		(nCurDexterity <= 1) and 
		(nCurEnergy <= 1) and 
		(nCurObserve <= 1)) then
		Say("Hi�n b�n kh�ng c�n d�ng B�t B�o T�y T�y Ti�n ��n!", 0)
		return
	end

	if (DelItem(2, 0, 138, 1) == 1) then
		SetStrength(1 - nCurStrength)
		SetVitality(1 - nCurVitality)
		SetDexterity(1 - nCurDexterity)
		SetEnergy(1 - nCurEnergy)
		SetObserve(1 - nCurObserve)
		
		Say("B�n �� kh�i ph�c <color=yellow>to�n b� n�ng l�c<color>!", 0)
		Msg2Player("B�n �� kh�i ph�c to�n b� n�ng l�c!")
	else
		Say("B�n kh�ng c� <color=yellow>B�t B�o T�y T�y Ti�n ��n<color>!", 0)
	end
end;

