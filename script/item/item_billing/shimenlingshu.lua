------------------------------------------------------------
-- ʦ������Ľű� shimenlingshu.lua
--
-- comment: ʹ�ú�ʦ�Ź��׶Ȼ��2���ӳ�
-- creator: Tony(Jizheng)
-- Date   : Jan 18th, 2007
--
-- Item ID:  2,1,1016
------------------------------------------------------------

LAST_USE_DATE = 85
MULTI_COUNT = 86

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n d�ng <color=yellow>s� m�n l�nh th�<color>? N� c� th� gi�p b�n nh�n �� c�ng hi�n s� m�n g�p <color=yellow>2 l�n<color>.",
		2,
		"���c/use_shimenlingshu",
		"Kh�ng s� d�ng/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function use_shimenlingshu()
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B�ng h�u ch�a b�i s�, kh�ng th� s� d�ng s� m�n l�nh th�!", 0)
		return
	end

	local nLastDate = GetTask(LAST_USE_DATE)
	local nMultiCount = GetTask(MULTI_COUNT)
	
	--		          ��	       ��	       ��
	local nCurrTime = {date("%Y"), date("%m"), date("%d")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ���ڵ�����
	
	if (nCurDate > nLastDate) then
		if (DelItem(2, 1, 1016, 1) == 1) then
			SetTask(LAST_USE_DATE, nCurDate)
			SetTask(MULTI_COUNT, 2)
			Say("B�n �� d�ng <color=yellow>s� m�n l�nh th�<color>, nh�n ���c �� c�ng hi�n s� m�n g�p 2 l�n!", 0)
			Msg2Player("B�n �� d�ng s� m�n l�nh th� nh�n ���c �� c�ng hi�n s� m�n g�p 2 l�n!")
		end
	elseif (nMultiCount == 2) then
		Say("B�n �� d�ng 1 <color=yellow>S� m�n l�nh th�<color>, ng�y mai h�y quay l�i!", 0)
	elseif (nMultiCount == 3) then
		Say("H�m nay b�n �� s� d�ng 1 <color=yellow>S� m�n l�nh k�<color>, ng�y mai h�y quay l�i!", 0)
	end
end;

