--��Ǯ����Ʒ�ű�

function OnUse(nItemIdx)
	local nPrice = GetItemPrice(nItemIdx)
	if nPrice and nPrice > 0 then
		--��ɾ����ʹ�õ���
		if 1 == DelItemByIndex(nItemIdx, 1) then
			Earn(nPrice)
		end
	end
end