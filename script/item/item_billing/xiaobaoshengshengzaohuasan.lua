------------------------------------------------------------
-- С�������컯ɢ�Ľű� xiaobaoshengshengzaohuasan.lua
--
-- comment: �򿪺���100�������컯ɢ
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,483
-- �����컯ɢID: 1,0,16
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Ng��i mu�n m� tay n�i l�y 100 b�nh <color=yellow>Sinh Sinh H�a T�n<color> ch�? Xin ki�m tra s�c l�c v� h�nh trang tr��c, k�o ��nh r�i d��c ph�m!",
		2,
		"���c/open_100_shengshengzaohuasan",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������100�������컯ɢ
function open_100_shengshengzaohuasan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 700) then
		Say("S�c l�c kh�ng �� <color=yellow>700<color>, kh�ng m� ���c <color=yellow>Sinh Sinh H�a T�n (ti�u)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 483, 1) == 1) then
		if (AddItem(1, 0, 16, 100,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 483, 1)
		else
			Say("B�n nh�n ���c 100 b�nh <color=yellow>Sinh Sinh H�a T�n<color>!", 0)
			Msg2Player("B�n nh�n ���c 100 b�nh Sinh Sinh H�a T�n!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>Sinh Sinh H�a T�n (ti�u)<color>!", 0)
	end
end;

