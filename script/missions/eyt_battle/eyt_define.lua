Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

DebugOutput = nothing
EYT_MAP_ID = 6076;
EYT_MISSION_ID = 71;
EYT_TIMER_ID = 101;
EYT_JOIN_TIME_LIMIT = 4;
EYT_PLAYER_MAX = 8;
EYT_MISSION_MAX = 100;
EYT_KILL_PLAYER = 1;
EYT_OPEN_FLAG = 40;
EYT_COUNTDOWN_REVIVE = 2;
EYT_COUNTDOWN_TIME = 15;
EYT_SCROE_MAX = 150;
EYT_FLAG_REFLESH_TIME = 3 * 60;
EYT_PUNISH_TIME = 15 * 60;
EYT_AWARD_COEFFICIENT = VNG_CFG_EXTRA_EYT_ADD_RATE or 0;    --奖励加成系数

--==============双方阵营========================
EYT_CAMP_RED = 1;
EYT_CAMP_BLUE = 2;
EYT_CAMP_STRING = {
	["camp_player"] = EYT_CAMP_RED,
	["camp_enemy"] = EYT_CAMP_BLUE,
}
EYT_CAMP_NAME = {
	[EYT_CAMP_RED] = "чi ",
	[EYT_CAMP_BLUE] = "чi xanh",
}
--==============常量：战场的状态===================
EYT_STATE_PEACE = 1;				--等待人数阶段
EYT_STATE_FIGHT = 2;				--开战状态
EYT_STATE_COMPLETE = 3;		  --战争结束状态

EYT_REV_POS = {
	[EYT_CAMP_RED] = {
		{1644, 3178},
		{1640, 3175},
		{1635, 3169},
		{1632, 3163},
	},
	[EYT_CAMP_BLUE] = {
		{1587, 3253},
		{1583, 3251},
		{1579, 3244},
		{1579, 3251},
	},
}

EYT_NPC_FLAG = "Chi課 K?  O竛 Уi";

--TASK-==========================
EYT_TASK_1 = 3271; --1,2byte未使用,3byte胜场，4byte败场
EYT_TASK_2 = 3272; --1byte参与次数，2byte击杀数，3byte被杀数，4个人贡献积分
EYT_TASK_3 = 3274; --参与时间

--雪恨BUFF
EYT_XUEHEN = {--差距数 攻击提高数值 生命上限提高数值 免疫负面次数
	{21,150,300,15,format("Tuy誸 h薾 c蕄 %d", 11),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{19,150,300,14,format("Tuy誸 h薾 c蕄 %d", 10),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{17,135,270,14,format("Tuy誸 h薾 c蕄 %d", 9),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{15,120,240,13,format("Tuy誸 h薾 c蕄 %d", 8),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{13,105,210,13,format("Tuy誸 h薾 c蕄 %d", 7),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{11,90 ,180,12,format("Tuy誸 h薾 c蕄 %d", 6),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{9 ,75 ,150,12,format("Tuy誸 h薾 c蕄 %d", 5),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{7 ,60 ,120,10,format("Tuy誸 h薾 c蕄 %d", 4),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{5 ,45 ,90 , 5,format("Tuy誸 h薾 c蕄 %d", 3),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{3 ,30 ,60 , 3,format("Tuy誸 h薾 c蕄 %d", 2),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
	{1 ,15 ,30 , 1,format("Tuy誸 h薾 c蕄 %d", 1),"C玭g k輈h t╪g %d%%, gi韎 h筺 sinh l鵦 t╪g %d%%, mi詎 d辌h tr筺g th竔 ph? %d l莕"},
};

--八个佛的位置
EYT_FO_POS = {
	{"Nga Mi ti觰 s? t? 1", "Nga Mi ti觰 s? t? ", 1634, 3163, "camp_player"},
	{"Nga Mi ti觰 s? t? 2", "Nga Mi ti觰 s? t? ", 1630, 3167, "camp_player"},
	{"Nga Mi ti觰 s? t? 3", "Nga Mi ti觰 s? t? ", 1645, 3173, "camp_player"},
	{"Nga Mi ti觰 s? t? 4", "Nga Mi ti觰 s? t? ", 1642, 3180, "camp_player"},
	{"Nga Mi ti觰 s? t? 1", "Nga Mi ti觰 s? mu閕", 1572, 3247, "camp_enemy"},
	{"Nga Mi ti觰 s? t? 2", "Nga Mi ti觰 s? mu閕", 1575, 3243, "camp_enemy"},
	{"Nga Mi ti觰 s? t? 3", "Nga Mi ti觰 s? mu閕", 1588, 3256, "camp_enemy"},
	{"Nga Mi ti觰 s? t? 4", "Nga Mi ti觰 s? mu閕", 1590, 3252, "camp_enemy"},
}