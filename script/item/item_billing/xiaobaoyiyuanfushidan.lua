------------------------------------------------------------
-- С��һԪ��ʼ���Ľű� xiaobaoyiyuanfushidan.lua
--
-- comment: �򿪺���100��һԪ��ʼ��
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,493
-- һԪ��ʼ��ID: 1,0,10
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Ng��i mu�n m� tay n�i l�y 100 b�nh <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n<color> ch�? Xin ki�m tra s�c l�c v� h�nh trang tr��c, k�o ��nh r�i d��c ph�m!",
		2,
		"���c/open_100_yiyuanfushidan",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������100��һԪ��ʼ��
function open_100_yiyuanfushidan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 600) then
		Say("S�c l�c kh�ng �� <color=yellow>600<color>, kh�ng m� ���c <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n (ti�u)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 493, 1) == 1) then
		if (AddItem(1, 0, 10, 100,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 493, 1)
		else
			Say("B�n nh�n ���c 100 b�nh <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n<color>!", 0)
			Msg2Player("B�n nh�n ���c 100 b�nh Nh�t Nguy�n Ph�c Th�y ��n!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n (ti�u)<color>!", 0)
	end
end;

