------------------------------------------------------------
-- 小包大还丹的脚本 xiaobaodahuandan.lua
--
-- comment: 打开后获得100个大还丹
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,491
-- 大还丹ID: 1,0,9
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Ngi mu鑞 m? tay n秈 l蕐 100 b譶h <color=yellow>Чi Ho祅 n<color> ch?? Xin ki觤 tra s鴆 l鵦 v? h祅h trang trc, k蝟 nh r琲 dc ph萴!",
		2,
		"Л頲/open_100_dahuandan",
		"T筸 th阨 kh玭g m?--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开小包，获得100个大还丹
function open_100_dahuandan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 600) then
		Say("S鴆 l鵦 kh玭g  <color=yellow>600<color>, kh玭g m? 頲 <color=yellow>Чi Ho祅 n (ti觰)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 491, 1) == 1) then
		if (AddItem(1, 0, 9, 100) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 491, 1)
		else
			Say("B筺 nh薾 頲 100 b譶h <color=yellow>Чi Ho祅 n<color>!", 0)
			Msg2Player("B筺 nh薾 頲 100 b譶h Чi Ho祅 n!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>Чi Ho祅 n (ti觰)<color>!", 0)
	end
end;

