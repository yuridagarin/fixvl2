--С��ͨ������ʹ�ýű�
Include("\\script\\lib\\globalfunctions.lua")

function SmaTMSP_OnUse(nItem)
	--�жϱ����ռ�
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
     return 0;
	end
	if GetItemCount(2,1,30411) < 1 then
		Talk(1,"","Trong h�nh trang kh�ng c� Bao Th�ng Thi�n L�nh nh�");
		return 0;
	end
	if DelItem(2,1,30411,1) == 1 then
		AddItem(2,1,30409,10);
	end
	return 1;
end