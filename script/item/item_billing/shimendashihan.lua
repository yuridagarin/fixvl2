------------------------------------------------------------
-- ʦ�Ŵ��º��Ľű� shimendashihan.lua
--
-- comment: ʹ�ú�ֱ�ӵ���73��
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1021
------------------------------------------------------------

FACTION_EVENT_ID = 345		-- ʦ��������¼�������ID��ŵ��������
shimendashihan_data = 87	-- �ϴ���ȡʦ�Ŵ��º�������

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n d�ng <color=yellow>s� m�n ��i s� h�m<color>? C� th� nh�n m�t nhi�m v� ��i s� ki�n.",
		2,
		"���c/use_shimendashihan",
		"Kh�ng s� d�ng/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function use_shimendashihan()
	local nCurLevel = GetLevel()
	if (nCurLevel < 50) then
		Say("B�n ch�a ��t ��n c�p <color=yellow>50<color>, kh�ng th� s� d�ng s� m�n ��i s� h�m!", 0)
		return
	end
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B�ng h�u ch�a b�i s� kh�ng th� s� d�ng s� m�n ��i s� h�m!", 0)
		return
	end
	
	--		          ��	       ��	       ��
	local nCurrTime = {date("%Y"), date("%m"), date("%d")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ���ڵ�����
	local nLastDate = GetTask(shimendashihan_data)
	if (nCurDate - nLastDate < 2) then
		Say("Hi�n s� m�n ch�a c� nhi�m v�, khi kh�c h�y quay l�i!", 0)
		return
	end
	
	local bHaveGotATask = GetTask(FACTION_EVENT_ID)
	if (bHaveGotATask ~= 0) then
		Say("B�n ch�a ho�n th�nh nhi�m v� tr��c, c� g�ng l�n!", 0)
		return
	end
	
	if (DelItem(2, 1, 1021, 1) == 1) then
		local nTaskID = StartFactionEvent()
		if (nTaskID ~= 0) then
			local nSel = random(1, 4)
			local strTaskInfo = QueryFactionEventInfo(nSel)
			Say(strTaskInfo, 0);
			Msg2Player("B�n nh�n ���c m�t nhi�m v� s� m�n ��i s�!")
			SetTask(shimendashihan_data, nCurDate)
			SetTask(FACTION_EVENT_ID, nTaskID)
		end
	end
end;

