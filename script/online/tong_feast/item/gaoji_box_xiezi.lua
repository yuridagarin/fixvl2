Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	local tAward = {
		{1, 10, "Gi�y V�i Th�",       {0, 154, 1, 1}, 0},	
		{1, 20, "Tinh Tr� B� H�i",     {0, 154, 2, 1}, 0},
		{1, 35, "B� Ch� Cao ��ng Ngoa",   {0, 154, 3, 1}, 0},
		{1,  4, "Chi�n H�i Kim Ch� ng� h�nh", {0, 154, 4, 1}, 0},
		{1,  4, "Chi�n H�i M�c Ch� ng� h�nh", {0, 154, 5, 1}, 0},
		{1,  4, "Chi�n H�i Th�y Ch� ng� h�nh", {0, 154, 6, 1}, 0},
		{1,  4, "Chi�n H�i H�a Ch� ng� h�nh", {0, 154, 7, 1}, 0},
		{1,  4, "Chi�n H�i Th� Ch� ng� h�nh", {0, 154, 8, 1}, 0},
		{1, 15, "Chi�n H�i �m Ch� ng� h�nh", {0, 154, 9, 1}, 0},
	}
	if DelItemByIndex(nItem, 1) == 1 then
		gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "R��ng Gi�y Cao C�p", "D��ng th�nh trang b�");
	end
end