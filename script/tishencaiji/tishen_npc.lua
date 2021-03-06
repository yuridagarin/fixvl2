-- 采集代理人  npc
-- 2006-8-21 12:12
Include("\\script\\voz\\xacthuc\\xacthuc.lua");
TISHEN_INDEX_ID = 100
TISHEN_ITEM_VALUE = 101

MAX_PAGE_ITEM_COUNT = 5
GOLD_PER_8_HOUR = 4
MAX_TISHEN_COUNT = 20

function GetPlayerSex()
	if GetSex() == 1 then
		return "Thi誹 hi謕"
	else
		return "N? hi謕 "
	end
end

function main()
	local szSay = 
	{
		"Xem th? ngi 駓 th竎 thu th藀 頲 bao nhi猽!/see_gather_item",
		"H鋍 t藀 t? ngi 駓 th竎 thu th藀/learn_exp",
		"Nh? ngi 駓 th竎 thu th藀 t譵 nguy猲 li謚 kh竎/manage_tishen",
		"чi l祄 thu?, ta ph秈 nh? h? m韎 頲/employ_tishen",
		"T譵 hi觰 ngi 駓 th竎 thu th藀/tishen_shuoming",
		"Kh玭g c? g?!/end_say",
	}
	
	-- 计算获得的物品
	for i = 1, MAX_TISHEN_COUNT do
		CalcTishenGatherData(i)
	end
	
	-- 清空已到最高等级的替身采集经验
	for i = 1, MAX_TISHEN_COUNT do
		local nSkillID = GetTishenGatherSkillID(i)
		local nSkillLevel = GetLifeSkillLevel(0, nSkillID)
		if nSkillLevel >= 99 then		-- 到最高等级了
			AddTishenGatherExp(i)		-- 加不上，但是要清掉
		end
	end
	
	Say("V? "..GetPlayerSex().."C莕 g??", getn(szSay), szSay)	
end

function employ_tishen()

	if CheckXacThuc() == 0 then
		Say("T礽 kho秐 ch璦 x竎 th鵦. Xin th? ch? h穣 d鮪g tay.", 0)
		return
	end
	
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime >= 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- ng thu th藀  : "..szGatherItem.."  C遪  : "..nHour.."h "..nMin.." Ph髏 "..nSec.." Gi﹜ "
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."T?"..szMsg.."/#employ_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."T?"..szMsg.."/#employ_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R阨 kh醝/end_say"
		Say("Kh玭g bi誸!"..GetPlayerSex().."чi n祇 s? thu th藀?", getn(szSay), szSay)
	else
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>:"..GetPlayerSex().."T筰 y kh玭g mn i ng? thu th藀", 0)
	end
end

function employ_tishen_info(nIndex)
	Say("Xin h醝 "..GetPlayerSex().."C莕 駓 th竎 bao l﹗?",
		4,
		"D飊g 1 Th莕 N玭g n--nh薾 頲 8 gi? 駓 th竎 thu th藀 (thu ph? "..GOLD_PER_8_HOUR.." v祅g)/#yes_use(1,"..nIndex..")",
		"D飊g 2 Th莕 N玭g n--nh薾 頲 16 gi? 駓 th竎 thu th藀 (thu ph? "..(GOLD_PER_8_HOUR * 2).." v祅g)/#yes_use(2,"..nIndex..")",
		"D飊g 3 Th莕 N玭g n--nh薾 頲 24 gi? 駓 th竎 thu th藀 (thu ph? "..(GOLD_PER_8_HOUR * 3).." v祅g)/#yes_use(3,"..nIndex..")",
		"в ta xem/main")
end

function yes_use(nCount, nIndex)
	if GetItemCount(2, 1, 343) < nCount then
		Say(GetPlayerSex().."Kh玭g  Th莕 N玭g Кn, kh玭g th? ti誴 t鬰 c玭g vi謈 駓 th竎 thu th藀.", 0)
		return
	end
	
	if GetCash() < GOLD_PER_8_HOUR * 10000 * nCount then
		Say(GetPlayerSex().."Kh玭g  Th莕 N玭g Кn, kh玭g th? ti誴 t鬰 c玭g vi謈 駓 th竎 thu th藀.", 0)
		return
	end

	local szName, nLastTime, szGatherItem = IsTishenGatherExist(nIndex)
	if szName == nil then
		return
	end
	
	local nTime = nCount * 8 * 3600 + nLastTime
	if nTime > 25 * 3600 then
		Say("!!"..GetPlayerSex().."Ngh? ng琲 m閠 l竧. \n<color=red>(Th阨 gian thu? 1 l莕 kh玭g 頲 qu? 25 gi?)", 0)
		return
	end
	
	Pay(GOLD_PER_8_HOUR * 10000 * nCount)
	
	if DelItem(2,1,343,nCount) == 1 then
		AddTishenGatherTime(nIndex, nCount * 8 * 3600)
		Msg2Player("ng thu th藀"..szGatherItem.." s? gi髉 b筺 th猰 ["..(nCount * 8).."] gi?")
	end
end

function manage_tishen()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			if nLastTime > 0 then
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				local szMsg =  " -- ng thu th藀  : "..szGatherItem.."  C遪  : "..nHour.."h "..nMin.." Ph髏 "..nSec.." Gi﹜ "
				if strfind(GetName(), "/") == nil then
					szSay[ntIndex] = GetName().."-"..szName.."T?"..szMsg.."/#manage_tishen_info("..i..")"
				else
					szSay[ntIndex] = szName.."T?"..szMsg.."/#manage_tishen_info("..i..")"
				end
				ntIndex = ntIndex + 1
			end
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R阨 kh醝/end_say"
		Say("Kh玭g bi誸!"..GetPlayerSex().."чi n祇 s? thu th藀?", getn(szSay), szSay)
	else
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>:"..GetPlayerSex().."T筰 y kh玭g mn i ng? thu th藀", 0)
	end
end

function manage_tishen_info(nIndex)
	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	
	local nSkillID = GetTishenGatherSkillID(nIndex)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("B筺 kh玭g c? k? n╪g thu th藀, kh玭g th? thay i!", 0)
		return
	end
	
	local tSay = {}

	for i = 1, getn(t) do
		if i > 6 then
			tSay[i] = "Trang k?/#next_page("..nSkillID..")"
			break
		end
		tSay[i] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
	end
	tSay[getn(tSay)+1] = "Kh玭g mu鑞 thu th藀 nguy猲 li謚 kh竎, gi鑞g ban u l? 頲/end_say"
	Say("!!"..GetPlayerSex().." c莕 thu th藀 lo筰 v藅 ph萴 n祇?", getn(tSay), tSay)
end

function next_page(nSkillID)
	local t = GetCanGatherItemList(nSkillID)
	if t == nil then
		Say("B筺 kh玭g c? k? n╪g thu th藀, kh玭g th? thay i!", 0)
		return
	end
	
	local nIndex = 1
	local tSay = {}
	for i = 7, getn(t) do
		tSay[nIndex] = t[i][1].."/#sel_item("..format("%q", t[i][1])..","..t[i][2]..","..nSkillID..")"
		nIndex = nIndex + 1
	end
	
	local nIndexID = GetTaskTemp(TISHEN_INDEX_ID)
	tSay[nIndex] = "Trang trc/#manage_tishen_info("..nIndexID..")"
	tSay[nIndex+1] = "Kh玭g mu鑞 thu th藀 nguy猲 li謚 kh竎, gi鑞g ban u l? 頲/end_say"
	
	Say("!!"..GetPlayerSex().." c莕 thu th藀 lo筰 v藅 ph萴 n祇?", getn(tSay), tSay)
end

function sel_item(szItem, nMapLevel, nSkillID)

	Say("!!"..GetPlayerSex().."X竎 nh薾 mu鑞 thu th藀 <color=yellow>"..szItem.."<color> ch??",
		2,
		"ng/#change_gather("..nMapLevel..","..nSkillID..",\""..szItem.."\")",
		"Sai/end_say")
end

function change_gather(nMapLevel, nSkillID, szItem)
	local nIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nRet = ChangeTishenGather(nIndex, nMapLevel, nSkillID)
	if nRet > 0 then
		local nActionName = GetGatherSkillName(nSkillID)
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>:"..GetPlayerSex()..", c竔 ngi n祔"..nActionName.."i ng? chuy觧 th祅h thu th藀 <color=yellow>"..szItem.."<color>", 0)
	end
end

function see_gather_item()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem = IsTishenGatherExist(i)
		if szName then
			local szMsg = ""
			if nLastTime <= 0 then
				szMsg = " -- Thu th藀 ho祅 t蕋"
			else
				local nHour = floor(nLastTime / 3600)
				local nMin = floor(mod(nLastTime, 3600) / 60)
				local nSec = mod(nLastTime, 60)
				szMsg =  " -- ng thu th藀  : "..szGatherItem.."  C遪  : "..nHour.."h "..nMin.." Ph髏 "..nSec.." Gi﹜ "
			end
			
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."T?"..szMsg.."/#seeinfo("..i..")"
			else
				szSay[ntIndex] = szName.."T?"..szMsg.."/#seeinfo("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R阨 kh醝/end_say"
		Say("Kh玭g bi誸!"..GetPlayerSex().."nh cho m ngi n祇 甶 thu th藀 v藅 ph萴?", getn(szSay), szSay)
	else
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>:"..GetPlayerSex().."T筰 y kh玭g mn i ng? thu th藀", 0)
	end
end

function seeinfo(nIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	for index, value in t do
		if nCount > MAX_PAGE_ITEM_COUNT then
			szSay[nCount] = "Trang k?/#next_item_page("..nIndex..","..nCount..")"
			break
		end
		-- n = nGenre << 24 | nDetail << 16 | nParticular
		local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		szSay[nCount] = index.."["..(value.nItemCount).."] c竔/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
		nCount = nCount + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "L蕐 t蕋 c? v藅 ph萴 ra/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "R阨 kh醝/end_say"
		Say("Цm ngi n祔 thu th藀 頲 m蕐 v藅 ph萴 sau. <color=yellow>(Trc khi l蕐 v藅 ph萴 xin x竎 nh薾 h祅h trang  kho秐g tr鑞g v? s鴆 l鵦)<color>", getn(szSay), szSay)
	else
		Say("Цm ngi n祔 t筸 th阨 ch璦 thu th藀 頲 v藅 ph萴, m阨 "..GetPlayerSex().."khi kh竎 quay l筰!", 2, "tr? l筰/main", "R阨 kh醝/end_say")
	end
end

function next_item_page(nIndex, nPageIndex)
	local szSay = {}
	
	local t = GetTishenGatherItem(nIndex)
	local nCount = 1
	local nPos = 1
	for index, value in t do
		if nPos >= nPageIndex then
			if nCount > MAX_PAGE_ITEM_COUNT then
				szSay[nCount] = "Trang k?/next_item_page("..nIndex..","..(MAX_PAGE_ITEM_COUNT + nPageIndex)..")"
				break
			end
			-- n = nGenre << 24 | nDetail << 16 | nParticular
			local n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
			szSay[nCount] = index.."["..(value.nItemCount).."] c竔/#ggi("..n..","..(value.nItemCount)..","..nIndex..",\""..index.."\")"
			nCount = nCount + 1
		end
		nPos = nPos + 1
	end
	
	if nCount > 1 then
		szSay[getn(szSay) + 1] = "L蕐 t蕋 c? v藅 ph萴 ra/#get_all_gather_item("..nIndex..")"
		szSay[getn(szSay) + 1] = "R阨 kh醝/end_say"
		Say("Цm ngi n祔 thu th藀 頲 m蕐 v藅 ph萴 sau. <color=yellow>(Trc khi l蕐 v藅 ph萴 xin x竎 nh薾 h祅h trang  kho秐g tr鑞g v? s鴆 l鵦)<color>", getn(szSay), szSay)
	end
end

function get_all_gather_item(nIndex)
	if IsBoxLocking() == 1 then
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>: Rng ch鴄  c馻 ngi  kh鉧, kh玭g th? l蕐 v藅 ph萴 c馻 nh鉳 thu th藀 ra. ",0)
		return
	end

	local n = 0
	local t = GetTishenGatherItem(nIndex)
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		local nRet = UpdateTishenGatherInfo(nIndex, n, value.nItemCount)
		if nRet > 0 then
			local str = format("Chu萵 b? nh薾 (%d,%d,%d) %d",value.nGenre,value.nDetail,value.nParticular,value.nItemCount)
			str = "[駓 th竎 thu th藀]"..GetName()..str
			WriteLog(str)
			if AddItem(value.nGenre, value.nDetail, value.nParticular, value.nItemCount, 1) == 1 then
				WriteLog("[駓 th竎 thu th藀]"..GetName().."Nh薾 v藅 ph萴 th祅h c玭g")
			end
		else
			Msg2Player("H祅h trang v? s鴆 l鵦 c馻 b筺  vt m鴆")
			break
		end
	end
end

--get_gather_item
function ggi(nItem, nMax, nIndex, sz)
	if IsBoxLocking() == 1 then
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>: Rng ch鴄  c馻 ngi  kh鉧, kh玭g th? l蕐 v藅 ph萴 c馻 nh鉳 thu th藀 ra. ",0)
		return
	end

	SetTaskTemp(TISHEN_INDEX_ID, nIndex)
	SetTaskTemp(TISHEN_ITEM_VALUE, nItem)
	
	AskClientForNumber("get_gather_item_callback", 1, tonumber(nMax), "L蕐"..sz);
end

function get_gather_item_callback(nCount)
	local nTishenIndex = GetTaskTemp(TISHEN_INDEX_ID)
	local nItem = GetTaskTemp(TISHEN_ITEM_VALUE)
	if nTishenIndex == 0 or nItem == 0 then
		return
	end
	
	local t = GetTishenGatherItem(nTishenIndex)
	
	local nGatherCount = 0
	local nGenre = 0
	local nDetail = 0
	local nParticular = 0
	
	local n = 0
	for index, value in t do
		n = tonumber(value.nGenre) * 16777216 + tonumber(value.nDetail) * 65536 + tonumber(value.nParticular)
		if n == nItem then
			nGatherCount = value.nItemCount
			nGenre = value.nGenre
			nDetail = value.nDetail
			nParticular = value.nParticular
			break
		end
	end
	
	if nCount > nGatherCount then
		nCount = nGatherCount
	end
	
	if nCount <= 0 then
		return
	end
	
	local nRet = UpdateTishenGatherInfo(nTishenIndex, n, nCount)
	if nRet > 0 then
		local str = format("Chu萵 b? nh薾 (%d,%d,%d) %d",nGenre,nDetail,nParticular,nCount)
		str = "[駓 th竎 thu th藀]"..GetName()..str
		WriteLog(str)
		if AddItem(nGenre, nDetail, nParticular, nCount, 1) == 1 then
			WriteLog("[駓 th竎 thu th藀]"..GetName().."Nh薾 v藅 ph萴 th祅h c玭g")
		end
	else
		Msg2Player("H祅h trang v? s鴆 l鵦 c馻 b筺  vt m鴆")
	end
end

function learn_exp()
	local szSay = {}
	local ntIndex = 1
	for i = 1, MAX_TISHEN_COUNT do
		local szName, nLastTime, szGatherItem, nExp = IsTishenGatherExist(i)
		if szName then
			if strfind(GetName(), "/") == nil then
				szSay[ntIndex] = GetName().."-"..szName.."чi ng?-- nh薾 頲 kinh nghi謒: ["..nExp.."]/#see_exp_info("..i..")"
			else
				szSay[ntIndex] = szName.."чi ng?-- nh薾 頲 kinh nghi謒: ["..nExp.."]/#see_exp_info("..i..")"
			end
			ntIndex = ntIndex + 1
		end
	end
	
	if ntIndex > 1 then
		szSay[getn(szSay) + 1] = "R阨 kh醝/end_say"
		Say("Kh玭g bi誸!"..GetPlayerSex().."nh cho m ngi n祇 甶 thu th藀 kinh nghi謒?", getn(szSay), szSay)
	else
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>:"..GetPlayerSex().."T筰 y kh玭g mn i ng? thu th藀", 0)
	end
end

function see_exp_info(nIndex)
	local szSay = {}
	
	nRet = GetTishenGatherExp(nIndex)
	if nRet == nil then
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>:"..GetPlayerSex().."Kh玭g c? k? n╪g s鑞g, kh玭g th? nh薾 kinh nghi謒 t? nh﹏ c玭g thu th藀.", 0)
		AddTishenGatherExp(nIndex)	-- 没有此生活技能的Add操作为清空此类替身的经验
	elseif nRet > 0 then
		Say("<color=green>Ngi 駓 th竎 thu th藀<color>:"..GetPlayerSex().."C? th? nh薾 "..nRet.." 甶觤 thu th藀 kinh nghi謒. \n<color=red>Ch? ?: Nh鱪g i ng? thu th藀 kh竎 kinh nghi謒 nh薾 頲 s? b? x鉧 b?.<color>", 3, "Nh薾 甶觤/#yes_get_exp("..nIndex..")", "Xem nh鱪g i ng? kh竎/learn_exp", "R阨 kh醝/end_say")
	else
		Say("Цm ngi n祔 t筸 th阨 ch璦 thu th藀 頲, m阨 "..GetPlayerSex().."khi kh竎 quay l筰!", 2, "tr? l筰/main", "R阨 kh醝/end_say")
	end
end

function yes_get_exp(nIndex)
	local nAddExp, nSkillName = AddTishenGatherExp(nIndex)
	Msg2Player("B筺 nh薾 頲 ["..nAddExp.."] 甶觤"..nSkillName.." Kinh nghi謒 k? n╪g ")
end

function tishen_shuoming()
	Say("V? "..GetPlayerSex().."mu鑞 t譵 hi觰 g? v? 駓 th竎 thu th藀?",
		4,
		"駓 th竎 thu th藀 c莕 nh鱪g g??/wupinshuoming",
		"Gi秈 th輈h i ng? mn/duiwushuoming",
		"Sau khi 駓 th竎 thu th藀 t筰 n琲  nh薾 kinh nghi謒 v? v藅 ph萴/lingqushuoming",
		"R阨 kh醝./main")
end

function wupinshuoming()
	Say("Mu鑞 駓 th竎 thu th藀 c莕 Kh? c th? v? Th莕 N玭g n, t筰 khu v鵦 thu th藀 s? d鬾g Kh? c th? l? c? th? 駓 th竎, Th莕 N玭g n quy誸 nh th阨 gian 駓 th竎. Kh? c th? mua t筰 t筽 h鉧, Th莕 N玭g n mua t? ch鴆 n╪g Ng? c竎.",0)
end

function duiwushuoming()
	Say("S? d鬾g Kh? c th? mn 1 i ng?, ta s? tr玭g th蕐 ch髇g thu th藀 v藅 ph萴 頲 ch? nh. C? th? n <color=green>Ngi 駓 th竎 thu th藀<color> xem  mn qua bao nhi猽 i ng? 駓 th竎 thu th藀, thu th藀 頲 v藅 ph萴 g? ho芻 ta c? th? thay i v藅 ph萴 thu th藀.",0)
end

function lingqushuoming()
	Say("Ngi c? th? n <color=green>Ngi 駓 th竎 thu th藀<color> xem t譶h h譶h thu th藀, v藅 ph萴 thu th藀 v? kinh nghi謒, khi ng th阨 c? 2 ngi 駓 th竎 thu th藀, nh薾 ph莕 thng ngi kia xong, kinh nghi謒 ngi c遪 l筰 s? x鉧 b?, v藅 ph萴 thu th藀 kh玭g b? 秐h hng.",0)
end

function end_say()

end

