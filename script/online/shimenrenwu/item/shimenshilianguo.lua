function OnUse()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(1784) >= nDate then
		Talk(1,"","M�t ng�y ch� c� th� s� d�ng 1 l�n Th� Luy�n qu� s� m�n");
		return 0;
	end;
	if DelItem(2,1,424,1) == 1 then
		ModifyGoldenExp(1000000)
		Msg2Player("B�n nh�n ���c 1 tri�u �i�m s�c kh�e");
		SetTask(1784,nDate);
	end;
end;