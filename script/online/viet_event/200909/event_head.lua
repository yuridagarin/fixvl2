--=============================================
--create by baiyun 2009.8.24
--describe:Խ�ϰ�9�·�����ͷ�ļ�
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
VIET_0909_TASK_SHANGXIAN_AWORD = 2263;	--��ȡ���߽���������
VIET_0909_TASK_SHIMENG_DATE = 2264;			--ʦ������õ������������
VIET_0909_TASK_SHIMENG_NUM = 2265;			--ʦ������õ������������
VIET_0909_TASK_ALREADY_GET_EXP = 2266;	--ʹ���̶�����ʲ�����Ѿ���õľ���
VIET_0909_TASK_GET_BOX_DATE = 2267;			--��ȡ���������
VIET_0909_TASK_OPEN_BOX_DATE = 2268;		--�����ӵ�����
VIET_0909_TASK_OPEN_BOX_COUNT = 2269;		--�����Ѿ��򿪵����ӵ�����
VIET_0909_TASK_GET_FUZHU_DATE = 2270;		--���ܸ���������
VIET_0909_TASK_GET_FUZHU_TYPE = 2271;		--���ܸ���������
VIET_0908_TASK_GET_SHAQI_DATE = 2087;					--���ɱ��ֵ������
VIET_0908_TASK_GET_SHAQI_COUNT = 2088;				--���ɱ��ֵ������

--���߽���
tbVIET_0909_SHANGXIAN_AWORD = {
	{3000, 3999, 200000},
	{4000, 4999, 300000},
	{5000, 5999, 400000},
	{6000, 6999, 500000},
	{7000, 7999, 600000},
	{8000, 8999, 700000},
	{9000, 9999, 800000},
	{10000, 10999, 900000},
	{11000, 14999, 1000000},
	{15000, 19999, 1100000},
	{20000, 24999, 1200000},
	{25000, 0, 1300000},
};
--���߽������İ��������
tbVIET_0909_SHANGXIAN_AWARD2 = {
	[1] = 50,
	[2] = 50,
	[3] = 50,
	[4] = 100,
	[5] = 100,
	[6] = 100,
	[7] = 100,
	[8] = 150,
	[9] = 150,
	[10] = 150,
	[11] = 150,
	[12] = 150,
};

--ͨ��ʦ�������õİ����������
tVIET_SHIMEN_BAIMIANBAO = {
	[1] = 10,
	[2] = 10,
	[3] = 20,
	[4] = 30,
	[5] = 50,
	[6] = 50,
	[7] = 70,
	[8] = 70,
	[9] = 80,
};

tbViet_0908_SkillID = 
	{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	--�����׼�,�׽
		[3] = 57,	--������ɮ,ϴ�辭
		[4] = 44,	--������ɮ,��������
		[5] = 0,			--����
		[6] = 74,	--����,������
		[7] = 0,			--����
		[8] = 89,	--���ҷ��,������
		[9] = 102,	--�����׼�,���������
		[10] = 0,			--ؤ��
		[11] = 113,--ؤ�ﾻ��,����ʮ����
		[12] = 124,--ؤ������,�򹷹���
		[13] = 0,			--�䵱
		[14] = 146,--�䵱����,����̫����
		[15] = 159,--�䵱�׼�,̫����
		[16] = 0,			--����
		[17] = 732,--����ǹ��,��������ǹ
		[18] = 745,--���Ź���,��������
		[19] = 0,			--�嶾
		[20] = 775,--�嶾а��,����ħ��
		[21] = 774,--�嶾��ʦ,��Ӱħ��
};

--�ڹ���������,�����ַ��������ָ��ʣ�Ҫ�޸ĵ�����ֵ��˵��
viet_0909_tb_InBuff = {
					{"T�ng 4000 sinh l�c", 20, {{"state_life_max_point_add", 4000}}},
					{"T�ng 10% n�i l�c", 20, {{"state_neili_max_percent_add", 10}}},
					{"T�ng 15% s�t th��ng n�i c�ng", 20, {{"state_m_attack_percent_add", 15}}},
					{"T�ng 15% ph�ng th� n�i c�ng", 20, {{"state_magic_parmor_poi_add", 15}}},
					{"Kh�ng t�t c� +20", 10, {{"state_add_dexterity", 20}, {"state_add_energy", 20}, {"state_add_observe", 20}, {"state_add_strength", 20}, {"state_add_vitality", 20}}},
					{"T�ng 15 s�t th� v� ph�ng th� n�i c�ng", 10, {{"state_m_attack_percent_add", 15}, {"state_magic_parmor_per_add", 15}}}
};

--�⹦��������
viet_0909_tb_OutBuff = {
					{"T�ng 4000 sinh l�c", 20, {{"state_life_max_point_add", 4000}}},
					{"T�ng 10% n�i l�c", 20, {{"state_neili_max_percent_add", 10}}},
					{"T�ng 15%  s�t th��ng ngo�i c�ng", 20, {{"state_p_attack_percent_add", 15}}},
					{"T�ng 15% ph�ng th� ngo�i c�ng", 20, {{"state_physical_parmor_poi_add", 15}}},
					{"Kh�ng t�t c� +20", 10, {{"state_add_dexterity", 20}, {"state_add_energy", 20}, {"state_add_observe", 20}, {"state_add_strength", 20}, {"state_add_vitality", 20}}},
					{"T�ng 15% ph�ng th� v� s�t th��ng ngo�i c�ng", 10, {{"state_p_attack_percent_add", 15}, {"state_physical_parmor_per_add", 15}}}
};


--ʲ�����Ľ�������,���ʻ���1000
tbVIET_0909_SHIJINBING_EXP = {
	{100000, 590},
	{125000, 200},
	{150000, 160},
	{200000, 20},
	{250000, 10},
	{300000, 10},
	{500000, 5},
	{1000000, 5},
};

--ʲ�������̶�������Ʒ����������1000000
tbVIET_0909_SJLD_AWARD = {
	{"B�n Long b�ch", 2500, {2, 1, 1000, 1}, 15 * 24 * 3600},
	{"M�nh Thi�n th�ch", 20000, {2, 2, 7, 1}, 0},
	{"Thi�n th�ch", 20000, {2, 2, 8, 1}, 0},
	{"M�nh B�ng th�ch", 30000, {2, 1, 148, 1},  0},
	{"B�ng th�ch", 20000, {2, 1, 149, 1}, 0},
	{"T�y T�y linh ��n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"��ng Ti�n V�ng", 1000, {2, 1, 30094, 1}, 0},
	{"L� th�y", 500000, {2, 0, 351, 1}, 0},
	{"Tu Ch�n Y�u Quy�t", 26879, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"R��ng B� K�p", 500, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"R��ng Y�u Quy�t_Cao C�p", 20, {2, 1, 30112, 1}, 30 * 24 * 3600},
	{"Ph�ng Huy�t ho�n", 100, {2, 1, 1004, 1}, 15 * 24 * 3600},
	{"Long Huy�t ho�n", 100, {2, 1, 1002, 1}, 15 * 24 * 3600},
	{"K� L�n ho�n", 100, {2, 1, 1003, 1}, 15 * 24 * 3600},
	{"Chi�n Th�n ho�n", 100, {2, 1, 1005, 1}, 15 * 24 * 3600},
	{"��u h�n", 2000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"Th�n N�ng ��n", 5000, {2, 1, 343, 1}, 15 * 24 * 3600},
	{"V�n C�m H�p", 1000, {2, 1, 1100, 1}, 15 * 24 * 3600},
	{"Qu�n C�ng Ch��ng", 1000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"Th�i H� �a M�t Qu� ", 10000, {2, 1, 387, 1}, 15 * 24 * 3600},
	{"S� m�n t�nh nguy�n th�", 2500, {2, 1, 1019, 1}, 15 * 24 * 3600},
	{"S� m�n l�nh th�", 2500, {2, 1, 1016, 1}, 15 * 24 * 3600},
	{"T�ng Ki�m anh h�ng thi�p", 5000, {2, 0, 31, 1}, 15 * 24 * 3600},
	{"Th� Th�n ph�", 15000, {2, 0, 556, 1}, 15 * 24 * 3600},
	{"Tranh S�c Y�n Hoa", 40000, {2, 1, 189, 1}, 0},
	{"Lam S�c Y�n Hoa", 40000, {2, 1, 190, 1}, 0},
	{"�ng B�ng Gi�y", 253100, {2, 1, 30092, 1}, 0},
	{"Nh�n S�m V�n N�m", 1000, {2, 1, 30071, 1}, 0},
	{"B�o R��ng ��c Bi�t", 1, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"R��ng Tr�n Ph�i", 500, {2, 1, 30113, 1}, 30 * 24 * 3600},
};

--�ٱ���_�ƵĽ����б����ʻ���Ϊ1000000
tbVIET_0909_BAIBAOXIANG = {
	{"Tu ch�n y�u quy�t",10000,{2,0,554,1},15*24*3600},	
	{"C�y b�t nh�",2400,{2,0,398,1},15*24*3600},	
	{"Ti�u Ki�p T�n",2000,{2,0,141,1},15*24*3600},	
	{"Ti�u nh�n s�m qu�",4000,{2,0,552,1},15*24*3600},	
	{"B�n long b�ch",4000,{2,1,1000,1},15*24*3600},	
	{"Nguy�t Hoa",3800,{2,1,2002,1},0},	
	{"Th� th�n ph�",2700,{2,0,556,1},15*24*3600},	
	{"M�t n� s�t th� ���ng",2700,{2,1,1087,1},15*24*3600},	
	{"T�ng ki�m anh h�ng thi�p",2700,{2,0,31,1},15*24*3600},	
	{"S� m�n l�nh th�",2700,{2,1,1016,1},15*24*3600},	
	{"Gi�n �i�p trang",2700,{2,1,9995,1},15*24*3600},	
	{"Th�i h� �a m�t qu�",2000,{2,1,387,1},15*24*3600},	
	{"S� m�n t�nh nguy�n th�",2000,{2,1,1019,1},15*24*3600},	
	{"Qu�n c�ng ch��ng",2000,{2,1,9999,1},15*24*3600},	
	{"Tinh luy�n b�ng th�ch",1300,{2,1,533,1},15*24*3600},	
	{"��i nh�n s�m ",1300,{2,0,553,1},15*24*3600},	
	{"Qu�n c�ng b�i",1300,{2,1,997,1},15*24*3600},	
	{"X�ch th�",1300,{0,105,9,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"Tr�o ho�ng phi �i�n",1300,{0,105,11,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"T�y T�y ��n",1100,{2,0,136,1},15*24*3600},	
	{"C� quan nh�n",800,{2,1,1011,1},15*24*3600},	
	{"H�t l�i b�c",800,{0,105,12,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"B�o r��ng t�ng ki�m y gi�p",800,{2,1,1060,1},15*24*3600},	
	{"B� c�nh",700,{0,105,13,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"L�c l�m lang y�n",600,{2,1,1014,1},15*24*3600},	
	{"Th�y ho�ng b� chi�u",600,{2,1,1047,1},15*24*3600},	
	{"Uy�n ��ng kim ti b�c",600,{2,1,1048,1},15*24*3600},	
	{"C�u Chuy�n H�i H�n ��n (x100)",500,{1,0,32,100},0},	
	{"B�o r��ng t�ng ki�m hoa kh�",500,{2,1,1061,1},15*24*3600},	
	{"V� qu�c y",400,{0,109,121,1},30*24*3600},	
	{"H�c thi�t y",400,{0,109,122,1},30*24*3600},	
	{"T� v�n y",400,{0,109,124,1},30*24*3600},	
	{"Th�y nh�n y",400,{0,109,123,1},30*24*3600},	
	{"Chi�n b�o c�p th� gi�i",400,{2,1,505,1},15*24*3600},	
	{"Tr��ng kh�ng bao",400,{2,0,596,1},15*24*3600},	
	{"Huy hi�u chi�n c�ng ��i",400,{2,1,9998,1},15*24*3600},	
	{"Nguy�t Hoa chi tinh",400,{2,1,3219,1},15*24*3600},	
	{"Th�n h�nh b� ph�",300,{0,200,39,1},15*24*3600},	
	{"V� ng�n th�y",300,{2,1,503,1},15*24*3600},	
	{"B�o r��ng t�ng ki�m ��u qu�n",300,{2,1,1059,1},15*24*3600},	
	{"B�o r��ng t�ng ki�m v� kh�",300,{2,1,1063,1},15*24*3600},	
	{"B�o r��ng t�ng ki�m trang s�c",300,{2,1,1062,1},15*24*3600},	
	{"R��ng b� k�p",200,{2,1,30093,1},15*24*3600},	
	{"T�y T�y Linh ��n",100,{2,0,137,1},15*24*3600},	
	{"Bao m�nh thi�n th�ch",100,{2,1,1049,1},15*24*3600},	
	{"N� oa tinh th�ch",100,{2,1,504,1},15*24*3600},	
	{"H�a Th� B�ch",100,{2,1,1001,1},15*24*3600},		
	{"Th�n h�nh b�o �i�n",50,{0,200,40,1},15*24*3600},	
	{"Huy hi�u chi�n c�ng (huy ho�ng)",50,{2,1,9977,1},15*24*3600},	
	{"20 v�ng",20000,"Earn(%d)",200000},
	{"30 v�ng",10000,"Earn(%d)",300000},
	{"40 v�ng",5000,"Earn(%d)",400000},
	{"50 v�ng ",4000,"Earn(%d)",500000},
	{"100 v�ng",3400,"Earn(%d)",1000000},
	{"5h �y th�c b�ch c�u ho�n",18300,"SetTask(2501, GetTask(2501) + %d)", 5*60},
	{"5h �y th�c l�c th�n ho�n",24400,"EatLiushen(1, %d)", 5*60},
	{"5h �y th�c th�n n�ng ��n",7300,"SetTask(2502, GetTask(2502) + %d)", 5*60},
	{"10h �y th�c b�ch c�u ho�n",9100,"SetTask(2501, GetTask(2501) + %d)",10* 60},
	{"10h �y th�ch L�c th�n ho�n",12200,"EatLiushen(1, %d)", 10*60},
	{"10h �y th�c th�n n�ng ��n",3700,"SetTask(2502, GetTask(2502) + %d)", 10*60},
	{"50000 exp",10000,"ModifyExp(%d)",50000},
	{"500000 exp",10000,"ModifyExp(%d)",500000},
	{"750000 exp",10000,"ModifyExp(%d)",750000},
	{"1000000 exp",20000,"ModifyExp(%d)",1000000},
	{"5000000 exp",20000,"ModifyExp(%d)",5000000},
	{"��ng ti�n v�ng",30000,{2,1,30094,1},0},	
	{"20 danh v�ng",40000,"ModifyReputation(%d,0)",20},	
	{"30 danh v�ng",30000,"ModifyReputation(%d,0)",30},
	{"50 danh v�ng",20000,"ModifyReputation(%d,0)",50},
	{"70 danh v�ng",10000,"ModifyReputation(%d,0)",70},
	{"100 danh v�ng",4000,"ModifyReputation(%d,0)",100},
	{"20 �i�m c�ng hi�n s� m�n",40000,"SetTask(336, GetTask(336) + %d)", 20}	,
	{"30 �i�m c�ng hi�n s� m�n",30000,"SetTask(336, GetTask(336) + %d)", 30},
	{"50 �i�m c�ng hi�n s� m�n",20000,"SetTask(336, GetTask(336) + %d)", 50},
	{"70 �i�m c�ng hi�n s� m�n",10000,"SetTask(336, GetTask(336) + %d)", 70},
	{"100 �i�m c�ng hi�n s� m�n",4000,"SetTask(336, GetTask(336) + %d)", 100},
	{"100 Kho�ng th�ch qu�n d�ng",45000,{2,0,307,100},0},	
	{"150 Kho�ng th�ch qu�n d�ng",20000,{2,0,307,150},0},	
	{"200 Kho�ng th�ch qu�n d�ng",10000,{2,0,307,200},0},	
	{"100 D��c th�o qu�n d�ng",45000,{2,0,312,100},0},	
	{"150 D��c th�o qu�n d�ng",20000,{2,0,312,150},0},	
	{"200 D��c th�o qu�n d�ng",10000,{2,0,312,200},0},	
	{"100 G� qu�n d�ng",45000,{2,0,308,100},0},	
	{"150 G� qu�n d�ng",20000,{2,0,308,150},0},	
	{"200 G� qu�n d�ng",10000,{2,0,308,200},0},	
	{"100 T� t�m qu�n d�ng",45000,{2,0,311,100},0},	
	{"150 T� t�m qu�n d�ng",20000,{2,0,311,150},0},	
	{"200 T� t�m qu�n d�ng",10000,{2,0,311,200},0},	
	{"100 Thu�c da qu�n d�ng",40000,{2,0,310,100},0},	
	{"150 Thu�c da qu�n d�ng",20000,{2,0,310,150},0},	
	{"200 Thu�c da qu�n d�ng",10000,{2,0,310,200},0},	
	{"100 Linh huy�t qu�n d�ng",40000,{2,0,313,100},0},	
	{"150 Linh huy�t qu�n d�ng",20000,{2,0,313,150},0},	
	{"200 Linh huy�t qu�n d�ng",10000,{2,0,313,200},0},	
	{"100 L�a m�ch qu�n d�ng",40000,{2,0,309,100},0},	
	{"150 L�a m�ch qu�n d�ng",20000,{2,0,309,150},0},	
	{"200 L�a m�ch qu�n d�ng",10000,{2,0,309,200},0},	
};

--�߼�Ҫ������Ʒ�б�,���ʻ���Ϊ100
tbVIET_0909_GAOJIYAOJUE = {
	{"��t Ma V� quy�t", 7, {2, 6, 10, 1}},
	{"Hu� Nh�n quy�t", 7, {2, 6, 14, 1}},
	{"S� T� H�ng", 7, {2, 6, 29, 1}},
	{"M�n Thi�n V� quy�t", 7, {2, 6, 46, 1}},
	{"Thanh Ph�n quy�t", 7, {2, 6, 53, 1}},
	{"Ph�c Th�y ph�p", 7, {2, 6, 67, 1}},
	{"T�y �i�p", 7, {2, 6, 78, 1}},
	{"�� C�u quy�t", 7, {2, 6, 88, 1}},
	{"T�ch D��ng Ki�m quy�t", 7, {2, 6, 99, 1}},
	{"Thi�u D��ng quy�t", 7, {2, 6, 114, 1}},
	{"Ng� M� quy�t", 7, {2, 6, 129, 1}},
	{"L�u Tuy�t Ti�n quy�t", 7, {2, 6, 141, 1}},
	{"B� ki�p Th�i Thi T� Kh�", 7, {2, 6, 151, 1}},
	{"B� ki�p Huy�n C�", 7, {2, 6, 167, 1}},
};

--������ű��б�
tbVIET_0909_ZHENPAIXIANG = {
	{"D�ch C�n Kinh-th��ng", 2, {2, 1, 916, 1}},
	{"D�ch C�n Kinh-trung", 2, {2, 1, 917, 1}},
	{"D�ch C�n Kinh-h� ", 2, {2, 1, 918, 1}},
	{"Nh� Lai Th�n Ch��ng-th��ng", 2, {2, 1, 919, 1}},
	{"Nh� Lai Th�n Ch��ng-trung", 2, {2, 1, 920, 1}},
	{"Nh� Lai Th�n Ch��ng-h� ", 2, {2, 1, 921, 1}},
	{"T�y T�y Kinh-th��ng", 2, {2, 1, 922, 1}},
	{"T�y T�y Kinh-trung", 2, {2, 1, 923, 1}},
	{"T�y T�y Kinh-h� ", 2, {2, 1, 924, 1}},
	{"H�p Tinh Tr�n-th��ng", 2, {2, 1, 925, 1}},
	{"H�p Tinh Tr�n-trung", 2, {2, 1, 926, 1}},
	{"H�p Tinh Tr�n-h� ", 2, {2, 1, 927, 1}},
	{"V�n T��ng Th�n C�ng-th��ng", 2, {2, 1, 928, 1}},
	{"V�n T��ng Th�n C�ng-trung", 2, {2, 1, 929, 1}},
	{"V�n T��ng Th�n C�ng-h� ", 2, {2, 1, 930, 1}},
	{"Thi�n �m Tr�n H�n Kh�c-th��ng", 2, {2, 1, 931, 1}},
	{"Thi�n �m Tr�n H�n Kh�c-trung", 2, {2, 1, 932, 1}},
	{"Thi�n �m Tr�n H�n Kh�c-h� ", 2, {2, 1, 933, 1}},
	{"Gi�ng Long Th�p B�t Ch��ng-th��ng", 2, {2, 1, 934, 1}},
	{"Gi�ng Long Th�p B�t Ch��ng-trung", 2, {2, 1, 935, 1}},
	{"Gi�ng Long Th�p B�t Ch��ng-h� ", 2, {2, 1, 936, 1}},
	{"�� C�u C�n Tr�n-th��ng", 2, {2, 1, 937, 1}},
	{"�� C�u C�n Tr�n-trung", 2, {2, 1, 938, 1}},
	{"�� C�u C�n Tr�n-h� ", 2, {2, 1, 939, 1}},
	{"V� Th��ng Th�i C�c Ki�m-th��ng", 2, {2, 1, 940, 1}},
	{"V� Th��ng Th�i C�c Ki�m-trung", 2, {2, 1, 941, 1}},
	{"V� Th��ng Th�i C�c Ki�m-h� ", 2, {2, 1, 942, 1}},
	{"Th�i C�c Th�n C�ng-th��ng", 2, {2, 1, 943, 1}},
	{"Th�i C�c Th�n C�ng-trung", 2, {2, 1, 944, 1}},
	{"Th�i C�c Th�n C�ng-h� ", 2, {2, 1, 945, 1}},
	{"Li�n Ho�n To�n Long Th��ng-th��ng", 2, {2, 1, 946, 1}},
	{"Li�n Ho�n To�n Long Th��ng-trung", 2, {2, 1, 947, 1}},
	{"Li�n Ho�n To�n Long Th��ng-h� ", 2, {2, 1, 948, 1}},
	{"B� V��ng T��ng Ph�ng Ti�n-th��ng", 2, {2, 1, 949, 1}},
	{"B� V��ng T��ng Ph�ng Ti�n-trung", 2, {2, 1, 950, 1}},
	{"B� V��ng T��ng Ph�ng Ti�n-h� ", 2, {2, 1, 951, 1}},
	{"V� �nh Ma C�-th��ng", 2, {2, 1, 952, 1}},
	{"V� �nh Ma C�-trung", 2, {2, 1, 953, 1}},
	{"V� �nh Ma C�-h� ", 2, {2, 1, 954, 1}},
	{"V� Thi�n Ma C�ng-th��ng", 2, {2, 1, 955, 1}},
	{"V� Thi�n Ma C�ng-trung", 2, {2, 1, 956, 1}},
	{"V� Thi�n Ma C�ng-h� ", 2, {2, 1, 957, 1}},
	{"Kim Cang B�t Nh� Kinh", 1, {0, 107, 166, 1}},
	{"Ti�m Long T�ch Di�t Kinh", 1, {0, 107, 167, 1}},
	{"V� Tr�n B� �� Kinh", 1, {0, 107, 168, 1}},
	{"Thi�n La Li�n Ch�u L�c", 1, {0, 107, 169, 1}},
	{"Nh� � Kim ��nh M�t T�ch", 1, {0, 107, 170, 1}},
	{"B�ch H�i Tuy�t �m Ph�", 1, {0, 107, 171, 1}},
	{"H�n ��n Tr�n Nh�c M�t T�ch", 1, {0, 107, 172, 1}},
	{"Qu� Thi�n Du Long M�t T�ch", 1, {0, 107, 173, 1}},
	{"Huy�n �nh M� Tung M�t T�ch", 1, {0, 107, 174, 1}},
	{"Qu�n T� Ti�t Phong M�t T�ch", 1, {0, 107, 175, 1}},
	{"Tr�n Qu�n Phi Long Th��ng", 1, {0, 107, 176, 1}},
	{"Xuy�n V�n L�c H�ng M�t T�ch", 1, {0, 107, 177, 1}},
	{"U Minh Phong Ma L�c", 1, {0, 107, 178, 1}},
	{"Linh C� Huy�n T� L�c", 1, {0, 107, 179, 1}},
	{"B�ch Th�o m�t t�ch", 1, {0, 107, 156, 1}},
	{"Ng� H�nh M�t t�ch", 1, {0, 107, 155, 1}},
}

--���Ӱ����������ʻ���Ϊ100
tb_VIET_0909_WENZIBAO = {
	{"H�a Th� B�ch", 3, {2, 1, 1001, 1}, 15 * 24 * 3600},
	{"T�y T�y linh ��n", 3, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"R��ng B� K�p", 3, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"R��ng Y�u Quy�t_Cao C�p", 1, {2, 1, 30112, 1}, 30 * 24 * 3600},
	{"R��ng Tr�n Ph�i", 3, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{"Nguy�t Hoa Chi Tinh", 5, {2, 1, 3219, 1}, 0},
	{"Thi�n Th�ch linh th�ch", 1, {2, 1, 1068, 1}, 15 * 24 * 3600},
	{"Th�n h�nh b�o �i�n", 4, {0, 200, 40, 1}, 30 * 24 * 3600},
	{"Th� Th�n ph�", 20, {2, 0, 556, 1}, 15 * 24 * 3600},
	{"Ti�u Ki�p t�n", 57, {2, 0, 141, 1}, 15 * 24 * 3600},
};

--�����佱�������ʻ���Ϊ100000
tb_VIET_0909_YUTUXIANG = {
	{"M�nh Thi�n th�ch", 5033, {2, 2, 7, 1}, 0},
	{"Thi�n th�ch", 5000, {2, 2, 8, 1}, 0},
	{"B�ng th�ch", 1400, {2, 1, 149, 1}, 0},
	{"T�y T�y linh ��n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"R��ng B� K�p", 500, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Si�u Quang", 100, {0, 105, 19, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
	{"Nh�n S�m V�n N�m", 500, {2, 1, 30071, 1}, 0},
	{"Ti�u Ki�p t�n", 2000, {2, 0, 141, 1}, 15 * 24 * 3600},
	{"Thi�n Th�ch linh th�ch", 10, {2, 1, 1068, 1}, 15 * 24 * 3600},	
	{"R��ng Tr�n Ph�i", 60, {2, 1, 30113, 1}, 30 * 24 * 3600},
--	{"R��ng Y�u Quy�t_Cao C�p", 20, {2, 1, 30112, 1}, 30 * 24 * 3600},
--	{"B�o R��ng ��c Bi�t", 16, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"Th�n h�nh b�o �i�n", 40, {0, 200, 40, 1}, 30 * 24 * 3600},
	{"T� Quang B�i", 120, {2, 0, 762, 1}, 15 * 24 * 3600},
	{"C�m chi�n tr�ng", 15137, {1, 1, 14, 1}, 0},
	{"B�nh B�t v�ng", 14000, {1, 1, 15, 1}, 0},
	{"L�c Mai", 14000, {1, 1, 16, 1}, 0},
	{"Minh Nguy�t D�", 14000, {1, 1, 17, 1}, 0},
	{"M�c Lan Xu�n", 14000, {1, 1, 18, 1}, 0},
	{"T�y B�c V�ng", 14000, {1, 1, 19, 1}, 0},
};

VIET_0909_LOG_TITLE = "[Hoat dong trung thu 2009]";

--��ȡ���߽���
function Viet0909_Give_ShangXian_Aword()
	if tonumber(date("%y%m%d")) < 090918 or tonumber(date("%y%m%d")) >= 091026 then
		Talk(1, "", "Ho�t ��ng �� qu� h�n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� c� th� 2, 6, 7 ch� nh�t m�i c� th� nh�n ph�n th��ng l�n m�ng");
		return 0;
	end
	if nHour < 16 then
		Talk(1, "", "Th�i gian nh�n online nh�n th��ng v�o m�i ng�y t� 16 ��n 24 gi�");
		return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "Th�p h�n c�p 73 v� ch�a v�o m�n ph�i th� kh�ng th� nh�n lo�i ph�n th��ng n�y");
		return 0;
	end
	if GetTask(VIET_0909_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H�m nay ��i hi�p �� nh�n ph�n th��ng, xin h�y ��i ng�y mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0909_get_aword_level(nRep, tbVIET_0909_SHANGXIAN_AWORD);
	local nFacLevel = viet0909_get_aword_level(nFac, tbVIET_0909_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0 then
		Talk(1, "", "�i�m danh v�ng v� c�ng hi�n s� m�n kh�ng �� nh�n ph�n th��ng n�y.");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B�n nh�n ���c "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3].." �i�m kinh nghi�m");
		WriteLog(GetName() .. "Nh�n ���c "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3] .. "  �i�m kinh nghi�m")
		gf_AddItemEx({2, 1, 30106, tbVIET_0909_SHANGXIAN_AWARD2[nRepLevel]}, "B�t M�");
		WriteLogEx("Hoat dong trung thu","nh�n Danh v�ng "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][1])
	end
	if nFacLevel ~= 0 then
		ModifyExp(tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B�n nh�n ���c "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3].." �i�m kinh nghi�m");
		WriteLog(GetName() .. "Nh�n ���c "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3] .. "  �i�m kinh nghi�m")
		gf_AddItemEx({2, 1, 30106, tbVIET_0909_SHANGXIAN_AWARD2[nFacLevel]}, "B�t M�");
		WriteLogEx("Hoat dong trung thu","nh�n S� m�n "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][1])
	end
	SetTask(VIET_0909_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--�ж����ڵ�������ʦ�Ź��׶ȿ��Ի�õڼ�������
function viet0909_get_aword_level(nValue, tAword)
	for i = getn(tAword), 1, -1 do
		if tAword[i][2] == 0 then
			if nValue >= tAword[i][1] then
				return i;
			end
		else
			if nValue >= tAword[i][1] and nValue <= tAword[i][2] then
				return i;
			end
		end
	end
	return 0;
end

function Viet0909_Add_ShaQi()
	if (tonumber(date("%y%m%d")) >= 091001) then
		Talk(1, "", "Ho�t ��ng �� qu� h�n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "Ch� t�i th� 2, 6, 7 ch� nh�t m�i c� th� nh�n ���c tr� s�t kh�");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if tbViet_0908_SkillID[nRoute] == 0 or GetSkillLevel(tbViet_0908_SkillID[nRoute]) == 0 then
		Talk(1, "", "��i hi�p v�n ch�a h�c k� n�ng tr�n ph�i, v� v�y kh�ng th� t�ng tr� s�t kh� ���c.");
		return 0;
	end
	if GetMomentum() >= 10 then
		Talk(1, "", "Tr� s�t kh� hi�n t�i �� ��y, kh�ng th� t�ng th�m �i�m s�t kh� ���c.");
		return 0;
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_DATE) < tonumber(date("%y%m%d")) then
		SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, 0);
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) >= 10 then
		Talk(1, "", "H�m nay c�c h� �� nh�n tr� s�t kh� 10 l�n r�i, kh�ng th� nh�n th�m ���c n�a.");
		return 0;
	end
	SetMomentum(GetMomentum() + 5);
	SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) + 1);
	SetTask(VIET_0908_TASK_GET_SHAQI_DATE, tonumber(date("%y%m%d")));
	Msg2Player("B�n nh�n ���c 5 �i�m s�t kh�");
	WriteLogEx("Hoat dong thang 9", "Tran phai Than Khi");
end

function viet_0909_nothing()

end