------------------------------------------------------------
-- С��7���������Ľű� xiaobaojianding.lua
--
-- comment: �򿪺���10��7��������
-- creator: Tony(Jizheng)
-- Date   : Feb 9th, 2007
--
-- Item ID:  2,1,1057
-- 7��������: 2,5,7
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n m� g�i h�ng l�y 10 <color=yellow>gi�m ��nh ph� c�p 7<color>? Xin ch� � kho�ng tr�ng h�nh trang ho�c s�c l�c!",
		2,
		"���c/open_10_jianding",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������10��7��������
function open_10_jianding()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 10) then
		Say("S�c l�c c�a b�n kh�ng �� <color=yellow>10<color>, ch�a th� m� <color=yellow>gi�m ��nh ph� c�p 7-bao nh�<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1057, 1) == 1) then
		if (AddItem(2, 5, 7, 10,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 1057, 1)
		else
			Say("B�n nh�n ���c 10 <color=yellow>gi�p ��nh ph� c�p 7<color>!", 0)
			Msg2Player("B�n nh�n ���c 10 gi�m ��nh ph� c�p 7!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>gi�m ��nh ph� c�p 7-bao nh�<color>!", 0)
	end
end;

