DebugOutput = nothing
SLT_CHANGE_PET = 1; --开启变身
SLT_EXP_ADD_PRB = 0; --副本系数F
SLT_NPC_NAME = "B綾 u L穙 Nh﹏"
SLT_LIMIT_LEVEL = 90; --限制等级
SLT_LIMIT_PLAYER = 4; --最低要求人数
SLT_COST_NUM_1 = 20;  --消耗精力数目
SLT_COST_NUM_2 = 4;   --消耗天骄令数目
SLT_AERA_NUM = 9; --区域个数
SLT_POINT_NUM = 3; --每个点怪物数量
SLT_GENBAN_NUM = 4; --跟班数量

SLT_MISSION_TIME_MAX = 20; --20min副本最长时间
SLT_MISSION_SETP = 5;      --5s步进
SLT_MISSION_STEP_MAX = (SLT_MISSION_TIME_MAX * 60) / SLT_MISSION_SETP  --最大步进

SLT_SCRIPT = "\\script\\missions\\siling_trial\\slt_head.lua"
SLT_NPC_TEMP_DATA_1 = 1;
SLT_NPC_TEMP_DATA_2 = 2;
SLT_NEED_ROOM = 2;
SLT_OPEN_NEED = {"Thi猲 Ki猽 L謓h", 2, 97, 236, 1};

--TASKID任务变量----------------
SLT_TASKID_1 = 3265  --1,2位记录MapSeq，AeraSeq,怪物轮数,是否等待开箱
SLT_TASKID_2 = 3266  --计数器
SLT_TASKID_3 = 3267  --记录npc索引
--时间触发器--------------------
SLT_TRIGGER_ID = 1536; --5s触发一次
SLT_LOGOUT_ID = 3011; --登出触发器
--退出点坐标--------------------
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
	{"sl_dujiacong", "чc Gi竝 Tr飊g"},
	{"sl_bianfu", "D琲"},
	{"sl_huli", "H? Ly"},
};
SLT_NPC_TEMPLATE_2 = {
	{"sl_elang", "S鉯 甶猲"},
	{"sl_heiya", "Qu? n"},
	{"sl_shirene", "C? s蕌"},
	{"sl_chanchu", "C竝 M?"},
	{"sl_xixuebianfu", "D琲 h髏 m竨"},
	{"sl_tianxie", "B? c筽"},
	{"sl_yinhu", "Ng﹏ H?"},
	{"sl_changyuan", "Thng Vi猲"},
	{"sl_shuguai", "Th? Qu竔"},
	{"sl_huixiong", "G蕌 x竚"},
	{"sl_dufeng", "Ong c"},
	{"sl_jinjia", "Kim Gi竝"},
};
SLT_NPC_TEMPLATE_3 = {
	{"sl_hongbaoshizhe", "H錸g B祇 S? Gi?"},
	{"sl_xibeizhuanghan", "T﹜ B綾 Tr竛g H竛"},
	{"sl_yipingtangmishi", "Nh蕋 Ph萴 Л阯g M藅 S?"},
	{"sl_cihuozhanglao", "Xi H醓 trng l穙"},
	{"sl_wokou", "Oa Kh蕌"},
	{"sl_xiannv", "Ti猲 N?"},
	{"sl_nvxiaoxian", "N? Ti猽 ti猲"},
	{"sl_chimaohuwei", "Tr? M﹗ H? V?"},
};
SLT_BOSS_TEMPLATE = {
	{"sl_longling", "Long Linh"},
	{"sl_yingling", "g Linh"},
	{"sl_huling", "H? Linh"},
	{"sl_fengling", "Phng Linh"},
	{"sl_qitiandasheng", "T? Thi猲 Чi Th竛h "},
};
SLT_PARTNER_TEMPLATE = {
	{"sl_huoqiling", "H醓 K? L﹏"},
	{"sl_baitoudiao", "B筩h u 猽"},
	{"sl_huwang", "H? Vng"},
	{"sl_luanniao", "Loan 觰"},
	{"sl_juyuan", "Vn to"},
};

SLT_TONG_BOX = "Rng уng"
SLT_YING_BOX = "Rng B筩"
SLT_JING_BOX = "Kim Rng"

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
