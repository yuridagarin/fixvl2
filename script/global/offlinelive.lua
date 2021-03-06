Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")

TASKVAL_BAIJUWAN = 2501		-- 该任务变量保存白驹丸的剩余时间（分钟）
TASKVAL_SHENNONG = 2502		-- 该任务变量保存神农丹的剩余时间（分钟）
TASKVAL_BAIJUWAN1 = 2507	-- 大白驹丸的时间
TASKVAL_BAIJUWAN2 = 2508	-- 白驹仙丹的时间
TASKVAL_BAIJUWAN3 = 2511	-- 小白驹的时间
TASKVAL_BAIJUWAN3_DATA = 2512	-- 小白驹领取时间

TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- 记录最近一次获得白驹经验的时间
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- 记录最近一次获得六神经验的时间
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- 记录最近一次获得三清经验的时间


function main(nBaiju, nShennong, nZhenQi)
	local nPlayerMapId, nPlayerX, nPlayerY = GetWorldPos();
	if nPlayerMapId == 219 then
     		local nDist = DistanceBetweenPoints(219, 1529,3137, nPlayerMapId, nPlayerX, nPlayerY);
     		if nDist >= 0 and nDist <= 3 then
     			Msg2Player("Khu v鵦 n祔 kh玭g th? ti課 h祅h 駓 th竎, vui l遪g th? l筰 t筰 v? tr? kh竎.")
     			return
     		end
     	end

	local TimeNow = GetTime()
	SetTask(TASKVAL_BAIJU_LASTACTIVE_TIME, TimeNow)
	SetTask(TASKVAL_LIUSHEN_LASTACTIVE_TIME, TimeNow)
	SetTask(TASKVAL_SANQING_LASTACTIVE_TIME, TimeNow)
	--SetTask(TASKVAL_ZHENQI_LASTACTIVE_TIME, TimeNow)

	local nResult = 0
	if IsGathering() > 0 then
		nResult = Shennong(nShennong)
	elseif IsStalling() > 0 or IsReading() > 0 then
		if nBaiju > 0 then
			nResult = Taibai(nBaiju)
		elseif nZhenQi > 0 then
			nResult = nResult + ZhenQi(nZhenQi)
		else
			Taibai(nBaiju)
		end
	else
		Msg2Player("B筺 n猲 b総 u thu th藀, nghi猲 c鴘 ho芻 b祔 b竛 trc r錳 h穣 m? tng.")
	end;
	if nResult == 0 then
		return
	end
	IpBonusClose()
	OfflineLive()
	local strLog = "[Offlinelive] "..GetName().." "..GetAccount()
	if nBaiju > 0 then
		strLog = strLog.." BaiJuWan"
	end
	if nShennong > 0 then
		strLog = strLog.." ShenNongDan"
	end
	if nZhenQi > 0 then
		strLog = strLog.." JuLingWan"
	end
	WriteLog(strLog)
	Msg2Player("B筺 b総 u tr筺g th竔 bay b鎛g trong th? gi韎 th莕 ti猲.")
	QuitGestConvention();	--退出比武大会配对列表
end

function Taibai(nBaiju)
	if nBaiju == 0 then
		Msg2Player("B筺 ph秈 s? d鬾g B筩h C﹗ ho祅 m韎 c? th? suy tng.")
		return 0
	end
	if GetTask(TASKVAL_BAIJUWAN) + GetTask(TASKVAL_BAIJUWAN1) + GetTask(TASKVAL_BAIJUWAN2) + GetTask(TASKVAL_BAIJUWAN3) <= 0 then
		Msg2Player("B筩h C﹗ ho祅 c? th? gi髉 b筺 nguy猲 th莕 h頿 nh蕋.")
		return 0
	end;
	return 1
end

function ZhenQi(nZhenQi)
	if nZhenQi == 0 then
		Msg2Player("C竎 h? c莕 s? d鬾g T? Linh Ho祅  b総 u minh tng.")
		return 0
	end
	if MeridianGetLeftGenuineQiCapcity() <= 0 then
		Msg2Player("Ch﹏ kh? c馻 c竎 h?  t gi韎 h筺, kh玭g th? s? d鬾g T? Linh Ho祅  minh tng.")
		return 0
	end
	if GetJuLingWanAllTime() <= 0 then
		Msg2Player("T? Linh Ho祅 c? th? gi髉 b筺 h? th莕 th? nh蕋, h穣 th? 1 qu? 甶.")
		return 0
	end;
	return 1
end

function Shennong(nShennong)
	if GetTask(TASKVAL_SHENNONG) <= 0 then
		Msg2Player("в th豱h Th莕 N玭g c莕 ph秈 c? Th莕 N玭g n.")
		return 0
	end;
	return 1
end

function Leave()
end
function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end;
