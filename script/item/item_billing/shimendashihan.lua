------------------------------------------------------------
-- 师门大事函的脚本 shimendashihan.lua
--
-- comment: 使用后直接到达73级
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1021
------------------------------------------------------------

FACTION_EVENT_ID = 345		-- 师门任务大事件的任务ID存放的任务变量
shimendashihan_data = 87	-- 上次领取师门大事函的日期

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("B筺 mu鑞 d飊g <color=yellow>s? m玭 i s? h祄<color>? C? th? nh薾 m閠 nhi謒 v? i s? ki謓.",
		2,
		"Л頲/use_shimendashihan",
		"Kh玭g s? d鬾g/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function use_shimendashihan()
	local nCurLevel = GetLevel()
	if (nCurLevel < 50) then
		Say("B筺 ch璦 t n c蕄 <color=yellow>50<color>, kh玭g th? s? d鬾g s? m玭 i s? h祄!", 0)
		return
	end
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B籲g h鱱 ch璦 b竔 s? kh玭g th? s? d鬾g s? m玭 i s? h祄!", 0)
		return
	end
	
	--		          年	       月	       日
	local nCurrTime = {date("%Y"), date("%m"), date("%d")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nLastDate = GetTask(shimendashihan_data)
	if (nCurDate - nLastDate < 2) then
		Say("Hi謓 s? m玭 ch璦 c? nhi謒 v?, khi kh竎 h穣 quay l筰!", 0)
		return
	end
	
	local bHaveGotATask = GetTask(FACTION_EVENT_ID)
	if (bHaveGotATask ~= 0) then
		Say("B筺 ch璦 ho祅 th祅h nhi謒 v? trc, c? g緉g l猲!", 0)
		return
	end
	
	if (DelItem(2, 1, 1021, 1) == 1) then
		local nTaskID = StartFactionEvent()
		if (nTaskID ~= 0) then
			local nSel = random(1, 4)
			local strTaskInfo = QueryFactionEventInfo(nSel)
			Say(strTaskInfo, 0);
			Msg2Player("B筺 nh薾 頲 m閠 nhi謒 v? s? m玭 i s?!")
			SetTask(shimendashihan_data, nCurDate)
			SetTask(FACTION_EVENT_ID, nTaskID)
		end
	end
end;

