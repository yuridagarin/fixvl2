------------------------------------------------------------
-- ��������ƽ����Ľű� dabaotianxiangyunjinxu.lua
--
-- comment: �򿪺���250�������ƽ���
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,488
-- �����ƽ���ID: 1,0,5
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Ng��i mu�n m� tay n�i l�y 250 b�nh <color=yellow>Thi�n H��ng C�m T�c<color> ch�? Xin x�c nh�n �� kho�ng tr�ng v� s�c l�c trong h�nh trang k�o ��nh r�i d��c ph�m!",
		2,
		"���c/open_250_tianxiangyunjinxu",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- �򿪴�������250�������ƽ���
function open_250_tianxiangyunjinxu()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1500) then
		Say("S�c l�c c�a b�n kh�ng �� <color=yellow>1500<color>, kh�ng m� ���c <color=yellow>Thi�n H��ng C�m T�c (��i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 488, 1) == 1) then
		if (AddItem(1, 0, 5, 250) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 488, 1)
		else
			Say("B�n nh�n ���c 250 b�nh <color=yellow>Thi�n H��ng C�m T�c<color>!", 0)
			Msg2Player("B�n nh�n ���c 250 b�nh Thi�n H��ng C�m T�c!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>Thi�n H��ng C�m T�c (��i)<color>!", 0)
	end
end;

