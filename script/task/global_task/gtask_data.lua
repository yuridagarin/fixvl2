Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");
Include("\\script\\system_switch_config.lua")

--��ܵ����¸㶨����
--1������������
--tGtNpcInfo:��������Ϊmain.txt + dialog.txt
function gf_ReadAllInfo(nGTaskID)	--������ԭ�����ظ���������
	tGtNpcInfo = tGtNpcInfo or {}
	if tGtNpcInfo[nGTaskID] ~= nil then
		return 1
	end
	
	for i = 3,TABLE_GT_MAIN:getRow() do
		local nTaskID = tonumber(TABLE_GT_MAIN:getCell(i,2));
		if nGTaskID == nTaskID then
			tGtNpcInfo[nTaskID] = {};
			tGtNpcInfo[nTaskID].name = TABLE_GT_MAIN:getCell(i,1);
			tGtNpcInfo[nTaskID].from_npc = TABLE_GT_MAIN:getCell(i,4);
			tGtNpcInfo[nTaskID].to_npc = TABLE_GT_MAIN:getCell(i,5);
			tGtNpcInfo[nTaskID].data = {};
			tGtNpcInfo[nTaskID].get_talk = {};
			tGtNpcInfo[nTaskID].finish_talk = {};
			tGtNpcInfo[nTaskID].data[1] = TABLE_GT_MAIN:getCell(i,3);
			--ExCondition
			local sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,6));
			if sExpression == nil or sExpression == "" then --����յķ���1
				sExpression = "1";
			end
			local strCondition = "function GtExCondition() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[2] = GtExCondition;
			--FinishCondition
			sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,7));
			if sExpression == nil or sExpression == "" then
				sExpression = "1";
			end			
			strCondition = "function GtFinishCondition() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[3] = GtFinishCondition;
			--Action
			sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,8));
			strCondition = "function GtAction() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[4] = GtAction;
			--Prize
			sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,9));
			strCondition = "function GtPrize() return "..sExpression.." end";
			dostring(strCondition);
			tGtNpcInfo[nTaskID].data[5] = GtPrize;			
			tGtNpcInfo[nTaskID].data[6] = TABLE_GT_MAIN:getCell(i,10); --��6��ΪAction�ռ为��
			tGtNpcInfo[nTaskID].data[7] = TABLE_GT_MAIN:getCell(i,11); --��7��ΪPrize�ռ为��
			tGtNpcInfo[nTaskID].data[8] = TABLE_GT_MAIN:getCell(i,12); --��8��Ϊȡ������
			tGtNpcInfo[nTaskID].data[9] = TABLE_GT_MAIN:getCell(i,13); --��9��Ϊ��������
			tGtNpcInfo[nTaskID].data[10] = TABLE_GT_MAIN:getCell(i,7); --��10��Ϊ���������Ϊ��ɾ����Ʒ	
			
			for k = 3,TABLE_GT_DIALOG:getRow() do
				if tonumber(TABLE_GT_DIALOG:getCell(k,1)) == nTaskID then
					local sTalkType = TABLE_GT_DIALOG:getCell(k,2);
					for m = 3,22 do
						local StrTalk = TABLE_GT_DIALOG:getCell(k,m);
						if StrTalk ~= nil and StrTalk ~= "" then
							tinsert(tGtNpcInfo[nTaskID][sTalkType],StrTalk);								
						else
							break;
						end
					end
					tGtNpcInfo[nTaskID][sTalkType].tip = TABLE_GT_DIALOG:getCell(k,24);  
				end
			end
		
			return 1
		end
	end
	
	return 0
end

--gf_ReadAllInfo();

--g_GtCondition condition.txt
function gf_ReadCondition()
	g_GtCondition = g_GtCondition or {}

	if g_GtCondition[1] ~= nil then
		return
	end
	
	for i = 3, TABLE_GT_CONDITION:getRow() do
		local nConditionID = TABLE_GT_CONDITION:getCell(i, 1);
		g_GtCondition[nConditionID] = {}
		g_GtCondition[nConditionID][1] = TABLE_GT_CONDITION:getCell(i, 2);
		for j = 3,8 do
			g_GtCondition[nConditionID][j-1] = TABLE_GT_CONDITION:getCell(i, j);
		end
	end
end

--gf_ReadCondition();

--g_GtPrize prize.txt
function gf_ReadPrize()
	g_GtPrize = g_GtPrize or {}
	
	if g_GtPrize[1] ~= nil then
		return
	end
	
	for i = 3, TABLE_GT_PRIZE:getRow() do
		local nPrizeID = TABLE_GT_PRIZE:getCell(i, 1);
		g_GtPrize[nPrizeID] = {}
		g_GtPrize[nPrizeID][1] = TABLE_GT_PRIZE:getCell(i, 2);
		for j = 3,8 do
			g_GtPrize[nPrizeID][j-1] = TABLE_GT_PRIZE:getCell(i, j);
		end
	end
end

--gf_ReadPrize();


--����ÿ��������ϵ�gtask
tGtTaskManage = {};

--gtask�е�һ���ճ������������
function tGtTaskManage:FirstEmptyTask()
	for i = tGtTask.GT_TASK_ID_START, tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == 0 then
			return i;
		end
	end
	
	return 0
end

--gtask�Ƿ��������µ�����
function tGtTaskManage:IsCanAddNewTask()
	if tGtTaskManage:FirstEmptyTask() == 0 then
		return 0
	else
		return 1
	end
end

--����gtask�е�������λ
--nValue
	--1 ��ʾ�Ѿ����
	--0 ��ʾδ���
function tGtTaskManage:SetTaskStateBit(nTaskID, nValue)
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);	
	if nBit == 0 then
		nBit = 31;
	end
	gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit,nValue);  
end

--gtask�����һ������
--1�����
--2��������״̬��Ϊδ���
--����ֵ
	--1����ӳɹ�
	--2�����ʧ�ܣ�ԭ��������
function tGtTaskManage:AddTask(nGTaskID)
	local nTaskID = self:FirstEmptyTask();
	if nTaskID ~= 0 then
		self:SetTaskStateBit(nGTaskID, 0);
		SetTask(nTaskID, nGTaskID);
		return 1
	else
		return 0
	end
end

--�Ƴ�һ������
--1���Ƴ�
--2��������״̬��Ϊ���
--����ֵ
	--1 �ɹ�
	--2 û�д�����
function tGtTaskManage:DeleteTask(nTaskID, nIsOver)
	local nTaskReturn = 0
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			SetTask(i,0);
			for j = 1,tGtTask.GLV_GT_TASK_ADD - 1 do 
				SetTask(i+(tGtTask.GLV_GT_TASK_NUM+1)*j,0);
			end
			nTaskReturn = i;
			break;
		end
	end
	
	if nTaskReturn ~= 0 then	--�У������Ѿ�ɾ��
		if  nIsOver == 1 then
			tGtTaskManage:SetTaskStateBit(nTaskID, 1);
		else
			tGtTaskManage:SetTaskStateBit(nTaskID, 0);
		end
		tGtTask:remove_trigger(nTaskID)
	end
end

--�Ƿ�ӵ�gtask��nGTaskID��Ӧ������
function tGtTaskManage:IsGetGTaskID(nGTaskID)
	if tGtTask:get_task(nGTaskID) == 0 then
		return 0
	else
		return 1
	end
end

function tGtTaskManage:AddTaskInfo(nGTaskID)
	return gf_ReadAllInfo(nGTaskID)
end

function tGtTaskManage:IsTSDLTask(nGTaskID)
	for n = 2,TABLE_GT_TSDL:getRow() do
		if tonumber(TABLE_GT_TSDL:getCell(n,1)) == nGTaskID then	--�������ˣ����������Ҫ�������
			return 1
		end
	end
	
	return 0
end

--һЩ������������ú���
--Open ����һ������
--1����manage������һ������������������ڡ������߼�
--2����������ǰ�ġ���֤���߼�
	--2����֤�ռ�����
	--0���Ƿ�����condition���е�����
--3����������ǰ�Ķ���
	--0�����
	--1���߻��Զ��塪��δʵ��
--4�����������趨���λ
--5������������Ķ���
	--1���Ի����Ի������趨������˵���ˣ���
	--2���߻��Զ���
	--3����Ч
	--4���������
--����ֵ
	--4 �����nTaskID������
	--3 �����ٽ�����
	--2 δ���㿪������
	--1 �ɹ�
	--5 ľ�д�nTaskID
function OpenGTask(nTaskID)
	--gtask�ر�
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--print("in Open")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(2956)
		if nTaskID == 0 then
			return 4
		end
	end

	--manager����
	if tGtTaskManage:IsCanAddNewTask() == 0 then
		return 3	
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 5
	end
	
	--����ǰ����֤
	local nCanGet = tGtTask:IsTaskCanGet(nTaskID);
	if nCanGet ~= 1 then
		if nCanGet == 3 then
			Talk(1,  "",  "Do kh�ng ��t �� �i�u ki�n, c�c h� ch�a th� nh�n nhi�m v� n�y, r�t ti�c.");
		end
		if nCanGet == 5 then
			Talk(1, "", "C�c h� �� xin giao nh�p v�o m�n ph�i kh�c r�i.");
		end
		return 2
	end
	
	--���������ƣ����⴦��-----
	if nTaskID == 151 then
		--����
		if GetWorldPos() ~= 6073 then
			Talk(1,  "",  "Do kh�ng ��t �� �i�u ki�n, c�c h� ch�a th� nh�n nhi�m v� n�y, r�t ti�c.");
			return 6
		end
		--����
		SetCampToPlayer("camp_enemy");
	end
	---------------------------
	
	--����ǰ����
	--���<----------δ��
	
	--����
	--���ĳ�����λ<----------��
	tGtTaskManage:AddTask(nTaskID)
	
	--������Ķ���
	--�Ի�
	--tGtTask:SpeakBegin(nTaskID, 1);
	--�߻��Զ���
	SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nTaskID);
	tGtTask:DoAction(nTaskID);
	
	--��Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 906, 2, 0);
	
	--�������
	if tGtTaskManage:IsTSDLTask(nTaskID) == 1 and GetTrigger(4001) == 0 then
		CreateTrigger(0, 1245,  4001, 1);
	end
	
	--print("succ")
	--ok ��ɽ�����
	return 1
end	
	
--Finish ��������һ������
--0��manage���Ƿ����
--1�������������
	--2���߻��趨
	--1���ռ�
--2������ǰ����
	--1���߻��趨
	--2���Ի�
--3������
--4��manage�д���
--5��������
--6����һ���Ƿ�ɽ�
--����ֵ
	--1 �ɹ�
	--2 �������������
	--3 ľ�нӵ�����
	--4 ɾ��ʧ��
	--5 ��������
	--6 ľ�д�nTaskID
function FinishGTask(nTaskID)
	--print("in finish")
	if nTaskID == 0 or nTaskID == nil then
		nTaskID = GetTask(2956);
		if nTaskID == 0 then
			return 5
		end
	end
	
	--manage���Ƿ����
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 3
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return 6
	end
	
	--�������
	local nCanOver = tGtTask:IsTaskCanOver(nTaskID)
	if nCanOver ~= 1 then
		return 2
	end
	
	--����ǰ�������߻��趨��ɾ�����Ի�
	if tGtCondition:del_item_confirm(tGtNpcInfo[nTaskID]["data"][10]) == nil then
		return 4;
	end
	
	--��������
	--��Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	--manage����
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--���뽱��
	tGtTask:DoPrize(nTaskID)	
	
	--������һ�¾Ϳ��Եõ���һ������
	local targetNpc = GetNpcName(GetTargetNpc());
	if targetNpc ~= "" and tGtNpcInfo[nTaskID].to_npc == targetNpc 
		and tGtNpcMain and type(tGtNpcMain.npc_main) == "function" then
		tGtNpcMain:npc_main(tGtNpcInfo[nTaskID].to_npc)
	end
	return 1
end

--Close ȡ��һ������
--0���Ƿ���manage��
--1���Ƿ��ɾ��
--3��ȡ��ҪǮ��Ŷ
--2����manage��ɾ��
--����ֵ
	--1���ɹ�
	--2��ľ������
	--3�����񲻿���ȡ��
	--4����Ǯʧ��
function CloseGTask(nTaskID)
	--manage���Ƿ����
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 2
	end
	
	--�Ƿ����ɾ��
	if tGtTask:IsCanClose(nTaskID) ~= 1 then
		return 3
	end
	
	--��Ǯ��Ǯ��Ǯ
	if Pay(tGtNpcInfo[nTaskID].data[8]) ~= 1 then
		return 4
	end
	
	--��manage���Ƴ�
	tGtTaskManage:DeleteTask(nTaskID)
	
	return 1
end
	
--Jump ����һ������
--0���Ƿ���manage��
--1���Ƿ������
--3������Ǯ
--4����manage���Ƴ�
--5���������Ļ���ŶҲ
--����ֵ
	--1���ɹ�
	--2��ľ������
	--3�����񲻿�������
	--4����Ǯʧ��
function JumpGTask(nTaskID, bIsPrize)
	--manage���Ƿ����
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return 2
	end
	
	--�Ƿ��������
	if tGtTask:IsCanJump(nTaskID) ~= 1 then
		return 3
	end
	
	--Ǯ
	if Pay(tGtNpcInfo[nTaskID].data[9]) ~= 1 then
		return 4
	end
	
	--����ǰ�������߻��趨��ɾ�����Ի�
	tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	
	--ɾ��������
	tGtTask:remove_trigger(nTaskID);
	
	--��������
	--��Ч
	SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 907, 2, 0);
	
	--��manage���Ƴ�
	tGtTaskManage:DeleteTask(nTaskID, 1)
	
	--���뽱��
	if bIsPrize and tonumber(bIsPrize) == 1 then
		tGtTask:DoPrize(nTaskID);
		Msg2Player("Nhi�m v� ho�n th�nh!");
	end
	
	--������
	tGtTask:SpeakFinish(nTaskID)
	
	return 1
end

--Clear ���һ������
--1�����manage���У����Ƴ��������
--2���������bitλ��Ϊ0
function ClearGTask(nTaskID)
	if tGtTaskManage:IsGetGTaskID(nTaskID) ~= 0 then
		tGtTaskManage:DeleteTask(nTaskID)
	end
	
	tGtTaskManage:SetTaskStateBit(nTaskID, 0)
end

--gtask_main����ȡ�����NPC�������ڣ��Զ���ű���������
--ֱ�ӽ�ȡָ��TaskId������
--flag��1Ϊ���棬2Ϊǿ��
function DirectGetGTask(nTaskID,flag)
	--�Ƿ�����������ϵͳ
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskID�Ƿ�Ϸ�
	if nTaskID <= 0 or nTaskID == nil then
		return -2;
	end
	--TaskID�Ƿ��ȡ
	if tGtTask:check_cur_task(nTaskID) ~= 0 then
		Msg2Player("C�c h� �� ti�p nh�n nhi�m v� n�y");
		return -3;
	end
	--�Ƿ����
	if tGtTask:check_task() == 0 then
		Msg2Player("S� nhi�m v� ch�a ho�n th�nh v��t qu� gi�i h�n");
		return -4;
	end
	if flag == 1 then
	--����
		SetTask(Task_id_001,nTaskID);
		SendScript2Client("Open(\"TaskFace\","..tostring(nTaskID)..",1)");
		return 0;
	elseif flag == 2 then
	--ǿ�ƽ�ȡ
	--�ɹ���ȡ����1
		return OpenGTask(nTaskID);
	end
end

--ֱ�����������ܴ��ڲ��ܴ������״̬��������������á�
--flag��1Ϊ���棬2Ϊǿ��
function DirectFinishGTask(nTaskID,flag)
	--�Ƿ�����������ϵͳ
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskID�Ƿ�Ϸ�
	if nTaskID <= 0 or nTaskID == nil then
			return -2;
	end
	--TaskID�Ƿ��ȡ
	if tGtTask:check_cur_task(nTaskID) == 0 then
		--Msg2Player("��û�нӹ�������");
		return -3;
	end
	if flag == 1 then
	--����
		SetTask(Task_id_001,nTaskID);
		SendScript2Client("Open(\"TaskFace\","..tostring(nTaskID)..",2)");
		return 0;
	elseif flag == 2 then
	--ǿ�����
	--�ɹ���ɷ���1
		return FinishGTask(nTaskID);
	end	
end

--ֱ��ɾ����������
function DirectDeleteTask(nTaskID)
	--�Ƿ�����������ϵͳ
	if IsNewTaskSystemOpen() ~= 1 then
		return -1;
	end
	--TaskID�Ƿ�Ϸ�
	if nTaskID <= 0 or nTaskID == nil then
		return -2;
	end
	if tGtTask:check_cur_task(nTaskID) ~= 1 then
		return -3;
	end
	--manage���Ƿ����
	if tGtTaskManage:IsGetGTaskID(nTaskID) == 0 then
		return -4;
	end
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return -5;
	end	
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			SetTask(i,0);
			--����״̬һ������
			for j = 1,tGtTask.GLV_GT_TASK_ADD - 1 do 
				SetTask(i+(tGtTask.GLV_GT_TASK_NUM+1)*j,0);
			end
			break;
		end
	end	
	--ɾ��������ĵ���
	tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	--ɾ��������
	tGtTask:remove_trigger(nTaskID);	
	--���״̬��Ϊ0
	tGtTaskManage:SetTaskStateBit(nTaskID, 0);
end


function DirectIsTaskFinish(nTaskID)
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return nil
	end
	--�������
	if tGtTask:CheckCondition(nTaskID) ~= 1 then
		return nil;
	end
	return 1;
end

--�Ƿ���˻���û���ܽӸ�����
function IsHaveTaskOrCanGet(nTaskID)
	if tGtTaskManage:AddTaskInfo(nTaskID) == 0 then
		return nil
	end
	if tGtTask:check_cur_task(nTaskID) == 1 or tGtTask:IsTaskCanGet(nTaskID) == 1 then
		return 1;
	end
	return nil;
end

--����Ƿ���˸����������
function IsHaveTaskOrCanGet2(nStart, nEnd)
	for i = nStart, nEnd do
		if IsHaveTaskOrCanGet(i) == 1 then
			return 1;
		end
	end
	return nil;
end