--七夕活动头文件脚本
--by vivi
--08/01/2007 

--任务变量 注意2400任务变量已经用过
TASK_GET_SEED = 2390; --记录玩家是否领取过种子
TASK_FLOWER_GROW = 2391; --记录花的成长度
TASK_AWARD_ONE = 2392; --记录玩家是否领取过现阶段的成长奖励，分30数值使用（1-30）
TASK_AWARD_TWO = 2393; --记录玩家是否领取过现阶段的成长奖励，分14数值使用（31-39，40，50，60，80，100）
TASK_TOTAL_TIME = 2394; --当天累积在线时间
TASK_PLANT_TIME = 2395; --记录种花的时间
TASK_IS_PLANT = 2396; --是否种下了神秘的花
TASK_IS_GROW = 2397; --当天成长度是否已经加过，存入day
TASK_CURRENT_LOGIN = 2398; --记录当前登录时间
TASK_LAST_LOGIN = 2399; --记录上次登陆时间，用于判断是否需要更新TASK_CURRENT_LOGIN
TASK_GET_FINAL = 2401; --记录是否领取过最终奖励

--全局变量
NEED_TIME = 60; --每天在线需要多少时间才让成长度加1，单位：分

--成长奖励table
tGrowAward = {--现阶段最大成长度  成长奖励范围（万） 
	{1,70,150},
	{2,70,150},
	{3,70,150},
	{4,70,150},
	{5,100,200},
	{6,100,200},
	{7,100,200},
	{8,100,200},
	{9,100,200},
	{10,100,250},
	{11,100,250},
	{12,100,250},
	{13,100,250},
	{14,100,250},
	{15,100,250},
	{16,100,250},
	{17,100,250},
	{18,100,250},
	{19,100,250},
	{20,100,300},
	{21,100,300},
	{22,100,300},
	{23,100,300},
	{24,100,300},
	{25,100,300},
	{26,100,300},
	{27,100,300},
	{28,100,300},
	{29,100,300},
	{30,100,300},
	{31,100,300},
	{32,100,300},
	{33,100,300},
	{34,100,300},
	{35,100,300},
	{36,100,300},
	{37,100,300},
	{38,100,300},
	{39,100,300},
	{49,400,1200},
	{59,500,1500},
	{79,600,1800},
	{99,1000,2200},
	{100,1000,3000}
	}

--最终奖励table
tFinalAward = {--现阶段最大成长度	最终奖励基数	获得同心匣概率	获得同心匣个数	获得楚国神兵匣概率 获得楚国神兵匣个数
	{0,500000},
	{4,1000000,0,0,0,0},
	{9,4000000,10,1,0,0},
	{19,8000000,20,1,0,0},
	{39,12000000,40,1,0,0},
	{49,16000000,60,1,0,0},
	{59,16000000,80,1,0,0},
	{79,16000000,100,1,100,1},
	{99,16000000,100,1,100,2},
	{100,20000000,100,1,100,4}
	}


--给予同心匣和神兵匣奖励，用于描述
tBoxAward = {
	"<color=red>10%<color> x竎 su蕋 nh薾 頲 H閜 уng t﹎",
	"<color=red>20%<color> x竎 su蕋 nh薾 頲 H閜 уng t﹎",
	"<color=red>40%<color> x竎 su蕋 nh薾 頲 H閜 уng t﹎",
	"<color=red>60%<color> x竎 su蕋 nh薾 頲 H閜 уng t﹎",
	"<color=red>80%<color> x竎 su蕋 nh薾 頲 H閜 уng t﹎",
	"Nh薾 頲 <color=red>1<color> H閜 уng t﹎ v? <color=red>1<color> H閜 Th莕 Binh S? qu鑓",
	"Nh薾 頲 <color=red>1<color> H閜 уng t﹎ v? <color=red>2<color> H閜 Th莕 Binh S? qu鑓",
	"Nh薾 頲 <color=red>1<color> H閜 уng t﹎ v? <color=red>4<color> H閜 Th莕 Binh S? qu鑓"
	}
	

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end