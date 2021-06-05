Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\sdb.lua");
--Include("\\script\\lib\\talktmp.lua");
Include("\\script\\task\\global_task\\gtask_head.lua");

Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\2011TaskTemp\\temp.lua");
Include("\\script\\task\\world\\task_head.lua");

--�����ٻ���������
--�߻����󣺵����ٻ�����ʧ�����������ʱ�Ͻ�����������������������ٻ����Ĺ������ʱ��5���ӣ�����ʹ�ü��2���ӡ�ʹ�û�����ʾ���õ���ÿ2���Ӳſ�ʹ��һ�Σ�
--����
	--1��nItemIndex
	--2��nGtask			gtask�е�����ID
	--3��nTimeTaskID	������¼��һ��ʹ�õ�ʱ���TaskID
	--4��tNpc				�ٻ�Npc����Ϣ
		--{
			--[1] npc��ģ����,
			--[2] npc������,
			--[3] �ٻ���λ��,
			--[4] npc�����ű�,
			--[5] npc����(1,�Ի� 2,ս��),
			--[6] npc����ʱ��,
		--}
	--5�����ʱ��
--����ֵ
	--1���ɹ�
	--2��û�нӵ�����
	--3��CDʱ��ľ�е�
	--4�������Ѿ����
function UseItemToCallNpc(nItemIndex, nGtask, nTimeTaskID, tNpc, nNextTime)
	return CallSpclNpc(nGtask, nTimeTaskID, tNpc, nNextTime);
end


function CallSpclNpc(nGtask, nTimeTaskID, tNpc, nNextTime)
	if tGtCondition:check_taskid(nGtask, 2) == nil then
		return 2 
	end
	
	if nNextTime == nil then
		nNextTime = 2
	end
	
	local nNowTime = tonumber(date("%m%d%H%M"));
	local nLastTime = GetTask(nTimeTaskID);
	if nLastTime == 0 then
		SetTask(nTimeTaskID, nNowTime);
	elseif nLastTime == 1 then
		return 4
	else
		if nNowTime - nLastTime < nNextTime then	--2����
			return 3
		else
			SetTask(nTimeTaskID, nNowTime);
		end
	end
	
	local nNpcIdx = 0;
	if tNpc[3] == 1 then
		nNpcIdx = CreateNpc(tNpc[1], tNpc[2], GetWorldPos());	
	else
		nNpcIdx = CreateNpc(tNpc[1], tNpc[2], tNpc[3][1], tNpc[3][2], tNpc[3][3]);	
	end

	if tNpc[4] ~= nil and tNpc[4] ~= "" then
		SetNpcScript(nNpcIdx, tNpc[4]);
	end
	
	if tNpc[5] == 1 then
		ChangeNpcToFight(nNpcIdx, 0, 6);
	elseif tNpc[5] == 2 then
		ChangeNpcToFight(nNpcIdx);
	end
	
	SetNpcLifeTime(nNpcIdx, tNpc[6]);
	
	return 1
end

--�Ի���changeNpc����
--�߻����󣺶Ի���ԭ��Npc��Ϊս��״̬��5���Ӻ��Զ���ʧ��5S����ԭ��λ��ˢ��ԭ�жԻ�Npc����������ȫ�����óɿɷ������񣬲�������������������һ��(����Ϊδ֪ԭ���������޷���ɣ������Է������������½�ȡ��
function ChangeNpcToFightForGtask(nNpcIdx)
	ChangeNpcToFight(nNpcIdx);
	SetNpcLiftTime(nNpcIdx, 5*60);		--�����
end