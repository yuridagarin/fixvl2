Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 50, "C�p 1 T�y T�m Th�ch", {2, 1, 30521, 1}, 0},
		{1, 30, "C�p 2 T�y T�m Th�ch", {2, 1, 30522, 1}, 0},
		{1, 15, "C�p 3 T�y T�m Th�ch", {2, 1, 30523, 1}, 0},
		{1, 5, "T�y T�m Th�ch c�p 4", {2, 1, 30524, 1}, 0},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if GetItemCount(2,1,30538) < 1 then
		Talk(1,"",format("Trong h�nh trang kh�ng c� <color=red>%s<color>, kh�ng th� m� %s", "B� Ng�n To�n", "T�y T�m Th�ch Kho�ng"));
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 and DelItem(2, 1, 30538, 1) ==  1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "T�y T�m Th�ch Kho�ng", "T�y T�m Th�ch Kho�ng");
	end
end