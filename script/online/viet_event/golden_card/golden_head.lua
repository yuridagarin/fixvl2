-- Ho�ng Kim L�nh B�i ver 2.0
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");

NEEDED_EXP = 200e6				
NEEDED_LEVEL = 73

-- Control HKLB
EXT_POINT_HKLB = 3		
-- ��m s� l�n n�p HKLB		
BYTE_HKLB_COUNT = 1
-- Ph�n Lo�i HKLB
BYTE_HKLB_TYPE = 2

-- Task nh�n th��ng V� L�m Ti�n B�i
TASK_FRIENDLY_AWARD = 2282
BYTE_FRIENDLY_AWARD_DAY= 1
BYTE_FRIENDLY_AWARD_MONTH = 2
BYTE_FRIENDLY_AWARD_COUNT = 3

TASK_DIG_TIME = 2283
TASK_DIG_DATE = 2284
-- S� d�ng 31 bit �� l�u l�i index r��ng �� m� (1 r��ng ch� m� 1 l�n)
TASK_DIG_COUNT_1 = 2285 
-- S� d�ng 31 bit �� l�u l�i index r��ng �� m� (1 r��ng ch� m� 1 l�n)
TASK_DIG_COUNT_2 = 2188 
-- Ghi l�i t�ng s� l�n ��o
TASK_DIG_COUNT_ALL = 2189 

szHKLBLogHeader = "Thien Mon Tran Hoang Kim Lenh Bai"
szHKLBLogAction = "nh�n th��ng"

tb_golden_faction =
{
	"Thi�u L�m",
	"V� �ang",
	"Nga My",
	"C�i Bang",
	"���ng M�n",
	"D��ng Gia",
	"Ng� ��c",
}

tb_main_city =
{
	100, 150, 200, 300, 350, 400, 500,
}

tb_golden_faction_tree =
{
		[2] =  {"Thi�u L�m t�c gia", 0, 20, 21, 23, "Kim Cang Ph�c Ma T�m Ph�p", {0,107,2,1}, "Kim Cang Ph�c Ma kinh", {0,107,1,1}, "Kim Cang B�t Nh� Kinh", {0,107,166,1}}, 
		[3] =  {"Thi�u L�m thi�n t�ng", 2, 45, 46, 0, "V� Tr�n T�m Ph�p", {0,107,6,1}, "V� Tr�n M�t t�ch", {0,107,5,1}, "V� Tr�n B� �� Kinh", {0,107,168,1}}, 
		[4] =  {"Thi�u L�m v� t�ng", 1, 33, 34, 0, "Ti�m Long T�m Ph�p", {0,107,4,1}, "Ti�m Long M�t t�ch", {0,107,3,1}, "Ti�m Long T�ch Di�t Kinh", {0,107,167,1}}, 
		[14] =  {"V� �ang ��o gia", 8, 125, 126, 0, "Huy�n �nh T�m Ph�p", {0,107,18,1}, "Huy�n �nh M�t t�ch", {0,107,17,1}, "Huy�n �nh M� Tung M�t T�ch", {0,107,174,1}}, 
		[15] =  {"V� �ang t�c gia", 9, 147, 148, 0, "Qu�n T� T�m Ph�p", {0,107,20,1}, "Qu�n T� M�t t�ch", {0,107,19,1}, "Qu�n T� Ti�t Phong M�t T�ch", {0,107,175,1}}, 
		[8] =  {"Nga My ph�t gia", 4, 75, 76, 0, "Nh� � T�m Ph�p", {0,107,10,1}, "Nh� � M�t T�ch", {0,107,9,1}, "Nh� � Kim ��nh M�t T�ch", {0,107,170,1}}, 
		[9] =  {"Nga My t�c gia", 5, 90, 91, 0, "B�ch H�i T�m Ph�p", {0,107,12,1}, "B�ch H�i Ph�", {0,107,11,1}, "B�ch H�i Tuy�t �m Ph�", {0,107,171,1}}, 
		[11] =  {"C�i Bang t�nh y", 6, 103, 104, 0, "H�n ��n T�m Ph�p", {0,107,14,1}, "H�n ��n M�t t�ch", {0,107,13,1}, "H�n ��n Tr�n Nh�c M�t T�ch", {0,107,172,1}}, 
		[12] =  {"C�i Bang � y", 7, 114, 115, 0, "Qu� Thi�n T�m Ph�p", {0,107,16,1}, "Qu� Thi�n M�t t�ch", {0,107,15,1}, "Qu� Thi�n Du Long M�t T�ch", {0,107,173,1}}, 
		[6] =  {"���ng M�n", 3, 58, 60, 0, "Thi�n La T�m Ph�p", {0,107,8,1}, "Thi�n La M�t T�ch", {0,107,7,1}, "Thi�n La Li�n Ch�u L�c", {0,107,169,1}}, 
		[17] =  {"D��ng Gia th��ng", 10, 720, 0, 0, "Tr�n Qu�n T�m Ph�p", {0,107,22,1}, "Tr�n Qu�n M�t t�ch", {0,107,21,1}, "Tr�n Qu�n Phi Long Th��ng Ph�", {0,107,176,1}}, 
		[18] =  {"D��ng Gia cung", 11, 733, 0, 0, "Xuy�n V�n T�m Ph�p", {0,107,24,1}, "Xuy�n V�n M�t t�ch", {0,107,23,1}, "Xuy�n V�n L�c H�ng M�t T�ch", {0,107,177,1}}, 
		[20] = {"Ng� ��c hi�p ��c", 12, 13, 364, 365, "U Minh T�m Ph�p", {0,107,26,1}, "U Minh Qu� L�c", {0,107,25,1}, "U Minh Phong Ma L�c", {0,107,178,1}}, 
		[21] = {"Ng� ��c t� ��c", 13, 14, 347, 351, "Linh C� T�m Ph�p", {0,107,28,1}, "Linh C� M�t t�ch", {0,107,27,1}, "Linh C� Huy�n T� L�c", {0,107,179,1}}, 

}

tb_golden_award = 
{
				[74] = {	3000, 	4000, 	50000, 1},
				[75] = {	3000, 	4000, 	50000, 2},
				[76] = {	3000, 	4000, 	50000, 3},
				[77] = {	3000, 	4000, 	50000, 4},
				[78] = {	4000, 	5000, 	55000, 5},
				[79] = {	5000, 	5000, 	55000, 6},
				[80] = {	6000, 	6000, 	60000, 7},
				[81] = {	7000, 	7000, 	65000, 8},
				[82] = {	8000, 	8000, 	70000, 9},
				[83] = {	9000, 	9000, 	75000, 10},
				[84] = {	10000, 	10000, 	80000, 11},
				[85] = {	10000, 	10000, 	80000, 12},
				[86] = {	10500, 	10500, 	81000, 13},
				[87] = {	11000, 	11000, 	82000, 14},
				[88] = {	11500, 	11500, 	83000, 15},
				[89] = {	12000, 	12000, 	84000, 16, 25000000},
				[90] = {	12500, 	12500, 	86000, 17, 25000000},
				[91] = {	13000, 	13000, 	88000, 18, 25000000},
				[92] = {	13500, 	13500, 	90000, 19, 50000000},
				[93] = {	14000, 	14000, 	92000, 20, 50000000},
				[94] = {	14500, 	14500, 	94000, 21, 50000000},
				[95] = {	15000, 	15000, 	96000, 22, 50000000},
				[96] = {	16000, 	16000, 	98000, 23, 50000000},
}

tb_golden_digging =
{
				[1] = {3000, 	5000, 	50000},
				[2] = {5000, 	7000, 	60000},
				[3] = {7500, 	8500, 	70000},
				[4] = {10000, 	10000, 	80000},
}

tb_hunting_treasure =
{
				[1] = {50000,		3000,	5000,	73,  79,	1},
				[2] = {60000,		5000,	7000,	80,  84,	8},
				[3] = {70000,		7500,	8500,	85,  89,	12},
				[4] = {80000,		10000,	10000,	90,  99,	16},
}

tb_golden_jew_chien = {
				[2]  = {"T� Vi�n Chi�n",{0,102,8851,1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"T� Vi�n Chi�n",{0,102,8853,1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"T� Vi�n Chi�n",{0,102,8855,1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"T� Vi�n Chi�n",{0,102,8857,1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"T� Vi�n Chi�n",{0,102,8859,1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"T� Vi�n Chi�n",{0,102,8861,1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"T� Vi�n Chi�n",{0,102,8863,1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"T� Vi�n Chi�n",{0,102,8865,1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"T� Vi�n Chi�n",{0,102,8867,1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"T� Vi�n Chi�n",{0,102,8869,1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"T� Vi�n Chi�n",{0,102,8871,1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"T� Vi�n Chi�n",{0,102,8873,1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"T� Vi�n Chi�n",{0,102,8875,1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"T� Vi�n Chi�n",{0,102,8877,1,1,-1,-1,-1,-1,-1,-1}},
}

tb_golden_jew_dau = {
				[2]  = {"T� Vi�n ��u",{0,102,8852,1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"T� Vi�n ��u",{0,102,8854,1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"T� Vi�n ��u",{0,102,8856,1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"T� Vi�n ��u",{0,102,8858,1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"T� Vi�n ��u",{0,102,8860,1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"T� Vi�n ��u",{0,102,8862,1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"T� Vi�n ��u",{0,102,8864,1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"T� Vi�n ��u",{0,102,8866,1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"T� Vi�n ��u",{0,102,8868,1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"T� Vi�n ��u",{0,102,8870,1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"T� Vi�n ��u",{0,102,8872,1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"T� Vi�n ��u",{0,102,8874,1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"T� Vi�n ��u",{0,102,8876,1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"T� Vi�n ��u",{0,102,8878,1,1,-1,-1,-1,-1,-1,-1}},
}

-- golden weekday award
tb_golden_material_goldenday = {
				[1] = {"G� Qu�n D�ng", {2,0,308,480,1}, 1, 1, 7},
				[2] = {"G� Qu�n D�ng", {2,0,308,480,1}, 1, 2, 8},
				[3] = {"Kho�ng Th�ch Qu�n D�ng", {2,0,307,480,1}, 1, 2, 8},
				[4] = {"L�a M�ch Qu�n D�ng", {2,0,309,480,1}, 1, 2, 8},
				[5] = {"Thu�c Da Qu�n D�ng", {2,0,310,480,1}, 1, 2, 8},
				[6] = {"T� T�m Qu�n D�ng", {2,0,311,480,1}, 1, 2, 8},
				[7] = {"D��c Th�o Qu�n D�ng", {2,0,312,480,1}, 1, 2, 8},
				[8] = {"Linh Huy�t Qu�n D�ng", {2,0,313,480,1}, 1, 2, 8},
				[9] = {"G� Qu�n D�ng", {2,0,308,480,1}, 1, 3, 9},
				[10] = {"Kho�ng Th�ch Qu�n D�ng", {2,0,307,480,1}, 1, 3, 9},
				[11] = {"L�a M�ch Qu�n D�ng", {2,0,309,480,1}, 1, 3, 9},
				[12] = {"Thu�c Da Qu�n D�ng", {2,0,310,480,1}, 1, 3, 9},
				[13] = {"T� T�m Qu�n D�ng", {2,0,311,480,1}, 1, 3, 9},
				[14] = {"D��c Th�o Qu�n D�ng", {2,0,312,480,1}, 1, 3, 9},
				[15] = {"Linh Huy�t Qu�n D�ng", {2,0,313,480,1}, 1, 3, 9},
}

-- 1 item, 2 table
-- must identify main table below the sub table
tb_golden_jew = {
				[1] = {1, "T�ng Ki�m Kim �n", 2, {0, 102, 40,1,1,-1,-1,-1,-1,-1,-1}},
				[2] = {1, "T�ng Ki�m K� Th�ch", 2, {0, 102, 39,1,1,-1,-1,-1,-1,-1,-1}},				
				[3] = {1, "T�ng Ki�m B�o Ch�u", 2, {0, 102, 38,1,1,-1,-1,-1,-1,-1,-1}},
				[4] = {1, "��ng Ph��ng Long Ch�u", 2, {0, 102, 24,1,1,-1,-1,-1,-1,-1,-1}},			
				[5] = {2, tb_golden_jew_chien, 2, {0, 102, 8851,1,1,-1,-1,-1,-1,-1,-1}},		
				[6] = {2, tb_golden_jew_dau, 2, {0, 102, 8852,1,1,-1,-1,-1,-1,-1,-1}},		
				[7] = {1, "H�ng Ph� Th�y H� Ph�", 494, {0,102,15,1,1,2,24,3,14,0,0}},		
				[8] = {1, "To�n Th�ch Gi�i Ch�", 494, {0,102,20,1,1,2,24,3,14,0,0}},
}
--------------------------------------------------------------------------------------

tb_golden_weapon_bpy_low = {
				[2]  = {"Ph� Y�n �ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"Ph� Y�n tr��ng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"H�m Y�n th�",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"T�ng Y�n ch�m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"Phi Y�n ki�m",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"V�n Y�n c�m",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"V�n Y�n th�",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"L�u Y�n c�n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"Huy�n Y�n ki�m",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"V� Y�n b�t",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"H� Ti�m Th��ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"H�nh Y�n Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"Tr�c Y�n nh�n",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"Y�u Y�n tr�o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1}},
};

tb_golden_weapon_bpy_med = {
				[2]  = {"Ph� Y�n �ao", {0, 3, 6001, 1,1,6,85,7,263,7,264}},
				[3]  = {"Ph� Y�n tr��ng",{0,8,6003, 1,1,6,86,7,267,7,263}},
				[4]  = {"H�m Y�n th�",{0,0,6004, 1,1,6,86,7,267,7,263}},
				[6]  = {"T�ng Y�n ch�m",{0,1,6005, 1,1,4,281,7,265,7,264}},
				[8]  = {"Phi Y�n ki�m",{0,2,6006, 1,1,6,86,4,292,4,293}},
				[9]  = {"V�n Y�n c�m",{0,10,6007, 1,1,2,27,7,266,7,265}},
				[11] = {"V�n Y�n th�",{0,0,6008, 1,1,6,85,7,264,7,263}},
				[12] = {"L�u Y�n c�n",{0,5,6009, 1,1,3,268,7,265,7,266}},
				[14] = {"Huy�n Y�n ki�m",{0,2,6010, 1,1,6,86,7,267,7,266}},
				[15] = {"V� Y�n b�t",{0,9,6011, 1,1,3,268,7,266,7,265}},
				[17] = {"H� Ti�m Th��ng",{0,6,6012, 1,1,6,85,7,264,7,263}},
				[18] = {"H�nh Y�n Cung",{0,4,6013, 1,1,3,268,7,265,7,264}},
				[20] = {"Tr�c Y�n nh�n",{0,7,6014, 1,1,4,281,7,265,7,264}},
				[21] = {"Y�u Y�n tr�o",{0,11,6015, 1,1,5,285,7,266,7,267}},
};

tb_golden_weapon_tq_med = {
				[2]  = {"T� Quang To�i V� �ao",{0,3,8851, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"T� Quang C�u Nh� Tr��ng",{0,8,8853, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"T� Quang H�o Nhi�n Th�",{0,0,8854, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"T� Quang V� H�nh Ch�m",{0,1,8855, 1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"T� Quang T� Tinh Ki�m",{0,2,8856, 1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"T� Quang Ph�ng Ho�ng C�m",{0,10,8857, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"T� Quang Ng� Nh�c Th�",{0,0,8858, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"T� Quang Ph� Thi�n C�n",{0,5,8859, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"T� Quang H�ng Qu�n Ki�m",{0,2,8860, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"T� Quang Sinh T� B�t",{0,9,8861, 1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"T� Quang Ph� Qu�n Th��ng",{0,6,8862, 1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"T� Quang Khai Thi�n Cung",{0,4,8863, 1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"T� Quang �m D��ng Nh�n",{0,7,8864, 1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"T� Quang U Minh Tr�o",{0,11,8865, 1,1,-1,-1,-1,-1,-1,-1}},
};

-- t�n item thu th�p, item ID, h�t gi�ng, v�ng, m�t n� s�t th� ���ng, tr�i c�y
tb_everyday_award = {
	[1] = {
				[7] = {"Ph� �n",{2,1,302,200,1},2,15,1, "D�a", {2,1,30167,2}},	
				[8] = {"T�n Ki�m",{2,1,299,200,1},4,35,1, "D�a", {2,1,30167,3}},	
				[9] = {"Linh t�n",{2,1,185,200,1},6,50,1, "D�a", {2,1,30167,5}},
	},
	[2] = {
				[7] = {"Ph� �n",{2,1,302,200,1},1,15,1, "M�ng c�u", {2,1,30179,1}},	
				[8] = {"T�n Ki�m",{2,1,299,200,1},2,20,1, "M�ng c�u", {2,1,30179,2}},	
				[9] = {"Linh t�n",{2,1,185,200,1},3,25,1, "M�ng c�u", {2,1,30179,3}},
	},
}

-- Th�m b�ng tu ch�n y�u quy�t 
tb_everyday_award_TCYQ = {
	[1] = {
				[7] = {2,0,554,2,4},	
				[8] = {2,0,554,4,4},
				[9] = {2,0,554,6,4},
	},
	
	[2] = {
				[7] = {2,0,554,1,4},	
				[8] = {2,0,554,2,4},
				[9] = {2,0,554,3,4},
	},
}

tb_golden_skillbag = {
				[2] = {"T�i b� ki�p Thi�u L�m", {2, 0, 607, 1, 4}},
				[3] = {"T�i b� ki�p Thi�u L�m", {2, 0, 607, 1, 4}},
				[4] = {"T�i b� ki�p Thi�u L�m", {2, 0, 607, 1, 4}},
				[6] = {"T�i b� ki�p ���ng M�n", {2, 0, 608, 1, 4}},
				[8] = {"T�i b� ki�p Nga My", {2, 0, 609, 1, 4}},
				[9] = {"T�i b� ki�p Nga My", {2, 0, 609, 1, 4}},
				[11] = {"T�i b� ki�p C�i Bang", {2, 0, 610, 1, 4}},
				[12] = {"T�i b� ki�p C�i Bang", {2, 0, 610, 1, 4}},
				[14] = {"T�i b� ki�p V� �ang", {2, 0, 611, 1, 4}},
				[15] = {"T�i b� ki�p V� �ang", {2, 0, 611, 1, 4}},
				[17] = {"T�i b� ki�p D��ng M�n", {2, 0, 612, 1, 4}},
				[18] = {"T�i b� ki�p D��ng M�n", {2, 0, 612, 1, 4}},
				[20] = {"T�i b� ki�p Ng� ��c", {2, 0, 613, 1, 4}},
				[21] = {"T�i b� ki�p Ng� ��c", {2, 0, 613, 1, 4}}
}

tb_golden_book_high = {
				[2] = {"D�ch C�n Kinh-th��ng", {2, 1, 916, 1}},
				[4] = {"Nh� Lai Th�n Ch��ng-th��ng", {2, 1, 919, 1}},
				[3] = {"T�y T�y Kinh-th��ng", {2, 1, 922, 1}},
				[6] = {"H�p Tinh Tr�n-th��ng", {2, 1, 925, 1}},
				[8] = {"V�n T��ng Th�n C�ng-th��ng", {2, 1, 928, 1}},
				[9] = {"Thi�n �m Tr�n H�n Kh�c-th��ng", {2, 1, 931, 1}},
				[11] = {"Gi�ng Long Th�p B�t Ch��ng-th��ng", {2, 1, 934, 1}},
				[12] = {"�� C�u C�n Tr�n-th��ng", {2, 1, 937, 1}},
				[14] = {"V� Th��ng Th�i C�c Ki�m-th��ng", {2, 1, 940, 1}},
				[15] = {"Th�i C�c Th�n C�ng-th��ng", {2, 1, 943, 1}},
				[17] = {"Li�n Ho�n To�n Long Th��ng-th��ng", {2, 1, 946, 1}},
				[18] = {"B� V��ng T��ng Ph�ng Ti�n-th��ng", {2, 1, 949, 1}},
				[20] = {"V� Thi�n Ma C�ng-th��ng", {2, 1, 955, 1}},
				[21] = {"V� �nh Ma C�-th��ng", {2, 1, 952, 1}},
}

tb_golden_book_med = {
				[2] = {"D�ch C�n Kinh-trung", {2, 1, 917, 1}},			
				[4] = {"Nh� Lai Th�n Ch��ng-trung", {2, 1, 920, 1}},			
				[3] = {"T�y T�y Kinh-trung", {2, 1, 923, 1}},			
				[6] = {"H�p Tinh Tr�n-trung", {2, 1, 926, 1}},			
				[8] = {"V�n T��ng Th�n C�ng-trung", {2, 1, 929, 1}},			
				[9] = {"Thi�n �m Tr�n H�n Kh�c-trung", {2, 1, 932, 1}},			
				[11] = {"Gi�ng Long Th�p B�t Ch��ng-trung", {2, 1, 935, 1}},			
				[12] = {"�� C�u C�n Tr�n-trung", {2, 1, 938, 1}},			
				[14] = {"V� Th��ng Th�i C�c Ki�m-trung", {2, 1, 941, 1}},			
				[15] = {"Th�i C�c Th�n C�ng-trung", {2, 1, 944, 1}},			
				[17] = {"Li�n Ho�n To�n Long Th��ng-trung", {2, 1, 947, 1}},			
				[18] = {"B� V��ng T��ng Ph�ng Ti�n-trung", {2, 1, 950, 1}},			
				[20] = {"V� Thi�n Ma C�ng-trung", {2, 1, 956, 1}}, 
				[21] = {"V� �nh Ma C�-trung", {2, 1, 953, 1}},
}

tb_golden_book_low = {
				[2] = {"D�ch C�n Kinh-h� ", {2, 1, 918, 1}},		
				[4] = {"Nh� Lai Th�n Ch��ng-h� ", {2, 1, 921, 1}},		
				[3] = {"T�y T�y Kinh-h� ", {2, 1, 924, 1}},		
				[6] = {"H�p Tinh Tr�n-h� ", {2, 1, 927, 1}},		
				[8] = {"V�n T��ng Th�n C�ng-h� ", {2, 1, 930, 1}},		
				[9] = {"Thi�n �m Tr�n H�n Kh�c-h� ", {2, 1, 933, 1}},		
				[11] = {"Gi�ng Long Th�p B�t Ch��ng-h� ", {2, 1, 936, 1}},		
				[12] = {"�� C�u C�n Tr�n-h� ", {2, 1, 939, 1}},		
				[14] = {"V� Th��ng Th�i C�c Ki�m-h� ", {2, 1, 942, 1}},		
				[15] = {"Th�i C�c Th�n C�ng-h� ", {2, 1, 945, 1}},		
				[17] = {"Li�n Ho�n To�n Long Th��ng-h� ", {2, 1, 948, 1}},		
				[18] = {"B� V��ng T��ng Ph�ng Ti�n-h� ", {2, 1, 951, 1}},		
				[20] = {"V� Thi�n Ma C�ng-h� ", {2, 1, 957, 1}},
				[21] = {"V� �nh Ma C�-h� ", {2, 1, 954, 1}},
}


-- V� Kh� Vi�t Y�n 
tb_golden_vy_weapon = 
{
	[2] = {"Vi�t Y�n Phi Tinh �ao",{0,3,30001,1,1,-1,-1,-1,-1,-1,-1}},-- Thi�u l�m t�c gia
	[3] = {"Vi�t Y�n Phi Tinh Tr��ng",{0,8,30003,1,1,-1,-1,-1,-1,-1,-1}},--Thi�u l�m thi�n t�ng
	[4] = {"Vi�t Y�n Phi Tinh Th�",{0,0,30004,1,1,-1,-1,-1,-1,-1,-1}},--Thi�u l�m v� t�ng
	[6] = {"Vi�t Y�n Phi Tinh Ch�m",{0,1,30005,1,1,-1,-1,-1,-1,-1,-1}},-- ���ng m�n
	[8] = {"Vi�t Y�n Phi Tinh Ki�m",{0,2,30006,1,1,-1,-1,-1,-1,-1,-1}},--Nga My Ph�t gia
	[9] = {"Vi�t Y�n Phi Tinh C�m",{0,10,30007,1,1,-1,-1,-1,-1,-1,-1}},--Nga My t�c gia
	[11] = {"Vi�t Y�n Phi Tinh Th�",{0,0,30008,1,1,-1,-1,-1,-1,-1,-1}},-- C�i Bang T�nh Y
	[12] = {"Vi�t Y�n Tr�m Nguy�t C�n",{0,5,30009,1,1,-1,-1,-1,-1,-1,-1}},--C�i Bang � Y
	[14] = {"Vi�t Y�n Tr�m Nguy�t Ki�m",{0,2,30010,1,1,-1,-1,-1,-1,-1,-1}},-- V� �ang ��o Gia
	[15] = {"Vi�t Y�n Tr�m Nguy�t B�t",{0,9,30011,1,1,-1,-1,-1,-1,-1,-1}},-- V� �ang t�c gia
	[17] = {"Vi�t Y�n Tr�m Nguy�t Th��ng",{0,6,30012,1,1,-1,-1,-1,-1,-1,-1}},--D��ng Gia Th��ng
	[18] = {"Vi�t Y�n Tr�m Nguy�t Cung",{0,4,30013,1,1,-1,-1,-1,-1,-1,-1}},-- D��ng m�n cung
	[20] = {"Vi�t Y�n Tr�m Nguy�t Nh�n",{0,7,30014,1,1,-1,-1,-1,-1,-1,-1}},-- Hi�p ��c
	[21] = {"Vi�t Y�n Tr�m Nguy�t Tr�o",{0,11,30015,1,1,-1,-1,-1,-1,-1,-1}},-- Ta ��c
}


-- V� Kh� ��i Vi�t Y�n 
tb_golden_dvy_weapon = 
{
	[2] = {"��i Vi�t Y�n Phi Tinh �ao",{0,3,30016,1,1,-1,-1,-1,-1,-1,-1}},--Thi�u l�m t�c gia 
	[3] = {"��i Vi�t Y�n Phi Tinh Tr��ng",{0,8,30018,1,1,-1,-1,-1,-1,-1,-1}},-- Thi�u l�m thi�n t�ng
	[4] = {"��i Vi�t Y�n Phi Tinh Th�",{0,0,30019,1,1,-1,-1,-1,-1,-1,-1}},-- Thi�u l�m v� t�ng
	[6] = {"��i Vi�t Y�n Phi Tinh Ch�m",{0,1,30020,1,1,-1,-1,-1,-1,-1,-1}},-- ���ng m�n
	[8] = {"��i Vi�t Y�n Phi Tinh Ki�m",{0,2,30021,1,1,-1,-1,-1,-1,-1,-1}},--Nga My Ph�t Gia
	[9] = {"��i Vi�t Y�n Phi Tinh C�m",{0,10,30022,1,1,-1,-1,-1,-1,-1,-1}},--Nga My t�c gia
	[11] = {"��i Vi�t Y�n Phi Tinh Th�",{0,0,30023,1,1,-1,-1,-1,-1,-1,-1}},--- C�i bang  t�nh y
	[12] = {"��i Vi�t Y�n Tr�m Nguy�t C�n",{0,5,30024,1,1,-1,-1,-1,-1,-1,-1}},-- C�i Bang � y
	[14] = {"��i Vi�t Y�n Tr�m Nguy�t Ki�m ",{0,2,30025,1,1,-1,-1,-1,-1,-1,-1}},-- V� �ang ��o gia
	[15] = {"��i Vi�t Y�n Tr�m Nguy�t B�t",{0,9,30026,1,1,-1,-1,-1,-1,-1,-1}},-- V� �ang t�c gia
	[17] = {"��i Vi�t Y�n Tr�m Nguy�t Th��ng",{0,6,30027,1,1,-1,-1,-1,-1,-1,-1}},-- D��ng m�n th��ng
	[18] = {"��i Vi�t Y�n Tr�m Nguy�t Cung",{0,4,30028,1,1,-1,-1,-1,-1,-1,-1}},-- ���ng m�n cung
	[20] = {"��i Vi�t Y�n Tr�m Nguy�t Nh�n",{0,7,30029,1,1,-1,-1,-1,-1,-1,-1}},-- Hi�p ��c
	[21] = {"��i Vi�t Y�n Tr�m Nguy�t Tr�o",{0,11,30030,1,1,-1,-1,-1,-1,-1,-1}},--T� ��c
}

--- V� kh� s� m�n 4
tb_golden_Faction4_weapon = 
{
	[2] = {"B�t B� Thi�n Long Thi�n Ch�ng �ao",3,230},
	[3] = {"V� L��ng Ph�p T�n Thi�n Tr��ng",8,330},
	[4] = {"B�t B�o La H�n ��i Th�a Th�",0,430}, 
	[6] = {"Thi�n C� S� Gi� Th�n Tri�u Ch�m",1,630}, 
	[8] = {"B�ch Li�n Ti�n T� B�o U�n Ki�m",2,828},
	[9] = {"Ng�c V�n Ti�n T� Huy�n H�n C�m",10,928},
	[11] = {"Long ��u Th�n C�i ��ng V�n Th�",0,1130},
	[12] = {"Kh�t Thi�n Th�n C�i V�n Du C�n",5,1230},
	[14] = {"Ch��ng Kinh Thanh Quang Ki�m",2,1430},
	[15] = {"Th�i �t T�n Nh�n H�o Nhi�n B�t",9,1530},
	[17] = {"Long T��ng T��ng Qu�n Th��ng",6,1730,},
	[18] = {"H� D�c T��ng Qu�n Cung",4,1830},
	[20] = {"U Minh Qu� S�t Tu La Nh�n",7,2030},
	[21] = {"V� ��ng La S�t Tr�m Huy�t Tr�o",11,2130},
}

-- L�u  max s� l�n ��o r��ng trong ng�y
tbOpenBoxTimes = {1,8,12,16}

-- Table n�y l�u c�c v�t ph�m b�n c�n ��i  b�ng �i�m t�ch l�y
tbChangeAccumulateVLTB = 
{
	[1] = {130,"��nh H�n Thi�n Th�ch",{2,1,1067,1,4},7*24*3600 },
	[2] = { 130,"L�ng Ba Vi B�",{0,112,78,1,4}},
	[3] = {90,"N� Oa Tinh Th�ch",{2,1,504,8,4},7*24*3600},
	[4] = {50,"N�n S� m�n b� 4"},
	[5] = {50,"A� S� m�n b� 4"},
	[6] = { 50,"Qu�n S� m�n b� 4"},
	[7] = {50,"Trang s�c 1 S� m�n b� 4"},
	[8] = {50,"Trang s�c 1 S� m�n b� 4"},
	[9] = {40,"Thi�n Qu�i Th�ch",{2,0,1084,3}},
	[10] = {40,"Thi�n Th�ch Linh Th�ch",{2,1,1068,1,4},7*24*3600 },
	[11] = {30,"Phi Y�n Th�ch",{2,1,30130,5,4}},
}

function CheckAwardLevel()
	return gf_GetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_LEVELAWARD)
end

function CheckLevel()
	local nAwardLevel = 0;
	local nLevel = GetLevel();
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	
	for i = 96, 74, -1 do
		if nLevel >= i and nRep >= tb_golden_award[i][1] and nFaction >= tb_golden_award[i][2] and nHor >= tb_golden_award[i][3] and CheckAwardLevel() >=  tb_golden_award[i][4] then
			nAwardLevel = i;
			break;
		end
	end
	return nAwardLevel;
end

function CheckDigLevel()
	local nType = 0	
	local nLevel = GetLevel();
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	
	if nLevel >= 73 and nLevel <= 79 then
		nType =  1
	elseif nLevel >= 80 and nLevel <= 84 then
		nType = 2
	elseif nLevel >= 85 and nLevel <=89 then
		nType = 3
	elseif nLevel >= 90 then
		nType = 4
	else
		return nType
	end
	if nRep >= tb_golden_digging[nType][1] and nFaction >= tb_golden_digging[nType][2] and nHor >= tb_golden_digging[nType][3] and CheckActivated() == 2 then
		return nType	
	end	
	return 0
end

function CheckAccount()
	return gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE)
end 

function CheckActivated()
	if gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE) == 3 and gf_GetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS) == 3 then
		-- Thi�u Ni�n Anh H�ng
		return 1
	elseif gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE) == 4 and gf_GetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS) == 4 then
		-- V� L�m Ti�n B�i
		return 2
	else
		-- Ch�a k�ch ho�t
		return 0
	end
end

function GoldenGiveJewel()
	local nPos = 0
	local nRand = random(1, 1000)
	for i = 1, getn(tb_golden_jew) do
		if nRand > nPos and nRand <= nPos + tb_golden_jew[i][3] then
			ConfirmGetJewel(tb_golden_jew, i)
		end
		nPos = nPos + tb_golden_jew[i][3]
	end
end

function ConfirmGetJewel(tTable, nNum)
	local nType = tb_golden_jew[nNum][1]
	local nRoute = GetPlayerRoute()
	if nType == 1 then
		gf_AddItemEx2(tb_golden_jew[nNum][4], tb_golden_jew[nNum][2], szHKLBLogHeader, "nh�n ���c")
	elseif nType == 2 then
		gf_AddItemEx2(tb_golden_jew[nNum][2][nRoute][2], tb_golden_jew[nNum][2][nRoute][1], szHKLBLogHeader, "nh�n ���c")
	end
end

function CheckCharged()
	return gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_COUNT)
end

function GetTQVD()
	local nRand = random(1,100)
	local nBody = GetBody()
	if nRand <= 49 then
		gf_AddItemEx2({0,103,8050 + nBody,1,1,-1,-1,-1,-1,-1,-1}, "T� Quang Vi�m �� Kh�i", szHKLBLogHeader, "nh�n ���c")
	elseif nRand <= 98 then
		gf_AddItemEx2({0,101,8050 + nBody,1,1,-1,-1,-1,-1,-1,-1}, "T� Quang Vi�m �� Trang", szHKLBLogHeader, "nh�n ���c")
	else
		gf_AddItemEx2({0,100,8050 + nBody,1,1,-1,-1,-1,-1,-1,-1}, "T� Quang Vi�m �� Gi�p", szHKLBLogHeader, "nh�n ���c")
	end
end

-- Ph�i ��i l�i th�nh TaskID
function get_friendly_award()
	if CheckActivated() ~= 2 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� ch�a k�ch ho�t nh�n th��ng ho�c kh�ng ph�i V� L�m Ti�n B�i!")
		return
	end
	
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� nh�n ph�n th��ng n�y v�o th� s�u, th� b�y v� ch� nh�t.");
		return
	end
	
	local nCity = GetWorldPos()
	local nCheckCity = 0
	for i = 1, getn(tb_main_city) do
		if nCity == tb_main_city[i] then
			nCheckCity = 1
			break
		end
	end
	if nCheckCity == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� k�ch ho�t nh�n th��ng trong th�t ��i th�nh th�.");
		return
	end
	
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;	
	
	if GetName() ~= GetCaptainName() then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� ��i tr��ng m�i c� th� k�ch ho�t nh�n th��ng!")
		return
	end
	if nTeamSize < 2 then
		Talk(1,"","T� ��i ph�i c� 2 ng��i tr� l�n m�i kick ho�t ���c !")
		return
	end
	
	local nActivatedDate = floor(GetTask(TSK_HKLB_VLCH) / 100)
	local nDate = tonumber(date("%y%m%d"))
	if nActivatedDate ~= nDate then
		SetTask(TSK_HKLB_VLCH, nDate * 100 )
	end
	
	local nActivatedTime = mod(GetTask(TSK_HKLB_VLCH), 100)
	if nActivatedTime > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� k�ch ho�t nh�n th��ng h�m nay, ng�y mai h�y k�ch ho�t ti�p.");
		return
	end
	
	local szFailMember = ""
	local nDay = tonumber(date("%d"))
	local nMonth = tonumber(date("%m"))
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nCity2 = GetWorldPos()
		if gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_DAY) ~= nDay or gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_MONTH) ~= nMonth then
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_DAY, nDay)
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_MONTH, nMonth)
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT, 0)
		end
		
		if CheckActivated() ~= 2 then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� ch�a k�ch ho�t nh�n th��ng ho�c kh�ng ph�i V� L�m Ti�n B�i!")
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh�ng c� kh�ng ph�i V� L�m Ti�n B�i, kh�ng th� nh�n th��ng.", szFailMember))	
			return
		end
		
		if GetPlayerRoute() == 0 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.", szFailMember))
			return
		end				
		if GetLevel() < 80 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ch�a ��t c�p 80, kh�ng th� nh�n th��ng.", szFailMember))
			return
		end
		if gf_Check55HaveSkill() == 0 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ch�a h�c �� v� c�ng, kh�ng th� nh�n th��ng.", szFailMember))
			return
		end
		if gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT) >= 8 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s �� nh�n th��ng �� 8 l�n trong h�m nay, kh�ng th� nh�n th��ng.", szFailMember))
			return
		end
		if nCity2 ~= nCity then
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh�ng c�ng b�n �� v�i ��i tr��ng, kh�ng th� nh�n th��ng.", szFailMember))
			return
		end
	end
	PlayerIndex = nOldPlayerIdx
	
	SetTask(TSK_HKLB_VLCH, GetTask(TSK_HKLB_VLCH) + 1)
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetName() ~= GetCaptainName() then
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT, gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT) + 1)
			ModifyExp(1000000)
			Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng V� L�m Chi�n H�u!",0)		
			WriteLogEx(szLogTitle,"nh�n ph�n th��ng V� L�m Chi�n H�u")
		end
	end
	PlayerIndex = nOldPlayerIdx
	gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT, gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT) + 1)
	ModifyExp(3000000)
	Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� k�ch ho�t ���c ph�n th��ng V� L�m Chi�n H�u!",0)		
	WriteLogEx(szLogTitle,"k�ch ho�t nh�n ph�n th��ng V� L�m Chi�n H�u")
end

--- H�m t�ng pet c�p 1
function GivePet1Award()
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	-- Ki�m tra xem �� luy�n b�n ��ng h�nh hay ch�a
	if nCurLevel >= 1 then
		Talk(1, "", "C�c h� �� luy�n B�c ��u Ng� Linh Th�n Thu�t r�i, kh�ng c�n ph�i k�ch ho�t l�i n�a!")
		return
	end
	-- Th�a �i�u ki�n k�ch ho�t pet
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 1)
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_SEX,  random(1,2))
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE,  1)
	Msg2Player("B�n �� k�ch ho�t th�nh c�ng B�c ��u Ng� Linh Th�n Thu�t!")
end

function Confirm_make_shimen_tier4HKLB(nUpgradeType)
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "", g_szNpcName.."Ph�i gia nh�p h� ph�i ta m�i gi�p ng��i ���c!");
		return 0;
	end
	
	-- Ch� s� base c�a c�c trang b� theo m�n ph�i
	local tbShimen4Equip =
	{
		[2] =  {"Thi�u L�m t�c gia", 230}, 
		[3] =  {"Thi�u L�m thi�n t�ng", 330}, 
		[4] =  {"Thi�u L�m v� t�ng", 430}, 
		[14] =  {"V� �ang ��o gia", 1430}, 
		[15] =  {"V� �ang t�c gia", 1530}, 
		[8] =  {"Nga My ph�t gia", 830}, 
		[9] =  {"Nga My t�c gia", 930}, 
		[11] =  {"C�i Bang t�nh y", 1130}, 
		[12] =  {"C�i Bang � y", 1230}, 
		[6] =  {"���ng M�n", 630}, 
		[17] =  {"D��ng Gia th��ng", 1730}, 
		[18] =  {"D��ng Gia cung", 1830}, 
		[20] = {"Ng� ��c hi�p ��c", 2030}, 
		[21] = {"Ng� ��c t� ��c", 2130}, 
	}
	
	local tbUpgradeTypes =
	{
		[1] = {"M�", 103},
		[2] = {"Th��ng Y", 100},
		[3] = {"H� Y", 101},
		[4] = {"Trang S�c 1", 102},
		[5] = {"Trang S�c 2", 102},
	}
	
	-- X�c ��nh s� G, D, P �� add item
	local nPRoute = GetPlayerRoute()
	local nG = 0
	local nD = tbUpgradeTypes[nUpgradeType][2]
	local nP = tbShimen4Equip[nPRoute][2] + GetBody()
	if nUpgradeType == 5 then
		nP = nP + 4
	end
	if nPRoute == 8 or nPRoute == 9 then
		nP = nP - 2
	end
	
	local szEquipmentName = tbUpgradeTypes[nUpgradeType][1].." s� m�n c�p 4 m�n ph�i "..tbShimen4Equip[nPRoute][1]
	--SetTask(336, GetTask(336) - 2000)
	local nRec = gf_AddItemEx2({nG, nD, nP, 1, 1, -1, -1, -1, -1, -1, -1}, szEquipmentName, szHKLBLogHeader, "ch� t�o th�nh c�ng")
	Msg2Player("B�n �� nh�n ���c "..szEquipmentName)
	if  nRec~= 0  then
		return 1
	end
	return 0
end

-- Add trang b� s� m�n level 90
function AddTrangBiSuMon4()
	local nTemp = random(1,100)
	local nNum 
	if  nTemp <= 20 then
		nNum =  1
	elseif  nTemp <= 40 then
		nNum =  2
	elseif   nTemp <= 60 then
		nNum =  3
	elseif    nTemp <= 80 then
		nNum =  4
	else
		nNum =  5
	end
	Confirm_make_shimen_tier4HKLB(nNum) -- random(1, 5)
end

--  Nh�n v� kh� b� Phi Y�n - Vi�t Y�n - ��i Vi�t Y�n
function AddweaponFYVYDV94()
	local nPRoute = GetPlayerRoute()
	local nRand = random(1,10000)
	if nRand <=  8799 then
		gf_AddItemEx2(tb_golden_weapon_bpy_low[nPRoute][2],tb_golden_weapon_bpy_low[nPRoute][1],szHKLBLogHeader,"Nh�n Th�nh C�ng")
		Msg2Player("B�n �� nh�n ���c "..tb_golden_weapon_bpy_low[nPRoute][1])
	elseif  nRand <= 9799 then
		gf_AddItemEx2(tb_golden_vy_weapon[nPRoute][2],tb_golden_vy_weapon[nPRoute][1],szHKLBLogHeader,"Nh�n Th�nh C�ng")
		Msg2Player("B�n �� nh�n ���c "..tb_golden_vy_weapon[nPRoute][1])
	elseif  nRand <= 9899 then
		AddFaction4_weapon()
	else
		gf_AddItemEx2(tb_golden_dvy_weapon[nPRoute][2],tb_golden_dvy_weapon[nPRoute][1],szHKLBLogHeader,"Nh�n Th�nh C�ng")
		Msg2Player("B�n �� nh�n ���c "..tb_golden_dvy_weapon[nPRoute][1])
	end
end

-- V� kh� s� m�n 4
function AddFaction4_weapon()
	local nPRoute = GetPlayerRoute()
	local nzType = GetBody()
	gf_AddItemEx2({0,tb_golden_Faction4_weapon[nPRoute][2],tb_golden_Faction4_weapon[nPRoute][3]+nzType, 1, 1, -1, -1, -1, -1, -1, -1},tb_golden_Faction4_weapon[nPRoute][1],szHKLBLogHeader,"Nh�n Th�nh C�ng")
	Msg2Player("B�n �� nh�n ���c "..tb_golden_Faction4_weapon[nPRoute][1])
end
