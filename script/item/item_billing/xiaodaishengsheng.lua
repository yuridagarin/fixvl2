------------------------------------------------------------
-- С�������컯ɢ�Ľű� xiaodaishengsheng.lua
--
-- comment: �򿪺���10�������컯ɢ
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1036
-- �����Ԫ��ID: 1,0,16
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Trong n�y c� th� ch�a 10 <color=yellow>Sinh Sinh H�a T�n<color>, m� ch�?",
		2,
		"���c/open_10_shengshengzaohuasan",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������10�������컯ɢ
function open_10_shengshengzaohuasan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) then
		Say("S�c l�c c�a b�n kh�ng �� <color=yellow>70<color>, ch�a th� m� <color=yellow>Sinh Sinh H�a T�n-bao nh�<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1036, 1) == 1) then
		if (AddItem(1, 0, 16, 10,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 1036, 1)
		else
			Say("B�n nh�n ���c 10 <color=yellow>Sinh Sinh H�a T�n<color>!", 0)
			Msg2Player("B�n nh�n ���c 10 Sinh Sinh H�a T�n!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>Sinh Sinh H�a T�n-bao nh�<color>!", 0)
	end
end;

