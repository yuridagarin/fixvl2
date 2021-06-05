VET_201004_01_STR_LOG_TITLE = "Hoat dong thang 4 nam 2010";                             --���λ��־����
VET_201004_01_STR_NPC_NAME = "<color=green>".."B�ch Ti�n Sinh: ".."<color>";
VET_201004_01_TB_LOG_ACTION_LIST = {
    [1] = "Mua l� th�y",
    [2] = "H�p th�nh",
    [3] = "H�p qu� chi�n th�ng",
    [4] = "H�p qu� chi�n th�ng gi�i h�n cao nh�t",
    [5] = "Sao chi�n th�ng",
    [6] = "M� t�i nguy�n li�u",
    [7] = "T�ng h�p qu� chi�n th�ng",
};

VET_201004_01_TB_STRINGS = {
    --���Ҵ��¼���Ϣ
    [1] = {
        [1] = "<color=yellow>S� ki�n M�ng 30 th�ng 4 v� 1 th�ng 5<color> di�n ra trong kho�ng <color=yellow>16-04-2010 ��n 24:00 ng�y 16-05-2010<color>. Th�ng tin chi ti�t, ��ng ��o xem th�m tr�n trang ch� <color=green>http://volam2.zing.vn<color>.",
        [2] = "��i H�p qu� chi�n th�ng (C�n 1 Sao Chi�n Th�ng + 1 Ph�o chi�n th�ng + 1 Hoa Chi�n Th�ng + 1 Thi�p chi�n th�ng + 1 H�p qu�)",
        [3] = "Nh�n ph�n th��ng khi ��t kinh nghi�m t�i �a",
        [4] = "��i Ng�i sao may m�n",
        [5] = "Mua L� Th�y (10 L� Th�y = 1 v�ng)",
        [6] = "Mang kh�ng �� %d v�ng!",
        [7] = "Tr�n h�nh trang kh�ng �� %d %s, hay l� �� qu�n � r��ng ch�a �� r�i?",
        [8] = "Nh�n ���c %d �i�m kinh nghi�m",
        [9] = "S� d�ng h�p qu� chi�n th�ng ��t ��n gi�i h�n kinh nghi�m cao nh�t, kh�ng th� s� d�ng th�m h�p qu� chi�n th�ng n�a!",
        [10]= "��i hi�p �� nh�n ph�n th��ng khi ��t ��n kinh nghi�m cao nh�t r�i, ph�n th��ng n�y ch� nh�n 1 l�n th�i!",
        [11]= "Ng��i ch�i ph�i c�p 73 tr� l�n v� �� gia nh�p m�n ph�i m�i c� th� ��i sao may m�n! C� l�n n�o ch�ng trai tr�!",
        [12]= "H�m nay �� ��i �� 2 Ng�i sao may m�n r�i . Ng�y mai h�y quay l�i nh�!",
        [13]= "C�c h� s� d�ng h�p qu� chi�n th�ng �� ��t ��n kinh nghi�m cao nh�t, v� v�y kh�ng th� nh�n ���c ph�n th��ng.",
        [14]= "M�i ng�y m�i ng��i ch�i ch� ���c s� d�ng 8 ng�i sao may m�n!",
        [15]= "Ng��i ch�i ph�i c�p 50 tr� l�n v� �� tham gia m�n ph�i m�i c� th� s� d�ng ng�i sao may m�n!",
    },
    --npc��Ϣ
    [2] = {
        [1] = "B�ch ti�n sinh",
        [2] = "Nguy�t L�o",
    },
    --�������Ի��ַ���
    [3] = {
        [1] = "H�a chung v�i ni�m vui chi�n th�ng c�a d�n t�c trong ng�y vui 30/4 � 1/5. L�o phu  c�n m�t �t <color=yellow>H�p Qu� Chi�n Th�ng<color> �� ch�c m�ng, c�c h� c� s�n l�ng gi�p l�o t�m <color=yellow>10 H�p Qu� Chi�n Th�ng<color> hay kh�ng? ? ",
        [2] = "T�ng 10 H�p Qu� Chi�n Th�ng.",
        [3] = "Ta ch� ti�n ���ng gh� ngang",
        [4] = "V� ��i hi�p n�y t�m ta c� vi�c g�?",
        [5] = "H�m nay �� �� H�p qu� chi�n th�ng r�i, ng�y mai l�i ti�p t�c nh� !!",
        [6] = "��i hi�p ��i kh�ng �� s� l��ng h�p qu� chi�n th�ng. L�o phu tuy gi� nh�ng c�ng kh�ng ��n n�i hoa m�t nh� v�y ��u, ��i hi�p th� xem c� �� qu�n � r��ng ch�a �� kh�ng?",
    },
};

VET_201004_01_TB_ITEMS = {
    [1] = {"H�p qu� chi�n th�ng"  , 2, 1, 30189},
    [2] = {"Sao Chi�n Th�ng"    , 2, 1, 30185},
    [3] = {"Ph�o Chi�n Th�ng"    , 2, 1, 30186},
    [4] = {"Hoa Chi�n Th�ng"    , 2, 1, 30188},
    [5] = {"Thi�p Chi�n Th�ng"    , 2, 1, 30187},
    [6] = {"H�p qu�"      , 2, 1, 30190},
    [7] = {"Sao chi�n th�ng"    , 2, 1, 30191},
    [8] = {"T�i Nguy�n Li�u"    , 2, 1, 30184},
    [9] = {"L� th�y"      , 2, 0, 351  },
    [10]= {"C�m Nang ��i S� Ki�n", 2, 1, 30045},
};

--ʤ����н�����1
VET_201004_01_TB_VICBOX_AWARD_LIST_1 = {
	[1] = {1 , 300 , "M�nh Thi�n th�ch"    , {2, 2, 7   , 1}, 0},
	[2] = {1 , 200 , "Thi�n th�ch"        , {2, 2, 8   , 1}, 0},
	[3] = {1 , 200 , "B�ng th�ch"        , {2, 1, 149 , 1}, 0},
	[4] = {1 , 500 , "Tu Ch�n Y�u Quy�t"    , {2, 0, 554 , 1}, 15*24*3600},
	[5] = {5 , 1400, 2    , 1},
     [6] = {4 , 1400, 2    , 1},
     [7] = {1 , 50 , "Ti�u Ki�p T�n "    , {2, 0, 141 , 1}, 15*24*3600},
     [8] = {7 , 200, 60    , 1},
     [9] = {11 , 1000, 60    , 1},
     [10] = {14 , 1000, 60    , 1},
     [11] = {1 , 300 , "X�ch Thi�t Tinh"    , {2, 1, 2652   , 1}, 0},
     [12] = {1 , 1375, "L� th�y"        , {2, 0, 351 , 1}, 0},
     [13] = {1 , 200, "Nguy�t Hoa"        , {2, 1, 2002 , 1}, 0},
     [14] = {1 , 25, "Thi�n H� M�t T�ch"        , {0, 107, 64 , 1}, 0},
     [15] = {1 , 25, "T� H� M�t T�ch"        , {0, 107, 65 , 1}, 0},
     [16] = {3 , 1500, 30000    , 1},
     [17] = {1 , 25, "T� Linh Chi�n � ph�"        , {0, 107, 159 , 1}, 0},
     [18] = {1 , 25, "T� Linh T� y ph�"        , {0, 107, 161 , 1}, 0},
     [19] = {1 , 25, "T� Linh Thi�n � ph�"        , {0, 107, 160 , 1}, 0},
	[20]= {1 , 75 , "Th�n N�ng ��n"      , {2, 1, 343 , 1}, 15*24*3600},
	[21] = {1 , 50, "Chi�m y ph�"        , {0, 107, 66 , 1}, 0},
	[22]= {1 , 25 , "Th�i H� �a M�t Qu� ", {2, 1, 387 , 1}, 15*24*3600},
	[23]= {1 , 25 , "T�ng Ki�m anh h�ng thi�p"  , {2, 0, 31  , 1}, 15*24*360},
	[24]= {1 , 25 , "S� m�n t�nh nguy�n th�"  , {2, 1, 1019  , 1}, 15*24*360},
	[25]= {1 , 25 , "S� m�n l�nh th�"  , {2, 1, 1016  , 1}, 15*24*360},
	[26]= {1 , 25 , "��u H�n"  , {2, 1, 1157  , 1}, 15*24*360},
};

--ʤ����н�����2
VET_201004_01_TB_VICBOX_AWARD_LIST_2 = {
	[1] = {1, 900, "��ng Ti�n V�ng", {2, 1, 30094, 1}, 0},
	[2] = {1, 1500, "R��ng B� K�p", {2, 1, 30093, 1}, 15*24*3600},
	[3] = {1, 500, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 15*24*3600},
	[4] = {1, 1000, "B�n Long b�ch"  , {2, 1, 1000 , 1}, 15*24*3600},
	[5] = {1, 1000, "T�y T�y ��n"  , {2, 0, 136 , 1}, 15*24*3600},
	[6]= {1 , 250 , "��u H�n"  , {2, 1, 1157  , 1}, 15*24*360},
	[7] = {1, 100 , "Ph�ng Huy�t ho�n"  , {2, 1, 1004 , 1},  15*24*3600},
   	[8] = {1, 100 , "K� L�n ho�n"  , {2, 1, 1003 , 1},  15*24*3600},
    	[9]= {1, 100 , "Chi�n Th�n ho�n"  , {2, 1, 1005 , 1},  15*24*3600},
    	[10]= {1, 250  , "N�ng Tang ph�", {2, 1, 1056 , 1}, 15*24*3600},
    	[11] = {1, 3350, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 15*24*3600},
    	[12] = {1, 200, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
    	[13] = {1, 250, "R��ng Y�u Quy�t cao c�p", {2, 1, 30112, 1}, 15*24*3600},
    	[14] = {1, 500, "R��ng Tr�n ph�i", {2, 1, 30113, 1}, 15*24*3600},
};

--ʤ����н�����3
VET_201004_01_TB_VICBOX_AWARD_LIST_3 = {
	[1] = {1, 100, "B�o R��ng ��c Bi�t"      , {2, 1  , 30091, 1 }, 15*24*3600},
	[2] = {1, 200, "T�y T�y Linh ��nt"      , {2, 0  , 137, 1 }, 15*24*3600},
	[3] = {1, 100, "B�t B�o T�y T�y ��n"      , {2, 0  , 138, 1 }, 15*24*3600},
	[4] = {1, 100, "N� Oa Tinh Th�ch"      , {2, 1  , 504, 1 }, 15*24*3600},
	[5] = {1, 50  , "Thi�n Th�ch Linh Th�ch"      , {2, 1  , 1068 , 1 }, 15*24*3600},
	[6] = {1, 250, "T� Linh T� y ph�"      , {0, 107  , 164, 1 }, 0},
	[7] = {1, 200, "T� Linh Thi�n � ph�"      , {0, 107  , 163, 1 }, 0},
	[8] = {1, 200  , "T� Quang Th�n Th�ch"      , {2, 1  , 30131 , 1 }, 0},
	[9] = {1, 100  , "Phi Y�n Th�ch"      , {2, 1  , 30130 , 1 }, 0},
	[10]= {1, 10  , "��nh H�n Thi�n Th�ch Th�n Th�ch"  , {2, 1  , 1067 , 1 }, 15*24*3600},  
	[11] = {1, 50 , "Qu�n C�ng Huy Ho�ng"    , {2, 1  , 9977 , 1 }, 15*24*3600},
	[12] = {1, 500, "Ng� H�nh M�t T�ch"      , {0, 107  , 155, 1 }, 0},
	[13] = {1, 2000, "M� B�i"          , {2, 1  , 371  , 1 }, 30*24*3600},
	[14] = {1, 5920, "Nh�n S�m V�n N�m"      , {2, 1  , 30071, 1 }, 0},
	[15] = {1, 200 , "Th�i D�ch H�n Nguy�n C�ng ��", {2, 0  , 1082 , 10}, 0},
	[16] = {1, 20 , "L�ng Ba Vi B�"      , {0, 112, 78   , 1 }, 0},
};

VET_201004_01_TB_RAWMATERIAL_AWARD_LIST = {
    [1] = {1, 25, "Sao Chi�n Th�ng", {VET_201004_01_TB_ITEMS[2][2], VET_201004_01_TB_ITEMS[2][3], VET_201004_01_TB_ITEMS[2][4], 1}, 0},
    [2] = {1, 25, "Ph�o Chi�n Th�ng", {VET_201004_01_TB_ITEMS[3][2], VET_201004_01_TB_ITEMS[3][3], VET_201004_01_TB_ITEMS[3][4], 1}, 0},
    [3] = {1, 25, "Thi�p Chi�n Th�ng", {VET_201004_01_TB_ITEMS[4][2], VET_201004_01_TB_ITEMS[4][3], VET_201004_01_TB_ITEMS[4][4], 1}, 0},
    [4] = {1, 25, "Hoa Chi�n Th�ng", {VET_201004_01_TB_ITEMS[5][2], VET_201004_01_TB_ITEMS[5][3], VET_201004_01_TB_ITEMS[5][4], 1}, 0},
};

VET_201004_01_TB_LUCKYSTAR_AWARD_LIST = {
    {2 , 50, 200000, 1},
    {13, 8 , 60    , 1},
    {10, 8 , 60    , 1},
    {11, 8 , 60    , 1},
    {14, 8 , 60    , 1},
    {6 , 4 , 60    , 1},
    {7 , 4 , 60    , 1},
    {15, 4 , 60    , 1},
    {12, 4 , 60    , 1},
    {8 , 2 , 60    , 1},
};

VET_201004_01_TB_AWARD_DONATE_VICBOX = {
    {3 , 24, 300000, 1},
    {1 , 20, "Qu�n C�ng Ch��ng"        , {2, 1  , 9999, 1}, 15*24*3600},
    {8 , 15, 60    , 1},
    {15, 15, 60    , 1},
    {12, 15, 60    , 1},
    {1 , 3 , "T� Linh Chi�n � Ph�"    , {0, 107, 159 , 1}, 0},
    {1 , 3 , "T� Linh Thi�n � Ph�"    , {0, 107, 160 , 1}, 0},
    {1 , 3 , "T� Linh T� � Ph�"    , {0, 107, 161 , 1}, 0},
    {1 , 1 , "Th�n h�nh b� ph�"      , {0, 200, 39  , 1 , 1}, 15*24*3600},
    {1 , 1 , "Th�i D�ch H�n Nguy�n C�ng ��", {2, 0  , 1082, 1}, 0},
};