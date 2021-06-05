--by liubo
--����ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");

VET_GOLD_BOX_AWARD = {
 	{2, 2000, 5000000, 1},
 	{3, 1000, 680000, 1},
 	{1, 900, "��i B�ch C�u ho�n", {2, 1, 1007, 1}, 7 * 24 * 3600},
 	{1, 900, "C��ng Tam Thanh ho�n", {2, 1, 1098, 1}, 7 * 24 * 3600},
 	{1, 900, "C��ng L�c Th�n ho�n", {2, 1, 1065, 1}, 7 * 24 * 3600},
 	{1, 400, "��i T� Linh Ho�n", {2, 1, 30459, 1}, 7 * 24 * 3600},
 	{1, 700, "B�ch C�u Ti�n ��n", {2, 1, 1008, 1}, 7 * 24 * 3600},
 	{1, 700, "Tam Thanh Ti�n ��n", {2, 1, 1099, 1}, 7 * 24 * 3600},
 	{1, 700, "L�c Th�n Ti�n ��n", {2, 1, 1066, 1}, 7 * 24 * 3600},
 	{1, 300, "T� Linh Ti�n ��n", {2, 1, 30460, 1}, 7 * 24 * 3600},
 	{1, 600, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
 	{1, 170, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
 	{1, 69, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
-- 	{1, 22, "Th�i D�ch H�n Nguy�n Ph�", {2, 0, 1083, 1}, 0},
--	{1, 6, "L�ng Ba Vi B�", {0, 112, 78, 1, 1}, 0},
	{31, 622, "Book_Pet1()", ""},
     {1, 39, "B�ch Kim R��ng", {2, 1, 30343, 1}, 0},
--     {1, 1, "Chuy�n Sinh ��n", {2, 1, 30345, 1}, 30 * 24 * 3600},
}
VET_BOOK_PET1 = {
	{1, 699, "Ch�n kh� h� th� C�p 1", {2,150,1,1}, 0},
	{1, 699, "�ch Th� Di�n D��ng C�p 1", {2,150,5,1}, 0},
	{1, 699, "C��ng Th�n B� Th� C�p 1", {2,150,9,1}, 0},
	{1, 699, "�m Phong Th�c C�t C�p 1", {2,150,13,1}, 0},
	{1, 456, "Huy�n V� V� Song C�p 1", {2,150,17,1}, 0},
	{1, 699, "V� H�nh V� T��ng C�p 1", {2,150,21,1}, 0},
	{1, 699, "Kim Linh Ph� Th� C�p 1", {2,150,25,1}, 0},
	{1, 699, "M�c Linh Ph� Th� C�p 1", {2,150,29,1}, 0},
	{1, 699, "Th�y Linh Ph� Th� C�p 1", {2,150,33,1}, 0},
	{1, 699, "H�a Linh Ph� Th� C�p 1", {2,150,37,1}, 0},
	{1, 699, "Th� Linh Ph� Th� C�p 1", {2,150,41,1}, 0},
	{1, 699, "Ph� Kh�ng Tr�m �nh C�p 1", {2,150,45,1}, 0},
	{1, 699, "S�t th��ng gia n�ng C�p 1", {2,150,49,1}, 0},
	{1, 456, "Khinh Linh T�n T�t C�p 1", {2,150,53,1}, 0},
	{1, 700, "V� H�nh Chi C� C�p 1", {2,150,57,1}, 0},
}

function OnUse(nItem)
	Talk(1, "", "T�nh n�ng t�m ��ng �� b�o tr�. B�n vui l�ng quay l�i sau !!")
	do return end
	local nDate = tonumber(date("%Y%m%d"))
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	
	if tbGioiHanThanTaiBaoRuong[nNation] ~= nil then
		if nDate < tbGioiHanThanTaiBaoRuong[nNation] then
			Talk(1,"","Th�i �i�m hi�n t�i ch�a cho ph�p ��i r��ng, c�c h� h�y s� d�ng sau nh�.")
			do	return	end
		end
	end
	
	if gf_CheckEventDateEx(46) ~= 1 then
		Talk(1,"",tSTRING_TREASUER_BOX[3])
		return 0
	end
	if gf_Judge_Room_Weight(1,200," ") ~= 1 then
        Talk(1,"",tSTRING_TREASUER_BOX[4])
		return 0
    end
	if DelItemByIndex(nItem,1) == 1 then
		gf_EventGiveRandAward(VET_GOLD_BOX_AWARD,10000, "", "Than Tai Bao Ruong","S� d�ng Kim R��ng")
	end
end

function Book_Pet1()
	gf_EventGiveRandAward(VET_BOOK_PET1,10000,"", "Than Tai Bao Ruong","S� d�ng Kim R��ng")
end