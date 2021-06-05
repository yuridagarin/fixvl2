-- Created by TuanNA5
-- VNG August event - D� Th�o

Include("\\script\\lib\\globalfunctions.lua")

-- Th�i gian event
START_DATE = 090731
END_DATE = 090906

-- S� v�ng, level c�n �� ��i
MONEY_EXCHANGE = 990000
LEVEL_EXCHANGE = 70
ITEM_TIME_LIMIT = 30 * 24 * 60 * 60

---- S� l�n ��i t�i �a
--MAX_HORSE_EXCHANGE = 1
--MAX_WARHORSE_EXCHANGE = 1
--MAX_STONE_EXCHANGE = 1
--MAX_WEAPONFAG_EXCHANGE = 8

---- T�nh theo Account
--EVENT_EXT = 3

--STONE_BIT = 1
--WARHORSE_BIT = 2
--HORSE_BIT = 3


---- T�nh theo Role
--WEAPONFAG_TASKID = 2436


-- 2 Task ID c�a ITEM th� 4, 5
--ITEM4_TASKID = 2434
--ITEM5_TASKID = 2435

-- Table tAwardItem g�m t�n, id, � tr�ng, �� n�ng, option
tAwardItem = 
{
	{"Thi�n Th�ch Linh Th�ch",{2,1,1068,1},1,1,0},
	{"B�n v� ��c t�o th�n kh�",{2,1,1086,1},1,1,0},
	{"Chi�n m� Nguy�n So�i cao c�p",{0,105,51,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Chi�n m� Nguy�n So�i cao c�p",{0,105,52,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"��ng V�",{0,105,20,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Si�u Quang",{0,105,19,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"B�n Ti�u",{0,105,16,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Phi�u V�",{0,105,15,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"Ph� D�c",{0,105,39,1,1,3,403,0,0,0,0},1,100,1},
	{"Tu�n L�c",{0,105,35,1,1,-1,-1,-1,-1,-1,-1},1,100,1},
	{"K� L�n Ni�n Th�",{0,105,33,1,1,3,403,0,0,0,0},1,100,1},
}

tNewAwardItem = 
{
	{"��u H�n",{2,1,1157,5,4},5,100,0, 1, 2000000, 1},
	{"Th�n H�nh B� Ph�",{0,200,39,2,1},2,100,0, 1, 50000, 30},
	{"Th� Th�n Ph�",{2,0,556,3,1},3,100,0, 1, 100000, 30},
	{"T�y Tu� Linh ��n",{2,0,137,1,1},1,100,0, 30, 6000000, 15},
	{"B�t B�o T�y Tu� ��n",{2,0,138,1,1},1,100,0, 45, 5000000, 15},
	{"Ti�u Ki�p T�n",{2,0,141,5,1},5,100,0, 1, 200000, 15},
	{"L�c L�m Lang Y�n",{2,1,1014,1,1},1,100,0, 5, 500000, 15},
	{"Th�y Ho�ng B� Chi�u",{2,1,1047,1,1},1,100,0, 5, 500000, 15},
	{"Uy�n ��ng Kim Ti B�c",{2,1,1048,1,1},1,100,0, 5, 500000, 15},
	{"K� Kim c�a Th� r�n L�u", {2,1,563,1,1},1,100,0,1,10000000,15},
	{"T�n Ni�n Ngo�i Trang", {0,109,113,1,1},1,100,0,1,1000000,30},
}

--Table v� kh� ch�a gi�m ��nh
tWeapon =
{
	{"C� ��nh ch�a gi�m ��nh",2,1,379},
	{"A La H�n Tr��ng ch�a gi�m ��nh",2,1,382},
	{"V�n Nh�n ch�a gi�m ��nh",2,1,375},
	{"M�n Thi�n Hoa V� ch�a gi�m ��nh",2,1,378},
	{"H�a Tinh ch�a gi�m ��nh",2,1,376},
	{"Hi Nh�n C�m ch�a gi�m ��nh",2,1,380},
	{"Li�t Di�m ch�a gi�m ��nh",2,1,377},
	{"Th�n H�nh ch�a gi�m ��nh",2,1,381},
	{"��i H�o L�i Th��ng ch�a gi�m ��nh",2,1,383},
	{"Th�n Cung ch�a gi�m ��nh",2,1,384}	,
	{"L�ng Phong ch�a gi�m ��nh",2,1,386},
	{"M�nh H� ch�a gi�m ��nh",2,1,385},
}

-- Table y�u quy�t c� b�n
tYue =
{
	{"Thi�u l�m �ao quy�t",{2,6,1,1}},
	{"Thi�u l�m c�n quy�t",{2,6,2,1}},
	{"Th�t b�o chi�u quy�t",{2,6,11,1}},
	{"Hu� nh�n quy�t",{2,6,14,1}},
	{"Tu t�m quy�t",{2,6,22,1}},
	{"Ph� ma ch� quy�t",{2,6,24,1}},
	{"Ch� �m y�u quy�t",{2,6,32,1}},
	{"T�m nh�n quy�t",{2,6,33,1}},
	{"Gi�i ��c b� quy�t",{2,6,35,1}},
	{"Nga my ph�t quy�t",{2,6,48,1}},
	{"Ng�c n� ki�m quy�t",{2,6,49,1}},
	{"T�y kh�c quy�t",{2,6,60,1}},
	{"Nguy�t th�c kh�c quy�t",{2,6,62,1}},
	{"C�i bang ch��ng quy�t",{2,6,71,1}},
	{"Ti�u dao du quy�t",{2,6,76,1}},
	{"C�i bang c�n quy�t",{2,6,80,1}},
	{"Kh�t th�o quy�t",{2,6,82,1}},
	{"V� �ang ki�m quy�t",{2,6,89,1}},
	{"L�u quang ki�m quy�t",{2,6,90,1}},
	{"Nhu v�n ki�m quy�t",{2,6,92,1}},
	{"B�t ph�p quy�t",{2,6,109,1}},
	{"L�c h�a c�ng quy�t",{2,6,111,1}},
	{"Th��ng ph�p quy�t",{2,6,120,1}},
	{"Ng� m� quy�t",{2,6,122,1}},
	{"Cung ph�p quy�t",{2,6,131,1}},
	{"Tr�n li�u quy�t",{2,6,133,1}},
	{"B� ki�p ng� ��c �ao ",{2,6,142,1}},
	{"B� ki�p d�n h�n ch�",{2,6,143,1}},
	{"B� ki�p t�p thi t� kh�",{2,6,147,1}},
	{"B� ki�p h� c� m�t ph��ng",{2,6,155,1}},
	{"B� ki�p d��ng c� b� thu�t",{2,6,157,1}},
	{"B� ki�p huy�t ��nh c�ng",{2,6,160,1}},
}

tRewardHorseAttribute1 =
{		
		{"T�ng sinh l�c 4000 �i�m", 1	,2, 486},
		{"Ngo�i c�ng t�ng 4%", 1, 1, 261},
		{"T�ng sinh l�c 1000 �i�m", 90,1, 486},
		{"N�i l�c ti�u hao 15%", 3, 2, 443},
		{"Gi�m th� th��ng 10%", 1, 1, 302},
		{"Kh�ng t�t c� t�ng 10", 4, 2, 329},
}

tRewardHorseAttribute2 =
{
--		{1, 306, "�� ch�nh x�c t�ng 150 �i�m"},
--		{6, 404, "T�c �� di chuy�n 35 %"},
		{"T�ng sinh l�c 4000 �i�m", 4000, 2, 486},
		{"Ngo�i c�ng t�ng 4 %", 1500, 1, 261},
		{"Ngo�i c�ng t�ng 8 %", 4, 2, 261},
		{"T�ng t�c �� xu�t chi�u 6 %", 1, 1, 24},
		{"T�ng t�c �� xu�t chi�u 9 %", 1, 2, 24},
		{"H� tr� m�t t�ch t�ng th�m 4 %", 1, 1, 564},
		{"H� tr� m�t t�ch t�ng th�m 5 %", 1, 2, 564},
		{"T�ng sinh l�c 1000 �i�m", 100, 1, 486 },
		{"N�i ph�ng, ngo�i ph�ng t�ng 98 �i�m", 1500, 5, 420},
		{"N�i l�c ti�u hao 15 %", 1000, 2, 443},
		{"Gi�m th� th��ng 10 %", 900, 1, 302},
		{"Kh�ng t�t c� 10 �i�m", 990, 2, 329},
		{"L�c t�n c�ng D��ng Gia B�n Lang Th��ng t�ng 15 %", 1, 1, 323},
		{"L�c t�n c�ng D��ng Gia To�i Kim Ti�n t�ng 15 %", 1, 1, 325},
}


-- Table Th�n H�nh
TB_TRANSPORT_SCROLL =
{
	[1] = {{0,200,40,1,4}, "Th�n H�nh B�o �i�n", 14000000, 15*24*60*60},
	[2] = {{0,200,39,1,4}, "Th�n H�nh B� Ph�", 1600000, 2*24*60*60},
}


function CheckEventDate()
	local nDate = tonumber(date("%y%m%d"));
	if START_DATE <= nDate and nDate <= END_DATE then
		return 1
	end	
	return 0
end

function CheckGoldCoin(nNumber)
	if GetItemCount(2, 1, 30094) >=  nNumber then
		return 1
	end
	return 0
end

function CheckWeapon()
	for i=1,getn(tWeapon) do
		if GetItemCount(tWeapon[i][2],tWeapon[i][3],tWeapon[i][4]) <1 then
			return i
		end	
	end
	return 0
end

function DelWeapon()
	for i=1,getn(tWeapon) do
		if DelItem(tWeapon[i][2],tWeapon[i][3],tWeapon[i][4],1) ~= 1 then
			return 0
		end	
	end
	return 1
end