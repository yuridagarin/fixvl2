-- VNG event �ua top server
-- Created by TuanNA5
-- Modify by PhucBDB 14/12/2011
-- Modify by DoanDVP 10/07/2014

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");

TOP_START_DATE = 20140725
TOP_END_DATE  = 20140912
TSK_TOP_TRANSLIFE1 = 1
TSK_TOP_HORNOR = 2
TSK_TOP_1MIL_HORNOR = 3
TSK_TOP_TRANSLIFE3 = 3
TOP_CREATED_ROLE = 1324490626
TOP_SERVER_ID = 91
szLOGSERVERNAME = "NGOA LONG"

-- Qui ��nh gia tr� �i�m danh v�ng , s� m�n , qu�n c�ng , top Level nh�n th��ng theo ��ng c�p
tb_topserver_award_limit = {				
				[76] = {  3000,   4000,   50000,     0},
				[77] = {  3000,   4000,   50000,     1},
				[78] = {  4000,   5000,   55000,     2},
				[79] = {  5000,   5000,   55000,     3},
				[80] = {  6000,   5000,   55000,     4},
				[81] = {  7000,   6000,   55000,     5},
				[82] = {  8000,   7000,   60000,     6},
				[83] = {  9000,   8000,   60000,     7},
--				[84] = {10000,   9000,   70000,   	 8},
--				[85] = {10000, 10000,   80000,    9},				
				[86] = {10000, 10000,   80000,    8},
				[87] = {10000, 10000,   80000,    9},
				[88] = {10000, 10000,   80000,    10},
				[89] = {10000, 10000,   80000,    11},
--				[90] = {10000, 10000,   80000,    14},
				[91] = {11000, 11000,   85000,    12},
				[92] = {11000, 11000,   90000,    13},
				[93] = {11000, 11000,   95000,    14},
				[94] = {12000, 12000,   120000,    15},
--				[98] = {16000, 16000,   160000,    19},
				[99] = {14000, 14000,   140000,    16},
--				[192] = {22000, 22000, 220000, 21},
--				[292] = {25000, 25000, 250000, 22},
--				[396] = {25000, 25000, 250000, 23},
};
-- Danh s�ch ID Skill 55
tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[22] = 0,
				[23] = 1030,
				[28] = 0,
				[29] = 1176,
				[30] = 1229,
}
-- Danh s�ch ID Skill tr�n ph�i
tFactionSkillInfo =
{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	
		[3] = 57,	
		[4] = 44,	
		[5] = 0,	
		[6] = 74,	
		[7] = 0,	
		[8] = 89,	
		[9] = 102,
		[10] = 0,			
		[11] = 113,
		[12] = 124,
		[13] = 0,		
		[14] = 146,
		[15] = 159,
		[16] = 0,		
		[17] = 732,
		[18] = 745,
		[19] = 0,		
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
}

tb_topserver_book45_1 = {
			[2] =  {"Kim Cang Ph�c Ma T�m Ph�p", {0,107,2,1}},
			[3] =  {"V� Tr�n T�m Ph�p", {0,107,6,1}},
			[4] =  {"Ti�m Long T�m Ph�p", {0,107,4,1}},
			[14] =  {"Huy�n �nh T�m Ph�p", {0,107,18,1}},
			[15] =  {"Qu�n T� T�m Ph�p", {0,107,20,1}},
			[8] =  {"Nh� � T�m Ph�p", {0,107,10,1}},
			[9] =  {"B�ch H�i T�m Ph�p", {0,107,12,1}},
			[11] =  {"H�n ��n T�m Ph�p", {0,107,14,1}},
			[12] =  {"Qu� Thi�n T�m Ph�p", {0,107,16,1}},
			[6] =  {"Thi�n La T�m Ph�p", {0,107,8,1}},
			[17] =  {"Tr�n Qu�n T�m Ph�p", {0,107,22,1}},
			[18] =  {"Xuy�n V�n T�m Ph�p", {0,107,24,1}},
			[20] = {"U Minh T�m Ph�p", {0,107,26,1}},
			[21] = {"Linh C� T�m Ph�p", {0,107,28,1}},
			[23] = {"Kinh Phong T�m Ph�p", {0,107,181,1}},
			[29] = {"T�y M�ng T�m Ph�p", {0,107,189,1}},
			[30] = {"Ph�n Hoa T�m Ph�p", {0,107,194,1}},
}

tb_topserver_book45_2 = {
			[2] =  {"Kim Cang Ph�c Ma kinh", {0,107,1,1}}, 
			[3] =  {"V� Tr�n M�t t�ch", {0,107,5,1}}, 
			[4] =  {"Ti�m Long M�t t�ch", {0,107,3,1}}, 
			[14] =  {"Huy�n �nh M�t t�ch", {0,107,17,1}}, 
			[15] =  {"Qu�n T� M�t t�ch", {0,107,19,1}}, 
			[8] =  {"Nh� � M�t T�ch", {0,107,9,1}}, 
			[9] =  {"B�ch H�i Ph�", {0,107,11,1}}, 
			[11] =  {"H�n ��n M�t t�ch", {0,107,13,1}}, 
			[12] =  {"Qu� Thi�n M�t t�ch", {0,107,15,1}}, 
			[6] =  {"Thi�n La M�t T�ch", {0,107,7,1}}, 
			[17] =  {"Tr�n Qu�n M�t t�ch", {0,107,21,1}}, 
			[18] =  {"Xuy�n V�n M�t t�ch", {0,107,23,1}}, 
			[20] = {"U Minh Qu� L�c", {0,107,25,1}}, 
			[21] = {"Linh C� M�t t�ch", {0,107,27,1}}, 
			[23] = {"Kinh Phong M�t t�ch", {0,107,180,1}}, 
			[29] = {"T�y M�ng  M�t t�ch", {0,107,188,1}}, 
			[30] = {"Ph�n Hoa M�t t�ch", {0,107,190,1}}, 
}
tb_topserver_book70_1 ={
			[2] = {"Kim Cang B�t Nh� Kinh", {0,107,166,1}},
			[3] = {"V� Tr�n B� �� Kinh",{0,107,168,1}},
			[4] = {"Ti�m Long T�ch Di�t Kinh",{0,107,167,1}},
			[6] = {"Thi�n La Li�n Ch�u L�c",{0,107,169,1}},
			[8] = {"Nh� � Kim ��nh M�t T�ch",{0,107,170,1}},
			[9] = {"B�ch H�i Tuy�t �m Ph�",{0,107,171,1}},
			[11] = {"H�n ��n Tr�n Nh�c M�t T�ch"	,{0,107,172,1}},
			[12] = {"Qu� Thi�n Du Long M�t T�ch",{0,107,173,1}},
			[14] = {"Huy�n �nh M� Tung M�t T�ch",{0,107,174,1}},
			[15] = {"Qu�n T� Ti�t Phong M�t T�ch",{0,107,175,1}},
			[17] = {"Tr�n Qu�n Phi Long Th��ng Ph�"	,{0,107,176,1}},
			[18] = {"Xuy�n V�n L�c H�ng M�t T�ch",{0,107,177,1}},
			[20] = {"U Minh Phong Ma L�c",{0,107,178,1}},
			[21] = {"Linh C� Huy�n T� L�c",{0,107,179,1}},
			[23] = {"C�u Thi�n Phong L�i Quy�n",{0,107,198,1}},
			[29] = {"H�ng Tr�n T�y M�ng Ph�",{0,107,202,1}},
			[30] = {"Phong Hoa Thi�n Di�p Quy�n",{0,107,203,1}},
}

tb_topserver_yue = {
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
};

tb_topserver_jew = {
				[1] = {"T�ng Ki�m Kim �n", 10, {0, 102, 40,1,1,-1,-1,-1,-1,-1,-1}},
				[2] = {"T�ng Ki�m K� Th�ch", 10, {0, 102, 39,1,1,-1,-1,-1,-1,-1,-1}},				
				[3] = {"T�ng Ki�m B�o Ch�u", 80, {0, 102, 38,1,1,-1,-1,-1,-1,-1,-1}},				
};

tb_topserver_book_high = {
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
};

tb_topserver_book_med = {
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
};

tb_topserver_book_low = {
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
};

tb_golden_book_all = {
				[2] = {"D�ch C�n Kinh", {0, 112, 101, 1}},		
				[4] = {"Nh� Lai Th�n Ch��ng", {0, 112, 102, 1}},		
				[3] = {"T�y T�y Kinh", {0, 112, 103, 1}},		
				[6] = {"H�p Tinh Tr�n", {0, 112, 104, 1}},		
				[8] = {"V�n T��ng Th�n C�ng", {0, 112, 105, 1}},		
				[9] = {"Thi�n �m Tr�n H�n Kh�c", {0, 112, 106, 1}},		
				[11] = {"Gi�ng Long Th�p B�t Ch��ng", {0, 112, 107, 1}},		
				[12] = {"�� C�u C�n Tr�n", {0, 112, 108, 1}},		
				[14] = {"V� Th��ng Th�i C�c Ki�m", {0, 112, 109, 1}},		
				[15] = {"Th�i C�c Th�n C�ng", {0, 112, 110, 1}},		
				[17] = {"Li�n Ho�n To�n Long Th��ng", {0, 112, 111, 1}},		
				[18] = {"B� V��ng T��ng Ph�ng Ti�n", {0, 112, 112, 1}},		
				[20] = {"V� Thi�n Ma C�ng", {0, 112, 113, 1}},		
				[21] = {"V� �nh Ma C�", {0, 112, 114, 1}},
				[23] = {"Phong L�i Ch�u", {0,112,192,1}},
				[29] = {"Ph�ng Minh Ph�", {0,112,196,1}},
				[30] = {"Hoa Ti�n T�m Kinh", {0,112,197,1}},	
}

tbMatTich70caocap  =
{
		[2] =  {"Kim Cang B�t Nh� Ch�n Quy�n", {0, 107, 204, 1}}, 
		[3] =  {"V� Tr�n B� �� Ch�n Quy�n", {0, 107, 206, 1}}, 
		[4] =  {"Ti�m Long T�c Di�t Ch�n Quy�n", {0, 107, 205, 1}}, 
		[14] =  {"Huy�n �nh M� T�ng Ch�n Quy�n", {0, 107, 212, 1}}, 
		[15] =  {"Qu�n T� ��i Phong Ch�n Quy�n", {0, 107, 213, 1}}, 
		[8] =  {"Nh� � Kim ��nh Ch�n Quy�n", {0, 107, 208, 1}}, 
		[9] =  {"B�ch H�i Tuy�t �m Ch�n Quy�n", {0, 107, 209, 1}}, 
		[11] =  {"H�n ��n Tr�n Nh�c Ch�n Quy�n", {0, 107, 210, 1}}, 
		[12] =  {"Qu� Thi�n Du Long Ch�n Quy�n", {0, 107, 211, 1}}, 
		[6] =  {"Thi�n La Li�n Ch�u Ch�n Quy�n", {0, 107, 207, 1}}, 
		[17] =  {"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n", {0, 107, 214, 1}}, 
		[18] =  {"Xuy�n V�n L�c H�ng Ch�n Quy�n", {0, 107, 215, 1}}, 
		[20] = {"Huy�n Minh Phong Ma Ch�n Quy�n", {0, 107, 216, 1}}, 
		[21] = {"Linh C� Huy�n T� Ch�n Quy�n", {0, 107, 217, 1}},
		[23] = {"C�u Thi�n Phong L�i Ch�n Quy�n", {0,107,218, 1}},
		[29] = {"H�ng Tr�n T�y M�ng Ch�n Quy�n", {0,107,222, 1}},
		[30] = {"Phong Hoa Thi�n Di�p Ch�n Quy�n", {0,107,223, 1}},
}

local tbVukhiVietYen = {
		--[2] = {"Vi�t Y�n Phi Tinh �ao", {0,3,30001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, 
		--[2] = {"Vi�t Y�n Phi Tinh C�n", {0,5,30002,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		[3] =  {"Vi�t Y�n Phi Tinh Tr��ng", {0,8,30003,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[4] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30004,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[14] =  {"Vi�t Y�n Tr�m Nguy�t Ki�m", {0,2,30010,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[15] =  {"Vi�t Y�n Tr�m Nguy�t B�t", {0,9,30011,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[8] =  {"Vi�t Y�n Phi Tinh Ki�m", {0,2,30006,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[9] =  {"Vi�t Y�n Phi Tinh C�m", {0,10,30007,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[11] =  {"Vi�t Y�n Phi Tinh Th�", {0,0,30008,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[12] =  {"Vi�t Y�n Tr�m Nguy�t C�n", {0,5,30009,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[6] =  {"Vi�t Y�n Phi Tinh Ch�m", {0,1,30005,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[17] =  {"Vi�t Y�n Tr�m Nguy�t Th��ng", {0,6,30012,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[18] =  {"Vi�t Y�n Tr�m Nguy�t Cung", {0,4,30013,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[20] = {"Vi�t Y�n Tr�m Nguy�t Nh�n", {0,7,30014,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
		[21] = {"Vi�t Y�n Tr�m Nguy�t Tr�o", {0,11,30015,1,1,-1,-1,-1,-1,-1,-1,-1,13}},
}

-- 1 item, 2 command, 3 table
-- must identify this table below the sub table
tb_topserver_award_item = {				
				[76] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 1000000, 0}},
				[77] = {{3, tb_topserver_book70_1, 0, 0}, {2, "Earn(%d)", 2000000, 0}},
				[78] = {{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0},{3, tbMatTich70caocap, 0, 0}, {2, "Earn(%d)", 3000000, 0}},
				[79] = {{1, "V� L�m Cao Th�", {2,1,1040,1,4}, 60*24*60*60}, {2, "Earn(%d)", 4000000, 0}},
				[80] = {{2, "AddItem(2,1,30164+mod(random(0,1000),%d),100)",20, 0}, {2, "Earn(%d)", 10000000, 0}},
				[81] = {{2,"NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "M�c R��ng", {2,1,30340,999,4}, 0}},
				[82] = {{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0},{2, "NhanRuongYeuQuyet(%d)", 30*24*60*60,0}, {1, "N� Oa Tinh Th�ch", {2,1,504,2,4}, 30*24*60*60}},
				[83] = {{3, tb_golden_book_all, 0, 0}, {2, "Earn(%d)", 10000000, 0}},
--				[84] = {{3, tb_topserver_book_med, 0, 0}, {1, "Thi�n Th�ch Linh Th�ch", {2,1,1068,1,4}, 30*24*60*60}},
--				[85] = {{3, tb_topserver_book_low, 0, 0}, {1, "M�nh B�ch Kim", {2,1,30346,1,1}, 0}},
				[86] = {{1, "Qu�n C�ng Ch��ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "T� �o", {2,1,1070,1,4}, 30*24*60*60}},
				[87] = {{1, "Nh�n S�m V�n N�m", {2,1,30071,5,1}, 30*24*60*60},{1, "Qu�n C�ng Ch��ng", {2,1,9999,5,1}, 0}},
				[88] = {{1, "Qu�n C�ng Ch��ng", {2,1,9999,5,1}, 30*24*60*60}, {1, "Qu�n C�ng ��i", {2,1,9998,1,1}, 30*24*60*60}},
				[89] = {{1, "Qu�n C�ng ��i", {2,1,9998,5,1}, 30*24*60*60}},
--				[90] = {{1, "N� Oa Tinh Th�ch", {2,1,504,4,4}, 30*24*60*60}},
				[91] = {{1, "Qu�n C�ng Huy Ho�ng", {2,1,9977,3,1}, 30*24*60*60}},
				[92] = {{1, "Qu�n C�ng Huy Ho�ng", {2,1,9977,6,1}, 30*24*60*60}},
				[93] = {{1, "Thi�n Th�ch Linh Th�ch", {2,1,1068,2,4}, 30*24*60*60}},
				[94] = {{1, "Qu�n C�ng Huy Ho�ng", {2,1,9977,8,1}, 30*24*60*60}},
--				[98] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}},
				[99] = {{1, "��i ��nh H�n", {2,1,1113,1}, 30*24*60*60},{1, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2,1,1067,1}, 30*24*60*60}},
--				[192] = {{3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {3, tbMatTich70caocap, 0, 0}, {1, "Th�i D�ch H�n Nguy�n C�ng ��", {2,0,1082,100,1}, 0}, {1, "L�ng Ba Vi B�", {0,112,78,1,1}, 0}},
--				[292] = {{3, tbMatTich70caocap, 0, 0}, {1, "Th�i D�ch H�n Nguy�n C�ng ��", {2,0,1082,100,1}, 0}, {3, tbVukhiVietYen, 0, 0}},
--				[396] = {{1, "��i ��nh H�n", {2,1,1113,1}, 30*24*60*60}, {1, "Chuy�n Sinh ��n", {2,1,30345,1,4}, 60*24*60*60}},
};

tbTuVienChien = {
	[2] = {"T� Vi�n Chi�n",{0,102,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"T� Vi�n Chi�n",{0,102,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"T� Vi�n Chi�n",{0,102,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"T� Vi�n Chi�n",{0,102,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"T� Vi�n Chi�n",{0,102,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"T� Vi�n Chi�n",{0,102,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"T� Vi�n Chi�n",{0,102,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"T� Vi�n Chi�n",{0,102,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"T� Vi�n Chi�n",{0,102,8867,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"T� Vi�n Chi�n",{0,102,8869,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"T� Vi�n Chi�n",{0,102,8871,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"T� Vi�n Chi�n",{0,102,8873,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"T� Vi�n Chi�n",{0,102,8875,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"T� Vi�n Chi�n",{0,102,8877,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienDau = {
	[2] = {"T� Vi�n ��u",{0,102,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"T� Vi�n ��u",{0,102,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"T� Vi�n ��u",{0,102,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"T� Vi�n ��u",{0,102,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"T� Vi�n ��u",{0,102,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"T� Vi�n ��u",{0,102,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"T� Vi�n ��u",{0,102,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"T� Vi�n ��u",{0,102,8866,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"T� Vi�n ��u",{0,102,8868,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"T� Vi�n ��u",{0,102,8870,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"T� Vi�n ��u",{0,102,8872,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"T� Vi�n ��u",{0,102,8874,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"T� Vi�n ��u",{0,102,8876,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"T� Vi�n ��u",{0,102,8878,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbTuVienVuKhi = {
	[2] = {{"T� Quang To�i V� �ao",{0,3,8851,1,1,-1,-1,-1,-1,-1,-1,-1,0}}, {"T� Quang To�i V� C�n",{0,5,8852,1,1,-1,-1,-1,-1,-1,-1,-1,0}}},
	[3] = {"T� Quang C�u Nh� Tr��ng",{0,8,8853,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"T� Quang H�o Nhi�n Th�",{0,0,8854,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"T� Quang V� H�nh Ch�m",{0,1,8855,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"T� Quang T� Tinh Ki�m",{0,2,8856,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"T� Quang Ph�ng Ho�ng C�m",{0,10,8857,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"T� Quang Ng� Nh�c Th�",{0,0,8858,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"T� Quang Ph� Thi�n C�n",{0,5,8859,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"T� Quang H�ng Qu�n Ki�m",{0,2,8860,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"T� Quang Sinh T� B�t",{0,9,8861,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"T� Quang Ph� Qu�n Th��ng",{0,6,8862,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"T� Quang Khai Thi�n Cung",{0,4,8863,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"T� Quang �m D��ng Nh�n",{0,7,8864,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"T� Quang U Minh Tr�o",{0,11,8865,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienChien = {
	[2] = {"Hi�n Vi�n Chi�n",{0,102,8801,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hi�n Vi�n Chi�n",{0,102,8803,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hi�n Vi�n Chi�n",{0,102,8805,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hi�n Vi�n Chi�n",{0,102,8807,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hi�n Vi�n Chi�n",{0,102,8809,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hi�n Vi�n Chi�n",{0,102,8811,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hi�n Vi�n Chi�n",{0,102,8813,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hi�n Vi�n Chi�n",{0,102,8815,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hi�n Vi�n Chi�n",{0,102,8817,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hi�n Vi�n Chi�n",{0,102,8819,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hi�n Vi�n Chi�n",{0,102,8821,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hi�n Vi�n Chi�n",{0,102,8823,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hi�n Vi�n Chi�n",{0,102,8825,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hi�n Vi�n Chi�n",{0,102,8827,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienDau = {
	[2] = {"Hi�n Vi�n ��u",{0,102,8802,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"Hi�n Vi�n ��u",{0,102,8804,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"Hi�n Vi�n ��u",{0,102,8806,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"Hi�n Vi�n ��u",{0,102,8808,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"Hi�n Vi�n ��u",{0,102,8810,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"Hi�n Vi�n ��u",{0,102,8812,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"Hi�n Vi�n ��u",{0,102,8814,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"Hi�n Vi�n ��u",{0,102,8816,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"Hi�n Vi�n ��u",{0,102,8818,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"Hi�n Vi�n ��u",{0,102,8820,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"Hi�n Vi�n ��u",{0,102,8822,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"Hi�n Vi�n ��u",{0,102,8824,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"Hi�n Vi�n ��u",{0,102,8826,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"Hi�n Vi�n ��u",{0,102,8828,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}

tbHienVienVuKhi = {
	[2] = {{"Hi�n Vi�n To�i V� �ao",{0,3,8801,1,1,-1,-1,-1,-1,-1,-1,-1,14}}, {"Hi�n Vi�n To�i V� C�n",{0,5,8802,1,1,-1,-1,-1,-1,-1,-1,-1,14}}},
	[3] = {"Hi�n Vi�n C�u Nh� Tr��ng",{0,8,8803,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[4] = {"Hi�n Vi�n H�o Nhi�n Th�",{0,0,8804,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[6] = {"Hi�n Vi�n V� H�nh Ch�m",{0,1,8805,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[8] = {"Hi�n Vi�n T� Tinh Ki�m",{0,2,8806,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[9] = {"Hi�n Vi�n Ph�ng Ho�ng C�m",{0,10,8807,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[11] = {"Hi�n Vi�n Ng� Nh�c Th�",{0,0,8808,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[12] = {"Hi�n Vi�n Ph� Thi�n C�n",{0,5,8809,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[14] = {"Hi�n Vi�n H�ng Qu�n Ki�m",{0,2,8810,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[15] = {"Hi�n Vi�n Sinh T� B�t",{0,9,8811,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[17] = {"Hi�n Vi�n Ph� Qu�n Th��ng",{0,6,8812,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[18] = {"Hi�n Vi�n Khai Thi�n Cung",{0,4,8813,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[20] = {"Hi�n Vi�n �m D��ng Nh�n",{0,7,8814,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
	[21] = {"Hi�n Vi�n U Minh Tr�o",{0,11,8815,1,1,-1,-1,-1,-1,-1,-1,-1,14}},
}

tbVuKhiHaoNguyet = {
	[2] = {"H�o Nguy�t-�� N�n T�n Gi� Ph�t �ao",{0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[3] = {"H�o Nguy�t-�� Ki�p T�n Gi� Ph�t Th�",{0,8,8973,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[4] = {"H�o Nguy�t-�� �ch T�n Gi� Ph�t Tr��ng",{0,0,8974,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[6] = {"H�o Nguy�t-V�n Ki�p Th�nh Th� Ch�m",{0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[8] = {"H�o Nguy�t-Ph�t V�n Th�nh C� Li�n Ki�m",{0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[9] = {"H�o Nguy�t-Ph�t Tr�n Th�nh C� C�m",{0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[11] = {"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Th�",{0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[12] = {"H�o Nguy�t-Du Long ��a Kh�t C�n",{0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[14] = {"H�o Nguy�t-V� C�c Thi�n T�n T�c Ki�m",{0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[15] = {"H�o Nguy�t-B�ch L�c Thi�n T�n B�t",{0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[17] = {"H�o Nguy�t-C�m Thi�n ��u H�n Th��ng",{0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[18] = {"H�o Nguy�t-��nh Thi�n Th�n Ngh� Cung",{0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[20] = {"H�o Nguy�t-Qu� X�c T� Th�n �ao",{0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	[21] = {"H�o Nguy�t-Vu C�t ��c V��ng Tr�o",{0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
}
-- Qu�n C�ng ��i	2	1	9998
-- Qu�n C�ng Huy Ho�ng	2	1	9977
tbDieuKienUuDai = {
	[1] = {nLevel = 88, tbitem = {2,1,504,1, "N� Oa Tinh Th�ch"}, nBit = 9, name= "Thi�n Chi T�ng Ki�m B�o Ch�u", nSlot = 7, nWeight = 100},
	[2] = {nLevel = 89, tbitem = {2,1,504,2, "N� Oa Tinh Th�ch"}, nBit = 10, name= "Thi�n Chi T�ng Ki�m K� Th�ch", nSlot = 7, nWeight = 100},
	[3] = {nLevel = 90, tbitem = {2,1,504,3, "N� Oa Tinh Th�ch"}, nBit = 11, name= "Thi�n Chi T�ng Ki�m Kim �n", nSlot  = 7, nWeight  = 100},
	[4] = {nLevel = 91, tbitem = {2,1,504,5, "N� Oa Tinh Th�ch"}, nBit = 12, name= "��ng Ph��ng Long Ch�u", nSlot  = 7, nWeight  = 100},
	[5] = {nLevel = 92, tbitem = {2,1,504,1, "N� Oa Tinh Th�ch"}, nBit = 13, name= "1000 Tr�i c�y ng�u nhi�n", nSlot  = 7, nWeight  = 100},
	[6] = {nLevel = 93, tbitem = {2,1,504,1, "N� Oa Tinh Th�ch"}, nBit = 14, name= "1000 Tr�i c�y ng�u nhi�n", nSlot  = 7, nWeight  = 100},
	[7] = {nLevel = 94, tbitem = {2,1,504,4, "N� Oa Tinh Th�ch"}, nBit = 15, name= "500 C� Linh Th�ch , 1000 C� Linh Ng�c", nSlot  = 7, nWeight  = 100},
	[8] = {nLevel = 96, tbitem = {2,1,504,9, "N� Oa Tinh Th�ch"}, nBit = 16, name= "1200 C� Linh Th�ch , 2000 C� Linh Ng�c", nSlot  = 7, nWeight  = 100},
}

tbTrangBiKimXa_NguyenSoai = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,153,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,153,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,153,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,152,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,152,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,152,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,154,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,154,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,154,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
			},
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,153,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,153,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,153,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,152,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,152,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,152,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,154,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,154,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,154,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
			},
	},
}

tbTrangBiKimXa_TuongQuan = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
				[2] = {item={{gdp={0,153,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
				[3] = {item={{gdp={0,153,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
				[4] = {item={{gdp={0,153,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng T��ng Qu�n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
				[2] = {item={{gdp={0,152,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
				[3] = {item={{gdp={0,152,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
				[4] = {item={{gdp={0,152,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng T�ng T��ng Qu�n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
				[2] = {item={{gdp={0,154,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
				[3] = {item={{gdp={0,154,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
				[4] = {item={{gdp={0,154,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i T�ng T��ng Qu�n"}}},
			}
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
				[2] = {item={{gdp={0,153,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
				[3] = {item={{gdp={0,153,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
				[4] = {item={{gdp={0,153,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u T��ng Qu�n"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
				[2] = {item={{gdp={0,152,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
				[3] = {item={{gdp={0,152,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
				[4] = {item={{gdp={0,152,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u T��ng Qu�n"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
				[2] = {item={{gdp={0,154,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
				[3] = {item={{gdp={0,154,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
				[4] = {item={{gdp={0,154,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u T��ng Qu�n"}}},
			}
	},
}

-- Check �i�u ki�n nh�n th��ng theo Level
function TopCheckLevel()
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT);
	local nAwardLevel = 0;
	local nLevel = GetLevel() + nChuyenSinh*100;
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	local nTaskVal = gf_GetTaskByte(TSK_TOP_LEVEL,1)
	for i = 396, 76, -1 do
		if type(tb_topserver_award_limit[i])=="table" and nLevel >= i and nRep >= tb_topserver_award_limit[i][1] and nFaction >= tb_topserver_award_limit[i][2] and nHor >= tb_topserver_award_limit[i][3] and nTaskVal >=  tb_topserver_award_limit[i][4] then
			nAwardLevel = i;
			break;
		end
	end
	return nAwardLevel;
end

-- Check level skill tr�n ph�i
function TopCheckSkill(tb_Skill_ID, nSkillLevel)
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end;

tb_Faction_Name = {	
	[1] = {"shaolin","Thi�u L�m"},
	[2] = {"wudang","V� �ang"},
	[3] = {"emei","Nga My"},
	[4] = {"gaibang","C�i Bang"},
	[5] = {"tangmen","���ng M�n"},
	[6] = {"yangmen","D��ng M�n"},
	[7] = {"wudu","Ng� ��c"},
}

tb_Route_Name = {	
	[1] = "",
	[2] = "Thi�u L�m T�c Gia",
	[3] = "Thi�u L�m Thi�n T�ng",
	[4] = "Thi�u L�m V� T�ng",
	[5] = "",
	[6] = "���ng M�n",
	[7] = "",
	[8] = "Nga My Ph�t Gia",
	[9] = "Nga My T�c Gia",
	[10] = "",
	[11] = "C�i Bang T�nh Y",
	[12] = "C�i Bang � Y",
	[13] = "",
	[14] = "V� �ang ��o Gia",
	[15] = "V� �ang T�c Gia",
	[16] = "",
	[17] = "D��ng M�n Th��ng K�",
	[18] = "D��ng M�n Cung K�",
	[19] = "",
	[20] = "Ng� ��c T� Hi�p",
	[21] = "Ng� ��c C� S�",
	[22] = "",
	[23] = "C�n L�n Thi�n S�",
	[24] = "",
	[25] = "",
	[26] = "",
	[27] = "",
	[28] = "",
	[29] = "Th�y Y�n V� Ti�n",
	[30] = "Th�y Y�n Linh N�",
	
	
}

tb_Nation_Name = {	
	[1] = "T�ng",
	[2] = "Li�u",
}

-- Check Max Skill 55
function CheckMaxSkill55()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end;
	end;
end;


-- Nh�n th��ng Vi�m ��
function GiveAwardVD(nLv)
	local VD =
	{
		{0,103,8000,"Vi�m �� Kh�i"},
		{0,100,8000,"Vi�m �� Gi�p"},
		{0,101,8000,"Vi�m �� Trang"},
	}
	local nBody = GetBody()
	for i = 1 , getn(VD) do
		gf_AddItemEx2({VD[i][1],VD[i][2],VD[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nLv},VD[i][4],"Nhan Thuong Server moi","nh�n")
	end
end

-- Nh�n th��ng Nguy�n So�i theo ki�u h�nh
function GiveAwardNguyenSoai(nLv)
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbNguyenSoaiTong) do
			local nItemLevel = nLv
			if tbNguyenSoaiTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiTong[i][1],tbNguyenSoaiTong[i][2],tbNguyenSoaiTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiTong[i][4],"Nhan Thuong Server moi","nh�n")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbNguyenSoaiLieu) do
			local nItemLevel = nLv
			if tbNguyenSoaiLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbNguyenSoaiLieu[i][1],tbNguyenSoaiLieu[i][2],tbNguyenSoaiLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbNguyenSoaiLieu[i][4],"Nhan Thuong Server moi","nh�n")
		end
	end
end

-- Nh�n th��ng Thi�n Chi T��ng Qu�n  theo ki�u h�nh
function GiveAwardTCTQ(nLv)
	local tbTCTQTong = {
		{0,100,3015,"T�ng T��ng Qu�n Chi�n B�o"},
		{0,101,3015,"T�ng T��ng Qu�n Chi�n B�o"},
		{0,103,3015,"T�ng T��ng Qu�n Chi�n B�o"},
		{0,102,3031,"Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
		{0,102,3035,"Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
		{0,102,3039,"Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
	}
	local tbTCTQLieu = {
		{0,100,3019,"Li�u T��ng Qu�n Chi�n B�o"},
		{0,101,3019,"Li�u T��ng Qu�n Chi�n B�o"},
		{0,103,3019,"Li�u T��ng Qu�n Chi�n B�o"},
		{0,102,3043,"Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
		{0,102,3047,"Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
		{0,102,3051,"Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
	}
	local nBody = GetBody()
	if GetTask(701)>0 then
		for i = 1 , getn(tbTCTQTong) do
			local nItemLevel = nLv
			if tbTCTQTong[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQTong[i][1],tbTCTQTong[i][2],tbTCTQTong[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQTong[i][4],"Nhan Thuong Server moi","nh�n")
		end
	elseif GetTask(701)<0 then
		for i = 1 , getn(tbTCTQLieu) do
			local nItemLevel = nLv
			if tbTCTQLieu[i][2] == 102 then
				nItemLevel = 0
			end
			gf_AddItemEx2({tbTCTQLieu[i][1],tbTCTQLieu[i][2],tbTCTQLieu[i][3]+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},tbTCTQLieu[i][4],"Nhan Thuong Server moi","nh�n")
		end
	end
end


-- Nh�n th��ng Thi�n Chi T�ng Ki�m theo ki�u h�nh
function GiveAwardTCTK(nAwardOrder)
	local tbBodyRatio = {1, 4, 7, 10}
	local tbTCTK = {
		[4] = {0,103,30000,"Thi�n Chi T�ng Ki�m T� Kim M�o"},
		[5] = {0,100,30000,"Thi�n Chi T�ng Ki�m Kim L� Th��ng"},
		[6] = {0,101,30000,"Thi�n Chi T�ng Ki�m � Kim Ph�c"},
		[7] = {0,102,30000,"Thi�n Chi T�ng Ki�m B�o Ch�u"},
		[8] = {0,102,30001,"Thi�n Chi T�ng Ki�m K� Th�ch"},
		[9] = {0,102,30002,"Thi�n Chi T�ng Ki�m Kim �n"},
	}
	local nBody = GetBody()
	if tbTCTK[nAwardOrder][2] ~= 102 then
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+nBody, 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	else
		gf_AddItemEx2({tbTCTK[nAwardOrder][1], tbTCTK[nAwardOrder][2], tbTCTK[nAwardOrder][3]+tbBodyRatio[nBody], 1, 1, -1, -1, -1, -1, -1, -1, -1, 0}, tbTCTK[nAwardOrder][4], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	end
end


function NhanVKTuVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbTuVienVuKhi[2][1][2], tbTuVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	else
		gf_AddItemEx2(tbTuVienVuKhi[2][2][2], tbTuVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	end
end

function NhanVKHienVienThieuLam(nOption)
	if nOption==1 then
		gf_AddItemEx2(tbHienVienVuKhi[2][1][2], tbHienVienVuKhi[2][1][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	else
		gf_AddItemEx2(tbHienVienVuKhi[2][2][2], tbHienVienVuKhi[2][2][1], "Uu Dai "..szLOGSERVERNAME, "nh�n")
	end
end

function TraoThienChiViemDe(nItemLevel)
	local tbTCVD_Body1 = {
			item = {
				{gdp = {0,103,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8055,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTCVD_Body2 = {
			item = {
				{gdp = {0,103,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8056,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTCVD_Body3 = {
			item = {
				{gdp = {0,103,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8057,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTCVD_Body4 = {
			item = {
				{gdp = {0,103,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Kh�i"},
				{gdp = {0,100,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Gi�p"},
				{gdp = {0,101,8058,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbAwardSet = {
		[1] = tbTCVD_Body1,
		[2] = tbTCVD_Body2,
		[3] = tbTCVD_Body3,
		[4] = tbTCVD_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByBody(tbAwardSet)
end


function TraoThienChiTuongQuan(nItemLevel)
	local tbTongTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3040,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3037,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3041,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Vi�m �� Trang"},
			}}
	local tbTongTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3038,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3042,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3039,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3043,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi T�ng T��ng Qu�n L�nh Ph�"},
			}}
	
	local tbLieuTCTQ_Body1 = {
			item = {
				{gdp = {0,103,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3044,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3048,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTCTQ_Body2 = {
			item = {
				{gdp = {0,103,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3045,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3049,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTCTQ_Body3 = {
			item = {
				{gdp = {0,103,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3046,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3050,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTCTQ_Body4 = {
			item = {
				{gdp = {0,103,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,3023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Thi�n Chi Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,3047,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,3051,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,3055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Thi�n Chi Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTCTQ_Body1,
		[2] = tbTongTCTQ_Body2,
		[3] = tbTongTCTQ_Body3,
		[4] = tbTongTCTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTCTQ_Body1,
		[2] = tbLieuTCTQ_Body2,
		[3] = tbLieuTCTQ_Body3,
		[4] = tbLieuTCTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoBachKimViemDe(nItemLevel)
	local tbBachKimViemDe_Body1 = {
			item = {
				{gdp = {0,103,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30013,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbBachKimViemDe_Body2 = {
			item = {
				{gdp = {0,103,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30014,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbBachKimViemDe_Body3 = {
			item = {
				{gdp = {0,103,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30015,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbBachKimViemDe_Body4 = {
			item = {
				{gdp = {0,103,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Kh�i"},
				{gdp = {0,100,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Gi�p"},
				{gdp = {0,101,30016,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel},  name = "B�ch Kim Vi�m �� Trang"},
			}}
	local tbAwardSet = {
		[1] = tbBachKimViemDe_Body1,
		[2] = tbBachKimViemDe_Body2,
		[3] = tbBachKimViemDe_Body3,
		[4] = tbBachKimViemDe_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByBody(tbAwardSet)
end

function TraoNguyenSoai(nItemLevel)
	local tbTongNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2251,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2301,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2305,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2501,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2505,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}
	local tbTongNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2252,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2302,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2306,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2502,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2506,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}
	local tbTongNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2253,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2303,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2307,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2503,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2507,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}
	local tbTongNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2254,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2304,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2308,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2504,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i Ph�"},
				{gdp = {0,102,2508,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng So�i K�"},
			}}		
	
	local tbLieuNguyenSoai_Body1 = {
			item = {
				{gdp = {0,103,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2255,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2311,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2315,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2511,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2515,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
	local tbLieuNguyenSoai_Body2 = {
			item = {
				{gdp = {0,103,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2256,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2312,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2316,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2512,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2516,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
	local tbLieuNguyenSoai_Body3 = {
			item = {
				{gdp = {0,103,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2257,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2313,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2317,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2513,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2517,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
	local tbLieuNguyenSoai_Body4 = {
			item = {
				{gdp = {0,103,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u  Nguy�n So�i Chi�n B�o"},
				{gdp = {0,100,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,101,2258,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Nguy�n So�i Chi�n B�o"},
				{gdp = {0,102,2314,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i H� Ph�"},
				{gdp = {0,102,2318,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Nguy�n So�i L�nh K�"},
				{gdp = {0,102,2514,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i Ph�"},
				{gdp = {0,102,2518,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u So�i K�"},
			}}
					
	local tbTongAwardSet = {
		[1] = tbTongNguyenSoai_Body1,
		[2] = tbTongNguyenSoai_Body2,
		[3] = tbTongNguyenSoai_Body3,
		[4] = tbTongNguyenSoai_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNguyenSoai_Body1,
		[2] = tbLieuNguyenSoai_Body2,
		[3] = tbLieuNguyenSoai_Body3,
		[4] = tbLieuNguyenSoai_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngNguyenSoai(nItemLevel)
	local tbTongTUNS_Body1 = {
			item = {
				{gdp = {0,103,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30037,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30064,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30068,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30072,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30076,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
	local tbTongTUNS_Body2 = {
			item = {
				{gdp = {0,103,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30038,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30065,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30069,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30073,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30077,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
	local tbTongTUNS_Body3 = {
			item = {
				{gdp = {0,103,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30039,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30066,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30070,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30074,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30078,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
	local tbTongTUNS_Body4 = {
			item = {
				{gdp = {0,103,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30040,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Th��ng �ng So�i Trang"},
				{gdp = {0,102,30067,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i H�"},
				{gdp = {0,102,30071,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30075,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30079,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Th��ng �ng So�i K�"},
			}}
			
	local tbLieuTUNS_Body1 = {
			item = {
				{gdp = {0,103,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30049,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30100,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30104,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30108,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30112,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbLieuTUNS_Body2 = {
			item = {
				{gdp = {0,103,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30050,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30101,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30105,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30109,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30113,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbLieuTUNS_Body3 = {
			item = {
				{gdp = {0,103,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30051,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30102,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30106,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30110,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30114,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbLieuTUNS_Body4 = {
			item = {
				{gdp = {0,103,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Kh�i"},
				{gdp = {0,100,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Gi�p"},
				{gdp = {0,101,30052,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Th��ng �ng So�i Trang"},
				{gdp = {0,102,30103,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i H�"},
				{gdp = {0,102,30107,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i L�nh"},
				{gdp = {0,102,30111,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i Ph�"},
				{gdp = {0,102,30115,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Th��ng �ng So�i K�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongTUNS_Body1,
		[2] = tbTongTUNS_Body2,
		[3] = tbTongTUNS_Body3,
		[4] = tbTongTUNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUNS_Body1,
		[2] = tbLieuTUNS_Body2,
		[3] = tbLieuTUNS_Body3,
		[4] = tbLieuTUNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngTuongQuan(nItemLevel)
	local tbTongTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30033,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30052,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30056,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30060,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30034,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30053,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30057,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30061,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30035,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30054,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30058,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30062,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30036,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng T�ng T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30055,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30059,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30063,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng T�ng T��ng Qu�n L�nh Ph�"},
			}}	
			
	local tbLieuTUTQ_Body1 = {
			item = {
				{gdp = {0,103,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30045,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30088,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30092,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30096,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTUTQ_Body2 = {
			item = {
				{gdp = {0,103,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30046,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30089,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30093,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30097,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTUTQ_Body3 = {
			item = {
				{gdp = {0,103,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30047,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30090,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30094,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30098,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuTUTQ_Body4 = {
			item = {
				{gdp = {0,103,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Kh�i"},
				{gdp = {0,100,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Gi�p"},
				{gdp = {0,101,30048,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Th��ng �ng Li�u T��ng Qu�n Chi�n Trang"},
				{gdp = {0,102,30091,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30095,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30099,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Th��ng �ng Li�u T��ng Qu�n L�nh Ph�"},
			}}		
	local tbTongAwardSet = {
		[1] = tbTongTUTQ_Body1,
		[2] = tbTongTUTQ_Body2,
		[3] = tbTongTUTQ_Body3,
		[4] = tbTongTUTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuTUTQ_Body1,
		[2] = tbLieuTUTQ_Body2,
		[3] = tbLieuTUTQ_Body3,
		[4] = tbLieuTUTQ_Body4,
	}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoThuongUngDoThong(nGenre)
	local szItemName = "Th��ng �ng �� Th�ng "
	local nID = 30028
	local szPhe = "T�ng "
	if GetTask(701) < 0 then
		nID = 30040
		szPhe = "Li�u "
	end
	if nGenre == 100 then
		szItemName = szPhe .. szItemName .. "Gi�p"
	elseif nGenre == 101 then
		szItemName = szPhe .. szItemName .. "Trang"
	elseif nGenre == 103 then
		szItemName = szPhe .. szItemName .. "Kh�i"
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward)
end


function TraoThuongUngTienPhong(nType)
	local szItemName = "Th��ng �ng Ti�n Phong "
	local nID = 30043
	local szPhe = "T�ng "
	if GetTask(701) < 0 then
		nID = 30079
		szPhe = "Li�u "
	end
	
	if nType == 1 then
		szItemName = szPhe .. szItemName .. "K�"
	else
		szItemName = szPhe .. szItemName .. "Ph�"
		nID = nID + 4
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,102,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = szItemName}}}
	LIB_Award.szLogTitle = "Uu Dai "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward)
end


function TraoNguLongTuongQuan_TrangBi(nItemLevel)
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30017,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30018,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30019,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30020,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "T�ng Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,103,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30021,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,103,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30022,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,103,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30023,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,103,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Kh�i"},
				{gdp = {0,100,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Gi�p"},
				{gdp = {0,101,30024,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}, name = "Li�u Ng� Long T��ng Qu�n Trang"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoNguLongTuongQuan_TrangSuc()
	local tbTongNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30017,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30021,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30018,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30022,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30019,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30023,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30020,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30024,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "T�ng Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body1 = {
			item = {
				{gdp = {0,102,30025,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30029,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30033,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body2 = {
			item = {
				{gdp = {0,102,30026,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30030,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30034,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body3 = {
			item = {
				{gdp = {0,102,30027,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30031,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30035,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbLieuNLTQ_Body4 = {
			item = {
				{gdp = {0,102,30028,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh B�i"},
				{gdp = {0,102,30032,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh K�"},
				{gdp = {0,102,30036,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Li�u Ng� Long T��ng Qu�n L�nh Ph�"},
			}}
	local tbTongAwardSet = {
		[1] = tbTongNLTQ_Body1,
		[2] = tbTongNLTQ_Body2,
		[3] = tbTongNLTQ_Body3,
		[4] = tbTongNLTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuNLTQ_Body1,
		[2] = tbLieuNLTQ_Body2,
		[3] = tbLieuNLTQ_Body3,
		[4] = tbLieuNLTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoMatTich70CaoCap(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nQty}, name ="Kim Cang B�t Nh� Ch�n Quy�n"}}},
		[3] = {item={{gdp={0,107,205, nQty}, name ="Ti�m Long T�c Di�t Ch�n Quy�n"}}},
		[4] = {item={{gdp={0,107,206, nQty}, name ="V� Tr�n B� �� Ch�n Quy�n"}}},
		[6] = {item={{gdp={0,107,207, nQty}, name ="Thi�n La Li�n Ch�u Ch�n Quy�n"}}},
		[8] = {item={{gdp={0,107,208, nQty}, name ="Nh� � Kim ��nh Ch�n Quy�n"}}},
		[9] = {item={{gdp={0,107,209, nQty}, name ="B�ch H�i Tuy�t �m Ch�n Quy�n"}}},
		[11] = {item={{gdp={0,107,210, nQty}, name ="H�n ��n Tr�n Nh�c Ch�n Quy�n"}}},
		[12] = {item={{gdp={0,107,211, nQty}, name ="Qu� Thi�n Du Long Ch�n Quy�n"}}},
		[14] = {item={{gdp={0,107,212, nQty}, name ="Huy�n �nh M� T�ng Ch�n Quy�n"}}},
		[15] = {item={{gdp={0,107,213, nQty}, name ="Qu�n T� ��i Phong Ch�n Quy�n"}}},
		[17] = {item={{gdp={0,107,214, nQty}, name ="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"}}},
		[18] = {item={{gdp={0,107,215, nQty}, name ="Xuy�n V�n L�c H�ng Ch�n Quy�n"}}},
		[20] = {item={{gdp={0,107,216, nQty}, name ="Huy�n Minh Phong Ma Ch�n Quy�n"}}},
		[21] = {item={{gdp={0,107,217, nQty}, name ="Linh C� Huy�n T� Ch�n Quy�n"}}},
		[23] = {item={{gdp={0,107,218,nQty}, name ="C�u Thi�n Phong L�i Ch�n Quy�n"}}},
		[29] = {item={{gdp={0,107,222,nQty}, name ="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}},
		[30] = {item={{gdp={0,107,223,nQty}, name ="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRoute(tbMatTich)
end


function ThuongVuKhi_ThuyYenLinhNu()
	local nOpLevel1, nOpID1 = IDOption_Random()
	local nOpLevel2, nOpID2 = IDOption_Random()
	if nOpID1 == nOpID2 then
		local tbRate = {[1]={[1] = 6, nRate=80}, [2]={[1] = 7, nRate=20},}
		nOpID2 = 50
		nOpLevel2 = LIB_Award:GetValueByRate(tbRate)
	end

	local tbAward = {item={{gdp={0,12,12,1,1,3,252,nOpLevel1,nOpID1,nOpLevel2,nOpID2,-1, 0}, name = "Minh B�ng"}}}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward)
end

			
function IDOption_Random()
	local tbOptionIDList = {
		[1] = {[1] = {49, {
						[1] = {[1] = 6, nRate=50}, 
						[2] = {[1] = 7, nRate=50},
				}}, nRate = 10.12},
		
		[2] = {[1] = {268, {
					[1]={[1] = 3, nRate=60}, 
					[2]={[1] = 4, nRate=34},
					[3]={[1] = 5, nRate=5},
					[4]={[1] = 6, nRate=1},
				}}, nRate = 1.62},
		[3] = {[1] = {53, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[4] = {[1] = {54, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 6.11},
		[5] = {[1] = {63, {
					[1]={[1] = 5, nRate=50}, 
					[2]={[1] = 6, nRate=50},
				}}, nRate = 10.12},
		[6] = {[1] = {390, {
					[1]={[1] = 2, nRate=70}, 
					[2]={[1] = 3, nRate=25},
					[3]={[1] = 4,nRate=5},
				}}, nRate = 1.11},
		[7] = {[1] = {85, {
					[1]={[1] = 4, nRate=60}, 
					[2]={[1] = 5, nRate=30},
					[3]={[1] = 6,nRate=10},
				}}, nRate = 4.11},
		[8] = {[1] = {94, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},	
		[9] = {[1] = {96, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[10] = {[1] = {97, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[11] = {[1] = {95, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 11.12},
		[12] = {[1] = {102, {
					[1]={[1] = 6, nRate=80}, 
					[2]={[1] = 7, nRate=20},
				}}, nRate = 8.11},
		[13] = {[1] = {111, {
					[1]={[1] = 6, nRate=60}, 
					[2]={[1] = 7, nRate=40},
				}}, nRate = 8.11},
	}
	local tbOptionTemp = LIB_Award:GetValueByRate(tbOptionIDList)
	local nOptionID = tbOptionTemp[1]
	local nOptionLevel = LIB_Award:GetValueByRate(tbOptionTemp[2])
	return nOptionLevel, nOptionID
end


function NhanRuongYeuQuyet(nThoihan)
	local tbRuongYeuQuyet = {
		[2] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m", nExpired = nThoihan}}},
		[4] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m", nExpired = nThoihan}}},
		[3] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m", nExpired = nThoihan}}},
		[6] = {item={{gdp={2,0,608,1}, name="T�i b� ki�p ���ng M�n", nExpired = nThoihan}}},
		[8] = {item={{gdp={2,0,609,1}, name="T�i b� ki�p Nga My", nExpired = nThoihan}}},
		[9] = {item={{gdp={2,0,609,1}, name="T�i b� ki�p Nga My", nExpired = nThoihan}}},
		[11] = {item={{gdp={2,0,610,1}, name="T�i b� ki�p C�i Bang", nExpired = nThoihan}}},
		[12] = {item={{gdp={2,0,610,1}, name="T�i b� ki�p C�i Bang", nExpired = nThoihan}}},
		[14] = {item={{gdp={2,0,611,1}, name="T�i b� ki�p V� �ang", nExpired = nThoihan}}},
		[15] = {item={{gdp={2,0,611,1}, name="T�i b� ki�p V� �ang", nExpired = nThoihan}}},
		[17] = {item={{gdp={2,0,612,1}, name="T�i b� ki�p D��ng M�n", nExpired = nThoihan}}},
		[18] = {item={{gdp={2,0,612,1}, name="T�i b� ki�p D��ng M�n", nExpired = nThoihan}}},
		[20] = {item={{gdp={2,0,613,1}, name="T�i b� ki�p Ng� ��c", nExpired = nThoihan}}},
		[21] = {item={{gdp={2,0,613,1}, name="T�i b� ki�p Ng� ��c", nExpired = nThoihan}}},
		[23] = {fn="NhanBiKipConLon()"},
		[29] = {fn="NhanBiKipThuyYen()"},
		[30] = {fn="NhanBiKipThuyYen()"},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
--	for i=1,5 do
		LIB_Award:AwardByRoute(tbRuongYeuQuyet)
--	end
end


function NhanBiKipConLon()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	local tbBiKipConLon = {
		[1] = {[1] = {item={{gdp={2,6,169,1}, name = "B� ki�p L�i T�"}}}, nRate = 7.15},
		[2] = {[1] = {item={{gdp={2,6,170,1}, name = "B� ki�p Phong T�"}}}, nRate = 7.15},
		[3] = {[1] = {item={{gdp={2,6,171,1}, name = "B� ki�p Thi�n l�i ph�"}}}, nRate = 7.15},
		[4] = {[1] = {item={{gdp={2,6,172,1}, name = "B� ki�p B�ng Phong Quy�t"}}}, nRate = 7.15},
		[5] = {[1] = {item={{gdp={2,6,173,1}, name = "B� ki�p Ng� Phong Quy�t"}}}, nRate = 7.14},
		[6] = {[1] = {item={{gdp={2,6,174,1}, name = "B� Ki�p Cu�ng L�i Ph�"}}}, nRate = 7.14},
		[7] = {[1] = {item={{gdp={2,6,175,1}, name = "B� Ki�p D��ng Sa Quy�t"}}}, nRate = 7.14},
		[8] = {[1] = {item={{gdp={2,6,176,1}, name = "B� Ki�p Oanh L�i Ph�"}}}, nRate = 7.14},
		[9] = {[1] = {item={{gdp={2,6,177,1}, name = "B� Ki�p Cang phong quy�t"}}}, nRate = 7.14},
		[10] = {[1] = {item={{gdp={2,6,178,1}, name = "B� Ki�p B�o L�i Ph�"}}}, nRate = 7.14},
		[11] = {[1] = {item={{gdp={2,6,179,1}, name = "B� Ki�p Ti�u phong t�n quy�t"}}}, nRate = 7.14},
		[12] = {[1] = {item={{gdp={2,6,180,1}, name = "B� Ki�p Ng� L�i ch�nh ph�p ph�"}}}, nRate = 7.14},
		[13] = {[1] = {item={{gdp={2,6,181,1}, name = "B� Ki�p V�n L�i To�i Tinh ph�"}}}, nRate = 7.14},
		[14] = {[1] = {item={{gdp={2,6,182,1}, name = "B� Ki�p Huy�n Phong tri�n quy�t"}}}, nRate = 7.14},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipConLon)
	end
end


function NhanBiKipThuyYen()
	if gf_Judge_Room_Weight(5,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	local tbBiKipThuyYen = {
		[1] = {[1] = {item={{gdp={2,6,219,1}, name = "Y�u quy�t Kh�i V�"}}}, nRate = 4.55},
		[2] = {[1] = {item={{gdp={2,6,220,1}, name = "Y�u quy�t Linh Mi�u V�n"}}}, nRate = 4.55},
		[3] = {[1] = {item={{gdp={2,6,221,1}, name = "Y�u quy�t V� V�n T�m Ph�p"}}}, nRate = 4.55},
		[4] = {[1] = {item={{gdp={2,6,222,1}, name = "Y�u quy�t M� Hoa"}}}, nRate = 4.55},
		[5] = {[1] = {item={{gdp={2,6,223,1}, name = "Y�u quy�t �o�n V�n"}}}, nRate = 4.55},
		[6] = {[1] = {item={{gdp={2,6,224,1}, name = "Y�u quy�t Thu Nguy�t V�"}}}, nRate = 4.55},
		[7] = {[1] = {item={{gdp={2,6,225,1}, name = "Y�u quy�t Thi�n L�i T�m Kinh"}}}, nRate = 4.54},
		[8] = {[1] = {item={{gdp={2,6,226,1}, name = "Y�u quy�t �i�p Uy�n"}}}, nRate = 4.54},
		[9] = {[1] = {item={{gdp={2,6,227,1}, name = "Y�u quy�t Thi�n H�a Di�m D��ng"}}}, nRate = 4.54},
		[10] = {[1] = {item={{gdp={2,6,228,1}, name = "��p V�n X�o B� Quy�t Y�u"}}}, nRate = 4.54},
		[11] = {[1] = {item={{gdp={2,6,229,1}, name = "Y�u quy�t M�ng X�"}}}, nRate = 4.54},
		[12] = {[1] = {item={{gdp={2,6,230,1}, name = "Y�u quy�t L�c Hoa Quy�t"}}}, nRate = 4.55},
		[13] = {[1] = {item={{gdp={2,6,231,1}, name = "Y�u quy�t ��o Hoa Ch��ng"}}}, nRate = 4.55},
		[14] = {[1] = {item={{gdp={2,6,232,1}, name = "Y�u quy�t B�ch Hoa T�m Kinh"}}}, nRate = 4.55},
		[15] = {[1] = {item={{gdp={2,6,233,1}, name = "Y�u quy�t T�a T�m Quy�t"}}}, nRate = 4.55},
		[16] = {[1] = {item={{gdp={2,6,234,1}, name = "Y�u quy�t Ho�n Th�n Thu�t"}}}, nRate = 4.55},
		[17] = {[1] = {item={{gdp={2,6,235,1}, name = "Y�u quy�t Linh ��ng Quy�t"}}}, nRate = 4.55},
		[18] = {[1] = {item={{gdp={2,6,236,1}, name = "Y�u quy�t M� X�o Quy�t"}}}, nRate = 4.54},
		[19] = {[1] = {item={{gdp={2,6,237,1}, name = "Y�u quy�t Ti�n L� H��ng"}}}, nRate = 4.54},
		[20] = {[1] = {item={{gdp={2,6,238,1}, name = "Y�u quy�t B�ch �i�p Ngh�nh H��ng Quy�t"}}}, nRate = 4.54},
		[21] = {[1] = {item={{gdp={2,6,239,1}, name = "Y�u quy�t �i�p Luy�n Hoa"}}}, nRate = 4.54},
		[22] = {[1] = {item={{gdp={2,6,240,1}, name = "Y�u quy�t Ng�c Long Xuy�n Nguy�t"}}}, nRate = 4.54},
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipThuyYen)
	end
end


function TraoMatTichCaoCap20(nQty, nRoute)
	local tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
	local tbRate = {
		[1] = {[1] = 2, nRate = 5.88},
		[2] = {[1] = 4, nRate = 5.88},
		[3] = {[1] = 3, nRate = 5.88},
		[4] = {[1] = 6, nRate = 5.88},
		[5] = {[1] = 8, nRate = 5.88},
		[6] = {[1] = 9, nRate = 5.88},
		[7] = {[1] = 11, nRate = 5.88},
		[8] = {[1] = 12, nRate = 5.88},
		[9] = {[1] = 14, nRate = 5.88},
		[10] = {[1] = 15, nRate = 5.88},
		[11] = {[1] = 17, nRate = 5.88},
		[12] = {[1] = 18, nRate = 5.88},
		[13] = {[1] = 20, nRate = 5.88},
		[14] = {[1] = 21, nRate = 5.88},
		[15] = {[1] = 23, nRate = 5.88},
		[16] = {[1] = 29, nRate = 5.88},
		[17] = {[1] = 30, nRate = 5.92},
	}
	for i=1, nQty do
		if nRoute == nil then
			nIndex = LIB_Award:GetValueByRate(tbRate)
		else
			nIndex = nRoute
		end
		local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
		if tbMatTich[nIndex][4] == 1 then
			SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
		else
			SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
		end
	end
end


function TraoTrangBiKimXaNguyenSoai()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
end

function TraoTrangBiKimXaTuongQuan()
	local nBody = GetBody()
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][1][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][2][nBody])
	LIB_Award:Award(tbTrangBiKimXa_TuongQuan[nPhe][3][nBody])
end


function TraoLoiHoNguyenSoai(nItemLevel)
	local tbTongLHNS_Body1 = {
			item = {
				{gdp = {0,103,30219,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30219,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30219,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30169,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30173,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30177,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30181,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body2 = {
			item = {
				{gdp = {0,103,30220,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30220,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30220,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30170,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30174,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30178,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30182,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body3 = {
			item = {
				{gdp = {0,103,30221,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30221,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30221,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30171,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30175,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30179,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30183,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHNS_Body4 = {
			item = {
				{gdp = {0,103,30222,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30222,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30222,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30172,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30176,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30180,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30184,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
			
	local tbLieuLHNS_Body1 = {
			item = {
				{gdp = {0,103,30231,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30231,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30231,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30205,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30209,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30213,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30217,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body2 = {
			item = {
				{gdp = {0,103,30232,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30232,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30232,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30206,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30210,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30214,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30218,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body3 = {
			item = {
				{gdp = {0,103,30233,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30233,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30233,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30207,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30211,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30215,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30219,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbLieuLHNS_Body4 = {
			item = {
				{gdp = {0,103,30234,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30234,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30234,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30208,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30212,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30216,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30220,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHNS_Body1,
		[2] = tbTongLHNS_Body2,
		[3] = tbTongLHNS_Body3,
		[4] = tbTongLHNS_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHNS_Body1,
		[2] = tbLieuLHNS_Body2,
		[3] = tbLieuLHNS_Body3,
		[4] = tbLieuLHNS_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end


function TraoLoiHoTuongQuan(nItemLevel)
	local tbTongLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30215,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30215,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30215,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30157,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30161,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30165,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			}}
	local tbTongLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30216,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30216,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30216,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30158,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30162,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30166,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				
			}}
	local tbTongLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30217,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30217,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30217,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30159,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30163,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30167,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbTongLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30218,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30218,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30218,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30160,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30164,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30168,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
			
	local tbLieuLHTQ_Body1 = {
			item = {
				{gdp = {0,103,30227,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30227,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30227,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30193,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30197,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30201,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body2 = {
			item = {
				{gdp = {0,103,30228,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30228,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30228,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30194,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30198,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30202,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
	
			}}
	local tbLieuLHTQ_Body3 = {
			item = {
				{gdp = {0,103,30229,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30229,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30229,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30195,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30199,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30203,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
		
			}}
	local tbLieuLHTQ_Body4 = {
			item = {
				{gdp = {0,103,30230,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,100,30230,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,101,30230,1,1,-1,-1,-1,-1,-1,-1,-1,nItemLevel}},
				{gdp = {0,102,30196,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30200,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
				{gdp = {0,102,30204,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			
			}}
	local tbTongAwardSet = {
		[1] = tbTongLHTQ_Body1,
		[2] = tbTongLHTQ_Body2,
		[3] = tbTongLHTQ_Body3,
		[4] = tbTongLHTQ_Body4,
	}
	local tbLieuAwardSet = {
		[1] = tbLieuLHTQ_Body1,
		[2] = tbLieuLHTQ_Body2,
		[3] = tbLieuLHTQ_Body3,
		[4] = tbLieuLHTQ_Body4,
	}
	LIB_Award.szLogTitle = "NHAN THUONG DUA TOP "..szLOGSERVERNAME
	LIB_Award.szLogAction = "nh�n"
	if GetTask(701) < 0 then
		LIB_Award:AwardByBody(tbLieuAwardSet)
	else
		LIB_Award:AwardByBody(tbTongAwardSet)
	end
end