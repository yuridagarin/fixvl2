-- 越野赛介绍NPC
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\online\\crosscountry\\quarter_final.lua")

YY_FILE = new(KTabFile, "\\script\\online\\crosscountry\\intro_setting.txt")

-- 检测账号是否为4天前创建的，2006年内有效
function chktime()
	-- Time in seconds since UTC 1/1/70
	local nBaseTimeGmt = 1150387200			-- 2006.6.16 00:00:00
	
	--nBaseTimeGmt的月日时分秒
	local nBaseDay = 167					-- 2006.6.16 日是一年中的第167天
	
	local nCurDay = tonumber(date("%j"))
	local nCurHour = tonumber(date("%H"))
	local nCurMin = tonumber(date("%M"))
	local nCurSec = tonumber(date("%S"))
	
	-- 计算现在和 nBaseTimeGmt 之间差了多少秒
	local nDeffNowSec = nCurSec + nCurMin * 60 + nCurHour * 3600 + (nCurDay - nBaseDay) * 86400
	local n4DaySec = 345600					-- 4天有多少秒
	
	local nCreateTime = GetCreateTime()
	-- 计算创建账号的时间和BaseTimtGmt差了多少秒
	local nDeffCreateSec = nCreateTime - nBaseTimeGmt
	
	if nDeffNowSec - nDeffCreateSec > n4DaySec then
		return 1
	else
		return 0
	end
end

function main()
	if YY_FILE:getRow() > 0 then
		main_yes()
	else
		main_no()
	end
end

function main_yes()		-- 是越野赛的区服
	local szSay = "Tr薾 b竛 k誸 thi u Vi謙 D?  k誸 th骳<color=yellow><color>. Chung k誸 s? di詎 ra v祇 tr璦 28/7 sau khi server b秓 tr? n khi server thi u b総 u, k衞 d礽 n 30/7 trc khi server thi u b秓 tr?. Chi ti誸 xin xem trang ch?"
	Say(szSay, 0)
--	local t = 
--	{
--		--"了解预赛详细情况/game_info_yu",
--		"了解超级玩家越野赛/game_info_yes",
--		"领取越野赛预赛奖励/get_award_yu",
--		"复赛战队相关操作/qf_team_operation",
--		"领取复赛鼓励品并汇总复赛积分/qf_get_award",
--		"查看战队排行/qf_rank",
--		--"复赛积分汇总/quarter_final_point_collect",
--		"离开/end_say",
--	}
--	Say(szSay, getn(t), t)
end

function game_info_yes()	--该区服为越野赛开赛区服
	local szSay = "Thi u Vi謙 d? si猽 c蕄<color=yellow>Hi謓 t筰  v祇 v遪g u lo筰<color>, nh蕁 v祇 c竎 h筺g m鬰 di y  xem chng tr譶h thi u, chi ti誸 xin xem trang ch?"
	local t=
	{
		"Giai 畂筺 1: b竜 danh/sign_info",
		"\nGiai 畂筺 2: v遪g lo筰\n\n/game_info_yu",
		"Giai 畂筺 3: B竛 k誸/game_info2",
		"Giai 畂筺 4: chung k誸/game_info3",
		"Tin t鴆 kh竎./game_info4",
		"R阨 kh醝/end_say",
	}
	Say(szSay, getn(t), t)
end

function game_info_yu()
	local szSay = "Th阨 gian thi u: sau t b秓 tr?, ngi ch琲 h穣 ng nh藀 v祇 server ch? nh ti課 h祅h thi u k衞 d礽 n trc t b秓 tr? l莕 sau\n 襲 ki謓 tham d?: t蕋 c? ngi ch琲 nh薾 頲 t礽 kho秐 thi u v? 甶襫 y  nh鱪g th玭g tin c? nh﹏ \nH譶h th鴆 b竜 danh: a. nh薾 l蕐 t礽 kho秐 thi u t? c竎 ti謒 net, c竎 trng i h鋍, c竎 chi nh竛h c馻 VNG b.v祇 trang web ch輓h th鴆 nh薾 l蕐 t礽 kho秐 thi u \n H譶h th鴆 thi u: t╪g c蕄 \n Ch? ?: ngi ch琲 tham gia thi u kh玭g ph秈 ? c竎 server ch? nh th? s? kh玭g 頲 t輓h.\n b秐 update tr? ch琲: ph秈 l? b秐 m韎 nh蕋\n khu v鵦 tham gia: b蕋 c? n琲 n祇 (ti謒 net, trng i h鋍, gia nh vv...)"
	Say(szSay, 2, "Ti誴 t鬰 t譵 hi觰 (server ch? nh)/game_info_yu_svr", "R阨 kh醝/end_say")
end

function game_info_yu_svr()
	local szSay = "C鬽 server 謓 T輓 tr薾 1: V﹏ Nam, Qu? Ch﹗, T? Xuy猲, T﹜ T筺g, Thi觤 T﹜, Cam T骳, T﹏ Cng\n C鬽 server 謓 T輓 tr薾 2: H? B綾, Giang T﹜, Chi誸 Giang, Thng H秈, Giang T?, An Huy \n C鬽 server 謓 T輓 tr薾 3: H? Nam, Ph骳 Ki課, Qu秐g Йng, Qu秐g T﹜, H秈 Nam\n\n C鬽 server vi詎 th玭g tr薾 1: B綾 Kinh, Thi猲 T﹏, S琻 T﹜, S琻 Йng, T﹏ Cng, H? Nam, H? B綾\n C鬽 server Vi詎 Th玭g tr薾 2: Li猽 Ninh, C竧 L﹎, H綾 Long Giang, N閕 M玭g, Thanh H秈."
	Say(szSay, 2, "Ti誴 t鬰 t譵 hi觰 quy t綾./game_info_yu_guize", "R阨 kh醝/end_say")
end

function game_info_yu_guize()
	local szSay = "1. Nghi猰 c蕀 s? d鬾g auto ho芻 l頸 d鬾g l鏸 game (BUG), n誹 ph竧 hi謓 s? h駓 b? t? c竎h thi u\n2. Sau khi thi u k誸 th骳, ch髇g t玦 s? ch鋘 ra nh鱪g nh﹏ v藅 c? ng c蕄 cao nh蕋 trong server thi u  trao thng (v? d?: m閠 t礽 kho秐 c? 3 nh﹏ v藅 c蕄 12, c蕄 60, c蕄 47, ch髇g t玦 s? ch鋘 nh﹏ v藅 c蕄 60 ti課 h祅h x誴 h筺g)\n3.Sau khi server thi u m? ra, ngi ch琲 ph秈 t? t筼 nh﹏ v藅 m韎, t猲, ch鋘 h譶h tng, m玭 ph竔\n4.Trong khi thi u, c? th? nh? ngi kh竎 tr? gi髉\n5.M鑓 ng c蕄 l? 30\n6. Ng祔 cu閏 thi t╪g c蕄 k誸 th骳 s? chi誹 theo ng c蕄 nh﹏ v藅 h玬  ti課 h祅h x衪 ch鋘 qu竛 qu﹏ m玭 ph竔 v? t鎛g qu竛 qu﹏ cho v遪g lo筰 (n誹 ng c蕄 b籲g nhau s? so s竛h tr? kinh nghi謒, n誹 v蒼 b籲g nhau s? so s竛h 甶觤 danh v鋘g)"
	Say(szSay, 2, "Tra xem ph莕 thng./game_info_yu_award", "R阨 kh醝/end_say")
end

function game_info_yu_award()
	local szSay = "1. B蕋 k? nh﹏ v藅 n祇 trong t礽 kho秐 thi u t n c蕄 30 v? th阨 gian t筼 nh﹏ v藅 輙 nh蕋 4 ng祔, u c? th? nh薾 l蕐 ph莕 thng: (1)1 ng鵤 h錸g m? hay ho祅g m? c蕄 30; (2)1 trang b? s? m玭 c蕄 40; (3) th? luy謓 qu? t? 1- 3 vi猲 ; (4) 5 Thi猲 th筩h. Th阨 gian nh薾 thng: t? v遪g lo筰 ng祔 16/06 n tr薾 b竛 k誸 ng祔 25/07, a 甶觤 nh薾 thng: S? gi? vi謙 d? ? ba i th祅h th轡n2.Gi秈 nh蕋 gi祅h cho ngi ch琲 t ng c蕄 cao nh蕋 c馻 7 m玭 ph竔 t蕋 c? server thi u l? 1 MP3 tr? gi? 500 NDT\n3.T鎛g qu竛 qu﹏ to祅 server thi u l? 1 b? card m祅 h譶h tr? gi? 1000 NDT\nKh玭g th? nh薾 c飊g l骳 2,3 gi秈 thng."
	Say(szSay, 2, "tr? l筰/game_info_yes", "R阨 kh醝/end_say")
end

function get_award_yu()
	local nRoute = GetPlayerRoute()
	if GetLevel() < 30 then
		Talk(1, "", "Xin l鏸, nh﹏ v藅 tr猲 30 c蕄 m韎 c? th? nh薾 thng.")
		return
	elseif nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or
		nRoute == 13 or nRoute == 16 or nRoute == 19 or nRoute > 21 then
		Talk(1,"","Xin l鏸, h穣 gia nh藀 trng ph竔 r錳 quay l筰 nh薾 thng.")
		return 0
	elseif chktime() == 0 then
		Talk(1, "", "Xin l鏸, th阨 gian t筼 nh﹏ v藅 輙 nh蕋 4 ng祔 m韎 c? th? nh薾 l蕐 ph莕 thng")
		return
	elseif GetTask(1785) == 1 then
		Talk(1, "", "B筺  nh薾 ph莕 thng n祔 r錳.")
		return
	elseif GetTask(1785) == 0 then
		Talk(1, "", "Xin l鏸, ch? c? ngi ch琲 t 甶襲 ki謓 nh薾 thng ? v遪g lo筰 v? ch璦 nh薾 m韎 c? th? nh薾 thng.")
		return
	elseif GetTask(1785) == 2 then
		Say("Ph莕 thng v遪g lo筰 bao g錷:\n(1)1 con ng鵤 h錸g m? hay ho祅g m? c蕄 30\n(2)1 trang b? s? m玭 c蕄 40\n(3) th? luy謓 qu? t? 1 - 3 vi猲\n(4) 5 mi課g Thi猲 th筩h\n\n<color=yellow>Khi nh薾 thng, h穣 s緋 x誴 h祅h trang l筰<color>", 2, "Nh薾 l蕐 ph莕 thng./get_award_yu_yes", "Th玦! L莕 sau 甶!/end_say")
	end
end

function get_award_yu_yes()
	if chktime() == 0 or GetTask(1785) ~= 2 or GetLevel() < 30 then
		return
	end
	SetTask(1785, 1)

	local nRet = 0
	if random(10000) >= 5000 then
		nRet = AddItem(0, 105, 1, 1, 1, -1, -1, -1, -1, -1, -1)		--红
	else
		nRet = AddItem(0, 105, 2, 1, 1, -1, -1, -1, -1, -1, -1)		--黄
	end
	if nRet ~= 1 then
		WriteLog("[Thi u vi謙 d穄l鏸: ng鵤 c蕄 30 v蒼 ch璦 ph﹏ ph竧;"..GetAccount().." : "..GetName())
	end
	-- 给新手套装
	local nType = random(1, 3)			-- 给武器/裤子/帽子/衣服
	if nType == 1 then
		nRet = GiveWeapon()
	else
		nRet = GiveEquip(nType)
	end
	if nRet ~= 1 then
		WriteLog("[Thi u vi謙 d穄l鏸: Trang b? s? m玭 v蒼 ch璦 ph﹏ ph竧;"..GetAccount().." : "..GetName())
	end
	
	local nCount = mod(random(1, 100000), 3) + 1
	nRet = AddItem(2, 0, 392, nCount, 1)
	if nRet ~= 1 then
		WriteLog("[Thi u vi謙 d穄l鏸: Th? luy謓 qu? v蒼 ch璦 ph﹏ ph竧;"..GetAccount().." : "..GetName())
	end
	
	nRet = AddItem(2, 2, 8, 5, 1)
	if nRet ~= 1 then
		WriteLog("[Thi u vi謙 d穄l鏸: Thi猲 th筩h v蒼 ch璦 ph﹏ ph竧;"..GetAccount().." : "..GetName())
	end
end

function GiveWeapon()
	local nBody = GetBody()
    local nRoute = GetPlayerRoute()
	local nRet = 0
	local nRetEx = 1

	if nRoute == 2 then
		nRet = AddItem(0, 3, 201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
		nRetEx = AddItem(0, 5, 201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 3 then
		nRet = AddItem(0, 8, 301 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 4 then
		nRet = AddItem(0, 0, 401 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 6 then
		nRet = AddItem(0, 1, 601 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 8 then
		nRet = AddItem(0, 2, 801 + nBody - 3, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 9 then
		nRet = AddItem(0, 10, 901 + nBody - 3, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 11 then
		nRet = AddItem(0, 0, 1101 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 12 then
		nRet = AddItem(0, 5, 1201 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 14 then
		nRet = AddItem(0, 2, 1401 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 15 then
		nRet = AddItem(0, 9, 1501 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 17 then
		nRet = AddItem(0, 6, 1701 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 18 then
		nRet = AddItem(0, 4, 1801 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 20 then
		nRet = AddItem(0, 7, 2001 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	elseif nRoute == 21 then
		nRet = AddItem(0, 11, 2101 + nBody - 1, 1, 1, -1,-1,-1,-1,-1,-1)
	end
	
	if nRet == 1 and nRetEx == 1 then
		Msg2Player("B筺 nh薾 頲 1 m鉵 v? kh?.")
		return 1
	else
		return 0
	end
end

function GiveEquip(nType)
	local nBody = GetBody()
    local nRoute = GetPlayerRoute()
	local nRet = 0
	--裤子/帽子/衣服
	local tType =
	{
		[2] = 101,
		[3] = 103,
		[4] = 100,
	}
	local nParticular = 0
	if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or
		nRoute == 13 or nRoute == 16 or nRoute == 19 or nRoute > 21 then
		return 0
	elseif nRoute == 8 or nRoute == 9 then
		nParticular = nRoute * 100 + nBody - 2
	else
		nParticular = nRoute * 100 + nBody
	end
	
	nRet = AddItem(0, tType[nType], nParticular, 1, 1, -1,-1,-1,-1,-1,-1)
	if nRet == 1 then
		Msg2Player("B筺 nh薾 頲 1 m鉵 trang b?.")
		return 1
	else
		return 0
	end
end


-------------------------------------------------------------------------------------------


function main_no()		-- 不是越野赛的区服
	local szSay = "Cu閏 thi Vi謙 d? vi謙 v? hi謕 2007  ch輓h th鴆 kh雐 ng!"
	local t =
	{
		"T譵 hi觰 cu閏 thi t╪g c蕄./game_info",
		"R阨 kh醝/end_say",
	}
	Say(szSay, getn(t), t)
end

function game_info()

	local szSay = "Cu閏 thi Vi謙 d? vi謙 v? hi謕 2007  ch輓h th鴆 kh雐 ng!"
	local t=
	{
		"Giai 畂筺 1: b竜 danh/sign_info",
		"\nGiai 畂筺 2: v遪g lo筰\n\n/game_info1",
		"Giai 畂筺 3: B竛 k誸/game_info2",
		"Giai 畂筺 4: chung k誸/game_info3",
		"Tin t鴆 kh竎./game_info4",
		"R阨 kh醝/end_say"
	}
	Say(szSay, getn(t), t)
end

function sign_info()
	Say("Cu閏 thi Vi謙 d? vi謙 v? hi謕 2007  ch輓h th鴆 kh雐 ng!", 2, "tr? l筰/game_info", "R阨 kh醝/end_say")
end

function game_info1()
	Say("Cu閏 thi Vi謙 d? vi謙 v? hi謕 2007  ch輓h th鴆 kh雐 ng!", 2, "tr? l筰/game_info", "R阨 kh醝/end_say")
end

function game_info2()
	Say("Cu閏 thi Vi謙 d? vi謙 v? hi謕 2007  ch輓h th鴆 kh雐 ng!", 2, "tr? l筰/game_info", "R阨 kh醝/end_say")
end

function game_info3()
	Say("Cu閏 thi Vi謙 d? vi謙 v? hi謕 2007  ch輓h th鴆 kh雐 ng!", 2, "tr? l筰/game_info", "R阨 kh醝/end_say")
end

function game_info4()
	Say("C竎 c鬽 server thi u v遪g lo筰, v遪g b竛 k誸 cu閏 thi t╪g c蕄 c騨g cho nh鱪g ngi ch琲 b譶h thng t筼 nh﹏ v藅, sau khi cu閏 thi k誸 th骳 c竎 server thi u s? v薾 h祅h b譶h thng nh? c竎 server c?. Sau khi thi u k誸 th骳, t蕋 c? tin t鴆 c馻 ngi ch琲 thi u s? 頲 b秓 l璾 tr筺g th竔, ngi ch琲 c? th? ti誴 t鬰 s? d鬾g t礽 kho秐 n祔  ng nh藀 v祇 tr? ch琲.", 2, "tr? l筰/game_info", "R阨 kh醝/end_say")
end

function end_say()

end
