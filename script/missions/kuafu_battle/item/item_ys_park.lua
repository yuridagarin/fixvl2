Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 70, "Huy Ch��ng ��ng Ch�", {0, 153, 1, 1}, 0},
		{1, 25, "Huy Ch��ng Thi�t Ch�", {0, 153, 2, 1}, 0},
		{1, 5, "Huy Ch��ng Ng�c Ch�", {0, 153, 3, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "T�i Huy Ch��ng D�ng S�", "T�i Huy Ch��ng D�ng S�");
	end
end