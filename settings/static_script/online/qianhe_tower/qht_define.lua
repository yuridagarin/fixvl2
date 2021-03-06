--地图组
QHT_MAP_TABLE = {6021, 6022, 6023};
QHT_MISSION_ID = {59, 60, 61};
QHT_TIMER_ID = {89, 90, 91};

--NPC刷新间隔30min
QHT_NPC_REFLASH = 30 * 60;

--获得相关收益上限值
QHT_EXP_MAX = 1200000000;
QHT_ZHENQI_MAX = 10000;
QHT_XIUWEI_MAX = 10000;
QHT_SHENGWANG_MAX = 6000;
QHT_SHIMENGXD_MAX = 6000;

--金纹虎符每日上限数量
QHT_JWHF_MAX = 100;

--出去的坐标位置
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


--上限记录MapTaskTemp 6021 6022 6023 G
QHT_MAPTEMPTASK_BOSS_MAX = 1;

--新增怪物上限数量
QHT_BOSS_6021_MAX = 20;
QHT_BOSS_6022_MAX = 30;
QHT_BOSS_6023_MAX = 10;

--黄金BOSS每天上限MapTaskTemp 6023	G
QHT_MAPTEMPTASK_GOLDBOSS_MAX = 2;

--黄金boss上限数量
QHT_GOLDBOSS_MAX = 3;

--天罡令每天产出数量记录MapTaskTemp 6023 G
QHT_MAPTEMPTASK_TIANGANG_MAX = 3;
--永久坐骑每天产出数量记录MapTaskTemp 6023 G
QHT_MAPTEMPTASK_YJZUOJI_MAX = 4;
--天门金令每天数量产出数量记录MapTaskTemp 6023 G
QHT_MAPTEMPTASK_TIANMEN_MAX = 5;

--每日产出上限值
QHT_TIANGANG_MAX = 4;
QHT_YJZUOJI_MAX = 4;
QHT_TIANMEN_MAX = 4;

--投点回调路径
QHT_THROWDICE_CBFILE = "\\script\\online\\qianhe_tower\\qht_head.lua";

--低级宝箱点击时间间隔
QHT_DIJI_BOX_TIME = 3;
--中级宝箱点击时间间隔
QHT_ZHONGJI_BOX_TIME = 6;
--高级级宝箱点击时间间隔
QHT_GAOJI_BOX_TIME = 9;

--魔法属性表
QHT_BUFF_6021 = {
	tInfo = {"C玭g chi課 Thi猲 T莔 Th竝 LV%d,%s",1},
	tState = {
		{9926, 50, "state_inc_exp_gain", 100, "Gi誸 qu竔 kinh nghi謒 t╪g %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 50, "觤 sinh l鵦 n﹏g cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 50, "C玭g k輈h v? kh? n﹏g cao %d%%", 5},
	},
};

QHT_BUFF_6022 = {
	tInfo = {"C玭g chi課 Thi猲 T莔 Th竝 LV%d,%s",2},
	tState = {
		{9926, 50, "state_inc_exp_gain", 150, "Gi誸 qu竔 kinh nghi謒 t╪g %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 75, "觤 sinh l鵦 n﹏g cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 75, "C玭g k輈h v? kh? n﹏g cao %d%%", 5},
	},
};

QHT_BUFF_6023 = {
	tInfo = {"C玭g chi課 Thi猲 T莔 Th竝 LV%d,%s",3},
	tState = {
		{9926, 50, "state_inc_exp_gain", 200, "Gi誸 qu竔 kinh nghi謒 t╪g %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 100, "觤 sinh l鵦 n﹏g cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 100, "C玭g k輈h v? kh? n﹏g cao %d%%", 5},
	},
};

--随机点
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

--刷新点数上限
QHT_MAP_FLASH_POINT = {
	[6021] = {6,2,4},
	[6022] = {9,3,6},
	[6023] = {3,1,2},
}

QHT_MAP_NAME = {
	[200] = "Bi謓 Kinh", 
	[300] = "Th祅h Й", 
	[350] = "Tng Dng", 
	[100] = "Tuy襫 Ch﹗", 
	[150] = "Dng Ch﹗",
	[500] = "Ph鬾g Tng"
}

QHT_TONG_FLAG = {
	[1] = "Bang H閕 Чi K?",
	[2] = "Thi誸 Huy誸 Bang H閕 Chi課 K?",
}




