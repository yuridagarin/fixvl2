-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC�����峤Script
-- By StarryNight
-- 2006/01/06 PM 17:29

--������ ������ ������ 
--��: ���� ���� ��ţ�� ������ȡ 
--��: ��լ ���� ���� ��Ȣ ���� �촬 
--��������: ���� ���� ����  
--�����˼�: �½� Сʱ ���� ���� �ػ�  
--����: ������  ��ִλ  
--����ټ�: �첻������������ �Ӳ��ʲ����ǻ��� 

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")
Include("\\script\\task\\world\\����\\lv40\\task_main.lua");

function main()
local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
--print("nTask_DL_State_40:"..nTask_DL_State_40);
--print("nTask_DL_State_50:"..nTask_DL_State_50);
	--δ���峤�Ի�
	if nTask_DL_State_40 == 2 then
		task_000_00();
		return
	end
	--δ��������ʿ
	if nTask_DL_State_40 == 3 then
		task_001_00();
		return
	end
	--�Ѿ���������ʿ
	if nTask_DL_State_40 == 4 then
		task_002_00();
		return
	end
	--��δ��������㱨
	if nTask_DL_State_40 == 5 then
		task_003_00();
		return
	end
	
	--�Ѿ��ͳ�����Ի�
	if nTask_DL_State_50 == 3 then
		task_004_00();
		return
	end
	
	--δ����������������峤�Ի�
	if nTask_DL_State_50 == 4 then
		task_005_00();
		return
	end
	
	--����������
	if nTask_DL_State_50 == 5 then
		task_006_00();
		return
	end
	
	--δ��֣��֮�Ի�
	if nTask_DL_State_50 == 6 then
		task_007_00();
		return
	end

	--һ������¶Ի�
	local strTalk = {
		"T�c tr��ng Mi�u L�nh: <sex> mu�n th� Si H�a Ch�n Th�n kh�ng?"
	}
	
	TalkEx("",strTalk);
	return
end