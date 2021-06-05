--���������ű�
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\lib\\npccmdhead.lua")

SZ_THIS_SCRIPT = "\\settings\\static_script\\meridian\\meridian_zhenqi_transmission.lua"
--N_THIS_CALL_BACK_CODE=1314 --����һ����ֵ ����У��ģ�>=100��ʾ����Ҫ�������������
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
N_MEMBER_CONSUME_ZHENQI = 12 --��Աÿ������������
N_WARNING_TIME = 5 --��Դ����5��ʱ����
_N_MEMBER_MAX_DISTANCE = 15--�����������ж�Ա����ӳ�����Զ����
N_MEMBER_MAX_DISTANCE = _N_MEMBER_MAX_DISTANCE*_N_MEMBER_MAX_DISTANCE--ʵ�ʼ����ʱ��û�п�ƽ��

TMP_TASK_ID_TRANSMISSION_STATE = TMP_TASK_TRANS_ZHENQI_STATE--��������״̬��¼����
TASK_ID_IMPORT_EXPORT_LIMIT	= DAILY_TASK_ID_TRANS_ZHENQI_LIMIT--ÿ�մ����������޼�¼����
TASK_EXPORT_LIMIT_WORD_IDX = 1--��¼�����word
TASK_IMPORT_LIMIT_WORD_IDX = 2--��¼�����word

t_jiqishu_para = 
{
	--������������ÿ�δ�ÿλ��Ա�����������{�ӳ�����}����������
	{2, 4, {{ZHENQIWAN_TYPE0, 4, "T� Linh Ho�n"},}, "4 ph�t T� Linh Ho�n"},
	{3, 5, {{ZHENQIWAN_TYPE1, 4, "��i T� Linh Ho�n"},}, "4 ph�t ��i T� Linh Ho�n"},
	{4, 6, {{ZHENQIWAN_TYPE2, 4, "T� Linh Ti�n ��n"},}, "4 ph�t T� Linh Ti�n ��n"},
	{5, 8, {{ZHENQIWAN_TYPE2, 8, "T� Linh Ti�n ��n"},}, "8 ph�t T� Linh Ti�n ��n"},
}

--��������������Ի�
function OnTalkZhenqiTransmission()
	if 1 ~= IsMeridianSystemOpen() then
		Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng, kh�ng th� s� d�ng t�nh n�ng B�c ��u T� Kh� Thu�t"))
		return 0
	end
	local tbSay = {}
	local szTitle = format("L� luy�n ��n Nguy�t L��ng Th�: B�c ��u T� Kh� Thu�t t�ng c�ng c� %d c�p, ch� ���c ��i tr��ng ph�t ��ng. T� kh� thu�t c�p �� c�ng cao h� tr� cho t� ��i c�ng nhi�u ng��i, th�ng qua ��i vi�n ��i tr��ng c� th� nh�n ���c c�ng nhi�u ch�n kh� (��i vi�n m�i l�n ti�u hao c� ��nh %d �i�m ch�n kh�)", getn(t_jiqishu_para), N_MEMBER_CONSUME_ZHENQI)
	szTitle = format("%s\n H�m nay c�c h� �� nh�n ���c <color=yellow>%d/%d<color> �i�m ch�n kh� th�ng qua B�c ��u T� Kh� Thu�t, truy�n �i <color=yellow>%d/%d<color> �i�m ch�n kh�", szTitle, _get_import_zhenqi_count(), N_IMPORT_ZHENQI_MAX, _get_export_zhenqi_count(), N_EXPORT_ZHENQI_MAX)
	for i=1, getn(t_jiqishu_para) do
		local t =t_jiqishu_para[i]
		tinsert(tbSay, format("B�c ��u T� Kh� Thu�t c�p %d/#_try_start_transmission(%d)", i, i))
	end
	tinsert(tbSay, format("D�ng T� Kh� Thu�t/_user_do_stop_transmission"))
	tinsert(tbSay, format("T�m hi�u T� Kh� Thu�t/_jiqishu_desc"))
	tinsert(tbSay, format("Ta ch� gh� ch�i/nothing"))
	Say(szTitle, getn(tbSay), tbSay)
end

function _jiqishu_desc()
	local tbSay = {}
	local szTitle = format("L� luy�n ��n Nguy�t L��ng Th�:")
	--local szTitle = format("����������¯����������������%d����ֻ�ܶӳ�������Խ�߼��ļ���������֧�ָ�������ӣ��ӳ����ԴӶ�Ա���ϻ�ø�����������Աÿ�ι̶�����%d����������", getn(t_jiqishu_para), N_MEMBER_CONSUME_ZHENQI)
	--szTitle = format("%s\n�������Ѿ�ͨ�����������<color=yellow>%d/%d<color>������������<color=yellow>%d/%d<color>������", szTitle, _get_import_zhenqi_count(), N_IMPORT_ZHENQI_MAX, _get_export_zhenqi_count(), N_EXPORT_ZHENQI_MAX)
	for i=1, getn(t_jiqishu_para) do
		local t =t_jiqishu_para[i]
		szTitle = format("%s\nT� Kh� Thu�t c�p %d: h� tr� t� ��i nhi�u nh�t %d ng��i, ��i tr��ng nh�n ���c %d ch�n kh�/ng��i, ti�u hao %s", szTitle, i, t[1], t[2], t[4])
	end
	tinsert(tbSay, format("tr� l�i/OnTalkZhenqiTransmission"))
	tinsert(tbSay, format("Ta ch� gh� ch�i/nothing"))
	Say(szTitle, getn(tbSay), tbSay)
end

--�����ص�����
function OnProcessCallBack(wCurProcess, wMaxProcess, wCheckCode)
	if wCheckCode ~= N_THIS_CALL_BACK_CODE then
		return 0
	end
	return OnProgressCallback(wCurProcess, wMaxProcess, wCheckCode)
end

--�������ص�����
function	OnProgressCallback(wCurProcess, wMaxProcess, wCheckCode)
	local bOk,szMsg = 1, ""
	local nLevel = _get_transmission_level()
	if GetCaptainName() == GetName() then
		if _get_transmission_caption_flag() ~= 1 then
			bOk, szMsg = 0, "��i tr��ng r�i kh�i ��i"
		end
	else
		if GetTeamSize() < 2 then
			_process_member_state_when_stop_real({})--��Ա�Ѿ���ӣ�ֹͣ������״̬
			Msg2Player("Tr�ng th�i t� kh� c�a c�c h� �� d�ng")
		end
		return 0
	end
	
	if 1 == bOk then
    	bOk,szMsg = _check_can_start(nLevel, 0, 0, 0)
    	if bOk == 1 then
    		bOk,szMsg = _check_can_start(nLevel, 1, 0, 0)--���ͨ���� ִ�����Ĳ���
    		if bOk == 1 then
    			local tPara = t_jiqishu_para[nLevel]
    			local nTeamSize = GetTeamSize();
    			local nGain = (nTeamSize - 1) * tPara[2]
    			_add_import_zhenqi_count(nGain)
    			AwardGenuineQi(nGain)
    			SetCurrentNpcSFX(PIdx2NpcIdx(),927,0,0)--�����������Ч
    			_process_team_state_when_trans()--��������
    			return 1
    		end
    	end
	end

	_do_stop_transmission(szMsg or "")
	return 0
end

function _do_broadcast_team_msg(szMessage)
	local tCheckMemberPara = {--����Ա״̬��Ҫ�Ĳ���
		szMsg = szMessage
	}
	local tCallInfo = { --����������Ϣ
		func = _broadcast_msg,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	gf_operate_on_teammembers(tCallInfo) --�����ж�Աִ�в���
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
		Talk(1,"",format("Ch� c� ��i tr��ng ���c ph�p d�ng T� Kh� Thu�t"))
		return 0
	end
	return 1
end

--ֹͣ������
function _do_stop_transmission(szMsg)
	if not szMsg then
    	if GetCaptainName() == GetName() then
    		if _get_verify_code() ~= 0 then
    			_do_broadcast_team_msg(format("%s �� d�ng ch�c n�ng T� Kh� Thu�t", GetName()))
    		end
    	end
    else
    	szMsg = format("%s, d�ng ch�c n�ng T� Kh� Thu�t", szMsg or "")
    	_do_broadcast_team_msg(szMsg)
	end
	
	_process_team_state_when_stop()
end

--������ֹͣʱ�Ķ�Ա״̬�������
function _process_team_state_when_stop()
	local tCheckMemberPara = {--����Ա״̬��Ҫ�Ĳ���
	}
	local tCallInfo = { --����������Ϣ
		func = _process_member_state_when_stop,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --�����ж�Աִ�в���
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L�i ��i vi�n ch�a x�c ��nh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_stop(tPara)
	local nRet, szLogRet = _process_member_state_when_stop_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_stop_real(tPara)
	_set_verify_code(0, 0, 0)--����У����
	
	SetPlayerScript("")
	ProgressSlot(0)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_stand,0,0,0,0)--վ����
	--DoStartScriptCallBack(0, 0, 0, "", 1)--ֹͣ���
	
	SetCurrentNpcSFX(PIdx2NpcIdx(),0,0,0)--ȡ����Ч
	
	return 1, ""
end


function _try_start_transmission(nLevel)
	local bOk,szMsg = _check_can_start(nLevel, 0, 0, 1)
	if 1 ~= bOk then
		Talk(1,"", format("%s, kh�ng th� kh�i ��ng T� Kh� Thu�t c�p %d", szMsg, nLevel))
		return 0
	end
	bOk,szMsg = _process_team_state_when_start(nLevel)
	if 1 ~= bOk then
		Talk(1,"", format("%s, kh�i ��ng T� Kh� Thu�t c�p %d th�t b�i", szMsg, nLevel))
		return 0
	end
	
	return 1
end

--��������ʼʱ�Ķ�Ա״̬��ʼ������
function _process_team_state_when_start(nLevel)
	local tCheckMemberPara = {--����Ա״̬��Ҫ�Ĳ���
		nCheckLevel = nLevel,
		nVerifyCode = SafeSetByte(GetTime(), 4, 0),--У����
	}
	local tCallInfo = { --����������Ϣ
		func = _process_member_state_when_start,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --�����ж�Աִ�в���
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L�i ��i vi�n ch�a x�c ��nh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_start(tPara)
	local nRet, szLogRet = _process_member_state_when_start_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_start_real(tPara)
	local nCheckLevel = tPara.nCheckLevel
	local nVerifyCode = tPara.nVerifyCode--У����
	local bIsCaption = 0
	if GetCaptainName() == GetName() then
		bIsCaption = 1
	end
	_set_verify_code(nVerifyCode, nCheckLevel, bIsCaption)--����У����
	
	SetPlayerScript(SZ_THIS_SCRIPT)--�趨�ص��ű�
	ProgressSlot(N_CALL_BACK_TIME * N_GAME_FRAME)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_sit,0,0,0,0)--����
--	if 1 == DoStartScriptCallBack(N_ONE_CALL_BACK_SEC, N_ONE_CALL_BACK_CNT, N_THIS_CALL_BACK_CODE, SZ_THIS_SCRIPT, 1) then
--
--	else
--		Msg2Player("����������״̬ʧ��")
--	end
	
	local szMsg = format("%s �� kh�i ��ng B�c ��u T� Kh� Thu�t c�p %d", GetCaptainName(), nCheckLevel)
	Msg2Player(szMsg)
	HeadMsg2Player(szMsg)

	return 1, ""
end


--��������ʼʱ�Ķ�Ա״̬��ʼ������
function _process_team_state_when_trans()
	local tCheckMemberPara = {--����Ա״̬��Ҫ�Ĳ���
	}
	local tCallInfo = { --����������Ϣ
		func = _process_member_state_when_trans,
		bExceptCaption = 0,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --�����ж�Աִ�в���
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L�i ��i vi�n ch�a x�c ��nh")
	end
	return nRet,tRet.szLog
end

function _process_member_state_when_trans(tPara)
	local nRet, szLogRet = _process_member_state_when_trans_real(tPara)
	return nRet, {szLog = szLogRet,}
end

function _process_member_state_when_trans_real(tPara)
	SetPlayerScript(SZ_THIS_SCRIPT)--�趨�ص��ű�
	ProgressSlot(N_CALL_BACK_TIME * N_GAME_FRAME)
	NpcCommand(PIdx2NpcIdx(),NPCCOMMAND.do_sit,0,0,0,0)--����
	return 1, ""
end


function _check_can_start(nLevel, bDelete, bNotify, bIsFirstStart)
	local szLog = nil
	local tPara = t_jiqishu_para[nLevel]
	if not tPara then
		return _fail_with_msg(bNotify, format("T� Kh� Thu�t c�p %d ch�a khai th�ng", nLevel))
	end
	if GetName() ~= GetCaptainName() then
		return _fail_with_msg(bNotify, "Kh�ng ph�i l� ��i tr��ng")
	end
	if  1 == bIsFirstStart then
		_process_team_state_when_stop()--����Ƕӳ�����������������˵ļ�����״̬
	end
	local nTeamSize = GetTeamSize()
	if nTeamSize < 2 then			
		return _fail_with_msg(bNotify, "Th�nh vi�n trong ��i kh�ng �� 2 ng��i")
	end
	if nTeamSize > tPara[1] then
		return _fail_with_msg(bNotify, format("Th�nh vi�n trong ��i nhi�u h�n %d ng��i", tPara[1]))
	end
	local nMapID0, nX0, nY0 = GetWorldPos()
	if 1 ~= tb_main_city[nMapID0] then
		return _fail_with_msg(bNotify, "Ngo�i khu v�c th�nh ch�nh")
	end
	if IsStalling() == 1 then
		return _fail_with_msg(bNotify, "�ang b�y b�n")
	end
	if IsSleeping() == 1 then
		return _fail_with_msg(bNotify, "�ang ng� say")
	end
	if MeridianGetLeftGenuineQiCapcity() <= 0 then
		return _fail_with_msg(bNotify, format("%s ch�n khi trong kh� h�i �� ��t gi�i h�n", GetName()))
	end
	
	--���ӳ��ɽ��ܵ�����
	if _get_import_zhenqi_count() >= N_IMPORT_ZHENQI_MAX then
		return _fail_with_msg(bNotify, format("%s s� ch�n kh� c� th� nh�n trong ng�y �� ��t gi�i h�n", GetName()))
	end
	
	--���ӳ��й�ʱ��
	local nRet, szLog = _check_caption_consume(nLevel, bDelete, bNotify)
	if nRet ~= 1 then
		return _fail_with_msg(bNotify, szLog)
	end
	
	--�ӳ�У����
	local nLeaderVerifyCode = _get_verify_code()
	
	local tCheckMemberPara = {--����Ա״̬��Ҫ�Ĳ���
		nLeaderMap = nMapID0,
		nLeaderX = nX0,
		nLeaderY = nY0,
		nCheckLevel = nLevel,
		bNeedDelete = bDelete, 
		bNeedNotify = bNotify,
		nLeaderVerifyCode = nLeaderVerifyCode,--У����
	}
	local tCallInfo = { --����������Ϣ
		func = _check_member_status,
		bExceptCaption = 1,
		tFunctionPara = tCheckMemberPara
	}
	local nRet, tRet = gf_operate_on_teammembers(tCallInfo) --�����ж�Աִ�в���
	if 1 ~= nRet then
		return _fail_with_msg(bNotify, tRet.szLog or "L�i ��i vi�n ch�a x�c ��nh")
	end
	
	return 1, szLog
end

--���ӳ�������
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
			szLog = format("%s th�i gian kh�ng �� %d ph�t", t[3], t[2])
			return 0, szLog
		elseif nCount < N_WARNING_TIME then
			szLog = format("%s c�n l�i %s, ch� c� th� duy tr� %d l�n", szLog, t[3], nCount)
		end
	end
	
	if 1 == bDelete then--���еĶ����ͨ���� ���Կ۳���
		for i = 1, getn(s) do
    		local t = s[i]
    		local nCurTime = GetJuLingWanTime(t[1])
    		if nCurTime >= t[2] then
    			if SetJuLingWanTime(t[1],nCurTime - t[2]) ~= 1 then
    				szLog = format("L�i ch�a x�c ��nh", t[3], t[2])
    				return 0, szLog
    			end
    		elseif nCount < N_WARNING_TIME then
    			szLog = format("%s th�i gian kh�ng �� %d ph�t", t[3], t[2])
    			return 0, szLog
    		end
    	end
	end

	return 1, szLog
end

--����Ա��״̬
	--����Ա��ӳ��ľ���
	--����Աʣ������
	--����Ա����������
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
		return _fail_with_msg(bNotify, format("%s ki�m ch�ng th�t b�i", GetName()))
	end
	
	if IsStalling() == 1 then
		return _fail_with_msg(bNotify, format("%s �ang b�y b�n", GetName()))
	end
	
	if IsSleeping() == 1 then
		return _fail_with_msg(bNotify, format("%s �ang ng� say", GetName()))
	end

	local nMapID, nX, nY = GetWorldPos()
	if nMapID ~= nLeaderMap then
		return _fail_with_msg(bNotify, format("%s kh�ng c�ng chung 1 th�nh th�", GetName()))
	end
	local nDistance = _Distance2BetweenPoints(nLeaderMap, nLeaderX, nLeaderY, nMapID, nX, nY)
	if nDistance < 0 or nDistance > N_MEMBER_MAX_DISTANCE then
		return _fail_with_msg(bNotify, format("%s c�ch ��i tr��ng qu� xa", GetName()))
	end
	if _get_export_zhenqi_count() >= N_EXPORT_ZHENQI_MAX then
		return _fail_with_msg(bNotify, format("%s ch�n kh� c� th� chuy�n trong ng�y �� ��t gi�i h�n", GetName()))
	end
	
	--����Ա��ʣ������ʱ��
	local nRet, szLog = _check_member_consume(nCheckLevel, bNeedDelete, bNeedNotify)
	if nRet ~= 1 then
		return _fail_with_msg(bNotify, szLog)
	end
	
	return 1, szLog
end

function _check_member_consume(nLevel, bDelete, bNotify)
	if MeridianGetQiHai() < N_MEMBER_CONSUME_ZHENQI then
		return _fail_with_msg(bNotify, format("%s ch�n khi kh�ng ��", GetName()))
	end
	if 1 == bDelete then
		if 1 ~= AwardGenuineQi(-1*N_MEMBER_CONSUME_ZHENQI) then
			return _fail_with_msg(bNotify, format("%s kh�u tr� ch�n kh� th�t b�i", GetName()))
		else
			_add_export_zhenqi_count(N_MEMBER_CONSUME_ZHENQI)
			SetCurrentNpcSFX(PIdx2NpcIdx(),918,0,0)--������������Ч
		end
	end
	return 1,""
end


--��ȡ�����������
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

--��ȡ�����������
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

--��ȡУ����
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

--����У����
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

--�жϾ���
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

