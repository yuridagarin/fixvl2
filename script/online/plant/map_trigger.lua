Include("\\script\\online\\plant\\tree_head.lua");
--note:07��2��9������ȡ��������ʱ�����ƣ�������ͼ��Ϊ�����гͷ�����
function EnterMap()
	SetDeathScript("");
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);
	Create_Map_Trigger();
	if checktime() == 1 and checkplace() == 1 then
		--SetDeathPunish(0);
		--Msg2Player("������ֲ��ͼ�������ｫ�����������ͷ�");
	end;
end;

function LeaveMap()
	if checkplace() == 1 then
		--Msg2Player("�뿪��ֲ��ͼ���ָ������ͷ�");
	end;
	if GetTime() - GetTask(TASK_PLANTTIME) > TREELIFETIME then	--����뿪��ͼ��ʱ��������Ȼ����
		SetTask(TASK_TREEINDEX,0);	--
	end;
	local npcIndex = GetTask(TASK_TREEINDEX);
	if npcIndex > 0 then	--����뿪��ͼ��ʱ����������
		SetNpcScript(npcIndex,"");
		SetNpcLifeTime(npcIndex,0);
	end;
	SetDeathScript("");	--���������ű�Ϊ��
	SetTask(TASK_TREEINDEX,0);	--
	SetTask(TASK_TREEGROW,0);	--
	SetTask(TASK_PLANTTIME,0);	
	--SetDeathPunish(1);

	Create_Map_Trigger();
end;
