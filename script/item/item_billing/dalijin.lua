
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(9990000)
		Msg2Player("B�n m� bao l� x� ho�ng kim nh�n ���c 999 l��ng");
		WriteLog("[K�t h�n]:"..GetName().."B�n �� m� 1 bao l� x� ho�ng kim");
	end;
end;