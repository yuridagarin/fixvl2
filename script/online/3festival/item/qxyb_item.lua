Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(1500000);
		Msg2Player("B�n nh�n ���c 1500000 �i�m kinh nghi�m");
		if random(1,100) <= 5 then
			local nRetCode = AddItem(tItemInfo[12][2],tItemInfo[12][3],tItemInfo[12][4],1,1,-1,-1,-1,-1,-1,-1);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c m�t bao thu�c c�a Nguy�t L��ng Th�");
				WriteLog("[Tam ti�t li�n th�ng]:"..GetName().."nh�n ���c m�t bao thu�c c�a Nguy�t L��ng Th�");
			else
				WriteLog("[L�i Tam ti�t li�n th�ng]:"..GetName().."L�i nh�n ���c bao thu�c c�a Nguy�t L��ng Th�, tr� quay l�i AddItem:"..nRetCode);
			end;
		end;
	end;
end;