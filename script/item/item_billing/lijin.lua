
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(3600000)
		Msg2Player("B�n �� m� 1 T� Kim h�ng bao nh�n ���c 360 v�ng");
		WriteLog("[K�t h�n]:"..GetName().."B�n �� m� 1 T� Kim ��i h�ng bao");
	end;
end;