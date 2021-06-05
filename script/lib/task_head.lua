
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ϵͳͷ�ļ�
-- Edited by peres
-- 2005/05/07 PM 19:55

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================


-- ����������񴥷�����Ϣö��
TaskCondition = {

	TaskStart = "B�t ��u nhi�m v�",
	
	TaskEnd = "K�t th�c nhi�m v�",
	
	LevelMore = "��ng c�p l�n",
	
	LevelLess = "��ng c�p nh�",
	
	LevelEqual = "��ng c�p = ",
	
	ValueMore = "Bi�n l��ng l�n",
	
	ValueLess = "Bi�n l��ng nh�",
	
	ValueEqual = "Bi�n l��ng b�ng",
	
	ReputeMore = "Danh v�ng l�n",
	
	HaveItem = "��c ph�m",
	
}

-- ����������񷽷���ö��
TaskEntity = {

	FindGoods = "T�m v�t ph�m",
	
	KillNpc = "��nh b�i ai ��",
	
	PayMoney = "l��ng ti�n ti�u hao",
	
	ChangeValue = "Thay ��i bi�n l��ng",

}

-- ������ֽ������͵�ö��
TaskAward = {

	AwardGoods = "V�t ph�m",
	
	AwardMoney = "Ng�n l��ng",
	
	AwardExp = "Kinh nghi�m",
	
	AwardRepute = "Danh v�ng",
	
	AwardStartTask = "B�t ��u nhi�m v�",

}

-- ���������׼����������
TaskDialogText = {

	TaskConfirm = "Ti�p nh�n nhi�m v�",
	
	TaskCancel = "H�y b� nhi�m v�",
	
}


-- ���ڹ������������ֵ��������
TaskEngine_Index = {

	-- �������ݣ��¼��б���������������ʵ�壬�����б�����Ի�������
	EventIndex = nil,
	ConditionIndex = nil,
	EntityIndex = nil,
	AwardIndex = nil,
	TalkIndex = nil,

	-- ���캯�������봥����ʵ���뽱���ı�񣬹�������
	__new = function(self, arg)
		self.EventIndex = self:AssignEventIndex(arg[1]);
		self.ConditionIndex = self:AssignConditionIndex(arg[2]);
		self.EntityIndex = self:AssignEntityIndex(arg[3]);
		self.AwardIndex = self:AssignAwardIndex(arg[4]);
		self.TalkIndex = self:AssignTalkIndex(arg[5])
	end,

	-- �������񴥷�����������
	-- �����ʽΪ��{�������ƣ�����ID���������������¼�ID}
	AssignConditionIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- ��ȡ����������
		local nEvent = 0;
		local i,j = 0,0;
		
		local nConditionData = {}; -- ��󷵻صĴ�����������

			for i=2, nRow do
				j = j + 1;
				
				-- ��Щ�������û���¼�����
				nEvent = tabFile:getCell(i,"EventID");
				if nEvent~="" then
					nEvent = tonumber(nEvent);
				else
					nEvent = 0;
				end;
				
				tinsert(nConditionData, 
						getn(nConditionData) + 1, 
							{	
								tabFile:getCell(i,"TaskName"), 
								tonumber(tabFile:getCell(i,"TaskID")), 
								i,
								nEvent
							}
						);
			end;
			
			return nConditionData;
	end,
	
	-- ��������ʵ�����ݵ�����
	-- �����ʽΪ��{�������ƣ�����}
	AssignEntityIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- ��ȡ����������
		local i,j = 0,0;
		
		local nEntityData = {}; -- ��󷵻ص�ʵ����������
		
			for i=2, nRow do
				j = j + 1;
				tinsert(nEntityData, 
						getn(nEntityData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nEntityData;
	end,
	
	-- �������������ݵ�����
	-- �����ʽΪ��{�������ƣ�����}
	AssignAwardIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- ��ȡ����������
		local i,j = 0,0;
		
		local nAwardData = {}; -- ��󷵻صĽ�����������
		
			for i=2, nRow do
				tinsert(nAwardData, 
						getn(nAwardData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nAwardData;	
	end,
	
	-- �����¼�˵������
	-- �����ʽΪ��{�¼�ID���¼�˵�����Ƿ���Թ�������}
	AssignEventIndex = function(self, tabFile)
	
		local nRow = tonumber(tabFile:getRow()); -- ��ȡ����������
		local i,j = 0,0;
		
		local nEventData = {}; -- ��󷵻صĽ�����������
		
			for i=2, nRow do
				tinsert(nEventData, 
						getn(nEventData) + 1, 
						{tonumber(tabFile:getCell(i,"EventID")),
						 tabFile:getCell(i,"EventText"),
						 tonumber(tabFile:getCell(i,"CanShare")),
						 i}
						);				
			end;
			
			return nEventData;
	end,
	
	-- ��������Ի����ݵ�����
	-- �����ʽΪ��{�������ƣ�����}
	AssignTalkIndex = function(self, tabFile)

		local nRow = tonumber(tabFile:getRow()); -- ��ȡ����������
		local i,j = 0,0;
		
		local nTalkData = {}; -- ��󷵻صĽ�����������
		
			for i=2, nRow do
				tinsert(nTalkData, 
						getn(nTalkData) + 1, 
						{tabFile:getCell(i,"TaskName"), i}
						);				
			end;
			
			return nTalkData;	
	end,

}