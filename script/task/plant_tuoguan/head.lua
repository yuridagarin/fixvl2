--=============================================
--create by baiyun 2009.8.25
--describe:越南版8月份调整 离线托管种树头文件
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
--所有活动给托管种树上交般若证书奖励的统一头文件
Include("\\script\\lib\\writelog.lua");
Include("\\script\\online_activites\\award.lua")
						--帮别人种树的积分
TASK_TUOGUAN_PLANT_POINT = 2255;				
TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME = 2256;	--点击NPC请求激活的时间
TASK_TUOGUAN_PLANT_ACTIVE_TIME = 2257;			--玩家激活托管的时间
TASK_TUOGUAN_PLANT_HAS_ACTIVE = 2258;				--玩家是否已经激活托管种树
TASK_TUOGUAN_PLANT_DATE = 2259;							--玩家进行托管的日期
TASK_TUOGUAN_PLANT_COUNT = 2260;						--玩家今天已经托管的次数
TASK_TUOGUAN_PLANT_TYPE = 2261;							--玩家托管的类型，自己托管还是帮别人种树
TASK_TUOGUAN_GIVE_BANRUO_DATE = 2272;				--托管种树上交般若证书的日期
TASK_TUOGUAN_GIVE_BANRUO_COUNT = 2273;			--托管种树上交般若证书的数量
TASK_TUOGUAN_GET_AWARD_DATE = 2274;					--托管种树领取奖励的日期
TASK_TUOGUAN_GET_AWARD_FLAG = 2275;					--托管种树领取奖励的记录标记

str_TUOGUAN_LOG = "[駓 th竎 tr錸g c﹜:]";

--托管成功的概率
t_TUOGUAN_PLANT_RAND = {75, 75, 50, 75, 50};

--帮别人种树获得的积分
t_TUOGUAN_HELP_POINT = {
	{1, 46},
	{2, 46},
	{3, 7},
	{4, 1},
};
t_ZONE = {"HCM 1", "HCM 2", "HCM 3", "HN 1", "HN 2"};

--托管的经验奖励
t_TUOGUAN_EXP = {
	--托管种树
	{
		{200000, 40},
		{300000, 20},
		{400000, 20},
		{500000, 20},
	},
	--帮别人种树
	{
		{600000, 30},
		{700000, 40},
		{800000, 30},
	}
};

--托管得的奖励
t_TUOGUAN_AWARD = {
--托管种树
--帮别人种树,奖励相同
	--{"Th竔 H?  M藅 Qu? ", 	60, {2,1,387,1}},
	{"V遪g Th竔 H? B竧 Qu竔 - C祅", 354, {2,1,469,3}},
	{"V遪g Th竔 H? B竧 Qu竔 - Kh玭", 290, {2,1,470,3}},
	{"V遪g Th竔 H? B竧 Qu竔 - Kh秏", 60, {2,1,471,3}},
	{"V遪g Th竔 H? B竧 Qu竔 - 礽", 40, {2,1,472,3}},
	{"V遪g Th竔 H? B竧 Qu竔 - Ly", 40, {2,1,473,3}},
--	{"V遪g Th竔 H? B竧 Qu竔 - Ch蕁", 1, {2,1,474,1}},
--	{"V遪g Th竔 H? B竧 Qu竔 - C蕁", 100, {2,1,475,1}},
--	{"V遪g Th竔 H? B竧 Qu竔 - T鑞", 3, {2,1,476,1}},
	{"Ng? H祅h M藅 t辌h", 			4, {0,107,155,1}},
	{"Nguy謙 Hoa Chi Tinh", 			3, {2,1,3219,1}},
	{"Nguy謙 Hoa ", 					4, {2,1,2002,1}},
	{"X輈h Thi誸 Tinh", 				204, {2,1,2652,1}},
	{"N玭g Tang ph?", 			1, {2,1,1056,1}},
--	{"Long Huy誸 ho祅", 				1, {2,1,1002,1}},
--	{"K? L﹏ ho祅", 				1, {2,1,1003,1}},
--	{"Ph鬾g Huy誸 ho祅", 				1, {2,1,1004,1}},
--	{"Chi課 Th莕 ho祅", 				1, {2,1,1005,1}},
};

--交够8个般若证书后得到的奖励
t_TUOGUAN_8_AWARD = {
	-- {"B祅 Long b輈h", 10, {2,1,1000,1}, 15*24*3600},
	{"M苩 n? S竧 Th? Л阯g", 10, {2,1,1087,1}, 15*24*3600},
	{"Th莕 N玭g Кn", 10, {2,1,343,1}, 15*24*3600},
	{"Th? Th﹏ ph?", 10, {2,0,556,1}, 15*24*3600},
	{"Tu Ch﹏ Y誹 Quy誸", 10, {2,0,554,1}, 15*24*3600},
	-- {"T祅g Ki誱 anh h飊g thi誴", 10, {2,0,31,1}, 15*24*3600},
	{"S? m玭 m藅 h祄", 10, {2,1,1020,1}, 15*24*3600},
--	{"Чi Nh﹏ s﹎", 10, {2,0,553,1}, 15*24*3600},
	{"Th莕 h祅h b? ph?", 10, {0,200,39,1}, 15*24*3600},
	-- {"Tinh 甶猽 hoa cng th筩h", 10, {2,1,1023,1}, 15*24*3600},
};


--积分换取奖励的奖励列表
t_TUOGUAN_POINT_TO_AWARD = {
	{"M藅 t辌h m玭 ph竔 cao c蕄 70", nil},
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,6}},
	{"Tr竔 c﹜", nil},
	{"Thi猲 Th筩h linh th筩h", {2,1,1068,1}, 30 * 24 * 3600},
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,6}},
	{"H遖 Th? B輈h", {2,1,1001,2}, 7 * 24 * 3600},
	{"Tr竔 c﹜", nil},
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,6}},
	{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h", {2,1,1067,1}, 30 * 24 * 3600},
	{"Thi猲 Cang L謓h",{2, 95, 204,2}}, 
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,6}},
	{"Чi мnh H錸", {2,1,1113,1}, 30 * 24 * 3600},
	{"Thi猲 M玭 Kim L謓h", {2,1,30370,2}},
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,6}},
	{"L╪g Ba Vi B?", {0,112,78,1}},
	{"T骾 Thi猲 Th筩h Tinh Th筩h", {2,1,3356,1}, 30 * 24 * 3600},
	{"Tr竔 c﹜", nil},
	{"Chuy觧 Sinh Кn", {2,1,30345,1}, 30 * 24 * 3600},
	{"Thi猲 Th筩h linh th筩h", {2,1,1068,1}, 30 * 24 * 3600},
	{"H遖 Th? B輈h", {2,1,1001,2}, 7 * 24 * 3600},
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,6}},
	{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h", {2,1,1067,1}, 30 * 24 * 3600},
	{"T骾 Thi猲 Th筩h Tinh Th筩h", {2,1,3356,1}, 30 * 24 * 3600},
	{"L╪g Ba Vi B? to祅 t藀", {0,112,158,1}},
	{"Tr竔 c﹜", nil},
	{"H遖 Th? B輈h", {2,1,1001,2}, 7 * 24 * 3600},
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,6}},
	{"Chuy觧 Sinh Кn", {2,1,30345,1}, 30 * 24 * 3600},
	{"Thi猲 M玭 Kim L謓h", {2,1,30370,2}},
	{"Nh﹏ S﹎ V筺 N╩", {2,1,30071,18}},
}

-- M藅 t辌h cao c蕄 70
t_TUOGUAN_HIG = {
	[2] = {"Kim Cang B竧 Nh? Ch﹏ Quy觧", {0,107,204,2,4}},
	[3] = {"V? Tr莕 B? б Ch﹏ Quy觧",{0,107,206,2,4}},
	[4] = {"Ti襪 Long T骳 Di謙 Ch﹏ Quy觧",{0,107,205,2,4}},
	[6] = {"Thi猲 La Li猲 Ch﹗ Ch﹏ Quy觧",{0,107,207,2,4}},
	[8] = {"Nh? ? Kim жnh Ch﹏ Quy觧",{0,107,208,2,4}},
	[9] = {"B輈h H秈 Tuy謙  Ch﹏ Quy觧",{0,107,209,2,4}},
	[11] = {"H鏽 чn Tr蕁 Nh筩 Ch﹏ Quy觧",{0,107,210,2,4}},
	[12] = {"Qu? Thi猲 Du Long Ch﹏ Quy觧",{0,107,211,2,4}},
	[14] = {"Huy襫 秐h M? T玭g Ch﹏ Quy觧",{0,107,212,2,4}},
	[15] = {"Qu﹏ T? ыi Phong Ch﹏ Quy觧",{0,107,213,2,4}},
	[17] = {"Tr蕁 Qu﹏ Phi Long Thng Ch﹏ Quy觧",{0,107,214,2,4}},
	[18] = {"Xuy猲 V﹏ L筩 H錸g Ch﹏ Quy觧",{0,107,215,2,4}},
	[20] = {"Huy襫 Minh Phong Ma Ch﹏ Quy觧",{0,107,216,2,4}},
	[21] = {"Linh C? Huy襫 T? Ch﹏ Quy觧",{0,107,217,2,4}},
	[23] = {"C鰑 Thi猲 Phong L玦 Ch﹏ Quy觧", {0,107, 218,2,4}},		
	[29] = {"H錸g Tr莕 T髖 M閚g Ch﹏ Quy觧", {0,107, 222,2,4}},		
	[30] = {"Phong Hoa Thi猲 Di謕 Ch﹏ Quy觧", {0,107, 223,2,4}},			
};
--积分换取奖励的秘籍
-- M藅 t辌h 70
t_TUOGUAN_MIJI = {
	[2] = {"Kim Cang B竧 Nh? Kinh", {0,107,166,2}},
	[3] = {"V? Tr莕 B? б Kinh",{0,107,168,1}},
	[4] = {"Ti襪 Long T辌h Di謙 Kinh",{0,107,167,1}},
	[6] = {"Thi猲 La Li猲 Ch﹗ L鬰",{0,107,169,1}},
	[8] = {"Nh? ? Kim жnh M藅 T辌h",{0,107,170,1}},
	[9] = {"B輈h H秈 Tuy謙  Ph?",{0,107,171,1}},
	[11] = {"H鏽 чn Tr蕁 Nh筩 M藅 T辌h"	,{0,107,172,1}},
	[12] = {"Qu? Thi猲 Du Long M藅 T辌h",{0,107,173,1}},
	[14] = {"Huy詎 秐h M? Tung M藅 T辌h",{0,107,174,1}},
	[15] = {"Qu﹏ T? Ti謙 Phong M藅 T辌h",{0,107,175,1}},
	[17] = {"Tr蕁 Qu﹏ Phi Long Thng Ph?"	,{0,107,176,1}},
	[18] = {"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",{0,107,177,1}},
	[20] = {"U Minh Phong Ma L鬰",{0,107,178,1}},
	[21] = {"Linh C? Huy詎 T? L鬰",{0,107,179,1}},
	[23] = {"C鰑 Thi猲 Phong L玦 Quy誸",{0,107,198,1}},	
	[29] = {"H錸g Tr莕 T髖 M閚g Ph?",{0,107,202,1}},
	[30] = {"Phong Hoa Thi猲 Di謕 Ph?",{0,107,203,1}},
};

t_TUOGUAN_MIJI2 = {
	[2] = {"Kim Cang B竧 Nh? Kinh", {0,107,166,2}},
	[3] = {"V? Tr莕 B? б Kinh",{0,107,168,2}},
	[4] = {"Ti襪 Long T辌h Di謙 Kinh",{0,107,167,2}},
	[6] = {"Thi猲 La Li猲 Ch﹗ L鬰",{0,107,169,2}},
	[8] = {"Nh? ? Kim жnh M藅 T辌h",{0,107,170,2}},
	[9] = {"B輈h H秈 Tuy謙  Ph?",{0,107,171,2}},
	[11] = {"H鏽 чn Tr蕁 Nh筩 M藅 T辌h"	,{0,107,172,2}},
	[12] = {"Qu? Thi猲 Du Long M藅 T辌h",{0,107,173,2}},
	[14] = {"Huy詎 秐h M? Tung M藅 T辌h",{0,107,174,2}},
	[15] = {"Qu﹏ T? Ti謙 Phong M藅 T辌h",{0,107,175,2}},
	[17] = {"Tr蕁 Qu﹏ Phi Long Thng Ph?"	,{0,107,176,2}},
	[18] = {"Xuy猲 V﹏ L筩 H錸g M藅 T辌h",{0,107,177,2}},
	[20] = {"U Minh Phong Ma L鬰",{0,107,178,2}},
	[21] = {"Linh C? Huy詎 T? L鬰",{0,107,179,2}},
	[23] = {"C鰑 Thi猲 Phong L玦 Quy誸",{0,107,198,2}},	
	[29] = {"H錸g Tr莕 T髖 M閚g Ph?",{0,107,202,2}},
	[30] = {"Phong Hoa Thi猲 Di謕 Ph?",{0,107,203,2}},	
};
-- M藅 t辌h 45
t_TUOGUAN_LOW = {
	[2] = {"Kim Cang Ph鬰 Ma kinh",{0,107, 1,2}},
	[3] = {"V? Tr莕 M藅 t辌h",{0,107, 5,2}},
	[4] = {"Ti襪 Long M藅 t辌h",	{0,107, 3,2}},
	[6] = {"Thi猲 La M藅 T辌h",{0,107, 7,2}},
	[8] = {"Nh? ? M藅 T辌h",{0,107, 9,2}},
	[9] = {"B輈h H秈 Ph?",{0,107,11,2}},
	[11] = {"H鏽 чn M藅 t辌h",{0,107,13,2}},
	[12] = {"Qu? Thi猲 M藅 t辌h",{0,107,15,2}},
	[14] = {"Huy襫 秐h M藅 t辌h",{0,107,17,2}},
	[15] = {"Qu﹏ T? M藅 t辌h",{0,107,19,2}},
	[17] = {"Tr蕁 Qu﹏ M藅 t辌h",{0,107,21,2}},
	[18] = {"Xuy猲 V﹏ M藅 t辌h",{0,107,23,2}},
	[20] = {"U Minh Qu? L鬰",{0,107,25,2}},
	[21] = {"Linh C? M藅 t辌h",{0,107,27,2}},
	[23] = {"Kinh Phong M藅 T辌h",{0,107,180,2}},
	[29] = {"T髖 M閚g M藅 t辌h",{0,107,188,2}},
	[30] = {"Ph錸 Hoa M藅 t辌h",{0,107,190,2}},			
};

--积分换诀要奖励
t_TUOGUAN_JUEYAO = {
	[2] = {"T骾 b? ki誴 Thi誹 L﹎", {2,0,607,1}},
	[3] = {"T骾 b? ki誴 Thi誹 L﹎",{2,0,607,1}},
	[4] = {"T骾 b? ki誴 Thi誹 L﹎",{2,0,607,1}},
	[6] = {"T骾 b? ki誴 Л阯g M玭",{2,0,608,1}},
	[8] = {"T骾 b? ki誴 Nga My",{2,0,609,1}},
	[9] = {"T骾 b? ki誴 Nga My",{2,0,609,1}},
	[11] = {"T骾 b? ki誴 C竔 Bang"	,{2,0,610,1}},
	[12] = {"T骾 b? ki誴 C竔 Bang",{2,0,610,1}},
	[14] = {"T骾 b? ki誴 V? ng",{2,0,611,1}},
	[15] = {"T骾 b? ki誴 V? ng",{2,0,611,1}},
	[17] = {"T骾 b? ki誴 Dng M玭"	,{2,0,612,1}},
	[18] = {"T骾 b? ki誴 Dng M玭",{2,0,612,1}},
	[20] = {"T骾 b? ki誴 Ng? чc",{2,0,613,1}},
	[21] = {"T骾 b? ki誴 Ng? чc",{2,0,613,1}},
};

function plant_tuoguan(nType, nPay, nZone)
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE) == 1 then
		if GetTask(TASK_TUOGUAN_PLANT_TYPE) == 1 then
			Talk(1, "", "Thi誹 hi謕  nh? ngi tr錸g c﹜ gi髉, 900 gi﹜ sau h穣 n S? Gi? V? L﹎  nh薾 thng.");
			return 0;
		else
			Talk(1, "", "Thi誹 hi謕  ng k? th祅h c玭g tr錸g c﹜ gi髉 ngi kh竎, 360 gi﹜ sau h穣 quay l筰 nh薾 thng.");
			return 0;
		end
	end
	if GetTask(TASK_TUOGUAN_PLANT_DATE) ~= nDate then
		SetTask(TASK_TUOGUAN_PLANT_COUNT, 0);
	end
	if GetTask(TASK_TUOGUAN_PLANT_COUNT) >= 5 then
		Talk(1, "", "H玬 nay thi誹 hi謕  駓 th竎 tr錸g c﹜ v? gi髉 ngi kh竎 tr錸g c﹜ th祅h c玭g, kh玭g th? 駓 th竎 th猰 ho芻 gi髉 ngi kh竎 tr玭g c﹜ n鱝.");
		return 0;
	end
	local nDiff = GetTime() - GetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME);
	if nDiff < 60 then
		Talk(1, "", "Thi誹 hi謕 c莕 ph秈 i th猰"..(60 - nDiff).." gi﹜ m韎 c? th? ti誴 t鬰 駓 th竎 tr錸g c﹜.");
		return 0;
	end
	if nType == 1 then
		if GetItemCount(2, 0, 398) == 0 or GetItemCount(2, 0, 351) < 7 or GetItemCount(2, 1, 509) == 0 then
			Talk(1, "", "Nguy猲 li謚 tr猲 ngi kh玭g , kh玭g th? 駓 th竎 tr錸g c﹜");
			return 0;
		end
	elseif nType == 2 then
		if GetItemCount(2, 1, 30114) == 0 then
			Talk(1, "", "Tr猲 ngi kh玭g c? b竧 nh? ch鴑g th?, kh玭g th? 駓 th竎 tr錸g c﹜");
			return 0;
		end
	end
	if nType == 1 then
		if random(1, 100) > t_TUOGUAN_PLANT_RAND[nType] then
			Talk(1, "", "Hi謓 t筰 ? server  ch鋘 ch璦 c? ngi nh薾 tr錸g c﹜/   s? lng c玭g vi謈. Xin h穣 ng k? l筰 trong 60 gi﹜ n鱝");
			SetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME, GetTime());
			return 0;
		end
	elseif nType == 2 then
		if random(1, 100) > 75 then
			Talk(1, "", "Hi謓 t筰 ? server  ch鋘 ch璦 c? ngi nh薾 tr錸g c﹜/   s? lng c玭g vi謈. Xin h穣 ng k? l筰 trong 60 gi﹜ n鱝");
			SetTask(TASK_TUOGUAN_PLANT_WANT_ACTIVE_TIME, GetTime());
			return 0;
		end
	end
	if Pay(nPay * 10000) == 0 then
		Talk(1, "", "Ng﹏ lng c馻 b筺 kh玭g !");
		return 0;
	end
	if nType == 1 then
		if DelItem(2, 0, 398, 1) == 1 and DelItem(2, 0, 351, 7) == 1 and DelItem(2, 1, 509, 1) == 1 then
			SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 1);
			SetTask(TASK_TUOGUAN_PLANT_DATE, nDate);
			SetTask(TASK_TUOGUAN_PLANT_COUNT, GetTask(TASK_TUOGUAN_PLANT_COUNT) + 1);
			SetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME, GetTime());
			SetTask(TASK_TUOGUAN_PLANT_TYPE, nType);
			Talk(1, "", "Чi hi謕  駓 th竎 tr錸g c﹜ th祅h c玭g, xin m阨 i 900 gi﹜ sau n <color=green>V? L﹎ S? Gi?<color> nh薾 thng.");
			Msg2Player("Чi hi謕  駓 th竎 tr錸g c﹜ th祅h c玭g, xin m阨 i 900 gi﹜ sau n V? L﹎ S? Gi? nh薾 thng.");
			if nZone ~= 0 then 
				WriteLogEx("Uy thac trong cay", "Uy Thac", 1, t_ZONE[nZone]);
			end
		end
	elseif nType == 2 then
		if DelItem(2, 1, 30114, 1) == 1 then
			SetTask(TASK_TUOGUAN_PLANT_HAS_ACTIVE, 1);
			SetTask(TASK_TUOGUAN_PLANT_DATE, nDate);
			SetTask(TASK_TUOGUAN_PLANT_COUNT, GetTask(TASK_TUOGUAN_PLANT_COUNT) + 1);
			SetTask(TASK_TUOGUAN_PLANT_ACTIVE_TIME, GetTime());
			SetTask(TASK_TUOGUAN_PLANT_TYPE, nType);
			if GetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE) ~= nDate then
				SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, 0);
			end
			SetTask(TASK_TUOGUAN_GIVE_BANRUO_DATE, nDate);
			SetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT, GetTask(TASK_TUOGUAN_GIVE_BANRUO_COUNT) + 1);
                        give_tuoguan_activity_award()    --by xiongyizhi 2010年圣诞新加活动物品出口
			Talk(1, "", "C竎 h?  b竜 danh th祅h c玭g gi髉 ngi kh竎 tr錸g c﹜, i 360 gi﹜ n nh薾 thng.");
			Msg2Player("C竎 h?  b竜 danh th祅h c玭g gi髉 ngi kh竎 tr錸g c﹜, i 360 gi﹜ n nh薾 thng.");			
			WriteLogEx("Uy thac trong cay", "Nhan Trong Cay");
		end
	end
end
-- ph莕 thng n閜 b竧 nh? ch鴑g th? th? 16
function Give_BNCT_16_Award()
	local rand =  random(1,100)
	if rand <= 50 then
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),4}, "Tr竔 C﹜", "Nop bat nha chung thu 16", "B竧 Nh? Ch鴑g Th?")
	elseif rand <= 55 then
		Earn(300000)
		WriteLogEx("Nop bat nha chung thu 16","Nhan 30 vang")	
	elseif rand <= 75 then	
		gf_AddItemEx2({2,1,30086,1}, "H箃 Gi鑞g", "Nop bat nha chung thu 16", "B竧 Nh? Ch鴑g Th?",7*24*60*60)
	elseif rand <= 85 then
		gf_AddItemEx2({2,0,504,1}, "C﹜ B竧 Nh? Nh?", "Nop bat nha chung thu 16", "B竧 Nh? Ch鴑g Th?",7*24*60*60)
	elseif rand <= 90 then
		gf_AddItemEx2({2,0,398,1}, "C﹜ B竧 Nh? ", "Nop bat nha chung thu 16", "B竧 Nh? Ch鴑g Th?",7*24*60*60)
	elseif rand <= 95 then
		gf_AddItemEx2({2,1,30269,1}, "C﹜ T? Linh", "Nop bat nha chung thu 16", "B竧 Nh? Ch鴑g Th?",7*24*60*60)
	else
		ModifyExp(1000000)
		WriteLogEx( "Nop bat nha chung thu 16","Nhan 1000000 diem kinh nghiem")
	end
end