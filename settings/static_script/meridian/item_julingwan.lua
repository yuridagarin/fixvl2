--聚灵丸物品脚本实现

Include("\\script\\task_access_code_def.lua")

TASKVAL_JULING_LASTACTIVE_TIME = 3112		-- 记录最近一次获得聚灵经验的时间
TASKVAL_JULING_OFFLINE_TIME = 3111			-- 离线聚灵时间（累积）分钟

ZHENQIWAN_TYPE0 = 3	--聚灵丸
ZHENQIWAN_TYPE1 = 2 -- 大聚灵丸
ZHENQIWAN_TYPE2 = 1 -- 聚灵仙丹

ZHENQIWAN_ACCESS_CODE = TASK_ACCESS_CODE_OFFLINELIVE --变量ACCESS CODE
TASKVAL_ZHENQIWAN = 3105	-- 聚灵丸的时间(分钟)
TASKVAL_ZHENQIWAN1 = 3106	-- 大聚灵丸的时间(分钟)
TASKVAL_ZHENQIWAN2 = 3107	-- 聚灵仙丹的时间(分钟)
t_ZhenQiWanPara = 
{
	--time task, task access code, add zhenqi
	{TASKVAL_ZHENQIWAN2, ZHENQIWAN_ACCESS_CODE, 3, "T? Linh Ti猲 Кn"},
	{TASKVAL_ZHENQIWAN1, ZHENQIWAN_ACCESS_CODE, 2, "Чi T? Linh Ho祅"},
	{TASKVAL_ZHENQIWAN,  ZHENQIWAN_ACCESS_CODE, 1, "T? Linh Ho祅"},
}

t_ItemInfo =
{
	--[ItemParticular]=type, name, time add(min)
	[30458] = {ZHENQIWAN_TYPE0, "T? Linh Ho祅", 480},
	[30459] = {ZHENQIWAN_TYPE1, "Чi T? Linh Ho祅", 480},
	[30460] = {ZHENQIWAN_TYPE2, "T? Linh Ti猲 Кn", 480},
}

function OnUse_Real(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == 2 and d == 1 then
		local p = GetItemParticular(id)
		local t = t_ItemInfo[p]
		if t then
			--删除物品
			local nDelResult = DelItemByIndex(id, -1)
			if 1 == nDelResult then
				AddJuLingWanTime(t[1], t[3])
				local nNewTime = GetJuLingWanTime(t[1])
				local szMsg = format("C竎 h? s? d鬾g %s nh薾 頲 th阨 gian 駓 th竎 %s %s, hi謓 t筰 th阨 gian 駓 th竎 %s l? %s", t[2], _GetTimeStr(t[3]), t[2], t[2], _GetTimeStr(nNewTime))
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
		szTime = format("%s%d gi?", szTime, nHour)
	end
	if nMin > 0 or nHour <= 0 then
		szTime = format("%s%d ph髏", szTime, nMin)
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

--更新获得聚灵经验的时间
function UpdateAwardJuLingExpTime()
	SetTask(TASKVAL_JULING_LASTACTIVE_TIME, GetTime(), ZHENQIWAN_ACCESS_CODE)
end

--获得某种离线时间
function UpdateOneOfflineTime(LogoutTime, LoginTime, nMaxTime, nLastAwardTimeTaskId, nOfflineTimeTaskId, nTaskAccessCode)
	if 0 == LogoutTime then
		return 0
	end
	local LastAwardTime = GetTask(nLastAwardTimeTaskId)
	if LastAwardTime == 0 then
		LastAwardTime = LogoutTime
	end
	LastAwardTime = max(LastAwardTime, LogoutTime)--取上次离线时间和上次获得经验时间的较大者
	-- 计算可以获得的聚灵时间
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
	--公平起见，所有人都从规定时间开始累计
	if LoginTime < SYS_ONLINE_TIME then
		return 0
	end
		
	local nCurOffLineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)--当前离线时间
	local nCalcLogOutTime = LogoutTime
	--为了公平起见离线时间都从系统上线时间开始计算
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

--用离线时间换取聚灵丸托管经验
function get_offline_juling_talk()
	local OfflineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)
	if OfflineTime <= 0 then
		Say("C竎 h? kh玭g  th阨 gian T? Linh Ho祅.", 0)
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
	szMsg = format("%s th阨 gian T? Linh Ho祅 c? th? quy i <color=yellow>%d ph髏<color>, s? d鬾g T? Linh Ho祅/ Чi T? Linh Ho祅/ T? Linh Ti猲 Кn c? th? quy i l莕 lt <color=yellow>%d/%d/%d<color> 甶觤 ch﹏ kh?"
		, szMsg, OfflineTime, tZhenQiAll[1], tZhenQiAll[2], tZhenQiAll[3])
	szMsg = format("%s\n th阨 gian T? Linh Ho祅 c? th? d飊g quy i l? <color=yellow>%d ph髏 (ch﹏ kh?:%d)<color>", szMsg, tExchgTime[1], tZhenQi[1])
	szMsg = format("%s\n th阨 gian Чi T? Linh ho祅 l? <color=yellow>%d ph髏 (ch﹏ kh?:%d)<color>", szMsg, tExchgTime[2], tZhenQi[2])
	szMsg = format("%s\n th阨 gian T? Linh Ti猲 Кn l? <color=yellow>%d ph髏 (ch﹏ kh?:%d)<color>", szMsg, tExchgTime[3], tZhenQi[3])
	
	local tSay = 
	{
		format("D飊g th阨 gian T? Linh Ho祅 i ch﹏ kh?/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE0),
		format("D飊g th阨 gian Чi T? Linh Ho祅 i ch﹏ kh?/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE1),
		format("D飊g th阨 gian T? Linh Ti猲 Кn i ch﹏ kh?/#confirm_use_juling_offline_time(%d)", ZHENQIWAN_TYPE2),
		"tr? l筰/offline_exchange_talk_main",
		"R阨 kh醝/no",
	}
	Say(szMsg, getn(tSay), tSay)
end

function confirm_use_juling_offline_time(nType)
	local tPara = _GetJunLingWanPara(nType)
	if tPara then
		local szMsg = format("X竎 nh s? d鬾g <color=yellow>%s<color> th阨 gian 駓 th竎  quy i ch﹏ kh??", tPara[4])
		local tSay = 
    	{
    		format("уng ?/#yes_get_offline_juling_zhenqi(%d)",nType),
    		"tr? l筰/get_offline_juling_talk",
    		"R阨 kh醝/no",
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
		Say(format("C竎 h? kh玭g  %s th阨 gian, kh玭g th? quy i.", tPara[4]), 0)
		return
	end
	local OfflineTime = GetTask(TASKVAL_JULING_OFFLINE_TIME)
	local CalcTime = min(nTime, OfflineTime)
	
	local nEffect = GetJuLingWanEffectByType(nType)
	local nLeftCapacity = MeridianGetLeftGenuineQiCapcity()
	local nMaxExchgTime = floor(nLeftCapacity / nEffect)
	if nMaxExchgTime <= 0 then
		Say(format("C竎 h? ch璦  th玭g kinh m筩h ho芻 ch﹏ kh?  t gi韎 h筺, kh玭g th? quy i."), 0)
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
	local szMsg = format("C竎 h?  s? d鬾g th祅h c玭g %s th阨 gian 駓 th竎  i <color=yellow>%d<color> 甶觤 ch﹏ kh?, hi謓 c遪 l筰 %d 甶觤 ch﹏ kh? 駓 th竎 c? th? i, c竎 h? c? th? d飊g T? Linh Ho祅/Чi T? Linh/ T? Linh Ti猲 Кn ti誴 t鬰 quy i.", tPara[4], GiveZhenQi, LeftZhenQi)
	Say(szMsg, 0)
	Msg2Player(format("C竎 h? d飊g %s th阨 gian 駓 th竎 quy i th祅h %d 甶觤 ch﹏ kh?", tPara[4], GiveZhenQi))
end

function no()
end

