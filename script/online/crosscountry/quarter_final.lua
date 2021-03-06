-- 复赛

-- 复赛的内容表
-- 返回值为得分
-- 第一列是说明，第二列是初始值，第三列是当前的值
tQUARTER_FINAL_HEAD =
{
	{"c? ph秈  t 頲 c蕄 70                             ","return 0"					, "return ChkLevel()"	},
	{"c? ph秈  h鋍 頲 k? n╪g v? c玭g c蕄 55                     ","return 0"					, "return ChkLearnSkill()"	},
	{"Ho祅 th祅h nhi謒 v? thng h閕, s? lt l?:                         ","return GetShanghuiChance()", "return GetShanghuiChance()"},
	{"Ho祅 th祅h nhi謒 v? Truy n?, s? lt l?:                         ","return GetTongjiChance()"	, "return GetTongjiChance()"}, 
	{" 甶觤 t輈h l騳 chi課 trng                                 ","return GetBattlePoint()"	, "return GetBattlePoint()"},
	{"c? ph秈  ho祅 th祅h n.v ch? tuy課 Bi謓 Kinh - Long H? Th玭 S琻 H?.        ","return 0"					, "return ChkTask(140, 59)"	},
	{"c? ph秈  ho祅 th祅h n.v ch? tuy課 Th祅h Й - Thanh phong d? kh?","return 0"					, "return ChkTask(150, 33)"	},
	{"c? ph秈  ho祅 th祅h n.v ch? tuy課 Tuy襫 Ch﹗, hi觰 頲 ch﹏ tng?          ","return 0"					, "return ChkTask(147, 7)"	},
	{"c? ph秈  ho祅 th祅h nhi謒 v? Phong Й - nh b筰 Ng? Vi謙 l穙 t?  ","return 0"					, "return ChkTask(1402, 90)"	},
	{"c? ph秈  ho祅 th祅h nhi謒 v? Thi猲 M玭 Tr薾- h錳 ﹎ cho Dng Nghi謕        ","return 0"					, "return ChkTaskTmz()"	},
	{"c? ph秈  ho祅 th祅h n.v ch? tuy課 T﹜ Nam - c琻 ph蒼 n? c馻 Ng? чc Gi竜      ","return 0"					, "return ChkTask(1316, 3)"	},
	{"Th猰 l璾 ph竔                                 ","return 0"					, "return GetRouteAddition()"	},
}

THE_FILE = "\\script\\online\\crosscountry\\quarter_final.lua"

function GetRouteAddition()
	local t =
	{
		[8] = 5,	-- 峨嵋佛家
		[9] = 10,	-- 峨嵋俗家
		[17] = 5, 	-- 枪骑
		[18] = 10, -- 弓骑
		[20] = 10, -- 邪侠
		[21] = 10, -- 蛊师
	}
	local nRoute = GetPlayerRoute()
	if t[nRoute] == nil then
		return 0
	else
		return t[nRoute]
	end
end

function ChkTaskTmz()
	if GetTask(1401) == 125 or GetTask(1401) == 135 then
		return 5
	else
		return 0
	end
end

function ChkTask(nTaskid, nValue)
	if GetTask(nTaskid) >= nValue then
		return 5
	else
		return 0
	end
end

function ChkLevel()
	if GetLevel() >= 70 then
		return 5
	else
		return 0
	end
end

function ChkLearnSkill()
	t =
	{
		[2] = 31,	-- 少林俗家，达摩武经
		[3] = 56,	-- 少林禅僧，大力金刚指
		[4] = 43,	-- 少林武僧，少林龙爪手
		[6] = 73,	-- 唐门，满天花雨
		[8] = 88,	-- 峨嵋佛家，大慈大悲咒
		[9] = 101,	-- 峨嵋俗家，迷心飘香曲
		[11] = 112,	-- 丐帮净衣，醉拳
		[12] = 123, -- 丐帮污衣，打狗棍法
		[14] = 145, -- 武道，真武七截剑
		[15] = 158, -- 笔武，上清无极功
		[17] = 731, -- 枪骑，碧月飞星枪
		[18] = 744, -- 弓骑，流光绝影箭
		[20] = 377, -- 邪侠，尸裂魔功
		[21] = 363, -- 蛊师，蠶蛊
		[23] = 1030,
		[29] = 1176,
		[30] = 1229,
	}
	local nRoute = GetPlayerRoute()
	if t[nRoute] == nil then
		return 0
	else
		local nRet = HaveLearnedSkill(t[nRoute])
		if nRet == nil then
			return 0
		elseif nRet == 0 then
			return 0
		else
			return 5
		end
	end
end

function GetShanghuiChance()
	local nReadyLun = CustomDataRead("yueye_shanghui")		-- 已经完成的轮数
	if nReadyLun == nil then
		nReadyLun = 0
	end
	local nLun = floor(GetTask(390) / 10)
	return nReadyLun + nLun
end

function GetShanghuiChanceDiff(nLun)
	if nLun < 0 then
		return 0
	end
	
	local nLun = floor(nLun / 10)
	if nLun >= 20 then
		nLun = 20
	end
	return nLun * 2
end

function GetBattlePoint()
	return GetTask(747)
end

function GetBattlePointDiff(nPoint)
	if nPoint < 0 then
		return 0
	end
	
	local nDiff = floor(nPoint / 10000)
	if nDiff >= 20 then
		nDiff = 20
	end
	return nDiff * 5
end

function GetTongjiChance()
	return GetTask(1108)
end

function GetTongjiChanceDiff(nChance)
	if nChance < 0 then
		return 0
	end
	
	local nDiff = floor(nChance / 20)
	if nDiff >= 20 then
		nDiff = 20
	end
	return nDiff
end

function GetCaptainIndex()
	return GetTeamMember(0)
end

function YY_SaveData(szKey, t)
	local nCount = getn(t)
	local szFormat = ""
	local szResult = ""
	local szSplit = ", "
	local nSplitLen = strlen(szSplit)
	for i=1, nCount do
		if type(t[i]) == "number" and floor(t[i]) == t[i] then
			szFormat = szFormat.."d"
			szResult = szResult..t[i]..szSplit
		elseif type(t[i]) == "number" then
			szFormat = szFormat.."f"
			szResult = szResult..t[i]..szSplit
		elseif type(t[i]) == "string" then
			szFormat = szFormat.."s"
			szResult = szResult..format("%q", t[i])..szSplit
		end
	end
	szResult = strsub(szResult, 1, strlen(szResult) - nSplitLen)
	szResult = "CustomDataSave("..format("%q", szKey)..szSplit..format("%q", szFormat)..szSplit..szResult..")"
	dostring(szResult)
end

function YY_GetData(...)
	local t = {}
	for i=1, getn(arg) do
		if tonumber(arg[i]) == nil then
			t[i] = arg[i]
		else
			t[i] = tonumber(arg[i])
		end
	end
	return t
end

-- 根据tQUARTER_FINAL_HEAD表生成结果表的结构
function YY_MakeQuarterFinalInfo(nType)
	local tResult = {}
	
	-- 如果是生成初始化的数据，则提前有效的数据都记为0
	if nType == 0 then
		nRow = 2
	elseif nType == 1 then
		nRow = 3
	end
	
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		tResult[i] = dostring(tQUARTER_FINAL_HEAD[i][nRow])
	end
	return tResult
end

function qf_team_operation()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	
	local szSay = "Ngi mu鑞 ti課 h祅h thao t竎 n祇?"
	local t =
	{
		"b竜 danh tr薾 b竛 k誸./qf_signup",
	}
	if szCaptainName ~= nil then
		tinsert(t, 2, "Tra xem  c鑞g hi課 c馻 m譶h./qf_offer")
		if szCaptainName == "" then
			tinsert(t, 3, "Tra xem k誸 qu?/queue_member_status")
			tinsert(t, 4, "Tra xem t鎛g 甶觤 chi課 i./refer_point")
		end
	end
	tinsert(t, getn(t)+1, "R阨 kh醝/end_say")
	Say(szSay, getn(t), t)
end

function qf_offer()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil then
		Talk(1, "", "Ch? c? th祅h vi猲 chi課 i m韎 l祄 頲.")
		return
	end
	
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	nPoint = CountPoint(tDiff)
	local szSay = "chi課 i c馻 b筺,  c鑞g hi課 l?: <color=yellow>["..nPoint.."]<color> 甶觤\n(c? th?  c鑞g hi課 chi課 i nhi襲 h琻 so v韎 th鵦 t? do s? sai bi謙 th阨 gian t輓h to竛)"
	Say(szSay, 2, "Tra xem t譶h h譶h chi課 i./show_detail", "R阨 kh醝/end_say")
end

function show_detail()
	local szShow = ""
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	
	for i=1, 6 do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." 觤: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,2,"Trang k?/next_page","R阨 kh醝/end_say")
end

function next_page()
	local szShow = ""
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tDefault = YY_GetData(CustomDataRead("yueye_quarter_final_default"))
	local tDiff = CalcResult(1, tNow, tDefault)
	
	local nCount = getn(tQUARTER_FINAL_HEAD)
	for i=7, nCount do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." 觤: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,2,"Trang trc/show_detail","R阨 kh醝/end_say")
end

function queue_member_status()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil or szCaptainName ~= "" then
		Talk(1, "", "Ch? c? i trng chi課 i m韎 c? th? l祄 thao t竎 n祔.")
	end
	
	local szSay = "B筺 mu鑞 xem tin t鴆 th祅h vi猲 n祇?"
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	for i=1, getn(tMember) do
		tMember[i] = tMember[i].."/#show_member_status("..i..")"
	end
	tinsert(tMember, getn(tMember) + 1, "R阨 kh醝/end_say")
	Say(szSay, getn(tMember), tMember)
end

function refer_point()
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil or szCaptainName ~= "" then
		Talk(1, "", "Ch? c? i trng chi課 i m韎 c? th? l祄 thao t竎 n祔.")
	end
	
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local nPoint = 0
	for i=1, getn(tMember) do
		local tMemberResult = YY_GetData(CustomDataRead(tMember[i]))
		nPoint = nPoint + CountPoint(tMemberResult)
	end
	-- 排名
	AddRelayShareData("yueye", 0, 0, THE_FILE,
						"AddShareDataCallBack", 2, GetName(), "d", nPoint)
	-- 存盘，保持数据和relay是一致的
	SaveNow()
	Say("B筺  c藀 nh藅 th祅h c玭g 甶觤 chi課 i i m譶h, h穣 tra xem tin t鴆 m韎 nh蕋 v? th? h筺g chi課 i c馻 b筺.", 0)
end

function show_member_status(index)
	local szShow = ""
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local tDiff = YY_GetData(CustomDataRead(tMember[index]))
	local nPoint = CountPoint(tDiff)
	szShow = "T鎛g 甶觤: <color=yellow>"..nPoint.."<color>\n"
	for i=1, 6 do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." 觤: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,3,"Trang k?/#member_next_page("..index..")","tr? l筰/queue_member_status", "R阨 kh醝/end_say")
end

function member_next_page(index)
	local szShow = ""
	local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
	local tDiff = YY_GetData(CustomDataRead(tMember[index]))
	for i=7, getn(tQUARTER_FINAL_HEAD) do
		szShow = szShow..tQUARTER_FINAL_HEAD[i][1].." 觤: <color=yellow>"..floor(tDiff[i] + 0.5).."<color>\n"
	end
	Say(szShow,3,"Trang trc/#show_member_status("..index..")","tr? l筰/queue_member_status", "R阨 kh醝/end_say")
end

function qf_signup()
	if check_can_signup() ~= 1 then
		return
	end
	
	local nSize = GetTeamSize()
	local szSay = "Chi課 i c馻 b筺  th醓 甶襲 ki謓 b竜 danh,"
	if nSize < 8 then
		szSay = szSay.."<color=red>s? th祅h vi猲 1 chi課 i t鑙 產 l? 8 ngi, hi謓  c?"..nSize.." th祅h vi猲<color>, b筺 c? ng ? b竜 danh kh玭g?"
	else
		szSay = szSay.."B竜 danh ch??"
	end
	
	Say(szSay, 3, "Tra xem danh s竎h th祅h vi猲/show_member_list", "\nng ? b竜 danh\n\n/confirm_signup", "в ta suy ngh?!/end_say")
end

function show_member_list()
	-- 生成队员信息
	local nSize = GetTeamSize()
	local nCount = 1
	tMember = {}
	szMemberInfo = "чi trng:<color=yellow>"..GetName().."<color>"
	local nOldPlayer = PlayerIndex
	for i=1, nSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 and PlayerIndex ~= GetCaptainIndex() then
			szMemberInfo = szMemberInfo.."\nTh祅h vi猲"..nCount..":<color=green>"..GetName().."<color>"
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldPlayer
	Talk(1, "qf_signup", szMemberInfo)
end

function check_can_signup()
	-- 不组队是不行滴
	local nResult = 1
	if GetTeamSize() < 1 then
		Say("Ch? c? l藀 t? i m韎 c? th? tham gia tr薾 b竛 k誸.", 2, "Li猲 quan t筼 l藀 t? i./about_quarter_final_team", "R阨 kh醝/end_say")
		return 0
	end
	
	-- 不是队长是不行滴
	if PlayerIndex ~= GetCaptainIndex() then
		Say("Ch? c? i trng m韎 c? th? b竜 danh", 2, "Li猲 quan t筼 l藀 t? i./about_quarter_final_team", "R阨 kh醝/end_say")
		return 0
	end
	
	-- 队长不是比赛帐号，没有完成初赛是不行滴
	if GetTask(1785) == 0 then
		Say("чi trng ph秈 l? t礽 kho秐 tham gia ch箉 b? ng th阨 ng c蕄 ph秈 t? 30 tr? l猲 m韎 c? th? tham gia b竜 danh.", 2, "Li猲 quan t筼 l藀 t? i./about_quarter_final_team", "R阨 kh醝/end_say")
		return 0
	end
	
	-- 队员中已经组建过队伍或者参加过队伍的人是不行滴
	local nOldPlayer = PlayerIndex
	local szMsg = ""
	local szSplit = ","
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nRet = CustomDataRead("yueye_is_join_team")
		if nRet ~= nil then
			nResult = 0
			szMsg = szMsg.."<color=yellow> "..GetName().."<color>"..szSplit
		end
	end
	PlayerIndex = nOldPlayer
	if nResult == 0 then
		szMsg = strsub(szMsg, 1, strlen(szMsg) - strlen(szSplit))
		szMsg = szMsg.."B筺  l? th祅h vi猲 c馻 chi課 i kh竎, kh玭g th? t筼 l藀 t? i m韎."
		PlayerIndex = nOldPlayer
		Say("<color=green>S? gi? vi謙 d?<color>:"..szMsg, 0)
	end
	return nResult
end

function qf_get_award()
	-- 不是战队里的人是不行滴
	local isCaptain = 0
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName == nil then
		Say("Ch? c? th祅h vi猲 chi課 i m韎 c? th? nh薾 ph莕 thng.", 0)
		return
	elseif szCaptainName ~= "" then		-- 队员
		-- 不组队是不行滴
		if GetTeamSize() < 1 then
			Say("Ch? c? t? i c飊g v韎 i trng chi課 i m韎 c? th? nh薾 ph莕 thng.", 0)
		end
		-- 队长不是战队队长是不行滴
		local nOldPlayer = PlayerIndex
		PlayerIndex = GetTeamMember(0)
		if PlayerIndex <= 0 then
			return 0
		end
		if szCaptainName ~= GetName() then
			Say("Ch? c? t? i c飊g v韎 i trng chi課 i m韎 c? th? nh薾 ph莕 thng.", 0)
			return 0
		end
		PlayerIndex = nOldPlayer
	else
		isCaptain = 1
	end
	
	-- 今天领过滴是不行滴
	local nDateNow = tonumber(date("%j"))
	if nDateNow <= nDate then
		Say("H玬 nay b筺  nh薾 ph莕 thng.", 0)
		return 0
	end
	
	-- ok，可以领取鼓励了
	local nReputation = 50
	ModifyReputation(nReputation, 0)
	Talk(1,"", "B筺 nh薾 頲 "..nReputation.." 甶觤 danh v鋘g. \n甶觤 t輈h l騳 tr薾 b竛 k誸 c馻 b筺  chuy觧 n i trng.")
	WriteLog("Tr筰 Vi謙 d? "..GetName().."Х nh薾 ph莕 thng ng祔: "..nReputation.." 甶觤 danh v鋘g"..date("%H%M"))
	-- 记录今天领取过了
	CustomDataSave("yueye_is_join_team", "sd", szCaptainName, nDateNow)
	
	-- 汇总积分
	local nDiffDate = nDateNow - nDate
	qf_point_collect(nDiffDate, isCaptain)
end

function confirm_signup()
	if check_can_signup() ~= 1 then
		return
	end
	local nDate = tonumber(date("%j"))
	
	-- 队长记录队伍信息
	local nOldPlayer = PlayerIndex
	local szCaptainName = GetName()
	local nCount = 1
	local tMemberInfo = {}
	local tResult = {}
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			tMemberInfo[i] = GetName()
			if PlayerIndex ~= GetCaptainIndex() then
				-- 是否已经组建了战队，存在此项目表示已经组建过战队
				-- 队员记录队长名字，再后是上次领取鼓励品的时间
				CustomDataSave("yueye_is_join_team", "sd", szCaptainName, nDate-1)
				
				tResult[nCount] = YY_MakeQuarterFinalInfo(0)
				-- 每个人身上记录复赛比赛开始时的完成情况
				YY_SaveData("yueye_quarter_final_default", tResult[nCount])
				YY_SaveData("yueye_quarter_final_last", tResult[nCount])
				nCount = nCount + 1
			end
		end
	end
	PlayerIndex = nOldPlayer
	
	-- 是否已经组建了战队，存在此项目表示已经组建过战队，队长不用记录自己的名字
	CustomDataSave("yueye_is_join_team", "sd", "", nDate-1)
	YY_SaveData("yueye_all_member_name", tMemberInfo)
	-- 队长身上也要记录自己在复赛比赛开始时的完成情况
	local tSelf = YY_MakeQuarterFinalInfo(0)
	YY_SaveData("yueye_quarter_final_default", tSelf)
	YY_SaveData("yueye_quarter_final_last", tSelf)
	
	-- 队长身上记录所有队员(包括自己)的复赛比赛完成情况(即复赛以后变化的数据)
	local tMemberResult = {}
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		tMemberResult[i] = 0
	end
	for i=1, getn(tMemberInfo) do
		YY_SaveData(tMemberInfo[i], tMemberResult)
	end
	show_signup_result()
	-- 立刻存盘
	nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			SaveNow()
		end
	end
	PlayerIndex = nOldPlayer
end

function show_signup_result()
	local nOldPlayer = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex ~= GetCaptainIndex() then
			local szCaptainName = CustomDataRead("yueye_is_join_team")
			local szMsg = "B筺  th祅h c玭g gia nh藀 <color=green>"..szCaptainName.."<color> chi課 i."
			Talk(1, "", szMsg)
		else
			local t = YY_GetData(CustomDataRead("yueye_all_member_name"))
			local szMsg = "B筺  th祅h c玭g t筼 l藀 chi課 i, th祅h vi猲 l?:"
			for i=1, getn(t) do
				szMsg = szMsg.."\n"..i..":<color=green>"..t[i].."<color>"
			end
			Talk(1, "", szMsg)
		end
	end
end

function CalcResult(nScale, tNow, tLast)
	local tResult = {}
	
	for i=1, getn(tLast) do
		tResult[i] = tonumber(tNow[i]) - tonumber(tLast[i])
	end

	-- 根据积分规则算差异
	for i=1, getn(tQUARTER_FINAL_HEAD) do
		if i == 3 then		-- 商会
			tResult[i] = GetShanghuiChanceDiff(tResult[i])
		elseif i == 4 then	-- 通缉
			tResult[i] = GetTongjiChanceDiff(tResult[i])
		elseif i == 5 then	-- 战场
			tResult[i] = GetBattlePointDiff(tResult[i])
		end
		tResult[i] = tResult[i] * nScale
	end
	return tResult
end

function Add2Table(t1, t2)
	local tResult = {}
	for i=1, getn(t1) do
		tResult[i] = tonumber(t1[i]) + tonumber(t2[i])
	end
	return tResult
end

function qf_point_collect(nDiffDate, isCaptain)
	local nScale = 1
	if nDiffDate > 5 then
		nScale = 0.8
	end
	
	-- 计算差值
	local tNow = YY_MakeQuarterFinalInfo(1)
	local tLast = YY_GetData(CustomDataRead("yueye_quarter_final_last"))
	local tDiff = CalcResult(nScale, tNow, tLast)
	
	-- 把现在的结果保存起来，用于下次算差值
	YY_SaveData("yueye_quarter_final_last", tNow)
	
	local szName = GetName()
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		local t = YY_GetData(CustomDataRead(szName))
		tDiff = Add2Table(t, tDiff)
		YY_SaveData(szName, tDiff)
	end
	PlayerIndex = nOldPlayer
	
	if isCaptain == 1 then	-- 队长把所有数据处理后加入排行榜
		local tMember = YY_GetData(CustomDataRead("yueye_all_member_name"))
		local nPoint = 0
		for i=1, getn(tMember) do
			local tMemberResult = YY_GetData(CustomDataRead(tMember[i]))
			nPoint = nPoint + CountPoint(tMemberResult)
		end
		-- 排名
		AddRelayShareData("yueye", 0, 0, THE_FILE,
							"AddShareDataCallBack", 2, GetName(), "d", nPoint)
		-- 存盘，保持数据和relay是一致的
		SaveNow()
	end
end

function qf_rank()
	ApplyRelayShareData("yueye", 0, 0, THE_FILE, "ApplyCallBack")
end

function ApplyCallBack(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Talk(1,"","Hi謓 t筰 cu閏 畊a vi謙 d? v蒼 ch璦 x誴 h筺g.")
		return
	end
	
	local nRankCount = 0
	if nCount > 10 then
		nRankCount = 10
	else
		nRankCount = nCount
	end
	
	-- 无奈啊，没办法，Say,Talk都不能完全显示10个排名，只能这样了
	CustomDataSave("yueye_rank_count", "d", nRankCount)
	for i=1, nRankCount do
		local t = YY_GetData(GetRelayShareDataByIndex(szKey, nKey1, nKey2, i - 1))
		YY_SaveData("yueye_rank"..i, t)
	end
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	if szCaptainName ~= nil then
		if szCaptainName == "" then
			szCaptainName = GetName()
		end
		local nMySortType, szMyName, nMyPoint, nMyRank = GetRelayShareDataByKey(szKey, nKey1, nKey2, szCaptainName)
		if nMySortType ~= nil then
			CustomDataSave("yueye_rank_mine", "sdd", szMyName, nMyPoint, nMyRank)
		else
			CustomDataSave("yueye_rank_mine", "sdd", "", 0, 0)
		end
	end
	
	-- 这里的Relay数据是随时变化的，所以要删除Gamesvr这边的副本记录
	DelRelayShareDataCopy(szKey, nKey1, nKey2)
	show_rank_data(1)
end

function show_rank_data(index)
	local szResult = "Th? h筺g甶觤 s? t猲 i trng"
	local szCaptainName, nDate = CustomDataRead("yueye_is_join_team")
	local nRankCount = CustomDataRead("yueye_rank_count")
	if index > nRankCount then
		return
	end
	
	local nCount = index + 5	-- 一页显示6个排名
	if nCount > nRankCount then
		nCount = nRankCount
	end
	
	if szCaptainName == nil	then		-- 路人看结果啦
		for i=index, nCount  do
			local nSortType, szName, nPoint = CustomDataRead("yueye_rank"..i)
			szResult = szResult..format("\n%6d%12d        %s", i, nPoint, szName)
		end
	else
		-- 队长自己查看
		if szCaptainName == "" then
			szCaptainName = GetName()
		end
		
		for i=index, nCount do
			local nSortType, szName, nPoint = CustomDataRead("yueye_rank"..i)
			if szCaptainName == szName then
				szResult = szResult..format("\n<color=yellow>%6d%12d        %s<color>", i, nPoint, szName)
			else
				szResult = szResult..format("\n%6d%12d        %s", i, nPoint, szName)
			end
		end
		local szMyName, nMyPoint, nMyRank = CustomDataRead("yueye_rank_mine")
		if szMyName ~= "" then
			szResult = szResult.."\nChi課 i <color=green>["..szMyName.."]<color>, 甶觤 t輈h l騳 chi課 i l? <color=yellow>["..nMyPoint.."]<color>, x誴 h筺g <color=yellow>["..(nMyRank + 1).."]<color>"
		else
			szResult = szResult.."\n<color=yellow>Chi課 i c馻 b筺 v蒼 ch璦 a 甶觤 t輈h l騳, t筸 th阨 v蒼 ch璦 x誴 h筺g<color>"
		end
	end
	
	if index + 5 < nRankCount then
		Say(szResult, 2, "Trang k?/#show_rank_data(7)", "R阨 kh醝/end_show_rank")
	else
		Say(szResult, 1, "R阨 kh醝/end_show_rank")
	end
end

function end_show_rank()
	local nRankCount = CustomDataRead("yueye_rank_count")
	CustomDataRemove("yueye_rank_count")
	CustomDataRemove("yueye_rank_mine")
	for i=1, nRankCount do
		CustomDataRemove("yueye_rank"..i)
	end
end

function CountPoint(t)
	local nResult = 0
	for i=1, getn(t) do
		if t[i] ~= nil and t[i] >= 0 then
			nResult = nResult + t[i]
		end
	end
	return floor(nResult + 0.5)
end

function about_quarter_final_team()
	local szSay = "1. M鏸 chi課 i t鑙 產 8 th祅h vi猲, kh玭g h筺 ch? m玭 ph竔. \n2. чi trng chi課 i c莕 ph秈 l? t礽 kho秐 chuy猲 d飊g cho thi u, i trng ho祅 th祅h v遪g s? lo筰 ph秈 t 頲 t? c蕄 30 tr? l猲, th祅h vi猲 chi課 i c? th? s? d鬾g t礽 kho秐 kh玭g thi u tham gia thi u. \n3. T? tr薾 b竛 k誸 tr? 甶, i trng chi課 i t? i th祅h vi猲 c馻 t? i m譶h, g苝 NPC vi謙 d? ti課 h祅h b竜 danh. L骳  NPC vi謙 d? s? b竜 cho b筺 bi誸 s? th祅h vi猲 c? vt qu? quy nh 8 ngi kh玭g. \n4. Sau khi b竜 danh th祅h c玭g, chi課 i kh玭g th? ti誴 nh薾 th猰 th祅h vi猲 m韎, ng th阨 th祅h vi猲 trong chi課 i c騨g kh玭g th? tham gia chi課 i kh竎."
	Say(szSay, 0)
end

function end_say()

end