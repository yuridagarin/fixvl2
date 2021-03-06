-- 师徒系统的一些操作

Include("\\script\\lib\\string.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\global\\battlefield_callback.lua")

tItem = {2,1,588}
GRADUATE_TASK_ID = 1292			-- 此任务变量在 \script\item\chushi.lua 中也定义过
TASK_SEED = 1290				-- 此任务变量在 \script\master_prentice\task_content.lua 中有定义过
TASK_CONTENT = 1291				-- 此任务变量在 \script\master_prentice\task_content.lua 中有定义过

MAX_FUND_COUNT = 10

t_can_use_map = 
{
	100,	--江南区\泉州
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
	117,	--江南区\天涯海角
	150,	--江南区\扬州
	151,	--江南区\云梦泽
	200,	--中原一区\汴京
	201,	--中原一区\汴京府南
	202,	--中原一区\杏花村
	203,	--中原一区\汴京府西
	204,	--中原一区\少林
	205,	--中原一区\汴京府东
	206,	--中原一区\雁门关废
	207,	--中原一区\二龙山
	208,	--中原一区\梁山泊
	209,	--中原一区\丐帮
	210,	--中原一区\阳中洞一层
	211,	--中原一区\阳中洞二层
	212,	--中原一区\阳中洞三层
	213,	--中原一区\少林密室一层
	214,	--中原一区\少林密室二层
	215,	--中原一区\黑风洞
	216,	--中原一区\祥云洞
	217,	--中原一区\野猪林
	218,	--中原一区\灵宝山
	219,	--中原一区\天波杨府
	300,	--中原二区\成都
	301,	--中原二区\成都府西
	302,	--中原二区\青城山
	303,	--中原二区\峨嵋
	304,	--中原二区\成都府南
	305,	--中原二区\唐门
	306,	--中原二区\江津村
	307,	--中原二区\丰都
	308,	--中原二区\成都府北
	309,	--中原二区\剑阁蜀道
	310,	--中原二区\剑门关
	311,	--中原二区\伏牛山
	312,	--中原二区\武当
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
	350,	--中原二区\襄阳
	326,	--中原二区\暮雪山庄
	327,	--中原二区\乌蒙部
	328,	--中原二区\鬼门回廊
	329,	--中原二区\天师秘境
	400,	--西南区\大理府
	401,	--西南区\点苍山
	402,	--西南区\西双版纳北部
	403,	--西南区\西双版纳南部
	404,	--西南区\翠烟
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
	500,	--西北区\凤翔
	501,	--西北区\凤翔府南
	502,	--西北区\华山
	503,	--西北区\秦始皇陵
	504,	--西北区\凤翔府北
	505,	--西北区\药王谷
	506,	--西北区\沙漠迷宫
	507,	--西北区\龙门镇
	508,	--西北区\光明顶
	509,	--西北区\昆仑
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

function _CheckInvite(nTargetIndex, nPrenticeCount, nMaxPrenticeCount)
	if nPrenticeCount >= nMaxPrenticeCount then
		Say("B筺 kh玭g th? th﹗ n筽   n鱝. ", 0)
		return 0
	end
	
	local nLevel = GetLevel()
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	local nOldPlayer = PlayerIndex
	PlayerIndex = nTargetIndex
	if PlayerIndex <= 0 then
		return
	end
	local nTarLevel = GetLevel()
	local szTarName = GetName()
	local tTarInfo = GetMPBaseInfo()
	local nIsSleeping = IsSleeping()
	
	PlayerIndex = nOldPlayer
	if nTarLevel >= nLevel then		-- 等级比自己高,不能收
		Say(szTarName.." ng c蕄 b籲g ho芻 h琻 b筺, n猲 kh玭g th? thu l祄  ", 0)
		return 0
	end
	if nIsSleeping > 0 then
		Say(szTarName.."產ng trong tr筺g th竔 ng?, kh玭g th? h錳 ﹎ c馻 b筺.", 0)
		return 0
	end
	
	local nMTime = tInfo["mtime"] - GetTime()		-- 收徒的CD到了没
	if nMTime > 0 then
		local nHour = floor(nMTime / 3600)
		nMTime = mod(nMTime, 3600)
		local nMin = floor(nMTime / 60)
		local nSec = mod(nMTime, 60)
		Say("B筺 c遪 <color=red>"..nHour.."h "..nMin.." Ph髏 "..nSec.." gi﹜ <color>m韎 c? th? th﹗ n筽 1   .", 0)
		return 0
	end
	
	if tTarInfo["master"] == szName then
		Say(szTarName.." l?   c馻 b筺 r錳.", 0)
		return 0
	end
	
	if tInfo["prentice"] ~= nil then
		for index, value in tInfo["prentice"] do
			if value == szTarName then
				Say(szTarName.." l?   c馻 b筺 r錳.", 0)
				return 0
			end
		end
	end
	
	if tInfo["evermaster"] ~= nil then
		for index, value in tInfo["evermaster"] do
			print("1"..value)
			if value == szTarName then
				Say(szTarName.."B筺  t鮪g S? у quan h?, kh玭g th? th﹗ n筽.", 0)
				return 0
			end
		end
	end
	
	if tTarInfo["evermaster"] ~= nil then
		for index, value in tTarInfo["evermaster"] do
			if value == szName then
				print("2"..value)
				Say(szTarName.."B筺  t鮪g S? у quan h?, kh玭g th? th﹗ n筽.", 0)
				return 0
			end
		end
	end

	if tTarInfo["master"] ~= "" then
		Say(szTarName.." l?   c馻 "..tTarInfo["master"]..", kh玭g th? th﹗ n筽.", 0)
		return 0
	end
	
	if tTarInfo["ismaster"] ~= 0 then
		Say(szTarName.." l? s? ph鬰, kh玭g th? th﹗ n筽.", 0)
		return 0
	end
	
	local nPTime = tTarInfo["ptime"] - GetTime()
	if nPTime > 0 then
		local nHour = floor(nPTime / 3600)
		nPTime = mod(nPTime, 3600)
		local nMin = floor(nPTime / 60)
		local nSec = mod(nPTime, 60)
		Say(szTarName.."c遪 ph秈 <color=red>"..nHour.."h "..nMin.." Ph髏 "..nSec.."gi﹜ <color>m韎 c? th? b竔 s? ", 0)
		return 0
	end
	
	Talk(1, "", "B筺  g鰅 tin m阨 "..szTarName.." l祄  ")
	return 1
end

function _to_be_master(nRet)
	if nRet == 0 or nRet == 10 then
		Say("T猲 c馻 c竎 h?  頲 ng k?, b﹜ gi?  c? th? th﹗ n筽  t?. H穣 蕁 F3  m? \'trang Thu閏 t輓h\' th? s? th蕐 giao di謓 S? . N誹 mu鑞 tham gia v? n﹏g cao k? n╪g S? , h穣 n t譵 ta!",0)
	end
end

function _add_temp_member(nRet, nParam1, nParam2, szParam)
	if nRet == 22 then
		if nParam1 > 0 and szParam == "m" then
			local nHour = floor(nParam1 / 3600)
			nParam1 = mod(nParam1, 3600)
			local nMin = floor(nParam1 / 60)
			local nSec = mod(nParam1, 60)
			Say("B筺 c遪 "..nHour.."h "..nMin.." Ph髏 "..nSec.." gi﹜ m韎 c? th? th﹗ n筽 1  .", 0)
		elseif nParam2 > 0 and szParam == "p" then
			local nHour = floor(nParam2 / 3600)
			nParam2 = mod(nParam2, 3600)
			local nMin = floor(nParam2 / 60)
			local nSec = mod(nParam2, 60)
			Say("B筺 c遪 "..nHour.."h "..nMin.." Ph髏 "..nSec.." gi﹜ m韎 c? th? b竔 s?. ", 0)
		end
	elseif nRet == 12 or nRet == 13 then
		if szParam == "m" then
			Say("Ъng c蕄 th? nghi謕 c馻 b筺 b﹜ gi? kh玭g th? th﹗ n筽 th猰  .", 0)
		end
	elseif nRet == 0 then
		if szParam == "p" then
			Say("B筺  頲 thu nh薾 l祄  t? t筸 th阨 c馻 s? ph? b筺. \nдn khi ng c蕄 c馻 b筺 t c蕄 10. Xin h穣 t? i v韎 s? ph?, trong kho秐g c竎h g莕 s? d鬾g ng t竎 \'B竔\', s? tr? th祅h  t? ch輓h th鴆.", 0)
		end
	end
end

function _ture_join(nRet, nParam)
	if nRet == 0 and nParam == 0 then		-- 正是拜师以后把以前的出师任务变量清空
		SetTask(GRADUATE_TASK_ID, 0)
		SetTask(TASK_SEED, 0)
		SetTask(TASK_CONTENT, 0)
		Msg2Player("B筺  th祅h ch輓h  t? ch輓h th鴆. H穣 n Qu鑓 T? Gi竚 nh薾 trang b?.")
	end
	if nRet == 12 or nRet == 13 then
		if nParam == 1 then
			Say("Ъng c蕄 th? nghi謕 c馻 b筺 b﹜ gi? kh玭g th? c? th猰   ch輓h th鴆.", 0)
		end
	end
end

function _pre_chk_betray()
	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
		return 1
	end
	Say("Mu鑞 r阨 kh醝 S? M玭 c莕 ph秈 ti猽 hao 99 S? у ph? ch?, b筺 kh玭g  S? у ph? ch? ", 0)
	return 0
end

function _betray(nRet)
	if nRet ~= 0 then	-- 失败了，把师徒符纸还给徒弟
		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
	end
end

function _pre_chk_kickout()
	print("_pre_chk_kickout()")
	if DelItem(tItem[1], tItem[2], tItem[3], 99) == 1 then
		return 1
	end
	Say("Khi  t? r髏 ra kh醝 S? M玭 c莕 ph秈 ti猽 hao 99 S? у ph? ch?, b筺 kh玭g  S? у ph? ch? ", 0)
	return 0
end

function _kickout(nRet)
	if nRet ~= 0 then	-- 失败了，把师徒符纸还给玩家
		AddItem(tItem[1], tItem[2], tItem[3], 99, 1)
	end
end

function _graduate(nRet, nParam, szParam)
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szOtherName = GetName()
	PlayerIndex = nOldPlayer
	if nRet == 0 then
		if szParam == "p" then
			SetTask(GRADUATE_TASK_ID, 0)
			SetTask(TASK_SEED, 0)
			SetTask(TASK_CONTENT, 0)
			local n = CustomDataRead("mp_p_award_final")
			if n == nil then
				AddItem(2, 1, 593, 1, 1)
				CustomDataSave("mp_p_award_final", "d", 1)
				WriteLog("[S? у - Xu蕋 S璢:"..GetName().."Nh薾 頲 1 t骾 S?  Kh? qu猲")
				SaveNow()
			end
			Say("B筺   n╪g l鵦  t? ho祅h t萿 giang h?, s? ph? <color=yellow>"..szOtherName.."<color> tuy kh玭g n? xa b筺, nh璶g nh chia tay  b筺 r蘮 luy謓 m閠 phen. B筺  Xu蕋 S?.", 0)
		elseif szParam == "m" then
			Say("у  <color=yellow>"..szOtherName.."<color>  Xu蕋 S?, ﹏ c dng d鬰 c? i kh? qu猲. ", 0)
			if nParam > 0 then
				AddItem(2, 1, 589, nParam, 1)
				Msg2Player("B筺 nh薾 頲 "..nParam.." b鎛g l閏 Qu鑓 T? Gi竚")
				WriteLog("[S? у - Xu蕋 S璢:"..GetName().."Nh薾 頲"..nParam.." b鎛g l閏 Qu鑓 T? Gi竚")
				SaveNow()
			end
		end
	end
end

function _buyfund(nRet, nParam, szParam)
	if nRet == 0 and szParam ~= "" then		-- 师父
		Say("C竎 h?  mua cho <color=yellow>"..szParam.."<color> <color=yellow>"..nParam.."<color> Hoa H錸g. Xin h穣 ch? ? tin t鴆 tr猲 b秐g, nh薾 b鎛g l閏 c騨g ti課 h祅h tr猲 giao di謓 S? , c? ch? n祇 kh玭g hi觰 th? t譵 ta",0)
		WriteLog("[H? th鑞g S? ]: Mua Hoa H錸g th祅h c玭g (m) m="..GetName().." p="..szParam.." n="..nParam)
	elseif nRet == 0 and szParam == "" then	-- 徒弟
		Say("L謓h s?  mua cho b筺 <color=yellow>"..nParam.."<color> Hoa H錸g.",0)
		WriteLog("[H? th鑞g S? ]: Mua Hoa H錸g th祅h c玭g (p) m="..GetName().." p="..szParam.." n="..nParam)
	elseif nRet ~= 0 and szParam ~= "" then	-- 师父，而且购买失败了
		AddItem(2,1,594,nParam*10,1)
		WriteLog("[H? th鑞g S? ]: Mua Hoa H錸g th蕋 b筰 m="..GetName().." p="..szParam.." n="..nParam)
	end
end

function _p_getfund(nRet, nParam1, nParam2)
	Msg2Player(nRet, nParam1, nParam2)
end

function _m_getfund(nRet, nParam1, nParam2, szParam)
	if nParam1 > 0 then
		local i = 1
		for n=1, 21 do
			i = i * 2
			if i == nParam1 then
				nParam1 = n + 1
				break
			end
		end
	end
	if nRet == 0 and nParam2 > 0 then
		if nParam1 == 1 or nParam1 == 5 or nParam1 == 6 or nParam1 == 9 or nParam1 == 11 or nParam1 == 13 then
			nParam2 = nParam2 * 2
		elseif nParam1 == 2 or nParam1 == 3 or nParam1 == 4 or nParam1 == 8 or nParam1 == 10 or nParam1 == 12 or (nParam1 >= 14 and nParam1 <= 22) then
			nParam2 = nParam2
		elseif nParam1 == 7 then
			nParam2 = nParam2 * 3
		end
			
		AddItem(2,1,589,nParam2)
		Msg2Player("B筺  nh薾 "..nParam2.." b鎛g l閏 Qu鑓 T? Gi竚. ")
		SaveNow()
		WriteLog("[S? у - b鎛g l閏 s? ph鬩"..GetName().."Х nh薾 "..nParam2.." b鎛g l閏 Qu鑓 T? Gi竚")
	end
end

function _finnalfund(nRet, nParam)
	if nRet == 0 then
		AddItem(2,1,589,nParam)
		Say("B筺  nh薾 "..nParam.." b鎛g l閏 Qu鑓 T? Gi竚. ", 0)
		SaveNow()
		WriteLog("[S? у - Thu nh藀 cu鑙 c飊g c馻 s? ph鬩"..GetName().."Х nh薾 "..nParam.." b鎛g l閏 Qu鑓 T? Gi竚")
	elseif nRet == 17 then
		local nDiffTime = nParam
		local nDay = floor(nDiffTime / 86400)
		nDiffTime = mod(nDiffTime, 86400)
		local nHour = floor(nDiffTime / 3600)
		nDiffTime = mod(nDiffTime, 3600)
		local nMin = floor(nDiffTime / 60)
		Say("C遪 c莕 "..nDay.."Thi猲"..nHour.."h "..nMin.." m韎 c? th? nh薾 kho秐 b鎛g l閏 n祔", 0)
	elseif nRet == 18 then
		Say("B筺  nh薾 b鎛g l閏 n祔 r錳.", 0)
	end
end

function _free_change_point(nRet, nType, nPoint)
	WriteLog("[S? у free_change_point] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("B筺 kh玭g  甶觤 S? у")
	elseif nRet == 21 then
		Msg2Player("Tri襲 ёnh kh玭g th? gi髉 b筺 c? th猰 甶觤 S? у")
	elseif nRet == 0 then
		if nType == 1 then				-- 金钱
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- 声望
			Msg2Player("Danh v鋘g")
		elseif nType == 3 then			-- 师门贡献度
			Msg2Player("觤 s? m玭")
		elseif nType == 4 then			-- 军功
			SetRankPoint(5, 701, 1)	-- 衰减操作在SetRankPoint的时候才进行,所以要先衰减,再扣
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("B筺 nh薾 頲 "..(20*nPoint).." 甶觤 c玭g tr筺g")
		elseif nType == 5 then			-- 健康经验
			Msg2Player("K. nghi謒 (S鴆 kh醗)")
		elseif nType == 6 then			-- 经验
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("B筺 nh薾 頲 "..nAddExp.." 甶觤 kinh nghi謒")
		elseif nType == 7 then			-- 健康经验转经验
			Msg2Player("S鴆 kho? chuy觧 th祅h kinh nghi謒")
		end
	end
end

function _change_point(nRet, nType, nPoint)
	WriteLog("[S? у change_point] : "..GetName()..";"..nRet..";"..nType..";"..nPoint)
	if nRet == 20 then
		Msg2Player("B筺 kh玭g  甶觤 S? у")
		AddItem(tItem[1],tItem[2],tItem[3],nPoint)	-- 把没有成功兑换的师徒符纸还给玩家
	elseif nRet == 0 then
		if nType == 0 then				-- 师德
			Msg2Player("B筺 d飊g "..nPoint.." 甶觤 S?  chuy觧 th祅h 甶觤 S? c")
		elseif nType == 1 then			-- 金钱
			local nMoney = 38000 * nPoint
			Earn(nMoney)
		elseif nType == 2 then			-- 声望
			Msg2Player("Danh v鋘g")
		elseif nType == 3 then			-- 师门贡献度
			Msg2Player("觤 s? m玭")
		elseif nType == 4 then			-- 军功功
			SetRankPoint(5, 701, 1)	-- 衰减操作在SetRankPoint的时候才进行,所以要先衰减,再扣
			CalcBattleRank()
			local n = GetTask(701)
			if n >= 0 then
				SetTask(701, n + 20 * nPoint)
			else
				SetTask(701, n - 20 * nPoint)
			end
			Msg2Player("B筺 nh薾 頲 "..(20*nPoint).." 甶觤 c玭g tr筺g")
		elseif nType == 5 then			-- 健康经验
			Msg2Player("K. nghi謒 (S鴆 kh醗)")
		elseif nType == 6 then			-- 经验
			local nLevel = GetLevel()
			local nAddExp = nLevel * nLevel * 10 * nPoint
			ModifyExp(nAddExp)
			Msg2Player("B筺 nh薾 頲 "..nAddExp.." 甶觤 kinh nghi謒")
		elseif nType == 7 then			-- 健康经验转经验
			Msg2Player("S鴆 kho? chuy觧 th祅h kinh nghi謒")
		end
	end
end

function _disband(nRet)
	if nRet == 9 then
		Msg2Player("L骳 m玭 h? v蒼 c遪  t? th? kh玭g th? hu? ng k?")
	elseif nRet == 0 then
		Msg2Player("c竎 h? t筰 Qu鑓 T? Gi竚  hu? ng k? Th莕 V? Vi謓, c? th? t? 甶 b竔 s?. N誹 thay i ? nh mu鑞 th﹗ n筽 l筰  t?, h穣 t譵 ta  ng k? l筰.")
	end
end

function _want_take_on_a_master(nRet)
	if nRet == 1 then
		Say("T筸 th阨 ngi n b竔 s? qu? nhi襲, tin nh緉 y猽 c莡 v竔 s? c馻 b筺 ch璦 th? g鰅 甶. Xin h穣 i v? th? l筰.", 0)
	end
end

function _tansfer_map_chk(nMapID)
	-- 地盘判断
	local isExist = 0
	for index, value in t_can_use_map do
		if nMapID == value then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		return 0
	end
	return 1
end

function _master_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Say(szRoleName.." kh玭g ph秈  t? b筺, kh玭g th? truy襫 t鑞g", 0)
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Say(szRoleName.." kh玭g ph秈  t? b筺, kh玭g th? truy襫 t鑞g", 0)
		return
	end
	
	if IsStalling() ~= 0 then
		Say("Trong l骳 b祔 b竛 kh玭g th? truy襫 t鑞g", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("Trong qu? tr譶h M藅 T辌h kh玭g th? truy襫 t鑞g", 0)
		return
	end
	
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		Say("? d筺g PK ngo礽 th祅h kh玭g th? a 甶.", 0)
		return
	end

	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _prentice_transfer(szRoleName)
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		Msg2Player(szRoleName.." kh玭g ph秈 s? ph? c馻 b筺, kh玭g th? truy襫 t鑞g")
		return
	end
	if IsStalling() ~= 0 then
		Say("Trong l骳 b祔 b竛 kh玭g th? truy襫 t鑞g", 0)
		return
	end
	
	if IsReading() ~= 0 then
		Say("Khi luy謓 m藅 t辌h kh玭g th? a 甶.", 0)
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		Say("? d筺g PK ngo礽 th祅h kh玭g th? a 甶.", 0)
		return
	end
	GetPlayerPosition(szRoleName, "\\script\\master_prentice\\some_op.lua", "_tansfer_yes", 0)
end

function _master_lalala(szRoleName)
	-- 地图检测
	if GetItemCount(tItem[1], tItem[2], tItem[3]) < 1 then
		Say("C莕 c? <color=green>1 S? у ph? ch?<color> m韎 c? th? h? ho竛  t?. <color>", 0)
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		Say("Khu v鵦 hi謓 t筰 kh玭g th? h? ho竛  t? ", 0)
		return
	end
	
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] == nil then
		Msg2Player(szRoleName.." kh玭g ph秈  t? c馻 b筺, kh玭g th? k猽 g鋓")
		return
	end
	local isExist = 0
	for index, value in tInfo["prentice"] do
		if value == szRoleName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then
		Msg2Player(szRoleName.." kh玭g ph秈  t? c馻 b筺, kh玭g th? k猽 g鋓")
		return
	end
	DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la", GetName())
	Talk(1,"","B筺  g鰅 tin m阨 "..szRoleName.."Х g鰅 y猽 c莡 h? ho竛.")
end

function _tansfer_yes(nMapID, nX, nY, nFightState, nParam)
	-- 地图检测
	if _tansfer_map_chk(nMapID) == 0 then
		Say("B筺 kh玭g th? chuy觧 n khu v鵦 m鬰 ti猽", 0)
		return
	end

	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end

	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		CleanInteractive()
		if NewWorld(nMapID, nX, nY) ~= 0 then
			SetFightState(nFightState)
		end
	else
		Say("C莕 ph秈 <color=green>1 S? у ph? ch? <color>m韎 c? th? s? d鬾g ch鴆 n╪g S?  truy襫 t鑞g. <color>", 0)
	end
end

function _master_want_la(szRoleName)
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szRoleName then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.." kh玭g ph秈  t? c馻 b筺,")
		return
	end
	if tInfo["istemp"] == 0 then			-- 临时徒弟不能用此功能
		return
	end
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."Khu v鵦 hi謓 t筰 ")
		return
	end
	if IsPlayerDeath() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.." t? vong")
		return
	end
	if IsStalling() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."產ng b祔 b竛")
		return
	end
	if IsReading() == 1 then
		DoScriptByName(szRoleName,"\\script\\master_prentice\\some_op.lua","_master_want_la_err", szName.."產ng tu luy謓 M藅 T辌h")
		return
	end
	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--战斗状态下PK模式不可以使用
		DoScriptByName(szRoleName, "\\script\\master_prentice\\some_op.lua", "_master_want_la_err", szName.."? tr筺g th竔 PK ngo礽 th祅h, ")
		return
	end

	RandomTaskTipEx("S? ph? c馻 b筺 mu鑞 k猽 g鋓 b筺 n b猲 c筩h. ", "_prentice_see_la")
end

function _master_want_la_err(szMsg)
	Talk(1, "", szMsg.."Kh玭g c? c竎h n祇 h錳 ﹎ l阨 k猽 g鋓 c馻 b筺!")
end

function _accept_lalala(szMsg)
	local nMapID = GetWorldPos()
	if _tansfer_map_chk(nMapID) == 0 then
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "Khu v鵦 s? ph? b筺 產ng ? kh玭g th? h? ho竛 b筺.")
		return
	end

	if DelItem(tItem[1], tItem[2], tItem[3], 1) == 1 then
		local nMapID, nX, nY = GetWorldPos()
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice", nMapID..","..nX..","..nY..","..GetFightState())
	else
		Msg2Player("C莕 ph秈 <color=green>1 S? у ph? ch?<color> m韎 c? th? k猽 g鋓  t?.")
		DoScriptByName(szMsg,"\\script\\master_prentice\\some_op.lua","_lalala_prentice_err", "S? ph? c馻 b筺 kh玭g  S? у ph? ch?, kh玭g th? k猽 g鋓 b筺.")
	end
end

function _lalala_prentice(szMsg)
	if IsPlayerDeath() == 1 then
		return
	end
	if IsStalling() == 1 then
		return
	end
	if IsReading() == 1 then
		return
	end
	
	local tPos = split(szMsg, ",")
	CleanInteractive()
	if NewWorld(tPos[1], tPos[2], tPos[3]) ~= 0 then
		SetFightState(tPos[4])
	end
end

function _refuse_la(szMsg)
	Msg2Player(szMsg.."T? ch鑙 l阨 k猽 g鋓 c馻 b筺!")
end

function _lalala_prentice_err(szMsg)
	Say(szMsg, 0)
end

-- 正式拜师 and 出师
-- 满足条件则返回1
-- 不满足则返回0
function master_prentice()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- 不是师徒2人组队
		return 0
	end
	local nMap1, nX1, nY1 = GetWorldPos()
	
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local nMasterIndex = PlayerIndex
	local szMasterName = GetName()
	local szMasterLevel = GetLevel()
	local tMasterInfo = GetMPBaseInfo()
	if tMasterInfo["prentice"] == nil then			-- 丫的根本没有徒弟
		PlayerIndex = nOldPlayer
		return 0
	end
	
	local nMap2, nX2, nY2 = GetWorldPos()
	local fDistance = distance_between_points(nMap1, nX1, nY1, nMap2, nX2, nY2)
	if fDistance >= 6 or fDistance < 0 then
		PlayerIndex = nOldPlayer
		local t = GetMPBaseInfo()
		if t["master"] == szMasterName then
			if t["istemp"] == 0 then
				Msg2Player("B筺 c竎h s? ph? qu? xa, kh玭g  th祅h t﹎, kh玭g th? tr? th祅h   ch輓h th鴆.")
			elseif t["istemp"] == 1 then
				Msg2Player("B筺 c竎h s? ph? qu? xa, kh玭g  th祅h t﹎, kh玭g th? Xu蕋 S?.")
			end
		end
		return 0
	end

	PlayerIndex = nOldPlayer
	local szName = GetName()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= szMasterName then	-- 丫的根本不是这个人的师父
		return 0
	end

	local isExist = 0
	for index, value in tMasterInfo["prentice"] do
		print(value)
		if value == szName then
			isExist = 1
			break
		end
	end
	
	if isExist == 0 then					-- 不在师父的徒弟列表里捏
		return 0
	end
	
	-- 如果是出师
	if GetTask(GRADUATE_TASK_ID) == 1 then
		local isAlright = 1
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		PlayerIndex = nMasterIndex
		if mp_goods_add_chk(1,1) == 0 then
			isAlright = 0
		end
		if isAlright == 0 then
			return 0
		end
		PlayerIndex = nOldPlayer
		PrecticeGraduate(szMasterName)
		return 1
	end
	
	-- 是转正
	if tInfo["istemp"] == 1 then			-- 已经转正了还拜个毛啊
		return 0
	end
	
	if GetLevel() < 10 then					-- 小于给个提示(不能是Talk, Say之流，否则后面拜的内容可能玩完了)
		Msg2Player("Ъng c蕄 c馻 b筺 ch璦 n c蕄 10, kh玭g th? tr? th祅h  t? ch輓h th鴆.")
		return 0
	end
	if GetLevel() >= szMasterLevel then
		Msg2Player("Ъng c蕄 c馻 b筺 ph秈 nh? h琻 s? ph? c馻 b筺, m韎 c? th? tr? th祅h  t? ch輓h th鴆.")
		PlayerIndex = nMasterIndex
		Msg2Player(szName.." (ng c蕄) ph秈 nh? h琻 b筺, m韎 c? th? th祅h c馻 b筺  t? ch輓h th鴆.")
		return 0
	end
	
	Msg2Player("B筺  g鰅 y猽 c莡 xin 頲 l?  t? ch輓h th鴆. Xin h穣 i h錳 ﹎ c馻 s? ph? b筺.")
	-- 转正
	PlayerIndex = nMasterIndex
	SetPlayerScript("\\script\\master_prentice\\some_op.lua")
	Say(szName.."Mu鑞 ch輓h th鴆 b竔 b筺 l祄 s?, quy nh藀 m玭 h? c馻 ban, c? ph秈 thu n筽  t? ch輓h th鴆 kh玭g?", 2 , "уng ?/yes_add_true", "в ta suy ngh?!/refuse_add_true")
	return 1
end

function refuse_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then				-- 不是师徒2人组队
		return 0
	end
	local szName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	if PlayerIndex > 0 then
		Say(szName.."T? ch鑙 l阨 xin tr? th祅h  t? ch輓h th鴆 c馻 b筺.", 0)
	end
end

function yes_add_true()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		return
	end
	local szMasterName = GetName()
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			TakeOnAMaster(1, szMasterName)	-- 正式拜师
			break
		end
	end
	PlayerIndex = nOldPlayer
end

-------  npc 操作	-------------------------------------------------------------------------

function yes_make_master()
	if GetLevel() < 75 then
		Say("mu鑞 頲 truy襫 th? v? c玭g, b秐 th﹏ 輙 nh蕋 c騨g ph秈 c? th鵦 l鵦 y . ьi n c蕄 75 r錳 n ng k? l筰 nh?.",0)
		return
	end
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("B筺  b竔 l祄 s? ph? r錳, t筸 th阨 kh玭g th? ng k? th﹗ n筽  t?.",0)
		return
	end
	ToBeMaster()
end

function yes_be_prentice()
	Say("N誹 nh? b筺 mu鑞 l祄  . Xin nh蕄 ph秈 v祇 揃竔 s? thi誴?  thao t竎. \nN誹 nh? B竔 s? thi誴 b? m蕋 c? th? t譵 ta nh薾 l筰!", 0)
end

function buy_fund()
	if GetTeamSize() ~= 2 then
		Say("N誹 nh? c竎 h? mu鑞 mua Hoa H錸g Qu鑓 t? gi竚 cho cao   t?. Xin h穣 t? i hai ngi r錳 n y",0)
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		Say("N誹 nh? c竎 h? mu鑞 mua Hoa H錸g Qu鑓 t? gi竚 cho cao   t?. Xin h穣 t? i hai ngi r錳 n y",0)
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- 组队的没有师徒关系
		PlayerIndex = nOldPlayer
		Say("N誹 nh? c竎 h? mu鑞 mua Hoa H錸g cho cao   t?. Xin h穣 t? i hai ngi r錳 n y",0)
		return
	end
	
	if tPInfo["istemp"] == 0 then			-- 不能帮临时弟子购买基金
		PlayerIndex = nOldPlayer
		Say("C竎 h? kh玭g th? mua Hoa H錸g Qu鑓 T? Gi竚 gi飉  t? t筸 th阨.",0)
		return
	end
	
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- 不在师父的徒弟列表里捏
		Say("N誹 nh? c竎 h? mu鑞 mua Hoa H錸g Qu鑓 t? gi竚 cho cao   t?. Xin h穣 t? i hai ngi r錳 n y",0)
		return
	end
	
	local nAlreadyBuy = tPInfo["lovefund"]
	if tPInfo["lovefund"] >= 10 then
		Say("C竎 h?  mua cho "..szPrenticeName.." 10 Hoa H錸g. ",0)
		return
	end
	if nAlreadyBuy < 0 then
		nAlreadyBuy = 0
	end
	local nMaxBuy = MAX_FUND_COUNT - nAlreadyBuy
	
	Say(" C竎 h? mu鑞 mua hoa cho <color=yellow>"..szPrenticeName.."<color> ph秈 kh玭g? Trc y c竎 h?  mua cho"..szPrenticeName.."<color=red>"..nAlreadyBuy.."<color> r錳. T鑙 產 c遪 c? th? mua th猰 <color=red>"..nMaxBuy.."<color> n鱝, m鏸 ph莕 10 T鑞g Nguy猲 Th玭g B秓. T鑞g Nguy猲 Th玭g B秓 do Th竔 t? c khi ng c?, hi謓 nay trong d﹏ gian hi誱 th蕐, c竎 h? c? th? v祇 Ng? c竎  mua",
		2,
		"X竎 nh薾 mua/#yes_buy_fund("..nMaxBuy..")",
		"в ta suy ngh?!/no_say")
end

function yes_buy_fund(nMaxBuy)
	local nCount = GetItemCount(2,1,594)
	if nCount < 10 then
		Say("T鑞g Nguy猲 th玭g b秓 c馻 c竎 h? kh玭g  mua m閠 ph莕 hoa h錸g",0)
		return
	end
	local nMaxCanBuy = tonumber(floor(nCount / 10))
	local nMax = nMaxBuy
	if nMaxCanBuy < nMaxBuy then
		nMax = nMaxCanBuy
	end
	SetTaskTemp(26, nMax)
	AskClientForNumber("yes_buy_fund_cb", 1, nMax, "Mua bao nhi猽 hoa h錸g?")
end

function yes_buy_fund_cb(nN)
	local nCount = nN * 10
	if nN > GetTaskTemp(26) then
		SetTaskTemp(26, 0)
		return
	end
	SetTaskTemp(26, 0)
	if GetTeamSize() ~= 2 then
		return
	end
	local szMasterName = GetName()
	local tMInfo = GetMPBaseInfo()
	if tMInfo["prentice"] == nil then
		return
	end
	local nOldPlayer = PlayerIndex
	for i=1, 2 do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= nOldPlayer then
			break
		end
	end
	local szPrenticeName = GetName()
	local tPInfo = GetMPBaseInfo()
	if tPInfo["master"] ~= szMasterName then	-- 组队的没有师徒关系
		return
	end	
	if tPInfo["istemp"] == 0 then			-- 不能帮临时弟子购买基金
		return
	end
	PlayerIndex = nOldPlayer
	local isExist = 0
	for index, value in tMInfo["prentice"] do
		if value == szPrenticeName then
			isExist = 1
			break
		end
	end
	if isExist == 0 then					-- 不在师父的徒弟列表里捏
		return
	end
	if DelItem(2,1,594,nCount) == 1 then
		BuyLovefund(szPrenticeName, nN)
		WriteLog("[H? th鑞g S? ]: mua hoa h錸g m="..szMasterName.." p="..szPrenticeName.." n="..nN)
	end
end

function get_graduate_item()
	if BigGetItemCount(2,1,590) > 0 then
		Say("<color=green>Qu鑓 T? gi竚 <color>: Ngi  c? m閠 'Xu蕋 s? ti猽' r錳.",0)
		return
	end
	local nTime = CustomDataRead("mp_m_get_graduate_item_time")
	local nNow = GetTime()
	if nTime == nil then
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	else
		local nDiffTime = 3600 - (nNow - nTime)
		if nDiffTime > 0 then		-- 60分钟才能领取一次
			local nMin = floor(nDiffTime / 60)
			local nSec = mod(nDiffTime, 60)
			Say("B筺 c遪 c莕 "..nMin.." Ph髏 "..nSec.."(gi﹜) m韎 頲 l穘h 1 'Xu蕋 s? ti猽'.", 0)
			return
		end
		CustomDataSave("mp_m_get_graduate_item_time", "d", nNow)
	end
		
	
	if AddItem(2,1,590,1,1) == 1 then
		Say("Qu? nhi猲 Danh s? xu蕋 cao , l謓h  ti課 b? r蕋 nhanh. C? 頲 'Xu蕋 s? ti猽', th莥 tr? c飊g nhau s? d鬾g, c? th? k猽 g鋓 Qu鑓 T? gi竚 tu莕 kh秓, tri襲 nh ch? d飊g Xu蕋 s? ti猽  s竧 h筩h, t? i nh b筰 tu莕 kh秓 c? th? xu蕋 s?. Xin ch? ?, chi猽 sau c飊g ph秈 do l謓h  ho祅 th祅h.", 0)
	end
end

function use_point()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "use_point_r2s", 1) == 0 then				-- 先刷新一下数据
		use_point_r2s()
	end
end

function use_point_r2s()
	Say("Ta mu鑞 chuy觧 甶觤 S?  ",
		4,
		"Ta mu鑞 l穘h ph莕 thng tri襲 nh/use_point_award",
		"Ta mu鑞 d飊g S?  ph? ch? chuy觧 甶觤 s?  th祅h ph莕 thng/use_point_award1",
		"Ta mu鑞 ghi l筰 觤 S?  th祅h 觤 s? c/use_point_point",
		"R阨 kh醝/no_say")
end

function use_point_award()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	if nPoint <= 0 then
		Say("C竎 h? hi謓 kh玭g c? 觤 S? , kh玭g th? l穘h thng", 0)
		return
	end
	
	if nCanChangePoint - nChangePoint <= 0 then
		Say("c╪ c? theo ng c蕄 th? nghi謕 , tri襲 nh mi詎 ph? cho b筺<color=yellow>"..nCanChangePoint.."<color>觤 S?  l祄 ph莕 thng. L莕 n祔 b筺  chuy觧 甶觤 mi詎 ph? qu? <color=yellow>"..nChangePoint.."<color> 甶觤 S? , kh玭g 頲 chuy觧 nhi襲 qu?.", 0)
		return
	end
	
	Say("C竎 h? c? <color=yellow>"..nPoint.."<color> 觤 S? , c╪ c? theo ng c蕄 th? nghi謕, tri襲 nh s? chuy觧 mi詎 ph? <color=yellow>"..nCanChangePoint.."<color> 觤 S?  l祄 ph莕 thng. L莕 n祔 ngi  chuy觧 qu? <color=yellow>"..nChangePoint.."<color> 觤 S? , c? th? mi詎 ph? chuy觧 <color=yellow>"..(nCanChangePoint - nChangePoint).."<color> 觤 S? . C? mu鑞 tri襲 nh chuy觧 觤 S?  mi詎 ph? kh玭g?",
		2,
		"в xem c? th? ch鋘 ph莕 thng n祇?/see_award_type",
		"в ta suy ngh?!/no_say"
		)
end

function see_award_type()
	Say("C竎 h? c? th? ch鋘 c竎ph莕 thng b猲 di",
		2,
		--"金钱。每1点师徒点数可换3.8金/#yes_use_point(1)",
		--"声望/#yes_use_point(2)",
		--"师门贡献度/#yes_use_point(3)",
		--"军功。每1点师徒点数可换20点军功/#yes_use_point(4)",
		--"健康经验/#yes_use_point(5)",
		"Kinh nghi謒. M鏸 1 甶觤 S?  c? th? i ng c蕄*ng c蕄*10 kinh nghi謒/#yes_use_point(6)",
		--"健康经验转经验/#yes_use_point(7)",
		"в ta suy ngh?!/no_say")
end

function yes_use_point(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- 军功
		Say("C竎 h? v? m玭 v? ph竔, kh玭g th? i l蕐 chi課 c玭g.", 0)
		return
	end

	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint > nPoint then
		nDiffPoint = nPoint
	end
	AskClientForNumber("yes_use_point_award_cb", 1, nDiffPoint, "Chuy觧 bao nhi猽 觤 S? ?")
	SetTaskTemp(10, nType)
end

function yes_use_point_award_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	SetTaskTemp(10, 0)
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	local nChangePoint = tInfo["changepoint"]
	local nCanChangePoint = tInfo["canchangepoint"]
	local nDiffPoint = nCanChangePoint - nChangePoint
	if nDiffPoint < nCount then
		return
	end
	if nPoint < nCount then
		return
	end
	local nRet = FreeChangeTaskPoint(nCount, nType)
	if nRet == -1 then
		Msg2Player("B筺 kh玭g  觤 S? ")
	elseif nRet == -2 then
		Msg2Player("Tri襲 ёnh kh玭g th? gi髉 b筺 c? th猰 甶觤 S? у")
	end
end

function use_point_award1()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("C竎 h? ch璦 c? 甶觤 S? , kh玭g th? i l蕐 gi秈 thng.", 0)
		return
	end
	
	Say("C竎 h? c? <color=yellow>"..nPoint.."<color>甶觤, m鏸 l莕 i 1 甶觤 S?  ph秈 m蕋 1 S?  ph? ch?. Mu鑞 i kh玭g?",
		2,
		"Ta mu鑞 xem ph莕 thng/see_award_type1",
		"в ta suy ngh?!/no_say"
		)
end

function see_award_type1()
	Say("C竎 h? c? th? ch鋘 c竎ph莕 thng b猲 di",
		4,
		"Kim ti襫. 1 甶觤 S?  i 頲 3.8 lng/#yes_use_point1(1)",
		--"声望/#yes_use_point(2)",
		--"师门贡献度/#yes_use_point(3)",
		"Chi課 c玭g. 1 甶觤 S?  i 頲 20 甶觤 chi課 c玭g/#yes_use_point1(4)",
		--"健康经验/#yes_use_point(5)",
		"Kinh nghi謒. M鏸 1 甶觤 S?  c? th? i ng c蕄*ng c蕄*10 kinh nghi謒/#yes_use_point1(6)",
		--"健康经验转经验/#yes_use_point(7)",
		"в ta suy ngh?!/no_say")
end

function yes_use_point1(nType)
	if nType == 4 and GetPlayerRoute() == 0 then	-- 军功
		Say("C竎 h? v? m玭 v? ph竔, kh玭g th? i l蕐 chi課 c玭g.", 0)
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	AskClientForNumber("yes_use_point_award1_cb", 1, nPoint, "фi bao nhi猽 觤 S? ?")
	SetTaskTemp(10, nType)
end

function yes_use_point_award1_cb(nCount)
	local nType = GetTaskTemp(10)
	if not (nType == 1 or nType == 4 or nType == 6) then
		return
	end
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint < nCount then
		return
	end
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("S?  ph? ch? kh玭g   i nhi襲 ph莕 thng nh? th?, chu萵 b? S?  ph? ch? kh竎, c? th? mua ? Ng? c竎.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		local nRet = ChangeTaskPoint(nCount, nType)
		if nRet == -1 then
			Msg2Player("B筺 kh玭g  觤 S? ")
			AddItem(tItem[1],tItem[2],tItem[3],nCount,1)	-- 把没有成功兑换的师徒符纸还给玩家
		end
	end
end

function use_point_point()
	local tInfo = GetMPBaseInfo()
	local nPoint = tInfo["taskpoint"]
	if nPoint <= 0 then
		Say("C竎 h? ch璦 c? 甶觤 S? , kh玭g th? ghi l筰 觤 S? c", 0)
		return
	end
	
	Say("Ghi 觤 s? c th祅h 觤 S?  ph秈 m蕋 S?  ph? ch?, m鏸 <color=yellow>1<color> 觤 s? c c莕 <color=yellow>1<color> S?  ph? ch?. 觤 S?  hi謓 t筰 l? <color=yellow>"..nPoint.."<color> 甶觤, mu鑞 ghi 觤 s? c kh玭g?",
		2,
		"Mu鑞 ch?/#yes_use_point_point("..nPoint..")",
		"в ta suy ngh?!/no_say")
end

function yes_use_point_point(nPoint)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < 1 then
		Say("C竎 h? ch璦 c? S?  ph? ch?, chu萵 b? m閠 s? S?  ph? ch? 甧m n, c? th? mua ? Ng? c竎.",0)
		return
	end
	AskClientForNumber("yes_use_point_point_cb", 1, nPoint, "Ghi bao nhi猽 觤 s? c?")
end

function yes_use_point_point_cb(nCount)
	if GetItemCount(tItem[1],tItem[2],tItem[3]) < nCount then
		Say("S?  ph? ch? kh玭g   ghi nhi襲 甶觤 s? c nh? th?, chu萵 b? m閠 s? S?  ph? ch? 甧m n, c? th? mua ? Ng? c竎.",0)
		return
	end
	if DelItem(tItem[1],tItem[2],tItem[3],nCount) == 1 then
		ChangeTaskPoint(nCount, 0)
	end
end

t_specail_item =
{
	{2,1,2000,"L璾 Tinh l?"," T╪g 100 甶觤 khi Linh th筩h h頿 th祅h",1},
	{2,1,2001,"Ng鋍 T髖"," T╪g 200 甶觤 khi Linh th筩h h頿 th祅h",10},
	{2,0,554,"Tu Ch﹏ Y誹 Quy誸"," T╪g 1000 甶觤 tu luy謓",1},
	{2,0,141,"Ti猽 Ki誴 t竛"," T葃 1 甶觤 PK",3},
	{2,1,1091,"C? c秈 V祅g"," chuy觧 v薾",3},
	{2,1,9995,"Gi竛 謕 trang"," фi phe tham gia chi課 trng",3},
	{2,1,1157,"u h錸"," T╪g Tr? s竧 kh?",15},
	{2,1,1103,"Th鵦 chi課 kinh nghi謒 t藀"," V藅 ph萴 c莕 cho ho箃 ng thi luy謓 s? m玭",4},
	{2,0,553,"Чi Nh﹏ s﹎"," T鑓  s鯽 M藅 t辌h t╪g g蕄 4 ",5},
	{2,1,1014,"L鬰 L﹎ Lang Y猲"," K猽 g鋓 B綾 L鬰 L﹎ Minh ch?",15},
	{2,1,1047,"Th駓 Ho祅g B? Chi誹"," K猽 g鋓 Thng Th莕 Doanh Thi猲",15},
	{2,1,1024,"Ng? d鬾g b筩h ng鋍 th筩h"," K猽 g鋓 B? Phi Y猲",15},
	{2,1,1048,"Uy猲 Μng Kim Ti B筩"," K猽 g鋓 L穘h Hng L╪g",20},
	{2,1,1015,"V? L﹎ b? l謓h"," K猽 g鋓 BOSS S? m玭 b蕋 k?",30},
	{2,1,504,"N? Oa Tinh Th筩h"," G? 1 y誹 quy誸 tr猲 trang b? M藅 t辌h",120},
	{2,1,540,"L? rng"," 50 l? kim k誸 h玭",60},
	{2,0,125,"H閕 Minh L謓h B礽"," L藀 bang",150},
	{2,1,1003,"K? L﹏ ho祅"," _Tr猲 c蕄 31 Danh v鋘g ch璦 t 3000 tr鵦 ti誴 th╪g 3000 Danh v鋘g",600},
	{2,1,1002,"Long Huy誸 ho祅"," Ngi th蕄 h琻 c蕄 73 tr鵦 ti誴 t╪g n c蕄 73",1000},
	{2,1,1004,"Ph鬾g Huy誸 ho祅"," Ъng c蕄 72 tr? l猲 tr鵦 ti誴 t 4000 甶觤 c鑞g hi課 s? m玭",1200},
	{2,1,1005,"Chi課 Th莕 ho祅"," Tr鵦 ti誴 th╪g Chi課 c玭g Й th鑞g",1500},
	{0,105,19,"Si猽 Quang"," V躰h c鰑 - 100 con H綾 M?",5000},
	{2,21,2016,"Ph鑙 th筩h c蕄 5 (ngo筰 c玭g)"," _15% V? kh? ngo筰 c玭g",2000},
	{2,21,2021,"Ph鑙 th筩h c蕄 5 (n閕 c玭g)"," _15% V? kh? n閕 c玭g",2000},
	{2,21,2117,"Ph鑙 th筩h c蕄 5 (t鑓  xu蕋 chi猽)"," _25% t鑓 ",3000},
	{2,21,2240,"Ph鑙 th筩h c蕄 7 (gi秏 ngo筰 ph遪g)"," _Gi秏 15% v? kh? ngo筰 ph遪g",1000},
	{2,21,2247,"Ph鑙 th筩h c蕄 7 (gi秏 n閕 ph遪g)"," _Gi秏 15% v? kh? n閕 ph遪g",1000},
}

function use_fenglu(nStartIndex)
	local tSay = {}
	local nTabIndex = 1
	if nStartIndex > 6 then
		local n = nStartIndex - 6
		tSay[nTabIndex] = "Trang trc/#use_fenglu("..n..")"
		nTabIndex = nTabIndex + 1
	end
	
	local nEnd = nStartIndex + 5
	if nEnd > getn(t_specail_item) then
		nEnd = getn(t_specail_item)
	end

	for i=nStartIndex, nEnd do
		tSay[nTabIndex] = format("%-20s%s? (c莕 %d B鎛g l閏)/#buy_specail_item(%d)", t_specail_item[i][4],t_specail_item[i][5],t_specail_item[i][6],i)
		nTabIndex = nTabIndex + 1
	end
	
	if nEnd < getn(t_specail_item) then
		tSay[nTabIndex] = "Trang k?/#use_fenglu("..(nEnd + 1)..")"
		nTabIndex = nTabIndex + 1
	end
	tSay[nTabIndex] = "R阨 kh醝/no_say"
	
	Say("V藅 ph萴 hi謓 b竛: <color>", getn(tSay), tSay)
end

function buy_specail_item(nIndex)
	local nMaxCount = GetItemCount(2,1,589)
	if nMaxCount < t_specail_item[nIndex][6] then
		Say("B筺 kh玭g  b鎛g l閏  mua <color=yellow>"..t_specail_item[nIndex][4].."<color>.", 0)
		return
	end
	SetTaskTemp(1, nIndex)
	AskClientForNumber("buy_specail_item_cb", 1, floor(nMaxCount/t_specail_item[nIndex][6]), "Mu鑞 mua bao nhi猽?")
end

function buy_specail_item_cb(nCount)
	if Zgc_pub_goods_add_chk(nCount, nCount) == 0 then
		return
	end
	local nIndex = GetTaskTemp(1)
	if DelItem(2,1,589,nCount * t_specail_item[nIndex][6]) == 1 then
		if nIndex == 22 then
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount,1,-1,-1,-1,-1,-1,-1)
		else
			AddItem(t_specail_item[nIndex][1], t_specail_item[nIndex][2], t_specail_item[nIndex][3], nCount)
		end
		Msg2Player("B筺  mua "..nCount.."c竔"..t_specail_item[nIndex][4])
		WriteLog("[S? -B鎛g l閏]:"..GetName().."Х mua "..nCount.."c竔"..t_specail_item[nIndex][4])
	end
end

function disband_master()
	Say("H駓 b? ng k? b筺 s? m蕋 th﹏ ph薾 s? ph?, t? b? 甶 b鎛g l閏 ch璦 nh薾, m蕋 甶觤 s? c, ng c蕄 th? nghi謕. C竎 h? mu鑞 h駓 b? kh玭g?",
		2,
		"уng ?/yes_disband_master",
		"H駓 b?/no_say")
end

function yes_disband_master()
	local tInfo = GetMPBaseInfo()
	if tInfo["prentice"] ~= nil then
		Say("C?  t? kh玭g 頲 h駓 b? ng k?.",0)
		return
	end
	DisbandMaster()
end

function create_task()
	if MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)	== 0 then			-- 先刷新一下数据
		create_task_r2s()
	end
end

function create_task_r2s()
	local tInfo = GetMPBaseInfo()
	if tInfo["ismaster"] == 0 then
		return
	end
	
	local ltime = tInfo["taskinterval"]
	if ltime > 0 then
		local nHour = floor(ltime / 3600)
		ltime = mod(ltime, 3600)
		local nMin = floor(ltime / 60)
		local nSec = mod(ltime, 60)
		Say("B筺  c玭g b? Nhi謒 v? S?  1 l莕 r錳, kho秐g c竎h th阨 gian c玭g b? Nhi謒 v? S?  l莕 sau l?: <color=yellow>"..nHour..":"..nMin..":"..nSec, 0)
	else
		Say("B筺 c? th? ch鋘 Nhi謒 v? S?  b猲 di  c玭g b?",
			8,
			"Ho祅 th祅h nhi謒 v? s? m玭 s? c蕄 2 l莕 ho芻 ho祅 th祅h nhi謒 v? thng h閕 20 l莕, ph莕 thng  : 15 甶觤 c鑞g hi課 s? m玭/#ask_create_task(1)",
			"Ho祅 th祅h Nhi謒 v? s竧 th? 5 l莕 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : 50 甶觤 Danh v鋘g/#ask_create_task(2)",
			"Цnh xong 1 tr薾 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : 150 甶觤 chi課 c玭g/#ask_create_task(3)",
			"Qua 頲 2 秈 c馻 T祅g Ki誱 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*110)/#ask_create_task(4)",
			"Th竔 H? qua 4 qu竔 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*120)/#ask_create_task(5)",
			"Th鵦 hi謓 Long chu 4 l莕 ho芻 ho祅 th祅hNhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*110)/#ask_create_task(6)",
			"Tham gia L玦 i n u 5 l莕 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*100)/#ask_create_task(7)",
			"Gi? ch璦 mu鑞 c玭g b? nhi謒 v?/no_say")
	end
end

function ask_create_task(nType)
	local strConfirm
	if nType == 1 then
		strConfirm = "Nhi謒 v? S?  s緋 c玭g b? l莕 n祔 l?: ho祅 th祅h nhi謒 v? s? m玭 s? c蕄 2 l莕 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : 15 甶觤 c鑞g hi課 s? m玭."
	elseif nType == 2 then
		strConfirm = "Nhi謒 v? s?  s緋 c玭g b? l莕 n祔 l?: ho祅 th祅h Nhi謒 v? s竧 th? 5 l莕 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : 50 甶觤 Danh v鋘g."
	elseif nType == 3 then
		strConfirm = "Nhi謒 v? s?  s緋 c玭g b? l莕 n祔 l?: nh xong 1 tr薾 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : 150 di觤 chi課 c玭g."
	elseif nType == 4 then
		strConfirm = "Nhi謒 v? s?  s緋 c玭g b? l莕 n祔 l?: qua 頲 2 秈 T祅g Ki誱 ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*110)"
	elseif nType == 5 then
		strConfirm = "Nhi謒 v? s?  s緋 c玭g b? l莕 n祔 l?: qua 頲 4 秈 Th竔 H? ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*120)."
	elseif nType == 6 then
		strConfirm = "Nhi謒 v? s?  s緋 c玭g b? l莕 n祔 l?: 畊a 4 cu閏 thuy襫 R錸g ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*110)."
	elseif nType == 7 then
		strConfirm = "Nhi謒 v? s?  s緋 c玭g b? l莕 n祔 l?: thi 5 l莕 L玦 i n u ho芻 ho祅 th祅h Nhi謒 v? thng h閕 20 l莕, ph莕 thng  : kinh nghi謒 (ng c蕄*ng c蕄*100)."
	end
	Say(strConfirm.."X竎 nh薾 c玭g b??",2, "уng ?/#yes_create_task("..nType..")", "Gi? ch璦 mu鑞 c玭g b? nhi謒 v?/no_say")
end

function yes_create_task(nType)
	MasterCreateTask(nType)
	Say("c玭g b? nhi謒 v? th祅h c玭g, th玭g b竜 cho  t? bi誸, nh蕄 v祇 n髏 'nh薾 nhi謒 v?' tr猲 b秐g s?   ti誴 nh薾 Nhi謒 v? S?  n祔.", 0)
end

function no_say()
end
