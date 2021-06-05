ZQ_MAP_ID = 6026; --��ͼID

ZQ_ITEM_IB = {2, 1, 30481, "Ma Th�ch"} --����IB����

--��¼����ֵ���������
ZQ_CONST_JG_TASK = 701;

--��Ӫindex
ALL_ID = 0;
SONG_ID = 1;
LIAO_ID = 2;

ZQ_tCampString = {
	[ALL_ID] = "camp_evil",
	[SONG_ID] = "camp_player",
	[LIAO_ID] = "camp_enemy",
}

ZQ_TICKET_CAST = 90000; --��Ʊ

ZQ_ITEM_FLAG = {
	[SONG_ID] = {2, 1, 30478, "T�ng Qu�n Truy�n L�nh K�"},
	[LIAO_ID] = {2, 1, 30479, "Li�u Qu�n Truy�n L�nh K�"},
}

ZQ_EXIT_POS = {300, 1802, 3364}  --�˳���

--Ƶ��
ZQ_BATTLE_CHANNEL = {
	[ALL_ID] = {"K�nh chi�n tr��ng", 39},
	[SONG_ID] = {"K�nh T�ng", 40},
	[LIAO_ID] = {"K�nh Li�u", 41},
}

--�ɼ�����
ZQ_CAIJI_ITEM = {
	{0, 200, 14, "Thi�t ph�", 5000},
	{0, 200, 11, "Cu�c chim", 5000},
	{0, 200, 16, "Cu�c thu�c", 5000},
}

--log
ZQ_szLogTitle = "zhenqi_battle";

--===============����ս��ʹ�õ��������============================================
ZQ_BATTLE_TASK1 = 3117 --��һ�ֽڼ�¼��ǰ����Ӫ,9-30��¼����31��¼���������Ч
ZQ_BATTLE_TASK2 = 3118 --1-20��¼����,21,22��ʾ��ǰ�޸�����Ĵ�����23��¼�Ƿ�μ�а���Լ,24��ʾ�Ƿ�μ�������ӡ,25,26,27��ʾ�޸����õ�ħʯ��Ŀ,28,29��¼����һ���ɼ����ߣ�30��¼�Ƿ�μ��������飬31��¼�Ƿ�μ��޸�����
ZQ_BATTLE_TASK3 = 3119 --1-3�ֽڼ�¼�ɼ��ǵ���ĵ��ߵ�Index,��4�ֽڼ�¼����������
ZQ_BATTLE_TASK4 = 3120 --��1,2�ֽڼ�¼��ǰ�ɼ���X���꣬��3,4�ֽڼ�¼X���꣬
ZQ_BATTLE_TASK5 = 3121 --��¼�ɼ�Ŀ���npc����
ZQ_BATTLE_TASK6 = 3122 --��1�ֽ�������ӡɱ����,9λ��¼�Ƿ���IBģʽ��10,15��¼����С��Ϸ�Ĵ�����16��ʾ���NPC��Ч��3��4��¼��1��Ŀ���table index
ZQ_BATTLE_TASK7 = 3124 --1,2��¼��2��Ŀ���table index��3,4��¼������Ŀ��table index
ZQ_BATTLE_TASK8 = 3125 --��һ�ֽڱ�ʾ��ǰ��ȭ�Ĵ���,��2���ֽڱ�ʾ������ӡ�Ĵ���,�����ֽڱ�ʾ��ǰҪ������tableidx��25-27��ʾ�޸����,29λ��ʾ�Ƿ���������һ����ӡ��30λ��ʾ�Ƿ������ڶ���,31������ӡ�Ƿ��ϰ�ģʽ
ZQ_BATTLE_TASK9 = 3126 --��һ���ֽڱ�ʾ������ӡʱ��������������ֽڼ�¼�޸������timer����
ZQ_BATTLE_TASK10 = 3127 --��¼����С�ؿ�ǰ��λ��
ZQ_BATTLE_TASK11 = 3128 --��һ���ֽڱ�ʾС�ؿ���ʱ��,17Ϊ��ʾ�μӹؿ��ı��

--����
ZQ_TASK_LIST = {
	[1] = {
		--{����ID������������Ƿ񿪷ţ��Ƿ��ѽ�}
		[1] = {111, ZQ_BATTLE_TASK1, 9, 10, "An Ninh"},
		[2] = {112, ZQ_BATTLE_TASK1, 11, 12, "Ti�u nh��c qu�n Li�u"},
		[3] = {113, ZQ_BATTLE_TASK1, 13, 14, "G�p ma"},
		[4] = {114, ZQ_BATTLE_TASK1, 15, 16, "Thanh tr� c�n tr�"},
		[5] = {115, ZQ_BATTLE_TASK1, 17, 18, "T�n nghi�m c�a ng��i ch�t"},
	},

	[2] = {
		[1] = {116, ZQ_BATTLE_TASK1, 19, 20, "Qu�t d�n c�n tr�"},
		[2] = {117, ZQ_BATTLE_TASK1, 21, 22, "Quy�t di�t qu�n T�ng"},
		[3] = {118, ZQ_BATTLE_TASK1, 23, 24, "Th�t th�"},
		[4] = {119, ZQ_BATTLE_TASK1, 25, 26, "Ni�m vinh d� c�a th� t�c"},
		[5] = {120, ZQ_BATTLE_TASK1, 27, 28, "S� nh�c"},	
	},

	[3] = {
		[1] = {121, ZQ_BATTLE_TASK1, 29, 30, "H�n Quy C� H��ng"},	
		[2] = {122, ZQ_BATTLE_TASK2, 1, 2, "L��ng d��c ph�i ph��ng 1"},
		[3] = {123, ZQ_BATTLE_TASK2, 3, 4, "L��ng d��c ph�i ph��ng 2"},
		[4] = {124, ZQ_BATTLE_TASK2, 5, 6, "C�u tr� th��ng binh"},
	},

	[4] = {
		[1] = {125, ZQ_BATTLE_TASK2, 7, 8, "Si�u �� vong h�n"},	
		[2] = {126, ZQ_BATTLE_TASK2, 9, 10, "Nguy�n li�u ��n d��c 1 "},
		[3] = {127, ZQ_BATTLE_TASK2, 11, 12, "Nguy�n li�u ��n d��c 2"},
		[4] = {128, ZQ_BATTLE_TASK2, 13, 14, "D�ng gi� b�t t�"},
	},

	[5] = {
		[1] = {129, ZQ_BATTLE_TASK2, 15, 16, "Th�t tinh hoa"},	
		[2] = {130, ZQ_BATTLE_TASK2, 17, 18, "T� Kim M�c"},
		[3] = {131, ZQ_BATTLE_TASK2, 19, 20, "Kho�n tinh thi�t"},
	},
}

ZQ_TASK_TOTAL = 5;

--����ʹ�õ��������
ZQ_KILL_PLAYER_SONG = 3113;
ZQ_KILL_PLAYER_LIAO = 3114;
ZQ_CURE_SONG = 3115;
ZQ_CURE_LIAO = 3116;

--�ɼ�
ZQ_TASK_QXH = 3129;
ZQ_TASK_ZJM = 3130;
ZQ_TASK_JTK = 3131;

--����ɱ��Ŀ
ZQ_KILL_PLAYER_SONG_MAX_COUNT = 10;
ZQ_KILL_PLAYER_LIAO_MAX_COUNT = 10;
--�����������
ZQ_CURE_SONG_MAX_COUNT = 3;
ZQ_CURE_LIAO_MAX_COUNT = 3;

--��������ű�
ZQ_PLAYER_DEATH_SCRIPT = "\\script\\function\\zq_battles\\zq_player_death.lua";

--�������ɱ��һ������
ZQ_TASK_KILLPLAYER_AWARD = 5;

--�ɼ���
ZQ_GATHER_LIST = {
		--{"����", "����", "�����ĵ��;�", "��õ���Ʒ", "�����;õĵ���", "�ɼ���Ч"��"�ɼ��������������¼"}
		["T� Kim M�c"] = {"Thi�t ph�", 130, 10, {2, 1, 30461, 1}, {0, 200, 14}, 1, ZQ_TASK_ZJM},
		["Kho�n tinh thi�t"] = {"Cu�c chim", 131, 10, {2, 1, 30462, 1}, {0, 200, 11}, 3, ZQ_TASK_JTK},
		["Th�t tinh hoa"] = {"Cu�c thu�c", 129, 10, {2, 1, 30463, 1}, {0, 200, 16}, 4, ZQ_TASK_QXH},	
}

--�ɼ�������ʱ��s
ZQ_GATHER_TIME = 3;

--��������������
ZQ_OPEN_PAK_COST_L1 = 0;
ZQ_OPEN_PAK_COST_L2 = 8;
ZQ_OPEN_PAK_COST_L3 = 25;

--�����󲹸��佱����
ZQ_TMZ_PAK_AWARD = {
	--�صý���
	ConstAward = {
		[ZQ_OPEN_PAK_COST_L1] = {
			{2, 33, 150000, 1},
			{28, 33, 25, 1},
			{32, 34, 30, 1},
		},
		[ZQ_OPEN_PAK_COST_L2] = {
			{1, 25, "Ma Th�ch", {2, 1, 30481, 1}, 0},
   		{2, 25, 400000, 1},
   		{28, 25, 100, 1},
   		{32, 25, 150, 1},
		},
		[ZQ_OPEN_PAK_COST_L3] = {
			{1, 25, "Ma Th�ch", {2, 1, 30481, 2}, 0},
   		{2, 25, 800000, 1},
   		{28, 25, 200, 1},
   		{32, 25, 300, 1},
		},
	},
	--�������
	RandomAward = {
		[ZQ_OPEN_PAK_COST_L1] = {
			{1, 20, "Ma Th�ch", {2, 1, 30481, 1}, 0},
			{3, 5, 10000, 1},
			{3, 10, 20000, 1},
			{3, 5, 40000, 1},
			{27, 10, 150, 1},
			{27, 5, 300, 1},
			{27, 5, 450, 1},
			{4, 5, 1, 1},
			{4, 10, 2, 1},
			{4, 5, 3, 1},
			{5, 5, 2, 1},
			{5, 10, 4, 1},
			{5, 5, 6, 1},
		},
		[ZQ_OPEN_PAK_COST_L2] = {
			{1, 10, "Ma Th�ch", {2, 1, 30481, 1}, 0},
			{3, 8, 20000, 1},
			{3, 4, 40000, 1},
			{3, 1, 80000, 1},
			{27, 20, 200, 1},
			{27, 8, 400, 1},
			{27, 2, 600, 1},
			{4, 18, 2, 1},
			{4, 8, 3, 1},
			{4, 2, 4, 1},
			{5, 10, 3, 1},
			{5, 7, 6, 1},
			{5, 2, 9, 1},
		},
		[ZQ_OPEN_PAK_COST_L3] = {
			{1, 10, "Ma Th�ch", {2, 1, 30481, 1}, 0},
			{3, 8, 40000, 1},
			{3, 4, 80000, 1},
			{3, 1, 120000, 1},
			{27, 20, 300, 1},
			{27, 8, 600, 1},
			{27, 2, 900, 1},
			{4, 18, 3, 1},
			{4, 8, 4, 1},
			{4, 2, 5, 1},
			{5, 10, 4, 1},
			{5, 7, 8, 1},
			{5, 2, 12, 1},
		},
	},		
}

--�޸���ӡNPC��
ZQ_REPAIRREAL_NPC = {
	{"B�ch T� Gi�c", "ZM_baixijiao",	1631, 3289},
	{"Kim V��ng Gi�p", "ZM_jinwangjia",	1610, 3266},
	{"Th�i S� M�nh Th�ch", "ZM_taichumingshi",	1578, 3290},
	{"H�ng Tr�n T�", "ZM_hongchensi",	1577, 3325},
	{"�m Tr�m M�c", "ZM_chenyinmu",	1628, 3284},
	{"Lam B�ch Th�ch", "ZM_lanbishi",	1606, 3271},
	{"H� Sa B�", "ZM_hushapi",	1574, 3294},
	{"K� Huy�t Th�ch", "ZM_jixueshi",	1581, 3329},
	{"��i La Tinh Kim", "ZM_dalujinjin",	1629, 3279},
	{"Tuy�t Tinh", "ZM_xuejing",	1602, 3274},
	{"K�nh V��ng �an", "ZM_jingwangdan",	1570, 3298},
	{"H�c V�n Long Kim", "ZM_heiwenlongjin",	1584, 3333},
	{"B�ng Tinh Th�ch", "ZM_binjingshi",	1633, 3282},
	{"V� C�c Thi�t", "ZM_wujitie",	1607, 3276},
	{"Y�u H�a C�t", "ZM_yaohuagu",	1574, 3301},
	{"Ti�n L�c L� Tinh", "ZM_xianlvleijing",	1585, 3323},
	{"T� Linh Th�y Tinh", "ZM_zilingshuijin",	1635, 3285},
	{"Linh C�t Ng�c", "ZM_lingguyu",	1611, 3273},
	{"V� C�n ��ng", "ZM_wugenteng",	1578, 3296},
	{"V�n Ni�n Y�u ��n", "ZM_wannianyaodan",	1582, 3321},
}

ZQ_JMZL_NPC_NAME = "<color=green>C�nh M�n Tr�n Linh:<color>"
ZQ_FIND_GOAL_TIME = 20 --Ѱ��Ŀ���ʱ��s
ZQ_SEAL_EX_TIME = 20 --ʹ��ħʯ�ӳ���ʱ��s
ZQ_SEAL_USE_MAX = 5 --ħʯʹ�õ����ֵ
ZQ_SEAL_START_TIME = (ceil((ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME*ZQ_SEAL_USE_MAX) / 10) + 1) * 10 --���鿪��ʱ��s (ZQ_SEAL_START_TIME > ZQ_FIND_GOAL_TIME)
ZQ_REPAIRREAL_TIME_MAX = 30000; --ʱ�䴥����������

--���ŷ�ӡ����
ZQ_REPAIRREAL_AWARD = {
	--{������ ����}
	[1] = {20, 100000, 1},
	[2] = {40, 200000, 1},
	[3] = {100, 500000, 1},
	--���׽���
	[4] = {10, 50000, 0},
};

ZQ_REPAIRREAL_COUNT_MAX = 3; --����޸�����


ZQ_OUTER_EXITPOS = {
	[SONG_ID] = {1582, 3792},
	[LIAO_ID] = {1905, 3288},
}

ZQ_JOIN_GAME_TIMES_MAX = 8; --һ�����μ�С��Ϸ�Ĵ���


--а���Լ����
ZQ_EVILBET_AWARD = {
	[1] = {40, 100000, 1},
	[2] = {80, 200000, 2},
	[3] = {160, 400000, 3},
	[4] = {320, 800000, 4},
	[5] = {640, 1600000, 5},
	[6] = {1280, 3200000, 6},	
	--���׽���
	[7] = {10, 50000, 0},
}

--������ӡ
ZQ_RESTART_REAL_NPC = {
	--1
	[1] = {"Kh�m", "ZM_fengyinkan", 1580, 3465},
	[2] = {"C�n", "ZM_fengyinken", 1566, 3492},
	[3] = {"Kh�n", "ZM_fengyinshen", 1545, 3501},
	--2
	[4] = {"�o�i", "ZM_fengyindui", 1532, 3450},
	[5] = {"C�n", "ZM_fengyinqian", 1551, 3434},
	[6] = {"T�n", "ZM_fengyinyi", 1571, 3441},
	--3
	[7] = {"Ch�n", "ZM_fengyinzhen", 1523, 3494},
	[8] = {"Ly", "ZM_fengyinli", 1517, 3470},	
}

ZQ_RESTART_JIGUAN_NPC = {
	{"C� quan", "ZM_jiguan1", 1572, 3490},
	{"C� quan", "ZM_jiguan2", 1580, 3491},
	{"C� quan", "ZM_jiguan1", 1584, 3477},
	{"C� quan", "ZM_jiguan2", 1593, 3475},
	{"C� quan", "ZM_jiguan1", 1590, 3464},
	{"C� quan", "ZM_jiguan2", 1582, 3448},
	{"C� quan", "ZM_jiguan1", 1577, 3434},
	{"C� quan", "ZM_jiguan2", 1566, 3427},
	{"C� quan", "ZM_jiguan1", 1559, 3439},
	{"C� quan", "ZM_jiguan2", 1561, 3453},
	{"C� quan", "ZM_jiguan1", 1573, 3456},
	{"C� quan", "ZM_jiguan2", 1574, 3471},
	{"C� quan", "ZM_jiguan1", 1566, 3467},
	{"C� quan", "ZM_jiguan2", 1601, 3458},
	{"C� quan", "ZM_jiguan3", 1543, 3431},
	{"C� quan", "ZM_jiguan1", 1542, 3455},
	{"C� quan", "ZM_jiguan4", 1528, 3443},
	{"C� quan", "ZM_jiguan2", 1524, 3454},
	{"C� quan", "ZM_jiguan1", 1530, 3462},
	{"C� quan", "ZM_jiguan2", 1536, 3467},
	{"C� quan", "ZM_jiguan1", 1533, 3477},
	{"C� quan", "ZM_jiguan2", 1524, 3468},
	{"C� quan", "ZM_jiguan1", 1515, 3460},
	{"C� quan", "ZM_jiguan3", 1508, 3473},
	{"C� quan", "ZM_jiguan2", 1515, 3486},
	{"C� quan", "ZM_jiguan3", 1525, 3481},
	{"C� quan", "ZM_jiguan4", 1542, 3479},
	{"C� quan", "ZM_jiguan3", 1532, 3490},
	{"C� quan", "ZM_jiguan4", 1514, 3501},
	{"C� quan", "ZM_jiguan3", 1521, 3511},
	{"C� quan", "ZM_jiguan4", 1532, 3519},
	{"C� quan", "ZM_jiguan1", 1541, 3506},
	{"C� quan", "ZM_jiguan2", 1541, 3494},
	{"C� quan", "ZM_jiguan1", 1548, 3520},
	{"C� quan", "ZM_jiguan2", 1556, 3505},
	{"C� quan", "ZM_jiguan1", 1553, 3493},
	{"C� quan", "ZM_jiguan2", 1551, 3485},
	{"C� quan", "ZM_jiguan1", 1559, 3479},
}

ZQ_SMZL_NPC_NAME = "<color=green>T� M�n Tr�n Linh: <color>";

ZQ_RESTARTSEAL_DIS_MAX = 50; --Ӧ�ñ��ֵ�������

ZQ_RESTARTSEAL_PROGRESS_TIME = 10 * 18;  --������ӡʱ��10s

ZQ_RESTARTSEAL_ITEM = {2, 1, 30496, "T� Linh L�nh"};

ZQ_RESTARTSEAL_COUNT_MAX = 3; --���������Ŀ

ZQ_RESTARTSEAL_AWARD = {
	[1] = {20, 100000, 1},
	[2] = {40, 200000, 1},
	[3] = {100, 500000, 1},
	--�����Ǳ��׽���
	[4] = {10, 50000, 0},
}

ZQ_MMZL_NPC_NAME = "<color=green>Di�t M�n Tr�n Linh: <color>";

ZQ_PROTECTSEAL_MAP_TASKTEMP = 1; --6026,1�ű�����¼������ӡ���Ƿ������ڽ���

ZQ_PROTECTSEAL_TIME_TOTLE = 5 * 60; --һ������ʱ������

ZQ_MMZL_NPC_TABLE = {
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1913, 3574},
	{"Qu�i v�t", "ZM_guaiwu2", 1898, 3588},
	{"Qu�i v�t", "ZM_guaiwu3", 1886, 3562},
	{"Qu�i v�t", "ZM_guaiwu4", 1901, 3544},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1913, 3574},
	{"Qu�i v�t", "ZM_guaiwu2", 1898, 3588},
	{"Qu�i v�t", "ZM_guaiwu3", 1886, 3562},
	{"Qu�i v�t", "ZM_guaiwu4", 1901, 3544},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1913, 3574},
	{"Qu�i v�t", "ZM_guaiwu2", 1898, 3588},
	{"Qu�i v�t", "ZM_guaiwu3", 1886, 3562},
	{"Qu�i v�t", "ZM_guaiwu4", 1901, 3544},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1913, 3574},
	{"Qu�i v�t", "ZM_guaiwu2", 1898, 3588},
	{"Qu�i v�t", "ZM_guaiwu3", 1886, 3562},
	{"Qu�i v�t", "ZM_guaiwu4", 1901, 3544},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
	{"Qu�i v�t", "ZM_guaiwu1", 1913, 3574},
	{"Qu�i v�t", "ZM_guaiwu2", 1898, 3588},
	{"Qu�i v�t", "ZM_guaiwu3", 1886, 3562},
	{"Qu�i v�t", "ZM_guaiwu4", 1901, 3544},
	{"Qu�i v�t", "ZM_guaiwu1", 1887, 3533},
	{"Qu�i v�t", "ZM_guaiwu2", 1902, 3519},
	{"Qu�i v�t", "ZM_guaiwu3", 1919, 3542},
	{"Qu�i v�t", "ZM_guaiwu4", 1930, 3558},
}

ZQ_PROTECTSEAL_KILL_MIN = 10; --ɱ������

ZQ_PROTECTSEAL_AWARD = {
	[1] = {ZQ_PROTECTSEAL_KILL_MIN, 20, 100000, 1},
	[2] = {20, 40, 200000, 2},
	[3] = {40, 100, 500000, 3},
	[4] = {100, 200, 1000000, 4},
		--���׽���
	[5] = {10000, 10, 50000, 0},
}

ZQ_PLAYER_DEATH_TAG = 9999; --����������

ZQ_COPY_TIME_MAX = 10 * 60; --�ؿ�����ʱ��




