Include("\\script\\lib\\globalfunctions.lua")
function OnUse(nItem)
	if gf_Judge_Room_Weight(1,10) ~= 1 then
    Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
  end
  if DelItem(2,1,30389,1) == 1 then
  	AddItem(2,1,30391,10);
  	Msg2Player(format("C�c h� nh�n ���c Xuy�n V�n Ti�n x%d",10));
  end
end