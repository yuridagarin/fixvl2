Include("\\script\\lib\\globalfunctions.lua")
--测试
DebugOutput = nothing

--活动开启时间
IC_START_TIME = {2014,10,21,0,0,0};
IC_END_TIME = {2014,11,21,0,0,0};

--激活码盐
IC_INVITE_CODE_SALT = "zpb0nBJXd6rhvK5PZQAbSYBHChNAVnhX"

--使用的数据库表名称
IC_MYSQL_TABLE_NAME = "invite_code_1410"

--数据行为类型
IC_QUERY_TYPE_REG = 1; --注册
IC_QUERY_TYPE_QRY	= 2; --查询
IC_QUERY_TYPE_MDY = 3; --修改

--活动任务变量组
IC_TASK_GROUP = {3, 14};

--操作间隔时间s
IC_CLICK_TIME = 15;

--受邀者奖励类型
IC_FINISH_INVITE_TYPE1 = 1; --5转90级
IC_FINISH_INVITE_TYPE2 = 2; --6转90级
IC_FINISH_INVITE_TYPE3 = 3; --激活月卡
IC_FINISH_INVITE_TYPE4 = 4; --御街消费2000XU
IC_FINISH_INVITE_TYPE5 = 5; --御街消费4000XU

IC_FINISH_INVITE_TYPE6 = 6; --完成任意3个任务
IC_FINISH_INVITE_TYPE7 = 7; --完成任意4个任务
IC_FINISH_INVITE_TYPE8 = 8; --完成任意5个任务

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,20, "Huy誸Tr輈hTh筩h Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,20, "Nguy謙B筩hTh筩h Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,20, "H? Ph竎h Th筩h C蕄 4", {2,22,304,1},nil,nil,nil,nil},
        {1,20, "H綾 Di謚 Th筩h C蕄 4", {2,22,404,1},nil,nil,nil,nil},
        {1,4, "Huy誸Tr輈hTh筩h Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,4, "Nguy謙B筩hTh筩h Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,4, "H? Ph竎h Th筩h C蕄 5", {2,22,305,1},nil,nil,nil,1},
        {1,4, "H綾 Di謚 Th筩h C蕄 5", {2,22,405,1},nil,nil,nil,1},
        {1,1, "Huy誸Tr輈hTh筩h Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,1, "Nguy謙B筩hTh筩h Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,1, "H? Ph竎h Th筩h C蕄 6", {2,22,306,1},nil,nil,nil,1},
        {1,1, "H綾 Di謚 Th筩h C蕄 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

--邀请者奖励
IC_YAOQING_AWARD = {
	[1] = {"item",		1, 	"Hu﹏ chng anh h飊g", {2,1,30499,4}},
	[2] = {"item", 		6, 	"Thi誸 tinh c蕄 4", 	{2,1,30612,10,4}},
	[3] = {"item", 		12, "L玦 H? Tinh Ph竎h", {2,1,30614,2}},
	[4] = {"item", 		24, "Thi猲 Th筩h linh th筩h", {2,1,1068,1,4}, 7 * 24 * 3600},
	[5] = {"func", 		36, "Ng蓇 nhi猲  qu? c蕄 4~6", ck_GiveRandGem456},
	[6] = {"item", 		50, "Thi猲 Cang L謓h", {2,95,204,1}},
	[7] = {"item", 		60, "C玭 H? Ng鋍 Dao Ki誱", {0,105,10109,1,4,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
}

--奖励
IC_YAOYANG_JIEZI_1 = {
	{"Di謚 Dng-? L﹏ B秓 Gi韎", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-T? Giao Ng鋍 B閕", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-V﹏ H? L謓h", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-X輈h Tc Ho祅", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng-B輈h Quy Li猲", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

IC_YAOYANG_JIEZI_2 = {
	{"Di謚 Dng To竔 Ho祅g-? L﹏ B秓 Gi韎", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-T? Giao Ng鋍 B閕", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-V﹏ H? L謓h", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-X輈h Tc Ho祅", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"Di謚 Dng To竔 Ho祅g-B輈h Quy Li猲", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}
