
--add by lizhi
-- 前3列是物品类别,第4位是时间,第5位是速度 / 100 = 多少倍

-- 注意，初始化操作移动到 \script\global\autoexec.lua 中！
tItemInfo =
{
	{2, 1, 1097, 480, 1, "Tam Thanh ho祅"},
	{2, 1, 1098, 480, 2, "Cng Tam Thanh ho祅"},
	{2, 1, 1099, 480, 3, "Tam Thanh Ti猲 n"},
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
	local tUseSanqing = {
		"S? d鬾g 1 "..tItemInfo[nTabIndex][6]..". C? th? nh薾 頲 8 gi? "..tItemInfo[nTabIndex][6]..". ? tr筺g th竔 駓 th竎 r阨 m筺g b筺 c? th? nh薾 頲  c鑞g hi課 s? m玭.",
		"B筺 ng ? d飊g"..tItemInfo[nTabIndex][6].."?",
		"S? d鬾g "..tItemInfo[nTabIndex][6].."/UseSanqing",
		"в ta ngh? l筰/no"
	}
	Say(tUseSanqing[1]..tUseSanqing[2],2,tUseSanqing[3],tUseSanqing[4])
end

function UseSanqing()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3])
	AskClientForNumber("use_sq_cb", 1, tonumber(nHave), "S? d鬾g bao nhi猽"..tItemInfo[nTabIndex][6].."?")
end

function use_sq_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3], nCount) == 1 then
		local nRet = EatSanqin(nTabIndex, tItemInfo[nTabIndex][4] * nCount)
		if nRet > 0 then
			Msg2Player("B筺 nh薾 頲 "..tItemInfo[nTabIndex][6].." c?"..tItemInfo[nTabIndex][6].." th阨 gian "..nRet.." ph髏 ")
			--cdkey
			if 1 == nTabIndex then
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemSanQing()");
			end
		end
	end
end

function no_say()

end
