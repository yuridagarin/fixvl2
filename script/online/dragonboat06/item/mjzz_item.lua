function OnUse()
	if GetPKFlag() ~= 0 then
		Msg2Player("Trong tr�ng th�i PK kh�ng th� s� d�ng b�nh nh�n m�t");
		return 0;
	end;
	if DelItem(2,1,389,1) == 1 then
		RestoreAll();
		Msg2Player("B�n �� �n 1 c�i b�nh �t m�t, h�i ph�c t�t c� sinh l�c, n�i l�c, th� l�c.");
		Msg2_LeiTai("B�nh nh�n m�t");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d�ng 1	"..szItemName);
end;
