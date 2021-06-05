CC_NPC = "<color=green>��i S� ho�t ��ng<color>:"

CC_LOG_TITLE = "Ho�t ��ng th� b�i m�n ph�i m�i"

CC_PLAYER_LEVEL_MIN = 80

CC_ANSWER_TIMES = 3;

CC_BOX_MAX_LM_CARD = 4; --box��è�����������

CC_ZLP_PARK_MAX = 10;

CC_CARD2_MAX = 1000;

CC_QUESTION_LIB = {
	--{title, {options},	answer}
	{"Th�y Y�n V� Ti�n s� d�ng v� kh� g�?", 							{"a Linh Chi", "b C�m", "c B�t", "d S�o"}, 									1},
	{"Th� nu�i c�a Th�y Y�n Linh N� l� g�?", 							{"A S�c", "b C�o", "c Ch�n Tr�ng", "d Con Nh�m"}, 							3},
	{"M�n ph�i Th�y Y�n chi�u m� nh�ng �� t� n�o?", 						{"a Nam �� t�", "b N� �� t�", "c Nam n� ��u chi�u m�"}, 								2},
	{"Th�y Y�n Linh N� s� d�ng v� kh� g�?", 							{"a Ki�m", "b S�o", "c Linh Chi", "d �ao"},	 									2},
	{"M�n ph�i Th�y Y�n n�m v� tr� n�o tr�n b�n ��?", 				{"a H��ng ��ng b�c", "b H��ng t�y b�c", "c H��ng t�y nam", "d H��ng ��ng nam"},				3},
	{"Th�y Y�n V� Ti�n c� lo�i t�nh n�ng v� c�ng n�o h� tr� ��i ng� chi�n ��u?", 	{"a M�ng X�", "b Thi�n H�a Di�m D��ng", "c M� Hoa", "d Linh Mi�u V�n"}, 				2},
	{"V� c�ng tr�n ph�i c�a Th�y Y�n V� Ti�n l� g�?", 					{"a ��p V�n X�o B�", "b �i�p O�n", "c Thu Nguy�t Ph�", "d Loan Ph��ng C�u Thi�n"}, 		4},
	{"S� ph� c�a Th�y Y�n V� Ti�n l� ai?", 								{"a Chu T� V�n", "b H� Man Th�nh", "c H� H�i", "d S�i Phong Nhi"}, 				1},
	{"V� c�ng tr�n ph�i c�a Th�y Y�n Linh N� l� g�?", 					{"a L�c Hoa Quy�t", "b C�u V� Hoa Ti�n Quy�t", "c Ti�n L� H��ng", "d Ng�c Long Xuy�n Nguy�t Quy�t"}, 2},
	{"Th� nu�i c�a Th�y Y�n Linh N� �n lo�i l��ng th�c n�o d��i ��y s� kh�ng h�c ���c k� n�ng ��c th�?", {"a Tri�u Thi�n Ti�u", "b Thanh L��ng Th�o", "c Thi�n H��ng Hoa", "d M�t Qu�"}, 4},
	{"M�n ph�i C�n L�n chi�u m� nh�ng �� t� n�o?", 							{"a Nam �� t�", "b N� �� t�", "c Nam n� ��u chi�u m�"}, 								1},
	{"C�n L�n Thi�n S� L�u Ph�i s� d�ng v� kh� g�?", 					{"a �ao", "b Ki�m", "c C�n", "d S�o"}, 										2},
	{"M�n ph�i C�n L�n n�m v� tr� n�o tr�n b�n ��?", 				{"a H��ng ��ng b�c", "b H��ng t�y b�c", "c H��ng t�y nam", "d H��ng ��ng nam"}, 			2},
	{"Nh�n v�t c�n ph�i � trong tr�ng th�i n�o m�i c� th� ph�t ��ng ���c v� c�ng Thi�n L�i Ph�?", {"a Phong T�", "b Cu�ng L�i Ph�", "c B�o L�i Ph�", "d L�i T�"}, 			4},
	{"Nh�n v�t c�n ph�i � trong tr�ng th�i n�o m�i c� th� ph�t ��ng ���c v� c�ng B�ng Phong Quy�t?", {"a C��ng Phong", "b L�i T�", "c Phong T�", "d Ng� Phong Quy�t"}, 					3},
	{"S� ph� c�a C�n L�n Thi�n S� L�u Ph�i l� ai?", 						{"a M� B�t Ti�n", "b Tr�n B�t Vi", "c T�n B�t Tr�", "d Di�p T� Thu"}, 			3},
	{"V� c�ng tr�n ph�i c�a C�n L�n Thi�n S� L�u Ph�i l� g�?", 			{"a Ti�n Phong L�u T�n Quy�t", "b V� C�c Phong L�i Quy�t", "c Ng� L�i Ch�nh Ph�p Ph�", "d Oanh L�i Ph�"}, 2},
	{"Ch��ng m�n c�a m�n ph�i C�n L�n l� ai?", 								{"a Mai B�t Dung", "b Di�p T� Thu", "c Chu B�t Ho�c", "d M� B�t Ti�n"}, 			3},
	{"M�n ph�i C�n L�n l�y g� l�m s� m�nh?", 							{"a X�ng B� V� L�m", "b B�o V� Qu�c Gia", "c Gi�ng Y�u Tr� Ma", "d Ki�p Ph� T� B�n"}, 3},
	{"M�t t�ch d��i ��y cu�n n�o l� m�t t�ch c�a C�n L�n?", 				{"a H�n Thi�n M�t T�ch", "b Qu�n T� M�t T�ch", "c Kinh Phong M�t T�ch", "d T�y M�ng M�t T�ch"}, 3},
}

CC_BOSS_INFO = {
	{"shixuemoren", "Th� Huy�t Ma Nh�n"},
	{"jushihuoren", "C� Th�ch H�a Nh�n"},
	{"xuanzhuangunren", "To�n Chuy�n C�n Nh�n"},	
	{"qiannianhuoqilin", "Thi�n Ni�n H�a K� L�n"},
	{"dayuguai", "��i Ng� Qu�i"},
}

--��ͼ��Ϣ
CC_MAP_ID = {
	{201, "Nam Bi�n Kinh"},	
	{304, "Nam Th�nh ��"},
	{501, "Nam Ph�ng T��ng"},
	{108, "B�c Tuy�n Ch�u"},
	{406, "V� L�ng s�n"},
};

--��������
CC_RAND_POS = {
	[201] = {
		{1497, 2976},
		{1522, 3123},
		{1561, 3019},
	},
	[304] = {
		{1445, 2990},
		{1494, 3054},
		{1477, 3013},
	},
	[501] = {
		{1504, 2927},
		{1357, 2948},
		{1515, 3089},
	},
	[108] = {
		{1530, 3113},
		{1414, 2983},
		{1585, 3060},
	},
	[406] = {
		{1320, 3079},
		{1547, 2810},
		{1388, 2802},
	},	
};

--�Ͻ���Ƭ����
CC_CARD_AWARD = {
	[2] = {
		{28, 10000, 20, 1},
		{27, 3000, 500, 1},
		{4, 3000, 1, 1},
		{5, 3000, 200, 1},
		{1, 2000, "M�nh Tinh Ng�n", {2, 1, 30299, 3}, 0},
		{1, 5000, "Ng� H�nh Huy�n Th�ch", {2, 1, 30302, 1}, 0},
		{1, 2000, "Thi�nNgh�a TinhThi�t", {2, 1, 30300, 3}, 0},
		{1, 5000, "Ng� H�nh Huy�n Thi�t", {2, 1, 30303, 1}, 0},
		{1, 3000, "H�o Nguy�t Huy�n Kim", {2, 1, 30301, 2}, 0},
		{1, 5000, "Ng� H�nh Huy�n Kim", {2, 1, 30304, 1}, 0},
		{1, 3000, "Thi�n Ngo�i L�u TInh ", {2, 1, 30321, 2}, 0},
		{1, 4000, "Ng� h�nh b�o r��ng ", {2, 1, 30320, 1}, 0},
		{1, 4000, "T�i ti�n", {2, 1, 30367, 1}, 0},
		{1, 4008, "C� Linh Th�ch", {2, 1, 30368, 2}, 0},
		{1, 1000, "Nh�n S�m V�n N�m", {2, 1, 30071, 1}, 0},
		{1, 1000, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 30 * 24 * 3600},
		{1, 1000, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 30 * 24 * 3600},
		{1, 1000, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 30 * 24 * 3600},
		{1, 1000, "Th�n N�ng ��n", {2, 1, 343, 1}, 0},
		{1, 1000, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 0},
		{1, 4890, "Ti�u B�ch C�u ho�n", {2, 1, 30307, 1}, 0},
		{1, 4000, "Ti�u Tam Thanh Ho�n", {2, 1, 30308, 1}, 0},
		{1, 4000, "Ti�u L�c Th�n Ho�n", {2, 1, 30309, 1}, 0},
		{1, 4000, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 0},
		{31, 600, "gf_Rand2YunLing()", 1},
		{1, 1200, "T�y T�m Th�ch Kho�ng", {2, 1, 30536, 1}, 0},
		{1, 1200, "Luy�n L� Thi�t Kho�ng", {2, 1, 30537, 1}, 0},
		{1, 2500, "Thi�t Tinh c�p 1", {2, 1, 30533, 1}, 0},
		{1, 600, "Thi�t Tinh c�p 2", {2, 1, 30534, 1}, 0},
		{1, 5000, "M�nh Tu Ch�n Y�u Quy�t", {2, 1, 30315, 1}, 0},
		{1, 5000, "Th�nh V�t S� M�n", {2, 1, 30311, 1}, 0},
		{1, 5000, "V� Ti�u Y ��ng", {2, 1, 30493, 1}, 30 * 24 * 3600},
		{1, 1, "L� bao Thi�n Cang L�nh", {2, 1, 30508, 1}, 0},
		{1, 1, "L� bao Thi�n M�n Kim L�nh", {2, 1, 30509, 1}, 0},
	},	
	[3] = {
		{28, 7000, 100, 1},
		{27, 7000, 200, 1},
		{4, 7000, 2, 1},
		{5, 7000, 50, 1},
		{1, 6000, "H�c Ng�c �o�n T�c Cao", {1, 0, 6, 1}, 0},
		{1, 4000, "Sinh Sinh H�a T�n", {1, 0, 16, 1}, 0},
		{1, 4000, "V�n V�t Quy Nguy�n ��n", {1, 0, 11, 1}, 0},
		{1, 5000, "C�u chuy�n h�i h�n ��n", {1, 0, 32, 1}, 0},
		{1, 700, "V� Ti�u Y V�ng", {2, 1, 30491, 1}, 30 * 24 * 3600},
		{1, 800, "V� Ti�u Y B�c", {2, 1, 30492, 1}, 30 * 24 * 3600},
		{1, 2000, "V� Ti�u Y ��ng", {2, 1, 30493, 1}, 30 * 24 * 3600},
		{1, 5000, "Linh Th�ch Nguy�n Th�ch c�p 1", {2, 1, 30413, 1}, 0},
		{1, 4000, "Linh Th�ch Nguy�n Th�ch c�p 2", {2, 1, 30414, 1}, 0},
		{1, 2953, "Linh Th�ch Nguy�n Th�ch c�p 3", {2, 1, 30415, 1}, 0},
		{1, 4000, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
		{1, 4000, "Thi�n th�ch", {2, 2, 8, 1}, 0},
		{1, 4000, "C� Linh Th�ch", {2, 1, 30368, 1}, 0},
		{1, 3000, "Linh Th�ch Nguy�n Th�ch c�p 4", {2, 1, 30416, 1}, 0},
		{1, 2000, "Linh Th�ch Nguy�n Th�ch c�p 5", {2, 1, 30417, 1}, 0},
		{1, 900, "M�nh Thi�n Cang", {2, 1, 30390, 1}, 0},
		{1, 3000, "Ma �ao Th�ch c�p 1", {2, 1, 30428, 1}, 30 * 24 * 3600},
		{1, 4000, "M�nh Thi�n Cang", {2, 1, 30390, 1}, 0},
		{1, 3000, "Thi�t Tinh c�p 1", {2, 1, 30533, 1}, 0},
		{1, 2000, "Thi�t Tinh c�p 2", {2, 1, 30534, 1}, 0},
		{1, 800, "Thi�t Tinh c�p 3", {2, 1, 30535, 1}, 0},
		{1, 500, "Linh Th�ch Nguy�n Th�ch c�p 6", {2, 1, 30418, 1}, 0},
		{1, 500, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},
		{1, 500, "Ma ��o Th�ch c�p 2", {2, 1, 30429, 1}, 30 * 24 * 3600},
		{1, 500, "Ma �ao Th�ch c�p 3", {2, 1, 30430, 1}, 30 * 24 * 3600},
		{1, 200, "H�o Nguy�t Huy�n Kim", {2, 1, 30301, 1}, 0},
		{1, 600, "Ng� H�nh Huy�n Kim", {2, 1, 30304, 1}, 0},
		{1, 2000, "C� Linh Ng�c", {2, 1, 30369, 1}, 0},
		{1, 400, "M�nh Thi�n M�n", {2, 1, 30410, 1}, 0},
		{1, 100, "Linh Th�ch Nguy�n Th�ch c�p 7", {2, 1, 30419, 1}, 0},
		{1, 500, "C��ng h�a quy�n 12", {2, 1, 30424, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 500, "C��ng h�a quy�n 13", {2, 1, 30425, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 10, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 10, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 10, "Thi�n Cang L�nh", {2, 95, 204, 1}, 0, 0, 0, 1},
		{1, 10, "Thi�n M�n Kim L�nh", {2, 1, 30370, 1}, 0, 0, 0, 1},
		{1, 500, "M�nh B�ch Kim", {2, 1, 30346, 1}, 0, 0, 0, 1},
		{1, 4, "C��ng h�a quy�n 14", {2, 1, 30426, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 2, "C��ng h�a quy�n 15", {2, 1, 30427, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 1, "��i ��nh H�n ", {2, 1, 1113, 1}, 30 * 24 * 3600, 0, 0, 1},
	},
}

CC_BOX_AWARD = {
	{28, 50, 20, 1},
	{27, 50, 200, 1},
	{4, 50, 6, 1},
	{5, 50, 6, 1},
	{1, 50, "T�i ti�n", {2, 1, 30367, 3}, 0},
	{1, 20, "H�o Nguy�t Huy�n Kim", {2, 1, 30301, 1}, 0},
	{1, 80, "Ng� H�nh Huy�n Kim", {2, 1, 30304, 1}, 0},
	{1, 100, "H�t gi�ng", {2, 1, 30086, 1}, 30 * 24 * 3600},
	{1, 6, "Th�n N�ng ��n", {2, 1, 343, 1}, 30 * 24 * 3600},
	{1, 3, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 30 * 24 * 3600},
	{1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 30 * 24 * 3600},
	{1, 20, "Linh Th�ch Nguy�n Th�ch c�p 3", {2, 1, 30415, 1}, 0},
	{1, 15, "Linh Th�ch Nguy�n Th�ch c�p 4", {2, 1, 30416, 1}, 0},
	{1, 5, "Linh Th�ch Nguy�n Th�ch c�p 5", {2, 1, 30417, 1}, 0},
	{1, 200, "L�i T�", {2, 1, 30505, 2}, 0},
	{1, 200, "L�c Hoa Quy�t", {2, 1, 30506, 2}, 0},
	{1, 100, "Linh Mi�u V�n", {2, 1, 30507, 2}, 0},
}

CC_COPY_AWARD = {
	--��ڣ
	[1] = {
		[1] = {
			{1, 90, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 10, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 85, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 80, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 20, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[4] = {
			{1, 60, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 35, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Mi�u V�n", {2, 1, 30507, 1}, 0},
		},	
	},	
	--ͨ��
	[2] = {
		[1] = {
			{1, 85, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 85, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 80, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 20, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[4] = {
			{1, 80, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 20, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[5] = {
			{1, 70, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 30, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[6] = {
			{1, 70, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 30, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[7] = {
			{1, 45, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 50, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Mi�u V�n", {2, 1, 30507, 1}, 0},
		},
	},
	--��ɽ
	[3] = {
		[1] = {
			{1, 90, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 10, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 90, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 10, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 85, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[4] = {
			{1, 85, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[5] = {
			{1, 85, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
		},
		[6] = {
			{1, 80, "L�i T�", {2, 1, 30505, 1}, 0},
			{1, 15, "L�c Hoa Quy�t", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Mi�u V�n", {2, 1, 30507, 1}, 0},
		},
	},
}

--���������������Ž���----------------------
CC_LEVEL_LIMIT = 80; --�ȼ�����
CC_UPGRADE_DATE = 20130601; --������ʱ��(�����ɿ��ŵ�ʱ��)

CC_TGL_COST_NUM = 5; --����5�������
CC_TGL_UPGRADE_NUM = 6; --�������6�������
CC_TGL_UPGRADE_EXP = 500000; --������õ�EXP
CC_TGL_UPGRADE_POP = 12000; --����ֵ

CC_TMGL_COST_NUM = 5; --����5�������
CC_TMGL_UPGRADE_NUM = 6; --�������6�������
CC_TMGL_UPGRADE_EXP = 1000000; --������õ�EXP
CC_TMGL_UPGRADE_POP = 12000; --����ֵ

CC_ZLP_PARK_COST = 200; -- ����200����������Ƭ���

--ʦ����װ����
CC_SHIMEN_EQUIP = {
	[23] = {
		[1] = {
			{"T� Vi ��o Nh�n - Thi�n Quang B�o Ki�m", {0,2,23131}}, 
			{"T� Vi ��o Nh�n - Thi�n Thanh ��u C�n", {0,103,23131}},
			{"T� Vi ��o Nh�n - Thi�n Phong ��o B�o", {0,100,23131}},
			{"T� Vi ��o Nh�n - Thi�n V�n B� Trang", {0,101,23131}},
			{"T� Vi ��o Nh�n - Thi�n Nguy�n Ng�c B�i", {0,102,23131}}, 
			{"T� Vi ��o Nh�n - Thi�n Nguy�n B�o Gi�i", {0,102,23135}},
		},
		[2] = {
			{"T� Vi ��o Nh�n - Thi�n Quang B�o Ki�m", {0,2,23132}},
			{"T� Vi ��o Nh�n - Thi�n Thanh ��u C�n", {0,103,23132}},
			{"T� Vi ��o Nh�n - Thi�n Phong ��o B�o", {0,100,23132}}, 
			{"T� Vi ��o Nh�n - Thi�n V�n B� Trang", {0,101,23132}},  
			{"T� Vi ��o Nh�n - Thi�n Nguy�n Ng�c B�i", {0,102,23132}},  
			{"T� Vi ��o Nh�n - Thi�n Nguy�n B�o Gi�i", {0,102,23136}}, 
		},
	},
	[29] = {
		[3] = {
			{"C�u Thi�n Th�i Ph��ng - Ph��ng Ho�ng V�", {0,13,29131}},
			{"C�u Thi�n Th�i Ph��ng - Ng�n Ph��ng ��u S�c", {0,103,29131}},
			{"C�u Thi�n Th�i Ph��ng - Loan Ph��ng V� Y", {0,100,29131}},
			{"C�u Thi�n Th�i Ph��ng - Kim Ph��ng T� Qu�n", {0,101,29131}},
			{"C�u Thi�n Th�i Ph��ng - H�a V� B�i", {0,102,29131}},
			{"C�u Thi�n Th�i Ph��ng - B�ng T�m Gi�i", {0,102,29135}},
		},
		[4] = {
			{"C�u Thi�n Th�i Ph��ng - Ph��ng Ho�ng V�", {0,13,29132}}, 
			{"C�u Thi�n Th�i Ph��ng - Ng�n Ph��ng ��u S�c", {0,103,29132}},
			{"C�u Thi�n Th�i Ph��ng - Loan Ph��ng V� Y", {0,100,29132}},     
			{"C�u Thi�n Th�i Ph��ng - Kim Ph��ng T� Qu�n", {0,101,29132}}, 
			{"C�u Thi�n Th�i Ph��ng - H�a V� B�i", {0,102,29132}}, 
			{"C�u Thi�n Th�i Ph��ng - B�ng T�m Gi�i", {0,102,29136}}, 
		},
 	},
	[30] = {
		[3] = {
			{"B�ng T�m Ng�c N� - Ng�n Linh Tr��ng ��ch", {0,12,30131}},
			{"B�ng T�m Ng�c N� - Linh Long Ph�t Tr�m", {0,103,30131}},
			{"B�ng T�m Ng�c N� - Th�t X�o V� Th��ng", {0,100,30131}},
			{"B�ng T�m Ng�c N� - Th�t B�o T� Qu�n", {0,101,30131}},
			{"B�ng T�m Ng�c N� - Linh X�o Ng�c Gi�i", {0,102,30131}},
			{"B�ng T�m Ng�c N� - Thanh Linh To�n Gi�i", {0,102,30135}}, 
 		},
 		[4] = {
			{"B�ng T�m Ng�c N� - Ng�n Linh Tr��ng ��ch", {0,12,30132}}, 
			{"B�ng T�m Ng�c N� - Linh Long Ph�t Tr�m", {0,103,30132}},
			{"B�ng T�m Ng�c N� - Th�t X�o V� Th��ng", {0,100,30132}},
			{"B�ng T�m Ng�c N� - Th�t B�o T� Qu�n", {0,101,30132}}, 
			{"B�ng T�m Ng�c N� - Linh X�o Ng�c Gi�i", {0,102,30132}}, 
			{"B�ng T�m Ng�c N� - Thanh Linh To�n Gi�i", {0,102,30136}},
	  },    
	},	
}


--------------------------------------------------------------------
