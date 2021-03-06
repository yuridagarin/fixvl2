-- 军用统筹书，军用收集书

TASK_IB_BOOK1 = 1737

tTab =
{
	{2,	1,	1028, "Qu﹏ d鬾g-thu th藀 th?", 2},
	{2,	1,	1029, "Qu﹏ d鬾g-Th鑞g tr? th?", 5},
}

function OnUse(nidx)
	local nDay = tonumber(date("%w"))
	if not (nDay == 5 or nDay == 6) then
		Say("Hi謓 kh玭g c? v藅 li謚 qu﹏ d鬾g, i th? 6, th? 7 m韎 s? d鬾g!", 0)
		return
	end
	
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	
	Say("B筺 mu鑞 d飊g"..tTab[nTabIndex][4].."? N? c? th? gi髉 b筺 t╪g t? l? c? 頲 v藅 li謚 qu﹏ d鬾g"..tTab[nTabIndex][5].."l莕.", 2, "ng/#yes_use("..nTabIndex..")", "Sai/no_use")
end

function yes_use(nTabIndex)

	local nValue = GetTask(TASK_IB_BOOK1)
	local nDate = mod(nValue, 1000000)
	local nProbability = floor(nValue / 1000000)
	local nNow = tonumber(date("%y%j"))
	
	if nDate >= nNow and nProbability == tTab[nTabIndex][5] then
		Say("H玬 nay b筺  s? d鬾g"..tTab[nTabIndex][4].."Ng祔 mai h穣 quay l筰!", 0)
	elseif nDate >= nNow and nProbability < tTab[nTabIndex][5] then
		Say("B筺 mu鑞 d飊g qu﹏ d鬾g-th鑞g tr? th??", 2, "ng/yes_use_2", "Sai/no_say")
	elseif nDate >= nNow and nProbability > tTab[nTabIndex][5] then
		Say("B筺  d飊g qu﹏ d鬾g-th鑞g tr? th? kh玭g c莕 d飊g qu﹏ d鬾g-thu th藀 th?.", 0)
	elseif nDate < nNow then
		if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
			local nDate = tonumber(date("%y%j"))
			SetTask(TASK_IB_BOOK1, tTab[nTabIndex][5] * 1000000 + nNow)
			Msg2Player("B筺  s? d鬾g 1 "..tTab[nTabIndex][4])
		end
	end
end

function yes_use_2()
	if DelItem(2, 1, 1029, 1) == 1 then
		local nDate = tonumber(date("%y%j"))
		SetTask(TASK_IB_BOOK1, 5 * 1000000 + nDate)
		Msg2Player("B筺  s? d鬾g 1 qu﹏ d鬾g-th鑞g tr? th?")
	end
end

function no_say()

end
