------------------------------------------------------------
-- 洗髓灵丹的脚本 xisuilingdan.lua
--
-- comment: 洗任意全部的一种潜能点（只留一点）。
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,137
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Sau khi d飊g <color=yellow>T葃 T駓 Linh Кn<color> c? th? kh玦 ph鬰 1 n╪g l鵦 t飝 ?, b筺 mu鑞 kh玦 ph鬰 n╪g l鵦 n祇?",
		6,
		"S鴆 m筺h/change_strength_all_points",
		"N閕 c玭g /change_energy_all_points",
		"G﹏ c鑤/change_vitality_all_points",
		"Th﹏ ph竝/change_dexterity_all_points",
		"Linh ho箃/change_observe_all_points",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;


-- 更改所有力量
function change_strength_all_points()
	Say("B筺 x竎 nh薾 mu鑞 kh玦 ph鬰 <color=yellow>S鴆 m筺h<color>?",
		2,
		"Л頲/confirm_strength_all",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;
-- 确认更改所有力量
function confirm_strength_all()

	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 Linh Кn!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetStrength(1 - nCurStrength)
		Say("B筺  th祅h c玭g kh玦 ph鬰 <color=yellow>S鴆 m筺h<color>!", 0)
		Msg2Player("B筺  th祅h c玭g kh玦 ph鬰 S鴆 m筺h!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 Linh Кn<color>!", 0)
	end
end;


-- 更改所有根骨
function change_vitality_all_points()
	Say("B筺 x竎 nh薾 mu鑞 kh玦 ph鬰 <color=yellow>G﹏ c鑤<color> ch??",
		2,
		"Л頲/confirm_vitality_all",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;
-- 确认更改所有根骨
function confirm_vitality_all()

	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 Linh Кn!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetVitality(1 - nCurVitality)
		Say("B筺  th祅h c玭g kh玦 ph鬰 <color=yellow>G﹏ c鑤<color>!", 0)
		Msg2Player("B筺  th祅h c玭g kh玦 ph鬰 G﹏ c鑤!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 Linh Кn<color>!", 0)
	end
end;


-- 更改所有身法
function change_dexterity_all_points()
	Say("B筺 x竎 nh薾 mu鑞 kh玦 ph鬰 <color=yellow>Th﹏ ph竝<color> ch??",
		2,
		"Л頲/confirm_dexterity_all",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;
-- 确认更改所有身法
function confirm_dexterity_all()

	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 Linh Кn!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetDexterity(1 - nCurDexterity)
		Say("B筺  th祅h c玭g kh玦 ph鬰 <color=yellow>Th﹏ ph竝<color>!", 0)
		Msg2Player("B筺  th祅h c玭g kh玦 ph鬰 Th﹏ ph竝!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 Linh Кn<color>!", 0)
	end
end;


-- 更改所有内功
function change_energy_all_points()
	Say("B筺 x竎 nh薾 mu鑞 kh玦 ph鬰 <color=yellow>N閕 c玭g<color> ch??",
		2,
		"Л頲/confirm_energy_all",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;
-- 确认更改所有内功
function confirm_energy_all()

	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 Linh Кn!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetEnergy(1 - nCurEnergy)
		Say("B筺  th祅h c玭g kh玦 ph鬰 <color=yellow>N閕 c玭g<color>!", 0)
		Msg2Player("B筺  th祅h c玭g kh玦 ph鬰 N閕 c玭g!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 Linh Кn<color>!", 0)
	end
end;


-- 更改所有洞察
function change_observe_all_points()
	Say("B筺 x竎 nh薾 mu鑞 kh玦 ph鬰 <color=yellow>Linh ho箃<color> ch??",
		2,
		"Л頲/confirm_observe_all",
		"Ta kh玭g mu鑞 kh玦 ph鬰--H駓 b?/cancel_dialog")
end;
-- 确认更改所有洞察
function confirm_observe_all()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 Linh Кn!", 0)
		return
	end
	
	if (DelItem(2, 0, 137, 1) == 1) then
		SetObserve(1 - nCurObserve)
		Say("B筺  th祅h c玭g kh玦 ph鬰 <color=yellow>Linh ho箃<color>!", 0)
		Msg2Player("B筺  th祅h c玭g kh玦 ph鬰 Linh ho箃!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 Linh Кn<color>!", 0)
	end
end;

