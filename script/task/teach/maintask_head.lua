
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务头文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================


TEACH_SEASONNPC_ID = 1  -- 野叟新手任务的任务变量记录
TEACH_STATE_ID = 806 -- 任务变量状态，1 为正在进行任务，2 为已经完成了任务

-- 子函数，用以获取教育任务的进展程度
function TE_GetTeachState()

	return GetTask(TEACH_SEASONNPC_ID)

end

-- 子函数，用以设置教育任务的进展程度
function TE_SetTeachState(nValue)

	SetTask(TEACH_SEASONNPC_ID, nValue)

end

-- 子函数，得到教育任务的状态
function TE_GetTeachPro()
	return GetTask(TEACH_STATE_ID)
end

-- 子函数，设置教育任务的状态
function TE_SetTeachPro(nValue)
	SetTask(TEACH_STATE_ID,nValue)
end

-- 子函数，获取教育任务目前进行到了哪一段
-- 返回数值为第几段
function TE_GetTeachLevel()

local nValue = GetTask(1);

	if (nValue >= 3) and (nValue < 7) then
		return 1
	elseif (nValue >= 8) and (nValue < 9) then
		return 2
	elseif (nValue >= 10) and (nValue < 11) then
		return 3
	elseif (nValue >= 12) and (nValue < 13) then
		return 4
	elseif (nValue >= 14) and (nValue < 18) then
		return 5
	elseif (nValue >= 19) and (nValue < 21) then
		return 6
	end

end


-- 子函数，使教育任务进展到下一步
function TE_SetTeachAdd()
	SetTask(TEACH_SEASONNPC_ID, GetTask(TEACH_SEASONNPC_ID) + 1)
	Msg2Player("Nhi謒 v? hi謓 t筰:"..GetTask(TEACH_SEASONNPC_ID));
	return
end

-- 子函数，用于扩展对话 TALK 函数的功能
function TE_Talk(num,fun,szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	
