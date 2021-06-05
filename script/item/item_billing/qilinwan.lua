------------------------------------------------------------
-- ������Ľű� qilinwan.lua
--
-- comment: ʹ�ú�ֱ�ӵ���3000����
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1003
------------------------------------------------------------

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("B�n mu�n d�ng <color=yellow>K� L�n ho�n<color>? B�n s� nh�n ���c 3000 �i�m danh v�ng.",
		2,
		"���c/use_qilin_wan",
		"Kh�ng s� d�ng/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

function use_qilin_wan()
	local nCurRepu = GetReputation()
	if (nCurRepu >= 3000) then
		Say("Danh v�ng c�a b�n �� ��t <color=yellow>3000<color> kh�ng c�n d�ng th�m K� L�n ho�n!", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 31) then
		Say("��ng c�p b�n ch�a ��t <color=yellow>31<color> kh�ng th� s� d�ng K� L�n ho�n!", 0)
		return
	end
	
	if (DelItem(2, 1, 1003, 1) == 1) then
		ModifyReputation(3000 - nCurRepu, 0)
		Say("Danh v�ng c�a b�n �� ��t <color=yellow>3000<color>!", 0)
		Msg2Player("Danh v�ng c�a b�n �� ��t 3000!")
	end
end;

