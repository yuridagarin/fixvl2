------------------------------------------------------------
-- 八宝洗髓仙丹的脚本 babaoxisuixiandan.lua
--
-- comment: 洗全部能力（所有能力属性扣到1点）。
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,138
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Sau khi d飊g <color=yellow>B竧 B秓 T葃 T駓 Ti猲 Кn<color> c? th? t筼 l筰 to祅 b? n╪g l鵦 c馻 b筺, b筺 x竎 nh薾 mu鑞 t筼 l筰 kh玭g?",
		2,
		"Л頲/change_all_points",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 确认要重造全部能力
function change_all_points()
	Say("Qu? tr譶h kh玦 ph鬰 n祔 s? ti猽 ph? 1 vi猲 <color=yellow>B竧 B秓 T葃 T駓 Ti猲 Кn<color> qu? b竨, b筺 x竎 nh薾 mu鑞 t筼 l筰 kh玭g?",
		2,
		"Л頲/confirm_change_all_points",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;

-- 最后确认要重造全部能力
function confirm_change_all_points()
	local nCurStrength = GetStrength()
	local nCurVitality = GetVitality()
	local nCurDexterity = GetDexterity()
	local nCurEnergy = GetEnergy()
	local nCurObserve = GetObserve()
	
	if ((nCurStrength <= 1) and 
		(nCurVitality <= 1) and 
		(nCurDexterity <= 1) and 
		(nCurEnergy <= 1) and 
		(nCurObserve <= 1)) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g B竧 B秓 T葃 T駓 Ti猲 Кn!", 0)
		return
	end

	if (DelItem(2, 0, 1046, 1) == 1) then
		SetStrength(1 - nCurStrength)
		SetVitality(1 - nCurVitality)
		SetDexterity(1 - nCurDexterity)
		SetEnergy(1 - nCurEnergy)
		SetObserve(1 - nCurObserve)
		
		Say("B筺  kh玦 ph鬰 <color=yellow>to祅 b? n╪g l鵦<color>!", 0)
		Msg2Player("B筺  kh玦 ph鬰 to祅 b? n╪g l鵦!")
	else
		Say("B筺 kh玭g c? <color=yellow>B竧 B秓 T葃 T駓 Ti猲 Кn<color>!", 0)
	end
end;

