--小包通天令牌使用脚本
Include("\\script\\lib\\globalfunctions.lua")

function SmaTMSP_OnUse(nItem)
	--判断背包空间
	if gf_Judge_Room_Weight(1,1," ") ~= 1 then
     return 0;
	end
	if GetItemCount(2,1,30411) < 1 then
		Talk(1,"","Trong h祅h trang kh玭g c? Bao Th玭g Thi猲 L謓h nh?");
		return 0;
	end
	if DelItem(2,1,30411,1) == 1 then
		AddItem(2,1,30409,10);
	end
	return 1;
end