Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	local tAward = {
		{1, 10, "�o Cho�ng T�o B�",     {0, 152, 1, 1}, 0},	
		{1, 20, "�o Cho�ng C�m �o�n",     {0, 152, 2, 1}, 0},
		{1, 35, "�o Cho�ng H�a V�n",     {0, 152, 3, 1}, 0},
		{1,  4, "�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1}, 0},
		{1,  4, "�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1}, 0},
		{1,  4, "�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1}, 0},
		{1,  4, "�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1}, 0},
		{1,  4, "�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1}, 0},
		{1, 15, "�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1}, 0},
	}
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "R��ng �o Cho�ng Cao C�p", "D��ng th�nh trang b�");
	end
end