------------------------------------------------------------
-- С�����������Ľű� xiaodaiheiyu.lua
--
-- comment: �򿪺���10�����������
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1032
-- ���������ID: 1,0,6
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("M� g�i h�ng n�y b�n c� th� nh�n ���c 10 <color=yellow>H�c Ng�c �o�n T�c Cao<color>, m� ch�?",
		2,
		"���c/open_10_heiyuduanxugao",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������10�����������
function open_10_heiyuduanxugao()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) then
		Say("S�c l�c c�a b�n kh�ng �� <color=yellow>70<color>, ch�a th� m� <color=yellow>H�c Ng�c �o�n T�c Cao-bao nh�<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1032, 1) == 1) then
		if (AddItem(1, 0, 6, 10,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 1032, 1)
		else
			Say("B�n nh�n ���c 10 <color=yellow>H�c Ng�c �o�n T�c Cao<color>!", 0)
			Msg2Player("B�n nh�n ���c 10 H�c Ng�c �o�n T�c Cao!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>H�c Ng�c �o�n T�c Cao-bao nh�<color>!", 0)
	end
end;

