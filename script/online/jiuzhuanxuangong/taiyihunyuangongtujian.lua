--̫�׻�Ԫ��ͼ��
--by vivi
--2008/10/10

function OnUse()
	Say("C� th� ��i 1000 t�m Th�i D�ch H�n Nguy�n C�ng l�y 1 quy�n Th�i D�ch H�n Nguy�n Ph� (c�n khi luy�n Ti�n Thi�n Th�i D�ch H�n Nguy�n C�ng). Ng��i x�c nh�n mu�n ��i ch�?",
		2,
		"���c/confirm_change",
		"Kh�ng c�n/nothing")	
end

function nothing()

end

function confirm_change()
	if GetItemCount(2,0,1082) < 1000 then
		Talk(1,"","Tr�n ng��i ng��i kh�ng c� 1000 t�m Th�i D�ch H�n Nguy�n C�ng.");
		return
	end
	if DelItem(2,0,1082,1000) == 1 then
		AddItem(2,0,1083,1);
		WriteLog("Ng��i ch�i"..GetName().."D�ng 1000 t�m Th�i D�ch H�n Nguy�n C�ng ��i 1 quy�nTh�i D�ch H�n Nguy�n Ph�.");
	end
end
