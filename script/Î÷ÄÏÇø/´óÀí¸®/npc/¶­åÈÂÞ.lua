-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC������Script
-- By StarryNight
-- 2006/01/04 PM 16:26

--������ ������ ������ 
--��: ���� �ܻ� ���� ���� ���� ��Ȣ �ɲ� ��ж ���� ���� ���� ���� ���� ���� ��լ ���� ���� ��׽ ��� ��ľ ���˿� ��ˮ 
--��: ���� ���� �޷� ���� 
--��������: �帻 ����  
--�����˼�: ��ɷ С�� ���� ���� Ԫ��  
--ÿ��̥��ռ��: ռ�������ڱ� 
--����: ����ˮ ִִλ 
--��: ����(����)ɷ�� 
--����ټ�: �ﲻ����������ǿ �Ѳ�Զ�в������ 

-- ======================================================

-- ���þ��������ļ�
Include("\\script\\task\\world\\����\\task_head.lua");
Include("\\script\\task\\world\\����\\lv58\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_58 = GetTask(TASK_DL_LV55_ID);
local nTask_DL_State_60 = GetTask(TASK_DL_LV60_ID);
local nTask_DL_State_70	= GetTask(TASK_DL_LV70_ID);
local nTask_DL_State_80	= GetTask(TASK_DL_LV80_ID);

	--��ȡ������������
	if nTask_DL_State_58 == 5 then
		task_000_00();
		return
	end
	--δ����̫���Ի�
	if nTask_DL_State_58 == 6 then
		task_001_00();
		return
	end
	
	--�����ӵ���Ŀ�ĵ�
	if nTask_DL_State_58 == 7 then
		task_002_00();
		return
	end
	
	--��ɴ������������
	if nTask_DL_State_58 == 8 then
		task_003_00();
		return
	end
	
	--��ȡ��ɱ20�����
	if nTask_DL_State_60 == 1 then
		task_009_00();
		return
	end
	
	--�Ѿ�ɱ20����
	if nTask_DL_State_60 == 2 then
		task_010_00();
		return
	end
	
	--δɱ����ɮ��Ի�
	if nTask_DL_State_60 == 3 then
		task_011_00();
		return
	end
	
	--�Ѿ�ɱ����ɮ��
	if nTask_DL_State_60 == 4 then
		task_112_00();
		return
	end
	
	--��ȡ��ˮ������
	if nTask_DL_State_60 == 5 then
		task_013_00();
		return
	end
	
	--�Ѿ���ȡ�˰�ˮ������
	if nTask_DL_State_60 == 6 then
		task_014_00();
		return
	end
	
	--�Ѿ�ɱ��ҹ��
	if nTask_DL_State_60 == 7 then
		task_015_00();
		return
	end
	
	--�Ѿ���ɰ�ˮ������
	if nTask_DL_State_60 == 8 then
		task_016_00();
		return
	end
	
	--�Ѿ������̵���ս������
	if nTask_DL_State_70 == 4 then
		task_017_00();
		return
	end
	
	--δ�򵹶γж�֮ǰ�Ի�
	if nTask_DL_State_80 >= 1 and nTask_DL_State_80 <= 2 then
		task_018_00();
		return
	end
	
	--������ӶԻ����붭���޶Ի�
	if nTask_DL_State_80 == 3 then
		task_019_00();
		return
	end
	
	--δ��Ǭ����ǰ�붭���޶Ի�
	if nTask_DL_State_80 == 4 and GetTask(TASK_DL_LV80_TIME_ID) == 1 then
		task_020_00();
		return
	end
	
	--�ȴ�20���Ӻ��붭���޶Ի�
	if nTask_DL_State_80 == 4 then
		task_019_01();
		return
	end
	
	--��Ǭ���ź��붭���޶Ի�
	if nTask_DL_State_80 == 5 then
		task_021_00();
		return
	end
	
	--δ�򵹽�����ǰ�붭���޶Ի�
	if nTask_DL_State_80 == 6 then
		task_022_00();
		return
	end
	
	--�򵹽����޺��붭���޶Ի�
	if nTask_DL_State_80 == 7 then
		task_023_00();
		return
	end
		
	--δ��������ǰ�붭���޶Ի��������ٻ���������Ʒ��
	if nTask_DL_State_80 == 8 then
		task_024_00();
		return
	end
	
	--�������Ӻ��붭���޶Ի�
	if nTask_DL_State_80 == 9 then
		task_025_00();
		return
	end
	
	--���������������Ի�
	if nTask_DL_State_80 >= 10 then
		local strTalk = {
			"�a t� <sex> �� l�m nhi�u vi�c cho ��i L�!",
			}
		TalkEx("",strTalk);
		return
	end
	
	--һ��״̬�¶Ի�
	local strTalk = {
		"Xin <sex> h�y ngh� ng�i m�t th�i gian!",
	}
	
	TalkEx("",strTalk);
	return
end
