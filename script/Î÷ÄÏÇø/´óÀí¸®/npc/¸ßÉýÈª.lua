-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC����ȪScript
-- By StarryNight
-- 2005/12/30 PM 15:26

--������ ������ ������ 
--��: ���� ���� ��ţ�� ������ȡ 
--��: ��լ ���� ���� ��Ȣ ���� �촬 
--��������: ���� ���� ����  
--�����˼�: �½� Сʱ ���� ���� �ػ�  
--����: ������  ��ִλ  
--����ټ�: �첻������������ �Ӳ��ʲ����ǻ��� 

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nLevel = GetLevel();
local nTask_DL_State_10 = GetTask(TASK_DL_LV10_ID);
local nTask_DL_State_20 = GetTask(TASK_DL_LV20_ID);
local nTask_DL_State_30 = GetTask(TASK_DL_LV30_ID);
local nTask_DL_State_35 = GetTask(TASK_DL_LV35_ID);
local nTask_DL_State_35_01 = GetTask(TASK_DL_LV35_01_ID);
local nTask_DL_State_35_zx = GetTask(TASK_DL_LV35_ID_ZX);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
local nTask_DL_State_55 = GetTask(TASK_DL_LV55_ID);
local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID);
local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID);
local nTask_DL_State_70 = GetTask(TASK_DL_LV70_ID);
	
	--��ȡ�����������
	if nLevel >= 20 and nTask_DL_State_10 >= 4 and nTask_DL_State_20 == 0 then
		task_000_00();
		return
	end
	
	if nTask_DL_State_20 == 1 then
		local strTalk = {
			"<sex> c� c�ng �i ti�u di�t 20 con r�t ��c tr� h�i cho l� kh�ch!"
		}
		TalkEx("task_001_00",strTalk);
		return
	end;
	
	if nTask_DL_State_20 == 2 then
		task_002_00();
		return
	end;
	
	if nTask_DL_State_20 == 3 then
		task_003_00();
		return
	end;
		
	if nTask_DL_State_20 == 4 then
		task_004_00();
		return
	end;
	
	if nTask_DL_State_20 == 5 then
		task_005_00();
		return
	end;
	
	if nTask_DL_State_30 >= 1 and nTask_DL_State_30 <= 4 then
		task_006_00();
		return
	end;
	
	if nTask_DL_State_30 == 5 then
		task_007_00();
		return
	end;
	
	if nTask_DL_State_30 == 6 then
		task_008_00();
		return
	end;
	
	--����ȡ����ɽ����,δ���
	if nTask_DL_State_35 == 1 or nTask_DL_State_35_zx == 1 then
		if nTask_DL_State_35_01 == 1 or nTask_DL_State_35_01 == 10 then
			task_010_00();
			return
		end;
		if nTask_DL_State_35_01 == 2 then
			task_010_10();
			return
		end;
		return
	end;
	
	--����ɴ����ͽ����
	if nTask_DL_State_35 == 2 then
		task_011_00();
		return
	end
	
	--�ѽ�������ɽ����
	if nTask_DL_State_35 == 3 then
		task_012_00();
		return
	end
	
	--δ����55�����������
	if nTask_DL_State_50 == 7 then
		task_013_00();
		return
	end
	
	--�Ѿ�����55�����������
	if nTask_DL_State_55 == 1 then
		task_014_00();
		return
	end
	
	--δȥ��Ī���Ի���δ�򵹷��
	if nTask_DL_State_55 >= 2 and nTask_DL_State_55 <= 3 then
		task_015_00();
		return
	end
	
	--�򵹷�˺�
	if nTask_DL_State_55 == 4 then
		task_016_00();
		return
	end
	
		--��ɷ�������
	if nTask_DL_State_55 == 5 then
		task_017_00();
		return
	end
	
	--���֣��֮�Ļ����������ȡ70��������̵���ս��
	if nTask_DL_State_60_1 == 6 and nTask_DL_State_60_2 == 5 and nTask_DL_State_70 == 0 then
		task_018_00()
		return
	end
	
	--δ��ܰ�����֮ǰ/��ܰ�����δ���ż��Ķ�
	if nTask_DL_State_70 >= 1 and nTask_DL_State_70 <= 2 then
		task_019_00()
		return
	end
	
	--��ܰ��������Ѿ����ż��Ķ�
	if nTask_DL_State_70 == 3 then
		task_020_00()
		return
	end
	
	--�����̵���ս�������
	if nTask_DL_State_70 >= 4 then
		local strTalk = {
			"Th�n l� Qu�c c�ng ��i L� ph�i ch�u tr�ng tr�ch n�ng n�....."
			}	
		TalkEx("",strTalk);
		return
	end
	
	local strTalk = {
		"Th�n l� Qu�c c�ng ��i L� ph�i ch�u tr�ng tr�ch n�ng n�....."
	}	
	TalkEx("",strTalk);
	return
end
