--����ͬ�İ�
Include("\\script\\���\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(17,30) == 0 then
		Talk(1,"","Kho�ng tr�ng trong h�nh trang kh�ng ��, s�p x�p l�i r�i h�y m� V�nh K�t ��ng T�m bao");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local task_date = GetTask(TASK_WEDDING_DATE)
		local task_para = GetTask(TASK_WEDDING_FIELD)
		add_invitation(10,task_date,task_para);
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],3);
		Msg2Player("B�n nh�n ���c 3 L� Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],8);
		Msg2Player("B�n nh�n ���c 8 vi�n k�o");
		AddItem(2,3,214,6);
		Msg2Player("B�n nh�n ���c 6 vi�n ph�o")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],1);
		Msg2Player("B�n nh�n ���c 1 M�n Thi�n Th� Ti�t bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B�n nh�n ���c 1 quy�n thuy�t minh chi�n ��a.");
		WriteLog("[K�t h�n]:"..GetName().."M� V�nh K�t ��ng T�m bao");
	end
end;