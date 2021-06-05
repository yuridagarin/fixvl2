--�Ѱ����Ϣ���嵽���������
Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\globalfunctions.lua")

--TASKID_TONG_INFO_TRANSLATION---------
TIT_ISTEMPTONG = 1			--�Ƿ�����ʱ���
TIT_ISHAVETONG = 2			--�Ƿ����а��
TIT_ISTONGMASTER = 3		--�Ƿ��ǰ���
TIT_ISTONGDEPUTY = 4		--�Ƿ��Ǹ�����
TIT_ISTONGELDER = 5			--�Ƿ��ǳ���
TIT_ISTONGMEMBER = 6		--�Ƿ�����ͨ����
TIT_ISTONGMANAGER = 7		--�Ƿ��ǰ�����

--���°����Ϣ�����������
function _UpdateTongInfoToTask()
	local nVersion,nCurGs = GetRealmType()
	if not nCurGs or nCurGs ~= 0 then
		return 0;
	end
	--����15s�����߲Ÿ��£���Ȼ�п��ܰ����Ϣ��û��
	if GetLoginTime() < 15 then
		return 0;
	end
	gf_SetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTEMPTONG, 
		((GetTongLevel() <= 0) and 1) or 0, TASK_ACCESS_CODE_TONG_INFO_TRANS);
	gf_SetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISHAVETONG, 
		((IsTongMember() <= 0) and 0) or 1, TASK_ACCESS_CODE_TONG_INFO_TRANS);
	gf_SetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGMASTER, 
		((GetTongDuty() == 1) and 1) or 0, TASK_ACCESS_CODE_TONG_INFO_TRANS);
	gf_SetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGDEPUTY, 
		((GetTongDuty() == 2) and 1) or 0, TASK_ACCESS_CODE_TONG_INFO_TRANS);
	gf_SetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGELDER, 
		((GetTongDuty() == 3) and 1) or 0, TASK_ACCESS_CODE_TONG_INFO_TRANS);
	gf_SetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGMEMBER, 
		((GetTongDuty() == 4 or GetTongDuty() == 5 or GetTongDuty() == 6) and 1) or 0, TASK_ACCESS_CODE_TONG_INFO_TRANS);
	gf_SetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGMANAGER, 
		((GetTongDuty() > 0 and GetTongDuty() < 4) and 1) or 0, TASK_ACCESS_CODE_TONG_INFO_TRANS);
			
	SetTask(TASKID_TONG_INFO_PLAYER_JOINTIME, GetJoinTongTime(), TASK_ACCESS_CODE_TONG_INFO_TRANS)
end

--------------------------------
function tit_IsTempTong()
	return gf_GetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTEMPTONG);
end

function tit_IsHaveTong()
	return gf_GetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISHAVETONG);
end

function tit_IsTongMaster()
	return gf_GetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGMASTER);
end

function tit_IsTongDeputy()
	return gf_GetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGDEPUTY);
end

function tit_IsTongElder()
	return gf_GetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGELDER);
end

function tit_IsTongMember()
	return gf_GetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGMEMBER);
end

function tit_IsTongManager()
	return gf_GetTaskBit(TASKID_TONG_INFO_TRANSLATION, TIT_ISTONGMANAGER);
end

function tit_GetJoinTongTime()
	return GetTask(TASKID_TONG_INFO_PLAYER_JOINTIME);
end