Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	local tAward = {
		{1, 190, "Huy Ch��ng ��ng Ch�", {0, 153, 1, 1}, 0},
		{1, 190, "�o Cho�ng T�o B�", {0, 152, 1, 1}, 0},
		{1, 190, "Gi�y V�i Th�", {0, 154, 1, 1}, 0},
		{1, 100, "Huy Ch��ng Thi�t Ch�", {0, 153, 2, 1}, 0},	
		{1, 100, "�o Cho�ng C�m �o�n", {0, 152, 2, 1}, 0},
		{1, 100, "Tinh Tr� B� H�i", {0, 154, 2, 1}, 0},
		{1, 26, "Huy Ch��ng Ng�c Ch�", {0, 153, 3, 1}, 0},
		{1, 26, "�o Cho�ng H�a V�n", {0, 152, 3, 1}, 0},
		{1, 30, "B� Ch� Cao ��ng Ngoa", {0, 154, 3, 1}, 0},
		{1, 3, "Huy Ch��ng Kim Ch� ng� h�nh", {0, 153, 4, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch��ng M�c Ch� ng� h�nh", {0, 153, 5, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch��ng Th�y Ch� ng� h�nh", {0, 153, 6, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch��ng H�a Ch� ng� h�nh", {0, 153, 7, 1}, 0, 0, 0, 1},
		{1, 3, "Huy Ch��ng Th� Ch� ng� h�nh", {0, 153, 8, 1}, 0, 0, 0, 1},
		{1, 1, "Huy Ch��ng �m Ch� ng� h�nh", {0, 153, 9, 1}, 0, 0, 0, 1},
		{1, 3, "�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1}, 0, 0, 0, 1},
		{1, 3, "�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1}, 0, 0, 0, 1},
		{1, 3, "�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1}, 0, 0, 0, 1},
		{1, 3, "�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1}, 0, 0, 0, 1},
		{1, 3, "�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1}, 0, 0, 0, 1},
		{1, 1, "�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1}, 0, 0, 0, 1},
		{1, 3, "Chi�n H�i Kim Ch� ng� h�nh", {0, 154, 4, 1}, 0, 0, 0, 1},
		{1, 3, "Chi�n H�i M�c Ch� ng� h�nh", {0, 154, 5, 1}, 0, 0, 0, 1},
		{1, 3, "Chi�n H�i Th�y Ch� ng� h�nh", {0, 154, 6, 1}, 0, 0, 0, 1},
		{1, 3, "Chi�n H�i H�a Ch� ng� h�nh", {0, 154, 7, 1}, 0, 0, 0, 1},
		{1, 3, "Chi�n H�i Th� Ch� ng� h�nh", {0, 154, 8, 1}, 0, 0, 0, 1},
		{1, 1, "Chi�n H�i �m Ch� ng� h�nh", {0, 154, 9, 1}, 0, 0, 0, 1},
	}
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "T�i Trang B� Kim X� Cu�ng V�", "T�i Trang B� Kim X� Cu�ng V�");
	end
end