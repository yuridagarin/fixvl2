------------------------------------------------------------
-- 世界杯战袍的脚本 shijiebeizhanpao.lua
--
-- comment: 打开后获得一个指定的世界杯战袍
-- creator: Tony(Jizheng)
-- Date   : Jul 31st, 2006
--
-- Item ID:  2,1,505
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Ngi mu鑞 m? tay n秈 l蕐 <color=yellow>Th? Gi韎 chi課 b祇<color> ra kh玭g? Xin h醝 ngi c莕 lo筰 chi課 b祇 n祇?",
		5,
		"Ta c莕 Ti猽 Chu萵 chi課 b祇/need_normal_suit",
		"Ta c莕 Kh玦 Ng? chi課 b祇/need_strong_suit",
		"Ta c莕 G頸 C秏 chi課 b祇/need_sexy_suit",
		"Ta c莕 Ki襲 n? chi課 b祇/need_amortta_suit",
		"T筸 th阨 kh玭g m?--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 需要标准体型的战袍
function need_normal_suit()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"T筸 th阨 kh玭g c莕/cancel_dialog",
		"c ? chi課 b祇/need_normal_germany",
		"Tang Ba chi課 b祇/need_normal_brazil",
		"A C╪ chi課 b祇/need_normal_argentina",
		"B蕋 Di謙 chi課 b祇/need_normal_england",
		"T? T竧 chi課 b祇/need_normal_italy",
		"C遪 5 b?, xin xem trang sau/need_normal_suit_page2")
end;
function need_normal_suit_page2()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"C遪 5 b?, xin xem trang trc/need_normal_suit",
		"竔 Phi chi課 b祇/need_normal_france",
		"Phong Xa chi課 b祇/need_normal_holland",
		"u Ng璾 chi課 b祇/need_normal_spain",
		"B? Qu鑓 chi課 b祇/need_normal_portugel",
		"Ti謕 Kh竎h chi課 b祇/need_normal_szech",
		"T筸 th阨 kh玭g c莕/cancel_dialog")
end;
-- 标准型的10件衣服
function need_normal_germany()
	-- 德意战袍	0, 109, 133
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 133, 1)
		Say("B筺 nh薾 頲 <color=yellow>c ? chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 c ? chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_brazil()
	-- 桑巴战袍	0, 109, 137
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 137, 1)
		Say("B筺 nh薾 頲 <color=yellow>Tang Ba chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Tang Ba chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_argentina()
	-- 阿根战袍	0, 109, 141
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 141, 1)
		Say("B筺 nh薾 頲 <color=yellow>A C╪ chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 A C╪ chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_england()
	-- 不列颠战袍 0, 109, 145
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 145, 1)
		Say("B筺 nh薾 頲 <color=yellow>B蕋 Di謙 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B蕋 Di謙 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_italy()
	-- 比萨战袍	0, 109, 149
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 149, 1)
		Say("B筺 nh薾 頲 <color=yellow>T? T竧 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 T? T竧 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_france()
	-- 爱菲尔战袍 0, 109, 153
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 153, 1)
		Say("B筺 nh薾 頲 <color=yellow>竔 Phi chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 竔 Phi chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_holland()
	-- 风车战袍	0, 109, 157
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 157, 1)
		Say("B筺 nh薾 頲 <color=yellow>Phong Xa chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Phong Xa chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_spain()
	-- 斗牛战袍	0, 109, 161
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 161, 1)
		Say("B筺 nh薾 頲 <color=yellow>u Ng璾 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 u Ng璾 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_portugel()
	-- 葡国战袍	0, 109, 165
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 165, 1)
		Say("B筺 nh薾 頲 <color=yellow>B? Qu鑓 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B? Qu鑓 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_normal_szech()
	-- 捷客战袍	0, 109, 169
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 169, 1)
		Say("B筺 nh薾 頲 <color=yellow>Ti謕 Kh竎h chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Ti謕 Kh竎h chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;



-- 需要魁梧体型的战袍
function need_strong_suit()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"T筸 th阨 kh玭g c莕/cancel_dialog",
		"c ? chi課 b祇/need_strong_germany",
		"Tang Ba chi課 b祇/need_strong_brazil",
		"A C╪ chi課 b祇/need_strong_argentina",
		"B蕋 Di謙 chi課 b祇/need_strong_england",
		"T? T竧 chi課 b祇/need_strong_italy",
		"C遪 5 b?, xin xem trang sau/need_strong_suit_page2")
end;
function need_strong_suit_page2()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"C遪 5 b?, xin xem trang trc/need_strong_suit",
		"竔 Phi chi課 b祇/need_strong_france",
		"Phong Xa chi課 b祇/need_strong_holland",
		"u Ng璾 chi課 b祇/need_strong_spain",
		"B? Qu鑓 chi課 b祇/need_strong_portugel",
		"Ti謕 Kh竎h chi課 b祇/need_strong_szech",
		"T筸 th阨 kh玭g c莕/cancel_dialog")
end;
-- 魁梧型的10件衣服
function need_strong_germany()
	-- 德意战袍	0, 109, 134
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 134, 1)
		Say("B筺 nh薾 頲 <color=yellow>c ? chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 c ? chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_brazil()
	-- 桑巴战袍	0, 109, 138
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 138, 1)
		Say("B筺 nh薾 頲 <color=yellow>Tang Ba chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Tang Ba chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_argentina()
	-- 阿根战袍	0, 109, 142
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 142, 1)
		Say("B筺 nh薾 頲 <color=yellow>A C╪ chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 A C╪ chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_england()
	-- 不列颠战袍 0, 109, 146
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 146, 1)
		Say("B筺 nh薾 頲 <color=yellow>B蕋 Di謙 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B蕋 Di謙 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_italy()
	-- 比萨战袍	0, 109, 150
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 150, 1)
		Say("B筺 nh薾 頲 <color=yellow>T? T竧 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 T? T竧 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_france()
	-- 爱菲尔战袍 0, 109, 154
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 154, 1)
		Say("B筺 nh薾 頲 <color=yellow>竔 Phi chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 竔 Phi chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_holland()
	-- 风车战袍	0, 109, 158
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 158, 1)
		Say("B筺 nh薾 頲 <color=yellow>Phong Xa chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Phong Xa chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_spain()
	-- 斗牛战袍	0, 109, 162
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 162, 1)
		Say("B筺 nh薾 頲 <color=yellow>u Ng璾 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 u Ng璾 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_portugel()
	-- 葡国战袍	0, 109, 166
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 166, 1)
		Say("B筺 nh薾 頲 <color=yellow>B? Qu鑓 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B? Qu鑓 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_strong_szech()
	-- 捷客战袍	0, 109, 170
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 170, 1)
		Say("B筺 nh薾 頲 <color=yellow>Ti謕 Kh竎h chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Ti謕 Kh竎h chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;



-- 需要性感体型的战袍
function need_sexy_suit()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"T筸 th阨 kh玭g c莕/cancel_dialog",
		"c ? chi課 b祇/need_sexy_germany",
		"Tang Ba chi課 b祇/need_sexy_brazil",
		"A C╪ chi課 b祇/need_sexy_argentina",
		"B蕋 Di謙 chi課 b祇/need_sexy_england",
		"T? T竧 chi課 b祇/need_sexy_italy",
		"C遪 5 b?, xin xem trang sau/need_sexy_suit_page2")
end;
function need_sexy_suit_page2()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"C遪 5 b?, xin xem trang trc/need_sexy_suit",
		"竔 Phi chi課 b祇/need_sexy_france",
		"Phong Xa chi課 b祇/need_sexy_holland",
		"u Ng璾 chi課 b祇/need_sexy_spain",
		"B? Qu鑓 chi課 b祇/need_sexy_portugel",
		"Ti謕 Kh竎h chi課 b祇/need_sexy_szech",
		"T筸 th阨 kh玭g c莕/cancel_dialog")
end;
-- 魁梧型的10件衣服
function need_sexy_germany()
	-- 德意战袍	0, 109, 135
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 135, 1)
		Say("B筺 nh薾 頲 <color=yellow>c ? chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 c ? chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_brazil()
	-- 桑巴战袍	0, 109, 139
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 139, 1)
		Say("B筺 nh薾 頲 <color=yellow>Tang Ba chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Tang Ba chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_argentina()
	-- 阿根战袍	0, 109, 143
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 143, 1)
		Say("B筺 nh薾 頲 <color=yellow>A C╪ chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 A C╪ chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_england()
	-- 不列颠战袍 0, 109, 147
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 147, 1)
		Say("B筺 nh薾 頲 <color=yellow>B蕋 Di謙 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B蕋 Di謙 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_italy()
	-- 比萨战袍	0, 109, 151
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 151, 1)
		Say("B筺 nh薾 頲 <color=yellow>T? T竧 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 T? T竧 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_france()
	-- 爱菲尔战袍 0, 109, 155
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 155, 1)
		Say("B筺 nh薾 頲 <color=yellow>竔 Phi chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 竔 Phi chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_holland()
	-- 风车战袍	0, 109, 159
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 159, 1)
		Say("B筺 nh薾 頲 <color=yellow>Phong Xa chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Phong Xa chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_spain()
	-- 斗牛战袍	0, 109, 163
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 163, 1)
		Say("B筺 nh薾 頲 <color=yellow>u Ng璾 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 u Ng璾 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_portugel()
	-- 葡国战袍	0, 109, 167
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 167, 1)
		Say("B筺 nh薾 頲 <color=yellow>B? Qu鑓 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B? Qu鑓 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_sexy_szech()
	-- 捷客战袍	0, 109, 171
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 171, 1)
		Say("B筺 nh薾 頲 <color=yellow>Ti謕 Kh竎h chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Ti謕 Kh竎h chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;



-- 需要娇小体型的战袍
function need_amortta_suit()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"T筸 th阨 kh玭g c莕/cancel_dialog",
		"c ? chi課 b祇/need_amortta_germany",
		"Tang Ba chi課 b祇/need_amortta_brazil",
		"A C╪ chi課 b祇/need_amortta_argentina",
		"B蕋 Di謙 chi課 b祇/need_amortta_england",
		"T? T竧 chi課 b祇/need_amortta_italy",
		"C遪 5 b?, xin xem trang sau/need_amortta_suit_page2")
end;
function need_amortta_suit_page2()
	Say("Ngi c莕 lo筰 chi課 b祇 n祇? T蕋 c? c? 10 b? chi課 b祇  ch鋘:",
		7,
		"C遪 5 b?, xin xem trang trc/need_amortta_suit",
		"竔 Phi chi課 b祇/need_amortta_france",
		"Phong Xa chi課 b祇/need_amortta_holland",
		"u Ng璾 chi課 b祇/need_amortta_spain",
		"B? Qu鑓 chi課 b祇/need_amortta_portugel",
		"Ti謕 Kh竎h chi課 b祇/need_amortta_szech",
		"T筸 th阨 kh玭g c莕/cancel_dialog")
end;
-- 魁梧型的10件衣服
function need_amortta_germany()
	-- 德意战袍	0, 109, 136
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 136, 1)
		Say("B筺 nh薾 頲 <color=yellow>c ? chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 c ? chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_brazil()
	-- 桑巴战袍	0, 109, 140
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 140, 1)
		Say("B筺 nh薾 頲 <color=yellow>Tang Ba chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Tang Ba chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_argentina()
	-- 阿根战袍	0, 109, 144
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 144, 1)
		Say("B筺 nh薾 頲 <color=yellow>A C╪ chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 A C╪ chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_england()
	-- 不列颠战袍 0, 109, 148
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 148, 1)
		Say("B筺 nh薾 頲 <color=yellow>B蕋 Di謙 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B蕋 Di謙 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_italy()
	-- 比萨战袍	0, 109, 152
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 152, 1)
		Say("B筺 nh薾 頲 <color=yellow>T? T竧 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 T? T竧 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_france()
	-- 爱菲尔战袍 0, 109, 156
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 156, 1)
		Say("B筺 nh薾 頲 <color=yellow>竔 Phi chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 竔 Phi chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_holland()
	-- 风车战袍	0, 109, 160
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 160, 1)
		Say("B筺 nh薾 頲 <color=yellow>Phong Xa chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Phong Xa chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_spain()
	-- 斗牛战袍	0, 109, 164
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 164, 1)
		Say("B筺 nh薾 頲 <color=yellow>u Ng璾 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 u Ng璾 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_portugel()
	-- 葡国战袍	0, 109, 168
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 168, 1)
		Say("B筺 nh薾 頲 <color=yellow>B? Qu鑓 chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 B? Qu鑓 chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;
function need_amortta_szech()
	-- 捷客战袍	0, 109, 172
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 172, 1)
		Say("B筺 nh薾 頲 <color=yellow>Ti謕 Kh竎h chi課 b祇<color>!", 0)
		Msg2Player("B筺 nh薾 頲 Ti謕 Kh竎h chi課 b祇!")
	else
		Say("B筺 kh玭g c? <color=yellow>Tay n秈 th? gi韎 chi課 b祇<color>, kh玭g th? i 頲!", 0)
	end
end;


