Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 50, "C�p 1 Luy�n L� Thi�t", {2, 1, 30527, 1}, 0},
		{1, 30, "C�p 2 Luy�n L� Thi�t", {2, 1, 30528, 1}, 0},
		{1, 15, "C�p 3 Luy�n L� Thi�t", {2, 1, 30529, 1}, 0},
		{1, 5, "Luy�n L� Thi�t c�p 4", {2, 1, 30530, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if GetItemCount(2,1,30539) < 1 then
		Talk(1,"",format("Trong h�nh trang kh�ng c� <color=red>%s<color>, kh�ng th� m� %s", "B� Ng�n Ch�y", "Luy�n L� Thi�t Kho�ng"));
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 and DelItem(2, 1, 30539, 1) ==  1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Luy�n L� Thi�t Kho�ng", "Luy�n L� Thi�t Kho�ng");
	end
end