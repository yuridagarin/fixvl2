Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(3000000);
		Msg2Player("B�n nh�n ���c 3 tri�u �i�m kinh nghi�m");
		if GetSex() == 1 then
			if random(1,100) <= 2 then
				local nRetCode = AddItem(tItemInfo[14][2],tItemInfo[14][3],tItemInfo[14][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c 1 H�u Ngh� L�c Nh�t Ho�n");
					WriteLog("[Tam ti�t li�n th�ng]:"..GetName().."Nh�n ���c 1 H�u Ngh� L�c Nh�t Ho�n");
				else
					WriteLog("[L�i Tam ti�t li�n th�ng]:"..GetName().."L�i nh�n ���c H�u Ngh� L�c Nh�t Ho�n, tr� quay l�i AddItem:"..nRetCode);
				end;
			end;
		else
			if random(1,100) <= 2 then
				local nRetCode = AddItem(tItemInfo[13][2],tItemInfo[13][3],tItemInfo[13][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("B�n nh�n ���c c�i H�ng Nga Nguy�t V� ��i");
					WriteLog("[Tam ti�t li�n th�ng]:"..GetName().."nh�n ���c 1 H�ng Nga Nguy�t V� ��i");
				else
					WriteLog("[L�i Tam ti�t li�n th�ng]:"..GetName().."L�i nh�n ���c H�ng Nga Nguy�t Quang Gi�i, tr� quay l�i AddItem:"..nRetCode);
				end;
			end;
		end;
	end;
end;