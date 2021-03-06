--=============================================
--create by baiyun 2009.11.17
--describe:越南版12月份活动 头文件
--=============================================
Include("\\script\\lib\\globalfunctions.lua");

VIET_0912_TASK_SHIMENG_DATE = 2080;			--师门任务得到圣诞糖果的日期
VIET_0912_TASK_SHIMENG_NUM = 2089;			--师门任务得到圣诞糖果的数量
VIET_0912_TASK_XIANGCAODANGAO_COUNT = 1521;             --已经使用的香草蛋糕的数量
VIET_0912_TASK_GET_NPC_AWARD_DATE = 1522;               --从NPC那里获得奖励的日期
VIET_0912_TASK_USE_YANHUO_DATE = 1523;                  --使用烟火的日期
VIET_0912_TASK_USE_YANHUO_COUNT = 1524;                 --本天已经使用烟火的次数
VIET_0912_TASK_USE_YANHUO_TIME = 1525;                  --上次使用烟火的时间GetTime()
VIET_0912_TASK_USE_KAOROU_TIME = 1526;                  --玩家上次点击烤肉的时间GetTime()
VIET_0912_TASK_USE_KAOROU_DATE = 1527;                  --玩家当前点击烤肉的日期
VIET_0912_TASK_USE_KAOROU_COUNT = 1528;                 --玩家今天已经点击烤肉的次数
VIET_0912_TASK_USE_SHENGDANLIHE_DATE = 1529;            --玩家点击圣诞礼盒的日期
VIET_0912_TASK_USE_SHENGDANLIHE_TIME = 1530;            --玩家点击圣诞礼盒的时间GetTime()
VIET_0912_TASK_USE_SHENGDANLIHE_COUNT = 1531;           --玩家今天点击圣诞礼盒的数量
VIET_0912_TASK_ACTIVE_SHENGDANSHU_TRIGGER_EXIST_TIME = 1532; --触发器存在的时间，记录在玩家身上，每次触发，此时间减1，单位是分钟

VIET_0912_STR_EVENT_LOG_TITLE = "Hoat dong thang 12";
VIET_0912_NPC_NAME_1 = "<color=green>C萴 nang i s? ki謓<color>";
VIET_0912_NPC_NAME_2 = "<color=green>Th玭g Gi竛g Sinh v筺 ni猲: <color>";
VIET_0912_NPC_NAME_3 = "<color=green>Ph竜 hoa: <color>";

VIET_0912_SHIMEN_AWARD_MAX_COUNT = 10;                  --每天师门任务最多获得奖励的次数
VIET_0912_XIANGCAODANGAO_MAX_COUNT = 1200;              --每角色最多使用的香草蛋糕的数量
VIET_0912_YANHUO_MAX_COUNT = 20;                        --每天最多使用的烟火的数量
VIET_0912_KAOROU_MAX_COUNT = 120;                       --每天最多点击的烤肉数量
VIET_0912_SHENGDANLIHE_MAX_COUNT = 15;                  --每天最多点击圣诞礼盒的数量

--通过师门任务获得的圣诞糖果的数量
VIET_0912_SHIMEN_SHENGDANTANGGUO = {
	[1] = 30,
	[2] = 30,
	[3] = 30,
	[4] = 30,
	[5] = 30,
	[6] = 40,
	[7] = 50,
	[8] = 60,
	[9] = 70,
}

--香草蛋糕奖励物品
--{类型=1(物品), 概率, 名字, {id1,id2,id3,count}, 存在时间(无限制填0)}
--{类型=2(金钱), 概率, 数量（单是铜）}
--{类型=3(声望), 概率, 数量, 1=要Msg2Player，0不需要}
--{类型=4(师门贡献度), 概率, 数量, 如果玩家没入门派选择代替的索引, 1=要Msg2Player，0表示不需要}
--{类型=5(经验), 概率, 数量, 1=要Msg2Player，0或不填表示不需}
--{类型=6(自定义命令), 概率, "自定的命令（需要dostring的代码）", "自定义的Msg2Player，如果不填表示不需要"}
--1000000
VIET_0912_XIANGCAODANGAO_AWARD = {
		{1, 4, "M秐h Thi猲 th筩h", {2, 2, 7, 1}, 0},
		{1, 4, "Thi猲 th筩h", {2, 2, 8, 1}, 0},
		{1, 5, "M秐h B╪g th筩h", {2, 1, 148, 1},  0},
		{1, 5, "B╪g th筩h", {2, 1, 149, 1}, 0},
		{1, 3, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 15 * 24 * 3600},
		{1, 1, "Th? Th﹏ Ph?", {2, 0, 556, 1}, 15 * 24 * 3600},
		{3, 28, 1, 1},
		{4, 27, 1, 1},
		{1, 2, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 15 * 24 * 3600},
		{1, 2, "X輈h Thi誸 Tinh", {2, 1, 2652, 1}, 0},		
		{1, 4, "L璾 Tinh l?", {2, 1, 2000, 1}, 0},
		{1, 4, "Ng鋍 T髖", {2, 1, 2001, 1}, 0},
		{1, 9, "L? Th駓", {2, 0, 351, 1}, 0},
		{1, 2, "Nguy謙 Hoa", {2, 1, 2002, 1}, 0},
};

VIET_0912_XIANGCAODANGAO_AWARD_50 = {
		{1, 25, "уng Ti襫 V祅g", {2, 1, 30094, 1}, 0},
		{1, 5, "Rng B? K輕", {2, 1, 30093, 1}, 15 * 24 * 3600},
		{1, 10,"Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 15 * 24 * 3600},
		{1, 5, "T? Linh Thi猲 ? Ph?", {0, 107, 160, 1}, 0},
		{1, 5, "T? Linh T? ? Ph?", {0, 107, 161, 1}, 0},
		{1, 5, "T? Linh Chi課 ? Ph?", {0, 107, 159, 1}, 0},
		{1, 15, "B祅 Long b輈h", {2, 1, 1000, 1}, 15 * 24 * 3600},
		{1, 10, "T? Quang B礽", {2, 0, 762, 1}, 15 * 24 * 3600},
		{1, 5, "T葃 T駓 Кn", {2, 0, 136, 1}, 15 * 24 * 3600},
		{1, 5, "V? Ng蕁 Th駓", {2, 1, 503, 1}, 15 * 24 * 3600},
		{1, 10, "u H錸", {2, 1, 1157, 1}, 15 * 24 * 3600},
}

VIET_0912_XIANGCAODANGAO_AWARD_FULL = {
		{1, 7, "B秓 Rng c Bi謙", {2, 1, 30091, 1}, 15*3600*24},
		{1, 5468, "Rng Tr蕁 Ph竔", {2, 1, 30113, 1}, 15*3600*24},
		{1, 250, "T葃 T駓 Linh Кn", {2, 0, 137, 1}, 15*3600*24},
		{1, 100, "B竧 B秓 T葃 T駓 Кn", {2, 0, 138, 1}, 15*3600*24},
		{1, 250, "Rng Y誹 Quy誸_Cao c蕄", {2, 1, 30112, 1}, 15*3600*24},
		{1, 100, "Thi猲 C? To祅", {2, 1, 1176, 1}, 15*3600*24},
		{1, 100, "N? Oa Tinh Th筩h", {2, 1, 504, 1}, 15*3600*24},
		{1, 100, "Thi猲 Th筩h Linh Th筩h", {2, 1, 1068, 1}, 15*3600*24},
		{1, 1500, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
		{1, 100, "C鰑 Thi猲 V? C鵦 Кn", {2, 1, 1006, 1}, 15*3600*24},
		{1, 25, "L╪g Ba Vi B?", {0, 112, 78, 1}, 0},
		{1, 200, "T? Linh Chi課 ? ph?", {0, 107, 162, 1}, 0},
		{1, 100, "T? Quang Th莕 Th筩h", {2, 1, 30131, 1}, 0},
		{1, 100, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 15*3600*24},
		{1, 100, "Phi Y猲 Th筩h", {2, 1, 30130, 1}, 0},
		{1, 1500, "Nguy謙 Hoa Chi Tinh", {2, 1, 3219, 1}, 0},		
}

--赠送给NPC20个香草蛋糕以后获得的奖励
VIET_0912_NPC_AWARD = {		
		{1, 100, "Чi Nh﹏ S﹎", {2, 0, 553, 1}, 15 * 24 * 3600},
		{1, 30, "u h錸", {2, 1, 1157, 1}, 15 * 24 * 3600},
		{1, 30, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
		{1, 30, "M苩 n? S竧 Th? Л阯g", {2, 1, 1087, 1}, 15 * 24 * 3600},
		{1, 30, "T? Linh Thi猲 ? Ph?", {0, 107, 160, 1}, 0},
		{1, 30, "T? Linh T? ? Ph?", {0, 107, 161, 1}, 0},
		{1, 30, "T? Linh Chi課 ? Ph?", {0, 107, 159, 1}, 0},
		{2, 320, 600000},
		{1, 10, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 15 * 24 * 3600},
		{1, 40, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 15 * 24 * 3600},
		{1, 20, "Th莕 N玭g Кn", {2, 1, 343, 1}, 15 * 24 * 3600},
		{1, 100, "Th竔 H?  M藅 Qu?", {2, 1, 387, 1}, 15 * 24 * 3600},
		{1, 20, "T葃 T駓 n", {2, 0, 136, 1}, 15 * 24 * 3600},
		{1, 15, "B? C秐h", {0, 105, 13, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "H鑤 L玦 B竎", {0, 105, 12, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "X輈h Th?", {0, 105, 9, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 15, "Tr秓 Ho祅g Phi Di謓", {0, 105, 11, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 75, "S? M玭 L謓h Th?", {2, 1, 1016, 1}, 15 * 24 * 3600},
		{1, 75, "S? M玭 T譶h Nguy謓 Th?", {2, 1, 1019, 1}, 15 * 24 * 3600},		
};

--玉兔箱、鸡脚、鸭腿、羊肉的奖励
VIET_0912_YUTUXIAO_AWARD = {
		{1, 5000, "M秐h Thi猲 th筩h", {2, 2, 7, 1}, 0},
		{1, 5033, "Thi猲 th筩h", {2, 2, 8, 1}, 0},
		{1, 1400, "B╪g th筩h", {2, 1, 149, 1}, 0},
		{1, 100, "T葃 T駓 linh n", {2, 0, 137, 1}, 15 * 24 * 3600},
		{1, 500, "Rng B? K輕", {2, 1, 30093, 1}, 30 * 24 * 3600},
		{1, 150, "Si猽 Quang", {0, 105, 19, 1, 1, -1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
		{1, 550, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
		{1, 2000, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 15 * 24 * 3600},
		{1, 10, "Rng Y誹 Quy誸 Cao C蕄", {2,1,30112}, 0},
--		{1, 60, "Rng Tr蕁 Ph竔", {2, 1, 30113, 1}, 30 * 24 * 3600},
--		{1, 40, "Th莕 h祅h b秓 甶觧", {0, 200, 40, 1}, 30 * 24 * 3600},
		{1, 120, "T? Quang B礽", {2, 0, 762, 1}, 15 * 24 * 3600},
		{1, 15137, "C琺 chi猲 tr鴑g", {1, 1, 14, 1}, 0},
		{1, 14000, "B竛h B閠 v祅g", {1, 1, 15, 1}, 15 * 24 * 3600},
		{1, 14000, "L筩 Mai", {1, 1, 16, 1}, 0},
		{1, 14000, "Minh Nguy謙 D?", {1, 1, 17, 1}, 0},
		{1, 14000, "M閏 Lan Xu﹏", {1, 1, 18, 1}, 0},
		{1, 14000, "T﹜ B綾 V鋘g", {1, 1, 19, 1}, 0},
};

--赠送给NPC20个香草蛋糕以后获得奖励
function give_xiangcaodangao_get_award()
    local nDate = tonumber(date("%d"));
    local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
    if GetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),1) ~= nDate then
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),1,nDate))
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),2,0))        
    end
    local nTaskVal = GetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE),2)
    if nTaskVal >= 3 then
    		Talk(1, "", VIET_0912_NPC_NAME_2.."H玬 nay i hi謕  c 3 l莕 r錳, mai h穣 ti誴 t鬰!");
        	return 0;
    end    
    if GetItemCount(2, 1, 30124) < 10 then
        Talk(1, "", VIET_0912_NPC_NAME_2.."Kh玭g  10 b竛h k衜 Vani  th鵦 hi謓 甶襲 c!");
        return 0;
    end
    if gf_Judge_Room_Weight(2, 50, VIET_0912_NPC_NAME_2) == 0 then
        return 0;
    end
    if DelItem(2, 1, 30124, 10) == 1 then
        SetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE, SetByte(GetTask(VIET_0912_TASK_GET_NPC_AWARD_DATE), 2, nTaskVal + 1))        
        gf_EventGiveRandAward(VIET_0912_NPC_AWARD, 1000, 1, szFullLogTitle, "T苙g B竛h Kem Vani");--给奖励
        gf_EventGiveCustomAward(1, 1500000, 1,"T苙g B竛h Kem Vani")--给经验
    end
end