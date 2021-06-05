
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ����ϵͳʵ�崦���ļ�
-- Edited by peres
-- 2005/05/07 PM 19:55

-- �̻�����һҹ���̻���
-- ���ǵ����ڴ������Ⱥ�У�վ�����ı���ӵ��ס����
-- ����ů��Ƥ��������Ϥ��ζ�����̻����������۾���
-- һ���޿���ء���

-- ======================================================

-- ������������ͷ�ļ�
Include("\\script\\lib\\task_head.lua");

-- ��������������������ļ�
Include("\\script\\lib\\task_value.lua");

-- ������������ DEBUG ֧���ļ�
Include("\\script\\lib\\task_debug.lua");

-- ����ļ����֧��
Include("\\script\\class\\ktabfile.lua");

-- �ַ��������ܿ�
Include("\\script\\lib\\string.lua");

-- �����¼���������ļ�
taskEventFile = new(KTabFile, "\\settings\\task\\task_event.txt");

-- �������񴥷���������ļ�
taskConditionFile = new(KTabFile, "\\settings\\task\\task_condition.txt");

-- ��������ʵ�������������ļ�
taskEntityFile = new(KTabFile, "\\settings\\task\\task_entity.txt");

-- ���뽱������ļ�
taskAwardFile = new(KTabFile, "\\settings\\task\\task_award.txt");

-- ����Ի�����ļ�
taskTalkFile = new(KTabFile, "\\settings\\task\\task_talk.txt");

-- ����������������
taskIndex = new(TaskEngine_Index,
				taskEventFile, 
				taskConditionFile, 
				taskEntityFile, 
				taskAwardFile, 
				taskTalkFile
				);

-- ��������ʵ�崦����
CTask = {

--  /////////////////////////////////////////////
-- //			�������̴�����ز���		  //
--/////////////////////////////////////////////

	-- ��ʼһ���������ⲿ���ú���
	StartTask = function(self, taskName)
	
		local strTaskText = "";		
		local nRow = 0;	
		local nCheck;
		
		-- �������û��ʼ�������Ƿ���Կ�ʼ��
		if self:GetTaskState(taskName)==0 then
		
			nCheck = self:CheckCanStart(taskName);
			if nCheck==1 then
			
				CDebug:MessageOut(taskName.." Nhi�m v� ch�nh th�c b�t ��u");
				
				self:SetTaskStateStart(taskName);
				
				-- ����������ʾ��Ϣ
				nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
				strTaskText = taskConditionFile:getCell(nRow, "TaskText");
				
				if strTaskText~="" and strTaskText~=nil then
					TaskTip(self:SetTaskSayColor(strTaskText));
				end;
				
				return 1;
			else
				return nil;
			end;
			
		end;
		
	end,
	
	-- �ֶ�����һ�������ⲿ���ú���
	-- �����������Ʒ�Ļ���ɾ��
	-- �����������ʱ״̬Ҳ���������
	FinishTask = function(self, taskName)
		
		CDebug:MessageOut("K�t th�c nhi�m v� :"..taskName);
		
		-- ɾ��������Ʒ����
	
		-- ���ڴ�����������ص�ʵ�����ݵ�����
		local aryTaskEntity = {};
		-- ����ʵ�������
		local strTaskEntity = "";
		local aryGoods = {0,0,0,0};
		
		local i=0;
		
		-- �����������������ص�����ȡ����
		for i=1, getn(taskIndex.EntityIndex) do
			if taskIndex.EntityIndex[i][1]==taskName then
				tinsert(aryTaskEntity,
						getn(aryTaskEntity) + 1,
						taskIndex.EntityIndex[i][2]);
			end;
		end;	
		-- ��ʼѭ������������Ʒ����������
		for i=1, getn(aryTaskEntity) do
			strTaskEntity = taskEntityFile:getCell(aryTaskEntity[i],"TaskType");
			-- ������ռ���Ʒ������
			if strTaskEntity==TaskEntity.FindGoods then
				aryGoods[1] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Genre"));
				aryGoods[2] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Detail"));
				aryGoods[3] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Particular"));
				aryGoods[4] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"GoodsNum"));
				-- �����������Ʒ��Ҫɾ���Ļ�����ɾ��
				if tonumber(taskEntityFile:getCell(aryTaskEntity[i],"DelGoods"))==1 then
					CDebug:MessageOut(taskName.." �� x�a 1 v�t ph�m trong nhi�m v�");
					DelItem(aryGoods[1],aryGoods[2],aryGoods[3],aryGoods[4]);
				end;
			end;
			
		end;
		-- ѭ������������������Ϊ����
		self:SetTaskStateEnd(taskName);
		
	end,
	
	
	-- �ж�һ�������Ƿ���ɣ��ⲿ���ú���������ɹ��򷵻� 1�����򷵻� 0
	CheckTask = function(self, taskName)
	
		CDebug:MessageOut("B�t ��u ph�n �o�n c� ho�n th�nh nhi�m v� hay kh�ng:"..taskName);
		
		-- ���ڴ�����������ص�ʵ�����ݵ�����
		local aryTaskEntity = {};
		
		local nCheck = 0; -- ͳ��������������������ʱ����
		
		local strTaskEntity = "";
		local aryGoods = {0,0,0,0};
		local nMoney = 0;
		
		local i=0;
		
		-- ������������ڽ�����ʱ��ֱ�ӷ��ط�
		if self:GetTaskState(taskName)~=1 then
			CDebug:MessageOut(taskName.." Nhi�m v� ch�a th�c hi�n");
			return 0;
		end;		
		
		-- �����������������ص�����ȡ����
		for i=1, getn(taskIndex.EntityIndex) do
			if taskIndex.EntityIndex[i][1]==taskName then
				tinsert(aryTaskEntity,
						getn(aryTaskEntity) + 1,
						taskIndex.EntityIndex[i][2]);
			end;
		end;
		
		-- ���һ������Ҳû���򷵻ؿ������
		if getn(aryTaskEntity)==0 then
			CDebug:MessageOut(taskName.." Nhi�m v� c� th� ho�n th�nh");
			return 1;
		end;
		
		-- ��ʼѭ���������������Ƿ��Ѿ����
		for i=1, getn(aryTaskEntity) do
			strTaskEntity = taskEntityFile:getCell(aryTaskEntity[i],"TaskType");
			
			-- ������ռ���Ʒ������
			if strTaskEntity==TaskEntity.FindGoods then
				aryGoods[1] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Genre"));
				aryGoods[2] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Detail"));
				aryGoods[3] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"Particular"));
				aryGoods[4] = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"GoodsNum"));
				
				if GetItemCount(aryGoods[1],aryGoods[2],aryGoods[3]) >= aryGoods[4] then
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- �����֧����Ǯ������
			if strTaskEntity==TaskEntity.PayMoney then
				nMoney = tonumber(taskEntityFile:getCell(aryTaskEntity[i],"PayMoney"));
				if Pay(nMoney)==1 then
					nCheck = nCheck + 1;
				end;
			end;
			
		end;
		
		if nCheck == getn(aryTaskEntity) then
			CDebug:MessageOut(taskName.." ��t ���c to�n b� "..nCheck.."  �i�u ki�n nhi�m v� to�n b� ��t ��n.");
			return 1;
		else
			return 0;
		end;
	
	end,
	
	
	-- ����ҷ��轱��
	PayAward = function(self, taskName)
		
		CDebug:MessageOut("B�t ��u ph�t t�ng cho ng��i ch�i "..taskName.." ph�n th��ng nhi�m v�");
		
		-- ���������飬��ʽΪ {�������ͣ�����}
		local aryTaskAward = {};
		local strAward = "";
		
		local aryGoods = {0,0,0,0};
		local nMoney = 0;
		local nExp = 0;
		local nRepute = 0;
		local strTask = "";
		
		local i=0;
		
		-- �����������صĽ���ȡ����
		for i=1, getn(taskIndex.AwardIndex) do
			--strAward = taskAwardFile:getCell();
			if taskIndex.AwardIndex[i][1]==taskName then
				tinsert(aryTaskAward,
						getn(aryTaskAward) + 1,
						{taskIndex.AwardIndex[i][1], taskIndex.AwardIndex[i][2]});			
			end;
		end;
				
		-- ��ʼѭ����������
		for i=1, getn(aryTaskAward) do
		
			strAward = taskAwardFile:getCell(aryTaskAward[i][2], "AwardType");
			
			-- �����������������Ʒ
			if strAward==TaskAward.AwardGoods then
				aryGoods[1] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Genre"));
				aryGoods[2] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Detail"));
				aryGoods[3] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"Particular"));
				aryGoods[4] = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"GoodsNum"));
				AddItem(aryGoods[1],aryGoods[2],aryGoods[3],aryGoods[4]);
				CDebug:MessageOut("Ph�t t�ng "..taskName.." Ph�n th��ng v�t ph�m");
			end;
			
			-- ��������������ǽ�Ǯ
			if strAward==TaskAward.AwardMoney then
				nMoney = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"MoneyNum"));
				Earn(nMoney);
				CDebug:MessageOut("Ph�t t�ng "..taskName.." Ph�n th��ng ng�n l��ng:"..nMoney);
			end;

			-- ��������������Ǿ���
			if strAward==TaskAward.AwardExp then
				nExp = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"ExpNum"));
				ModifyExp(nExp);
				CDebug:MessageOut("Ph�t t�ng "..taskName.." Ph�n th��ng kinh nghi�m:"..nExp);
			end;

			-- �������������������
			if strAward==TaskAward.AwardRepute then
				nRepute = tonumber(taskAwardFile:getCell(aryTaskAward[i][2],"ReputeNum"));
				ModifyReputation(nRepute, 0); -- ������������������
				CDebug:MessageOut("Ph�t t�ng "..taskName.." Ph�n th��ng danh v�ng:"..nRepute);
			end;
			
			-- ��������ǿ�ʼһ��������
			if strAward==TaskAward.AwardStartTask then
				strTask = taskAwardFile:getCell(aryTaskAward[i][2],"TaskString");
				
				if strTask~="" and strTask~=nil then
					self:StartTask(strTask);
					CDebug:MessageOut("Ph�t t�ng "..taskName.." Ph�n th��ng nhi�m v� m�i:"..strTask);
				end;
			end;

		end;
		
	end,
	
	
	-- ���һ�������Ƿ���Կ�ʼ����
	-- ���� 1 ��Ϊ�������������� 0 ��Ϊ��������
	CheckCanStart = function(self, taskName)

		CDebug:MessageOut("Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng:"..taskName);
	
		-- ��ȡ����������ڴ���������������
		local nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
		
		-- ����ʼ��������
		local taskCondition = {};
		
		-- ��������������ۼӣ��������� + 1
		local nCheck = 0;
		
		-- ���ڶ�ȡ�����ж����ݵ���ʱ����
		local nStartType = ""; -- ��ȡ����ö���ַ�
		local nTask = ""; -- ��Ҫ�жϵ������ʶ
		local nTaskID = 0; -- ��Ҫ�жϵ����� ID
		local nTaskState = 0; -- ��Ҫ�жϵ�����״̬
		local nLevel = 0; -- ��Ҫ�жϵ�����ȼ�
		local nValue = 0; -- ��Ҫ�жϵ��������
		local nRepute = 0; -- ��Ҫ�ж������ı���
		local strGoods = ""; -- ��Ҫ�ж��Ƿ������Ʒ���ַ���
		local nGoodsID = nil; -- ��Ҫ�ж��Ƿ������Ʒ������
		
		local i=0;
		
		-- ��������Ѿ���ʼ�����Ѿ�����ˣ�ֱ�ӷ��ط�
		if self:GetTaskState(taskName)~=0 then
			return 0;
		end;
		
		for i=1,5 do
		
			nStartType = taskConditionFile:getCell(nRow, "StartType"..i);
			
			-- ������Ĵ����������� taskCondition ����
			if nStartType~="n" and nStartType~=nil and nStartType~="" then
				tinsert(taskCondition,
						getn(taskCondition) + 1,
						nStartType);
			end;
			
		end;
		
		for i=1, getn(taskCondition) do
		
			-- �����Ƿ��Ѿ���ʼ�������ж�
			if taskCondition[i] == TaskCondition.TaskStart then
				nTask = taskConditionFile:getCell(nRow, "StartDes"..i);
				nTaskID = tonumber(self:GetTaskID(nTask));
				nTaskState = CTaskValue:GetTaskState(nTaskID);
				
				if nTaskState==1 then
					CDebug:MessageOut(taskName.." Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng: C�ng b�t ��u th�ng qua");					
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- �����Ƿ����Ѿ��������������ж�
			if taskCondition[i] == TaskCondition.TaskEnd then
				nTask = taskConditionFile:getCell(nRow, "StartDes"..i);
				nTaskID = tonumber(self:GetTaskID(nTask));
				nTaskState = CTaskValue:GetTaskState(nTaskID);
				
				if nTaskState==2 then
					CDebug:MessageOut(taskName.." Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng: C�ng k�t th�c th�ng qua");	
					nCheck = nCheck + 1;
				end;
				
			end;
			
			-- �ȼ��Ƿ���ڵ������ж�
			if taskCondition[i] == TaskCondition.LevelMore then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()>=nLevel then
					CDebug:MessageOut(taskName.." Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng: ��ng c�p l�n th�ng qua");	
					nCheck = nCheck + 1;
				end;
			end;
			
			-- �ȼ��Ƿ�С�ڵ������ж�
			if taskCondition[i] == TaskCondition.LevelLess then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()<=nLevel then
					CDebug:MessageOut(taskName.." Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng: ��ng c�p nh� th�ng qua");	
					nCheck = nCheck + 1;
				end;
			end;

			-- �ȼ��Ƿ���ڵ������ж�
			if taskCondition[i] == TaskCondition.LevelEqual then
				nLevel = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetLevel()==nLevel then
					CDebug:MessageOut(taskName.." Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng: ��ng c�p b�ng th�ng qua");	
					nCheck = nCheck + 1;
				end;
			end;

			-- �����Ƿ���ڵ������ж�
			if taskCondition[i] == TaskCondition.ReputeMore then
				nRepute = tonumber(taskConditionFile:getCell(nRow, "StartDes"..i));
				if GetReputation()>=nRepute then
					CDebug:MessageOut(taskName.." Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng: Danh v�ng l�n th�ng qua");	
					nCheck = nCheck + 1;
				end;
			end;
			
			-- �Ƿ����ĳ����Ʒ�������ж�
			if taskCondition[i] == TaskCondition.HaveItem then
				strGoods = taskConditionFile:getCell(nRow, "StartDes"..i);
				nGoodsID = split(strGoods, "|");
				
				-- ���뱣֤��Ʒ�����4λ��ȷ�Բ�������һ���ж�
				if getn(nGoodsID)==4 then
					if GetItemCount( tonumber(nGoodsID[1]), tonumber(nGoodsID[2]), tonumber(nGoodsID[3]) ) >= tonumber(nGoodsID[4]) then
						CDebug:MessageOut(taskName.." Ph�n �o�n nhi�m v� c� th� b�t ��u hay kh�ng: Gi� v�t ph�m th�ng qua");							
						nCheck = nCheck + 1;
					end;
				end;
			end;
			
		end;
		
		if nCheck==getn(taskCondition) then
			CDebug:MessageOut(taskName.." ��t ���c to�n b� "..getn(taskCondition).."  �i�u ki�n nhi�m v� to�n b� ��t ��n ");	
			return 1;
		else
			return 0;
		end;
		
	end,
	
	-- ִ��һ����ʼ�������е�����
	DoTask = function(self, taskName)
		
		-- ��������Ѿ������ֱ�ӷ��ؿ�ֵ
		if self:IsTaskFinish(taskName) then return nil; end;
		
		-- �������û�п�ʼ����ʼ����
		if not self:IsTaskStart(taskName) then
			-- ���ж��Ƿ��ܿ�ʼ
			if self:CheckCanStart(taskName)==1 then
			
				-- �ж��Ƿ���Ҫѯ�ʲ��ܿ�ʼ����
				if self:GetTaskIsAsk(taskName)==1 then
					CDebug:MessageOut("D� h�i �� b�t ��u 1 nhi�m v� m�i:"..taskName);
					self:TaskAskSay(taskName);
				else
					-- ˵��ʼ����ʱ�����
					self:TaskSay(taskName, 0);
				end;
				return 1;
				
			end;
		end;
		
		-- �����ʼ�����ˣ�������м�״̬
		if self:IsTaskStart(taskName) then
			-- ���û�м�״̬�ĶԻ��򷵻ؿ�ֵ
			if self:GetTaskText(taskName, 1) then
				self:TaskSay(taskName, 1);
				return 1;
			else
				return nil;
			end;
			
		end;
		
		-- ������Ϲ��̶���ִ���򷵻ؿ�ֵ
		return nil;
		
	end,
	
	-- ����һ���������������
	EndTask = function(self, taskName)
	
		-- ��������Ѿ������ֱ�ӷ��ؿ�ֵ
		if self:IsTaskFinish(taskName) then return nil; end;
		
		-- �������û�п�ʼ����Ҳֱ�ӷ��ؿ�ֵ
		if not self:IsTaskStart(taskName) then
			return nil;
		end;
		
		-- ��������Ѿ���ʼ�ˣ����������Ƿ���ɣ�����򷢽�
		if self:IsTaskStart(taskName) then
			if self:CheckTask(taskName)==1 then
				-- ��������Ի���Ϊ����Ի�������ֱ�ӷ���
				if self:GetTaskText(taskName, 2)~="" then
					self:TaskSay(taskName, 2);
				else
					self:FinishTask(taskName);
					self:PayAward(taskName);
				end;
				return 1;
			end;
		else
			-- ������ֱ�ӷ��ؿ�ֵ
			return nil
		end;

		-- ������Ϲ��̶���ִ���򷵻ؿ�ֵ
		return nil;
				
	end,
	
	-- ����ʼ�ĶԻ��ص�����
	_FunStart = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:StartTask(taskName);
	end,
	
	-- ��������еĶԻ��ص�����
	_FunNow = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		return
	end,
	
	-- �������ʱ�ĶԻ��ص�����
	_FunEnd = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:FinishTask(taskName);
		self:PayAward(taskName);
	end,
	
	-- ����ѯ�����ȷ�Ͻ�������Ļص�����
	_FunAskStart = function(self, taskID)
		local taskName = self:GetTaskName(taskID);
		self:StartTask(taskName);
	end,
	
	-- ����ѯ�����ȡ������Ļص�����
	_FunAskCancel = function(self, taskID)
		return
	end,
	
	-- ִ������ĶԻ����������Ϊ�����״̬��
	-- 0Ϊ��δ��ʼ���񣬽�����ʱ�ĶԻ�
	-- 1Ϊ�Ѿ���������ĶԻ�
	-- 2Ϊ�������ʱ�ĶԻ�
	TaskSay = function(self, taskName, taskState)
		local strTalk = self:GetTaskText(taskName, taskState);
		
		local nTaskID = self:GetTaskID(taskName);
		
		local strFunBack = {
			[0]="#CTask:_FunStart("..nTaskID..")",
			[1]="#CTask:_FunNow("..nTaskID..")",
			[2]="#CTask:_FunEnd("..nTaskID..")",
		}
		
		-- ����ַ����ǿյ���ֱ�ӷ���
		if strTalk=="" or strTalk==nil then return ""; end;
		
		-- ��ʼ�Ի��������ú÷��غ���
		self:TaskTalk(strFunBack[taskState], strTalk);
		
	end,
	
	
	-- ��ȡһ������ָ���ĶԻ��Σ�ֱ�ӷ����ַ���
	GetTaskText = function(self, taskName, taskState)
		local strTask = ""
		local nRow = 0;
		local i=0;
		
		local strTitle = {
			[0]="TaskStartTalk",
			[1]="TaskNowTalk",
			[2]="TaskEndTalk",
		}
			for i=1, getn(taskIndex.TalkIndex) do
				if taskIndex.TalkIndex[i][1]==taskName then
					nRow = taskIndex.TalkIndex[i][2];
				end;
			end;

			if nRow~=0 then
				strTask = taskTalkFile:getCell(nRow, strTitle[taskState]);
				if strTask~="" then
					return strTask;
				else
					return nil;
				end;
			end;

	end,
	
	
	-- ��ȡһ���������ڴ���������������
	GetTaskRow = function(self, nIndex, strName)
		local i = 0;
		for i=1, getn(nIndex) do
			if nIndex[i][1]==strName then
				return nIndex[i][3];
			end;
		end;
		-- ʲôҲ�Ҳ������� 0
		return 0;
	end,
	
	
	-- ��ȡһ����������Ӧ�ı��� ID
	GetTaskID = function(self, strName)
		local i = 0;
		for i=1, getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][1]==strName then
				return taskIndex.ConditionIndex[i][2];
			end;
		end;
		-- ʲôҲ�Ҳ������� 0
		return 0;		
	end,
	
	
	-- ��֪һ������ID��ȡ���Ӧ������
	GetTaskName = function(self, taskID)
	
		local strName = "";
		local i=0;
		
		for i=1, getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][2]==taskID then
				return taskIndex.ConditionIndex[i][1];
			end;
		end;
		-- ʲôҲ�Ҳ������� 0
		return strName;
		
	end,
	
	-- ��ȡһ�������Ƿ���Ҫѯ�ʲ��ܿ�ʼ
	GetTaskIsAsk = function(self, taskName)
	
		local nRow = 0;
		local nAsk = 0;
		local i=0;

		for i=1,getn(taskIndex.ConditionIndex) do
			if taskIndex.ConditionIndex[i][1]==taskName then
				nRow = taskIndex.ConditionIndex[i][3];
				break;
			end;
		end;
		
		nAsk = taskConditionFile:getCell(nRow, "IsAsk");
		
		if nAsk~="" then
			return 1;
		else
			return nil;
		end;
		
	end,
	
	-- ��ȡ����Ի��ı�չ��һ�ζԻ�
	TaskTalk = function(self, funBack, strTask)
		
		local aryTaskText;
		local i=0;
		
		if strTask~=nil and strTask~="n" and strTask~="" then
			aryTaskText = split(strTask, "|");
		end;
		
		-- ������ص�����Ϊ1����Ա��ֱ���� SAY�������� TALK ���ж�ֶ�
		if getn(aryTaskText)==1 then
			aryTaskText[1] = self:SetTaskSayColor(aryTaskText[1]);
			Say(aryTaskText[1],1,"K�t th�c ��i tho�i/"..funBack);
		else
			for i=1, getn(aryTaskText) do
				aryTaskText[i] = self:SetTaskSayColor(aryTaskText[i]);
			end;
			self:TalkEx(funBack, aryTaskText);
		end;
		
	end,
	
	-- ����ʼʱѯ���Ƿ�������ĶԻ�
	TaskAskSay = function(self, taskName)
		local strTalk = self:GetTaskText(taskName, 0);
		local nTaskID = self:GetTaskID(taskName);
		Say(
				self:SetTaskSayColor(strTalk),
				2,
				TaskDialogText.TaskConfirm.."/#CTask:_FunAskStart("..nTaskID..")",
				TaskDialogText.TaskCancel.."/#CTask:_FunAskCancel("..nTaskID..")"
			);
	end,
	
	
	-- ��һ����������Ϊ��ʼ
	SetTaskStateStart = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:AssignTask(nTaskID);
	end,
	
	-- ��һ����������Ϊ����
	SetTaskStateEnd = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:CompleteTask(nTaskID);	
	end,
	
	-- ��һ����������Ϊ��û��ʼ
	SetTaskStateClean = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		CTaskValue:ClearTask(nTaskID);	
	end,
	
	-- ��ȡһ������Ľ�չ״̬
	GetTaskState = function(self, strName)
		local nTaskID = self:GetTaskID(strName)
		return CTaskValue:GetTaskState(nTaskID);
	end,
	
	-- �ⲿ���ú������ж�һ�������Ƿ����
	IsTaskFinish = function(self, strName)
		if self:GetTaskState(strName)==2 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- �ⲿ���ú������ж�һ�������Ƿ��Ѿ���ʼ
	IsTaskStart = function(self, strName)
		if self:GetTaskState(strName)==1 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- ��ȡһ�����������
	GetTaskTipText = function(self, taskName)
		local nRow = self:GetTaskRow(taskIndex.ConditionIndex, taskName);
		local strTaskText = taskConditionFile:getCell(nRow, "TaskText");	
		return strTaskText;
	end,
	
	-- �ⲿ���ú����������еĶ�����ͬһ������
	-- �������Ϊ������ "Function Name"
	-- nMode��ִ��ģʽ��1 �Ƿ�������ͬ����һ��ִ�У�2 ��ִֻ�ж���
	DoWithTeammate = function(self, funName, nMode)
		local nPreservedPlayerIndex = PlayerIndex;
		local nMemCount = GetTeamSize();
		local i=0;
		
			if (nMemCount == 0) then -- �����ҵ���һ��δ��ӣ���ִ���˹���֮�󷵻�
				funName();
				return
			else
				if nMode==1 then
					for i=1,nMemCount do
						PlayerIndex = GetTeamMember(i);
						funName(); -- ִ�д�����������
					end;
				end;
				if nMode==2 then
					for i=1,nMemCount do
						PlayerIndex = GetTeamMember(i);
						if PlayerIndex~=nPreservedPlayerIndex then
							funName(); -- ִ�д�����������
						end;
					end;
				end;				
				PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
			end;
	end,
	
	-- �Զ���������Ի��е������Լ��ص��ʶ��������ɫ
	SetTaskSayColor = function(self, str)
		local strKey = ":";
		local strKeyLeft = "{";
		local strKeyRight = "}";
		local strPoint = strfind(str,strKey,1)
		local strName = "";
		local strColorText = str;
		
		if strPoint~=nil and strPoint>=1 then 
			strName = strsub(str, 1, strPoint-1);
			-- ��������������ɫ
			strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
		end;
				
		-- �����ص��ʶ��ɫ
		strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
		strColorText = join(split(strColorText,strKeyRight), "<color>");
		
		str = strColorText;
		return str;
		
	end,

--  /////////////////////////////////////////////
-- //			�¼����ܴ�����ز���		  //
--/////////////////////////////////////////////

	-- ���һ���¼���״̬
	-- 0 Ϊ����û�п�ʼ
	-- 1 Ϊ���ڽ�����
	-- 2 Ϊ�Ѿ�ȫ�����
	CheckEvent = function(self, aryEvent)
		
		local nNever, nNow, nEnd = 0,0,0;
		local i=0;
		
		for i=1, getn(aryEvent) do
			if aryEvent[i][2]==0 then
				nNever = nNever + 1;
			end;
			
			if aryEvent[i][2]==1 then
				nNow = nNow + 1;
			end;
			
			if aryEvent[i][2]==2 then
				nEnd = nEnd + 1;
			end;		
		end;
		
		if nNever==getn(aryEvent) then
			return 0;
		end;
		
		if nNow>=1 then
			return 1;
		end;
		
		if nEnd==getn(aryEvent) then
			return 2;
		end;
		
		return 0;

	end,

	-- ö��Ŀǰ���ھ����������¼����������¼���״̬
	-- ��ʽΪ��{�¼�ID���¼�״̬}
	EnumTotalEvent = function(self)
		local aryEventState = {};
		local eventID = 0;
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			eventID = taskIndex.EventIndex[i][1];
			rawset(aryEventState,
					getn(aryEventState)+1,
					{eventID, self:CheckEvent(self:EnumEventTask(eventID))}
				   );
		end;
		
		return aryEventState;
	end,
	
	-- ö��һ���¼������������񣬲����ظ��������״̬
	-- ��ʽΪ��{�������ƣ�����״̬}
	EnumEventTask = function(self, eventID)
		
		local taskName = "";
		local aryContainTask = {};
		local i=0;
		
		for i=1, getn(taskIndex.ConditionIndex) do
			taskName = taskIndex.ConditionIndex[i][1];
			if taskIndex.ConditionIndex[i][4]==eventID then
				rawset(aryContainTask, 
						getn(aryContainTask)+1,
						{taskName, self:GetTaskState(taskName)}
					   );
			end;
		end;
		
		if getn(aryContainTask)>0 then
			return aryContainTask;
		else
			return nil;
		end;
		
	end,
	
	-- ��ȡһ���¼��Ƿ��й�������
	IsEventShare = function(self, eventID)
		local nShare = 0;
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			if taskIndex.EventIndex[i][1]==eventID then
				nShare = taskIndex.EventIndex[i][3];
			end;
		end;
		
		if nShare==1 then
			return 1;
		else
			return nil;
		end;
	end,
	
	-- ȷ��һ���¼��Ƿ���Թ���nType 1Ϊ���������жϣ�2Ϊ�������ж�
	CanEventShare = function(self, eventID, nType)
		local aryTask = self:EnumEventTask(eventID);
		local nState = 0;
		local i=0;
		
		if nType==1 then
			-- ������¼����Թ���ſ�ʼ�ж�
			if self:IsEventShare(eventID) then
				return 1;
			else
				return nil;
			end;
		end;
		
		if nType==2 then
			if self:CheckEvent(aryTask)==0 then
				return 1;
			else
				return nil;
			end;
		end;
		
	end,
	
	-- ��ȡһ���¼�������
	GetEventText = function(self, eventID)
		local i=0;
		
		for i=1, getn(taskIndex.EventIndex) do
			if taskIndex.EventIndex[i][1]==eventID then
				return taskIndex.EventIndex[i][2];
			end;
		end;
		
		return "";
	end,


--  /////////////////////////////////////////////
-- //			��������չ��ز���		  //
--/////////////////////////////////////////////

	-- �� Talk ���ܵ���չ
	TalkEx = function(self, fun, szMsg)
	
		local num = getn(szMsg);
		local szmsg = "";
		
		if fun==nil then fun = ""; end;
		
		for i=1,num-1 do
			szmsg = szmsg..format("%q",szMsg[i])..",";
		end;
		
		szmsg = szmsg .. format("%q",szMsg[num]);
		szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")";
		dostring(szmsg);
		
	end,
	
	-- �� Say ���ܵ���չ
	SayEx = function(self, strSay)
	
		local strMsg,strSel = "","";
		local strNum = getn(strSay);
		
			if strNum < 2 then
				return
			end;
			
			if strNum > 2 then
				for i=2,strNum - 1 do
					strSel = strSel..format("%q", strSay[i])..",";
				end;
				strSel = strSel..format("%q", strSay[strNum]);
				strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
			elseif strNum == 2 then
				strSel = format("%q", strSay[strNum]);
				strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
			end;
			
			dostring(strMsg);
		
	end,
	
	-- ֱ�ӻ�ȡ�Ա���ַ�
	GetSexName = function(self)
	
		local mySex -- ������ʾ�����Ա���ַ�
	
		if (GetSex() == 1) then
			mySex = "C�ng t�";
		elseif (GetSex() == 2) then
			mySex = "N� hi�p ";
		end;
		
		return mySex;
		
	end,
	
}
