Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(500000);
		Msg2Player("B�n nh�n ���c 500000 �i�m s�c kh�e");
	end;
end;