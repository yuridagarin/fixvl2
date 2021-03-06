--by liubo
--尊师重道
Include("\\script\\online_activites\\2011_10\\activity_03\\teacher_day.lua")
function ServerStartUp(nStartTime,nEndTime)

end

function PlayerLogin(nExchangeComing,nStartTime,nEndTime)
	local nIndex1 =GetTrigger(2557)
	if nIndex1 ~= 0 then
		RemoveTrigger(nIndex1)
	end
	local nIndex2 = GetTrigger(2550)
	if nIndex2 ~= 0 then
		RemoveTrigger(nIndex2)
	end
	--判断活动是否开启
	if gf_CheckEventDateEx(44) ~= 1 then
		return 0
	end
	--是否是跨服
	if nExchangeComing ~= 0 then
		--print("nExchangeComing")
		return 0 
	end
	--判断次数
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
	end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) >= VET_201111_MaxUsedCount then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.TriggerIndex,0)
		return 0
	end
	--创建登出触发器
	local nIndex = CreateTrigger(3,VET_201111_TEACHER_DAY_TBID,VET_201111_TEACHER_DAY_UFID)
	if nIndex == 0 then
		WriteLog("[Event]201111 event l? nh? gi竜, t筼 m竬 kh雐 ng th蕋 b筰")
		return 0
	end
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.TriggerIndex,nIndex)
	--创建时间触发器
	nIndex = CreateTrigger(1, VET_201111_TEACHER_DAY_TBID1, VET_201111_TEACHER_DAY_UFID1) 
	if nIndex == 0 then
		WriteLog("[Event]201111 event l? nh? gi竜, t筼 m竬 kh雐 ng th蕋 b筰")
		return 0
	end
    ContinueTimer(GetTrigger(VET_201111_TEACHER_DAY_UFID1)) 
	--登录时记录时间
	local nTime = GetTime()
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)		
	end
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
end