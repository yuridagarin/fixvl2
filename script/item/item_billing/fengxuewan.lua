------------------------------------------------------------
-- ��Ѫ��Ľű� fengxuewan.lua
--
-- comment: ʹ�ú�ֱ�ӵ���4000ʦ������
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1004
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n d�ng <color=yellow>Ph�ng Huy�t ho�n<color>? Sau khi ph�c d�ng �� c�ng hi�n s� m�n s� ��t 4000 �i�m.",
		2,
		"���c/use_fengxue_wan",
		"Kh�ng s� d�ng/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function use_fengxue_wan()
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("Ch�a b�i s� h�c ngh� kh�ng th� d�ng Ph�ng Huy�t ho�n!", 0)
		return
	end

	local nCurFactionRepu = GetTask(336)
	if (nCurFactionRepu >= 4000) then
		Say("�� c�ng hi�n s� m�n c�a b�n tr�n m�c <color=yellow>4000<color>, kh�ng c�n d�ng th�m Ph�ng Huy�t ho�n!", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 72) then
		Say("B�n ch�a ��t c�p <color=yellow>72<color> kh�ng th� d�ng Ph�ng Huy�t ho�n!", 0)
		return
	end
	
	if (DelItem(2, 1, 1004, 1) == 1) then
		SetTask(336, 4000)
		Say("�� c�ng hi�n s� m�n c�a b�n �� ��t <color=yellow>4000<color>!", 0)
		Msg2Player("�� c�ng hi�n s� m�n c�a b�n �� ��t 4000!")
	end
end;

