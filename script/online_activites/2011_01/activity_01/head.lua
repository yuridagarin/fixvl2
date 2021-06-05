Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");

VET_201101_01_STR_LOG_TITLE = "Hoat dong thang 1 nam 2011"

PB_useThreshold = 2000;
PB_activityID = 25;

PB_modeTaskID = VET_201101_01_TASK_MODE;
PB_usedCountTaskID = VET_201101_01_TASK_USED_COUNT;
PB_usedCountMode1TaskID = VET_201101_01_TASK_USED_COUNT_MODE1;
PB_usedCountMode2TaskID = VET_201101_01_TASK_USED_COUNT_MODE2;
PB_ifGotRewardTaskID = VET_201101_01_IF_GET_REWARD;

VET_201101_01_TB_LOG_ACTION_LIST =
{
	[1] = "��i M�m Ng� Qu� b�ng Xu",
	[2] = "Nh�n th��ng M�m Ng� Qu�",
	[3] = "Nh�n th��ng �i�m T� Quang C�c",
	[4] = "��i M�m Ng� Qu� b�ng Nh�nh Hoa Mai",
	[5] = "Ph�n th��ng s� d�ng M�m Ng� Qu� t�i �a v�t ph�m",
	[6] = "Ph�n th��ng s� d�ng M�m Ng� Qu� t�i �a lo�i ",
}

PB_expReward = 
{
	200000, 
	250000
}

PB_items = 
{
	{2, 1, 30277, "Nguy�n li�u event T�t"},
	{2, 1, 30230, " Xu "},
	{2, 1, 199, "��i ng�n phi�u"},
	{2, 1, 30051, "Nh�nh Hoa Mai"},
};

PB_exchangeTable1 = 
{
	{
		{"Nguy�n li�u event T�t", 2, 1, 30277, 5},
		{" Xu ", 2, 1, 30230, 2}
	},
	{
		{"M�m Ng� Qu�", 100, {"M�m Ng� Qu�", {2, 1, 30278, 1}}}
	}
};

PB_exchangeTable2 = 
{
	{
		{"��i ng�n phi�u", 2, 1, 199, 1},
	},
	{
		{" Xu ", 100, {" Xu ", {2, 1, 30230, 100}}}
	}
};

-- base 1000
PB_itemReward =
{
	{3, 250, 10000, 1},
	{1, 100, "Thi�n th�ch", {2, 2, 8, 1}},
	{1, 60, "M�nh Thi�n th�ch", {2, 2, 7, 1}},
 	{1, 5, "Th� Th�n ph�", {2, 0, 556, 1}, 7 * 24 * 3600},
 	{1, 20, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 7 * 24 * 3600},
 	{1, 20, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
 	{1, 10, "C�y B�t Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
  	{4, 200, 10, 1},
  	{5, 140, 10, 1},
	{1, 5, "Thi�n H� M�t t�ch", {0, 107, 64, 1}},
	{1, 5, "T� H� M�t t�ch", {0, 107, 65, 1}},
	{1, 5, "Chi�m Y Ph�", {0, 107, 66, 1}},
	{1, 20, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},
	{1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
	{1, 5, "��ng Ti�n V�ng", {2, 1, 30094,1}},
	{1, 10, "�� Nguy�t Th�n Sa", {2, 1, 3332, 1}},
	{1, 100, "X�ch Thi�t Tinh", {2, 1, 2652, 1}},
	{1, 35, "Th�i D�ch H�n Nguy�n C�ng ��", {2, 0, 1082, 1}}
};

PB_specialTimes = 20;

-- base 10000
PB_extraItemReward = {
    {8, 1800, 60, 1},
    {15, 1800, 60, 1},
    {12, 1800, 60, 1},
    {1, 300, "S� tay s�ng", {2, 19, 1, 1}, 7 * 24 * 3600},
    {1, 300, "C� quan nh�n", {2, 1, 1011, 1}, 7 * 24 * 3600},
    {1, 500, "V� Ng�n Th�y", {2, 1, 503, 1}, 7 * 24 * 3600},
    {1, 500, "T�y T�y ��n", {2, 0, 136, 1}, 7 * 24 * 3600},
    {1, 100, "T�y T�y linh ��n", {2, 0, 137, 1}, 7 * 24 * 3600},
    {1, 1049, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 1000, "R��ng B� K�p", {2, 1, 30093, 1}, 7 * 24 * 3600},
    {1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 50, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 400, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 400, "Nguy�t Hoa Chi Tinh", {2, 1, 3219, 1}}
};

-- base 10000
PB_equipmentReward1 = {
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
};

-- base 10000
PB_equipmentReward2 = {
	{1, 20, "B�ch V� Th��ng Ng�y ��c Y", {0, 100, 21219, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B�ch V� Th��ng Ng�y ��c Y", {0, 100, 21229, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B�ch V� Th��ng Ng�y ��c Y", {0, 100, 21239, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "B�ch V� Th��ng Ng�y ��c Y", {0, 100, 21249, 1, 1, -1, -1, -1, -1, -1, -1}},	
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
};

PB_equipmentReward3 = {
	{1, 20, "B�ch V� Th��ng Qu� ��c Tr�o", {0, 11, 21219, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B�ch V� Th��ng Qu� ��c Tr�o", {0, 11, 21229, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B�ch V� Th��ng Qu� ��c Tr�o", {0, 11, 21239, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B�ch V� Th��ng Qu� ��c Tr�o", {0, 11, 21249, 1, 1, -1, -1, -1, -1, -1, -1}},
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
};


function PB_giveEuipment1()
	gf_EventGiveRandAward(PB_equipmentReward1, 10000, 1, VET_201101_01_STR_LOG_TITLE, "V� kh� b� Phi Y�n");
end

function PB_giveEuipment2()
	gf_EventGiveRandAward(PB_equipmentReward2, 1000, 1, VET_201101_01_STR_LOG_TITLE, "Ph�n th��ng trang b� s� m�n c�p 9");
end

function PB_giveEuipment3()
	gf_EventGiveRandAward(PB_equipmentReward3, 1000, 1, VET_201101_01_STR_LOG_TITLE, "Ph�n th��ng v� kh� s� m�n c�p 9");
end

-- base 100
PB_maxCountNonItemReward1 = {
	{2, 100, 20000000}
};


-- base 1000
PB_maxCountItemReward = 
{
	{31, 5, "PB_giveEuipment1()", ""},
	{31, 5, "PB_giveEuipment2()", ""},
	{31, 5, "PB_giveEuipment3()", ""},
	{1, 1, "Thi�n Qu�i Th�ch", {2, 0, 1084, 1}},
	{1, 100, "Chi�n Th�n ho�n", {2, 1, 1005, 1}, 7 * 24 * 3600},
	{1, 10, "Phi Y�n Th�ch", {2, 1, 30130, 1}},
	{1, 50, "T� Quang Th�n Th�ch", {2, 1, 30131, 1}},
	{1, 10, "Long T� B�i", {2, 1, 30155, 1}},
	{1, 10, "Ph�ng T� B�i", {2, 1, 30156, 1}},
	{1, 10, "�ng T� B�i", {2, 1, 30158, 1}},
	{1, 300, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}},
	{1, 1, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
	{1, 10, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}},	
	{1, 5, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
	{1, 1, "L�ng Ba Vi B�", {0, 112, 78, 1}},
	{1, 50, "Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1}, 7 * 24 * 3600},
	{32, 422, 7000, 1}, 
	{1, 5, "Th�i D�ch H�n Nguy�n Ph�", {2, 0, 1083, 1}}
}

PB_title = "<color=yellow>Ho�t ��ng ��n m�ng T�t Nguy�n ��n<color> di�n ra t� <color=red>ng�y 14/1/2011 ��n h�t ng�y 20/2/2011<color>. <color=green>Th�ng tin chi ti�t xem t�i trang ch� http://volam2.zing.vn<color>";

PB_menu = 
{
	"��i M�m Ng� Qu� (c�n 5 Hoa Mai + 2 Xu v�t ph�m)/PB_composite",
	"Nh�n ph�n th��ng s� d�ng t�i �a M�m Ng� Qu�/PB_getThresholdReward",
	"Ch�n h�nh th�c nh�n th��ng/PB_chooseMode",
	"��i 100 v�t ph�m xu (c�n 1 ��i Ng�n Phi�u)/PB_exchange",
	"\n��i M�m Ng� Qu� (c�n 5 Hoa Mai + 1 Nh�nh Hoa Mai)/PB_composite1",
	"Nh�n T�n M�o ��i H�ng Bao/PB_give_dahongbao",
	"N�p 10 M�m Ng� Qu�/PB_give_5fruit",
};

PB_title_2 = "H�y ch�n lo�i ph�n th��ng:";
PB_menu_2 = 
{
	"20.000.000 Exp v� v�t ph�m /#PB_confirm_getThresholdReward(1)",
	"20 �i�m n�ng c�p B�n ��ng H�nh v� v�t ph�m/#PB_confirm_getThresholdReward(2)",	-- TODO: finished by VinaGame
	"1 �i�m linh l�c B�n ��ng H�nh v� v�t ph�m/#PB_confirm_getThresholdReward(3)", -- TODO: finished by VinaGame
	"R�i kh�i/gf_DoNothing"
}

PB_title_3 = "Vui l�ng ch�n h�nh th�c nh�n th��ng";
PB_menu_3 = 
{
	"K�ch ho�t nh�n th��ng nh�n v�t ph�m/PB_activateItemMode",
	"K�ch ho�t nh�n th��ng kh�ng nh�n v�t ph�m (t�ng th�m 25% kinh nghi�m)/PB_activateNonItemMode",
	"R�i kh�i/gf_DoNothing"
};

PB_results = 
{
	"Nguy�n li�u mang theo kh�ng ��",
	"R�i kh�i",
	"C�c h� �� nh�n th��ng",
	"�� k�ch ho�t nh�n th��ng k�m v�t ph�m",
	"�� k�ch ho�t nh�n th��ng kh�ng k�m v�t ph�m, t�ng th�m 25% kinh nghi�m",
	"S� l��ng M�m Ng� Qu� c�c h� s� d�ng �� ��t gi�i h�n!",
	"Xin ch�c m�ng, l�n th� <color=green>%d<color> s� d�ng <color=yellow>%s<color> nh�n ���c <color=green>%d<color> �i�m T� Quang C�c",
}

function PB_setMode(mode)
	SetTask(PB_modeTaskID, mode);
end

function PB_getMode()
	local result = GetTask(PB_modeTaskID);
	return result;
end

function PB_getUsedCount()
	return GetTask(PB_usedCountTaskID);
end

function PB_getUsedCountMode1()
	return GetTask(PB_usedCountMode1TaskID);
end

function PB_getUsedCountMode2()
	return GetTask(PB_usedCountMode2TaskID)
end

function PB_addUsedCount()
	SetTask(PB_usedCountTaskID, GetTask(PB_usedCountTaskID)+1);
	if 1 == PB_getMode() then
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE1, GetTask(PB_usedCountMode1TaskID)+1);
	else
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE2, GetTask(PB_usedCountMode2TaskID)+1);
	end
end

function PB_notEnoughMaterial()
	local title = PB_results[1];
	local menu = {PB_results[2]};
	Say(title, getn(menu), menu);
end

function PB_maxCount()
	--WriteLog("PB_maxCount::called");
	local title = PB_results[6];
	local menu = {PB_results[2]};
	Say(title, getn(menu), menu);
end

function PB_composite1()
    if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    if GetItemCount(2, 1, 30277) < 5 or GetItemCount(2, 1, 30051) < 1 then
        Talk(1, "", PB_results[1]);
        return 0;
    elseif DelItem(2, 1, 30277, 5) == 1 and DelItem(2, 1, 30051, 1) == 1 then 
        gf_AddItemEx2({2, 1, 30278, 1}, "M�m Ng� Qu�",
                        VET_201101_01_STR_LOG_TITLE, 
                        VET_201101_01_TB_LOG_ACTION_LIST[4],
                        0,
                        1)
    end
    SelectSay()
end

function PB_composite()
	AskClientForNumber("PB_confirm_composite", 1, 999, "S� M�m Ng� Qu�?")
end

function PB_confirm_composite(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    if GetItemCount(2, 1, 30277) < (5 * nCount ) or GetItemCount(2, 1, 30230) < (2 * nCount) then
        Talk(1, "", PB_results[1]);
        return 0;
    elseif DelItem(2, 1, 30277, 5 * nCount)  == 1 and DelItem(2, 1, 30230, 2 * nCount) == 1 then 
        gf_AddItemEx2({2, 1, 30278, nCount}, "M�m Ng� Qu�",
                        VET_201101_01_STR_LOG_TITLE, 
                        VET_201101_01_TB_LOG_ACTION_LIST[1],
                        0,
                        1)
    end
    SelectSay()
end

function PB_showThresholdRewardList(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(PB_activityID) == 1 then
        szSayHead = PB_title;--���Ҵ��¼�say�ı���
    
        tinsert(tbSayDialog, PB_menu[1]);
        tinsert(tbSayDialog, PB_menu[2]);
        tinsert(tbSayDialog, PB_menu[3]);
        tinsert(tbSayDialog, PB_menu[4]);
        --�Ի���
    end
    return tbSayDialog, szSayHead;
end

function PB_confirm_getThresholdReward(nType)
	local title;
	local menu = {PB_results[2]};
	local usedCount = PB_getUsedCount();
	local nDate = tonumber(date("%y%m%d"))
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nMaxUsed201101 = PB_useThreshold
	if nDate >= 110131 and nDate < 110205 then
		nMaxUsed201101 = 4000
	elseif nDate >= 110205 then
		nMaxUsed201101 = 6000
	end
	if usedCount >= 2000 then
		if 0 == GetTask(PB_ifGotRewardTaskID) then
			if 1 == gf_Judge_Room_Weight(1, 100, "") then
				if nType == 1 then
					gf_EventGiveRandAward(PB_maxCountNonItemReward1, 100, 1, VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[6]..nType);
				elseif nType == 2 then
					 if nCurPetLevel < 1 then
						Talk(1,"","��i hi�p ch�a c� B�n ��ng H�nh, kh�ng th� nh�n ph�n th��ng n�y!")			
						return
					 end
					 SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
					 Msg2Player("B�n nh�n ���c 20 �i�m N�ng C�p B�n ��ng H�nh")
					 gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[6]..nType)
				elseif nType == 3 then
					 if nCurPetLevel < 2 then
						Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� nh�n ph�n th��ng n�y!")
						return
					 end
					 Pet_AddGP(1)
					 Msg2Player("B�n nh�n ���c 1 �i�m Linh L�c B�n ��ng H�nh")
					 gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[6]..nType)
				end
				gf_EventGiveRandAward(PB_maxCountItemReward, 1000, 1, VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[5]);
				SetTask(PB_ifGotRewardTaskID, GetTask(PB_ifGotRewardTaskID) + 1);
			end
		else
			title = "C�c h� �� nh�n th��ng";
		end
	else
		title = "S� l��ng M�m Ng� Qu� c�c h� �� s� d�ng l� "..usedCount.."/"..nMaxUsed201101;
	end
	Say(title, getn(menu), menu);
end

function PB_onUse(itemIndex)
	local usedCount = PB_getUsedCount();
	local mode = PB_getMode();
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 20110220 then
		Talk(1, "", "�� h�t h�n s� d�ng v�t ph�m n�y!")
		return
	end
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		return 0
	end

	local nMaxUsed201101 = PB_useThreshold
	if nDate >= 110131 and nDate < 110205 then
		nMaxUsed201101 = 4000
	elseif nDate >= 110205 then
		nMaxUsed201101 = 6000
	end
	if usedCount >= nMaxUsed201101 then
		PB_maxCount();
	elseif (mode == 0) then
		PB_chooseMode();
	elseif (mode ~= 1 or 1 == gf_Judge_Room_Weight(1, 100, "")) and (1 == DelItemByIndex(itemIndex, 1)) then
		gf_EventGiveCustomAward(1, PB_expReward[mode], 1, VET_201101_01_STR_LOG_TITLE, "Nh�n th��ng kinh nghi�m");
		if 1 == mode then
			if 0 == mod(usedCount+1, PB_specialTimes) then
				gf_EventGiveRandAward(PB_extraItemReward, 10000, 1, VET_201101_01_STR_LOG_TITLE, "Nh�n th��ng m�c 20");	
			else
				gf_EventGiveRandAward(PB_itemReward, 1000, 1, VET_201101_01_STR_LOG_TITLE, "Nh�n th��ng v�t ph�m");
			end
			gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, "ch�n nh�n th��ng v�t ph�m", PB_getUsedCountMode1());					
		else
			gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, "ch�n nh�n th��ng �i�m kinh nghi�m", PB_getUsedCountMode2());
		end
		PB_addUsedCount();
	end
end

function PB_give_dahongbao()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	
	if GetLevel() < 77 then
		Talk(1, "", "��ng c�p 77 tr� l�n m�i c� th� s� d�ng T�n M�o ��i H�ng Bao!")
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph�i c� k� n�ng c�p 55 m�i c� th� tham gia ho�t ��ng n�y!")
		return
	end
	
	if nDate > 110220 then
		Talk(1,"","�� h�t th�i h�n s� ki�n!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	if nCount >= 1 then
		Talk(1,"","M�i ng�y ch� c� th� nh�n T�n M�o ��i H�ng Bao 1 l�n m� th�i!")
		return
	end
	
	gf_AddItemEx2({2, 1, 30279, 40, 4}, "T�n M�o ��i H�ng Bao", VET_201101_01_STR_LOG_TITLE, "nh�n 40 T�n M�o ��i H�ng Bao")

	Msg2Player("Nh�n ���c 40 T�n M�o ��i H�ng Bao!")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end

function PB_give_5fruit()
	local nUsedDate = floor(GetTask(TSK_GIVE_EVENT_ITEM) / 100)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate < 110121 or nDate > 110220 then
		Talk(1,"","�� h�t th�i h�n s� ki�n!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask(TSK_GIVE_EVENT_ITEM, nDate * 100)
	end
	
	local nCount = mod(GetTask(TSK_GIVE_EVENT_ITEM), 100)
	if nCount >= 4 then
		Talk(1,"","M�i ng�y ch� c� th� t�ng M�m Ng� Qu� t�i �a 4 l�n m� th�i!")
		return
	end
	if GetItemCount(2, 1, 30278) < 10 then
		Talk(1,"","��i hi�p kh�ng mang �� 10 M�m Ng� Qu� r�i!")
		return
	end
	if DelItem(2, 1, 30278, 10) == 1 then
		ModifyExp(2500000)
		Msg2Player("Nh�n ���c 2500000 �i�m kinh nghi�m")
		gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, "n�p M�m Ng� Qu� nh�n 2500000 exp")
		SetTask(TSK_GIVE_EVENT_ITEM, GetTask(TSK_GIVE_EVENT_ITEM) + 1)
	end
end

function PB_chooseMode()
	Say(PB_title_3, getn(PB_menu_3), PB_menu_3);	
end

function PB_getThresholdReward()
	Say(PB_title_2, getn(PB_menu_2), PB_menu_2);	
end

function PB_activateItemMode()
	local title = PB_results[4];
	local menu = {PB_results[2]};
	PB_setMode(1);
	Say(title, getn(menu), menu);	
end

function PB_activateNonItemMode()
	local title = PB_results[5];
	local menu = {PB_results[2]};
	PB_setMode(2);
	Say(title, getn(menu), menu);	
end

function PB_exchange()
	if 0 == gf_ExchangeItemEx(PB_exchangeTable2, "M�m Ng� Qu�", "��i b�nh") then
		PB_notEnoughMaterial();
	end
end

function PB_dialog(menu, title)
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		title = PB_title
		for i=1, getn(PB_options) do
			tinsert(menu, PB_options[i]);
		end
	end
	return menu, title;
end

function PB_smallWisdomTreeReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GivePlantSmallTreeAward({2, 1, 30277, 50}, "Nguy�n li�u event T�t", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_bigWisdomTreeReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GivePlantBigTreeAward({2, 1, 30277, 60}, "Nguy�n li�u event T�t", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_seedBagReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GiveSeedBagAward({2, 1, 30277, 150}, "Nguy�n li�u event T�t", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_soloMessengerQuestReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GiveDailyTaskPersonalAward({2, 1, 30277, 30}, "Nguy�n li�u event T�t", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_partyMessengerQuestReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GiveDailyTaskTeamAward({2, 1, 30277, 30}, "Nguy�n li�u event T�t", VET_201101_01_STR_LOG_TITLE);
	end
end