------------------------------------------------------------
-- С�����������Ľű� xiaobaoheiyuduanxugao.lua
--
-- comment: �򿪺���100�����������
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,489
-- ���������ID: 1,0,6
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Ng��i mu�n m� tay n�i l�y 100 b�nh <color=yellow>H�c Ng�c �o�n T�c Cao<color> ch�? Xin ki�m tra s�c l�c v� h�nh trang tr��c, k�o ��nh r�i d��c ph�m!",
		2,
		"���c/open_100_heiyuduanxugao",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������100�����������
function open_100_heiyuduanxugao()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 700) then
		Say("S�c l�c kh�ng �� <color=yellow>700<color>, kh�ng m� ���c <color=yellow>H�c Ng�c �o�n T�c Cao (ti�u)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 489, 1) == 1) then
		if (AddItem(1, 0, 6, 100,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 489, 1)
		else
			Say("B�n nh�n ���c 100 b�nh <color=yellow>H�c Ng�c �o�n T�c Cao<color>!", 0)
			Msg2Player("B�n nh�n ���c 100 b�nh H�c Ng�c �o�n T�c Cao!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>H�c Ng�c �o�n T�c Cao (ti�u)<color>!", 0)
	end
end;

