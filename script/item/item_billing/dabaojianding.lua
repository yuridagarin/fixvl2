------------------------------------------------------------
-- ���7���������Ľű� dabaojianding.lua
--
-- comment: �򿪺���100��7��������
-- creator: Tony(Jizheng)
-- Date   : Feb 9th, 2007
--
-- Item ID:  2,1,1058
-- 7��������: 2,5,7
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n m� g�i h�ng l�y 100 t�m <color=yellow>gi�m ��nh ph� c�p 7<color>? Xin ki�m tra h�nh trang v� s�c l�c!",
		2,
		"���c/open_100_jianding",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������100��7��������
function open_100_jianding()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 100) then
		Say("S�c l�c c�a b�n kh�ng �� <color=yellow>100<color> t�m th�i kh�ng th� m� <color=yellow>gi�m ��nh ph� c�p 7-bao l�n<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1058, 1) == 1) then
		if (AddItem(2, 5, 7, 100,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 1058, 1)
		else
			Say("B�n nh�n ���c 100 <color=yellow>gi�m ��nh ph� c�p 7<color>!", 0)
			Msg2Player("B�n nh�n ���c 100 gi�m ��nh ph� c�p 7!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>gi�m ��nh ph� c�p 7-bao l�n<color>!", 0)
	end
end;

