Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(1000000);
		Msg2Player("B�n nh�n ���c 1 tri�u �i�m kinh nghi�m");
	end;
end;