--boss�Ľű�
--created by lizhi
--2005-9-19 17:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");

function OnDeath(index)
	--ֻҪ��ɱ������ʧ�������Ƿ񱻱���ɱ��
	local npcIndex = tonumber(index);
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    --ɱ��boss�����ٻ�������
    if nMemCount == 0 then -- ���δ���
	    if npcIndex == GetTask(TASK_NPC_INDEX) and npcIndex ~= 0 then
	        --���䣬����ͼ
	        if random(1, 100) >= 50 then
	        	local nIndex = GetTask(TASK_BOSS_INDEX);
	        	AddItem(boss_drop_table[nIndex][1],boss_drop_table[nIndex][2],boss_drop_table[nIndex][3],1,1);
	        else
	        	AddItem(2, 0, 225, 2, 1);		--��ȯ
	        end;
	        --���ɱ��������ħ���򷢹���
	        if GetTask(TASK_BOSS_INDEX) == 9 then
	        	AddGlobalNews(GetName().."Ho�t ��ng cu�i tu�n ch�ng gi�c th�nh c�ng gi�t ���c T�y Ma");
	        end;
	        
	        SetTask(TASK_NPC_INDEX, 0);
	        SetTask(TASK_BOSS_INDEX, 0);
			--ɾ��boss��rect������
			RemoveTrigger(GetTrigger(time_boss_table[2]))
			RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
			RemoveTrigger(GetTrigger(log_boss_table[2]));
	    end;
	else
		for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if npcIndex == GetTask(TASK_NPC_INDEX) and npcIndex ~= 0 and nDist >= 0 and nDist <= 50 then
				--���䣬����ͼ
				if random(1, 100) >= 50 then
		        	local nIndex = GetTask(TASK_BOSS_INDEX);
		        	AddItem(boss_drop_table[nIndex][1],boss_drop_table[nIndex][2],boss_drop_table[nIndex][3],1,1);
		        else
		        	AddItem(2, 0, 225, 2, 1);		--��ȯ
		        end;
				--���ɱ��������ħ���򷢹���
		        if GetTask(TASK_BOSS_INDEX) == 9 then
		        	AddGlobalNews(GetName().."v� ��ng ��i trong ho�t ��ng cu�i tu�n ch�ng gi�c th�nh c�ng gi�t ���c T�y Ma");
		        end;
		        SetTask(TASK_NPC_INDEX, 0);
		        SetTask(TASK_BOSS_INDEX, 0);
				--ɾ��boss��rect������
				RemoveTrigger(GetTrigger(time_boss_table[2]))
				RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
				RemoveTrigger(GetTrigger(log_boss_table[2]));
			end;
		end;
	end;
	PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
end;