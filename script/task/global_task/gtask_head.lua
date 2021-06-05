--�µ���������
--by vivi
--modify by liubo

Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\string.lua")
Include("\\script\\lib\\define.lua");
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\system_switch_config.lua")

TABLE_GT_MAIN = new(KTabFile,"\\settings\\gtask\\gtask_main.txt");
TABLE_GT_CONDITION = new(KTabFile,"\\settings\\gtask\\gtask_condition.txt");
TABLE_GT_PRIZE = new(KTabFile,"\\settings\\gtask\\gtask_prize.txt");
TABLE_GT_DIALOG = new(KTabFile,"\\settings\\gtask\\gtask_dialog.txt");
TABLE_GT_TSDL = new(KTabFile,"\\settings\\gtask\\gtask_tsdl.txt");

--=======================������====================================
tGtTask = {
	--��һ���Ǽ�¼ÿ������ID�Ƿ���ɵ��������bitʹ�ã�ÿ��������31����
	--��ʱ��Ϊ40�����ɼӡ�
	tGtTaskID = {
		3008,3009,3010,3011,3012,3013,3014,3015,3016,3017,
		3018,3019,3020,3021,3022,3023,3024,3025,3026,3027,
		3028,3029,3030,3031,3032,3033,3034,3035,3036,3037,
		3038,3039,3040,3041,3042,3043,3044,3045,3046,3047,
	},
	--�������
	--��һ����������Ŀ�ʼ
	--��¼���򣺴������ʼ��10��������¼��ǰ�ӵ�����ID
	--�����10���Ƕ�Ӧ����ID�Ĵ���������������У�����4���ֽ�ʹ�ã���1��Ϊ���ͣ���2��Ϊ������3��4��û�õ���
	--�������10����¼��Ӧ����ID�Ĵ�����������
	--������10����¼��Ӧ����ID��ĳЩ������ֵ����
	GT_TASK_ID_START = 2968,
	GLV_GT_TASK_NUM = 9,  --ÿ�μ�9��һ��10��
	GLV_GT_TASK_ADD = 4,  --һ��4��
	GT_TEMP_TASK_ID = 201, --��ʱ��������¼��ǰ�ӵ�����ID
	GT_TEMP_RAND_ID = 202, --��ʱ��������¼��ǰ�ӵ��������ID
	GT_TRIGGER_OFFSET = 4000, --CustomtriggerID�����������ƫ����
};

--���������ɵĽ���
--����������ȵĲ�����Ҫ��gtask_main������ID������
function tGtTask:check_finsh_taskid()
	local nCount = getn(tGtTask.tGtTaskID) or 0;
	local nNum = 31;
	if nCount <= 0 then return 0; end
	for i = 1,nCount do
		for j = 1,nNum do
			if gf_GetTaskBit(tGtTask.tGtTaskID[i],j) ~= 1 then
				return (i-1) * 31 + j;
			end
		end
	end
	return 0;
end

--���TaskId�����Ƿ����
--����~0���0δ���
function tGtTask:check_task_isfinish(nTaskId)
	--������λ
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskId/31);
	nBit = mod(nTaskId,31);
	if nBit == 0 then
		nBit = 31;
	end
	return gf_GetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit);
end

--����Ƿ����������
--���Ӧ�ö���
function tGtTask:check_task()
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == 0 then
			return 1;
		end
	end
	return 0;
end

function tGtTask:GetAllTask()
	local tRetTask = {};
	local nRetTask = 1;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		local nTaskID = GetTask(i);
		if nTaskID ~= 0 then
			tRetTask[nRetTask] = nTaskID;
			nRetTask=nRetTask+1;
		end
	end

	return tRetTask;
end

--����Ƿ���˸�����
function tGtTask:check_cur_task(nTaskID)
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			return 1;
		end
	end
	return 0;
end

function tGtTask:ClearAll()
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) ~= 0 then
			tGtTask:set_task(3, GetTask(i));
		end
	end
end

--��������Ĳ���
--nType��1��ʾ������ 2��ʾ���������������� 3��ʾȡ������
--nTaskID:����ID
--���أ����õı���ֵ
function tGtTask:set_task(nType,nTaskID)
	local nTaskReturn = 0;
	if nType == 1 then
		for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
			if GetTask(i) == 0 then
				SetTask(i,nTaskID);
				nTaskReturn = i;
				break;
			end
		end
	else
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
		if nType ~= 3 then
			if tGtNpcInfo[nTaskID].data[1] == "" or tonumber(tGtNpcInfo[nTaskID].data[1]) == 0 then
				local nTabIdx,nBit = 0,0;
				nTabIdx = ceil(nTaskID/31);
				nBit = mod(nTaskID,31);
				if nBit == 0 then
					nBit = 31;
				end
				gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit,1);  --���ö�Ӧ��ֵΪ1��ʾ������ID�Ѿ����
			end
		end
	end
	return nTaskReturn;
end

--��ȡnTaskID�����ĸ�������
function tGtTask:get_task(nTaskID)
	local nTaskReturn = 0;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nTaskReturn = i;
			return nTaskReturn;
		end
	end
	return nTaskReturn;
end

--����������񣬰�ǰ������ID��������ĸ�������
function tGtTask:set_ex_task(nTaskID,nExTaskID)
	local nTaskValue1 = tGtTask:get_task(nTaskID);
	local nTaskValue4 = nTaskValue1+(tGtTask.GLV_GT_TASK_NUM+1)*3;
	SetTask(nTaskValue4,nExTaskID);
end

--��ȡ��������ǰ������ID�������������ID�������Ƿ���˸�����
function tGtTask:get_ex_task(nTaskID)
	local nResult = 0;
	for i = tGtTask.GT_TASK_ID_START+(tGtTask.GLV_GT_TASK_NUM+1)*3,tGtTask.GT_TASK_ID_START+(tGtTask.GLV_GT_TASK_NUM+1)*3+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nResult = i;
			return nResult;
		end
	end
	return nResult;
end

--��������ɱ�֣�������
function tGtTask:trigger_finish_state(nTaskID)
	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return 1;
	end
	for i = 1,nCount do
		if gf_GetTaskBit(nTaskValue3,i) ~= 1 then
			return 0;
		end
	end
	return 1;
end

--����TaskID�Ƴ���ش�����
function tGtTask:remove_trigger(nTaskID)
	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCustomTrigger = 0;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return 0;
	end
	for i = 1,nCount do
		nCustomTrigger = tGtTask.GT_TRIGGER_OFFSET+nTaskID*10+i;
		RemoveTrigger(GetTrigger(nCustomTrigger));
	end
end

function tGtTask:get_trigger(nTaskID)
	local tTrigger = {};

	local nTaskValue = tGtTask:get_task(nTaskID);
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	local nCustomTrigger = 0;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	if nCount == 0 then
		return nil;
	end
	for i = 1,nCount do
		nCustomTrigger = tGtTask.GT_TRIGGER_OFFSET+nTaskID*10+i;
		tTrigger[i] = nCustomTrigger
	end

	return tTrigger;
end

--����Ի�
--nType
	--1 ��ʼ�Ի�
	--2 �����Ի�
function tGtTask:_Speak(nTaskID, nDialogNum, nType, funcName)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end

	local strType = "";
	local strFunName = "";
	if nType == 1 then
		strType = "get_talk"
		strFunName = "SpeakBegin"
	elseif nType == 2 then
		strType = "finish_talk"
		strFunName = "SpeakFinish"
	end

	local strDialog = nil;
	if nDialogNum and tGtNpcInfo[nTaskID][strType] then
		strDialog = tGtNpcInfo[nTaskID][strType][nDialogNum];
	end
	if strDialog ~= nil then
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nTaskID].from_npc);
		if tGtNpcInfo[nTaskID][strType][nDialogNum + 1] == nil and funcName ~= "" then
			Talk(1, funcName, strDialog);
		else
			Talk(1, "#tGtTask:"..strFunName.."("..nTaskID..","..(nDialogNum + 1)..", )", strDialog);
		end
	end

	local strTip = tGtNpcInfo[nTaskID][strType].tip;
	if strTip ~= nil and strTip ~= "" and nDialogNum == 1 then
		TaskTip(strTip);
	end
end

--����ʼ�Ի�����������ǰ�汾���ظ���������
function tGtTask:SpeakBegin(nTaskID, nDialogNum)
	tGtTask:_Speak(nTaskID, nDialogNum, 1)
end

--��������Ի���������
function tGtTask:SpeakFinish(nTaskID, nDialogNum)
	tGtTask:_Speak(nTaskID, nDialogNum, 2)
end

--����ִ�ж�����������
function tGtTask:DoAction(nTaskID)
	if tGtNpcInfo[nTaskID] ~= nil then
		tGtNpcInfo[nTaskID]["data"][4]();
	end
end


function UpdateMeridia_73()
	if MeridianGetLevel() == 0 then
	--print("MeridianGetLevel")
		local tSex = gf_GetPlayerSexName();
		if MeridianUpdateLevel() == 1 then
			Msg2Player("Ch�c m�ng "..tSex.."Nghi�n c�u <Qu� Hoa B�o �i�n> th�nh c�ng v� ��t ��n c�nh gi�i V� Gi�.");
			if MeridianGetLevel() == 1 then
				gf_WriteLogEx("KICK HOAT KINH MACH", "th�nh c�ng", 1, "V� Hi�n")
				--AwardGenuineQi(30000);
	  		Msg2Player("Ch�c m�ng "..tSex.."So b� l�nh ng� <Qu� Hoa B�o �i�n>");
	  		Talk(2,"",format("Ch�c m�ng <color=green>%s<color>�� ��c'Qu� Hoa B�o �i�n'th�nh c�ng v� ��t  ��n c�nh gi�i v� gi�",tSex),format("Ch�c m�ng %s s� b� l�nh ng� ���c'Qu� Hoa B�o �i�n',(b�m n�t J�� xem kinh m�ch)",tSex));
			end
		end
	end
end

--������
function tGtTask:DoPrize(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		return nil
	end

	tGtNpcInfo[nTaskID].data[5]();
	
	--���轱��������⴦��------
	--�Ѿ����73������
	if tGtTask:check_finsh_taskid() == 74 then
		UpdateMeridia_73();
	end
	----------------------------
end

--����ռ���
--����ֵ
	--1 �ɹ�
	--2 ʧ��
function tGtTask:_CheckRoomWeight(tRoomWeight)
	local nRoomWeight = tRoomWeight;--tGtNpcInfo[nGTaskID]["data"][6];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 2
		end
	end

	return 1
end

--���ɵ����⴦��
	--����ֵ��1���ɹ�
	--2��ʧ��
function tGtTask:CheckRoute(nGTaskID)
	return 1
end

--�����Ƿ�ɽ�
	--1������ռ�
	--2��condition
--����ֵ
	--1 �ɹ�
	--2 �ռ䲻��
	--3 condition ������
	--4 �������ѽ�
	--5 ���ɳ�ͻ
	--6 ������ɹ�
function tGtTask:IsTaskCanGet(nGTaskID)
	if self:_CheckRoomWeight(tGtNpcInfo[nGTaskID]["data"][6]) ~= 1 then
		Msg2Player("Kh�ng gian h�nh trang kh�ng ��")
		return 2
	end

	SetTaskTemp(tGtTask.GT_TEMP_TASK_ID, nGTaskID);	--���������id������ʱ������Ϊ�������ǰ���������
	local nConditionResult = tGtNpcInfo[nGTaskID]["data"][2]();
	if nConditionResult == nil then
		return 3
	end

	if tGtTask:check_cur_task(nGTaskID) == 1 then
		return 4
	end
	
	if tGtTask:CheckRoute(nGTaskID) == 0 then
		return 5
	end

	if tonumber(tGtNpcInfo[nGTaskID]["data"][1]) == 1 then	--�������
		return 1
	else
		if tGtCondition:check_taskid(nGTaskID,1) ~= nil then
			return 6
		end
	end

	return 1
end

--�����Ƿ�ɽ���
	--2���������
		--1���趨�������
		--2��������
	--1������ռ�
--����ֵ
	--1���ɹ�
	--2���ռ䲻��
	--3���������������
	--4��������δ���
function tGtTask:IsTaskCanOver(nGTaskID)
	local nConditionResult = tGtNpcInfo[nGTaskID]["data"][3]();
	if nConditionResult == nil then
		return 3
	end

	if tGtTask:trigger_finish_state(nGTaskID) == 0 then --������������
		return 4
	end

	if self:_CheckRoomWeight(tGtNpcInfo[nGTaskID]["data"][7]) ~= 1 then
		Msg2Player("Kh�ng gian h�nh trang kh�ng ��")
		return 2
	end

	return 1
end

--����Ǯ�������񡪡���������ĵڶ����취
--nType
	--1���ر�
	--2������
--����ֵ
	--1������
	--2������ȡ��
	--3������������
	--4��Ǯ����
	--5���ռ䲻��
function tGtTask:IsCanPayForTask(nTaskID, nType)
	if tGtNpcInfo[nTaskID] == nil then
		return 3
	end

	local nMoney = 0
	if nType == 1 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[8]);
	elseif nType == 2 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[9]);
		if self:_CheckRoomWeight(tGtNpcInfo[nTaskID]["data"][7]) ~= 1 then
			return 5
		end
	end

	if nMoney ~= -1 and nMoney ~= nil then
		if GetCash() < nMoney then
			return 4
		end
		return 1
	end

	return 2
end

--�����������Ľ�����Ŀ
function tGtTask:GetJumpTaskCost(nTaskID)
	if not nTaskID then
		return 0;
	end
	if tGtNpcInfo[nTaskID] == nil then
		return 0;
	end
	return tonumber(tGtNpcInfo[nTaskID].data[9]);
end

--����Ǯ�������񡪡���������ĵڶ����취
--nType
	--1���ر�
	--2������
--����ֵ
	--1������
	--2������ȡ��
	--3������������
	--4��Ǯ����
function tGtTask:JumpTaskCheckCondition(nTaskID, nType)
	if tGtNpcInfo[nTaskID] == nil then
		return 3
	end
	local nMoney = 0
	if nType == 1 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[8]);
	elseif nType == 2 then
		nMoney = tonumber(tGtNpcInfo[nTaskID].data[9]);
	end

	if nMoney ~= -1 and nMoney ~= nil then
		if GetCash() < nMoney then
			return 4
		end
		return 1
	end
	return 2
end

--�����Ƿ���Թر�
function tGtTask:IsCanClose(nTaskID)
	return self:IsCanPayForTask(nTaskID, 1)
end

--�����Ƿ��������
function tGtTask:IsCanJump(nTaskID)
	return self:IsCanPayForTask(nTaskID, 2)
end

--���������������
function tGtTask:CheckJumpTask(nTaskID)
	return self:JumpTaskCheckCondition(nTaskID, 2);
end

function tGtTask:CloseTask(nTaskID)
	--������λ
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);
	if nBit == 0 then
		nBit = 31;
	end
	gf_SetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit, 0);
	--�����ϸ��¼
	tGtTask:set_task(3,nTaskID)
end

--ɱ�ִ������ص�����
function gt_trigger_callback()
	local nCustomTrigger = GetTriggerCustomID(GetRunningTrigger());
	local nCount = mod(nCustomTrigger,10);
	local nTaskID = ((nCustomTrigger-nCount)-tGtTask.GT_TRIGGER_OFFSET)/10;
	local nTaskValue = 0;
	for i = tGtTask.GT_TASK_ID_START,tGtTask.GT_TASK_ID_START+tGtTask.GLV_GT_TASK_NUM do
		if GetTask(i) == nTaskID then
			nTaskValue = i;
			break;
		end
	end
	local nTaskValue3 = nTaskValue+(tGtTask.GLV_GT_TASK_NUM+1)*2;
	gf_SetTaskBit(nTaskValue3,nCount,1);
	RemoveTrigger(GetRunningTrigger());

end

--��������Ƿ����
function tGtTask:CheckCondition(nTaskID)
	local nConditionResult = tGtNpcInfo[nTaskID]["data"][3]();
	if nConditionResult == nil then
		return nil
	end
	if tGtTask:trigger_finish_state(nTaskID) == 0 then --������������
		return nil
	end
	return 1
end



--=======================���Ի�����=================================
tNpcInfoEx = {};
tGtNpcMain = {};
tGtNpcInfo = {};

--���ű�������NPC��������Щ������Ϣ�����ڻ���
function tGtNpcMain:get_main_table(sNpcName)
--	if sNpcName == "" or sNpcName == nil then
--		return 0;
--	end	
--	if tNpcInfoEx[sNpcName] ~= nil then
--		return 0;
--	else
--		tNpcInfoEx[sNpcName] = 1;
--	end
--	if tGtNpcInfo ~= nil then
--		return 0;
--	end
	for i = 3,TABLE_GT_MAIN:getRow() do
		if TABLE_GT_MAIN:getCell(i,4) == sNpcName or TABLE_GT_MAIN:getCell(i,5) == sNpcName then
			local nTaskID = tonumber(TABLE_GT_MAIN:getCell(i,2));
			if tGtNpcInfo[nTaskID] == nil then
				tGtNpcInfo[nTaskID] = {};
				tGtNpcInfo[nTaskID].name = TABLE_GT_MAIN:getCell(i,1);
				tGtNpcInfo[nTaskID].from_npc = TABLE_GT_MAIN:getCell(i,4);
				tGtNpcInfo[nTaskID].to_npc = TABLE_GT_MAIN:getCell(i,5);
				tGtNpcInfo[nTaskID].data = {};
				tGtNpcInfo[nTaskID].get_talk = {};
				tGtNpcInfo[nTaskID].finish_talk = {};
				tGtNpcInfo[nTaskID].data[1] = TABLE_GT_MAIN:getCell(i,3);
				--------------------
				local sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,6));
				if sExpression == nil or sExpression == "" then --����յķ���1
					sExpression = "1";
				end
				local strCondition = "function GtExCondition() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[2] = GtExCondition;
				---------------------
				sExpression = tGtCondition:get_sub(TABLE_GT_MAIN:getCell(i,7));
				if sExpression == nil or sExpression == "" then
					sExpression = "1";
				end
				strCondition = "function GtFinishCondition() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[3] = GtFinishCondition;
				----------------------
				sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,8));
				strCondition = "function GtAction() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[4] = GtAction;
				-----------------------
				sExpression = tGtPrize:get_sub(TABLE_GT_MAIN:getCell(i,9));
				strCondition = "function GtPrize() return "..sExpression.." end";
				dostring(strCondition);
				tGtNpcInfo[nTaskID].data[5] = GtPrize;
				----------------------
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
						tGtNpcInfo[nTaskID][sTalkType].unFinish = TABLE_GT_DIALOG:getCell(k,25);
					end
				end
			end
		end
	end
end

function tGtNpcMain:HaveTaskInGTask(sNpcName)
	sNpcName = sNpcName or GetTargetNpcName();	
	local strtab = {};
	for i,v in tGtNpcInfo do
		local nCheckCurTask = tGtTask:check_cur_task(i);
		if nCheckCurTask == 1 then --�Ѿ�����
			local nConditionResult = v.data[3](); --�������
			if tGtNpcInfo[i].to_npc == sNpcName or tGtNpcInfo[i].from_npc == sNpcName then
				if nConditionResult ~= nil then --�����������
					if tGtTask:trigger_finish_state(i) == 1 and tGtNpcInfo[i].to_npc == sNpcName then --������������
						tinsert(strtab,v.name.."(�� ho�n th�nh)/#tGtNpcMain:finish_task_talk("..i..",1)");
					else
						--local nNum = tonumber(i);
						--if nNum ~= 263 and nNum ~= 274  and nNum ~= 495 and tGtNpcInfo[i].from_npc ~= "�Ǻ�" and tGtNpcInfo[i].to_npc ~= "�Ǻ�" and tGtNpcInfo[i].from_npc ~= "��������" and tGtNpcInfo[i].to_npc ~= "��������" and tGtNpcInfo[i].from_npc ~= "��־ǿ" and tGtNpcInfo[i].to_npc ~= "��־ǿ" and tGtNpcInfo[i].from_npc ~= "�پ�����" and tGtNpcInfo[i].to_npc ~= "�پ�����" and tGtNpcInfo[i].from_npc ~= "���ལ������" and tGtNpcInfo[i].to_npc ~= "���ལ������"  then	--�������ϰ� XOXO �Ǻ�
						tinsert(strtab, v.name.."(ch�a ho�n th�nh)/#tGtNpcMain:UnFinishTask("..i..")");	--δ��ɶԻ�
						local nMoney1 = tonumber(v.data[8]);
						local nMoney2 = tonumber(v.data[9]);
--							if nMoney1 ~= -1 and nMoney1 ~= nil then
--								tinsert(strtab,"��Ҫȡ������["..v.name.."]/#tGtNpcMain:cancel_task_talk("..i..","..nMoney1..")");
--							end
						if nMoney2 ~= -1 and nMoney2 ~= nil then
							tinsert(strtab,"Ta mu�n nh�y qua nhi�m v� n�y["..v.name.."]/#tGtNpcMain:skip_task_talk("..i..","..nMoney2..")");
						end
						--end
					end
				else
					--local nNum = tonumber(i);
					--if nNum ~= 263 and nNum ~= 274  and nNum ~= 495 and tGtNpcInfo[i].from_npc ~= "�Ǻ�" and tGtNpcInfo[i].to_npc ~= "�Ǻ�" and nNum ~= 622 and tGtNpcInfo[i].from_npc ~= "��������" and tGtNpcInfo[i].to_npc ~= "��������" and tGtNpcInfo[i].from_npc ~= "��־ǿ" and tGtNpcInfo[i].to_npc ~= "��־ǿ" and tGtNpcInfo[i].from_npc ~= "�پ�����" and tGtNpcInfo[i].to_npc ~= "�پ�����" and tGtNpcInfo[i].from_npc ~= "���ལ������" and tGtNpcInfo[i].to_npc ~= "���ལ������" then	--�������ϰ� XOXO �Ǻ�
					tinsert(strtab, v.name.."(ch�a ho�n th�nh)/#tGtNpcMain:UnFinishTask("..i..")");	--δ��ɶԻ�
					local nMoney1 = tonumber(v.data[8]);
					local nMoney2 = tonumber(v.data[9]);
--						if nMoney1 ~= -1 and nMoney1 ~= nil then
--							tinsert(strtab,"��Ҫȡ������["..v.name.."]/#tGtNpcMain:cancel_task_talk("..i..","..nMoney1..")");
--						end
					if nMoney2 ~= -1 and nMoney2 ~= nil then
						tinsert(strtab,"Ta mu�n nh�y qua nhi�m v� n�y["..v.name.."]/#tGtNpcMain:skip_task_talk("..i..","..nMoney2..")");
					end
					--end
				end
			end
		else --��û�ӻ��Ѿ����
			local nTaskIdResult = tGtCondition:check_taskid(i,1);
			if nTaskIdResult == nil then --��û��ɣ��Ǿ��ǿ��Խ�
				SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,i); --���������id������ʱ������Ϊ�������ǰ���������
				local nConditionResult = v.data[2](); --ǰ������
				if nConditionResult ~= nil and tGtNpcInfo[i].from_npc == sNpcName then --����ǰ������
					if tonumber(tGtNpcInfo[i].data[1]) == 1 then --�������
						if tGtTask:get_ex_task(i) == 0 then --��û�н��������
							tinsert(strtab,v.name.."(c� th� nh�n)/#tGtNpcMain:start_task("..i..",2)");
						end
					else
						if tGtTask:CheckRoute(i) == 1 then
							tinsert(strtab,v.name.."(c� th� nh�n)/#tGtNpcMain:start_task_talk("..i..",1)");
						end
					end
				end
			end
		end
	end
	
	return strtab;
end

function tGtNpcMain:LevelGtask(npcId)
	local script = GetNpcScript(npcId);
	if script == nil or script == "" then
		return
	end
	
	SetPlayerScript(script);
	SendScript2VM(script,"main()");
end

--npc�Ի�����
function tGtNpcMain:npc_main(sNpcName,sNpcTalk)
	sNpcName = sNpcName or GetTargetNpcName();
	----------------------------------------------------------
	--���⴦��
	--����ID1������500�����ͼ�򷵻�
	if sNpcName == "Ch� t�u l�u" then
		local nMapId,nMapX,nMapY = GetWorldPos();		
	  if nMapId ~= 500 then
			return 1;
		end
	end
	--����ID65������6017�����ͼ�򷵻�
	if sNpcName == "Nh�m Ng� H�nh" and tGtTask:check_cur_task(65) == 1 then
		local nMapId,nMapX,nMapY = GetWorldPos();		
	  if nMapId ~= 6017 then
			return 1;
		end
	end
	--����ID15������6012�����ͼ����
	if sNpcName == "V� Danh T�ng" and tGtTask:check_cur_task(15) == 1 then 
		local nMapId,nMapX,nMapY = GetWorldPos();
		if nMapId ~= 6012 then
			return 1;
		end
	end
	--����ID150������6073�����ͼ����
	if sNpcName == "S�i Ho�ng Nhi" and tGtTask:check_cur_task(150) == 1 then
		local nMapId,nMapX,nMapY = GetWorldPos();
		if nMapId ~= 6073 then
			return 1;
		end
	end
	--����ID151������404�����ͼ����
	if sNpcName == "S�i Ho�ng Nhi" and tGtTask:check_cur_task(152) == 1 then
		local nMapId,nMapX,nMapY = GetWorldPos();
		if nMapId ~= 404 then
			return 1;
		end
	end
	if sNpcName == "Th��ng �ng" and 
		GetWorldPos() == 8010 and
		(tGtTask:check_cur_task(244) == 1 or tGtTask:check_cur_task(245) == 1 or tGtTask:check_cur_task(246) == 1) then
		local bRet, szName = IsNpcChangeModel(PIdx2NpcIdx());
		if not szName or szName ~= "Th��ng �ng" then
			Say("H�y d�ng Chu�ng Bi�n Th�n �� bi�n th�nh Th��ng �ng sau �� ��i tho�i!", 0);
			return 0;
		end
	end
	----------------------------------------------------------
	sNpcTalk = sNpcTalk or "C�c h� c� vi�c g� kh�ng?";
	self:get_main_table(sNpcName);

	local strtab = tGtNpcMain:HaveTaskInGTask(sNpcName);

	local strLevel = format("Ta c�n x� l� nh�ng vi�c kh�c/#tGtNpcMain:LevelGtask(%d)",GetTargetNpc());
	if getn(strtab) ~= 0 then
		tinsert(strtab,strLevel);
		Say("<color=green>"..sNpcName.."<color>: "..sNpcTalk,
			getn(strtab),
			strtab)
	else
		return 1
	end

	return nil
end

--npc��Ϊ��Ʒ�ĶԻ�����
function tGtNpcMain:item_main(sItemName,sItemTalk)
	if not sItemName or sItemName == "" then
		return nil;
	end
	sItemTalk = sItemTalk or "C�c h� c� vi�c g� kh�ng?";
	self:get_main_table(sItemName);

	local strtab = tGtNpcMain:HaveTaskInGTask(sItemName);

	if getn(strtab) ~= 0 then
		Say("<color=green>"..sItemName.."<color>: "..sItemTalk,
			getn(strtab),
			strtab)
	else
		return 1
	end

	return nil	
end

--�Ի��ַ�������
function tGtNpcMain:dialog_string_deal(dialog_str,sNpcName)
	sNpcName = sNpcName or GetTargetNpcName();
	dialog_str = gsub(dialog_str,"NpcName","<color=green>"..sNpcName.."<color>");
	dialog_str = gsub(dialog_str,"PlayerName","<color=green>"..GetSafeName().."<color>");
	local strSex = gf_GetPlayerSexName();
	dialog_str = gsub(dialog_str,"<sex>",strSex);
	if GetSex() == 1 then
		strSex = "Tha";
	elseif GetSex() == 2 then
		strSex = "Ng��i ch�i";
	else
		strSex = "�nh/ch�";
	end;
	dialog_str = gsub(dialog_str,"<person>",strSex);
	if GetSex() == 1 then
		strSex = "Huynh ��";
	elseif GetSex() == 2 then
		strSex = "Huynh mu�i";
	else
		strSex = "Huynh ��/Huynh mu�i";
	end;
	dialog_str = gsub(dialog_str,"<bro_sis>",strSex);
	if GetSex() == 1 then
		strSex = "S� huynh ��";
	elseif GetSex() == 2 then
		strSex = "S� huynh mu�i";
	else
		strSex = "S� huynh ��/ S� huynh mu�i";
	end;
	dialog_str = gsub(dialog_str,"<tbro_tsis>",strSex);
	return dialog_str
end

--����Ի�
--nNpcTabIdx == TaskID
function tGtNpcMain:start_task_talk(nNpcTabIdx,nDialogNum)
	local nTaskTotal = tGtTask:check_task();
	if nTaskTotal == 0 then
		Talk(1,"","Nhi�m v� �� nh�n �� ��y, h�y gi�i quy�t r�i h�ng quay l�i nh�n th�m");
		return 0;
	end
	local nRoomWeight = tGtNpcInfo[nNpcTabIdx]["data"][6];
	if nRoomWeight ~= "" and nRoomWeight ~= nil then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 0;
		end
	end
	local strDialog = tGtNpcInfo[nNpcTabIdx]["get_talk"][nDialogNum];
	if strDialog == "" or strDialog == nil then
		tGtNpcMain:start_task(nNpcTabIdx,1);
	else
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nNpcTabIdx].from_npc);
		Talk(1,"#tGtNpcMain:start_task_talk("..nNpcTabIdx..","..(nDialogNum+1)..")",strDialog);
	end
end

--��������
--nTypeΪ1ʱ��ʾ��ͨ����Ϊ2ʱ��ʾ����������
function tGtNpcMain:start_task(nNpcTabIdx,nType)
	local nTaskTotal = tGtTask:check_task();
	if nTaskTotal == 0 then
		Talk(1,"","Nhi�m v� �� nh�n �� ��y, h�y gi�i quy�t r�i h�ng quay l�i nh�n th�m");
		return 0;
	end	
	if nType == 2 then
		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx);
		tGtNpcInfo[nNpcTabIdx]["data"][4]();  --action
	elseif nType == 1 then --and nNpcTabIdx > 260 then		--2011������Ƭ
		--tGtTask:set_task(1,nNpcTabIdx)
		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx); --�˴�����Ϊ��action�������Ĵ���
		SetTask(2956, nNpcTabIdx);
		--print("GetTask(2956) = ",GetTask(2956))
		--print("Open(\"TaskFace\","..nNpcTabIdx..",1)")
		--AcceptTask(nNpcTabIdx);
		SendScript2Client("Open(\"TaskFace\","..nNpcTabIdx..",1)");
--	elseif nType == 1 and nNpcTabIdx < 261 then		--2011˫����а
--		tGtTask:set_task(1,nNpcTabIdx);
--		SetTaskTemp(tGtTask.GT_TEMP_TASK_ID,nNpcTabIdx); --�˴�����Ϊ��action�������Ĵ���
--		tGtNpcInfo[nNpcTabIdx]["data"][4]();
--		if tonumber(tGtNpcInfo[nNpcTabIdx].data[1]) == 1 then --�������
--			local nExTaskID = GetTaskTemp(tGtTask.GT_TEMP_RAND_ID);
--			tGtTask:set_ex_task(nNpcTabIdx,nExTaskID);
--		end
--		local strTip = tGtNpcInfo[nNpcTabIdx]["get_talk"].tip;
--		if strTip ~= nil and strTip ~= "" then 
--			TaskTip(strTip);
--		end
	end
	
end

--�������Ի�
function tGtNpcMain:finish_task_talk(nNpcTabIdx,nDialogNum)
	local nRoomWeight = tGtNpcInfo[nNpcTabIdx]["data"][7];
	if nRoomWeight ~= "" then
		local strArray = split(nRoomWeight,";");
		if gf_Judge_Room_Weight(tonumber(strArray[1]),tonumber(strArray[2]),"") ~= 1 then
			return 0;
		end
	end
	local strDialog = tGtNpcInfo[nNpcTabIdx]["finish_talk"][nDialogNum];
	if strDialog == "" or strDialog == nil then
		self:finish_task(nNpcTabIdx);
	else
		strDialog = tGtNpcMain:dialog_string_deal(strDialog,tGtNpcInfo[nNpcTabIdx].to_npc);
		Talk(1,"#tGtNpcMain:finish_task_talk("..nNpcTabIdx..","..(nDialogNum+1)..")",strDialog);
	end
end

--���������
function tGtNpcMain:finish_task(nNpcTabIdx)
	SetTask(2956, nNpcTabIdx);
	SendScript2Client("Open(\"TaskFace\","..nNpcTabIdx..",2)");
end

--δ�������Ի�
function tGtNpcMain:UnFinishTask(nTaskID)
	if tGtNpcInfo[nTaskID]["get_talk"].unFinish ~= nil and tGtNpcInfo[nTaskID]["get_talk"].unFinish ~= "" then
		local strDialog = tGtNpcMain:dialog_string_deal(tGtNpcInfo[nTaskID]["get_talk"].unFinish, sNpcName)
		Talk(1, "", strDialog)
	else
		Talk(1, "", "Nhi�m v� n�y v�n ch�a ho�n ")
	end
end

function tGtNpcMain:cancel_main(nTaskID)
	if tGtNpcInfo[nTaskID] == nil then
		local strName = "";
		for i = 3,TABLE_GT_MAIN:getRow() do
			if nTaskID == tonumber(TABLE_GT_MAIN:getCell(i,2)) then
				strName = TABLE_GT_MAIN:getCell(i,4);
				break;
			end
		end
--		if strName == "" then
--			return 0;
--		else
			tGtNpcMain:get_main_table(strName);
--		end
	end
	local nConditionResult = tGtNpcInfo[nTaskID].data[3](); --�������
	if GetTime() - GetTask(TASK_GT_TASK_CANCEL_TIME) < 60 then
		Talk(1,"","Gi�n c�ch th�i gian 2 l�n h�y nhi�m v� l� 1 ph�t!");
		return 0;
	end
	if nConditionResult ~= nil then --�����������
		if tGtTask:trigger_finish_state(nTaskID) == 1 then --and (nTaskID <= 282 or nTaskID >= 293) then --������������
			Talk(1,"","Nhi�m v� n�y �� ho�n th�nh, c�c h� kh�ng c�n h�y nhi�m v� n�y!");
			return 0;
		else
			local strFromNpc = tGtNpcInfo[nTaskID].from_npc;
			local	strToNpc = tGtNpcInfo[nTaskID].to_npc;
--			if nTaskID ~= 263 and nTaskID ~= 274  and nTaskID ~= 495 and strFromNpc ~= "�Ǻ�" and strToNpc ~= "�Ǻ�" and strFromNpc ~= "��������" and strToNpc ~= "��������" and strFromNpc ~= "��־ǿ" and strToNpc ~= "��־ǿ" and strFromNpc ~= "�پ�����" and strToNpc ~= "�پ�����" and strFromNpc ~= "���ལ������" and strToNpc ~= "���ལ������"  then	--�������ϰ� XOXO �Ǻ�
				local nMoney1 = tonumber(tGtNpcInfo[nTaskID].data[8]);
				if nMoney1 ~= -1 and nMoney1 ~= nil then
					tGtNpcMain:cancel_task_talk(nTaskID,nMoney1);
				else
					Talk(1,"","Nhi�m v� n�y kh�ng th� b�!");
				end
--			else
--				Talk(1,"","�����񲻿ɷ�����");
--			end
		end
	else
		local strFromNpc = tGtNpcInfo[nTaskID].from_npc;
		local	strToNpc = tGtNpcInfo[nTaskID].to_npc;
--		if nTaskID ~= 263 and nTaskID ~= 274  and nTaskID ~= 495 and strFromNpc ~= "�Ǻ�" and strToNpc ~= "�Ǻ�" and strFromNpc ~= "��������" and strToNpc ~= "��������" and strFromNpc ~= "��־ǿ" and strToNpc ~= "��־ǿ" and strFromNpc ~= "�پ�����" and strToNpc ~= "�پ�����" and strFromNpc ~= "���ལ������" and strToNpc ~= "���ལ������"  then	--�������ϰ� XOXO �Ǻ�
			local nMoney1 = tonumber(tGtNpcInfo[nTaskID].data[8]);
			if nMoney1 ~= -1 and nMoney1 ~= nil then
				tGtNpcMain:cancel_task_talk(nTaskID,nMoney1);
			else
				Talk(1,"","Nhi�m v� n�y kh�ng th� b�!");
			end
--		else
--			Talk(1,"","�����񲻿ɷ�����");
--		end		
	end
end

--ȡ������Ի�
function tGtNpcMain:cancel_task_talk(nTaskID,nMoney)
	if nMoney == 0 then
		tGtNpcMain:cancel_task_confirm(nTaskID,nMoney);
		return
	end
	local strMoney = gf_GetMoneyString(nMoney);
	Say("H�y nhi�m v� n�y c�n ti�u hao<color=yellow>"..strMoney.."<color>, x�c ��nh mu�n h�y?",
		2,
		"\n��ng r�i, ta mu�n h�y/#tGtNpcMain:cancel_task_confirm("..nTaskID..","..nMoney..")",
		"\nK�t th�c ��i tho�i/nothing")
end

--ȷ��ȡ������
function tGtNpcMain:cancel_task_confirm(nTaskID,nMoney)
	if GetCash() < nMoney then
		Talk(1,"","V�ng mang tr�n ng��i kh�ng ��.");
		return 0;
	end
	if Pay(nMoney) == 1 or nMoney == 0 then
		tGtTask:remove_trigger(nTaskID);
		tGtTask:set_task(3,nTaskID);
		KillFollower();--�Ѹ���npc�ɵ�
		
		--ɾ���������
		--����ǰ�������߻��趨��ɾ�����Ի�
		tGtCondition:del_item_force(tGtNpcInfo[nTaskID]["data"][10])
	
		SetTask(TASK_GT_TASK_CANCEL_TIME,GetTime());
		if tGtNpcInfo[nTaskID].from_npc and strlen(tGtNpcInfo[nTaskID].from_npc) > 0 then
			Msg2Player("Nhi�m v� c�a c�c h� �� h�y. C� th� t�m["..tGtNpcInfo[nTaskID].from_npc.."]�� nh�n l�i nhi�m v� n�y!");
			Talk(1,"","Nhi�m v� c�a c�c h� �� h�y. C� th� t�m["..tGtNpcInfo[nTaskID].from_npc.."]�� nh�n l�i nhi�m v� n�y!");
		else
			Msg2Player("Nhi�m v� c�a c�c h� �� h�y.");
			Talk(1,"","Nhi�m v� c�a c�c h� �� h�y.");
		end
		---------------------------�����������⴦��---------------
		--��3���鿴�������
		if nTaskID == 3 then 
			SetTask(Task_id_003,0)
		end
		--��12����Ȱ���
		if nTaskID == 12 then
			SetTask(Task_id_004,0)
			DelItem(2,0,30010,GetItemCount(2,0,30010) or 1)
			AddItem(2,0,30010,1)				
		end
		--��40��ɱ��������
		if nTaskID == 40 then
			SetTask(Task_id_005,0)
		end
		--��68���ջ�����
		if nTaskID == 68 then
			SetTask(Task_id_006,0)
			SetTask(Task_id_012,0)
		end
		--��69��Ӫ����Ӧ
		if nTaskID == 69 then
			SetTask(Task_id_007,0)
		end
		--��70�����ط���
		if nTaskID == 70 then
			SetTask(Task_id_008,0)
			SetTask(Task_id_009,0)
			SetTask(Task_id_010,0)
			SetTask(Task_id_013,0)
			SetTaskTemp(250,0);
			SetNpcLifeTime(GetTask(Task_id_011),0)
			SetTask(Task_id_011,0)
			RemoveTrigger(GetTrigger(1267*2));
			RemoveTrigger(GetTrigger(1268*2));
			RemoveTrigger(GetTrigger(1269*2));
			RemoveTrigger(GetTrigger(1270*2));
			RemoveTrigger(GetTrigger(1271*2));
			RemoveTrigger(GetTrigger(1272*2));
			RemoveTrigger(GetTrigger(1518*2));
			RemoveTrigger(GetTrigger(3007*2));
			DelItem(2,0,30040,GetItemCount(2,0,30040) or 1)		
			SetMapTaskTemp(6017,Map_Glb_Valve,GetMapTaskTemp(6017,Map_Glb_Valve)-1);
		end
		--��72�����ܶ�������
		if nTaskID == 72 then
--			SetNpcLifeTime(GetTask(Task_id_013),0);
--			SetNpcLifeTime(GetTask(Task_id_014),0);
--			SetNpcLifeTime(GetTask(Task_id_015),0);
--			SetTask(Task_id_013,0)
--			SetTask(Task_id_014,0)
--			SetTask(Task_id_015,0)
		end
		----------------------------------------------------------
	end
end   

--��������Ի�
function tGtNpcMain:skip_task_talk(nTaskID,nMoney)
	local strMoney = gf_GetMoneyString(nMoney);
	Say("B� qua nhi�m v� n�y c�n ti�u hao <color=yellow>"..strMoney.."<color>, x�c ��nh mu�n b� ch�?",
		2,
		"\n��ng, ta mu�n b� qua/#tGtNpcMain:skip_task_confirm("..nTaskID..","..nMoney..")",
		"\nK�t th�c ��i tho�i/nothing")
end

--ȷ����������
function tGtNpcMain:skip_task_confirm(nTaskID,nMoney)
	if GetCash() < nMoney then
		Talk(1,"","V�ng mang tr�n ng��i kh�ng ��.");
		return 0;
	end
	if Pay(nMoney) == 1 then
		tGtNpcMain:finish_task(nTaskID);
	end
end

--�����������ʾ
function tGtNpcMain:ShowAward(nTaskID)
	local TaskName = nil
	local strPrize = nil
	for i = 3,TABLE_GT_MAIN:getRow() do
		if nTaskID == tonumber(TABLE_GT_MAIN:getCell(i,2)) then
			TaskName = TABLE_GT_MAIN:getCell(i,1);
			strPrizeID = TABLE_GT_MAIN:getCell(i,9);
			bFlag = 1
			break;
		end
	end
	if not TaskName or not strPrizeID then
		return
	end
	local msg = "";
	local nCount = 0;
	while 1 do
		if nCount > 10 then
			break
		end
		local nIndex = strfind(strPrizeID, "&") or (strlen(strPrizeID) + 1);
		local nConditionID = tonumber(strsub(strPrizeID, 1, nIndex - 1))
		g_GtPrize = g_GtPrize or {}
		if not g_GtPrize[nConditionID] then
			g_GtPrize[nConditionID] = {};
			local nIDRow = TABLE_GT_PRIZE:selectRowNum(1,nConditionID);
			g_GtPrize[nConditionID][1] = TABLE_GT_PRIZE:getCell(nIDRow,2);
			for i = 3,8 do
				g_GtPrize[nConditionID][i-1] = TABLE_GT_PRIZE:getCell(nIDRow,i);
			end
			if tGtPrize.tPrizeType[g_GtPrize[nConditionID][1]] == nil then
				return nil;
			end
		end
		if g_GtPrize[nConditionID][1] == "Exp" then
			msg = msg..format("Exp:%s", g_GtPrize[nConditionID][2]).."\n"
		elseif g_GtPrize[nConditionID][1] == "Item" then
			local cIndex = nil
			local strItem = g_GtPrize[nConditionID][2];
			for i = 1, strlen(strItem) do
				if strsub(strItem, i, i) == "," then
					cIndex = i
				end
			end
			if not cIndex then
				msg = msg..format("��o c�: %s", g_GtPrize[nConditionID][3]).."\n"
			else
				local nNum = tonumber(strsub(strItem, cIndex + 1, strlen(strItem)))
				msg = msg..format("��o c�: %s*%d", g_GtPrize[nConditionID][3], nNum).."\n"
			end
		elseif	g_GtPrize[nConditionID][1] == "Money" then
			msg = msg..format("V�ng: %d v�ng", tonumber(g_GtPrize[nConditionID][2])/10000).."\n"
		elseif	g_GtPrize[nConditionID][1] == "ZhenQi" then
			msg = msg..format("Ch�n kh�: %s", g_GtPrize[nConditionID][2]).."\n"
		end
		if nIndex + 1 > strlen(strPrizeID) then
			break
		end
		strPrizeID = strsub(strPrizeID, nIndex + 1, strlen(strPrizeID)) 
		nCount = nCount + 1	
	end 
	Talk(1,"",format("Ho�n th�nh nhi�m v� [<color=gold>%s<color>] nh�n ���c ph�n th��ng:\n<color=green>%s<color>", TaskName, msg))
end

--=======================��������====================================
tGtCondition = {};

--�������IDΪnTaskID������״̬
--nValueΪ1��ʾ����Ƿ��Ѿ���ɸ�����Ϊ0��ʾδ�Ӹ�����һ�����ڷ�֧ѡ�񣩣�2��ʾ�Ƿ����
function tGtCondition:check_taskid(nTaskID,nValue)
	nTaskID = tonumber(nTaskID);
	nValue = tonumber(nValue);
	if nTaskID == nil or nValue == nil then
		return nil;
	end
	local nTabIdx,nBit = 0,0;
	nTabIdx = ceil(nTaskID/31);
	nBit = mod(nTaskID,31);
	if nBit == 0 then
		nBit = 31;
	end
	local nResult = gf_GetTaskBit(tGtTask.tGtTaskID[nTabIdx],nBit);
	if nValue == 1 and nResult == nValue then
		return 1;
	elseif nValue == 0 then
		local nCheckCurTask = tGtTask:check_cur_task(nTaskID);
		if nCheckCurTask == 1 or nResult == 1 then --���˸�������߸������Ѿ����
			return nil;
		else
			return 1;
		end
	elseif nValue == 2 then
		local nCheckCurTask = tGtTask:check_cur_task(nTaskID);
		if nCheckCurTask == 1 and nResult == 0 then
			return 1;
		else
			return nil;
		end
	end
	return nil;
end

--�����ҵȼ��Ƿ���ڵ���nValue
function tGtCondition:check_lv(nValue, nReborn)
	nValue = tonumber(nValue) or 9999;
	nReborn = tonumber(nReborn) or 0;
	local nNeedLv = nReborn * 100 + nValue;
	local nCurrLv = gf_GetPlayerRebornCount() * 100 + GetLevel();
	if nCurrLv >= nNeedLv then
		return 1;
	else
		return nil;
	end
end

--�������������nValue1��ֵ��nValue2�Ĺ�ϵnValue3
function tGtCondition:check_tv(nValue1,nValue2,nValue3)
	nValue1 = tonumber(nValue1);
	nValue2 = tonumber(nValue2);
	nValue3 = tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil or nValue3 == nil then
		return nil;
	end
	return ((1 == nValue3 and GetTask(nValue1) == nValue2) or
	        (2 == nValue3 and GetTask(nValue1) >  nValue2) or
	        (3 == nValue3 and GetTask(nValue1) >= nValue2) or
	        (4 == nValue3 and GetTask(nValue1) <  nValue2) or
	        (5 == nValue3 and GetTask(nValue1) <= nValue2) or
	        (6 == nValue3 and GetTask(nValue1) ~= nValue2));
end

--�����Ʒ
function tGtCondition:check_item(nID1,nID2,nID3,nNums,sName)
	nID1,nID2,nID3,nNums,sName = tonumber(nID1),tonumber(nID2),tonumber(nID3),tonumber(nNums),tostring(sName);
	if nID1 == nil or nID2 == nil or nID3 == nil or nNums == nil or sName == nil then
		return nil;
	end
	if GetItemCount(nID1,nID2,nID3) < nNums then
		return nil;
	else
		return 1;
	end
end

--���ǰһ�������Ƿ��Ѿ����
function tGtCondition:check_ex_task()
	local nTaskID = GetTaskTemp(tGtTask.GT_TEMP_TASK_ID);
	if nTaskID == 0 then
		return nil;
	else
		local nCheck = self:check_taskid(nTaskID-1,1);
		if nCheck == 1 then
			return 1;
		else
			return nil;
		end
	end
end

function tGtCondition:check_kill()
	return 1;
end

function tGtCondition:do_script()
	return 1;
end
--nValue Ϊ 1 ��֤���У�2ΪŮ
function tGtCondition:sex(nValue)
	nValue = tonumber(nValue);
	if nValue == 1 or nValue == 2 then
		local nSex = GetSex();
		if nSex == nValue then
			return 1
		end
	end

	return nil;
end

function tGtCondition:command(nValue)
	if nValue == "" then
		return nil;
	end

	dostring("return "..nValue);
end

function tGtCondition:_nil()
	return nil;
end

function tGtCondition:check_player_route(nValue)
	nValue = tonumber(nValue);	
	if nValue == 1 then --���������ɲſ��Խ�
		if gf_CheckPlayerRoute() ~= 1 then
			return 1
		else
			return nil
		end
	elseif nValue == 2 then --�������ɲſ��Խ�
		if gf_CheckPlayerRoute() == 1 then
			return 1
		else
			return nil
		end
	end

	return nil
end

--1����Ҫ�ڶ�����
--2����Ҫ���ڶ�����
function tGtCondition:is_in_team(nValue)
	nValue = tonumber(nValue);

	if 1 == nValue then
		return ((0 == GetTeamID()) and 0) or 1;
	end

	if 2 == nValue then
		return ((0 == GetTeamID()) and 1) or 0;
	end
end

--nKey 
--1������nLevel
--2������nLevel
--3�����ڵ���nLevel
--4��С��nlevel
--5��С�ڵ���nlLevel
function tGtCondition:check_meridian(sLevel, sKey)
	local nLevel = tonumber(sLevel);
	local nKey = tonumber(sKey);
	if nLevel < 0 or nLevel > 6 then
		return nil;
	end
	if nKey < 1 or nKey > 5 then
		return nil;
	end
	local nCurrentLevel = MeridianGetLevel();
	if nKey == 1 then
		if nCurrentLevel == nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 2 then
		if nCurrentLevel > nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 3 then
		if nCurrentLevel >= nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 4 then
		if nCurrentLevel < nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 5 then
		if nCurrentLevel <= nLevel then
			return 1;
		else
			return nil;
		end
	end
end

--nKey 
--1������nLevel
--2������nLevel
--3�����ڵ���nLevel
--4��С��nlevel
--5��С�ڵ���nlLevel
function tGtCondition:check_reborn(sLevel, sKey)
	local nLevel = tonumber(sLevel);
	local nKey = tonumber(sKey);
	if nLevel < 0 or nLevel > 7 then
		return nil;
	end
	local nCurrentLevel = gf_GetPlayerRebornCount();
	if nKey == 1 then
		if nCurrentLevel == nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 2 then
		if nCurrentLevel > nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 3 then
		if nCurrentLevel >= nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 4 then
		if nCurrentLevel < nLevel then
			return 1;
		else
			return nil;
		end
	end
	if nKey == 5 then
		if nCurrentLevel <= nLevel then
			return 1;
		else
			return nil;
		end
	end
end

function tGtCondition:check_exp(nExp)
	local nNeedExp = tonumber(nExp)
	if GetExp() < nNeedExp then
		return nil
	end
	return 1;
end

tGtCondition.tConditionType = {
	TaskID = tGtCondition.check_taskid,  --�������ID
	Lv = tGtCondition.check_lv,			--���ȼ�
	Item = tGtCondition.check_item,		--�����Ʒ
	Tv = tGtCondition.check_tv,			--����������ֵ
	ExTask = tGtCondition.check_ex_task,
	Killer = tGtCondition.check_kill,
	Sex = tGtCondition.sex,
	CheckPlayerRoute = tGtCondition.check_player_route,
	IsInTeam = tGtCondition.is_in_team,
	Script = tGtCondition.do_script,
	Meridian = tGtCondition.check_meridian,--��⾭���ȼ�
	Reborn = tGtCondition.check_reborn, --���ת���ȼ�
	Exp = tGtCondition.check_exp, --��⾭��
};

--��������ID���õ�����Type��ִ�ж�Ӧ����
function tGtCondition:check(nConditionID)
	g_GtCondition = g_GtCondition or {};
	if not g_GtCondition[nConditionID] then
		g_GtCondition[nConditionID] = {};
		local nIDRow = TABLE_GT_CONDITION:selectRowNum(1,nConditionID);
		g_GtCondition[nConditionID][1] = TABLE_GT_CONDITION:getCell(nIDRow,2);
		for i = 3,8 do
			g_GtCondition[nConditionID][i-1] = TABLE_GT_CONDITION:getCell(nIDRow,i);
		end
		if tGtCondition.tConditionType[g_GtCondition[nConditionID][1]] == nil then
			return nil;
		end
	end
	local nConditionType = g_GtCondition[nConditionID][1];
	return tGtCondition.tConditionType[nConditionType](self,g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5],g_GtCondition[nConditionID][6]);
end

--������������
function tGtCondition:get_sub(sExpression)
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:check(%1)");
	return sExpression
end

--����������ʽ���������1��nil
function tGtCondition:result(sExpression)
	sExpression = tGtCondition:get_sub(sExpression);
	dostring("nConditionResult = "..sExpression);
	return nConditionResult;
end

--����Action ID�������Ҫɾ������Ʒ
function tGtCondition:check_del_item(nConditionID)
	if g_GtCondition[nConditionID] ~= nil then
		if g_GtCondition[nConditionID][1] == "Item" then
			if DelItem(g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5]) == 1 then
				return 1;
			else
				return nil;
			end
		end
		if g_GtCondition[nConditionID][1] == "Exp" then
			local nExp = tonumber(g_GtCondition[nConditionID][2]);
			if GetExp() < nExp then
				return nil;
			end
			ModifyExp(-nExp);
			return 1;
		end
	end
	return 1;
end

--����Action ID�������Ҫɾ������Ʒ
function tGtCondition:force_del_item(nConditionID)
	--g_GtCondition����δ��ʼ��
	self:check(nConditionID);
	if g_GtCondition[nConditionID] ~= nil then
		if g_GtCondition[nConditionID][1] == "Item" then
			if BigDelItem(g_GtCondition[nConditionID][2],g_GtCondition[nConditionID][3],g_GtCondition[nConditionID][4],g_GtCondition[nConditionID][5]) == 1 then
				return 1;
			else
				return 2;
			end
		end
	end
	return 1;
end

--ǿ��ɾ���������
function tGtCondition:del_item_force(sExpression)
	if sExpression == "" or sExpression == nil then
		return 1;
	end
	sExpression = gsub(sExpression,"&"," ; ");
	sExpression = gsub(sExpression,"|"," ; ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:force_del_item(%1)");
	dostring(sExpression);
	return 0;
end

--����������������Ҫɾ������Ʒ��ִ��ɾ������
function tGtCondition:del_item_confirm(sExpression)
	if sExpression == "" or sExpression == nil then
		return 1;
	end
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtCondition:check_del_item(%1)");
	dostring("g_ret = "..sExpression);
	return g_ret;
end

--=========================Action & Prize����=============================
tGtPrize = {};

--����������
function tGtPrize:create_trigger(nValue1,nValue2,nValue3)
	if (nValue1 == nil and nValue2 == nil) or nValue3 == nil then
		return nil;
	end
	if tonumber(nValue1) == 1 and nValue3 == nil then
		return nil;
	end
	local TaskID = GetTaskTemp(tGtTask.GT_TEMP_TASK_ID);
	if TaskID == 0 then
		return nil;
	end
	local nTaskValue = tGtTask:get_task(TaskID); --��¼������ID���������
	local nTaskValue2 = nTaskValue+tGtTask.GLV_GT_TASK_NUM+1;
	local nCount = gf_GetTaskByte(nTaskValue2,2);
	gf_SetTaskByte(nTaskValue2,2,nCount+1);
	local nValue3 = tGtTask.GT_TRIGGER_OFFSET+TaskID*10+nCount+1; --�Զ���IDΪ����ID*10+4000ƫ����+������������
	local n = CreateTrigger(tonumber(nValue1),tonumber(nValue2),nValue3,1);
	if tonumber(nValue1) == 1 then
		ContinueTimer(n);
	end
end

--��������IDΪnValue1�����񣬲��ټ����������
function tGtPrize:task_next(nValue1)
	nValue1 = tonumber(nValue1);
	if nValue1 == nil then
		return nil;
	end
	tGtNpcMain:start_task_talk(nValue1,1);
end

--��������ID�͸��ʻ�ȡ����ID
function tGtPrize:rand_task(nValue1,nValue2)
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	local tTaskID = split(nValue1,";");
	local tIDrand = split(nValue2,";");
	local nTotal = 0;
	for i = 1,getn(tIDrand) do
		nTotal = nTotal + tonumber(tIDrand[i]);
	end
	local nRand = random(1,nTotal);
	local nCurRand = 0;
	local nTaskID = 0;
	for i = 1,getn(tIDrand) do
		nCurRand = nCurRand + tonumber(tIDrand[i]);
		if nRand <= nCurRand then
			nTaskID = tonumber(tTaskID[i]);
			break;
		end
	end
	if nTaskID ~= 0 and nTaskID ~= nil then
		SetTaskTemp(tGtTask.GT_TEMP_RAND_ID,GetTaskTemp(tGtTask.GT_TEMP_TASK_ID));
		tGtNpcMain:start_task_talk(nTaskID,1);
	end
end

--���辭��
function tGtPrize:give_exp(nValue1)
	if nValue1 == "" then
		return nil;
	end
	local nLv = GetLevel();
	nValue1 = gsub(nValue1,"Lv",nLv);
	dostring("gf_Modify('Exp',"..nValue1..")");
end
--��������
function tGtPrize:give_zhenqi(nValue)
	if nValue == "" then
		return nil;
	end
--	if tonumber(nValue) > 1000 then
--		print("WARN: \\script\\task\\global_task\\gtask_head.lua tGtPrize:give_zhenqi nValue > 1000")
--	end
	AwardGenuineQi(tonumber(nValue));
end
--������Ʒ
function tGtPrize:give_item(nValue1,nValue2,nValue3)
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	dostring("gAddFlag,gAddIdx = gf_AddItemEx({"..nValue1.."},'"..nValue2.."')");
	if nValue3 ~= "" then
		nValue3 = tonumber(nValue3);
		if gAddFlag == 1 then
			SetItemExpireTime(gAddIdx,nValue3);
		end
	end
	gAddFlag,gAddIdx = nil,nil
end

--���ñ���ֵ
function tGtPrize:set_task_value(nValue1,nValue2,nValue3)
	nValue1, nValue2, nValue3 = tonumber(nValue1), tonumber(nValue2), tonumber(nValue3);
	if nValue1 == nil or nValue2 == nil then
		return nil;
	end
	if nValue3 then
		SetTask(nValue1,nValue2);
	else
		SetTask(nValue1, nValue2 + GetTask(nValue1));
	end
end

--��Ǯ
function tGtPrize:give_money(nValue1)
	if nValue1 == "" then
		return nil;
	end
	dostring("gf_Modify('Money',"..nValue1..")");
end

--ִ��ĳ���ű����ĳ������
function tGtPrize:send_script(nValue)
	if nValue == "" then
		return nil;
	end
	dofile(nValue);
end

function tGtPrize:tong_score(nValue1)
	nValue1 = tonumber(nValue1);
	if nValue1 == nil then
		return nil;
	end
	ModifyPlayerCurWeekScore(nValue1);
	ModifyTongCurWeekScore(nValue1);
	Msg2Player("B�n nh�n ���c "..nValue1.."�i�m Th��ng Thi�n Ph�t �c!");
end

function tGtPrize:create_npc(nValue1,nValue2,nValue3,nValue4)
	nValue1,nValue2,nValue3 = tostring(nValue1),tostring(nValue2),tonumber(nValue3);
	if nValue1 == "" or nValue2 == "" then
		return nil;
	end
	nValue3 = nValue3 or 1;
	for i = 1,nValue3 do
		local nNpcIdx;
		local nMapId,nX,nY = GetWorldPos();
		local i = random(4);
		local j = random(4);
		local tbTemp = {2,-2,1,-1};
		nNpcIdx = CreateNpc(nValue1,nValue2,nMapId,nX+tbTemp[i],nY+tbTemp[j]);
		if nValue4 ~= "" and nValue4 ~= nil then
			SetNpcScript(nNpcIdx,nValue4)
		else
			SetNpcScript(nNpcIdx, "\\script\\task\\global_task\\gtask_npc.lua");
		end
		SetNpcLifeTime(nNpcIdx,3*60); --NpcĬ������ʱ��3min
	end
end

function tGtPrize:change_npc_to_fight()
	local nIndexNpc = GetTargetNpc();
	ChangeNpcToFight(nIndexNpc);
	local sNpcName = GetTargetNpcName();
	--change npc ���⴦��
	if sNpcName == "Bao tr��ng l�o" and tGtTask:check_cur_task(8) == 1 then
		SetNpcDeathScript(nIndexNpc,"\\script\\task\\npc\\������Death.lua");
		return 1;
	end
	if sNpcName == "Ho�ng Chung C�ng" and tGtTask:check_cur_task(50) == 1 then
		SetNpcDeathScript(nIndexNpc,"\\script\\task\\npc\\���ӹ�Death.lua");
		return 1;
	end
	------------------------
	SetNpcDeathScript(nIndexNpc,"\\script\\task\\global_task\\gtask_head.lua");
	return 1;
end

function OnDeath(nIndexNpc)
	SetNpcLifeTime(nIndexNpc,0);
end

--�����Ա�ѡ��
function tGtPrize:sex(tValue)
	local tTaskID = split(tValue, ";");
	if getn(tTaskID) == 2 then
		tGtNpcMain:start_task_talk(tonumber(tTaskID[GetSex()]), 1);
	end
end

function tGtPrize:newWorld(nValue1, nValue2, nValue3)
	--print("!!!newnew!!!")
	NewWorld(tonumber(nValue1), tonumber(nValue2), tonumber(nValue3));
end

function tGtPrize:add_stat_value(nValue1, nValue2)
	nValue2 = tonumber(nValue2)
	if nValue1 == "" then
		return nil;
	end

	dostring(format("AddStatValue('%s', %d)", nValue1, nValue2));
end

function tGtPrize:command(nValue1)
	if nValue1 == "" then
		return nil;
	end

	dostring(nValue1);
end

function tGtPrize:exec_func(szPath, szFunc)
	if szPath == "" or szFunc == "" then
		return nil;
	end
	SetPlayerScript(szPath);
	SendScript2VM(szPath, szFunc);
end

tGtPrize.tPrizeType = {
	Trigger = tGtPrize.create_trigger,  --����������
	Exp = tGtPrize.give_exp,			--���辭��
	Item = tGtPrize.give_item,		--������Ʒ
	Tv = tGtPrize.set_task_value,			--�����������ֵ
	Money = tGtPrize.give_money,			--����Ǯ
	TaskNext = tGtPrize.task_next,    --��ȡ����
	Rand = tGtPrize.rand_task,       --�������
	Script = tGtPrize.send_script,   --ִ��ĳ���ű����ĳ������
	Score = tGtPrize.tong_score,     --�������Ʒ���ֵ����ᣩ
	CrNpc = tGtPrize.create_npc,       --����npc
	ChangeNpc = tGtPrize.change_npc_to_fight,   --ת��ս��npc
	Sex = tGtPrize.sex,				--�ж��Ա�
	Stat = tGtPrize.add_stat_value,		--�������
	NewWorld = tGtPrize.newWorld,		--����
	--DelItem = tGtPrize.delItem,			--ɾ������֧��
	ZhenQi = tGtPrize.give_zhenqi,
	Command = tGtPrize.command,			--ִ�нű���������ʵ���Ͽ��Բ������沿�ֵ�������
	Function = tGtPrize.exec_func, 	--ִ�нű�����
};

--����Action ID���õ�Action Type��ִ�ж�Ӧ����
function tGtPrize:action_prize(nConditionID)
	g_GtPrize = g_GtPrize or {}
	if not g_GtPrize[nConditionID] then
		g_GtPrize[nConditionID] = {};
		local nIDRow = TABLE_GT_PRIZE:selectRowNum(1,nConditionID);
		g_GtPrize[nConditionID][1] = TABLE_GT_PRIZE:getCell(nIDRow,2);
		for i = 3,8 do
			g_GtPrize[nConditionID][i-1] = TABLE_GT_PRIZE:getCell(nIDRow,i);
		end
		if tGtPrize.tPrizeType[g_GtPrize[nConditionID][1]] == nil then
			return nil;
		end
	end
	local nConditionType = g_GtPrize[nConditionID][1];
	tGtPrize.tPrizeType[nConditionType](self,g_GtPrize[nConditionID][2],g_GtPrize[nConditionID][3],g_GtPrize[nConditionID][4],g_GtPrize[nConditionID][5],g_GtPrize[nConditionID][6],g_GtPrize[nConditionID][7]);
	return 1;
end

--������������
function tGtPrize:get_sub(sExpression)
	sExpression = gsub(sExpression,"&"," and ");
	sExpression = gsub(sExpression,"|"," or ");
	sExpression = gsub(sExpression,"(%d+)","tGtPrize:action_prize(%1)");
	return sExpression
end

--����������ʽ��ִ��
function tGtPrize:result(sExpression)
	sExpression = tGtCondition:get_sub(sExpression);
	dostring(sExpression);
end

