function OnUse()
	local selTab = {
				"D�ng th�i! K�o h� m�t!/use",
				"�� d�nh sau n�y d�ng/nothing",
				}
	Say("D�ng Th� Luy�n Qu� c� th� t�ng 100 v�n �i�m s�c kh�e! Vui l�ng kh�ng d�ng qu� nhi�u k�o v��t qu� m�c t�i �a!",getn(selTab),selTab);
end;

function use()
	if DelItem(2,0,392,1) == 1 then
		local nGoldenExp = ModifyGoldenExp(1000000);
		Msg2Player("B�n �� d�ng 1 Th� Luy�n Qu�, �i�m s�c kh�e t�ng l�n 100 v�n!");
		WriteLog("[D�ng Th� Luy�n Qu�]:"..GetName().."D�ng 1 Th� Luy�n Qu�");
		if nGoldenExp >= 10000000 then
			Msg2Player("�i�m s�c kh�e c�a b�n �� v��t qu� 1 ng�n v�n, h� th�ng s� thu h�i ph�n v��t m�c khi b�n r�i m�ng. Xin ��c bi�t ch� �!")
		end;
	end;
end;

function nothing()

end;