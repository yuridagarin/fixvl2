function OnUse()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(1783) >= nDate then
		Talk(1,"","M�t ng�y ch� c� th� s� d�ng 1 l�n Th� Luy�n qu� s� m�n");
		return 0;
	end;
	if DelItem(2,1,423,1) == 1 then
		ModifyGoldenExp(400000)
		Msg2Player("B�n nh�n ���c 400000 �i�m s�c kh�e");
		SetTask(1783,nDate);
	end;
end;