------------------------------------------------------------
-- 消劫散的脚本 xiaojiesan.lua
--
-- comment: 洗1点PK值
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,141
------------------------------------------------------------

CHANGE_PK_VALUE = -1

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("Sau khi d飊g <color=yellow>Ti猽 Ki誴 t竛<color> c? th? gi秏 甶 1 甶觤 PK, d飊g ch??",
		2,
		"Л頲/decrease_1_PK_points",
		"Ta kh玭g mu鑞 d飊g--H駓 b?/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

-- 确认减少一点PK值
function decrease_1_PK_points()
	local nCurPKValue = GetPKValue()
	if (nCurPKValue <= 0) then
		Say("<color=yellow>Tr? PK<color> c馻 b筺 l? 0, kh玭g c莕 d飊g Ti猽 Ki誴 t竛!", 0)
		return
	end

	if (DelItem(2, 0, 141, 1) == 1) then
		AddPKValue(CHANGE_PK_VALUE)
		Say("<color=yellow>Tr? PK<color> c馻 b筺 gi秏 1 甶觤.", 0)
		Msg2Player("B筺  gi秏 1 甶觤 PK!")
	else
		Say("B筺 kh玭g mang theo <color=yellow>Ti猽 Ki誴 t竛<color>!", 0)
	end
end;
