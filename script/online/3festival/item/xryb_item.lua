Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if GetExpScale() > 1 then
		Msg2Player("Gi� l� l�c tinh hoa tr�i ��t k�t h�p, tu luy�n ��t hi�u qu� m�c cao nh�t.");
	else
		if DelItemByIndex(nItemIdx,1) == 1 then
			DoubleExpTime(2*3600)
			Msg2Player("B�n c� 2 gi� nh�n ��i �i�m kinh nghi�m");
		end
	end
end;