------------------------------------------------------------
-- ��Ѫ��Ľű� longxuewan.lua
--
-- comment: ʹ�ú�ֱ�ӵ���73��
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1002
------------------------------------------------------------
Include("\\script\\lib\\writelog.lua")

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n d�ng <color=yellow>Long Huy�t ho�n<color>? B�n s� l�p t�c ��t c�p 73.",
		2,
		"���c/use_longxue_wan",
		"Kh�ng s� d�ng/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function use_longxue_wan()
	local nCurLevel = GetLevel()
	if (nCurLevel >= 73) then
		Say("B�n �� ��t c�p <color=yellow>73<color> kh�ng th� d�ng Long Huy�t ho�n!", 0)
		return
	end
	
	if (DelItem(2, 1, 1002, 1) == 1) then
		ResetProperty()
		SetLevel(73, 469)
		ModifyExp(20000000)
		Say("B�n �� ��t c�p <color=yellow>73<color> v� �i�m ti�m n�ng �� ���c t�y, xin ��ng nh�p l�i!", 0)
		Msg2Player("B�n �� ��t c�p 73 ��ng th�i nh�n ���c 2000 v�n kinh nghi�m. Xin ��ng nh�p l�i!")
		WriteLogEx("Giang Sinh 2008","s� d�ng Long Huy�t Ho�n")
	end
end;

