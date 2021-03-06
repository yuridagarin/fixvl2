--脚本功能：海上龙舟战头文件
--功能设计：大熊、小宇宙
--功能开发：刘波、村长
--功能测试：小熊、饭姐
--开发时间：2011-8-23
--修改记录：
Include("\\script\\missions\\dragonboat2011\\string.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\npccmdhead.lua")

PLAYER_DEATH_SCRIPT = "\\script\\missions\\dragonboat2011\\npc\\death_palyer.lua"

LONGCHAU_LOG_TITLE = "Hai Chien Long Chau"

--===========基本配置表信息=====================
MAPID = 6008 --地图ＩＤ
MISSIONID = 56 --mission ID
TIMERID = 86 --时间触发器 ＩＤ
tMsLogInPos = {
	[1] = {1486,3294},
	[2] = {1627,3102},
} --进入点
tMsFightPos = {
	[1] = {1516,3275},
	[2] = {1610,3159},
}--战斗点
tMsLogOutPos = {
	[1] = {150,1694,3140},--{300,1648,3534},
	[2] = {150,1694,3140},--{300,1648,3534},
} --登出点
tMsOpenTime = {
	[1] = {1000,1100},
	[2] = {1600,1700},
	[3] = {2200,2300},
} --开放时间
tMsNpcPos = {
	[1] = {1478,3293},--军需官
	[2] = {1627,3095},
	[3] = {1499,3306},--领航员
	[4] = {1639,3117},
	[5] = {1541,3219},--杨七秀
	[6] = {1589,3219},--萧泰
}
tMsPlayerRev = {
	[1] = {1526,3329},
	[2] = {1663,3134},
} --重生点
tMsFireBoat = {
	[1] = {1523,3283},
	[2] = {1603,3151},
} --火船出现点
tMsBox = {
	[1] = {1580,3168},
	[2] = {1546,3188},
	[3] = {1511,3238},
	[4] = {1569,3186},
	[5] = {1605,3194},
	[6] = {1598,3239},
	[7] = {1552,3273},
	[8] = {1581,3249},
	[9] = {1556,3209},
	[10] = {1565,3246},
	[11] = {1525,3208},
	[12] = {1547,3239},
	[13] = {1583,3211},
	[14] = {1535,3242},
	[15] = {1537,3254},
	[16] = {1571,3233},
}--漂流箱坐标
tMsBoxCopy = tMsBox ----漂流箱坐标拷贝

tMsSongBoat = {
	[1] = {1523,3283},
	[2] = {1619,3167},
}
tMsLiaoBoat = {
	[1] = {1603,3151},
	[2] = {1509,3270},
}
--==============全局变量=========================
PLAY_NEED_LV = 77   --参与最小等级
WIN_AWARD = 2000000 --胜利获得的经验
FAIL_AWARD = 1000000 -- 失败获得的经验
MAX_AWARD_DAY = 6000000 --一天获得的经验上限
MAX_ROOM_COUNT = 40   --地图最大可加载数
PLAYER_MAX_NUM = 16 --单方最多人数
PLAYER_NEED_NUM = 8   --对阵双方需要的最少人数
OVER_GAME_POINT = 100 --分数上限
FIRE_BOAT_TIME_ONE = 10 --触发火船的分数
FIRE_BOAT_TIME_TWO = 60 --触发火船的分数
ERROR_ALLOW_POINT = 4 --允许误差值
INCREASE_POINT = 10 --自动增长分值
REGIST_FEES = 60000  --报名费用
FIREBOAT_POINT = 30 --火船到达获得的分数
--================任务变量===============
PLAYER_STATUS = 1715;	--记录玩家是观众还是参赛选手。0什么都不是，1为观众，2为参赛选手
						--引用龙舟赛变量，为2不能下马
--==========阵营========================================
ALL_ID = 0 
CampSong_ID = 1 --宋
CampLiao_ID = 2 --辽
tCampName = {"Qu﹏ T鑞g","Qu﹏ Li猽"}

CampSong_Type = "camp_player" --武林联盟阵营类型，包括npc
CampLiao_Type = "camp_enemy"  --武林叛徒阵营类型，包括npc
Neutral_Type = "camp_evil"		--中立npc阵营类型

tCampType = {
	[0] = "camp_evil",
	[1] = "camp_player",
	[2] = "camp_enemy",
}

--=====================触发器定义=================
LOG_ID = 3300 					--登陆触发器表ID
LOG_TRIGGER_ID = 3040 			--登陆触发器自定义ID

--==============常量：战场的状态===================
MS_STATE_PEACE = 0				--等待人数阶段
MS_STATE_READY = 1   			--准备状态，人数齐等待开战阶段
MS_STATE_FIGHT = 2				--开战状态
MS_STATE_COMPLETE = 3		    --战争结束状态

--==============公用missionV变量===================
MV_LZZ_LOAD = 1    --是否已经加载开启
MV_LZZ_STATE = 2   --记录战场的状态
MV_LZZ_MAP_ID = 3         --本场的MAPID
MV_LZZ_MAP_INDEX = 4     --本场的MAP索引
MV_LZZ_CAMPONE_POINT = 7  --记录当前阵营一的战阵时间（积分）
MV_LZZ_CAMPTWO_POINT = 8  --记录当前阵营二的战阵时间（积分）
MV_LZZ_WINNER_CAMP = 10    --记录谁赢了
MV_TIMER_LOOP = 12 				--记录TIMER的报时次数
MV_LZZ_LOG_TIME = 13      --记录开启的时间 格式：%m%d%H%M%S
MV_LZZ_GAME_LOOP = 14     --记录GetGameLoop()
MV_LZZ_ERROR_NUM = 15     --记录重新创建触发器的次数，达到一定次数将去除场地
MV_LZZ_SONGBOAT_IDX = 16 --宋火船索引
MV_LZZ_LIAOBOAT_IDX = 17 --宋火船索引
MV_LZZ_SONGFIREBOAT_TAG1 =18 --宋火船第一次刷出
MV_LZZ_SONGFIREBOAT_TAG2 =19 --宋火船第二次刷出
MV_LZZ_LIAOFIREBOAT_TAG1 =20 --辽火船第一次刷出
MV_LZZ_LIAOFIREBOAT_TAG2 =21 --辽火船第二次刷出

--====================Timer相关的变量=========================
PEACE_TIME_ATOM = 5 --5min
READY_TIME_ATOM = 1 --1min
FIGHT_TIME_ATOM = 40 --40min
WAITOUT_TIME_ATOM = 0.5 --0.5min
------------------------------------------------------------
FRAME_PER_SECOND = 18  --一秒内的帧数为18帧，固定参数
FRAME_PER_MIN = 60*FRAME_PER_SECOND 

PEACE_TIME = 5*FRAME_PER_SECOND --time.lua触发间隔，等待玩家人数开启计时器的报时间隔，5秒
PEACE_TIMER_LOOP = (PEACE_TIME_ATOM*FRAME_PER_MIN/PEACE_TIME)-1 --等待玩家人数开启计时器报时次数（5分钟）
READY_TIME = 5*FRAME_PER_SECOND --time.lua触发间隔，开战准备时间计时器的报时间隔，5秒
READY_TIMER_LOOP = (READY_TIME_ATOM*FRAME_PER_MIN/READY_TIME)-1 --开战准备时间计时器报时次数（1分钟）
FIGHT_TIME = 15*FRAME_PER_SECOND --time.lua触发间隔，打仗时间计时器的报时间隔，5秒
FIGHT_TIMER_LOOP = (FIGHT_TIME_ATOM*FRAME_PER_MIN/FIGHT_TIME)-1 	--打仗时间计时器的报时次数（40分钟）
WAITOUT_TIME = 5*FRAME_PER_SECOND 	--time.lua触发间隔，等待结束时间计时器的报时间隔，5秒
WAITOUT_TIMER_LOOP = (WAITOUT_TIME_ATOM*FRAME_PER_MIN/WAITOUT_TIME)-1  --等待结束时间计时器的报时次数（半分钟）
JOIN_TIMER_ALLOW = (0.2*(FIGHT_TIMER_LOOP+1)) --容许加入时间值80%战斗时间
FIGHT_TIMER_YQX = FIGHT_TIMER_LOOP-(2*FRAME_PER_MIN/FIGHT_TIME)  --宋方杨七秀刷出来的时间的loop次数
FIGHT_TIMER_XT = FIGHT_TIMER_LOOP-(2*FRAME_PER_MIN/FIGHT_TIME) --辽方萧泰输出来的时间的loop次数


--=====================魔法属性加成================================
CONTINUE_TIME = 45*60*60 --魔法属性持续时间45min
QINGLONG_LIFE = 75000 --青龙龙舟生命值
XUANWU_LFTE = 125000  --玄武龙舟生命值
BAIHU_LFTE = 50000  --白虎龙舟生命值
ZHUQUE_LFTE = 50000 --朱雀龙舟生命值

tbQuanCong =
{
	[0] = {250,100},
	[1] = {500,200},
	[2] = {1250,500},
	[3] = {2500,1000},
}

tAwardItemNeed = 
{
	[0] = {},
	[1] = {"Qu﹏ C玭g Chng",2,1,9999,1},
	[2] = {"Qu﹏ C玭g Чi",2,1,9998,1},
	[3] = {"Qu﹏ C玭g Huy Ho祅g",2,1,9977,1},
};

tAwardAll = 
{
	{3, 49490, 30000, 1},
	{3, 14940, 180000, 1},
	{1, 3990, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1, 1}, 0 },
	{31, 10910, "vaf_GiveFactionBook45()", ""},
	{31, 5559, "vaf_GiveFactionBook70()", ""},
	{31, 110, "vaf_GiveSpecialBook70()", ""},
	{1, 5000, "B竛h 輙 Ng穒 Hng", {2, 1, 1123, 1, 4}, 0 },
	{1, 5000, "B竛h 輙 Ch﹏ G?", {2, 1, 1124, 1, 4}, 0 },
	{1, 5000, "B竛h 輙 B竧 B秓", {2, 1, 1125, 1, 4}, 0 },
	{1, 1, "Йng Phng Long Ch﹗", {0, 102, 24, 1, 1, -1, -1, -1, -1, -1, -1}, 0 },
}

-- ch璦 add t? l?
tFactionBook45 = 
{
	{1, 357, "Kim Cang Ph鬰 Ma kinh",{0,107,1, 1}, 0},	
	{1, 357, "Kim Cang Ph鬰 Ma T﹎ Ph竝",{0,107,2, 1}, 0},
	{1, 357, "Ti襪 Long M藅 t辌h",{0,107,3, 1},	0},
	{1, 357, "Ti襪 Long T﹎ Ph竝",{0,107,4, 1}, 0},
	{1, 357, "V? Tr莕 M藅 t辌h",{0,107,5, 1}, 0},	
	{1, 357, "V? Tr莕 T﹎ Ph竝",{0,107,6, 1},	 0},
	{1, 357, "Thi猲 La M藅 T辌h",{0,107,7, 1}, 0},
	{1, 357, "Thi猲 La T﹎ Ph竝",{0,107,8, 1}, 0},	
	{1, 357, "Nh? ? M藅 T辌h",{0,107,9, 1}, 0},	
	{1, 357, "Nh? ? T﹎ Ph竝",{0,107,10, 1}, 0},
	{1, 357, "B輈h H秈 Ph?",{0,107,11, 1}, 0},
	{1, 357, "B輈h H秈 T﹎ Ph竝",{0,107,12, 1}, 0},
	{1, 357, "H鏽 чn M藅 t辌h",{0,107,13, 1}, 0},
	{1, 357, "H鏽 чn T﹎ Ph竝",{0,107,14, 1}, 0},
	{1, 357, "Qu? Thi猲 M藅 t辌h",{0,107,15, 1}, 0},
	{1, 357, "Qu? Thi猲 T﹎ Ph竝",{0,107,16, 1}, 0},
	{1, 357, "Huy襫 秐h M藅 t辌h",{0,107,17, 1}, 0},
	{1, 357, "Huy襫 秐h T﹎ Ph竝",{0,107,18, 1}, 0},
	{1, 357, "Qu﹏ T? M藅 t辌h",{0,107,19, 1}, 0},
	{1, 357, "Qu﹏ T? T﹎ Ph竝",{0,107,20, 1}, 0},
	{1, 357, "Tr蕁 Qu﹏ M藅 t辌h",{0,107,21, 1}, 0},
	{1, 357, "Tr蕁 Qu﹏ T﹎ Ph竝",{0,107,22, 1}, 0},
	{1, 357, "Xuy猲 V﹏ M藅 t辌h",{0,107,23, 1}, 0},
	{1, 357, "Xuy猲 V﹏ T﹎ Ph竝",{0,107,24, 1}, 0},
	{1, 357, "U Minh Qu? L鬰",{0,107,25, 1}, 0},
	{1, 357, "U Minh T﹎ Ph竝",{0,107,26, 1}, 0},
	{1, 359, "Linh C? M藅 t辌h",{0,107,27, 1}, 0},
	{1, 359, "Linh C? T﹎ Ph竝",{0,107,28, 1}, 0},
}

tFactionBook70 = {
	{1, 714, "Kim Cang B竧 Nh? Kinh",{0,107,166, 1}, 0},
	{1, 714, "Ti襪 Long T辌h Di謙 Kinh",{0,107,167, 1}, 0},
	{1, 714, "V? Tr莕 B? б Kinh",{0,107,168, 1}, 0},
	{1, 714, "Thi猲 La Li猲 Ch﹗ L鬰",{0,107,169, 1}, 0},
	{1, 714, "Nh? ? Kim жnh M藅 T辌h",{0,107,170, 1}, 0},
	{1, 714, "B輈h H秈 Tuy謙  Ph?",{0,107,171, 1}, 0},
	{1, 714, "H鏽 чn Tr蕁 Nh筩 M藅 T辌h",{0,107,172, 1}, 0},
	{1, 714, "Qu? Thi猲 Du Long M藅 T辌h",{0,107,173, 1}, 0},
	{1, 714, "Huy詎 秐h M? Tung M藅 T辌h",{0,107,174, 1}, 0},
	{1, 714, "Qu﹏ T? Ti謙 Phong M藅 T辌h",{0,107,175, 1}, 0},
	{1, 714, "Tr蕁 Qu﹏ Phi Long Thng Ph?",{0,107,176, 1}, 0},
	{1, 714, "Xuy猲 V﹏ L筩 H錸g M藅 T辌h",{0,107,177, 1}, 0},
	{1, 716, "U Minh Phong Ma L鬰",{0,107,178, 1}, 0},
	{1, 716, "Linh C? Huy詎 T? L鬰",{0,107,179, 1}, 0},
	{1, 0, "C鰑 Thi猲 Phong L玦 Quy誸",{0,107,198, 1}, 0},
	{1, 0, "H錸g Tr莕 T髖 M閚g Ph?",{0,107,202, 1}, 0},
	{1, 0, "Phong Hoa Thi猲 Di謕 Ph?",{0,107,203, 1}, 0},
};

tSpecialBook70 = {
	{1, 888, "Kim Cang B竧 Nh? Ch﹏ Quy觧",{0,107,204, 1}, 0},
	{1, 568, "Ti襪 Long T骳 Di謙 Ch﹏ Quy觧",{0,107,205, 1}, 0},
	{1, 714, "V? Tr莕 B? б Ch﹏ Quy觧",{0,107,206, 1}, 0},
	{1, 888, "Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧",{0,107,207, 1}, 0},
	{1, 568, "Nh? ? Kim жnh Ch﹏ Quy觧",{0,107,208, 1}, 0},
	{1, 568, "B輈h H秈 Tuy謙  Ch﹏ Quy觧",{0,107,209, 1}, 0},
	{1, 888, "H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧",{0,107,210, 1}, 0},
	{1, 668, "Qu? Thi猲 Du Long Ch﹏ Quy觧",{0,107,211, 1}, 0},
	{1, 668, "Huy詎 秐h M? T玭g Ch﹏ Quy觧",{0,107,212, 1}, 0},
	{1, 714, "Qu﹏ T? ыi Phong Ch﹏ Quy觧",{0,107,213, 1}, 0},
	{1, 668, "Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧",{0,107,214, 1}, 0},
	{1, 668, "Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧",{0,107,215, 1}, 0},
	{1, 888, "Huy襫 Minh Phong Ma Ch﹏ Quy觧",{0,107,216, 1}, 0},
	{1, 644, "Linh C? Huy詎 T? Ch﹏ Quy觧",{0,107,217, 1}, 0},
	{1, 0, "C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧", {0, 107, 218, 1}, 0},
	{1, 0, "H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧", {0, 107, 222, 1}, 0},
	{1, 0, "Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧", {0, 107, 223, 1}, 0},
};


function vaf_GiveFactionBook45()
	gf_EventGiveRandAward(tFactionBook45,10000,1)
end

function vaf_GiveFactionBook70()
	gf_EventGiveRandAward(tFactionBook70,10000,1)
end

function vaf_GiveSpecialBook70()
	gf_EventGiveRandAward(tSpecialBook70,10000,1)
end