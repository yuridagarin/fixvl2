
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �ɶ�����ű�
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID); 
	--print("nTask_DL_State_60_2:"..nTask_DL_State_60_2);
	
	if (nState==9) then
		task_009();
		return
	end
	
	--δ��ȡ�ռ�Ѫѻ������
	if nTask_DL_State_60_2 == 1 then
		task_014_12();
		return
	end
	
	--�Ѿ���ȡ�ռ�Ѫѻ������
	if nTask_DL_State_60_2 == 2 then
		task_014_22();
		return
	end
	
	--�Ѿ�����꾩��������
	if nTask_DL_State_60_2 == 3 then
		task_014_32();
		return
	end	
	
	Talk(1,"","Nh�n b�ng h�u, bi�t ngay l� ng��i s�ng c� ngh�a c� t�nh!");
	
end;