-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 推广员系统脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--Include("\\script\\task\\teach\\teach_main.lua");
IncludeLib("SPREADER");

	-- 新手推广系统所用的扩展点(16位)
	GSP_ACCOUNT_EXTPOINT 		= 7;
	GSP_ACCOUNT_TYPE_NORMAL 	= 0; -- 普通帐号
	GSP_ACCOUNT_TYPE_UNKNOWN	= 1; -- 原游戏推广站帐号？？
	GSP_ACCOUNT_TYPE_NEWPLAYER 	= 2; -- 新手推广帐号[新手开户卡(KS开头)]
    GSP_ACCOUNT_TYPE_CDKEY 		= 3; -- 通过cd-key激活的帐号
-------------------------------------------------------

-------------------------------------------------------
	-- 任务变量：记录游戏推广员系统角色信息	
	GSP_TASKID_ROLEREINFO = 1398;
	GSP_TASKID_TAG_BYTE_ROLETYPE 	= 1;	-- GetBit(1) = 0 - 普通角色, 1 - CDKEY激活角色
	GSP_TASKID_TAG_BIT_01BONUS 		= 8+1;	-- GetBit(8+1) = 1 -  已领取 1级奖励
	GSP_TASKID_TAG_BIT_15BONUS 		= 8+2; 	-- GetBit(8+2) = 1 -  已领取15级奖励
	GSP_TASKID_TAG_BIT_30BONUS 		= 8+3;	-- GetBit(8+3) = 1 -  已领取30级奖励
	GSP_TASKID_TAG_BIT_40BONUS 		= 8+4;	-- GetBit(8+4) = 1 -  已领取40级奖励
	GSP_TASKID_TAG_BIT_01BONUS2		= 8+5;	-- GetBit(8+5) = 1 -  已领取 没有50两银子的1级奖励
-----------------------
	-- 角色类型(任务变量的第个字节)
		GSP_TASKID_ROLETYPE_NORMAL 	= 0; -- 普通角色
		GSP_TASKID_ROLETYPE_CDKEY 	= 1; -- CDKEY激活角色
-------------------------------------------------------

-------------------------------------------------------
-- 以下值与PaySys定义一致
GSP_CDKEY_ACTION_SUCCESS 		= 1 -- 成功
GSP_CDKEY_ACTION_FAILED	 		= 2 -- 失败
GSP_CDKEY_E_CDKEYERROR			= 3 -- CDKEY不正确
GSP_CDKEY_E_INPUTED_CDKEY		= 74 -- 帐号已经被激活了
GSP_CDKEY_E_NEWTIMEOUT 			= 75 -- 帐号已超时》10小时了
GSP_CDKEY_E_NEWACTIVED 			= 76 -- 帐号不属于可以激活的东西
GSP_CDKEY_E_CDKEY_USED_OR_NOT_OPEN	= 77 -- 输入的CDKEY还没有被使用或者已经被别人使用了
-------------------------------------------------------

-- 入口函数
function spreader_main()
	Say("Hoan ngh猲h b筺 n th╩ <color=green>S? gi?<color>! Hi謓 產ng c? nhi襲 ho箃 ng d祅h cho T﹏ th?. C? th? gi髉 g? cho b筺 ch╪g?", 
		1, 
		--"Nh薾 ph莕 thng t﹏ th?/XSTG_award",
		--"Nh藀 [CD-KEY]k輈h ho箃 t礽 kho秐 c馻 b筺/gsp_input_cdkey", 
		--"Nh薾 ph莕 thng giai 畂筺 sau khi k輈h ho箃 [CD-KEY]c馻 b筺/gsp_phase_prize",
		"Li猲 quan S? gi?.../gsp_about")
end;

-- 输入[CD-KEY]激活您的帐号
function gsp_input_cdkey()
	local nValue = GetBeSpreadFlag()
	if (nValue == 1) then
		local szError = "T礽 kho秐 n祔  k輈h ho箃, kh玭g c莕 nh藀 [CD-KEY]n鱝."
		Say("<color=green>S? gi?<color>:"..szError, 0)
		return
	end
	-- 通知客户端打开输入框
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Vui l遪g nh藀 CD-KEY:")
end

-- 领取您的[CD-KEY]激活后阶段奖励
function gsp_phase_prize()
    local nValue = GetBeSpreadFlag()
    local nStage = GetTask(GSP_TASKID_ROLEREINFO)
    if (nValue ~= 1) then
		Say("B筺 ch璦 d飊g [CD-KEY]k輈h ho箃 t礽 kho秐 n祔, kh玭g th? l穘h 頲 ph莕 thng. Vui l遪g xem chi ti誸 tr猲 trang ch?.", 0)
		return
    end
	
	-- 新的新手推广帐号奖励
	get_xstg_award()
end;

-- CDKEY检验结果返回处理
function gsp_cdkey_verify_result(nResult)
	print("Result:"..nResult)
	local szMsg = 
	{	"Ch璦 ph竧 hi謓 l鏸, vui l遪g li猲 h? v韎 d辌h v? kh竎h h祅g c馻 ch髇g t玦!",
		"[CD-KEY]v? hi謚, vui l遪g nh藀 ch輓h x竎 [CD-KEY]!",
		"Nh藀 [CD-KEY]ch輓h x竎, k輈h ho箃 t礽 kho秐 th祅h c玭g! Hoan ngh猲g b筺 n th╩ S? gi?!",
		"Th蕋 b筰: T礽 kho秐  vt qu? 10 gi? s? d鬾g, kh玭g th? ng nh藀!",
		"Th蕋 b筰: T礽 kho秐  k輈h ho箃, kh玭g th? ng nh藀 l莕 n鱝!",
		"Th蕋 b筰: [CD-KEY]n祔 t筸 th阨 kh玭g d飊g 頲 ho芻  b? s? d鬾g!",
		"Th蕋 b筰: T礽 kho秐 n祔 kh玭g th? k輈h ho箃 頲!"}
		
	local nSel = 1
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4
	elseif (nResult == GSP_CDKEY_E_INPUTED_CDKEY) then
		nSel = 5
	elseif (nResult == GSP_CDKEY_E_CDKEY_USED_OR_NOT_OPEN) then
		nSel = 6
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 7
	end

	print("GSP_CDKEY_ACTION_SUCCESS:"..GSP_CDKEY_ACTION_SUCCESS)
	print("GSP_CDKEY_E_NEWTIMEOUT"..GSP_CDKEY_E_NEWTIMEOUT)
	print("nSel:"..nSel)
	Msg2Player(szMsg[nSel])
	Say("[<color=green>S? gi?<color>]:"..szMsg[nSel], 0)

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
        SetBeSpreadFlag()
	end
	return 1
end;

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey)
end;

function gsp_about()
	Say("Hi謓 產ng c? nhi襲 ho箃 ng gi髉 T﹏ th? nhanh ch鉵g t╪g c蕄. Xin xem chi ti誸 tr猲 trang ch?.", 0)
end;

function gsp_cancel()
end

-- 新的XSTG帐号奖励系统
function XSTG_award()
	local strAccount = GetAccount()
	local str1 = strsub(strAccount, 1, 1)
	local str2 = strsub(strAccount, 2, 2)
	local str3 = strsub(strAccount, 3, 3)
	local str4 = strsub(strAccount, 4, 4)
	-- 判断是不是新手推广帐号
	if ((str1 == 'K' or str1 == 'k') and
		(str2 == 'S' or str2 == 's') and
		(str3 == 'T' or str3 == 't') and
		(str4 == 'G' or str4 == 'g')) then
		Say("Khi T﹏ th? t n c蕄 10, c蕄 20, c蕄 30, c蕄 50, c蕄 55, c蕄 58, c蕄 60 u c? th? nh薾 頲 ph莕 thng tng 鴑g, n閕 dung c? th? xin xem trang ch?. Xin x竎 nh薾 l筰 kho秐g tr鑞g c馻 h祅h trang v? c莕 l穘h ph莕 thng g??",
			2,
			"Ta mu鑞 l穘h ph莕 thng /get_xstg_award",
			"T筸 th阨 kh玭g mu鑞 l穘h/gsp_cancel")
	else
		Say("Xin l鏸! T礽 kho秐 n祔 kh玭g thu閏 t﹏ th?!", 0)
	end
end;

-- 真的领取XSTG阶段奖励
function get_xstg_award()
	local nHaveGetLevel = GetTask(95)		-- 上次领取奖励的等级
	local nCurLevel = GetLevel()			-- 当前玩家等级
	
	-- 10级的奖励
	if (nCurLevel >= 10 and nHaveGetLevel < 10) then
		local nRandom = random(1, 2)
		if (nRandom == 1) then
			AddItem(1, 0, 2, 150)		-- 金创散
			Msg2Player("B筺 nh薾 頲 150 b譶h Kim S竛g t竛!")
		else
			AddItem(1, 0, 7, 150)		-- 小还丹
			Msg2Player("B筺 nh薾 頲 150 b譶h Ti觰 Ho祅 n!")
		end
		SetTask(95, 10)
		return
	end
	
	-- 20级的奖励
	if (nCurLevel >= 20 and nHaveGetLevel < 20) then
		AddItem(1, 0, 2, 150)		-- 金创散
		AddItem(1, 0, 7, 150)		-- 小还丹
		Msg2Player("B筺 nh薾 頲 150 b譶h Kim S竛g t竛 v? 150 b譶h Ti觰 Ho祅 n!")
		SetTask(95, 20)
		return
	end
	
	-- 30级的奖励
	if (nCurLevel >= 30 and nHaveGetLevel < 30) then
		get_xstg_suit(0, 30)
		return
	end
	
	-- 50级的奖励
	if (nCurLevel >= 50 and nHaveGetLevel < 50) then
		get_xstg_book()
		return
	end
	
	-- 55级的奖励
	if (nCurLevel >= 55 and nHaveGetLevel < 55) then
		get_xstg_suit(10, 55)
		ModifyReputation(500, 0)
		Msg2Player("B筺 nh薾 頲 500 甶觤 danh v鋘g!")
		return
	end
	
	-- 58级的奖励
	if (nCurLevel >= 58 and nHaveGetLevel < 58) then
		get_xstg_suit(10, 58)
		return
	end
	
	-- 60级的奖励
	if (nCurLevel >= 60 and nHaveGetLevel < 60) then
		get_xstg_suit(10, 60)
		return
	end
	
	Say("L祄 ngi, trc khi nh緈 m総 xu玦 tay, c? th? c鑞g hi課 cho Qu鑓 gia c騨g l? vi謈 n猲 l祄!", 0)
end;

-- 获得秘籍一本，很少概率获得师门秘籍
function get_xstg_book()
	local nCurRoute = GetPlayerRoute()
	local nRandomIndex = random(100)
	
	if (nCurRoute == 0 or nCurRoute == 1 or nCurRoute == 5 or 
		nCurRoute == 7 or nCurRoute == 10 or nCurRoute == 13 or 
		nCurRoute == 16 or nCurRoute == 19) then
		Say("Mau gia nh藀 m玭 ph竔 v? b竔 s? h鋍 ngh?  nh薾 m藅 t辌h!", 0)
		return
	end
	
	if (nRandomIndex <= 10) then
		AddItem(0, 107, 57, 1)
	elseif (nRandomIndex <= 20) then
		AddItem(0, 107, 58, 1)
	elseif (nRandomIndex <= 30) then
		AddItem(0, 107, 59, 1)
	elseif (nRandomIndex <= 40) then
		AddItem(0, 107, 60, 1)
	elseif (nRandomIndex <= 50) then
		AddItem(0, 107, 61, 1)
	elseif (nRandomIndex <= 60) then
		AddItem(0, 107, 62, 1)
	elseif (nRandomIndex <= 70) then
		AddItem(0, 107, 63, 1)
	elseif (nRandomIndex <= 78) then
		AddItem(0, 107, 64, 1)
	elseif (nRandomIndex <= 86) then
		AddItem(0, 107, 65, 1)		
	elseif (nRandomIndex <= 92) then
		AddItem(0, 107, 66, 1)
	else
		local nPlus = random(0, 1)
		if (nCurRoute == 2) then
			AddItem(0, 107, 1 + nPlus, 1)
		elseif (nCurRoute == 3) then
			AddItem(0, 107, 5 + nPlus, 1)
		elseif (nCurRoute == 4) then
			AddItem(0, 107, 3 + nPlus, 1)
		elseif (nCurRoute == 6) then
			AddItem(0, 107, 7 + nPlus, 1)
		elseif (nCurRoute == 8) then
			AddItem(0, 107, 9 + nPlus, 1)
		elseif (nCurRoute == 9) then
			AddItem(0, 107, 11 + nPlus, 1)
		elseif (nCurRoute == 11) then
			AddItem(0, 107, 13 + nPlus, 1)
		elseif (nCurRoute == 12) then
			AddItem(0, 107, 15 + nPlus, 1)
		elseif (nCurRoute == 14) then
			AddItem(0, 107, 17 + nPlus, 1)
		elseif (nCurRoute == 15) then
			AddItem(0, 107, 19 + nPlus, 1)
		elseif (nCurRoute == 17) then
			AddItem(0, 107, 21 + nPlus, 1)
		elseif (nCurRoute == 18) then
			AddItem(0, 107, 23 + nPlus, 1)
		elseif (nCurRoute == 20) then
			AddItem(0, 107, 25 + nPlus, 1)
		elseif (nCurRoute == 21) then
			AddItem(0, 107, 27 + nPlus, 1)
		end
	end

	Msg2Player("B筺 nh薾 頲 1 quy觧 m藅 t辌h!")
	SetTask(95, 50)
end;

-- 获得一套师门初级套装
function get_xstg_suit(nPlus, nLevel)
	local nCurRoute = GetPlayerRoute()
	local nCurBody = GetBody()
	local nParticular = nCurRoute * 100 + nPlus + nCurBody
	-- 峨嵋体型修正
	if (nCurRoute == 8 or nCurRoute == 9) then
		nParticular = nParticular - 2
	end
	
	local nDetail = {0, 	-- 少林1
					 3, 	-- 少林俗家2
					 8, 	-- 少林禅宗3
					 0,		-- 少林武宗4
					 0,		-- 唐门5
					 1,		-- 唐门6
					 0,		-- 峨嵋7
					 2,		-- 峨嵋佛家8
					 10,	-- 峨嵋俗家9
					 0,		-- 丐帮10
					 0,		-- 丐帮净衣11
					 5,		-- 丐帮污衣12
					 0,		-- 武当13
					 2,		-- 武当道家14
					 9,		-- 武当俗家15
					 0,		-- 杨门16
					 6,		-- 杨门枪骑17
					 4,		-- 杨门弓骑18
					 0,		-- 五毒19
					 7,		-- 五毒邪侠20
					 11}	-- 五毒蛊师21

	-- 没有入门派或者流派的玩家，不给东西
	if (nCurRoute == 0 or nCurRoute == 1 or nCurRoute == 5 or
		nCurRoute == 7 or nCurRoute == 10 or nCurRoute == 13 or
		nCurRoute == 16 or nCurRoute == 19) then
		Say("Mau gia nh藀 m玭 ph竔 v? b竔 s? h鋍 ngh?  nh薾 b? trang b? s? m玭!", 0)
		return
	end

	if (nLevel == 30) then
		AddItem(0, 103, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- 帽子
		AddItem(0, 100, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- 衣服
		AddItem(0, 101, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- 裤子
		AddItem(0, nDetail[nCurRoute], nParticular, 1, 1, -1, -1, -1, -1, -1, -1)	-- 武器
	elseif (nLevel == 55) then
		AddItem(0, nDetail[nCurRoute], nParticular, 1, 1, -1, -1, -1, -1, -1, -1)	-- 武器
	elseif (nLevel == 58) then
		AddItem(0, 100, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- 衣服
	elseif (nLevel == 60) then
		AddItem(0, 102, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- 首饰
	end
	
	
	if (nPlus == 0) then
		Msg2Player("B筺 nh薾 頲 1 b? trang b? s? m玭 s? c蕄!")
	else
		Msg2Player("B筺 nh薾 頲 1 b? trang b? s? m玭 trung c蕄!")
	end
	SetTask(95, nLevel)
end;