--真气传功脚本
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\npccmdhead.lua")

SZ_THIS_SCRIPT = "\\settings\\static_script\\meridian\\meridian_zhenqi_transmission.lua"
--N_THIS_CALL_BACK_CODE=1314 --随便的一个数值 用于校验的（>=100表示不需要检查真气容量）
--N_ONE_CALL_BACK_SEC = 15
--N_ONE_CALL_BACK_CNT = 5000


tb_main_city = {
	[100] = 1, 
	[150] = 1, 
	[200] = 1, 
	[300] = 1, 
	[350] = 1, 
	[400] = 1, 
	[500] = 1,
}
N_CALL_BACK_TIME = 15
N_GAME_FRAME = 18
N_EXPORT_ZHENQI_MAX = 4000
N_IMPORT_ZHENQI_MAX = 4000
N_MEMBER_CONSUME_ZHENQI = 12 --队员每次消耗真气数
N_WARNING_TIME = 5 --资源不足5次时提醒
_N_MEMBER_MAX_DISTANCE = 15--集气术过程中队员距离队长的最远距离
N_MEMBER_MAX_DISTANCE = _N_MEMBER_MAX_DISTANCE*_N_MEMBER_MAX_DISTANCE--实际计算的时候没有开平方

TMP_TASK_ID_TRANSMISSION_STATE = TMP_TASK_TRANS_ZHENQI_STATE--真气传输状态记录变量
TASK_ID_IMPORT_EXPORT_LIMIT	= DAILY_TASK_ID_TRANS_ZHENQI_LIMIT--每日传输真气上限记录变量
TASK_EXPORT_LIMIT_WORD_IDX = 1--记录输出的word
TASK_IMPORT_LIMIT_WORD_IDX = 2--记录输入的word

t_jiqishu_para = 
{
	--最大组队人数，每次从每位队员获得真气数，{队长消耗}，消耗描述
	{2, 4, {{ZHENQIWAN_TYPE0, 4, "T? Linh Ho祅"},}, "4 ph髏 T? Linh Ho祅"},
	{3, 5, {{ZHENQIWAN_TYPE1, 4, "Чi T? Linh Ho祅"},}, "4 ph髏 Чi T? Linh Ho祅"},
	{4, 6, {{ZHENQIWAN_TYPE2, 4, "T? Linh Ti猲 Кn"},}, "4 ph髏 T? Linh Ti猲 Кn"},
	{5, 8, {{ZHENQIWAN_TYPE2, 8, "T? Linh Ti猲 Кn"},}, "8 ph髏 T? Linh Ti猲 Кn"},
}

--点击北斗集气术对话
function OnTalkZhenqiTransmission()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H? th鑞g kinh m筩h v蒼 ch璦 khai th玭g, kh玭g th? s? d鬾g t輓h n╪g B綾 u T? Kh? Thu藅"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("L? luy謓 n Nguy謙 Lng Th?: B綾 u T? Kh? Thu藅 t鎛g c閚g c? %d c蕄, ch? 頲 i trng ph竧 ng. T? kh? thu藅 c蕄  c祅g cao h? tr? cho t? i c祅g nhi襲 ngi, th玭g qua i vi猲 i trng c? th? nh薾 頲 c祅g nhi襲 ch﹏ kh? (i vi猲 m鏸 l莕 ti猽 hao c? nh %d 甶觤 ch﹏ kh?)", getn(t_jiqishu_para), N_MEMBER_CONSUME_ZHENQI)
	szTitle = format("%s\n H玬 nay c竎 h?  nh薾 頲 <color=yellow>%d/%d<color> 甶觤 ch﹏ kh? th玭g qua B綾 u T? Kh? Thu藅, truy襫 甶 <color=yellow>%d/%d<color> 甶觤 ch﹏ kh?", szTitle, _get_import_zhenqi_count(), N_IMPORT_ZHENQI_MAX, _get_export_zhenqi_count(), N_EXPORT_ZHENQI_MAX)
	for i=1, getn(t_jiqishu_para) do
		local t =t_jiqishu_para[i]
		tinsert(tbSay, format("B綾 u T? Kh? Thu藅 c蕄 %d/#_try_start_transmission(%d)", i, i))
	end
	tinsert(tbSay, format("D鮪g T? Kh? Thu藅/_user_do_stop_transmission"))
	tinsert(tbSay, format("T譵 hi觰 T? Kh? Thu藅/_jiqishu_desc"))
	tinsert(tbSay, format("Ta ch? gh? ch琲/nothing"))
	Say(szTitle, getn(tbSay), tbSay)
end

function _jiqishu_desc()
	local tbSay = {}
	local szTitle = format("L? luy謓 n Nguy謙 Lng Th?:")
	--local szTitle = format("月亮兔炼丹炉：北斗集气术共有%d级，只能队长发动。越高级的集气术可以支持更多人组队，队长可以从队员身上获得更多真气（队员每次固定消耗%d点真气）。", getn(t_jiqishu_para), N_MEMBER_CONSUME_ZHENQI)
	--szTitle = format("%s\n您今天已经通过集气术获得<color=yellow>%d/%d<color>点真气，传出<color=yellow>%d/%d<color>点真气", szTitle, _get_import_zhenqi_count(), N_IMPORT_ZHENQI_MAX, _get_export_zhenqi_count(), N_EXPORT_ZHENQI_MAX)
	for i=1, getn(t_jiqishu_para) do
		local t =t_jiqishu_para[i]
		szTitle = format("%s\nT? Kh? Thu藅 c蕄 %d: h? tr? t? i nhi襲 nh蕋 %d ngi, i trng nh薾 頲 %d ch﹏ kh?/ngi, ti猽 hao %s", szTitle, i, t[1], t[2], t[4])
	end
	tinsert(tbSay, format("tr? l筰/OnTalkZhenqiTransmission"))
	tinsert(tbSay, format("Ta ch? gh? ch琲/nothing"))
	Say(szTitle, getn(tbSay), tbSay)
end

--打坐回调函数
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	return OnProgressCallback(wCurProcess, wMaxProcess, wCheckCode)
end

--进度条回调函数
function	OnProgressCallback(wCurProcess, wMaxProcess, wCheckCode)
	local bOk,szMsg = 1, ""
	local nLevel = _get_transmission_level()
	if GetCaptainName() == GetName() then
		if _get_transmission_caption_flag() ~= 1 then
			bOk, szMsg = 0, "чi trng r阨 kh醝 i"
		end
	else
		if GetTeamSize() < 2 then
			_process_member_state_when_stop_real({})--队员已经离队，停止集气术状态
			Msg2Player("Tr筺g th竔 t? kh? c馻 c竎 h?  d鮪g")
		end
		return 0
	end
	
	if 1 == bOk then
    	bOk,szMsg = _check_can_start(nLevel, 0, 0, 0)
    	if bOk == 1 then
    		bOk,szMsg = _check_can_start(nLevel, 1, 0, 0)--检查通过了 执行消耗操作
    		if bOk == 1 then
    			local tPara = t_jiqishu_para[nLevel]
    			local nTeamSize = GetTeamSize();
    			local nGain = (nTeamSize - 1) * tPara[2]
    			_add_import_zhenqi_count(nGain)
    			AwardGenuineQi(nGain)
    			SetCurrentNpcSFX(PIdx2NpcIdx(),927,0,0)--获得真气的特效
    			_process_team_state_when_trans()--读条处理
    			return 1
    		end
    	end
	end

	_do_stop_transmission(szMsg or "")
	return 0
end

function _do_broadcast_team_msg(szMessage)
	local tCheckMemberPara = {--检查队员状态需要的参数
		szMsg = szMessage
	}
	local tCallInfo = { --函数调用信息
		func = _broadcast_msg,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	gf_operate_on_teammembers(tCallInfo) --对所有队员执行操作
end

function _broadcast_msg(tPara)
	szMsg = tPara.szMsg
	Msg2Player(szMsg)
	HeadMsg2Player(szMsg)
	return 1
end

function _user_do_stop_transmission()
	if GetCaptainName() == GetName() then
		return _do_stop_transmission(nil)
	else
		Talk(1,"",format("Ch? c? i trng 頲 ph衟 d鮪g T? Kh? Thu藅"))
		return 0
	end
	return 1
end

--停止集气术
function _do_stop_transmission(szMsg)
	if not szMsg then
    	if GetCaptainName() == GetName() then
    		if _get_verify_code() ~= 0 then
    			_do_broadcast_team_msg(format("%s  d鮪g ch鴆 n╪g T? Kh? Thu藅", GetName()))
    		end
    	end
    else
    	szMsg = format("%s, d鮪g ch鴆 n╪g T? Kh? Thu藅", szMsg or "")
    	_do_broadcast_team_msg(szMsg)
	end
	
	_process_team_state_when_stop()
end

--集气术停止时的队员状态清除操作
function _process_team_state_when_stop()
	local tCheckMemberPara = {--检查队员状态需要的参数
	}
	local tCallInfo = { --函数调用信息
		func = _process_member_state_when_stop,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --对所有队员执行操作
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L鏸 i vi猲 ch璦 x竎 nh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_stop(tPara)
	local nRet, szLogRet = _process_member_state_when_stop_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_stop_real(tPara)
	_set_verify_code(0, 0, 0)--设置校验码
	
	SetPlayerScript("")
	ProgressSlot(0)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_stand,0,0,0,0)--站起来
	--DoStartScriptCallBack(0, 0, 0, "", 1)--停止冲击
	
	SetCurrentNpcSFX(PIdx2NpcIdx(),0,0,0)--取消特效
	
	return 1, ""
end


function _try_start_transmission(nLevel)
	local bOk,szMsg = _check_can_start(nLevel, 0, 0, 1)
	if 1 ~= bOk then
		Talk(1,"", format("%s, kh玭g th? kh雐 ng T? Kh? Thu藅 c蕄 %d", szMsg, nLevel))
		return 0
	end
	bOk,szMsg = _process_team_state_when_start(nLevel)
	if 1 ~= bOk then
		Talk(1,"", format("%s, kh雐 ng T? Kh? Thu藅 c蕄 %d th蕋 b筰", szMsg, nLevel))
		return 0
	end
	
	return 1
end

--集气术开始时的队员状态初始化操作
function _process_team_state_when_start(nLevel)
	local tCheckMemberPara = {--检查队员状态需要的参数
		nCheckLevel = nLevel,
		nVerifyCode = SafeSetByte(GetTime(), 4, 0),--校验码
	}
	local tCallInfo = { --函数调用信息
		func = _process_member_state_when_start,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --对所有队员执行操作
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L鏸 i vi猲 ch璦 x竎 nh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_start(tPara)
	local nRet, szLogRet = _process_member_state_when_start_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_start_real(tPara)
	local nCheckLevel = tPara.nCheckLevel
	local nVerifyCode = tPara.nVerifyCode--校验码
	local bIsCaption = 0
	if GetCaptainName() == GetName() then
		bIsCaption = 1
	end
	_set_verify_code(nVerifyCode, nCheckLevel, bIsCaption)--设置校验码
	
	SetPlayerScript(SZ_THIS_SCRIPT)--设定回调脚本
	ProgressSlot(N_CALL_BACK_TIME * N_GAME_FRAME)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_sit,0,0,0,0)--坐下
--	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 1) then
--
--	else
--		Msg2Player("开启集气术状态失败")
--	end
	
	local szMsg = format("%s  kh雐 ng B綾 u T? Kh? Thu藅 c蕄 %d", GetCaptainName(), nCheckLevel)
	Msg2Player(szMsg)
	HeadMsg2Player(szMsg)

	return 1, ""
end


--集气术开始时的队员状态初始化操作
function _process_team_state_when_trans()
	local tCheckMemberPara = {--检查队员状态需要的参数
	}
	local tCallInfo = { --函数调用信息
		func = _process_member_state_when_trans,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --对所有队员执行操作
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L鏸 i vi猲 ch璦 x竎 nh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_trans(tPara)
	local nRet, szLogRet = _process_member_state_when_trans_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_trans_real(tPara)
	SetPlayerScript(SZ_THIS_SCRIPT)--设定回调脚本
	ProgressSlot(N_CALL_BACK_TIME * N_GAME_FRAME)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_sit,0,0,0,0)--坐下
	return 1, ""
end


function _check_can_start(nLevel, bDelete, bNotify, bIsFirstStart)
	local szLog = nil
	local tPara = t_jiqishu_para[nLevel]
	if not tPara then
		return _fail_with_msg(bNotify, format("T? Kh? Thu藅 c蕄 %d ch璦 khai th玭g", nLevel))
	end
	if GetName() ~= GetCaptainName() then
		return _fail_with_msg(bNotify, "Kh玭g ph秈 l? i trng")
	end
	if  1 == bIsFirstStart then
		_process_team_state_when_stop()--如果是队长开启，先清除所有人的集气术状态
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize < 2 then			
		return _fail_with_msg(bNotify, "Th祅h vi猲 trong i kh玭g  2 ngi")
	end
	if nTeamSize > tPara[1] then
		return _fail_with_msg(bNotify, format("Th祅h vi猲 trong i nhi襲 h琻 %d ngi", tPara[1]))
	end
	local nMapID0, nX0, nY0 = GetWorldPos()
	if 1 ~= tb_main_city[nMapID0] then
		return _fail_with_msg(bNotify, "Ngo礽 khu v鵦 th祅h ch輓h")
	end
	if IsStalling() == 1 then
		return _fail_with_msg(bNotify, "ng b祔 b竛")
	end
	if IsSleeping() == 1 then
		return _fail_with_msg(bNotify, "ng ng? say")
	end
	if MeridianGetLeftGenuineQiCapcity() <= 0 then
		return _fail_with_msg(bNotify, format("%s ch﹏ khi trong kh? h秈  t gi韎 h筺", GetName()))
	end
	
	--检查队长可接受的真气
	if _get_import_zhenqi_count() >= N_IMPORT_ZHENQI_MAX then
		return _fail_with_msg(bNotify, format("%s s? ch﹏ kh? c? th? nh薾 trong ng祔  t gi韎 h筺", GetName()))
	end
	
	--检查队长托管时间
	local nRet, szLog = _check_caption_consume(nLevel, bDelete, bNotify)
	if nRet ~= 1 then
		return _fail_with_msg(bNotify, szLog)
	end
	
	--队长校验码
	local nLeaderVerifyCode = _get_verify_code()
	
	local tCheckMemberPara = {--检查队员状态需要的参数
		nLeaderMap = nMapID0,
		nLeaderX = nX0,
		nLeaderY = nY0,
		nCheckLevel = nLevel,
		bNeedDelete = bDelete, 
		bNeedNotify = bNotify,
		nLeaderVerifyCode = nLeaderVerifyCode,--校验码
	}
	local tCallInfo = { --函数调用信息
		func = _check_member_status,
		bExceptCaption = 1,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --对所有队员执行操作
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L鏸 i vi猲 ch璦 x竎 nh")
	end
	
	return 1, szLog
end

--检查队长消耗物
function _check_caption_consume(nLevel, bDelete, bNotify)
	local szLog = ""
	local tPara = t_jiqishu_para[nLevel]
	if not tPara then
		return 0, szLog
	end
	
	local s = tPara[3]
	for i = 1, getn(s) do
		local t = s[i]
		local nCurTime = GetJuLingWanTime(t[1])
		local nCount = floor(nCurTime / t[2])
		if nCount < 1 then
			szLog = format("%s th阨 gian kh玭g  %d ph髏", t[3], t[2])
			return 0, szLog
		elseif nCount < N_WARNING_TIME then
			szLog = format("%s c遪 l筰 %s, ch? c? th? duy tr? %d l莕", szLog, t[3], nCount)
		end
	end
	
	if 1 == bDelete then--所有的都检查通过了 可以扣除了
		for i = 1, getn(s) do
    		local t = s[i]
    		local nCurTime = GetJuLingWanTime(t[1])
    		if nCurTime >= t[2] then
    			if SetJuLingWanTime(t[1],nCurTime - t[2]) ~= 1 then
    				szLog = format("L鏸 ch璦 x竎 nh", t[3], t[2])
    				return 0, szLog
    			end
    		elseif nCount < N_WARNING_TIME then
    			szLog = format("%s th阨 gian kh玭g  %d ph髏", t[3], t[2])
    			return 0, szLog
    		end
    	end
	end

	return 1, szLog
end

--检查队员的状态
	--检查队员与队长的距离
	--检查队员剩余真气
	--检查队员真气输出情况
function _check_member_status(tPara)
	local nRet, szLogRet = _check_member_status_real(tPara)
	return nRet, {szLog = szLogRet,}
end 

function _check_member_status_real(tPara)
	local nLeaderMap = tPara.nLeaderMap
	local nLeaderX = tPara.nLeaderX
	local nLeaderY = tPara.nLeaderY
	local nCheckLevel = tPara.nCheckLevel
	local bNeedDelete = tPara.bNeedDelete
	local bNeedNotify = tPara.bNeedNotify
	local nLeaderVerifyCode = tPara.nLeaderVerifyCode
	local bInitVeryfyCode = tPara.bInitVeryfyCode

	local nMyVerifyCode = _get_verify_code()
	if nMyVerifyCode ~= nLeaderVerifyCode then
		return _fail_with_msg(bNotify, format("%s ki觤 ch鴑g th蕋 b筰", GetName()))
	end
	
	if IsStalling() == 1 then
		return _fail_with_msg(bNotify, format("%s 產ng b祔 b竛", GetName()))
	end
	
	if IsSleeping() == 1 then
		return _fail_with_msg(bNotify, format("%s 產ng ng? say", GetName()))
	end

	local nMapID, nX, nY = GetWorldPos()
	if nMapID ~= nLeaderMap then
		return _fail_with_msg(bNotify, format("%s kh玭g c飊g chung 1 th祅h th?", GetName()))
	end
	local nDistance = _Distance2BetweenPoints(nLeaderMap, nLeaderX, nLeaderY, nMapID, nX, nY)
	if nDistance < 0 or nDistance > N_MEMBER_MAX_DISTANCE then
		return _fail_with_msg(bNotify, format("%s c竎h i trng qu? xa", GetName()))
	end
	if _get_export_zhenqi_count() >= N_EXPORT_ZHENQI_MAX then
		return _fail_with_msg(bNotify, format("%s ch﹏ kh? c? th? chuy觧 trong ng祔  t gi韎 h筺", GetName()))
	end
	
	--检查队员的剩余真气时间
	local nRet, szLog = _check_member_consume(nCheckLevel, bNeedDelete, bNeedNotify)
	if nRet ~= 1 then
		return _fail_with_msg(bNotify, szLog)
	end
	
	return 1, szLog
end

function _check_member_consume(nLevel, bDelete, bNotify)
	if MeridianGetQiHai() < N_MEMBER_CONSUME_ZHENQI then
		return _fail_with_msg(bNotify, format("%s ch﹏ khi kh玭g ", GetName()))
	end
	if 1 == bDelete then
		if 1 ~= AwardGenuineQi(-1*N_MEMBER_CONSUME_ZHENQI) then
			return _fail_with_msg(bNotify, format("%s kh蕌 tr? ch﹏ kh? th蕋 b筰", GetName()))
		else
			_add_export_zhenqi_count(N_MEMBER_CONSUME_ZHENQI)
			SetCurrentNpcSFX(PIdx2NpcIdx(),918,0,0)--消耗真气的特效
		end
	end
	return 1,""
end


--获取输出的真气数
function _get_export_zhenqi_count()
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_EXPORT_LIMIT_WORD_IDX)
	return nWord
end

function _add_export_zhenqi_count(nAdd)
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_EXPORT_LIMIT_WORD_IDX)
	nWord = nWord + nAdd
	local nSave = setWord(nVal, TASK_EXPORT_LIMIT_WORD_IDX, nWord)
	return rc_SetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT, nSave)
end

--获取输入的真气数
function _get_import_zhenqi_count()
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_IMPORT_LIMIT_WORD_IDX)
	return nWord
end

function _add_import_zhenqi_count(nAdd)
	local nVal = rc_GetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT)
	local nWord = getWord(nVal, TASK_IMPORT_LIMIT_WORD_IDX)
	nWord = nWord + nAdd
	local nSave = setWord(nVal, TASK_IMPORT_LIMIT_WORD_IDX, nWord)
	return rc_SetDailyTask(TASK_ID_IMPORT_EXPORT_LIMIT, nSave)
end

--获取校验码
function _get_verify_code()
	local nVal = GetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE)
	local nCode = SafeSetByte(nVal, 4, 0)
	return nCode
end

function _get_transmission_level()
	local nVal = GetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE)
	local nHighByte = SafeGetByte(nVal, 4)
	local nLevel = mod(nHighByte, 10)
	return nLevel
end

function _get_transmission_caption_flag()
	local nVal = GetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE)
	local nHighByte = SafeGetByte(nVal, 4)
	local nFlg = floor(nHighByte/10)
	nFlg = mod(nFlg, 10)
	return nFlg
end

--设置校验码
function _set_verify_code(nCode, nLevel, bIsCaption)
	nCode = SafeSetByte(nCode, 4, 0)
	nLevel = mod(nLevel, 10)
	bIsCaption = mod(bIsCaption, 10)
	local nHighByte = bIsCaption * 10 + nLevel
	local nVal = SafeSetByte(nCode, 4, nHighByte)
	SetTaskTemp(TMP_TASK_ID_TRANSMISSION_STATE, nVal)
end

function _fail_with_msg(bNotify, szMsg)
--	if bNotify > 0 then
--		Talk(1,"", szMsg or "")
--	end
	return 0, szMsg
end

--tPara = 
--{
--	func = some function
--	bExceptCaption
--	tFunctionPara
--}
function	gf_operate_on_teammembers(tPara)
	local nOldIndex = PlayerIndex;
	local nTeamSize = GetTeamSize();
	local bRet = 1
	local tRet = {}
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if tPara.bExceptCaption == 0 or GetName() ~= GetCaptainName() then
			bRet,tRet = tPara.func(tPara.tFunctionPara)
			if bRet == 0 then
				break
			end
		end
	end
	PlayerIndex = nOldIndex
	return bRet,tRet
end

function nothing()
end

--判断距离
function _Distance2BetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
    if MapID1 ~= MapID2 then
        return -1
    else
		local dx = MapX2 - MapX1
        local dy = MapY2 - MapY1
        local nDist = (dx * dx + dy * dy)
        return nDist
    end
end

