
function OnUse(nItemIdx)
	local selTab = {
			"��ng �/#confirm("..nItemIdx..")",
			"Ta suy ngh� l�i!/nothing",
			}
	Say("B�n mu�n b� <color=yellow>360 v�ng<color> v�o T� Kim ��i h�ng bao?",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if Pay(3600000) ~= 1 then
		Talk(1,"","Ng�n l��ng c�a b�n kh�ng ��!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		nRetCode = AddItem(2,1,537,1)
		if nRetCode ~= 0 then
			Msg2Player("B�n b� th�nh c�ng 360 v�ng v�o T� Kim ��i h�ng bao!");
		else
			WriteLog("[T� Kim ��i h�ng bao]:"..GetName().."Trong l�c ��ng g�i T� Kim ��i h�ng bao AddItem b� l�i, tr� ph�n h�i:"..nRetCode);
		end;
	end;
end;

function nothing()

end;