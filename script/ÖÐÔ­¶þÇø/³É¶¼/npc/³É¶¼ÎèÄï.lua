
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
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	--�
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		Say("Mu�n th��ng th�c �i�u m�a c�a ta xin ��i ��n t�i h�y quay l�i!", getn(WN_201403_DIALOG), WN_201403_DIALOG);
		return
	end	
	
	---------------

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID); 
	
	if (nState==9) then
		task_009();
		return
	end
	
	--�Ѿ���ȡ��֣��֮��ծ������
	if nTask_DL_State_60_1 == 1 then
		task_014_11();
		return			
	end;
	
	--δɱ���������
	if nTask_DL_State_60_1 == 2 then
		task_014_21();
		return			
	end;
		
	--�Ѿ�ɱ���������
	if nTask_DL_State_60_1 == 3 then
		task_014_31();
		return			
	end;
	
	--�����֣��֮����ɶ����ﲿ��
	if nTask_DL_State_60_1 == 4 then
		task_014_41();
		return			
	end;
	
	Talk(1,"","Mu�n th��ng th�c �i�u m�a c�a ta xin ��i ��n t�i h�y quay l�i!");
	
end;