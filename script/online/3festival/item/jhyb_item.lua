Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyExp(400000);
		Msg2Player("B�n nh�n ���c 400000 �i�m kinh nghi�m");
	end;
end;