--ճ���ĵ�
function OnUse(id)
	local nRet = InsertAddenda(id)--ճ����¼
	if nRet == -2 then
		Msg2Player("M�t t�ch c�a b�n �� kh�a, kh�ng th� th�m b� ki�p v�o!")
	elseif nRet == -3 then
		Msg2Player("B� ki�p �� kh�a! Kh�ng th� th�m m�t t�ch v�o!")
	end
end
