--����赺ϰ�
Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(8,100) == 0 then
		Talk(1,"","Kho�ng tr�ng trong h�nh trang kh�ng ��, xin s�p x�p l�i r�i h�y m� Chu Li�n B�ch H�p bao.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_qingtie_packet(1);
		Msg2Player("B�n nh�n ���c 1 thi�p m�i");
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],9);
		Msg2Player("B�n nh�n ���c 9 L� Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],36);
		Msg2Player("B�n nh�n ���c 36 vi�n k�o m�ng");
		AddItem(2,3,214,36);
		Msg2Player("B�n nh�n ���c 36 vi�n ph�o")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],6);
		Msg2Player("B�n nh�n ���c 6 M�n Thi�n Th� Ti�t bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B�n nh�n ���c 1 quy�n thuy�t minh chi�n ��a.");
		WriteLog("[K�t h�n]:"..GetName().."M� Chu Li�n B�ch H�p bao");
	end
end;