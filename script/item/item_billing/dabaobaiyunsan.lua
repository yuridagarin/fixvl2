------------------------------------------------------------
-- �������ɢ�Ľű� dabaobaiyunsan.lua
--
-- comment: �򿪺���250������ɢ
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,486
-- ����ɢID: 1,0,4
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Ng��i mu�n m� tay n�i l�y 250 b�nh <color=yellow>B�ch V�n t�n<color> ch�? Xin x�c nh�n �� kho�ng tr�ng v� s�c l�c trong h�nh trang k�o ��nh r�i d��c ph�m!",
		2,
		"���c/open_250_baiyunsan",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- �򿪴�������250������ɢ
function open_250_baiyunsan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1500) then
		Say("S�c l�c c�a b�n kh�ng �� <color=yellow>1500<color>, kh�ng m� ���c <color=yellow>B�ch V�n t�n (��i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 486, 1) == 1) then
		if (AddItem(1, 0, 4, 250) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 486, 1)
		else
			Say("B�n nh�n ���c 250 b�nh <color=yellow>B�ch V�n t�n<color>!", 0)
			Msg2Player("B�n nh�n ���c 250 b�nh B�ch V�n t�n!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>B�ch V�n t�n (��i)<color>!", 0)
	end
end;
