Include("\\settings\\static_script\\global\\daily_award_limit_api.lua")

N_MAX_YIN_JUAN = 300000
function yinquanapi_limittop_award_yinquan(nNum, bMustGetAll, bDisableNotify)
	local nCurYinQuan = ModifyYinJuan(0, 1)
	local nNewYinQuan = nCurYinQuan + nNum
	if nNewYinQuan < 0 then
		nNewYinQuan = 0
	end
	if nNewYinQuan > N_MAX_YIN_JUAN then
		nNewYinQuan = N_MAX_YIN_JUAN
	end
	local nAward = nNewYinQuan - nCurYinQuan
	if nAward ~= nNum then
		if nAward < nNum and 1 == bMustGetAll then
			nAward = 0
		end
		if not bDisableNotify then
			Msg2Player(format("Ng��i nh�n ���c %d/%d �i�m ng�n phi�u, s� ng�n phi�u �� ��t gi�i h�n %d", nAward, nNum, N_MAX_YIN_JUAN))
		end
	end
	if 0 ~= nAward then
		ModifyYinJuan(nAward, 1)
	end
	return nAward
end

function api_daily_limit_award_yinquan(nNum, bMustGetAll, bDisableNotify)
	if nNum <= 0 then
		return 0
	end
	local nLeftCapacity = daily_award_limit_get_today_left_capacity(DAILY_AWARD_LIMMIT_TYPE_YINQUAN)
	local nAward = min(nNum, nLeftCapacity)
	
	if nAward < nNum and 1 == bMustGetAll then
		nAward = 0
	end
	
	if nAward > 0 then
		yinquanapi_limittop_award_yinquan(nAward)
		daily_award_limit_add_today_num(DAILY_AWARD_LIMMIT_TYPE_YINQUAN, nAward)
		return 1
	else
		if not bDisableNotify then
			Msg2Player(format("Ng��i nh�n ���c %d/%d �i�m ng�n phi�u, h�m nay nh�n ���c ng�n phi�u �� ��t ��n gi�i h�n", nAward, nNum))
		end
	end
	return 0
end

function api_daily_limit_get_yinquan_left_capacity()
	local nYinQuanToMax = api_get_yinquan_left_capacity()
	return min(nYinQuanToMax, daily_award_limit_get_today_left_capacity(DAILY_AWARD_LIMMIT_TYPE_YINQUAN))
end

function api_get_yinquan_left_capacity()
	local nCurYinQuan = ModifyYinJuan(0, 1)
	return N_MAX_YIN_JUAN - nCurYinQuan
end

