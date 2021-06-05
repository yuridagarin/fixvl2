--by liubo
--�׽���ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\treasure_box\\string.lua")
Include("\\script\\vng\\config\\newserver.lua");

VET_PLATINA_BOX_AWARD  = {
	{2, 2600, 10000000, 1},
    	{3, 1000, 790000, 1},
    	{1, 2600, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    	{1, 1000, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    	{1, 500, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    	{1, 100, "T�i Thi�n Th�ch Tinh Th�ch", {2, 1, 3356, 1}, 7 * 24 * 3600},
    	{1, 100, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
    	{1, 100, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
    	{1, 100, "��i ��nh H�n", {2, 1, 1113, 1}, 7 * 24 * 3600},
	{31, 1200, "Book_Pet1()", ""},
	{31, 600, "Book_Pet2()", ""},
	{1, 100, "Th�n T�i B�o R��ng", {2, 1, 30344, 1}, 0},
};

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

VET_BOOK_PET2 = {
	{1, 699, "Ch�n kh� h� th� C�p 2", {2,150,2,1}, 0},
	{1, 699, "�ch Th� Di�n D��ng C�p 2", {2,150,6,1}, 0},
	{1, 699, "C��ng Th�n B� Th� C�p 2", {2,150,10,1}, 0},
	{1, 699, "�m Phong Th�c C�t C�p 2", {2,150,14,1}, 0},
	{1, 456, "Huy�n V� V� Song C�p 2", {2,150,18,1}, 0},
	{1, 699, "V� H�nh V� T��ng C�p 2", {2,150,22,1}, 0},
	{1, 699, "Kim Linh Ph� Th� C�p 2", {2,150,26,1}, 0},
	{1, 699, "M�c Linh Ph� Th� C�p 2", {2,150,30,1}, 0},
	{1, 699, "Th�y Linh Ph� Th� C�p 2", {2,150,34,1}, 0},
	{1, 699, "H�a Linh Ph� Th� C�p 2", {2,150,38,1}, 0},
	{1, 699, "Th� Linh Ph� Th� C�p 2", {2,150,42,1}, 0},
	{1, 699, "Ph� Kh�ng Tr�m �nh C�p 2", {2,150,46,1}, 0},
	{1, 699, "S�t th��ng gia n�ng C�p 2", {2,150,50,1}, 0},
	{1, 456, "Khinh Linh T�n T�t C�p 2", {2,150,54,1}, 0},
	{1, 700, "V� H�nh Chi C� C�p 2", {2,150,58,1}, 0},
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
		gf_EventGiveRandAward(VET_PLATINA_BOX_AWARD,10000, "", "Than Tai Bao Ruong","S� d�ng B�ch Kim R��ng")
	end
end


function Book_Pet1()
	gf_EventGiveRandAward(VET_BOOK_PET1,10000,"", "Than Tai Bao Ruong","S� d�ng Kim R��ng")
end


function Book_Pet2()
	gf_EventGiveRandAward(VET_BOOK_PET2,10000,"", "Than Tai Bao Ruong","S� d�ng B�ch Kim R��ng")
end