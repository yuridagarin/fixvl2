--������ Begin

--��ѯ�����;�
AUTO_MOVE_QUERY_COST = 20

--������ End


function CanQueryTargetPlayerPos(nMaxDurability)

	if (nMaxDurability < AUTO_MOVE_QUERY_COST) then
		return 0
	end

	return 1

end


function QueryTargetPlayerPos(nItemIdxShenXing)

	if (nItemIdxShenXing <= 0) then
		return
	end

	if (AbradeItem(nItemIdxShenXing, AUTO_MOVE_QUERY_COST) <= 0) then
		Say("�� b�n Th�n H�nh b�o �i�n c�a b�n l� 0, tan r� th�nh t�ng m�nh!", 0)
		DelItemByIndex(nItemIdxShenXing, 0)					-- �;�Ϊ0Ҫɾ������Ʒ
	end

	Msg2Player("Xem t�a �� ng��i ch�i ti�u hao th�n h�nh"..AUTO_MOVE_QUERY_COST.." �i�m")

end