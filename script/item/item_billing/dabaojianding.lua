------------------------------------------------------------
-- 大包7级鉴定符的脚本 dabaojianding.lua
--
-- comment: 打开后获得100个7级鉴定符
-- creator: Tony(Jizheng)
-- Date   : Feb 9th, 2007
--
-- Item ID:  2,1,1058
-- 7级鉴定符: 2,5,7
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 m? g鉯 h祅g l蕐 100 t蕀 <color=yellow>gi竚 nh ph? c蕄 7<color>? Xin ki觤 tra h祅h trang v? s鴆 l鵦!",
		2,
		"Л頲/open_100_jianding",
		"T筸 th阨 kh玭g m?--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打开小包，获得100个7级鉴定符
function open_100_jianding()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 100) then
		Say("S鴆 l鵦 c馻 b筺 kh玭g  <color=yellow>100<color> t筸 th阨 kh玭g th? m? <color=yellow>gi竚 nh ph? c蕄 7-bao l韓<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1058, 1) == 1) then
		if (AddItem(2, 5, 7, 100,5) == 0) then	-- 如果有错误没有给出来，补偿一个包
			AddItem(2, 1, 1058, 1)
		else
			Say("B筺 nh薾 頲 100 <color=yellow>gi竚 nh ph? c蕄 7<color>!", 0)
			Msg2Player("B筺 nh薾 頲 100 gi竚 nh ph? c蕄 7!")
		end
	else
		Say("B筺 kh玭g mang theo <color=yellow>gi竚 nh ph? c蕄 7-bao l韓<color>!", 0)
	end
end;

