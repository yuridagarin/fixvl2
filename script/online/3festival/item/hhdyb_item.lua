Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(100000);
		Msg2Player("B�n nh�n ���c 100000 �i�m s�c kh�e");
		local nRand = random(1,100);
		if nRand <= 25 then
			CastState("state_confusion",0,10*18,1,211000);
			Msg2Player("H�n lo�n 10 gi�y");
		elseif nRand <= 50 then
			CastState("state_vertigo",0,10*18,1,213000);
			Msg2Player("B� cho�ng 10 gi�y");
		end;
	end;
end;