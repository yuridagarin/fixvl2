------------------------------------------------------------
-- 九天无极丹的脚本 jiutianwujidan.lua
--
-- comment: 使用后直接到达73级，3000声望，4000师门贡献度，5w都统军功
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1006
------------------------------------------------------------

TSK_USE = 1540

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 d飊g <color=yellow>C鰑 Thi猲 V? C鵦 n<color>? N? c? th? gi髉 b筺 t n c蕄 73, danh v鋘g 3000,  c鑞g hi課 s? m玭 4000 v? qu﹏ c玭g chi課 trng.",
		2,
		"Л頲/use_jiutianwuji_dan",
		"Kh玭g s? d鬾g/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_jiutianwuji_dan()
	local nCurLevel = GetLevel()
	local nCurRepu = GetReputation()
	local nCurFactionRepu = GetTask(336)
	local nZhanGong = GetTask(701)
	
	if GetTask(TSK_USE) ~= 0 then
		Say("B筺  s? d鬾g s? thu鑓 n祔.", 0)
		return
	end
	
	if (nCurLevel >= 73 and nCurRepu >= 3000 and nCurFactionRepu >= 4000 and (nZhanGong >= 50000 or nZhanGong <= -50000)) then
		Say("B筺  l? cao th? v? l﹎, kh玭g c莕 d飊g n s? thu鑓 n祔.", 0)
		return
	end
	
	Say("B筺 mu鑞 nh藀 phe c馻 Й th鑞g n祇?",
		3,
		"Й th鑞g_T鑞g/#real_do_with_camp(1)",
		"Й th鑞g phe Li猽/#real_do_with_camp(2)",
		"Kh玭g s? d鬾g/cancel_dialog")
end;

function real_do_with_camp(nCamp)
	local nCurLevel = GetLevel()
	local nCurRepu = GetReputation()
	local nCurFactionRepu = GetTask(336)
	local nZhanGong = GetTask(701)
	
	if (DelItem(2, 1, 1006, 1) == 1) then
		SetTask(TSK_USE,1)
		
		if (nCurLevel < 73) then
			SetLevel(73, 454)
			ResetProperty()
		end
	
		if (nCurRepu < 3000) then
			ModifyReputation(3000 - nCurRepu, 0)
		end
	
		if (nCurFactionRepu < 4000) then
			SetTask(336, 4000)
		end
	
		if (nCamp == 1 and nZhanGong < 50000) then	--成为宋方都统
			SetTask(701,50000)	--设置宋方军功
			SetTask(704,3)	--设置宋方当前军衔
			if GetTask(745) < 3 then	--如果之前宋方军衔小于都统
				SetTask(745,3)	--设置宋方最高军衔
			end;
			if GetTask(702) < 50000 then
				SetTask(702,50000);	--设置宋方最高军功
			end;
		elseif (nCamp == 2 and nZhanGong > -50000) then	--成为辽方都统
			SetTask(701,-50000)	--设置辽方军功
			SetTask(704,-3)	--设置辽方当前军衔
			if GetTask(746) > -3 then	--如果之前辽方军衔小于都统
				SetTask(746,-3)	--设置辽方最高军衔
			end;
			if GetTask(703) < 50000 then
				SetTask(703,50000);	--设置辽方最高军功
			end;
		end;
		
		ModifyExp(20000000)
	
		Say("B筺  l? cao th? v? l﹎, v? sau c? th? h祅h hi謕 trng ngh躠!", 0)
	end
end;

