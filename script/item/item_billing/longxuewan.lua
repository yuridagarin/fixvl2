------------------------------------------------------------
-- 龙血丸的脚本 longxuewan.lua
--
-- comment: 使用后直接到达73级
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1002
------------------------------------------------------------
Include("\\script\\lib\\writelog.lua")

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 d飊g <color=yellow>Long Huy誸 ho祅<color>? B筺 s? l藀 t鴆 t c蕄 73.",
		2,
		"Л頲/use_longxue_wan",
		"Kh玭g s? d鬾g/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_longxue_wan()
	local nCurLevel = GetLevel()
	if (nCurLevel >= 73) then
		Say("B筺  t c蕄 <color=yellow>73<color> kh玭g th? d飊g Long Huy誸 ho祅!", 0)
		return
	end
	
	if (DelItem(2, 1, 1002, 1) == 1) then
		ResetProperty()
		SetLevel(73, 469)
		ModifyExp(20000000)
		Say("B筺  t c蕄 <color=yellow>73<color> v? 甶觤 ti襪 n╪g  頲 t葃, xin ng nh藀 l筰!", 0)
		Msg2Player("B筺  t c蕄 73 ng th阨 nh薾 頲 2000 v筺 kinh nghi謒. Xin ng nh藀 l筰!")
		WriteLogEx("Giang Sinh 2008","s? d鬾g Long Huy誸 Ho祅")
	end
end;

