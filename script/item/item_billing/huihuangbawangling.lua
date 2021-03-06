------------------------------------------------------------
-- 辉煌霸王令的脚本 huihuangbawangling.lua
--
-- comment: 使用后直接到达73级
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID: 2, 1, 1025
------------------------------------------------------------

SHINING_NIGHT_DATE = 83		-- 师门任务大事件的任务ID存放的任务变量
SHINING_NIGHT_COUNT = 84	-- 上次领取师门大事函的日期

-- 脚本被程序默认调用的入口函数
function OnUse()
	Say("<color=yellow>B? Vng L謓h<color> s? quy誸 nh n閕 dung m huy ho祅g h玬 nay, b筺 mu鑞 d飊g <color=yellow>B? Vng l謓h<color>?",
--		7,
--		"战场/#vote_shining_night(0)",
		6,
		"Thng h閕/#vote_shining_night(1)",
		"Nhi謒 v? s? m玭 - ng蓇 nhi猲/#vote_shining_night(2)",
		"Nhi謒 v? s? m玭 tu莕 ho祅/#vote_shining_night(3)",
		"Nhi謒 v? s竧 th?/#vote_shining_night(4)",
		"Thuy襫 r錸g/#vote_shining_night(5)",
		"Kh玭g s? d鬾g/cancel_dialog")
end;

-- 退出对话，不做任何操作
function cancel_dialog()
end;

function vote_shining_night(nChoice)
	strTab = {"Chi課 trng", "Thng h閕", "Nhi謒 v? s? m玭 - ng蓇 nhi猲", "Nhi謒 v? s? m玭 tu莕 ho祅", "Nhi謒 v? s竧 th?", "Thuy襫 r錸g"}

	--		          年	       月	       日
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- 现在的日期
	local nCurHour = tonumber( nCurrTime[4] )
	local nLastDate = GetTask(SHINING_NIGHT_DATE)
	local nShiningCount = GetTask(SHINING_NIGHT_COUNT)
	
	if (nCurHour > 19) then
		Say("Ho箃 ng m huy ho祅g c馻 ng祔 h玬 nay  k誸 th骳, m阨 b筺 ng祔 mai h穣 quay l筰!", 0)
		return
	end
	
	if (DelItem(2, 1, 1025, 1) == 1) then
		if (nCurDate > nLastDate) then
			SetTask(SHINING_NIGHT_DATE, nCurDate)
			nShiningCount = 0
		end
		
		nShiningCount = nShiningCount + 1
		SetTask(SHINING_NIGHT_COUNT, nShiningCount)
		Say("Зy l? l莕 th? "..nShiningCount.."s? d鬾g B? Vng l謓h! Ho箃 ng 頲 ch鋘 l?"..strTab[nChoice + 1], 0)
		
		VoteForShiningNight(nChoice, nShiningCount)
		
		local szPlayerName = GetName()
		local msg="Thi誹 hi謕 "..szPlayerName.." S? d鬾g B? Vng l謓h ch鋘 ho箃 ng m huy ho祅g h玬 nay l? "..strTab[nChoice + 1]
		AddGlobalNews(msg)
	end
end;

