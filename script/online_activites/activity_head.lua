Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua") 
Include("\\script\\lib\\globalfunctions.lua")

--���nLv�ȼ��ĳ��＼����
function ahf_GetPetBook(nLv)
	if not nLv then return 0; end
	local nLevel = tonumber(nLv)
	if nLevel < 1 or nLevel > 4 then return 0; end
	local T_Pet_Book = {
			{1, 6, format("C�p %d Ch�n Kh� H� Th�", nLevel), {2, 150,	1 +nLevel-1, 1}, 0},
			{1, 6, format("C�p %d �ch Th� Di�n D��ng", nLevel), {2, 150,	5 +nLevel-1, 1}, 0},
			{1, 6, format("C�p %d C��ng Th�n B� Th�", nLevel), {2, 150,	9 +nLevel-1, 1}, 0},
			{1, 6, format("C�p %d �m Phong Th�c C�t", nLevel), {2, 150,	13+nLevel-1, 1}, 0},
			{1, 6, format("C�p %d Huy�n V� V� Song", nLevel), {2, 150,	17+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d Ng� H�nh V� T��ng", nLevel), {2, 150,	21+nLevel-1, 1}, 0},
			{1, 7, format(" C�p %d Kim Linh Ph� Th�", nLevel), {2, 150,	25+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d M�c Linh Ph� Th�", nLevel), {2, 150,	29+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d Th�y Linh Ph� Th�", nLevel), {2, 150,	33+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d H�a Linh Ph� Th�", nLevel), {2, 150,	37+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d Th� Linh Ph� Th�", nLevel), {2, 150,	41+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d Ph� Kh�ng Tr�m �nh", nLevel), {2, 150,	45+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d S�t Th��ng Gia Th�m", nLevel), {2, 150,	49+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d Khinh Linh T�n T�t", nLevel), {2, 150,	53+nLevel-1, 1}, 0},
			{1, 7, format("C�p %d V� H�nh Chi C�", nLevel), {2, 150,	57+nLevel-1, 1}, 0}, 
	}
	gf_EventGiveRandAward(T_Pet_Book, gf_SumRandBase(T_Pet_Book), 1, "ACTIVITY_HEAD", format("C�p %d S�ch K� N�ng B�n ��ng H�nh",nLevel));
end

--��1�����ˮ��(����nNum)
function ahf_GetAFruits(nNum)
	local tAward = {
		{"Nh�n", 2,	1,	30164},
		{"Ch�m Ch�m", 2,	1,	30165},
		{"Cam", 2,	1,	30166},
		{"D�a", 2,	1,	30167},
		{"M�ng c�t", 2,	1,	30168},
		{"B��i", 2,	1,	30169},
		{"D�u", 2,	1,	30170},
		{"Chu�i", 2,	1,	30171},
		{"Xo�i", 2,	1,	30172},
		{"��o", 2,	1,	30173},
		{"M�n", 2,	1,	30174},
		{"V�i", 2,	1,	30175},
		{"T�o", 2,	1,	30176},
		{"B�", 2,	1,	30177},
		{"�u ��", 2,	1,	30178},
		{"M�ng C�u", 2,	1,	30179},
		{"Kh�m", 2,	1,	30180},
		{"L�", 2,	1,	30181},
		{"B�n Bon", 2,	1,	30182},
		{"Kh�", 2,	1,	30183},		
	}
	local nRand = random(getn(tAward));
	if GetFreeItemRoom() > 0 then
		gf_AddItemEx({tAward[nRand][2], tAward[nRand][3], tAward[nRand][4], nNum or 1}, tAward[nRand][1]);
	end
end

--���n��ÿ��1��ˮ��
function ahf_GetNFruits(nNum)
	if not nNum then return 0; end
	for i = 1, nNum do
		ahf_GetAFruits()
	end
end

--70���߼��ؼ�
function ahf_Get70GaojiMiji(bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsBand = bIsBand or 4
	local tBook = {
		[2] =  {0, 107, 166, "Kim Cang B�t Nh� Kinh"},
		[4] =  {0, 107, 167, "Ti�m Long T�ch Di�t Kinh"},
		[3] =  {0, 107, 168, "V� Tr�n B� �� Kinh"},
		[6] =  {0, 107, 169, "Thi�n La Li�n Ch�u L�c"},
		[8] =  {0, 107, 170, "Nh� � Kim ��nh M�t T�ch"},
		[9] =  {0, 107, 171, "B�ch H�i Tuy�t �m Ph�"},
		[11] = {0, 107, 172, "H�n ��n Tr�n Nh�c M�t T�ch"},
		[12] = {0, 107, 173, "Qu� Thi�n Du Long M�t T�ch"},
		[14] = {0, 107, 174, "Huy�n �nh M� Tung M�t T�ch"},
		[15] = {0, 107, 175, "Qu�n T� Ti�t Phong M�t T�ch"},
		[17] = {0, 107, 176, "Tr�n Qu�n Phi Long Th��ng Ph�"},
		[18] = {0, 107, 177, "Xuy�n V�n L�c H�ng M�t T�ch"},
		[20] = {0, 107, 178, "U Minh Phong Ma L�c"},
		[21] = {0, 107, 179, "Linh C� Huy�n T� L�c"},
		[23] = {0, 107, 198, "C�u Thi�n Phong L�i Quy�t"},
		[29] = {0, 107, 202, "H�ng Tr�n T�y M�ng Ph�"},
		[30] = {0, 107, 203, "Phong Hoa Thi�n Di�p Ph�"},
	}
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0; end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, bIsBand}, tBook[nIndex][4], "ACTIVITY_HEAD", "M�t Tich 70 Cao C�p", 0, 1);
end

function ahf_GetFyWeapon()
	local VET_FY_WEAPON = {
		{1, 675, "Ph� Y�n �ao", {0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Ph� Y�n c�n", {0, 5, 6002, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Ph� Y�n tr��ng", {0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "H�m Y�n th�", {0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "T�ng Y�n ch�m", {0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Phi Y�n ki�m", {0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "V�n Y�n c�m", {0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "V�n Y�n th�", {0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "L�u Y�n c�n", {0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "Huy�n Y�n ki�m", {0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "V� Y�n b�t", {0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "H� Ti�m Th��ng", {0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 675, "H�nh Y�n Cung", {0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 625, "Tr�c Y�n nh�n", {0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 600, "Y�u Y�n tr�o", {0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FY_WEAPON,10000,1, "ACTIVITY_HEAD")
end

function ahf_GiveShimenCloth9()
	--Faction Cloth 9
	local VET_FACTION_CLOTH_9 = {
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Y", {0, 100, 2131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Y", {0, 100, 2132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Y", {0, 100, 2133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Y", {0, 100, 2134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n Long B�t B� Kh�i Gi�p", {0, 100, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n Long B�t B� Kh�i Gi�p", {0, 100, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� L��ng Ph�p T�n Thi�n ��nh B�o", {0, 100, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� L��ng Ph�p T�n Thi�n ��nh B�o", {0, 100, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B�o La H�n ��i Th�a Kh�i Gi�p ", {0, 100, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B�o La H�n ��i Th�a Kh�i Gi�p ", {0, 100, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u C�n", {0, 100, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u C�n", {0, 100, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u C�n", {0, 100, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u C�n", {0, 100, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�ch Li�n Ti�n T� B�o �n Y", {0, 100, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�ch Li�n Ti�n T� B�o �n Y", {0, 100, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng�c V�n Ti�n T� Huy�n H�n Y", {0, 100, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng�c V�n Ti�n T� Huy�n H�n Y", {0, 100, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Y", {0, 100, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Y", {0, 100, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Y", {0, 100, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Y", {0, 100, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du Y", {0, 100, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du Y", {0, 100, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du Y", {0, 100, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du Y", {0, 100, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang B�o", {0, 100, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang B�o", {0, 100, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang B�o", {0, 100, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang B�o", {0, 100, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n Ph�c", {0, 100, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n Ph�c", {0, 100, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n Ph�c", {0, 100, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n Ph�c", {0, 100, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng Ngao Kh� Chi�n kh�i", {0, 100, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng Ngao Kh� Chi�n kh�i", {0, 100, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng Ngao Kh� Chi�n kh�i", {0, 100, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng Ngao Kh� Chi�n kh�i", {0, 100, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D�c M�nh S� Chi�n kh�i", {0, 100, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D�c M�nh S� Chi�n kh�i", {0, 100, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D�c M�nh S� Chi�n kh�i", {0, 100, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "H� D�c M�nh S� Chi�n kh�i", {0, 100, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Huy�t Y", {0, 100, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Huy�t Y", {0, 100, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Huy�t Y", {0, 100, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Huy�t Y", {0, 100, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FACTION_CLOTH_9,10000,1, "ACTIVITY_HEAD")
end
function ahf_GiveShimenWeapon9()
	--Faction Weapon 9
	local VET_FACTION_WEAPON_9 = {
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Tr�o", {0, 11, 2131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Tr�o", {0, 11, 2132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Tr�o", {0, 11, 2133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� ��ng La S�t Tr�m Huy�t Tr�o", {0, 11, 2134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B� Thi�n Long Thi�n Ch�ng �ao", {0, 3, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B� Thi�n Long Thi�n Ch�ng �ao", {0, 3, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B� Thi�n Long Thi�n Ch�ng C�n", {0, 5, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B� Thi�n Long Thi�n Ch�ng C�n", {0, 5, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� L��ng Ph�p T�n Thi�n Tr��ng", {0, 8, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "V� L��ng Ph�p T�n Thi�n Tr��ng", {0, 8, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B�o La H�n ��i Th�a Th�", {0, 0, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�t B�o La H�n ��i Th�a Th�", {0, 0, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u Ch�m", {0, 1, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u Ch�m", {0, 1, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u Ch�m", {0, 1, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Thi�n C� S� Gi� Th�n Tri�u Ch�m", {0, 1, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�ch Li�n Ti�n T� B�o U�n Ki�m", {0, 2, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "B�ch Li�n Ti�n T� B�o U�n Ki�m", {0, 2, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng�c V�n Ti�n T� Huy�n H�n C�m", {0, 10, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ng�c V�n Ti�n T� Huy�n H�n C�m", {0, 10, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Th�", {0, 0, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Th�", {0, 0, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Th�", {0, 0, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long ��u Th�n C�i ��ng V�n Th�", {0, 0, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du C�n", {0, 5, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du C�n", {0, 5, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du C�n", {0, 5, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Kh�t Thi�n Th�n C�i V�n Du C�n", {0, 5, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang Ki�m", {0, 2, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang Ki�m", {0, 2, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang Ki�m", {0, 2, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Ch��ng Kinh Thanh Quang Ki�m", {0, 2, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n B�t", {0, 9, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n B�t", {0, 9, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n B�t", {0, 9, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Th�i �t T�n Nh�n H�o Nhi�n B�t", {0, 9, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng T��ng Qu�n Th��ng", {0, 6, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng T��ng Qu�n Th��ng", {0, 6, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng T��ng Qu�n Th��ng", {0, 6, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "Long T��ng T��ng Qu�n Th��ng", {0, 6, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D�c T��ng Qu�n Cung", {0, 4, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D�c T��ng Qu�n Cung", {0, 4, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D�c T��ng Qu�n Cung", {0, 4, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 20, "H� D�c T��ng Qu�n Cung", {0, 4, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Nh�n", {0, 7, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Nh�n", {0, 7, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Nh�n", {0, 7, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},
		{1, 30, "U Minh Qu� S�t Tu La Nh�n", {0, 7, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}
	} 
	gf_EventGiveRandAward(VET_FACTION_WEAPON_9,10000,1, "ACTIVITY_HEAD")
end

--�߼����
function ahf_GetGaojiZhenjuan(bIsByRoute, nNum, bIsBand)
	if not nNum or nNum <= 0 then
		return
	end
	bIsBand = bIsBand or 4
	local tBook = {
		[2] = {0, 107, 204, "Kim Cang B�t Nh� Ch�n Quy�n "},
		[3] = {0, 107, 206, "V� Tr�n B� �� Ch�n Quy�n"},
		[4] = {0, 107, 205, "Ti�m Long T�c Di�t Ch�n Quy�n"},
		[6] = {0, 107, 207, "Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0, 107, 208, "Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0, 107, 209, "B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0, 107, 210, "H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0, 107, 211, "Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0, 107, 212, "Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0, 107, 213, "Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0, 107, 214, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0, 107, 215, "Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0, 107, 216, "Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0, 107, 217, "Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0, 107, 218, "C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0, 107, 222, "H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0, 107, 223, "Phong Hoa Thi�n Di�p Ch�n Quy�n"},	
	}
	local nIndex = 0
	if bIsByRoute and bIsByRoute == 1 then
		nIndex = GetPlayerRoute();
	else
		local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not tBook[nIndex] then return 0; end
	gf_AddItemEx2({tBook[nIndex][1],tBook[nIndex][2],tBook[nIndex][3], nNum, bIsBand}, tBook[nIndex][4], "ACTIVITY_HEAD", "Ch�n khuy�n cao c�p c�p 70", 0, 1);
end

--ҫ����
VET_YAOYANG_CLOTH = {
	[2] = {
		[1] = {{0, 100, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� B�o"},
	  [2] = {{0, 100, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� B�o"},
	},
	[3] = {
		[1] = {{0, 100, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� B�o"},
	  [2] = {{0, 100, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� B�o"},
	},
	[4] = {
		[1] = {{0, 100, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� B�o"},
	  [2] = {{0, 100, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� B�o"},
	},
	[6] = {
		[1] = {{0, 100, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
		[2] = {{0, 100, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
		[3] = {{0, 100, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
		[4] = {{0, 100, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Y"},
	},
	[8] = {
		[3] = {{0, 100, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Y"},
		[4] = {{0, 100, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Y"},
	},
	[9] = {
		[3] = {{0, 100, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Y"},
		[4] = {{0, 100, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Y"},
	},
	[11] = {
		[1] = {{0, 100, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
		[2] = {{0, 100, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
		[3] = {{0, 100, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
		[4] = {{0, 100, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"},
	},
	[12] = {
		[1] = {{0, 100, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Y"},
		[2] = {{0, 100, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Y"},
		[3] = {{0, 100, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Y"},
		[4] = {{0, 100, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Y"},
	},
	[14] = {
		[1] = {{0, 100, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n B�o"},
		[2] = {{0, 100, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n B�o"},
		[3] = {{0, 100, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n B�o"},
		[4] = {{0, 100, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n B�o"},
	},
	[15] = {
		[1] = {{0, 100, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
		[2] = {{0, 100, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
		[3] = {{0, 100, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
		[4] = {{0, 100, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n B�o"},
	},
	[17] = {
		[1] = {{0, 100, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
		[2] = {{0, 100, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
		[3] = {{0, 100, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
		[4] = {{0, 100, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Gi�p"},
	},
	[18] = {
		[1] = {{0, 100, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
		[2] = {{0, 100, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
		[3] = {{0, 100, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
		[4] = {{0, 100, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"},
	},
	[20] = {
		[1] = {{0, 100, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Y"},
		[2] = {{0, 100, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Y"},
		[3] = {{0, 100, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Y"},
		[4] = {{0, 100, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Y"},
	},
	[21] = {
		[1] = {{0, 100, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Y"},
		[2] = {{0, 100, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Y"},
		[3] = {{0, 100, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Y"},
		[4] = {{0, 100, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Y"},
	},
	[23] = {
		[1] = {{0, 100, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n B�o"},
		[2] = {{0, 100, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n B�o"},
	},
	[25] = {
		[1] = {{0, 100, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"},
		[2] = {{0, 100, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"},
		[3] = {{0, 100, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"},
		[4] = {{0, 100, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"},
	},
	[26] = {
		[1] = {{0, 100, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� B�o"},
		[2] = {{0, 100, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� B�o"},
		[3] = {{0, 100, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� B�o"},
		[4] = {{0, 100, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� B�o"},
	},
	[27] = {
		[1] = {{0, 100, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng B�o"},
		[2] = {{0, 100, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng B�o"},
		[3] = {{0, 100, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng B�o"},
		[4] = {{0, 100, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng B�o"},
	},
	[29] = {
		[3] = {{0, 100, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Y"},
		[4] = {{0, 100, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Y"},
	},
	[30] = {
		[3] = {{0, 100, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T� Y"},
		[4] = {{0, 100, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T� Y"},
	},
}

--ҫ��ͷ
VET_YAOYANG_CAP = {
	[2]  = {
		[1] = {{0, 103, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� M�o"},
		[2] = {{0, 103, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� M�o"},
	},
	[3]  = {                                                                            
		[1] = {{0, 103, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� M�o"},         
		[2] = {{0, 103, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� M�o"},
	}, 
	[4]  = {
		[1] = {{0, 103, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� M�o"},
		[2] = {{0, 103, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� M�o"},
	},	
	[6]  = {
		[1] = {{0, 103, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},
		[2] = {{0, 103, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},
		[3] = {{0, 103, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},
		[4] = {{0, 103, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"},
	},
	[8]  = {
		[3] = {{0, 103, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Tr�m"},
		[4] = {{0, 103, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Tr�m"},
	},
	[9]  = {
		[3] = {{0, 103, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m"},
		[4] = {{0, 103, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m"},
	},
	[11] = {
		[1] = {{0, 103, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},
		[2] = {{0, 103, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},
		[3] = {{0, 103, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},
		[4] = {{0, 103, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"},
	},
	[12] = {
		[1] = {{0, 103, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t C�n"},
		[2] = {{0, 103, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t C�n"},
		[3] = {{0, 103, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t C�n"},
		[4] = {{0, 103, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t C�n"},
	},
	[14] = {
		[1] = {{0, 103, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},
		[2] = {{0, 103, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},
		[3] = {{0, 103, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},
		[4] = {{0, 103, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Qu�n"},
	},
	[15] = {
		[1] = {{0, 103, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},
		[2] = {{0, 103, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},
		[3] = {{0, 103, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},
		[4] = {{0, 103, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"},
	},
	[17] = {
		[1] = {{0, 103, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},
		[2] = {{0, 103, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},
		[3] = {{0, 103, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},
		[4] = {{0, 103, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Kh�i"},
	},
	[18] = {
		[1] = {{0, 103, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},
		[2] = {{0, 103, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},
		[3] = {{0, 103, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},
		[4] = {{0, 103, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"},
	},
	[20] = {
		[1] = {{0, 103, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n C�n"},
		[2] = {{0, 103, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n C�n"},
		[3] = {{0, 103, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n C�n"},
		[4] = {{0, 103, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n C�n"},
	},
	[21] = {
		[1] = {{0, 103, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng C�n"},
		[2] = {{0, 103, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng C�n"},
		[3] = {{0, 103, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng C�n"},
		[4] = {{0, 103, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng C�n"},
	},
	[23] = {
		[1] = {{0, 103, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n"},
		[2] = {{0, 103, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n"},
	},
	[25] = {
		[1] = {{0, 103, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"},
		[2] = {{0, 103, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"},
		[3] = {{0, 103, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"},
		[4] = {{0, 103, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"},
	},
	[26] = {
		[1] = {{0, 103, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"},
		[2] = {{0, 103, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"},
		[3] = {{0, 103, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"},
		[4] = {{0, 103, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"},
	},
	[27] = {
		[1] = {{0, 103, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Qu�n"},
		[2] = {{0, 103, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Qu�n"},
		[3] = {{0, 103, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Qu�n"},
		[4] = {{0, 103, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Qu�n"},
	},
	[29] = {
		[3] = {{0, 103, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Tr�m"},
		[4] = {{0, 103, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Tr�m"},
	},
	[30] = {
		[3] = {{0, 103, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T� Tr�m"},
		[4] = {{0, 103, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T� Tr�m"},
	},
}  

--ҫ���
VET_YAOYANG_SHOE = {
	[2] = {
	  [1] = {{0, 101, 3128, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
		[2] = {{0, 101, 3129, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Trang"},
	},
	[4] = {
		[1] = {{0, 101, 3130, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
		[2] = {{0, 101, 3131, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Trang"},
	},
	[3] = {
		[1] = {{0, 101, 3132, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
		[2] = {{0, 101, 3133, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Trang"},
	},
	[6] = {
		[1] = {{0, 101, 3134, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[2] = {{0, 101, 3135, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[3] = {{0, 101, 3136, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
		[4] = {{0, 101, 3137, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Trang"},
	},
	[8] = {
		[3] = {{0, 101, 3138, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
		[4] = {{0, 101, 3139, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"},
	},
	[9] = {
		[3] = {{0, 101, 3140, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
		[4] = {{0, 101, 3141, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"},
	},
	[11] = {
		[1] = {{0, 101, 3142, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[2] = {{0, 101, 3143, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[3] = {{0, 101, 3144, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
		[4] = {{0, 101, 3145, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"},
	},
	[12] = {
		[1] = {{0, 101, 3146, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[2] = {{0, 101, 3147, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[3] = {{0, 101, 3148, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
		[4] = {{0, 101, 3149, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t Trang"},
	},
	[14] = {
		[1] = {{0, 101, 3150, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[2] = {{0, 101, 3151, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[3] = {{0, 101, 3152, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
		[4] = {{0, 101, 3153, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n Trang"},
	},
	[15] = {
		[1] = {{0, 101, 3154, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[2] = {{0, 101, 3155, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[3] = {{0, 101, 3156, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
		[4] = {{0, 101, 3157, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 3158, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[2] = {{0, 101, 3159, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[3] = {{0, 101, 3160, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
		[4] = {{0, 101, 3161, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Trang"},
	},
	[18] = {
		[1] = {{0, 101, 3162, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[2] = {{0, 101, 3163, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[3] = {{0, 101, 3164, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
		[4] = {{0, 101, 3165, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"},
	},
	[20] = {
		[1] = {{0, 101, 3166, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[2] = {{0, 101, 3167, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[3] = {{0, 101, 3168, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
		[4] = {{0, 101, 3169, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n Trang"},
	},
	[21] = {
		[1] = {{0, 101, 3170, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[2] = {{0, 101, 3171, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[3] = {{0, 101, 3172, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
		[4] = {{0, 101, 3173, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Trang"},
	},
	[23] = {
		[1] = {{0, 101, 3174, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
		[2] = {{0, 101, 3175, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"},
	},
	[25] = {
		[1] = {{0, 101, 3176, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[2] = {{0, 101, 3177, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[3] = {{0, 101, 3178, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
		[4] = {{0, 101, 3179, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"},
	},
	[26] = {
		[1] = {{0, 101, 3180, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[2] = {{0, 101, 3181, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[3] = {{0, 101, 3182, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
		[4] = {{0, 101, 3183, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� Trang"},
	},
	[27] = {
		[1] = {{0, 101, 3184, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[2] = {{0, 101, 3185, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[3] = {{0, 101, 3186, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
		[4] = {{0, 101, 3187, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Trang"},
	},
	[29] = {
		[3] = {{0, 101, 3188, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
		[4] = {{0, 101, 3189, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Qu�n"},
	},
	[30] = {
		[3] = {{0, 101, 3190, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
		[4] = {{0, 101, 3191, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T�"},
	},
}
--ҫ������
VET_YAOYANG_WEAPON = {
		[2] = {{0, 3,	8992, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� N�n T�n Gi� Ph�t �ao"},														
		[3] = {{0, 8,	8994, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� �ch T�n Gi� Ph�t Tr��ng"},	
		[4] = {{0, 0,	8993, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-�� Ki�p T�n Gi� Ph�t Th�"},																
		[6] = {{0, 1,	8995, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V�n Ki�p Th�nh Th� Tr�m"},																	
		[8] = {{0, 2,	8996, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t V�n Th�nh C� Li�n Ki�m"},																	
		[9] = {{0, 10,	8997, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ph�t Tr�n Th�nh C� C�m"},																	
		[11] = {{0, 0,	8998, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Th�"},																	
		[12] = {{0, 5,	8999, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Du Long ��a Kh�t C�n"},																	
		[14] = {{0, 2,	9000, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-V� C�c Thi�n T�n T�c Ki�m"},																	
		[15] = {{0, 9,	9001, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�ch L�c Thi�n T�n B�t"},																	
		[17] = {{0, 6,	9002, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�m Thi�n ��u H�n Th��ng"},																	
		[18] = {{0, 4,	9003, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-��nh Thi�n Th�n Ngh� Cung"},																	
		[20] = {{0, 7,	9004, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Qu� X�c T� Th�n �ao"},																	
		[21] = {{0, 11,	9005, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Vu C�t ��c V��ng Tr�o"},																	
		[23] = {{0, 2,	9006, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-B�t ��ng Ch�n Ti�n Ki�m"},																	
		[25] = {{0, 3,	9007, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n �ao"},																	
		[26] = {{0, 9,	9008, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-C�u Thi�n Qu� Ph� B�t"},																	
		[27] = {{0, 11,	9009, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Ma �nh Th�n T�ng Tr�o"},																	
		[29] = {{0, 13,	9010, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-T� V�n Ti�n T� Phi�n"},
		[30] = {{0, 12,	9011, 1, 4, -1, -1, -1, -1, -1, -1}, "Di�u D��ng-Phi H� Ti�n T� �u Lan Ti�u"},
}

--�����ҫ��
function ahf_GetYaoYangRand(nIndex)
	local tAward = {
		VET_YAOYANG_CLOTH,
		VET_YAOYANG_CAP,
		VET_YAOYANG_SHOE,
	}
	nIndex = nIndex or random(getn(tAward))
	if nIndex < 1 or nIndex > getn(tAward) then
		print("UDERROR:ahf_GetYaoYangRand nIndex < 1 or nIndex > getn(tAward)")
		return
	end
	local tSubAward = tAward[nIndex];
	if not tSubAward then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tSubAward")
		return 
	end	
	local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
	local tSub2Award = tSubAward[tRoute[random(getn(tRoute))]];
	if not tSub2Award then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tSub2Award")
		return 
	end
	local tBody = {}
	for k, _ in tSub2Award do
		tinsert(tBody, k)
	end
	if getn(tBody) <= 0 then
		WriteLog("[exec] ahf_GetYaoYangRand() failed! getn(tBody) <= 0")
		return 
	end
	local tRet = tSub2Award[tBody[random(getn(tBody))]];
	if not tRet or getn(tRet) ~= 2 then 
		WriteLog("[exec] ahf_GetYaoYangRand() failed! not tRet or getn(tRet) ~= 2")
		return 
	end
	gf_AddItemEx2(tRet[1], tRet[2], "ACTIVITY_HEAD", "trang b� Di�u D��ng ng�u nhi�n", 0, 1);
end

--��ҫ������
function ahf_GetYaoYangWeaponRand(IsByRoute)
	local nIndex = 1
	local tRoute = {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,29,30}
	if IsByRoute and IsByRoute == 1 then
		nIndex = GetPlayerRoute()
	else
		nIndex = tRoute[random(getn(tRoute))]
	end
	if not VET_YAOYANG_WEAPON[nIndex] then
		return
	end
	gf_AddItemEx2(VET_YAOYANG_WEAPON[nIndex][1], VET_YAOYANG_WEAPON[nIndex][2], "ACTIVITY_HEAD", "V� kh� Di�u D��ng ng�u nhi�n", 0, 1)
end

--���������͸�ҫ��
function ahf_GetYaoYangByRouteBody(tAward)
	if not tAward then return 0; end
	local nRoute = GetPlayerRoute();
	local tRouteList = tAward[nRoute];
	if not tRouteList then
		Talk(1,"","M�n ph�i nh�n v�t b�t th��ng, kh�ng th� nh�n th��ng!")
		return 0;
	end
	local nBody = GetBody();
	local tBodyList = tRouteList[nBody];
	if not tBodyList or getn(tBodyList) < 2 then
		Talk(1,"","H�nh th� nh�n v�t b�t th��ng, kh�ng th� nh�n th��ng!")
		return 0;
	end
	gf_AddItemEx2(tBodyList[1], tBodyList[2], "ACTIVITY_HEAD", "Theo h� ph�i t�ng trang b� Di�u D��ng", 0, 1);
end

--���3�ǽ���װ��
function ahf_GetLevel3JSEquip()
	local tAward = {
		{1, 7, "�o Cho�ng H�a V�n", {0, 152, 3, 1}, 0},
		{1, 5, "�o Cho�ng Ng� H�nh Kim Ch�", {0, 152, 4, 1}, 0},
		{1, 5, "�o Cho�ng Ng� H�nh M�c Ch�", {0, 152, 5, 1}, 0},
		{1, 5, "�o Cho�ng Ng� H�nh Th�y Ch�", {0, 152, 6, 1}, 0},
		{1, 5, "�o Cho�ng Ng� H�nh H�a Ch�", {0, 152, 7, 1}, 0},
		{1, 5, "�o Cho�ng Ng� H�nh Th� Ch�", {0, 152, 8, 1}, 0},
		{1, 1, "�o Cho�ng Ng� H�nh �m Ch�", {0, 152, 9, 1}, 0},
		{1, 7, "Huy Ch��ng Ng�c Ch�", {0, 153, 3, 1}, 0},
		{1, 5, "Huy Ch��ng Kim Ch� ng� h�nh", {0, 153, 4, 1}, 0},
		{1, 5, "Huy Ch��ng M�c Ch� ng� h�nh", {0, 153, 5, 1}, 0},
		{1, 5, "Huy Ch��ng Th�y Ch� ng� h�nh", {0, 153, 6, 1}, 0},
		{1, 5, "Huy Ch��ng H�a Ch� ng� h�nh", {0, 153, 7, 1}, 0},
		{1, 5, "Huy Ch��ng Th� Ch� ng� h�nh", {0, 153, 8, 1}, 0},
		{1, 1, "Huy Ch��ng �m Ch� ng� h�nh", {0, 153, 9, 1}, 0},
		{1, 7, "B� Ch� Cao ��ng Ngoa", {0, 154, 3, 1}, 0},
		{1, 5, "Chi�n H�i Kim Ch� ng� h�nh", {0, 154, 4, 1}, 0},
		{1, 5, "Chi�n H�i M�c Ch� ng� h�nh", {0, 154, 5, 1}, 0},
		{1, 5, "Chi�n H�i Th�y Ch� ng� h�nh", {0, 154, 6, 1}, 0},
		{1, 5, "Chi�n H�i H�a Ch� ng� h�nh", {0, 154, 7, 1}, 0},
		{1, 5, "Chi�n H�i Th� Ch� ng� h�nh", {0, 154, 8, 1}, 0},
		{1, 1, "Chi�n H�i �m Ch� ng� h�nh", {0, 154, 9, 1}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "ACTIVITY_HEAD", "Trang b� Kim X� 3 sao")
end

function ahf_GetPet(nLevel)
	local VNG_TASKID = 2539
	local nTaskvalue = floor(mod(GetTask(VNG_TASKID), 10^(2))/(10^(2-1)))
	if nTaskvalue < 1 then
		Msg2Player(1,"","Ch�a ho�n th�nh nhi�m v� Ph�c sinh th� c�ng kh�ng th� nh�n ph�n th��ng");
		return
	end
	local nL = tonumber(nLevel);
	local tPet = {
		[1] = {24, 25, 26},
		[2] = {1, 2, 3},
		[3] = {4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		[4] = {16, 17, 18, 19, 12, 21, 22, 23},
	}
	if not tPet[nL] then
		return
	end
	local nIndex = random(getn(tPet[nL]));
	local bRet = AddPet(tPet[nL][nIndex]);
	if bRet and bRet ~= -1 then
		Msg2Player(format("Nh�n ���c 1 th� c�ng c�p %d", nL));
	end
end

--ս����
VET_ZHANKUANG_CLOTH = {
	[2] = {
		[1] = {{0, 100, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n ��a B�o"},
	  [2] = {{0, 100, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n ��a B�o"},
	},
	[3] = {
		[1] = {{0, 100, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ph� T� B�o"},
	  [2] = {{0, 100, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ph� T� B�o"},
	},
	[4] = {
		[1] = {{0, 100, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n T�n B�o"},
	  [2] = {{0, 100, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n T�n B�o"},
	},
	[6] = {
		[1] = {{0, 100, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Y"},
		[2] = {{0, 100, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Y"},
		[3] = {{0, 100, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Y"},
		[4] = {{0, 100, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Y"},
	},
	[8] = {
		[3] = {{0, 100, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng B� T�t Y"},
		[4] = {{0, 100, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng B� T�t Y"},
	},
	[9] = {
		[3] = {{0, 100, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng L�u Th�yY"},
		[4] = {{0, 100, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng L�u Th�yY"},
	},
	[11] = {
		[1] = {{0, 100, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Y"},
		[2] = {{0, 100, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Y"},
		[3] = {{0, 100, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Y"},
		[4] = {{0, 100, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Y"},
	},
	[12] = {
		[1] = {{0, 100, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Y"},
		[2] = {{0, 100, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Y"},
		[3] = {{0, 100, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Y"},
		[4] = {{0, 100, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Y"},
	},
	[14] = {
		[1] = {{0, 100, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi B�o"},
		[2] = {{0, 100, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi B�o"},
		[3] = {{0, 100, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi B�o"},
		[4] = {{0, 100, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi B�o"},
	},
	[15] = {
		[1] = {{0, 100, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n B�o"},
		[2] = {{0, 100, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n B�o"},
		[3] = {{0, 100, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n B�o"},
		[4] = {{0, 100, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n B�o"},
	},
	[17] = {
		[1] = {{0, 100, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Gi�p"},
		[2] = {{0, 100, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Gi�p"},
		[3] = {{0, 100, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Gi�p"},
		[4] = {{0, 100, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Gi�p"},
	},
	[18] = {
		[1] = {{0, 100, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Gi�p"},
		[2] = {{0, 100, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Gi�p"},
		[3] = {{0, 100, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Gi�p"},
		[4] = {{0, 100, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Gi�p"},
	},
	[20] = {
		[1] = {{0, 100, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Y"},
		[2] = {{0, 100, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Y"},
		[3] = {{0, 100, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Y"},
		[4] = {{0, 100, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Y"},
	},
	[21] = {
		[1] = {{0, 100, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Y"},
		[2] = {{0, 100, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Y"},
		[3] = {{0, 100, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Y"},
		[4] = {{0, 100, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Y"},
	},
	[23] = {
		[1] = {{0, 100, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Phong L�i B�o"},
		[2] = {{0, 100, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Phong L�i B�o"},
	},
	[25] = {
		[1] = {{0, 100, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Y"},
		[2] = {{0, 100, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Y"},
		[3] = {{0, 100, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Y"},
		[4] = {{0, 100, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Y"},
	},
	[26] = {
		[1] = {{0, 100, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng B�o"},
		[2] = {{0, 100, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng B�o"},
		[3] = {{0, 100, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng B�o"},
		[4] = {{0, 100, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng B�o"},
	},
	[27] = {
		[1] = {{0, 100, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  B�o"},
		[2] = {{0, 100, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  B�o"},
		[3] = {{0, 100, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  B�o"},
		[4] = {{0, 100, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  B�o"},
	},
	[29] = {
		[3] = {{0, 100, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh N�  Y"},
		[4] = {{0, 100, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh N�  Y"},
	},
	[30] = {
		[3] = {{0, 100, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh Linh Y"},
		[4] = {{0, 100, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh Linh Y"},
	},
}

--ս��ͷ
VET_ZHANKUANG_CAP = {
	[2]  = {
		[1] = {{0, 103, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n ��a M�o"},
		[2] = {{0, 103, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n ��a M�o"},
	},
	[3]  = {                                                                            
		[1] = {{0, 103, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ph� T� M�o"},         
		[2] = {{0, 103, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ph� T� M�o"},
	}, 
	[4]  = {
		[1] = {{0, 103, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n T�n M�o"},
		[2] = {{0, 103, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n T�n M�o"},
	},	
	[6]  = {
		[1] = {{0, 103, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Qu�n"},
		[2] = {{0, 103, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Qu�n"},
		[3] = {{0, 103, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Qu�n"},
		[4] = {{0, 103, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Qu�n"},
	},
	[8]  = {
		[3] = {{0, 103, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng B� T�t Tr�m"},
		[4] = {{0, 103, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng B� T�t Tr�m"},
	},
	[9]  = {
		[3] = {{0, 103, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng L�u Th�y Tr�m"},
		[4] = {{0, 103, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng L�u Th�y Tr�m"},
	},
	[11] = {
		[1] = {{0, 103, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du C�n"},
		[2] = {{0, 103, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du C�n"},
		[3] = {{0, 103, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du C�n"},
		[4] = {{0, 103, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du C�n"},
	},
	[12] = {
		[1] = {{0, 103, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao C�n"},
		[2] = {{0, 103, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao C�n"},
		[3] = {{0, 103, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao C�n"},
		[4] = {{0, 103, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao C�n"},
	},
	[14] = {
		[1] = {{0, 103, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Qu�n"},
		[2] = {{0, 103, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Qu�n"},
		[3] = {{0, 103, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Qu�n"},
		[4] = {{0, 103, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Qu�n"},
	},
	[15] = {
		[1] = {{0, 103, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Qu�n"},
		[2] = {{0, 103, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Qu�n"},
		[3] = {{0, 103, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Qu�n"},
		[4] = {{0, 103, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Qu�n"},
	},
	[17] = {
		[1] = {{0, 103, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Kh�i"},
		[2] = {{0, 103, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Kh�i"},
		[3] = {{0, 103, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Kh�i"},
		[4] = {{0, 103, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Kh�i"},
	},
	[18] = {
		[1] = {{0, 103, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Kh�i"},
		[2] = {{0, 103, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Kh�i"},
		[3] = {{0, 103, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Kh�i"},
		[4] = {{0, 103, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Kh�i"},
	},
	[20] = {
		[1] = {{0, 103, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n C�n"},
		[2] = {{0, 103, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n C�n"},
		[3] = {{0, 103, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n C�n"},
		[4] = {{0, 103, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n C�n"},
	},
	[21] = {
		[1] = {{0, 103, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m C�n"},
		[2] = {{0, 103, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m C�n"},
		[3] = {{0, 103, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m C�n"},
		[4] = {{0, 103, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m C�n"},
	},
	[23] = {
		[1] = {{0, 103, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Phong L�i Qu�n"},
		[2] = {{0, 103, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Phong L�i Qu�n"},
	},
	[25] = {
		[1] = {{0, 103, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a C�n"},
		[2] = {{0, 103, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a C�n"},
		[3] = {{0, 103, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a C�n"},
		[4] = {{0, 103, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a C�n"},
	},
	[26] = {
		[1] = {{0, 103, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Qu�n"},
		[2] = {{0, 103, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Qu�n"},
		[3] = {{0, 103, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Qu�n"},
		[4] = {{0, 103, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Qu�n"},
	},
	[27] = {
		[1] = {{0, 103, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Qu�n"},
		[2] = {{0, 103, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Qu�n"},
		[3] = {{0, 103, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Qu�n"},
		[4] = {{0, 103, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Qu�n"},
	},
	[29] = {
		[3] = {{0, 103, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh N�  Tr�m"},
		[4] = {{0, 103, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh N�  Tr�m"},
	},
	[30] = {
		[3] = {{0, 103, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh Linh Tr�m"},
		[4] = {{0, 103, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh Linh Tr�m"},
	},
}  

--ս���
VET_ZHANKUANG_SHOE = {
	[2] = {
	  [1] = {{0, 101, 30143, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n ��a Trang"},
		[2] = {{0, 101, 30144, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n ��a Trang"},
	},
	[3] = {
		[1] = {{0, 101, 30147, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ph� T� Trang"},
		[2] = {{0, 101, 30148, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ph� T� Trang"},
	},
	[4] = {
		[1] = {{0, 101, 30145, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n T�n Trang"},
		[2] = {{0, 101, 30146, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n T�n Trang"},
	},
	[6] = {
		[1] = {{0, 101, 30149, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Trang"},
		[2] = {{0, 101, 30150, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Trang"},
		[3] = {{0, 101, 30151, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Trang"},
		[4] = {{0, 101, 30152, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Tuy�t M�nh Trang"},
	},
	[8] = {
		[3] = {{0, 101, 30153, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng B� T�t Kh�"},
		[4] = {{0, 101, 30154, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng B� T�t Kh�"},
	},
	[9] = {
		[3] = {{0, 101, 30155, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng L�u Th�yKh�"},
		[4] = {{0, 101, 30156, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng L�u Th�yKh�"},
	},
	[11] = {
		[1] = {{0, 101, 30157, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Trang"},
		[2] = {{0, 101, 30158, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Trang"},
		[3] = {{0, 101, 30159, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Trang"},
		[4] = {{0, 101, 30160, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�n Du Trang"},
	},
	[12] = {
		[1] = {{0, 101, 30161, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Trang"},
		[2] = {{0, 101, 30162, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Trang"},
		[3] = {{0, 101, 30163, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Trang"},
		[4] = {{0, 101, 30164, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ti�u Dao Trang"},
	},
	[14] = {
		[1] = {{0, 101, 30165, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Trang"},
		[2] = {{0, 101, 30166, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Trang"},
		[3] = {{0, 101, 30167, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Trang"},
		[4] = {{0, 101, 30168, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng V� Vi Trang"},
	},
	[15] = {
		[1] = {{0, 101, 30169, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Trang"},
		[2] = {{0, 101, 30170, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Trang"},
		[3] = {{0, 101, 30171, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Trang"},
		[4] = {{0, 101, 30172, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C�n Kh�n Trang"},
	},
	[17] = {
		[1] = {{0, 101, 30173, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Trang"},
		[2] = {{0, 101, 30174, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Trang"},
		[3] = {{0, 101, 30175, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Trang"},
		[4] = {{0, 101, 30176, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Thi�n Tinh  Trang"},
	},
	[18] = {
		[1] = {{0, 101, 30177, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Trang"},
		[2] = {{0, 101, 30178, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Trang"},
		[3] = {{0, 101, 30179, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Trang"},
		[4] = {{0, 101, 30180, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Xuy�n V�n Trang"},
	},
	[20] = {
		[1] = {{0, 101, 30181, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Trang"},
		[2] = {{0, 101, 30182, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Trang"},
		[3] = {{0, 101, 30183, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Trang"},
		[4] = {{0, 101, 30184, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Minh T�n Trang"},
	},
	[21] = {
		[1] = {{0, 101, 30185, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Trang"},
		[2] = {{0, 101, 30186, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Trang"},
		[3] = {{0, 101, 30187, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Trang"},
		[4] = {{0, 101, 30188, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng C� T�m Trang"},
	},
	[23] = {
		[1] = {{0, 101, 30189, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Phong L�i Trang"},
		[2] = {{0, 101, 30190, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Phong L�i Trang"},
	},
	[25] = {
		[1] = {{0, 101, 30191, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Trang"},
		[2] = {{0, 101, 30192, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Trang"},
		[3] = {{0, 101, 30193, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Trang"},
		[4] = {{0, 101, 30194, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng ��i ��a Trang"},
	},
	[26] = {
		[1] = {{0, 101, 30195, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Trang"},
		[2] = {{0, 101, 30196, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Trang"},
		[3] = {{0, 101, 30197, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Trang"},
		[4] = {{0, 101, 30198, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng T�y M�ng Trang"},
	},
	[27] = {
		[1] = {{0, 101, 30199, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Trang"},
		[2] = {{0, 101, 30200, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Trang"},
		[3] = {{0, 101, 30201, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Trang"},
		[4] = {{0, 101, 30202, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Ma V�c  Trang"},
	},
	[29] = {
		[3] = {{0, 101, 30203, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh N�  Kh�"},
		[4] = {{0, 101, 30204, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh N�  Kh�"},
	},
	[30] = {
		[3] = {{0, 101, 30205, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh Linh Kh�"},
		[4] = {{0, 101, 30206, 1, 4, -1, -1, -1, -1, -1, -1}, "Chi�n Cu�ng Th�nh Linh Kh�"},
	},
}

--ս���
VET_ZHANKUANG_WEAPON = {
	[2] = {
        [1]={{0,3,30143,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng B�ng Thi�n �ao",1,2},
        [2]={{0,3,30144,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng B�ng Thi�n �ao",2,2},
    },
	[3] = {
        [1]={{0,8,30147,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Thi�n ��nh Tr��ng",1,3},
        [2]={{0,8,30148,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Thi�n ��nh Tr��ng",2,3},
    },
	[4] = {
        [1]={{0,0,30145,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th�nh Chi�n Th�",1,4},
        [2]={{0,0,30146,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th�nh Chi�n Th�",2,4},
     },
	[6] = {
        [1]={{0,1,30149,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng �o�t H�n Ch�m",1,6},
        [2]={{0,1,30150,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng �o�t H�n Ch�m",2,6},
        [3]={{0,1,30151,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng �o�t H�n Ch�m",3,6},
        [4]={{0,1,30152,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng �o�t H�n Ch�m",4,6},
    },
	[8] = {
        [3]={{0,2,30153,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Ph�t Quang Ki�m",3,8},
        [4]={{0,2,30154,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Ph�t Quang Ki�m",4,8},
    },
	[9] = {
        [3]={{0,10,30155,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng H� Bang C�m",3,9},
        [4]={{0,10,30156,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng H� Bang C�m",4,9},
    },
	[11] = {
        [1]={{0,0,30157,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Tr�ng �c Th�",1,11},
        [2]={{0,0,30158,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Tr�ng �c Th�",2,11},
        [3]={{0,0,30159,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Tr�ng �c Th�",3,11},
        [4]={{0,0,30160,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Tr�ng �c Th�",4,11},
    },
	[12] = {
        [1]={{0,5,30161,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng V� C�c C�n",1,12},
        [2]={{0,5,30162,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng V� C�c C�n",2,12},
        [3]={{0,5,30163,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng V� C�c C�n",3,12},
        [4]={{0,5,30164,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng V� C�c C�n",4,12},
    },
	[14] = {
        [1]={{0,2,30165,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Khu Ma Ki�m",1,14},
        [2]={{0,2,30166,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Khu Ma Ki�m",2,14},
        [3]={{0,2,30167,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Khu Ma Ki�m",3,14},
        [4]={{0,2,30168,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Khu Ma Ki�m",4,14},
    },
	[15] = {
        [1]={{0,9,30169,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th��ng Khung B�t",1,15},
        [2]={{0,9,30170,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th��ng Khung B�t",2,15},
        [3]={{0,9,30171,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th��ng Khung B�t",3,15},
        [4]={{0,9,30172,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th��ng Khung B�t",4,15},
    },
	[17] = {
        [1]={{0,6,30173,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th�n K�ch Th��ng",1,17},
        [2]={{0,6,30174,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th�n K�ch Th��ng",2,17},
        [3]={{0,6,30175,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th�n K�ch Th��ng",3,17},
        [4]={{0,6,30176,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Th�n K�ch Th��ng",4,17},
    },
	[18] = {
        [1]={{0,4,30177,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Xung Thi�n Cung",1,18},
        [2]={{0,4,30178,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Xung Thi�n Cung",2,18},
        [3]={{0,4,30179,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Xung Thi�n Cung",3,18},
        [4]={{0,4,30180,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Xung Thi�n Cung",4,18},
    },
	[20] = {
        [1]={{0,7,30181,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Luy�n Ng�c �ao",1,20},
        [2]={{0,7,30182,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Luy�n Ng�c �ao",2,20},
        [3]={{0,7,30183,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Luy�n Ng�c �ao",3,20},
        [4]={{0,7,30184,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Luy�n Ng�c �ao",4,20},
    },
	[21] = {
        [1]={{0,11,30185,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Nhi�p H�n Tr�o",1,21},
        [2]={{0,11,30186,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Nhi�p H�n Tr�o",2,21},
        [3]={{0,11,30187,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Nhi�p H�n Tr�o",3,21},
        [4]={{0,11,30188,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Nhi�p H�n Tr�o",4,21},
    },
	[23] = {
        [1]={{0,2,30189,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Thi�n Ph�t Ki�m",1,23},
        [2]={{0,2,30190,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Thi�n Ph�t Ki�m",2,23},
    },
	[25] = {
        [1]={{0,3,30191,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Ch�c Dung �ao",1,25},
        [2]={{0,3,30192,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Ch�c Dung �ao",2,25},
        [3]={{0,3,30193,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Ch�c Dung �ao",3,25},
        [4]={{0,3,30194,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Ch�c Dung �ao",4,25},
    },
	[26] = {
        [1]={{0,9,30195,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng T� M�nh B�t",1,26},
        [2]={{0,9,30196,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng T� M�nh B�t",2,26},
        [3]={{0,9,30197,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng T� M�nh B�t",3,26},
        [4]={{0,9,30198,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng T� M�nh B�t",4,26},
    },
	[27] = {
        [1]={{0,11,30199,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Truy H�n Tr�o",1,27},
        [2]={{0,11,30200,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Truy H�n Tr�o",2,27},
        [3]={{0,11,30201,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Truy H�n Tr�o",3,27},
        [4]={{0,11,30202,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Truy H�n Tr�o",4,27},
    },
	[29] = {
        [3]={{0,13,30203,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Phong Linh Phi�n",3,29},
        [4]={{0,13,30204,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Phong Linh Phi�n",4,29},
    },
	[30] = {
        [3]={{0,12,30205,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Kh�ng Minh ��ch",3,30},
        [4]={{0,12,30206,1,4,-1,-1,-1,-1,-1,-1}, "Chi�n Cu�ng Kh�ng Minh ��ch",4,30},
    },
}

--���������͸�װ��
function ahf_GetEquipByRouteBody(tAward)
	if not tAward then return 0; end
	local nRoute = GetPlayerRoute();
	local tRouteList = tAward[nRoute];
	if not tRouteList then
		Talk(1,"","M�n ph�i nh�n v�t b�t th��ng, kh�ng th� nh�n th��ng!")
		return 0;
	end
	local nBody = GetBody();
	local tBodyList = tRouteList[nBody];
	if not tBodyList or getn(tBodyList) < 2 then
		Talk(1,"","H�nh th� nh�n v�t b�t th��ng, kh�ng th� nh�n th��ng!")
		return 0;
	end
	gf_AddItemEx2(tBodyList[1], tBodyList[2], "ACTIVITY_HEAD", "ACTIVITY_HEAD", 0, 1);
end
