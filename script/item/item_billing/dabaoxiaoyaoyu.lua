--�����ң��
function OnUse(nItem)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		AddItem(2,1,30603,1000);
	end
end