------------------------------------------------------------
-- ����ɢ�Ľű� xiaojiesan.lua
--
-- comment: ϴ1��PKֵ
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,141
------------------------------------------------------------

CHANGE_PK_VALUE = -1

-- �ű�������Ĭ�ϵ��õ���ں���
function OnUse()
	Say("Sau khi d�ng <color=yellow>Ti�u Ki�p t�n<color> c� th� gi�m �i 1 �i�m PK, d�ng ch�?",
		2,
		"���c/decrease_1_PK_points",
		"Ta kh�ng mu�n d�ng--H�y b�/cancel_dialog")
end;

-- �˳��Ի��������κβ���
function cancel_dialog()
end;

-- ȷ�ϼ���һ��PKֵ
function decrease_1_PK_points()
	local nCurPKValue = GetPKValue()
	if (nCurPKValue <= 0) then
		Say("<color=yellow>Tr� PK<color> c�a b�n l� 0, kh�ng c�n d�ng Ti�u Ki�p t�n!", 0)
		return
	end

	if (DelItem(2, 0, 141, 1) == 1) then
		AddPKValue(CHANGE_PK_VALUE)
		Say("<color=yellow>Tr� PK<color> c�a b�n gi�m 1 �i�m.", 0)
		Msg2Player("B�n �� gi�m 1 �i�m PK!")
	else
		Say("B�n kh�ng mang theo <color=yellow>Ti�u Ki�p t�n<color>!", 0)
	end
end;
