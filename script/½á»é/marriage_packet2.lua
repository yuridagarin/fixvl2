--��ɪ������
Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(6,50) == 0 then
		Talk(1,"","Kho�ng tr�ng trong h�nh trang kh�ng ��, xin s�p x�p l�i r�i h�y m� C�m S�t H�a Minh bao.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_qingtie_packet(1);
		Msg2Player("B�n nh�n ���c 1 thi�p m�i");
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],6);
		Msg2Player("B�n nh�n ���c 6 L� Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],18);
		Msg2Player("B�n nh�n ���c 18 vi�n k�o m�ng");
		AddItem(2,3,214,18);
		Msg2Player("B�n nh�n ���c 18 vi�n ph�o");
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],3);
		Msg2Player("B�n nh�n ���c 3 M�n Thi�n Th� Ti�t bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B�n nh�n ���c 1 quy�n thuy�t minh chi�n ��a.");
		WriteLog("[K�t h�n]:"..GetName().."M� C�m S�t H�a Minh bao");
	end
end;