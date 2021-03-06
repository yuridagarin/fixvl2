Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\string.lua");
Include("\\script\\结婚\\mission\\mission_head.lua");
Include("\\script\\global\\mate_head.lua");
DEBUG_VERSION = 0;	--是否调试版本

GLB_CLOSE_MARRIAGE = 153;	--关闭媒婆和月老
GLB_CLOSE_FIELD	= 154;		--关闭传送人和结婚场地

SetGlbValue(GLB_CLOSE_MARRIAGE,0);	--如需关闭媒婆和月老，这里设置为1
SetGlbValue(GLB_CLOSE_FIELD,0);	--如需关闭场地和传送人，这里设置为1

MARRIAGE_CHANNEL = "Khu v鵦 k誸 h玭"

KEY_WEDDING				= "WEDDING_FIELD"	-- 共享数据记录的主键

ITEM_COIN				= {2,1,549}		-- 礼金
ITEM_INVITATION			= {2,1,506}		-- 请帖
ITEM_DOOLY				= {0,105,32}	-- 轿子
ITEM_LIHUA				= {2,1,546}		-- 礼花
ITEM_XITANG				= {2,1,507}		-- 喜糖
ITEM_MTCXB				= {2,1,548}		-- 漫天彩屑包
ITEM_QINGTIE_PACKET		= {2,1,547}		-- 请贴包
ITEM_NOTEBOOK 			= {2,1,550}		-- 场地说明手卷
ITEM_JINGBIAOBOOK		= {2,1,540}		-- 场地竞标手卷
ITEM_HONGBAO = {
			[1] = {2,1,539,"Чi h錸g bao ho祅g kim"},
			[2] = {2,1,537,"Чi h錸g bao t? kim"},
			[3] = {2,1,508,"H錸g bao"},
			}
			
ITEM_MARRIAGE_PACKET = {
			[1] = {2,1,541,"V躰h K誸 уng T﹎ bao"},
			[2] = {2,1,542,"C蕀 S総 H遖 Minh bao"},
			[3] = {2,1,543,"Chu Li猲 B輈h H頿 bao"},
			[4] = {2,1,544,"V╪ мnh C竧 Tng bao"},
			}
--=====================================================================================================
TASK_WEDDING_COST		= 2000				-- 任务变量：婚礼投标价格
TASK_WEDDING_DATE		= 2001				-- 任务变量：婚礼投标日期
TASK_WEDDING_FIELD		= 2002				-- 任务变量：婚礼投标时段和场地
TASK_WEDDING 			= 2003				-- 任务变量：婚礼步骤 + 婚礼状态 * 1000
TASK_WEDDING_LOVER		= 2004				-- 任务变量：恋人名字的编码
TASK_EAT_XITANG_COUNT	= 2005				-- 当日吃喜糖数量
TASK_EAT_XITANG_DATE	= 2006				-- 吃喜糖的日期
TASK_TAKE_FOOD_TIME		= 2007				-- 上次取走食物的时间
TASK_KOTOW				= 2008				-- 是否在结婚场地做过拜的动作
TASK_GOT_INVITATION		= 2009				-- 是否领取了请贴

TASK_FACTION_OUT		= 2011				-- 任务变量：是否出师
TASK_SEPERATION_DATE	= 2018				-- 任务变量：分居日期（年份 * 600 + 月份 * 40 + 日期）
TASK_MARRIAGE_HINT		= 2019				-- 任务变量：结婚步骤提示

TASK_WEDDING1_ID		= 2024				-- 记录玩家进入的１号场地婚礼ID
TASK_WEDDING2_ID		= 2025				-- 记录玩家进入的２号场地婚礼ID
TASK_WEDDING3_ID		= 2026				-- 记录玩家进入的３号场地婚礼ID
TASK_WEDDING4_ID		= 2027				-- 记录玩家进入的４号场地婚礼ID

TASK_BUY_RING			= 2028				-- 记录买戒指的情况。个位表示是否买了男戒，十位表示是否买了女戒

INTERVAL_SEPERATION		= 7					-- 分居的天数

--某天某时段某场地的预订状态结构的项
ITEMKEY_STAT			= "stat"			-- 预订状态
ITEMKEY_ROLE			= "role"			-- 预订人
ITEMKEY_WIFE			= "wife"			-- 配偶
ITEMKEY_COST			= "cost"			-- 预订金额
ITEMKEY_CLOSEDATE		= "close_date"		-- 截至日期
ITEMKEY_CLOSETIME		= "close_time"		-- 截至时间

-- 不同类型婚礼场地对应的地图ID, TODO: here
map_field2type = {
	[851] = 1,	--胭脂小筑
	[852] = 2,	--天涯海角
	[853] = 3,	--洞房花烛
	[854] = 4,	--云山之巅
}

field_lihua_limit = {10,20,30,50}	--场地内礼花数量限制

-- 婚礼预订时段
map_period = {
	{12,0,13,30,"12:00-13:30","12:30-13:30"},	
	{18,0,19,30,"18:00-19:30","18:30-19:30"},
	{21,0,22,30,"21:00-22:30","21:30-22:30"},
}

map_RevPos	= {
	{851,1521,3181},
	{852,1602,3167},
	{853,1506,3175},
	{854,1609,3222},
	}

-- 场地类型
map_fieldinfo = {
	-- 名称			起标价	买断价	附请帖数  最大人数   加价
	{"Y誸 chi ti觰 tr骳",	20,		250,	3,			50,        10},
	{"C? o",	40,		500,	5,			100,       20},
	{"чng ph遪g hoa ch骳",	200,	2500,	5,			100,       100},
	{"V﹏ S琻 nh",	800,	10000,	8,			100,       400}
}

-- 场地坐标
map_fieldpos 	= {		-- 婚礼场地地图ID和坐标
	{851, 1543, 3220},
	{852, 1603, 3276},
	{853, 1544, 3213},
	{854, 1603, 3326},
}

map_leavefieldpos = {
	{150, 1711, 3051},
	{150, 1711, 3051},
	{150, 1711, 3051},
	{150, 1711, 3051},
}
--食物
tFoods = 
{
	[1] = {1,1,2," C琺 n緈"},
	[2] = {1,1,3," M祅 th莡"},
	[3] = {1,1,4," B竛h x誴"},
	[4] = {1,1,5," B竛h bao th辴"},
	[5] = {1,1,6,"кa m╪g x祇"},
	[6] = {1,1,7," T鳴u? u"},
	[7] = {1,1,8," u x祇"},
	[8] = {1,1,9,"C秈 x祇 t醝"},
	[9] = {1,1,10,"Thi猽 o T?"},
	[10] = {1,1,11,"N? Nhi H錸g"},
	[11] = {1,1,12,"Чo Hoa Hng"},
	[12] = {1,1,13,"T髖 M閚g T鰑"},
	[13] = {1,1,14," C琺 chi猲 tr鴑g"},
	[14] = {1,1,15," B竛h B閠 v祅g"},
	[15] = {1,1,16,"L筩 Mai"},
	[16] = {1,1,17,"Nh? th藀 t? ki襲 Minh Nguy謙 D?"},
	[17] = {1,1,18,"M閏 Lan Hng"},
	[18] = {1,1,19,"T﹜ B綾 V鋘g"},
}

ITEM_COMPERE	= {					-- 主婚人外衣
	{0, 109, 177},	--租的
	{0, 109, 178},
	{0, 109, 179},
	{0, 109, 180},
	{0, 109, 241},	--买的
	{0, 109, 242},
	{0, 109, 243},
	{0, 109, 244},
}

SKILL_CANDY		= 870		-- 技能ID：撒喜糖
--============================================================================================
function cancel()
	-- Do nothing
end

-- 设置婚礼的步骤:1表示可以提亲了，2表示纳彩（交媒金和礼品）成功，
--3表示问名（交互请贴，设置恋人码）成功，4表示大聘成功，5表示订场地成功了
function set_wedding_step(step)
	local stat = floor(GetTask(TASK_WEDDING) / 1000)
	SetTask(TASK_WEDDING, stat*1000 + mod(step, 1000))
end

-- 获取婚礼的步骤
function get_wedding_step()
	return mod(GetTask(TASK_WEDDING), 1000)
end

-- 设置婚礼的状态，1表示投标成功或者选择了不需要结婚场地
function set_wedding_stat(stat)
	local step = mod(GetTask(TASK_WEDDING), 1000)
	SetTask(TASK_WEDDING, step + stat * 1000)
end

-- 获取婚礼的状态
function get_wedding_stat()
	return floor(GetTask(TASK_WEDDING) / 1000)
end

-- 是否已经结婚
function is_married(player)
	local old_idx = PlayerIndex
	local result = 0
	PlayerIndex = player
	if (GetMateName() ~= "") then
		result = 1
	end
	PlayerIndex = old_idx
	return result
end

-- 获取队伍中的意中人的玩家索引
function get_team_lover(myself)
	for i = 1, 2 do
		local index = GetTeamMember(i)
		if (index ~= myself) then
			return index
		end
	end
	return 0
end

-- 获取意中人在队伍中的索引
function get_love_team_index(myself)
	for i = 1, 2 do
		local index = GetTeamMember(i)
		if (index ~= myself) then
			return i
		end
	end
	return 0
end

-- 获取恋人的名字编码
function get_lover_code(index)
	return GetTask(TASK_WEDDING_LOVER, index)
end

-- 设置恋人的名字编码
function set_lover_code(index, code)
	SetTask(TASK_WEDDING_LOVER, code, 0, index)
end

function encode_date(year, mon, day)
	return year * 600 + mon * 40 + day
end

function decode_date(date)
	local year = floor(date / 600)
	local rest = mod(date, 600)
	local mon = floor(rest / 40)
	local day = mod(rest, 40)
	return year, mon, day
end

function encode_param2(period, type)
	return period * 100 + type
end

function decode_param2(param2)
	local type = mod(param2, 100)
	local period = floor(param2 / 100)
	return period, type
end

-- 今天
function curr_date()
	local year = tonumber(date("%Y"))
	local mon = tonumber(date("%m"))
	local day = tonumber(date("%d"))
	return encode_date(year, mon, day)
end

function cmp_time(hour1, min1, hour2, min2)
	if (hour1 > hour2) then
		return 1
	elseif (hour1 < hour2) then
		return -1
	elseif (min1 > min2) then
		return 1
	elseif (min1 < min2) then
		return -1
	else
		return 0
	end
end

function cmp_datetime(date1, time1, date2, time2)
	-- DEBUG
	-- print(format("cmp_datetime(%d, %d, %d, %d)", date1, time1, date2, time2))
	if (date1 > date2) then
		return 1
	elseif (date1 < date2) then
		return -1
	elseif (time1 > time2) then
		return 1
	elseif (time1 == time2) then
		return 0
	else
		return -1
	end
end

-- 获取当前时段
function curr_period()
	local hour = tonumber(date("%H"))
	local min = tonumber(date("%M"))
	for i = 1, getn(map_period) do
		local period_info = map_period[i]
		if (cmp_time(hour, min, period_info[1], period_info[2]) >= 0 and
			cmp_time(hour, min, period_info[3], period_info[4]) <= 0) then
			return i
		end
	end
	return -1
end

-- 非闰年
map_days = {
	[1] = 31,
	[2] = 28,
	[3] = 31,
	[4] = 30,
	[5] = 31,
	[6] = 30,
	[7] = 31,
	[8] = 31,
	[9] = 30,
	[10] = 31,
	[11] = 30,
	[12] = 31
}

-- 闰年
map_days_leapyear = {
	[1] = 31,
	[2] = 29,
	[3] = 31,
	[4] = 30,
	[5] = 31,
	[6] = 30,
	[7] = 31,
	[8] = 31,
	[9] = 30,
	[10] = 31,
	[11] = 30,
	[12] = 31
}

function encode_time(hour, min, sec)
	return hour * 3600 + min * 60 + sec
end


function decode_time(time)
	local hour = floor(time / 3600)
	local rest = mod(time, 3600)
	local min = floor(rest / 60)
	local sec = mod(rest, 60)
	return hour, min, sec
end

-- 前一天
function prev_date(date)
	local days = map_days
	local year, mon, day = decode_date(date)
	if (mod(year, 4) == 0) then
		days = map_days_leapyear
	end
	if (day > 1) then
		return encode_date(year, mon, day - 1)
	elseif (mon > 1) then
		return encode_date(year, mon - 1, days[mon - 1])
	else
		return encode_date(year - 1, 12, 31)
	end
end

-- 下一天
function next_date(date)
	local days = map_days
	local year, mon, day = decode_date(date)
	if (mod(year, 4) == 0) then
		days = map_days_leapyear
	end

	if (day < days[mon]) then
		return encode_date(year, mon, day + 1)
	elseif (mon < 12) then
		return encode_date(year, mon + 1, 1)
	else
		return encode_date(year + 1, 1, 1)
	end
end

function curr_time()
	local hour = tonumber(date("%H"))
	local min = tonumber(date("%M"))
	local sec = tonumber(date("%S"))
	return encode_time(hour, min, sec)
end

-- 获取今天开始的几天的日期
function future_days(from, count)
	local date = curr_date()
	for i = 1, from do
		date = next_date(date)
	end
	local days = {}
	for i = 1, count do
		days[i] = date
		date = next_date(date)
	end
	return days
end

-- 下一个结婚步骤提示
function hint_step(step)
	SetTask(TASK_MARRIAGE_HINT, step)
end

-- 门派
map_faction = {
	[1] = {"Thi誹 L﹎","Tha"},
	[2] = {"V? ng","Tha"},
	[3] = {"Nga My","Ngi ch琲"},
	[4] = {"C竔 Bang","Tha"},
	[5] = {"Л阯g M玭","Ngi ch琲"},
	[6] = {"Dng M玭","Ngi ch琲"},
	[7] = {"Ng? чc","Ngi ch琲"},
	[8] = {"C玭 L玭", "Tha"},
	[9] = {"Minh gi竜", "Tha"},
	[10] = {"Th髖 Y猲", "Ngi ch琲"},
}

-- 出师
function faction_graduate(faction)
	if (GetPlayerFaction() ~= faction) then
		Talk(1, "",
			"Ngi kh玭g ph秈 l?  t? " .. map_faction[faction][1] .. ", mu鑞 xu蕋 s? ph秈 n g苝 chng m玭 tr鵦 ti誴 c馻 m譶h!")
	elseif (GetTask(TASK_FACTION_OUT) ~= 0) then
		Talk(1, "", "Ngi  l?  t? xu蕋 s?")
	else
		SetTask(TASK_FACTION_OUT, 1)
		Talk(1, "", "Nam n? y猽 nhau l? chuy謓 琻g nhi猲. Ngi  t譵 頲 ? trung nh﹏, ta ng ? cho ngi xu蕋 s?. Ch骳 ngi b竎h ni猲 giai l穙!")
	end
end

-- 是否主婚人
function is_compere()
	local t1, t2, t3 = GetPlayerEquipInfo(7)
	for i = 1, getn(ITEM_COMPERE) do
		local cloth = ITEM_COMPERE[i]
		if (t1 == cloth[1] and
			t2 == cloth[2] and
			t3 == cloth[3]) then
			return 1
		end
	end
	return 0
end
--是否在场地内
function in_fields()
	local nMapID = GetWorldPos();
	for i=1,getn(map_fieldpos) do
		if nMapID == map_fieldpos[i][1] then
			return 1;
		end;
	end;
	return 0;
end;

function add_invitation(count, date, para)
	for i = 1, count do
		local res, item = AddItem(ITEM_INVITATION[1], ITEM_INVITATION[2], ITEM_INVITATION[3], 1)
		if (res ~= 0) then
			SetItemParam(item, 0, date)	-- 婚礼日期
			SetItemParam(item, 1, para)	-- 婚礼时段和类型
		end
	end
	Msg2Player(format("B筺 nh薾 頲 %d thi謕 m阨 h玭 l?", count))
end

function marriage_check_kotow()
	local tScale = { 
			[1] = {1605,3156,8},
			[2] = {1670,3203,12},
			[3] = {1612,3143,12},
			[4] = {1658,3262,12},
			}
	local nMapID = GetWorldPos();
	local nFieldID = 0;
	for i=1,getn(map_fieldpos) do
		if nMapID == map_fieldpos[i][1] then
			nFieldID = i;
		end;
	end;
	if nFieldID == 0 then
		return 0;	--不在地图内，不作提示
	end;
	if GetName() ~= GetMissionS(MS_BRIDEGROOM) and GetName() ~= GetMissionS(MS_BRIDE) then
		return 0;	--如果不是本场地的新郎新娘
	end;
	if GetMateName() ~= "" then
		Msg2Player("Ngi  k誸 h玭");
		return 0;
	end;
	if GetTeamSize() ~= 2 then
		Msg2Player("Hai ngi t? i v韎 nhau")
		return 0;
	end;
	if GetMissionV(MV_CAN_MARRY) ~= 1 then
		Msg2Player("B竔 thi猲 a");
		return 0;
	end;
	if gf_GetDistance(tScale[nFieldID][1],tScale[nFieldID][2]) > tScale[nFieldID][3] then
		Msg2Player("Ngi kh玭g r? r祅g");
		return 0;
	end;
	local lover = get_team_lover(PlayerIndex)
	if GetTask(TASK_WEDDING_LOVER) ~= Hash(GetName(lover)) then
		Msg2Player("i phng kh玭g h? c? h玭 c v韎 ngi"); 
		return 0;
	end;
	SetTask(TASK_KOTOW,1);
	if GetTask(TASK_KOTOW) == 1 and GetTask(TASK_KOTOW,lover) == 1 then
		marriage_setting();
		Msg2Player("B﹜ gi? hai ngi ch輓h th鴆 l? phu th?");
		Msg2SomeOne("B﹜ gi? hai ngi ch輓h th鴆 l? phu th?",lover);
		return 1;
	else
		return 0;
	end;
end;

function marriage_setting()
	local nOldPlayerIndex = PlayerIndex;
	local lover = get_team_lover(PlayerIndex)
	-- 根据好感度设置初始同心值
	local lover_idx = get_love_team_index(PlayerIndex)
	local friend_grade = GetMemberFriendliness(lover_idx)
	local love_grade = 0
	if (friend_grade >= 1801) then
		love_grade = 300
	elseif (friend_grade >= 1401) then
		love_grade = 260
	elseif (friend_grade >= 1001) then
		love_grade = 220
	elseif (friend_grade >= 601) then
		love_grade = 180
	elseif (friend_grade >= 201) then
		love_grade = 140
	else
		love_grade = 100
	end
	-- 设置同心值
	SetTask(TASK_LOVEGRADE, love_grade)
	SetTask(TASK_LOVEGRADE, love_grade, 0, lover)
	-- 设置结婚日期
	local day = curr_date()
	SetTask(TASK_MARRYDATE, day) 
	SetTask(TASK_MARRYDATE, day, 0, lover) 
	-- 设置配偶体型
	SetTask(TASK_MATESTYLE, GetBody(lover))
	SetTask(TASK_MATESTYLE, GetBody(), 0, lover)
	-- 结婚
	DoMarry(lover)
	WriteLog("[K誸 h玭]:"..GetName().."k誸 h玭, b筺 i l?"..GetName(lover)..",  h秓 h鱱:"..friend_grade..", tr? s? t譶h c秏 ban u l?:"..love_grade)
	SaveNow();
	PlayerIndex = lover;
	SaveNow();
	PlayerIndex = nOldPlayerIndex;
end;

function add_qingtie_packet(nCount)
	if nCount == 0 then
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	for i=1,nCount do
		nRetCode,nItemIdx = AddItem(ITEM_QINGTIE_PACKET[1],ITEM_QINGTIE_PACKET[2],ITEM_QINGTIE_PACKET[3],1);
		if nRetCode ~= 0 then
			SetItemParam(nItemIdx,0,2);
		end;
		WriteLog("[K誸 h玭]:"..GetName().." Х mua 1 thi謕 m阨 ");
	end;
end;
-- 清除预订信息
function clear_subs()
	SetTask(TASK_WEDDING_COST, 0)
	SetTask(TASK_WEDDING_DATE, 0)
	SetTask(TASK_WEDDING_FIELD, 0)
	SetTask(TASK_GOT_INVITATION,0)
end

--	清除所有结婚信息：取消婚约、离婚
function clear_task()
	clear_subs()
	SetTask(TASK_WEDDING, 0)
	SetTask(TASK_WEDDING_LOVER, 0)
	SetTask(TASK_MARRYDATE,0);
	SetTask(TASK_BUY_RING);
end