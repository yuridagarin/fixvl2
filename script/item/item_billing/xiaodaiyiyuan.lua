------------------------------------------------------------
-- С��һԪ��ʼ���Ľű� xiaodaiyiyuan.lua
--
-- comment: �򿪺���10��һԪ��ʼ��
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1033
-- һԪ��ʼ��ID: 1,0,10
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Trong n�y c� th� ch�a 10 <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n<color>, m� ch�?",
		2,
		"���c/open_10_yiyuanfushidan",
		"T�m th�i kh�ng m�--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ��С�������10��һԪ��ʼ��
function open_10_yiyuanfushidan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 60) then
		Say("S�c l�c c�a b�n kh�ng �� <color=yellow>60<color>, ch�a th� m� <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n-bao nh�<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1033, 1) == 1) then
		if (AddItem(1, 0, 10, 10,5) == 0) then	-- ����д���û�и�����������һ����
			AddItem(2, 1, 1033, 1)
		else
			Say("B�n nh�n ���c 10 <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n<color>!", 0)
			Msg2Player("B�n nh�n ���c 10 Nh�t Nguy�n Ph�c Th�y ��n!")
		end
	else
		Say("B�n kh�ng mang theo <color=yellow>Nh�t Nguy�n Ph�c Th�y ��n-bao nh�<color>!", 0)
	end
end;

