Include("\\script\\task\\plant_tuoguan\\head.lua");
-- 召唤雇佣采集队的东东

USE_SHENNONG_NUMBER = 100

GOLD_PER_8_HOUR = 4

function GetPlayerSex()
	if GetSex() == 1 then
		return "Thi誹 hi謕"
	else
		return "N? hi謕 "
	end
end

function OnUse()

	local nNpcCount = GetNpcCountNear()
	if nNpcCount > 100 then
		Say("Bi觧 ngi ng ngh辴, bi誸 t譵 ? u y"..GetPlayerSex().."дn n琲 kh竎 thu th藀 nh?!", 0)
		return
	end

	Say("Ngo礽 vi謈 d飊g Th莕 N玭g Кn  駓 th竎 thu th藀, Thi誹 hi謕 c遪 c? th? 駓 th竎 tr錸g c﹜ B竧 Nh? l韓 t筰 y. Xem th猰 th玭g tin b猲 di",
		3,
		"駓 th竎 thu th藀 b籲g Th莕 N玭g Кn/use_shennong",
		"駓 th竎 tr錸g c﹜ B竧 Nh? l韓/tuoguan_zhongshu",
		"K誸 th骳 i tho筰/end_say");
end

function use_shennong()
	Say("Xin h醝 "..GetPlayerSex().."c莕 d飊g m蕐 vi猲 Th莕 N玭g n  駓 th竎 thu th藀?",
		4,
		"D飊g 1 Th莕 N玭g n--nh薾 頲 8 gi? 駓 th竎 thu th藀 (thu ph? "..GOLD_PER_8_HOUR.." v祅g)/#yes_use(1)",
		"D飊g 2 Th莕 N玭g n--nh薾 頲 16 gi? 駓 th竎 thu th藀 (thu ph? "..(GOLD_PER_8_HOUR * 2).." v祅g)/#yes_use(2)",
		"D飊g 3 Th莕 N玭g n--nh薾 頲 24 gi? 駓 th竎 thu th藀 (thu ph? "..(GOLD_PER_8_HOUR * 3).." v祅g)/#yes_use(3)",
		"Kh玭g s? d鬾g 駓 th竎 thu th藀/end_say")
end

function tuoguan_zhongshu()
	Say("Xin h醝 "..GetPlayerSex().."L祄 th? n祇 tr錸g 頲 c﹜ b竧 nh? l韓?",
		6,
		"T筰 h? c莕 駓 th竎 ngi ? < c鬽 TP H? Ch? Minh 1> tr錸g c﹜ gi髉 (ti襫 c玭g 20 v祅g v? 7 l? th駓)/#plant_tuoguan(1, 20, 1)",
		"T筰 h? c莕 駓 th竎 ngi ? < c鬽 TP H? Ch? Minh 2> tr錸g c﹜ gi髉 (ti襫 c玭g 20 v祅g v? 7 l? th駓)/#plant_tuoguan(1, 20, 2)",
		"T筰 h? c莕 駓 th竎 ngi ? < c鬽 TP H? Ch? Minh 3> tr錸g c﹜ gi髉 (ti襫 c玭g 18 v祅g v? 7 l? th駓)/#plant_tuoguan(1, 18, 3)",
		"T筰 h? c莕 駓 th竎 ngi ? < c鬽 H? N閕 1> tr錸g c﹜ gi髉 (ti襫 c玭g 20 v祅g v? 7 l? th駓)/#plant_tuoguan(1, 20, 4)",
		"T筰 h? c莕 駓 th竎 ngi ? < c鬽 H? N閕 2> tr錸g c﹜ gi髉 (ti襫 c玭g 18 v祅g v? 7 l? th駓)/#plant_tuoguan(1, 18, 5)",
		"Ch璦 mu鑞 駓 th竎 tr錸g c﹜ B竧 Nh?./end_say")
end

function yes_use(nCount)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh玭g  Th莕 N玭g n, kh玭g th? 駓 th竎 thu th藀.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh玭g  ti襫 thu? i nh﹏ c玭g thu th藀.", 0)
		return
	end
	
	SetTaskTemp(USE_SHENNONG_NUMBER, nCount)
	
	local tSkillList = GetUseableGatherSkillList()
	if tSkillList == nil then
		Say("Kh玭g th? thu? nh﹏ c玭g 駓 th竎 thu th藀 trong khu v鵦 n祔.", 0)
		return
	end
	
	local tSay = {}
	if getn(tSkillList) == 0 then
		Say("B筺 kh玭g th? d飊g k? n╪g thu th藀 trong khu v鵦 n祔.", 0)
		return
	end
	
	if getn(tSkillList) > 1 then
		for index, value in tSkillList do
			tSay[index] = value[2].."/#sel_skill("..value[1]..")"
		end
		Say("Tr猲 n骾 n祔 s秐 v藅 phong ph?, ch糿g hay"..GetPlayerSex().."Kh竎 quan c莕 g??", getn(tSay), tSay)
	elseif getn(tSkillList) == 1 then
		sel_skill(tSkillList[1][1])
	end
end

function sel_skill(nSkillID)
	local nFreeCount, nSameTypeFreeCount = GetFreeTishenGather(nSkillID)
	
	if nFreeCount == 0 then
		Say("Ch糿g ph秈 kh玭g mu鑞 l蕐 ti襫 c馻 ch? nh﹏, th鵦 ra l? kh玭g c? ngi l祄!\n<color=red>(чi ng? nh﹏ c玭g b筺 thu?  t m鴆 t鑙 產: 6 i.)<color>", 0)
		return
	elseif nSameTypeFreeCount == 0 then
		Say("Ch糿g ph秈 kh玭g mu鑞 l蕐 ti襫 c馻 ch? nh﹏, th鵦 ra l? kh玭g c? ngi l祄!\n<color=red>(B筺  thu? hai i c飊g ti課 h祅h thu th藀 lo筰 n祔.)<color>", 0)
		return
	end
	
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("K? n╪g thu th藀 c馻 b筺 qu? th蕄, kh玭g th? thu th藀 ? khu v鵦 n祔!", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "Trang k?/#next_page("..nSkillID..")"
			break
		end
		-- 特例处理啊,来不及了!
		local nSss = strfind(t[i][1], "V? ng ph? th筩h")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."Ph? th筩h c馻 c竎 m玭 ph竔"
		else
			nSss = strfind(t[i][1], "Bi謓 Kinh ph? th筩h")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."Ph? th筩h c竎 th祅h th?"
			else
				s123 = t[i][1]
			end
		end
				
		tSay[i] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
	end
	
	if getn(tSay) == 0 then
		Say("C竔 g? c騨g kh玭g c? v藋!", 0)
		return
	end
	
	tSay[getn(tSay)+1] = "Ta ch璦 mu鑞 thu th藀/end_say"
	
	Say("!!"..GetPlayerSex().." c莕 thu th藀 lo筰 v藅 ph萴 n祇?", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("K? n╪g thu th藀 c馻 b筺 qu? th蕄, kh玭g th? thu th藀 ? khu v鵦 n祔!", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		-- 特例处理啊,来不及了!
		local nSss = strfind(t[i][1], "V? ng ph? th筩h")
		local s123 = ""
		if nSss ~= nil then
			s123 = strsub(t[i][1], 1, nSss - 1).."Ph? th筩h c馻 c竎 m玭 ph竔"
		else
			nSss = strfind(t[i][1], "Bi謓 Kinh ph? th筩h")
			if nSss ~= nil then
				s123 = strsub(t[i][1], 1, nSss - 1).."Ph? th筩h c竎 th祅h th?"
			else
				s123 = t[i][1]
			end
		end

		tSay[nIndex] = s123.."/#sel_item("..format("%q", s123)..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	if getn(tSay) == 0 then
		Say("C竔 g? c騨g kh玭g c? v藋!", 0)
		return
	end
	
	tSay[nIndex] = "Trang trc/#sel_skill("..nSkillID..")"
	tSay[nIndex+1] = "Ta ch璦 mu鑞 thu th藀/end_say"
	
	Say("!!"..GetPlayerSex().." c莕 thu th藀 lo筰 v藅 ph萴 n祇?", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)
	
	Say("!!"..GetPlayerSex().."X竎 nh薾 mu鑞 thu th藀 <color=yellow>"..szItem.."<color> ch??",
		2,
		"ng/#start_gather("..nMapLevel..","..nSkillID..")",
		"Sai/end_say")
end

function start_gather(nMapLevel, nSkillID)
	local nCount = GetTaskTemp(USE_SHENNONG_NUMBER)
	
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh玭g  Th莕 N玭g n, kh玭g th? 駓 th竎 thu th藀.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh玭g  ti襫 thu? i nh﹏ c玭g thu th藀.", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,509,1) == 1 and DelItem(2,1,343,nCount) == 1 then
		--Msg2Player(nGerne, nDetail, nParticular)
		local nMaxTime = 8 * 3600
		StartTishenGather(nMapLevel, nSkillID, nMaxTime * nCount)
		
		local szSkillName = GetGatherSkillName(nSkillID)
		local szNpcName = GetName().."-"..szSkillName.."ti觰 i"
		local szNpcMode = szSkillName
		if szNpcMode == "Canh t竎" then
			szNpcMode = "Thu ho筩h"
		end
		-- createnpc
		local nMapID, nX, nY = GetWorldPos()
		local nIndex = CreateNpc(szNpcMode, szNpcName, nMapID, nX, nY, 7, 1, 1)
		SetNpcDir(nIndex, random(63))
		SetNpcLifeTime(nIndex, nMaxTime * nCount)
	else
		Say(GetPlayerSex().."Kh玭g c? Kh? c th?, kh玭g th? 駓 th竎 thu th藀.", 0)
	end
end

function end_say()

end
