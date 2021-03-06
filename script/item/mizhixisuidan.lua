------------------------------------------------------------
-- 洗髓丹的脚本 xisuidan.lua
--
-- comment: 洗任意5点潜能点。
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,136
------------------------------------------------------------

CHANGE_POINTS = -5

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Sau khi d飊g <color=yellow>T葃 T駓 n<color> c? th? s鯽 i 5 甶觤 n╪g l鵦 c? b秐, b筺 mu鑞 i n╪g l鵦 c? b秐 n祇?",
		6,
		"S鴆 m筺h/change_strength_5_points",
		"N閕 c玭g /change_energy_5_points",
		"G﹏ c鑤/change_vitality_5_points",
		"Th﹏ ph竝/change_dexterity_5_points",
		"Linh ho箃/change_observe_5_points",
		"Ta kh玭g mu鑞 s鯽 i--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;


-- 更改5点力量
function change_strength_5_points()
	Say("B筺 x竎 nh薾 mu鑞 s鯽 i 5 甶觤 <color=yellow>S鴆 m筺h<color> ch??",
		2,
		"Л頲/confirm_strength_5",
		"Ta kh玭g mu鑞 s鯽 i--H駓 b?/cancel_dialog")
end;
-- 确认更改5点力量
function confirm_strength_5()

	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 n!", 0)
		return
	end
	
	if (DelItem(2, 0, 1044, 1) == 1) then
		SetStrength(CHANGE_POINTS)
		Say("B筺  thay i th祅h c玭g 5 甶觤 <color=yellow>S鴆 m筺h<color>!", 0)
		Msg2Player("B筺  thay i th祅h c玭g 5 甶觤 S鴆 m筺h!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 n<color>!")
	end
end;


-- 更改5点根骨
function change_vitality_5_points()
	Say("B筺 x竎 nh薾 mu鑞 s鯽 i 5 甶觤 <color=yellow>G﹏ c鑤<color> ch??",
		2,
		"Л頲/confirm_vitality_5",
		"Ta kh玭g mu鑞 s鯽 i--H駓 b?/cancel_dialog")
end;
-- 确认更改5点根骨
function confirm_vitality_5()
	
	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 n!", 0)
		return
	end

	if (DelItem(2, 0, 1044, 1) == 1) then
		SetVitality(CHANGE_POINTS)
		Say("B筺  thay i th祅h c玭g 5 甶觤 <color=yellow>G﹏ c鑤<color>!", 0)
		Msg2Player("B筺  thay i th祅h c玭g 5 甶觤 G﹏ c鑤!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 n<color>!")
	end
end;


-- 更改5点身法
function change_dexterity_5_points()
	Say("B筺 x竎 nh薾 mu鑞 s鯽 i 5 甶觤 <color=yellow>Th﹏ ph竝<color> ch??",
		2,
		"Л頲/confirm_dexterity_5",
		"Ta kh玭g mu鑞 s鯽 i--H駓 b?/cancel_dialog")
end;
-- 确认更改5点身法
function confirm_dexterity_5()
	
	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 n!", 0)
		return
	end

	if (DelItem(2, 0, 1044, 1) == 1) then
		SetDexterity(CHANGE_POINTS)
		Say("B筺  thay i th祅h c玭g 5 甶觤 <color=yellow>Th﹏ ph竝<color>!", 0)
		Msg2Player("B筺  thay i th祅h c玭g 5 甶觤 Th﹏ ph竝!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 n<color>!")
	end
end;


-- 更改5点内功
function change_energy_5_points()
	Say("B筺 x竎 nh薾 mu鑞 s鯽 i 5 甶觤 <color=yellow>N閕 c玭g<color> ch??",
		2,
		"Л頲/confirm_energy_5",
		"Ta kh玭g mu鑞 s鯽 i--H駓 b?/cancel_dialog")
end;
-- 确认更改5点内功
function confirm_energy_5()
	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 n!", 0)
		return
	end

	if (DelItem(2, 0, 1044, 1) == 1) then
		SetEnergy(CHANGE_POINTS)
		Say("B筺  thay i th祅h c玭g 5 甶觤 <color=yellow>N閕 c玭g<color>!", 0)
		Msg2Player("B筺  thay i th祅h c玭g 5 甶觤 N閕 c玭g!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 n<color>!")
	end
end;


-- 更改5点洞察
function change_observe_5_points()
	Say("B筺 x竎 nh薾 mu鑞 s鯽 i 5 甶觤 <color=yellow>Linh ho箃<color> ch??",
		2,
		"Л頲/confirm_observe_5",
		"Ta kh玭g mu鑞 s鯽 i--H駓 b?/cancel_dialog")
end;
-- 确认更改5点洞察
function confirm_observe_5()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("Hi謓 b筺 kh玭g c莕 d飊g T葃 T駓 n!", 0)
		return
	end
	
	if (DelItem(2, 0, 1044, 1) == 1) then
		SetObserve(CHANGE_POINTS)
		Say("B筺  thay i th祅h c玭g 5 甶觤 <color=yellow>Linh ho箃<color>!", 0)
		Msg2Player("B筺  thay i th祅h c玭g 5 甶觤 Linh ho箃!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>T葃 T駓 n<color>!")
	end
end;

