Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 50, "Huy Ch��ng ��ng Ch�", {0, 153, 1, 1}, 0},
		{1, 30, "Huy Ch��ng Thi�t Ch�", {0, 153, 2, 1}, 0},
		{1, 14, "Huy Ch��ng Ng�c Ch�", {0, 153, 3, 1}, 0},
		{1, 1, "Huy Ch��ng Kim Ch� ng� h�nh", {0, 153, 4, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch��ng M�c Ch� ng� h�nh", {0, 153, 5, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch��ng Th�y Ch� ng� h�nh", {0, 153, 6, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch��ng H�a Ch� ng� h�nh", {0, 153, 7, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch��ng Th� Ch� ng� h�nh", {0, 153, 8, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch��ng �m Ch� ng� h�nh", {0, 153, 9, 1}, 0, 0, 0, 1},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "T�i Huy Ch��ng Anh H�ng", "T�i Huy Ch��ng Anh H�ng");
	end
end