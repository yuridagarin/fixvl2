-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����NPC����Script
-- By StarryNight
-- 2006/01/13 PM 10:09

--ʮһ��إ�� ������������  
--�ˣ�  ���¡����̡��޲֡����졢����������������������  
--�ɣ�  ������Ȣ  

-- ����С͵���ݣ�����������ʧ������ѹ�������

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv75\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);
--print("nTask_DL_State_75:"..nTask_DL_State_75)

	--δ����75������֮ǰ
	if nTask_DL_State_75 < 4 then
		local strTalk = {
			"Sao phi�n ph�c th�! Chi b�ng quay v� giao ph� cho Tri�u ��i nh�n xem!",
			}
		TalkEx("",strTalk);
		return
	end

	--δ������Ի�
	if nTask_DL_State_75 == 4 then
		task_000_00()
		return
	end
	
	--δ/���ռ���10�Ŵ����־
	if nTask_DL_State_75 == 5 then
		task_001_00()
		return
	end
	
	--δ��֣��֮�Ի�
	if nTask_DL_State_75 == 6 then
		task_002_00()
		return
	end
	
	--��ɺ����������
	if nTask_DL_State_75 > 6 then
		local strTalk = {
			"L�y ���c ��i L� c�u ch� v�, Tri�u ��i nh�n nh�t ��nh s� r�t vui!",
			}
		TalkEx("",strTalk);
		RemoveTrigger(GetTrigger(KILL_DL_JOCKO));
		return
	end
end
