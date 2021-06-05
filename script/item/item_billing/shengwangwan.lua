
--add by lizhi
-- 前3列是物品类别,第4位是时间,第5位是速度 / 100 = 多少倍

-- 注意，初始化操作移动到 \script\global\autoexec.lua 中！
tItemInfo =
{
	{2, 1, 1064, 480, 1, "L鬰 Th莕 ho祅"},
	{2, 1, 1065, 480, 2, "Cng L鬰 Th莕 ho祅"},
	{2, 1, 1066, 480, 3, "L鬰 Th莕 Ti猲 n"},
}

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nTabIndex = 0
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break;
		end
	end

	if nTabIndex == 0 then
		return
	end
	
	SetTaskTemp(25, nTabIndex)
	if GetReputation() < 500 then
		Say("Danh v鋘g c馻 b筺 kh玭g  500, kh玭g th� s� d鬾g!"..tItemInfo[nTabIndex][6], 0)
		return
	end
	local UseLiushen = {
		"S� d鬾g 1 "..tItemInfo[nTabIndex][6]..". C� th� nh薾 頲 8 gi� "..tItemInfo[nTabIndex][6]..". Trong tr筺g th竔 駓 th竎 r阨 m筺g b筺 s� nh薾 頲 甶觤 danh v鋘g.",
		"B筺 ng � d飊g"..tItemInfo[nTabIndex][6].."?",
		"S� d鬾g "..tItemInfo[nTabIndex][6].."/UseLiushen",
		"в ta ngh� l筰/no"
	}
	Say(UseLiushen[1]..UseLiushen[2],2,UseLiushen[3],UseLiushen[4])
end

function UseLiushen()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3])
	AskClientForNumber("use_ls_cb", 1, tonumber(nHave), "S� d鬾g bao nhi猽"..tItemInfo[nTabIndex][6].."?")
end

function use_ls_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3], nCount) == 1 then
		local nRet = EatLiushen(nTabIndex, tItemInfo[nTabIndex][4] * nCount)
		if nRet > 0 then
			Msg2Player("B筺 nh薾 頲 "..tItemInfo[nTabIndex][6].." c�"..tItemInfo[nTabIndex][6].." th阨 gian "..nRet.." ph髏 ")
			--cdkey
			if 1 == nTabIndex then
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemLiuShen()");
			end
		end
	end
end

function no_say()

end
