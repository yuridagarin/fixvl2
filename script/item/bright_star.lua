function OnUse(goods_index)
	local nPlace = GetItemPlace(goods_index)
	if nPlace == 1 then
		CastState("state_dispear",1,72,1,122601)
		Msg2Player("Tr�ng th�i v� ��ch k�o d�i 4 gi�y.")
		SetItemUseLapse(goods_index,5400)	--��ȴʱ�䣺5����
		return 1
	end
	return 0
end

function OnEquip()
	return 0
end

function CanEquip()
	return 0
end

function OnUnEquip()
	return 0
end
