Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		format("Ti�m S�ch K� N�ng C�p 1-2/#show_equip_shop(%d)", 3047),
		format("Ti�m S�ch K� N�ng C�p 3-4/#show_equip_shop(%d)", 3048),
		"H�y b�/nothing",	
	}
	Say("H�y ch�n ti�m c�n ��i: ", getn(tSay), tSay);
end

function nothing()
	
end