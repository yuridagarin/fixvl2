
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(880000);
		Msg2Player("B�n m� h�ng bao nh�n ���c 88 v�ng");
		WriteLog("[K�t h�n]:"..GetName().."�� m� 1 ti�u h�ng bao");
	end
end;