------------------------------------------------------------
-- 小包黑玉断续膏的脚本 xiaobaoheiyuduanxugao.lua
--
-- comment: 打开后获得100个黑玉断续膏
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,489
-- 黑玉断续膏ID: 1,0,6
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Ngi mu鑞 m? tay n秈 l蕐 100 b譶h <color=yellow>H綾 Ng鋍 筺 T鬰 Cao<color> ch?? Xin ki觤 tra s鴆 l鵦 v? h祅h trang trc, k蝟 nh r琲 dc ph萴!",
		2,
		"Л頲/open_100_heiyuduanxugao",
		"T筸 th阨 kh玭g m?--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开小包，获得100个黑玉断续膏
function open_100_heiyuduanxugao()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 700) then
		Say("S鴆 l鵦 kh玭g  <color=yellow>700<color>, kh玭g m? 頲 <color=yellow>H綾 Ng鋍 筺 T鬰 Cao (ti觰)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 489, 1) == 1) then
		if (AddItem(1, 0, 6, 100,5) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 489, 1)
		else
			Say("B筺 nh薾 頲 100 b譶h <color=yellow>H綾 Ng鋍 筺 T鬰 Cao<color>!", 0)
			Msg2Player("B筺 nh薾 頲 100 b譶h H綾 Ng鋍 筺 T鬰 Cao!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>H綾 Ng鋍 筺 T鬰 Cao (ti觰)<color>!", 0)
	end
end;

