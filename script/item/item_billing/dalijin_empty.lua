
function OnUse(nItemIdx)
	local selTab = {
			"��ng �/#confirm("..nItemIdx..")",
			"Ta suy ngh� l�i!/nothing",
			}
	Say("B�n mu�n ��t <color=yellow>999 l��ng<color> v�o trong bao l� x� ho�ng kim?",getn(selTab),selTab);
end;

function confirm(nItemIdx)
	if Pay(9990000) ~= 1 then
		Talk(1,"","Ng�n l��ng c�a b�n kh�ng ��!");
		return 0;
	end;
	local nRetCode = 0;
	if DelItemByIndex(nItemIdx,1) == 1 then
		nRetCode = AddItem(2,1,539,1)
		if nRetCode ~= 0 then
			Msg2Player("B�n th�nh c�ng b� 999 l��ng v�o bao l� x� ho�ng kim");
			AddRuntimeStat(14, 3, 0, 1)
			WriteLog(GetName().."Gh�p th�nh 1".."��i h�ng bao ho�ng kim");
		else
			WriteLog("[Bao l� x� ho�ng kim]:"..GetName().."��ng g�i bao l� x� ho�ng kim AddItem b�o l�i, tr� ph�n h�i:"..nRetCode);
		end;
	end;
end;

function nothing()

end;