-- 大人参果
-- 4小时内提升秘籍修炼速度4倍，时间可累积。单击投入修为按钮弹出提示框提示
-- lizhi 2006-11-2 11:52

TASK_ID = 2505

function OnUse()
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))
	Say("D飊g i Nh﹏ s﹎ t鑓  tu luy謓 m藅 t辌h g蕄 4 l莕 trong 4 gi?, hi謓 b筺 c遪 "..nHour.."h "..nMin.." ph髏, mu鑞 s? d鬾g?",
		2,
		"ng r錳./yes_use",
		"H駓 b?./no_use"
		)
end

function yes_use()
	local nHave = GetItemCount(2,0,553)
	AskClientForNumber("use_cb", 1, tonumber(nHave), "D飊g bao nhi猽 i Nh﹏ s﹎?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASK_ID)
	if DelItem(2, 0, 553, nCount) == 1 then
		SetTask(TASK_ID, nTaskValue + 14400 * 18 * nCount)
		local nTime = floor(GetTask(TASK_ID) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		Msg2Player("B筺  d飊g i Nh﹏ s﹎, th阨 gian cho t鑓  tu luy謓 m蕋 t辌h g蕄 4 l莕 l?"..nHour.."h "..nMin.." ph髏 ")
	end
end

function no_use()

end
