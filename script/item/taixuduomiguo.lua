
-- 太虚多密果
TAIXU_TIME = 1782		--记录最近一次进入太虚幻境的时间
EAT_TIME_TODAY = 1795	-- 当天使用太虚多密果的次数
MASK = 10000000

MAX_ENTER_CHANCE = 200

function OnUse(nItemIndex)
	local nValue = GetTask(EAT_TIME_TODAY)
	local nChance = floor(nValue / MASK)
	local nDate = mod(nValue, MASK)
	
	local nNow = tonumber(date("%y%m%d"))
	local nDuration = nNow - GetTask(TAIXU_TIME)
	if nNow <= nDate and nChance >= MAX_ENTER_CHANCE then
		WriteLog("<Th竔 H?  M藅 Qu?>"..GetName().."Trong m閠 ng祔 s? d鬾g qu?"..MAX_ENTER_CHANCE.." l莕")
		Msg2Player("B筺 s? d鬾g qu? nhi襲 Th竔 H?  M藅 Qu?, kh玭g th? ti誴 t鬰 s? d鬾g")
	elseif nDuration > 0 then
		Msg2Player("H玬 nay b筺 v蒼 v祇 頲 Th竔 H? Huy詎 c秐h, kh玭g c莕 d飊g Th竔 H?  M藅 Qu?")
	else
		if DelItem(2,1,387, 1) == 1 then
			SetTask(TAIXU_TIME, 0)
			if nNow > nDate then
				nChance = 1
			else
				nChance = nChance + 1
			end
			SetTask(EAT_TIME_TODAY, nNow + 10000000 * nChance)
			Msg2Player("Th祅h c玭g s? d鬾g Th竔 H?  M藅 Qu?, c? th? ti誴 t鬰 v祇 Th竔 H? Huy詎 c秐h")
		else
			Msg2Player("B筺 kh玭g c? Th竔 H?  M藅 Qu?")
		end
	end
end
