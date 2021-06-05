Include("\\script\\online\\viet_event\\ip_bonus\\ip_head.lua") -- IP bonus
Include("\\settings\\static_script\\meridian\\item_julingwan.lua")

TASKVAL_BAIJUWAN = 2501		-- �������������׾����ʣ��ʱ�䣨���ӣ�
TASKVAL_SHENNONG = 2502		-- ���������������ũ����ʣ��ʱ�䣨���ӣ�
TASKVAL_BAIJUWAN1 = 2507	-- ��׾����ʱ��
TASKVAL_BAIJUWAN2 = 2508	-- �׾��ɵ���ʱ��
TASKVAL_BAIJUWAN3 = 2511	-- С�׾Ե�ʱ��
TASKVAL_BAIJUWAN3_DATA = 2512	-- С�׾���ȡʱ��

TASKVAL_BAIJU_LASTACTIVE_TIME = 2292		-- ��¼���һ�λ�ð׾Ծ����ʱ��
TASKVAL_LIUSHEN_LASTACTIVE_TIME = 2293		-- ��¼���һ�λ���������ʱ��
TASKVAL_SANQING_LASTACTIVE_TIME = 2294		-- ��¼���һ�λ�����徭���ʱ��


function main(nBaiju, nShennong, nZhenQi)
	local nPlayerMapId, nPlayerX, nPlayerY = GetWorldPos();
	if nPlayerMapId == 219 then
     		local nDist = DistanceBetweenPoints(219, 1529,3137, nPlayerMapId, nPlayerX, nPlayerY);
     		if nDist >= 0 and nDist <= 3 then
     			Msg2Player("Khu v�c n�y kh�ng th� ti�n h�nh �y th�c, vui l�ng th� l�i t�i v� tr� kh�c.")
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
		Msg2Player("B�n n�n b�t ��u thu th�p, nghi�n c�u ho�c b�y b�n tr��c r�i h�y m� t��ng.")
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
	Msg2Player("B�n b�t ��u tr�ng th�i bay b�ng trong th� gi�i th�n ti�n.")
	QuitGestConvention();	--�˳�����������б�
end

function Taibai(nBaiju)
	if nBaiju == 0 then
		Msg2Player("B�n ph�i s� d�ng B�ch C�u ho�n m�i c� th� suy t��ng.")
		return 0
	end
	if GetTask(TASKVAL_BAIJUWAN) + GetTask(TASKVAL_BAIJUWAN1) + GetTask(TASKVAL_BAIJUWAN2) + GetTask(TASKVAL_BAIJUWAN3) <= 0 then
		Msg2Player("B�ch C�u ho�n c� th� gi�p b�n nguy�n th�n h�p nh�t.")
		return 0
	end;
	return 1
end

function ZhenQi(nZhenQi)
	if nZhenQi == 0 then
		Msg2Player("C�c h� c�n s� d�ng T� Linh Ho�n �� b�t ��u minh t��ng.")
		return 0
	end
	if MeridianGetLeftGenuineQiCapcity() <= 0 then
		Msg2Player("Ch�n kh� c�a c�c h� �� ��t gi�i h�n, kh�ng th� s� d�ng T� Linh Ho�n �� minh t��ng.")
		return 0
	end
	if GetJuLingWanAllTime() <= 0 then
		Msg2Player("T� Linh Ho�n c� th� gi�p b�n h� th�n th� nh�t, h�y th� 1 qu� �i.")
		return 0
	end;
	return 1
end

function Shennong(nShennong)
	if GetTask(TASKVAL_SHENNONG) <= 0 then
		Msg2Player("�� th�nh Th�n N�ng c�n ph�i c� Th�n N�ng ��n.")
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
