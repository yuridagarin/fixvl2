function OnUse()
	if DelItem(2,1,394,1) == 1 then
		local nLevel = GetLevel();
		local nNeedExp = floor((nLevel^2*125000)/(80^2))
		ModifyExp(nNeedExp)
		Msg2Player("B�n nh�n ���c "..nNeedExp.." �i�m kinh nghi�m");
		ModifyReputation(5,0);
		Msg2Player("B�n nh�n ���c 5 �i�m danh v�ng.");
	end;
end;