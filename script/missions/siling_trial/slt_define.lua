DebugOutput = nothing
SLT_CHANGE_PET = 1; --��������
SLT_EXP_ADD_PRB = 0; --����ϵ��F
SLT_NPC_NAME = "B�c ��u L�o Nh�n"
SLT_LIMIT_LEVEL = 90; --���Ƶȼ�
SLT_LIMIT_PLAYER = 4; --���Ҫ������
SLT_COST_NUM_1 = 20;  --���ľ�����Ŀ
SLT_COST_NUM_2 = 4;   --�����콾����Ŀ
SLT_AERA_NUM = 9; --�������
SLT_POINT_NUM = 3; --ÿ�����������
SLT_GENBAN_NUM = 4; --��������

SLT_MISSION_TIME_MAX = 20; --20min�����ʱ��
SLT_MISSION_SETP = 5;      --5s����
SLT_MISSION_STEP_MAX = (SLT_MISSION_TIME_MAX * 60) / SLT_MISSION_SETP  --��󲽽�

SLT_SCRIPT = "\\script\\missions\\siling_trial\\slt_head.lua"
SLT_NPC_TEMP_DATA_1 = 1;
SLT_NPC_TEMP_DATA_2 = 2;
SLT_NEED_ROOM = 2;
SLT_OPEN_NEED = {"Thi�n Ki�u L�nh", 2, 97, 236, 1};

--TASKID�������----------------
SLT_TASKID_1 = 3265  --1,2λ��¼MapSeq��AeraSeq,��������,�Ƿ�ȴ�����
SLT_TASKID_2 = 3266  --������
SLT_TASKID_3 = 3267  --��¼npc����
--ʱ�䴥����--------------------
SLT_TRIGGER_ID = 1536; --5s����һ��
SLT_LOGOUT_ID = 3011; --�ǳ�������
--�˳�������--------------------
SLT_EXIT_POS = {100, 1434, 2949};

SLT_MAP_ID = {
	6001, 
	6002, 
	6003, 
	6004, 
	6005,
};
SLT_AERA_POS = {
	{1546, 3141},
	{1579, 3218},
	{1682, 3175},
	{1704, 3312},
	{1655, 3431},
	{1670, 3514},
	{1531, 3405},
	{1558, 3494},
	{1633, 3338},
};
SLT_NPC_POS_1 = {
	{1541, 3160},
	{1579, 3180},
	{1695, 3170},
	{1684, 3307},
	{1634, 3444},
	{1688, 3506},
	{1542, 3394},
	{1536, 3507},
	{1613, 3346},
};
SLT_NPC_POS_2 = {
	{1529, 3189},
	{1594, 3200},
	{1675, 3189},
	{1679, 3286},
	{1628, 3473},
	{1677, 3476},
	{1527, 3359},
	{1528, 3475},
	{1603, 3327},	
};
SLT_NPC_POS_3 = {
	{1539, 3222},
	{1606, 3178},
	{1678, 3216},
	{1695, 3264},
	{1653, 3478},
	{1688, 3448},
	{1544, 3343},
	{1541, 3448},
	{1620, 3331},	
};
SLT_BOSS_POS = {
	{1553, 3188},
	{1590, 3155},
	{1699, 3199},
	{1703, 3283},
	{1634, 3502},
	{1702, 3484},
	{1557, 3365},
	{1561, 3461},
	{1615, 3331},	
};

SLT_NPC_TEMPLATE_1 = {
	{"sl_dujiacong", "��c Gi�p Tr�ng"},
	{"sl_bianfu", "D�i"},
	{"sl_huli", "H� Ly"},
};
SLT_NPC_TEMPLATE_2 = {
	{"sl_elang", "S�i �i�n"},
	{"sl_heiya", "Qu� �en"},
	{"sl_shirene", "C� s�u"},
	{"sl_chanchu", "C�p M�"},
	{"sl_xixuebianfu", "D�i h�t m�u"},
	{"sl_tianxie", "B� c�p"},
	{"sl_yinhu", "Ng�n H�"},
	{"sl_changyuan", "Th��ng Vi�n"},
	{"sl_shuguai", "Th� Qu�i"},
	{"sl_huixiong", "G�u x�m"},
	{"sl_dufeng", "Ong ��c"},
	{"sl_jinjia", "Kim Gi�p"},
};
SLT_NPC_TEMPLATE_3 = {
	{"sl_hongbaoshizhe", "H�ng B�o S� Gi�"},
	{"sl_xibeizhuanghan", "T�y B�c Tr�ng H�n"},
	{"sl_yipingtangmishi", "Nh�t Ph�m ���ng M�t S�"},
	{"sl_cihuozhanglao", "Xi H�a tr��ng l�o"},
	{"sl_wokou", "Oa Kh�u"},
	{"sl_xiannv", "Ti�n N�"},
	{"sl_nvxiaoxian", "N� Ti�u ti�n"},
	{"sl_chimaohuwei", "Tr� M�u H� V�"},
};
SLT_BOSS_TEMPLATE = {
	{"sl_longling", "Long Linh"},
	{"sl_yingling", "�ng Linh"},
	{"sl_huling", "H� Linh"},
	{"sl_fengling", "Ph��ng Linh"},
	{"sl_qitiandasheng", "T� Thi�n ��i Th�nh "},
};
SLT_PARTNER_TEMPLATE = {
	{"sl_huoqiling", "H�a K� L�n"},
	{"sl_baitoudiao", "B�ch ��u �i�u"},
	{"sl_huwang", "H� V��ng"},
	{"sl_luanniao", "Loan �i�u"},
	{"sl_juyuan", "V��n to"},
};

SLT_TONG_BOX = "R��ng ��ng"
SLT_YING_BOX = "R��ng B�c"
SLT_JING_BOX = "Kim R��ng"

SLT_AWARD = {
	[1] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[2] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[3] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[4] = {
		{"jinbaoxiang", SLT_JING_BOX, 1, SLT_SCRIPT},
	},	
}

SLT_EXP = {
	[1] = 2000000,
	[2] = 2500000,
	[3] = 3000000,
	[4] = 3500000,
}

SLT_ROUTE_ADD = {
	[1] = 0,
	[2] =	0,
	[3] =	0,
	[4] =	0,
	[5] =	0.2,
	[6] =	0.4,
	[7] =	0.6,
	[8] =	1,
}
