Include ("\\script\\meridian\\meridian_script_api.lua")
Include ("\\script\\system_switch_config.lua")

MERIDIAN_ZHENQI_LIMIT=150000
MERIDIAN_ZHENQI_UNIT=400
THIS_ITEM={2, 1, 30613}
N_ADD_ZHENQI_TYPE = AWARD_QENUINEQI_IB

function OnUse_Real(id)
	if _check_canuse(1) == 1 then
		local nCount = GetItemCount(THIS_ITEM[1],THIS_ITEM[2], THIS_ITEM[3])
		AskClientForNumber("_request_number_call_back", 1, nCount, "H�y nh�p s� l�n s� d�ng")
	end
end

function _check_canuse(bLotify)
	if 1 ~= IsMeridianSystemOpen() then
		if 1 == bLotify then
			Talk(1,"",format("H� th�ng kinh m�ch v�n ch�a khai th�ng, hi�n v�n ch�a th� s� d�ng v�t ph�m n�y!"))
		end
		return 0
	end
	if MeridianGetLevel() < 1 then
		if 1 == bLotify then
			Talk(1,"",format("Ch�a ph�i c�nh gi�i k�ch ho�t, t�m th�i kh�ng th� s� d�ng v�t ph�m n�y!"))
		end
		return 0
	end
	local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
	if nDailiCapacity <= 0 then
		if 1 == bLotify then
			Talk(1,"",format("Th�ng qua %s trong ng�y h�m nay �� kh�ng th� nh�n th�m ch�n kh�!", t_type_zhenqi_limit_para[N_ADD_ZHENQI_TYPE][5]))
		end
		return 0
	end
	local nZhenQi =  MeridianGetQiHai()+MeridianGetDanTian()
	if nZhenQi >= MERIDIAN_ZHENQI_LIMIT then
		if 1 == bLotify then
			Talk(1,"",format("��n d��c n�y ch� c� hi�u l�c ��i v�i �i�m ch�n kh� t�ng �i�m nh� h�n %d nh�n s�. �i�m luy�n c�a ng��i �� qu� ��y �� thu�c n�y kh�ng th� s� d�ng ���c n�a.", MERIDIAN_ZHENQI_LIMIT))
		end
		return 0
	end
	
	return 1
end

function _request_number_call_back(nNum)
	if _check_canuse(0) == 1 then
		local nLeft = MERIDIAN_ZHENQI_LIMIT - MeridianGetQiHai() - MeridianGetDanTian()
		local nDailiCapacity = GetTodayAwardGenuineQiLeftCapacityByType(N_ADD_ZHENQI_TYPE)
		local nLeftZhenQiCanGet = min(nLeft, nDailiCapacity)
		local nMaxNum = floor((nLeftZhenQiCanGet + MERIDIAN_ZHENQI_UNIT - 1)/MERIDIAN_ZHENQI_UNIT)
		
		local nUseNumReal = min(nNum, nMaxNum)
		local nDelResult = DelItem(THIS_ITEM[1],THIS_ITEM[2], THIS_ITEM[3], nUseNumReal)
		if  nDelResult and nDelResult == 1 then
			AwardGenuineQiByType(nUseNumReal * MERIDIAN_ZHENQI_UNIT, N_ADD_ZHENQI_TYPE)
		end
		return nUseNumReal
	end
	return 0
end