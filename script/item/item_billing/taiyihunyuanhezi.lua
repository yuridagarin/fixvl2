--̫��ͼ������
--by vivi
--2008/11/20

function OnUse()
	Say("D�ng Th�i D�ch �� (h�p) s� nh�n ���c 10 Th�i D�ch H�n Nguy�n C�ng ��, d�ng ch�?",
		2,
		"\nS� d�ng/give_tujian",
		"\nKh�ng c�n/nothing")
end

function give_tujian()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return 0;
	end
	if DelItem(2,0,1093,1) == 1 then	
		AddItem(2,0,1082,10);
		Msg2Player("B�n nh�n ���c 10 Th�i D�ch H�n Nguy�n C�ng ��");
	end
end

function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho�ng tr�ng<color> trong h�nh trang kh�ng ��!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--�ж���Ҹ��غͿռ�
		Talk (1,"","<color=red>S�c l�c<color> c�a b�n kh�ng ��!")
		return 0
	else 
		return 1
	end
end