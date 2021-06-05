
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �����������ͷ�ļ�
-- Edited by peres
-- 2005/03/30 PM 14:06

-- ������  Ϩ����
-- ��ʧ��  ��ס��
-- ��վ��  ��������
-- ����    ������ѿ
-- �ȴ�    꼻��ٿ�
-- �ѷҷ�  �����껪
-- �˰�    û�е���
-- ����Ȼ  ������
-- ���    ˢ����ͷ��
-- ������  �һ��
-- ����    �Ҷ��Լ�˵
-- �Ҳ�����
-- �Һܰ���

-- lyrics : �˰���

-- ======================================================

-- һ��������ɽ� 30 ������
TASK_NUM_MAX = 30;

-- ���ڴ�������״̬�ı�������
-- ���ܴ洢�������� = �������� * 16
TASK_STATE_MAX = 500;

-- ������������ʼ�ı���λ��
-- �������� = TASK_INDEX_START + TASK_NUM_MAX 
TASK_INDEX_START = 2001;

-- ���ڴ�����״̬�ı�����ʼֵ
TASK_STATE_START = 2051;

CTaskValue = {
	
	-- ����һ��������������������֮�ڣ����������ı��
	AssignTask = function(self, nTask)
		
		self:SetTaskState(nTask, 1);
		
		-- ���ȼ�����������������û�пյ�
		for i = TASK_INDEX_START, TASK_NUM_MAX do
			if GetTask(i)==0 then
				SetTask(i, nTask);  -- �������� i �������ʶ
				return i
			end;
		end;
		
		-- ��û�ҵ��Ļ��ͷ��� 0��������������
		return 0;
		
	end,
	
	-- ����һ������Ϊ���״̬�����������ǰ�Ŀռ������и�����Ļ���ȫ�����
	CompleteTask = function(self, nTask)
		local i=0;

		for i = TASK_INDEX_START, TASK_NUM_MAX do
			if GetTask(i)==nTask then
				SetTask(i, 0);
			end;
		end;
		self:SetTaskState(nTask, 2);
	end,
	
	-- ����һ������Ϊ��δ��ʼ��״̬�����������ǰ�Ŀռ������и�����Ļ���ȫ�����
	ClearTask = function(self, nTask)
		local i=0;

		for i = TASK_INDEX_START, TASK_NUM_MAX do
			if GetTask(i)==nTask then
				SetTask(i, 0);
			end;
		end;
		self:SetTaskState(nTask, 0);
	end,
	
	-- ȷ�����������״̬�������ж�Ӧ����������;���ĵ�һλ��
	GetTaskStateIndex = function(self, nTask)
	
		-- ���������������¼�����򷵻�ʧ��
		if nTask > TASK_STATE_MAX*16 + TASK_STATE_START then
			return nil, nil;
		end;
		
		if nTask>= TASK_STATE_START then
			nTask = nTask - TASK_STATE_START + 1;
		end;
	
			if (nTask<16) then
				return TASK_STATE_START, nTask * 2 - 1;
			else
				if mod(nTask, 16)==0 then
					return TASK_STATE_START + nTask/16 - 1, 31;
				else
					return TASK_STATE_START + floor(nTask/16), mod(nTask, 16) * 2 - 1;
				end;
			end;

	end,
	
	-- ��ȡһ����������״̬������־λ
	GetTaskState = function(self, nTask)
	
		local nTaskID, nTaskBit = self:GetTaskStateIndex(nTask);
		
		local nBit_1 = GetBit(GetTask(nTaskID), nTaskBit);
		local nBit_2 = GetBit(GetTask(nTaskID), nTaskBit + 1);
		
		if nBit_1==0 and nBit_2==0 then return 0 end; -- ��δ��ʼ������ 0
		
		if nBit_1==0 and nBit_2==1 then return 1 end; -- �Ѿ���ʼ������ 1
		
		if nBit_1==1 and nBit_2==1 then return 2 end; -- �Ѿ���ʼ������ 2
		
	end,
	
	-- ����һ�������״̬
	-- 0����δ��ʼ
	-- 1���Ѿ���ʼ
	-- 2���Ѿ����
	SetTaskState = function(self, nTask, nState)
	
		local nTaskID, nTaskBit = self:GetTaskStateIndex(nTask);
		
		local nBit_1, nBit_2 = 0, 0;
		
		if nState==0 then
			nBit_1 = 0;
			nBit_2 = 0;
		end;
		
		if nState==1 then
			nBit_1 = 0;
			nBit_2 = 1;
		end;

		if nState==2 then
			nBit_1 = 1;
			nBit_2 = 1;
		end;
		
		SetTask(nTaskID, SetBit(GetTask(nTaskID), nTaskBit, nBit_1));
		SetTask(nTaskID, SetBit(GetTask(nTaskID), nTaskBit + 1, nBit_2));
		
	end,

}