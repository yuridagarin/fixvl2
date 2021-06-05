--��ͼ��
QHT_MAP_TABLE = {6021, 6022, 6023};
QHT_MISSION_ID = {59, 60, 61};
QHT_TIMER_ID = {89, 90, 91};

--NPCˢ�¼��30min
QHT_NPC_REFLASH = 30 * 60;

--��������������ֵ
QHT_EXP_MAX = 1200000000;
QHT_ZHENQI_MAX = 10000;
QHT_XIUWEI_MAX = 10000;
QHT_SHENGWANG_MAX = 6000;
QHT_SHIMENGXD_MAX = 6000;

--���ƻ���ÿ����������
QHT_JWHF_MAX = 100;

--��ȥ������λ��
QHT_OUT_POS = {
		[300] = {1727,3522},
		[350] = {1436,2947},
		[100] = {1433,2953},
		[200] = {1374,2845},
};

QHT_NPC_SCRIPT_LANGUAI = "\\script\\online\\qianhe_tower\\npc\\languai.lua";
QHT_NPC_SCRIPT_XIAOGUAI = "\\script\\online\\qianhe_tower\\npc\\xiaoguai.lua";
QHT_NPC_SCRIPT_ZHONGGUAI = "\\script\\online\\qianhe_tower\\npc\\zhongguai.lua";
QHT_NPC_SCRIPT_DAGUAI = "\\script\\online\\qianhe_tower\\npc\\daguai.lua";
QHT_NPC_SCRIPT_GOLDBOSS = "\\script\\online\\qianhe_tower\\npc\\goldboss.lua";

QHT_NPC_SCRIPT_DIJIBOX = "\\script\\online\\qianhe_tower\\npc\\diji_box.lua";
QHT_NPC_SCRIPT_ZHONGJIBOX = "\\script\\online\\qianhe_tower\\npc\\zhongji_box.lua";
QHT_NPC_SCRIPT_GAOJIBOX = "\\script\\online\\qianhe_tower\\npc\\gaoji_box.lua";


--���޼�¼MapTaskTemp 6021 6022 6023 G
QHT_MAPTEMPTASK_BOSS_MAX = 1;

--����������������
QHT_BOSS_6021_MAX = 20;
QHT_BOSS_6022_MAX = 30;
QHT_BOSS_6023_MAX = 10;

--�ƽ�BOSSÿ������MapTaskTemp 6023	G
QHT_MAPTEMPTASK_GOLDBOSS_MAX = 2;

--�ƽ�boss��������
QHT_GOLDBOSS_MAX = 3;

--�����ÿ�����������¼MapTaskTemp 6023 G
QHT_MAPTEMPTASK_TIANGANG_MAX = 3;
--��������ÿ�����������¼MapTaskTemp 6023 G
QHT_MAPTEMPTASK_YJZUOJI_MAX = 4;
--���Ž���ÿ����������������¼MapTaskTemp 6023 G
QHT_MAPTEMPTASK_TIANMEN_MAX = 5;

--ÿ�ղ�������ֵ
QHT_TIANGANG_MAX = 4;
QHT_YJZUOJI_MAX = 4;
QHT_TIANMEN_MAX = 4;

--Ͷ��ص�·��
QHT_THROWDICE_CBFILE = "\\script\\online\\qianhe_tower\\qht_head.lua";

--�ͼ�������ʱ����
QHT_DIJI_BOX_TIME = 3;
--�м�������ʱ����
QHT_ZHONGJI_BOX_TIME = 6;
--�߼���������ʱ����
QHT_GAOJI_BOX_TIME = 9;

--ħ�����Ա�
QHT_BUFF_6021 = {
	tInfo = {"C�ng chi�n Thi�n T�m Th�p LV%d,%s",1},
	tState = {
		{9926, 50, "state_inc_exp_gain", 100, "Gi�t qu�i kinh nghi�m t�ng %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 50, "�i�m sinh l�c n�ng cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 50, "C�ng k�ch v� kh� n�ng cao %d%%", 5},
	},
};

QHT_BUFF_6022 = {
	tInfo = {"C�ng chi�n Thi�n T�m Th�p LV%d,%s",2},
	tState = {
		{9926, 50, "state_inc_exp_gain", 150, "Gi�t qu�i kinh nghi�m t�ng %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 75, "�i�m sinh l�c n�ng cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 75, "C�ng k�ch v� kh� n�ng cao %d%%", 5},
	},
};

QHT_BUFF_6023 = {
	tInfo = {"C�ng chi�n Thi�n T�m Th�p LV%d,%s",3},
	tState = {
		{9926, 50, "state_inc_exp_gain", 200, "Gi�t qu�i kinh nghi�m t�ng %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 100, "�i�m sinh l�c n�ng cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 100, "C�ng k�ch v� kh� n�ng cao %d%%", 5},
	},
};

--�����
QHT_RANDOM_POINT_6021 = {
	{6021, 1650, 3412},
	{6021, 1576, 3573},
	{6021, 1750, 3478},
	{6021, 1690, 3680},
	{6021, 1785, 3688},
	{6021, 1864, 3607},
	{6021, 1860, 3497},
	{6021, 1999, 3495},
	{6021, 1917, 3462},
	{6021, 1937, 3387},
	{6021, 1872, 3268},
	{6021, 1712, 3351},
}

QHT_RANDOM_POINT_6022 = {
	{6022, 1320, 3100},
	{6022, 1439, 3021},
	{6022, 1579, 2968},
	{6022, 1631, 2770},
	{6022, 1674, 2870},
	{6022, 1749, 2937},
	{6022, 1939, 3070},
	{6022, 1795, 3094},
	{6022, 1755, 3246},
	{6022, 1617, 3339},
	{6022, 1602, 3225},
	{6022, 1543, 3181},
	{6022, 1624, 3057},
	{6022, 1639, 3085},
	{6022, 1498, 3136},
	{6022, 1638, 3136},
	{6022, 1687, 3034},
	{6022, 1646, 2974},
}

QHT_RANDOM_POINT_6023 = {
	{6023, 1580, 3356},
	{6023, 1429, 3390},
	{6023, 1492, 3391},
	{6023, 1589, 3539},
	{6023, 1783, 3512},
	{6023, 1460, 3543},
}

--ˢ�µ�������
QHT_MAP_FLASH_POINT = {
	[6021] = {6,2,4},
	[6022] = {9,3,6},
	[6023] = {3,1,2},
}

QHT_MAP_NAME = {
	[200] = "Bi�n Kinh", 
	[300] = "Th�nh ��", 
	[350] = "T��ng D��ng", 
	[100] = "Tuy�n Ch�u", 
	[150] = "D��ng Ch�u",
	[500] = "Ph�ng T��ng"
}

QHT_TONG_FLAG = {
	[1] = "Bang H�i ��i K�",
	[2] = "Thi�t Huy�t Bang H�i Chi�n K�",
}




