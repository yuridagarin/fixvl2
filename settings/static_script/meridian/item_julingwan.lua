--��������Ʒ�ű�ʵ��

Include("\\script\\task_access_code_def.lua")

TASKVAL_JULING_LASTACTIVE_TIME = 3112		-- ��¼���һ�λ�þ��龭���ʱ��
TASKVAL_JULING_OFFLINE_TIME = 3111			-- ���߾���ʱ�䣨�ۻ�������

ZHENQIWAN_TYPE0 = 3	--������
ZHENQIWAN_TYPE1 = 2 -- �������
ZHENQIWAN_TYPE2 = 1 -- �����ɵ�

ZHENQIWAN_ACCESS_CODE = TASK_ACCESS_CODE_OFFLINELIVE --����ACCESS CODE
TASKVAL_ZHENQIWAN = 3105	-- �������ʱ��(����)
TASKVAL_ZHENQIWAN1 = 3106	-- ��������ʱ��(����)
TASKVAL_ZHENQIWAN2 = 3107	-- �����ɵ���ʱ��(����)
t_ZhenQiWanPara = 
{
	--time task, task access code, add zhenqi
	{TASKVAL_ZHENQIWAN2, ZHENQIWAN_ACCESS_CODE, 3, "T� Linh Ti�n ��n"},
	{TASKVAL_ZHENQIWAN1, ZHENQIWAN_ACCESS_CODE, 2, "��i T� Linh Ho�n"},
	{TASKVAL_ZHENQIWAN,  ZHENQIWAN_ACCESS_CODE, 1, "T� Linh Ho�n"},
}

t_ItemInfo =
{
	--[ItemParticular]=type, name, time add(min)
	[30458] = {ZHENQIWAN_TYPE0, "T� Linh Ho�n", 480},
	[30459] = {ZHENQIWAN_TYPE1, "��i T� Linh Ho�n", 480},
	[30460] = {ZHENQIWAN_TYPE2, "T� Linh Ti�n ��n", 480},
}

function OnUse_Real(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == 2 and d == 1 then
		local p = GetItemParticular(id)
		local t = t_ItemInfo[p]
		if t then
			--ɾ����Ʒ
			local nDelResult = DelItemByIndex(id, -1)
			if 1 == nDelResult then
				AddJuLingWanTime(t[1], t[3])
				local nNewTime = GetJuLingWanTime(t[1])
				local szMsg = format("C�c h� s� d�ng %s nh�n ���c th�i gian �y th�c %s %s, hi�n t�i th�i gian �y th�c %s l� %s", t[2], _GetTimeStr(t[3]), t[2], t[2], _GetTimeStr(nNewTime))
				Msg2Player(szMsg)
			end
		end
	end
	return 0
end

function _GetTimeStr(nTime)
	local nHour = floor(nTime / 60)
	local nMin	= mod(nTime, 60)
	local szTime = ""
	if nHour > 0 then
		szTime = format("%s%d gi�", szTime, nHour)
	end
	if nMin > 0 or nHour <= 0 then
		szTime = format("%s%d ph�t", szTime, nMin)
	end
	return szTime
end

function GetJuLingWanTime(nType)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		return GetTask(tPara[1])
	end
	assert(0)
	return 0;
end

function GetJuLingWanAllTime()
	local nTime = 0
	for i=1, getn(t_ZhenQiWanPara) do
		nTime = nTime + GetTask(t_ZhenQiWanPara[i][1])
	end
	return nTime
end

function AddJuLingWanTime(nType, nVal)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		local nTaskVal = GetTask(tPara[1])
		nTaskVal = nTaskVal + nVal
		SetTask(tPara[1], nTaskVal, tPara[2])
		return 1
	end
	assert(0)
	return 0;
end

function SetJuLingWanTime(nType, nVal)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		SetTask(tPara[1], nVal, tPara[2])
		return 1
	end
	assert(0)
	return 0;
end

function GetJuLingWanEffect(tPara)
	if tPara then
		return tPara[3] or 0
	end
	return 0
end

function GetJuLingWanEffectByType(nType)
	local tPara = _GetJunLingWanPara(nType)
	return GetJuLingWanEffect(tPara)
end

function _GetJunLingWanPara(nType)
	if nType >= 1 and nType <= getn(t_ZhenQiWanPara) then
		return t_ZhenQiWanPara[nType];
	end
	return nil
end

--���»�þ��龭���ʱ��
function UpdateAwardJuLingExpTime()
	SetTask(TASKVAL_JULING_LASTACTIVE_TIME, GetTime(), ZHENQIWAN_ACCESS_CODE)
end

--���ĳ������ʱ��
function UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, nLastAwardTimeTaskId, nOfflineTimeTaskId, nTaskAccessCode)
	if 0 == LogoutTime then
		return 0
	end
	local LastAwardTime = GetTask(nLastAwardTimeTaskId)
	if LastAwardTime == 0 then
		LastAwardTime = LogoutTime
	end
	LastAwardTime = max(LastAwardTime, LogoutTime)--ȡ�ϴ�����ʱ����ϴλ�þ���ʱ��Ľϴ���
	-- ������Ի�õľ���ʱ��
	local OfflineAddTime = max(0, LoginTime - LastAwardTime)
	if GetTask(nLastAwardTimeTaskId) < 0 then
		SetTask(nLastAwardTimeTaskId, 0, nTaskAccessCode)
	end
	
	local nCurTime = GetTask(nOfflineTimeTaskId)
	local nNewTime = nCurTime + floor(OfflineAddTime / 60)
	if nNewTime > nMaxTime then
		nNewTime = nMaxTime
	end
	SetTask(nOfflineTimeTaskId, nNewTime, nTaskAccessCode)
	return nNewTime
end

SYS_ONLINE_TIME = MkTime(2013, 1, 25, 0, 0, 0)
function UpdateJuLingOfflineTime(LogoutTime, LoginTime, MaxOfflineTime)
	--��ƽ����������˶��ӹ涨ʱ�俪ʼ�ۼ�
	if LoginTime < SYS_ONLINE_TIME then
		return 0
	end
		
	local nCurOffLineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)--��ǰ����ʱ��
	local nCalcLogOutTime = LogoutTime
	--Ϊ�˹�ƽ�������ʱ�䶼��ϵͳ����ʱ�俪ʼ����
	if LogoutTime < SYS_ONLINE_TIME then
		nCalcLogOutTime = SYS_ONLINE_TIME
		local nY,nM,nD,nH,nMin,nS = GmTime(LogoutTime)
		local nY2,nM2,nD2,nH2,nMin2,nS2 = GmTime(SYS_ONLINE_TIME)
		local szMsg = format("Player:%s Last Logout at %d-%d-%d %d:%d:%d, offline time calculate from %d-%d-%d %d:%d:%d"
				, GetName(), nY,nM,nD,nH,nMin,nS, nY2,nM2,nD2,nH2,nMin2,nS2)
		WriteLog(szMsg)
	end
	local nNewTime = UpdateOneOfflineTime(nCalcLogOutTime, LoginTime, MaxOfflineTime
		, TASKVAL_JULING_LASTACTIVE_TIME, TASKVAL_JULING_OFFLINE_TIME, ZHENQIWAN_ACCESS_CODE)
	return nNewTime
end

--������ʱ�任ȡ�������йܾ���
function get_offline_juling_talk()
	local OfflineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)
	if OfflineTime <= 0 then
		Say("C�c h� kh�ng �� th�i gian T� Linh Ho�n.", 0)
		return
	end
	
	local tTime = {
		GetJuLingWanTime(ZHENQIWAN_TYPE0),
		GetJuLingWanTime(ZHENQIWAN_TYPE1),
		GetJuLingWanTime(ZHENQIWAN_TYPE2),
	}
	
	local tExchgTime = {
		min(tTime[1], OfflineTime),
		min(tTime[2], OfflineTime),
		min(tTime[3], OfflineTime),
	}
	
	local tZhenQi = {
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE0) * tExchgTime[1],
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE1) * tExchgTime[2],
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE2) * tExchgTime[3],
	}
	
	local tZhenQiAll = {
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE0) * OfflineTime,
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE1) * OfflineTime,
		GetJuLingWanEffectByType(ZHENQIWAN_TYPE2) * OfflineTime,
	}

	local szMsg = ""
	szMsg = format("%s th�i gian T� Linh Ho�n c� th� quy ��i <color=yellow>%d ph�t<color>, s� d�ng T� Linh Ho�n/ ��i T� Linh Ho�n/ T� Linh Ti�n ��n c� th� quy ��i l�n l��t <color=yellow>%d/%d/%d<color> �i�m ch�n kh�"
		, szMsg, OfflineTime, tZhenQiAll[1], tZhenQiAll[2], tZhenQiAll[3])
	szMsg = format("%s\n th�i gian T� Linh Ho�n c� th� d�ng quy ��i l� <color=yellow>%d ph�t (ch�n kh�:%d)<color>", szMsg, tExchgTime[1], tZhenQi[1])
	szMsg = format("%s\n th�i gian ��i T� Linh ho�n l� <color=yellow>%d ph�t (ch�n kh�:%d)<color>", szMsg, tExchgTime[2], tZhenQi[2])
	szMsg = format("%s\n th�i gian T� Linh Ti�n ��n l� <color=yellow>%d ph�t (ch�n kh�:%d)<color>", szMsg, tExchgTime[3], tZhenQi[3])
	
	local tSay = 
	{
		format("D�ng th�i gian T� Linh Ho�n ��i ch�n kh�/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE0),
		format("D�ng th�i gian ��i T� Linh Ho�n ��i ch�n kh�/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE1),
		format("D�ng th�i gian T� Linh Ti�n ��n ��i ch�n kh�/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE2),
		"tr� l�i/offline_exchange_talk_main",
		"R�i kh�i/no",
	}
	Say(szMsg, getn(tSay), tSay)
end

function confirm_use_juling_offline_time(nType)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		local szMsg = format("X�c ��nh s� d�ng <color=yellow>%s<color> th�i gian �y th�c �� quy ��i ch�n kh�?", tPara[4])
		local tSay = 
    	{
    		format("��ng �/#yes_get_offline_juling_zhenqi(%d)",nType),
    		"tr� l�i/get_offline_juling_talk",
    		"R�i kh�i/no",
    	}
    	Say(szMsg, getn(tSay), tSay)
	end
end

function yes_get_offline_juling_zhenqi(nType)
	local tPara = _GetJunLingWanPara(nType)
	if not tPara then
		return
	end
	local nTime = GetJuLingWanTime(nType)
	if nTime <= 0 then
		Say(format("C�c h� kh�ng �� %s th�i gian, kh�ng th� quy ��i.", tPara[4]), 0)
		return
	end
	local OfflineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)
	local CalcTime = min(nTime, OfflineTime)
	
	local nEffect = GetJuLingWanEffectByType(nType)
	local nLeftCapacity = MeridianGetLeftGenuineQiCapcity()
	local nMaxExchgTime = floor(nLeftCapacity / nEffect)
	if nMaxExchgTime <= 0 then
		Say(format("C�c h� ch�a �� th�ng kinh m�ch ho�c ch�n kh� �� ��t gi�i h�n, kh�ng th� quy ��i."), 0)
		return
	end
	
	local ActualTime = min(CalcTime, nMaxExchgTime)
	local GiveZhenQi = ActualTime * nEffect
	
	SetJuLingWanTime(nType, nTime - ActualTime)
	SetTask(TASKVAL_JULING_OFFLINE_TIME, OfflineTime - ActualTime, ZHENQIWAN_ACCESS_CODE)
	AwardGenuineQi(GiveZhenQi)
	local szLog = format("OfflineLiveEx Player:%s use %d minute %s time gain %d ZhenQi", GetName(), ActualTime, tPara[4], GiveZhenQi)
	WriteLog(szLog)
	local LeftZhenQi = nEffect * OfflineTime - GiveZhenQi
	local szMsg = format("C�c h� �� s� d�ng th�nh c�ng %s th�i gian �y th�c �� ��i <color=yellow>%d<color> �i�m ch�n kh�, hi�n c�n l�i %d �i�m ch�n kh� �y th�c c� th� ��i, c�c h� c� th� d�ng T� Linh Ho�n/��i T� Linh/ T� Linh Ti�n ��n ti�p t�c quy ��i.", tPara[4], GiveZhenQi, LeftZhenQi)
	Say(szMsg, 0)
	Msg2Player(format("C�c h� d�ng %s th�i gian �y th�c quy ��i th�nh %d �i�m ch�n kh�", tPara[4], GiveZhenQi))
end

function no()
end

