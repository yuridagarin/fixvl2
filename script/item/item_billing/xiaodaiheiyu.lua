------------------------------------------------------------
-- 小袋黑玉断续膏的脚本 xiaodaiheiyu.lua
--
-- comment: 打开后获得10个黑玉断续膏
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1032
-- 黑玉断续膏ID: 1,0,6
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("M? g鉯 h祅g n祔 b筺 c? th? nh薾 頲 10 <color=yellow>H綾 Ng鋍 筺 T鬰 Cao<color>, m? ch??",
		2,
		"Л頲/open_10_heiyuduanxugao",
		"T筸 th阨 kh玭g m?--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开小包，获得10个黑玉断续膏
function open_10_heiyuduanxugao()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) then
		Say("S鴆 l鵦 c馻 b筺 kh玭g  <color=yellow>70<color>, ch璦 th? m? <color=yellow>H綾 Ng鋍 筺 T鬰 Cao-bao nh?<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1032, 1) == 1) then
		if (AddItem(1, 0, 6, 10,5) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 1032, 1)
		else
			Say("B筺 nh薾 頲 10 <color=yellow>H綾 Ng鋍 筺 T鬰 Cao<color>!", 0)
			Msg2Player("B筺 nh薾 頲 10 H綾 Ng鋍 筺 T鬰 Cao!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>H綾 Ng鋍 筺 T鬰 Cao-bao nh?<color>!", 0)
	end
end;

