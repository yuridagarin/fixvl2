function OnUse()
	if GetPKFlag() ~= 0 then
		Msg2Player("Trong tr�ng th�i PK kh�ng th� s� d�ng b�nh �t Gia H�ng");
		return 0;
	end;
	if DelItem(2,1,392,1) == 1 then
		RestoreAll();
		ModifyExp(500000)
		Msg2Player("B�n �n 1 b�nh �t Gia H�ng nh�n ���c 50 v�n kinh nghi�m, l�p t�c h�i ph�c sinh l�c v� n�i l�c");
		WriteLog(GetName().."�� �n 1 c�i b�nh �t gia h�ng");
		Msg2_LeiTai("B�nh �t Gia H�ng");
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(23,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(29,GetName().."S� d�ng 1	"..szItemName);
	Msg2MSAll(30,GetName().."S� d�ng 1	"..szItemName);
end;
