------------------------------------------------------------
-- 小袋生生造化散的脚本 xiaodaishengsheng.lua
--
-- comment: 打开后获得10个生生造化散
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1036
-- 万物归元丹ID: 1,0,16
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Trong n祔 c? th? ch鴄 10 <color=yellow>Sinh Sinh H鉧 T竛<color>, m? ch??",
		2,
		"Л頲/open_10_shengshengzaohuasan",
		"T筸 th阨 kh玭g m?--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开小包，获得10个生生造化散
function open_10_shengshengzaohuasan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) then
		Say("S鴆 l鵦 c馻 b筺 kh玭g  <color=yellow>70<color>, ch璦 th? m? <color=yellow>Sinh Sinh H鉧 T竛-bao nh?<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1036, 1) == 1) then
		if (AddItem(1, 0, 16, 10,5) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 1036, 1)
		else
			Say("B筺 nh薾 頲 10 <color=yellow>Sinh Sinh H鉧 T竛<color>!", 0)
			Msg2Player("B筺 nh薾 頲 10 Sinh Sinh H鉧 T竛!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>Sinh Sinh H鉧 T竛-bao nh?<color>!", 0)
	end
end;

