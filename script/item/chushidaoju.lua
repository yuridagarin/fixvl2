-- 出师道具

Include("\\script\\online\\zgc_public_fun.lua")

GRADUATE_TASK_ID = 1292	-- 此任务变量在 \script\master_prentice\some_op.lua 中也定义过

t_can_use_map = 
{
	101,	--江南区\海外孤岛
	102,	--江南区\桃花岛
	103,	--江南区\东海海滨一
	104,	--江南区\东海海滨二
	105,	--江南区\泉州府西
	106,	--江南区\龙泉村
	107,	--江南区\武夷山
	108,	--江南区\泉州府北
	109,	--江南区\清音洞一层
	110,	--江南区\清音洞二层
	111,	--江南区\清溪洞
	112,	--江南区\两水洞一层
	113,	--江南区\两水洞二层
	114,	--江南区\王母洞一层
	115,	--江南区\王母洞二层
	116,	--江南区\王母洞三层
	151,	--江南区\云梦泽
	201,	--中原一区\汴京府南
	202,	--中原一区\杏花村
	203,	--中原一区\汴京府西
	205,	--中原一区\汴京府东
	206,	--中原一区\雁门关废
	207,	--中原一区\二龙山
	208,	--中原一区\梁山泊
	210,	--中原一区\阳中洞一层
	211,	--中原一区\阳中洞二层
	212,	--中原一区\阳中洞三层
	213,	--中原一区\少林密室一层
	214,	--中原一区\少林密室二层
	215,	--中原一区\黑风洞
	216,	--中原一区\祥云洞
	217,	--中原一区\野猪林
	218,	--中原一区\灵宝山
	301,	--中原二区\成都府西
	302,	--中原二区\青城山
	304,	--中原二区\成都府南
	306,	--中原二区\江津村
	307,	--中原二区\丰都
	308,	--中原二区\成都府北
	309,	--中原二区\剑阁蜀道
	310,	--中原二区\剑门关
	311,	--中原二区\伏牛山
	313,	--中原二区\天师洞一层
	314,	--中原二区\天师洞二层
	315,	--中原二区\冰心洞一层
	316,	--中原二区\冰心洞二层
	317,	--中原二区\竹丝洞一层
	318,	--中原二区\竹丝洞二层
	319,	--中原二区\封魔洞一层
	320,	--中原二区\封魔洞二层
	321,	--中原二区\金光洞
	322,	--中原二区\龙虎洞一层
	323,	--中原二区\龙虎洞二层
	324,	--中原二区\七星洞一层
	325,	--中原二区\七星洞二层
	326,	--中原二区\暮雪山庄
	327,	--中原二区\乌蒙部
	328,	--中原二区\鬼门回廊
	401,	--西南区\点苍山
	402,	--西南区\西双版纳北部
	403,	--西南区\西双版纳南部
	405,	--西南区\武陵山脚
	406,	--西南区\武陵山
	407,	--西南区\五毒教
	408,	--西南区\苗岭
	409,	--西南区\千寻塔一层
	410,	--西南区\千寻塔二层
	411,	--西南区\千寻塔三层
	412,	--西南区\龙眼洞一层
	413,	--西南区\龙眼洞二层
	414,	--西南区\凤眼洞
	415,	--西南区\凤眼洞二层
	416,	--西南区\白水洞一层
	417,	--西南区\白水洞二层
	418,	--西南区\入门迷宫一
	419,	--西南区\入门迷宫二
	420,	--西南区\燕子洞一层
	421,	--西南区\燕子洞二层
	422,	--西南区\万毒寨
	501,	--西北区\凤翔府南
	502,	--西北区\华山
	503,	--西北区\秦始皇陵
	504,	--西北区\凤翔府北
	505,	--西北区\药王谷
	506,	--西北区\沙漠迷宫
	507,	--西北区\龙门镇
	508,	--西北区\光明顶
	510,	--西北区\药王洞
	511,	--西北区\古阳洞一层
	512,	--西北区\古阳洞二层
	513,	--西北区\皇陵墓室一层
	514,	--西北区\皇陵墓室二层
	600,	--北区\王旗部落
	601,	--北区\大草原一
	602,	--北区\大草原二
	603,	--北区\雁门关外废
	604,	--北区\雁门关
}

function OnUse(idx)
	Say("S? d鬾g Xu蕋 S? Ti猽  g鋓 ra s竧 h筩h vi猲 c馻 Qu鑓 T? Gi竚, S?  h頿 s鴆  ti猽 di謙. Ch? ?   ph秈 t蕁 c玭g cu鑙 c飊g. B筺 quy誸 nh d飊g ch?? \n<color=red>Xin x竎 nh薾 b筺  nh薾 頲 to祅 b? b鎛g l閏,   m閠 khi xu蕋 s?, nh鱪g b鎛g l閏 ch璦 nh薾 th? kh玭g th? nh薾 n鱝.<color>", 2, "ng/yes_use", "Sai/no_say")
end

function yes_use()
	if use_check() > 0 and DelItem(2,1,590,1) == 1 then
		local nMapID, nX, nY = GetWorldPos()
		local n = CreateNpc("Qu鑓 T? Gi竚 tu莕 kh秓","Qu鑓 T? Gi竚 tu莕 kh秓",nMapID, nX + random(-5,5), nY + random(-5,5))
		SetNpcScript(n, "\\script\\item\\chushidaoju.lua")
		SetNpcLifeTime(n, 1800)
	end
end

function OnDeath(idx)
	local nNpcIdx = tonumber(idx)
	SetNpcLifeTime(nNpcIdx, 0)
	if death_check() > 0 then
		SetTask(GRADUATE_TASK_ID, 1)
		Say("Ch骳 m鮪g b筺  ho祅 th祅h nhi謒 v?! M阨 s? ph? b筺 ng i di謓 r錳 th鵦 hi謓 ng t竎 \'B竔\' l? c? th? xu蕋 s?",0)
	end
end

function use_check()		-- 师傅PlayerIndex
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- 不是师徒2人组队
		Say("T? i ch? c? 2 s?  m韎 c? th? s? d鬾g v藅 n祔",0)
		return 0
	end
	local nMMapID, nMX, nMY = GetWorldPos()
	local szMasterName = GetName()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- 丫的根本没有徒弟
		Say("B筺 kh玭g c?  t?, kh玭g th? s? d鬾g v藅 ph萴 n祔!", 0)
		return 0
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	
	if tInfo["master"] ~= szMasterName then	-- 丫的根本不是这个人的师傅
		PlayerIndex = nOldPlayer
		Say("T? i ch? c? 2 s?  m韎 c? th? s? d鬾g v藅 n祔", 0)
		return 0
	end
	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		if value == szName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- 不在师傅的徒弟列表里捏
		PlayerIndex = nOldPlayer
		Say("T? i ch? c? 2 s?  m韎 c? th? s? d鬾g v藅 n祔", 0)
		return 0
	end
	if GetLevel() < 73 then
		PlayerIndex = nOldPlayer
		Say("е t? c馻 b筺 ch璦 t c蕄 73, ch璦 th? xu蕋 s?", 0)
		return 0
	end
	
	if tInfo["istemp"] == 0 then			-- 临时弟子
		PlayerIndex = nOldPlayer
		Say("е t? t筸 th阨 kh玭g 頲 xu蕋 s?", 0)
		return 0
	end
	
	-- 距离判断
	local nPMapID, nPX, nPY = GetWorldPos()
	local fDistance = distance_between_points(nMMapID, nMX, nMY, nPMapID, nPX, nPY)
	if fDistance > 10 or fDistance < 0 then
		PlayerIndex = nOldPlayer
		Say("е t? c馻 b筺 c竎h b筺 qu? xa, kh玭g th? s? d鬾g v藅 n祔.", 0)
		return 0
	end
	
	-- 地盘判断
	local nMapID = GetWorldPos()
	isExist = 0
	for index, value in t_can_use_map do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	PlayerIndex = nOldPlayer
	if isExist == 0 then
		Msg2Player("Khu v鵦 hi謓 t筰 kh玭g th? s? d鬾g o c? xu蕋 s?.")
		return 0
	end
	return 1
end

function death_check()		-- 默认为徒弟PlayerIndex
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- 不是师徒2人组队
		return 0
	end
	
	if GetLevel() < 73 then
		return 0
	end
	
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local nMasterIndex = PlayerIndex
	local szMasterName = GetName()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- 丫的根本没有徒弟
		return 0
	end

	PlayerIndex = nOldPlayer
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szMasterName then	-- 丫的根本不是这个人的师傅
		return 0
	end

	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		if value == szName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- 不在师傅的徒弟列表里捏
		return 0
	end
	if tInfo["istemp"] == 0 then			-- 临时弟子
		return 0
	end
	return 1
end

function msg_2_team(msg, msgtype)
    local num = GetTeamSize()
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    for i=1, num do
        PlayerIndex = GetTeamMember(i)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function no_say()
end