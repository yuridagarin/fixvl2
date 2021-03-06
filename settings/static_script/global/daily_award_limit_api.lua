--每日获得上限
Include("\\settings\\static_script\\global\\regular_clear_task.lua")

--每日获得真气上限
DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_EXP = 1
DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_DAILY_TASK = 2
DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_ACTIVITY = 3
DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_IB = 4

--每日获得银券上限
DAILY_AWARD_LIMMIT_TYPE_YINQUAN = 5

DAILY_AWARD_LIMMIT_TYPE_RESERVE = 6

t_type_daily_award_limit_para = 
{
	--接口ID，日获得上限，是用的daily task index, HIWORD_FLAG, szDesc
	[DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_EXP] 		= {1, 65535, 1, 0, "Ch﹏ kh? luy謓 h鉧"},
	[DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_DAILY_TASK] 	= {2, 65535 , 1, 1, "Nhi謒 v? h籲g ng祔"},
	[DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_ACTIVITY] 		= {3, 65535 , 2, 0, "Ho箃 ng"},
	[DAILY_AWARD_LIMMIT_TYPE_QENUINEQI_IB] 			= {4, 65535, 2, 1, "Ch鴆 n╪g ti猽 ph?"},
	[DAILY_AWARD_LIMMIT_TYPE_YINQUAN] 		= {5, 4000, 5, 0, "Ng﹏ phi誹"},
	[DAILY_AWARD_LIMMIT_TYPE_RESERVE] 		= {6, 4000, 5, 1, "L璾"},
}


function daily_award_limit_get_today_left_capacity(nType)
	local nRet = -1;
	if nType and nType >= 1 and nType <= getn(t_type_daily_award_limit_para) then
		local nTotayAward = daily_award_limit_get_today_num(nType)
		if nTotayAward >= 0 then
			nRet = t_type_daily_award_limit_para[nType][2] - nTotayAward
		end
	end
	return nRet
end

function daily_award_limit_get_today_num(nType)
	local nRet = -1;
	if nType and nType >= 1 and nType <= getn(t_type_daily_award_limit_para) then
		local nValue = rc_GetDailyTask(t_type_daily_award_limit_para[nType][3])
		local nBytes = {SafeGetByte(nValue, 1),	SafeGetByte(nValue, 2),	SafeGetByte(nValue, 3),	SafeGetByte(nValue, 4),	}
		if t_type_daily_award_limit_para[nType][4] == 0 then
			nRet = nBytes[2] * 256 + nBytes[1]
		elseif t_type_daily_award_limit_para[nType][4] == 1 then
			nRet = nBytes[4] * 256 + nBytes[3]
		end
	end
	return nRet
end

function daily_award_limit_add_today_num(nType, nValue)
	--最大只支持65535
	if nValue < 0 or nValue > 65535 then
		print(format("daily_award_limit_add_today_num(%d,%d) value overflow 65535", nType, nValue))
		return 0
	end
	local nRet = 0;
	if nType and nValue and nType >= 1 and nType <= getn(t_type_daily_award_limit_para) then
		local nStartByte = 0
		local nTaskValue = rc_GetDailyTask(t_type_daily_award_limit_para[nType][3])
		local nBytes = {SafeGetByte(nTaskValue, 1),	SafeGetByte(nTaskValue, 2),	SafeGetByte(nTaskValue, 3),	SafeGetByte(nTaskValue, 4),	}
		if t_type_daily_award_limit_para[nType][4] == 0 then
			nStartByte = 1
		elseif t_type_daily_award_limit_para[nType][4] == 1 then
			nStartByte = 3
		end
		if nStartByte > 0 then
			local nCurVal = nBytes[nStartByte + 1] * 256 + nBytes[nStartByte]
			local nNewVal = nCurVal + nValue
			if nNewVal >= 0 and nNewVal <= 65535 then
				local nNewTaskValueTemp = SafeSetByte(nTaskValue, nStartByte, GetByte(nNewVal, 1))
				local nNewTaskValue = SafeSetByte(nNewTaskValueTemp, nStartByte + 1, SafeGetByte(nNewVal, 2))
				rc_SetDailyTask(t_type_daily_award_limit_para[nType][3], nNewTaskValue)
				nRet = 1
			end
		end
	end
	return nRet
end