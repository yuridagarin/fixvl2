--by liubo
--��ʦ�ص�
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
	--�жϻ�Ƿ���
	if gf_CheckEventDateEx(44) ~= 1 then
		return 0
	end
	--�Ƿ��ǿ��
	if nExchangeComing ~= 0 then
		--print("nExchangeComing")
		return 0 
	end
	--�жϴ���
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
	end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) >= VET_201111_MaxUsedCount then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.TriggerIndex,0)
		return 0
	end
	--�����ǳ�������
	local nIndex = CreateTrigger(3,VET_201111_TEACHER_DAY_TBID,VET_201111_TEACHER_DAY_UFID)
	if nIndex == 0 then
		WriteLog("[Event]201111 event l� nh� gi�o, t�o m�y kh�i ��ng th�t b�i")
		return 0
	end
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.TriggerIndex,nIndex)
	--����ʱ�䴥����
	nIndex = CreateTrigger(1, VET_201111_TEACHER_DAY_TBID1, VET_201111_TEACHER_DAY_UFID1) 
	if nIndex == 0 then
		WriteLog("[Event]201111 event l� nh� gi�o, t�o m�y kh�i ��ng th�t b�i")
		return 0
	end
    ContinueTimer(GetTrigger(VET_201111_TEACHER_DAY_UFID1)) 
	--��¼ʱ��¼ʱ��
	local nTime = GetTime()
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)		
	end
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
end