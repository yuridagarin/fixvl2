------------------------------------------------------------
-- 麒麟丸的脚本 qilinwan.lua
--
-- comment: 使用后直接到达3000声望
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1003
------------------------------------------------------------

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 d飊g <color=yellow>K? L﹏ ho祅<color>? B筺 s? nh薾 頲 3000 甶觤 danh v鋘g.",
		2,
		"Л頲/use_qilin_wan",
		"Kh玭g s? d鬾g/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_qilin_wan()
	local nCurRepu = GetReputation()
	if (nCurRepu >= 3000) then
		Say("Danh v鋘g c馻 b筺  t <color=yellow>3000<color> kh玭g c莕 d飊g th猰 K? L﹏ ho祅!", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 31) then
		Say("Ъng c蕄 b筺 ch璦 t <color=yellow>31<color> kh玭g th? s? d鬾g K? L﹏ ho祅!", 0)
		return
	end
	
	if (DelItem(2, 1, 1003, 1) == 1) then
		ModifyReputation(3000 - nCurRepu, 0)
		Say("Danh v鋘g c馻 b筺  t <color=yellow>3000<color>!", 0)
		Msg2Player("Danh v鋘g c馻 b筺  t 3000!")
	end
end;

