------------------------------------------------------------
-- 药品包袱（大）的脚本 yaopinbaofu_da.lua
--
-- comment: 将任意250瓶高级药品打包。
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,1,478
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 ng g鉯 lo筰 bao dc ph萴 n祇?",
		4,
		"Sinh l鵦 dc/pack_life_bottles",
		"N閕 l鵦 dc/pack_energy_bottles",
		"Song b? dc/pack_both_bottles",
		"T筸 th阨 kh玭g ng g鉯--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 打包生命药水
function pack_life_bottles()
		
	local bHaveBaiyunsan = GetItemCount(1, 0, 4)			-- 白云散
	local bHaveTianxiangyunjingxu = GetItemCount(1, 0, 5)	-- 天香云锦续
	local bHaveHeiyuduanxugao = GetItemCount(1, 0, 6)		-- 黑玉断续膏

	-- 都不够250瓶
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say("Bao sinh l鵦 dc c?: <color=yellow>B筩h V﹏ t竛, Thi猲 Hng C萴 T鬰, H綾 Ng鋍 筺 T鬰 Cao<color>, 3 lo筰 mang theo kh玭g  250 b譶h, kh玭g th? ng g鉯!", 0)
		return
	end
	
	strTab = {"Bao sinh l鵦 dc c?: <color=yellow>B筩h V﹏ t竛, Thi猲 Hng C萴 T鬰, H綾 Ng鋍 筺 T鬰 Cao<color>, b筺 mu鑞 ng g鉯 lo筰 n祇?",
			  "Ta mu鑞 ng g鉯 250 b譶h B筩h V﹏ t竛!/pack_250_baiyunsan",
			  "Ta mu鑞 ng g鉯 250 b譶h Thi猲 Hng C萴 T鬰!/pack_250_tianxiangyunjingxu",
			  "Ta mu鑞 ng g鉯 250 b譶h H綾 Ng鋍 筺 T鬰 Cao!/pack_250_heiyuduanxugao",
			  "T筸 th阨 kh玭g ng g鉯--H駓 b?/cancel_dialog"}
			  
	-- 三种都有
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- 缺白云散
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- 缺天香云锦续
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- 缺黑玉断续膏
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- 只有白云散
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- 只有天香云锦续
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- 只有黑玉断续膏
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- 确认打包250瓶白云散
function pack_250_baiyunsan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 4, 250) == 1) then
			AddItem(2, 1, 486, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>B筩h V﹏ t竛<color>, nh薾 頲 1 <color=yellow>B筩h V﹏ t竛 (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h B筩h V﹏ t竛, nh薾 頲 1 B筩h V﹏ t竛 (i)!")
		else
			Say("<color=yellow>B筩h V﹏ t竛<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;
-- 确认打包250瓶天香云锦续
function pack_250_tianxiangyunjingxu()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 5, 250) == 1) then
			AddItem(2, 1, 488, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>Thi猲 Hng C萴 T鬰<color>, nh薾 頲 1 <color=yellow>Thi猲 Hng C萴 T鬰 (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h Thi猲 Hng C萴 T鬰, nh薾 頲 1 Thi猲 Hng C萴 T鬰 (i)!")
		else
			Say("<color=yellow>Thi猲 Hng C萴 T鬰<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;
-- 确认打包250瓶黑玉断续膏
function pack_250_heiyuduanxugao()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 6, 250) == 1) then
			AddItem(2, 1, 490, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>H綾 Ng鋍 筺 T鬰 Cao<color>, nh薾 頲 1 <color=yellow>H綾 Ng鋍 筺 T鬰 Cao (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h H綾 Ng鋍 筺 T鬰 Cao, nh薾 頲 1 H綾 Ng鋍 筺 T鬰 Cao (i)!")
		else
			Say("<color=yellow>H綾 Ng鋍 筺 T鬰 Cao<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;



-- 打包内力药水
function pack_energy_bottles()
	local bHavedahuandan = GetItemCount(1, 0, 9)			-- 大还丹
	local bHaveyiyuanfushidan = GetItemCount(1, 0, 10)		-- 一元复始丹
	local bHavewanwuguiyuandan = GetItemCount(1, 0, 11)		-- 万物归元丹

	-- 都不够250瓶
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say("Bao n閕 l鵦 dc c?: <color=yellow>Чi Ho祅 n, Nh蕋 Nguy猲 Ph鬰 Th駓 Кn, V筺 V藅 Quy Nguy猲 Кn<color>, 3 lo筰 mang theo kh玭g  250 b譶h, kh玭g th? ng g鉯!", 0)
		return
	end
	
	strTab = {"Bao n閕 l鵦 dc c?: <color=yellow>Чi Ho祅 n, Nh蕋 Nguy猲 Ph鬰 Th駓 Кn, V筺 V藅 Quy Nguy猲 Кn<color>, b筺 mu鑞 ng g鉯 lo筰 n祇?",
			  "Ta mu鑞 ng g鉯 250 b譶h Чi Ho祅 n!/pack_250_dahuandan",
			  "Ta mu鑞 ng g鉯 250 b譶h Nh蕋 Nguy猲 Ph鬰 Th駓 Кn!/pack_250_yiyuanfushidan",
			  "Ta mu鑞 ng g鉯 250 b譶h V筺 V藅 Quy Nguy猲 Кn!/pack_250_wanwuguiyuandan",
			  "T筸 th阨 kh玭g ng g鉯--H駓 b?/cancel_dialog"}
			  
	-- 三种都有
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- 缺大还丹
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- 缺一元复始丹
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- 缺万物归元丹
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- 只有大还丹
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- 只有一元复始丹
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- 只有万物归元丹
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- 确认打包250瓶大还丹
function pack_250_dahuandan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 9, 250) == 1) then
			AddItem(2, 1, 492, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>Чi Ho祅 n<color>, nh薾 頲 1 <color=yellow>Чi Ho祅 n (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h Чi Ho祅 n, nh薾 頲 1 Чi Ho祅 n (i)!")
		else
			Say("<color=yellow>Чi Ho祅 n<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;
-- 确认打包250瓶一元复始丹
function pack_250_yiyuanfushidan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 10, 250) == 1) then
			AddItem(2, 1, 494, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>Nh蕋 Nguy猲 Ph鬰 Th駓 Кn<color>, nh薾 頲 1 <color=yellow>Nh蕋 Nguy猲 Ph鬰 Th駓 Кn (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h Nh蕋 Nguy猲 Ph鬰 Th駓 Кn, nh薾 頲 1 Nh蕋 Nguy猲 Ph鬰 Th駓 Кn (i)!")
		else
			Say("<color=yellow>Nh蕋 Nguy猲 Ph鬰 Th駓 Кn<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;
-- 确认打包250瓶万物归元丹
function pack_250_wanwuguiyuandan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 11, 250) == 1) then
			AddItem(2, 1, 496, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>V筺 V藅 Quy Nguy猲 Кn<color>, nh薾 頲 1 <color=yellow>V筺 V藅 Quy Nguy猲 Кn (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h V筺 V藅 Quy Nguy猲 Кn, nh薾 頲 1 V筺 V藅 Quy Nguy猲 Кn (i)!")
		else
			Say("<color=yellow>V筺 V藅 Quy Nguy猲 Кn<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;



-- 打包双补药水
function pack_both_bottles()
	local bHaveyulingsan = GetItemCount(1, 0, 14)			-- 玉灵散
	local bHavewuhuayuluwan = GetItemCount(1, 0, 15)		-- 五花玉露丸
	local bHaveshengshengzaohuasan = GetItemCount(1, 0, 16)	-- 生生造化散

	-- 都不够100瓶
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say("Bao song b? dc c?: <color=yellow>Ng鋍 Linh t竛, Ng? Hoa Ng鋍 L? Ho祅, Sinh Sinh H鉧 T竛<color>, 3 lo筰 mang theo kh玭g  250 b譶h, kh玭g th? ng g鉯!", 0)
		return
	end
	
	strTab = {"Bao song b? dc c?: <color=yellow>Ng鋍 Linh t竛, Ng? Hoa Ng鋍 L? Ho祅, Sinh Sinh H鉧 T竛<color>, b筺 Mu鑞 ng g鉯 lo筰 n祇?",
			  "Ta mu鑞 ng g鉯 250 b譶h Ng鋍 Linh t竛!/pack_250_yulingsan",
			  "Ta mu鑞 ng g鉯 250 b譶h Ng? Hoa Ng鋍 L? Ho祅!/pack_250_wuhuayuluwan",
			  "Ta mu鑞 ng g鉯 250 b譶h Sinh Sinh H鉧 T竛!/pack_250_shengshengzaohuasan",
			  "T筸 th阨 kh玭g ng g鉯--H駓 b?/cancel_dialog"}
			  
	-- 三种都有
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- 缺玉灵散
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- 缺五花玉露丸
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- 缺生生造化散
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- 只有玉灵散
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- 只有五花玉露丸
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- 只有生生造化散
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- 确认打包250瓶玉灵散
function pack_250_yulingsan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 14, 250) == 1) then
			AddItem(2, 1, 480, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>Ng鋍 Linh t竛<color>, nh薾 頲 1 <color=yellow>Ng鋍 Linh t竛 (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h Ng鋍 Linh t竛, nh薾 頲 1 Ng鋍 Linh t竛 (i)!")
		else
			Say("<color=yellow>Ng鋍 Linh t竛<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;
-- 确认打包250瓶五花玉露丸
function pack_250_wuhuayuluwan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 15, 250) == 1) then
			AddItem(2, 1, 482, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>Ng? Hoa Ng鋍 L? Ho祅<color>, nh薾 頲 1 <color=yellow>Ng? Hoa Ng鋍 L? Ho祅 (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h Ng? Hoa Ng鋍 L? Ho祅, nh薾 頲 1 Ng? Hoa Ng鋍 L? Ho祅 (i)!")
		else
			Say("<color=yellow>Ng? Hoa Ng鋍 L? Ho祅<color> mang theo kh玭g  250 b譶h!!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;
-- 确认打包250瓶生生造化散
function pack_250_shengshengzaohuasan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 16, 250) == 1) then
			AddItem(2, 1, 484, 1)
			Say("B筺 ng g鉯 250 b譶h <color=yellow>Sinh Sinh H鉧 T竛<color>, nh薾 頲 1 <color=yellow>Sinh Sinh H鉧 T竛 (i)<color>!", 0)
			Msg2Player("B筺 ng g鉯 250 b譶h Sinh Sinh H鉧 T竛, nh薾 頲 1 Sinh Sinh H鉧 T竛 (i)!")
		else
			Say("<color=yellow>Sinh Sinh H鉧 T竛<color> mang theo kh玭g  250 b譶h!", 0)
		end
	else
		Say("B筺 kh玭g mang theo t骾 dc ph萴 l韓!", 0)
	end
end;


