
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �������ͷ�ļ�
-- Edited by peres
-- 2005/08/08 PM 13:45

-- ֻ��������������һ���
-- ����������ӵ����
-- ������ָ��Ƥ��
-- ���������������������ʹ
-- ���룬�����ǰ���
-- �����뱧Թʲô
-- ÿ���������Ƕ�������
-- ����֪�����������ֽӴ������İ�ȫ�к���ů�����ܴ�����ȡ��
-- ��ϲ����һ˲�䡣�·��ںڰ��Ĵ��ϣ�Ư������ľ�ͷ

-- ======================================================

-- �����������ͷ�ļ�
Include("\\script\\task\\random\\task_head.lua");

function main()

local nState = GetTask(TASKSTATE_ID);
	
local nTaskType = GetTask(TASKTYPE_ID);
local nTask     = GetTask(TASKID_ID);
local tabTask   = GetTaskTableFile(nTaskType);
local nRow      = tabTask:selectRowNum("TaskID", nTask);

local strInfo   = tabTask:getCell(nRow, "TaskText");
local strName = GetTargetNpcName();

if nState == 0 then
	WriteLog("[L�i nhi�m v� s� m�n]:incept_npc.lua L�i th�ng s� tr�ng th�i nh�n v�t, nState b�ng 0 T�n nh�n v�t:"..GetName())
end;

if strName==nil or strName=="" then strName = ""; end;

	-- ����ǽ��е�����ĵ�һ�������������������Ϣ
	if nState==1 then
		RemoveTrigger(GetRunningTrigger()); -- ɾ����ǰ�������еĴ�����
		CDebug:MessageOut("Ho�n th�nh ��i tho�i nh�n v�t!");
		ShowTask();
		return
	end;
	
	-- ����Ѿ������� NPC ��������ʼ��������Ƿ����
	if nState==2 then
		if CheckTask()==1 then
			RemoveTrigger(GetRunningTrigger()); -- ɾ����ǰ�������еĴ�����
			CDebug:MessageOut("Ho�n th�nh ��i tho�i nh�n v�t!");
			FinishTask();
		else
			-- û���������Ļ������֮ǰ��������Ϣ�Ի�
			Say("<color=green>"..strName.."<color>: "..strInfo, 0);
		end;
		return
	end;
	RemoveTrigger(GetRunningTrigger()); -- ɾ����ǰ�������еĴ�����
end;