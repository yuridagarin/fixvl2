------------------------------------------------------------
-- 小包万物归元丹的脚本 xiaobaowanwuguiyuandan.lua
--
-- comment: 打开后获得100个万物归元丹
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,495
-- 万物归元丹ID: 1,0,11
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Ngi mu鑞 m? tay n秈 l蕐 100 b譶h <color=yellow>V筺 V藅 Quy Nguy猲 Кn<color> ch?? Xin ki觤 tra s鴆 l鵦 v? h祅h trang trc, k蝟 nh r琲 dc ph萴!",
		2,
		"Л頲/open_100_wanwuguiyuandan",
		"T筸 th阨 kh玭g m?--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开小包，获得100个万物归元丹
function open_100_wanwuguiyuandan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 700) then
		Say("S鴆 l鵦 kh玭g  <color=yellow>700<color>, kh玭g m? 頲 <color=yellow>V筺 V藅 Quy Nguy猲 Кn (ti觰)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 495, 1) == 1) then
		if (AddItem(1, 0, 11, 100,5) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 495, 1)
		else
			Say("B筺 nh薾 頲 100 b譶h <color=yellow>V筺 V藅 Quy Nguy猲 Кn<color>!", 0)
			Msg2Player("B筺 nh薾 頲 100 b譶h V筺 V藅 Quy Nguy猲 Кn!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>V筺 V藅 Quy Nguy猲 Кn (ti觰)<color>!", 0)
	end
end;

