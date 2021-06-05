ITEM_LIANLIGUO 	 = {2, 1, 534}	-- �����

function OnUse(item)
	if (check_fruit(item) == 1) then
		local exp = GetItemParam(item, 0)
		Say(format("Li�n L� qu� ch�a <color=red>%d<color> �i�m kinh nghi�m, b�n mu�n s� d�ng kh�ng?", exp),
			2,
			format("S� d�ng /#use_fruit(%d)", item),
			"�� ta suy ngh� l�i/cancel")
	end
end

function get_string(num)
	return tonumber(num)
end

function check_fruit(item)
	local mate_name = GetMateName()
	if (mate_name == "") then
		Talk(1, "", "B�n ch�a k�t h�n kh�ng th� d�ng Li�n L� qu�")
	else
		local self_code = GetItemParam(item, 1)
		local mate_code = GetItemParam(item, 2)
		if (get_string(self_code) ~= get_string(UnsignedHash(GetName()))) then
			Talk(1, "", "Li�n L� qu� n�y kh�ng ph�i c�a b�n, kh�ng th� s� d�ng")
		elseif (get_string(mate_code) ~= get_string(UnsignedHash(mate_name))) then
			Talk(1, "", "Li�n L� qu� n�y kh�ng ph�i ph�i ng�u cho b�n, kh�ng th� s� d�ng")
		else
			return 1
		end
	end
	return 0
end

function cancel()
end

function use_fruit(item)
	if (ITEM_LIANLIGUO[1] ~= GetItemGenre(item) or
		ITEM_LIANLIGUO[2] ~= GetItemDetail(item) or
		ITEM_LIANLIGUO[3] ~= GetItemParticular(item)) then
		return
	end
	
	if (check_fruit(item) == 1) then
		local exp = GetItemParam(item, 0)
		ModifyExp(exp)
		DelItemByIndex(item, 1)
		Msg2Player(format("B�n d�ng 1 Li�n L� qu�, nh�n ���c %d �i�m kinh nghi�m", exp))
		WriteLog("[K�t h�n]:"..GetName().." �� d�ng 1 Li�n L� qu�, nh�n ���c"..exp.." �i�m kinh nghi�m");
	end	
end
