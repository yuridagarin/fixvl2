--npc��ΰ�սű�
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua")
--Include("\\script\\task\\world\\lizhi_Ȫ��\\18��\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_LEV_18_ID) == 1 then
            local nItemCount = 0;
        	
        	--�ٻ�����NPC
        	if GetTask(TASK_LEV_18_ID) == 1 then
        	    SummonNpc("B�t Ph� H� ��ng S�","Chung Th�");
        	    CreateTrigger(1, 195, 86);
                ContinueTimer(GetTrigger(86));
                
                CreateTrigger(3, 202, 87);
                SetLogType(GetTrigger(87), 1);
                
                CreateTrigger(2, 1303, 88); --��ֹ�����ʱ��ֹͣ��ʱ����

                SetTask(TASK_LEV_18_ID, 2);
        	
            	Msg2Player("Trong 90 gi�y, ��a Chung Th� v� c�nh Chung Ph�ng.");
            	TaskTip("Trong 90 gi�y, ��a Chung Th� v� c�nh Chung Ph�ng.");
            end;
        end;
        -- ��ȡ��ΰ�յ��غ�
        if GetTask(TASK_THREE) == 0 then
            nItemCount = GetItemCount(2, 0, 40);
            if (nItemCount == 0) then
                AddItem(2, 0, 40, 1);
            end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_LEV_18_ID) == 1 and nDist >= 0 and nDist <= 50 then
            	--�ٻ�����NPC
            	if GetTask(TASK_LEV_18_ID) == 1 then
            	    SummonNpc("B�t Ph� H� ��ng S�","Chung Th�");
            	    CreateTrigger(1, 195, 86);
                    ContinueTimer(GetTrigger(86));
                    
                    CreateTrigger(3, 202, 87);
                    SetLogType(GetTrigger(87), 1);
                    
                    --CreateTrigger(2, 1303, 88); --��ֹ�����ʱ��ֹͣ��ʱ����
                    
                    SetTask(TASK_LEV_18_ID, 2);
            	
                	Msg2Player("Trong 90 gi�y, ��a Chung Th� v� c�nh Chung Ph�ng.");
                	TaskTip("Trong 90 gi�y, ��a Chung Th� v� c�nh Chung Ph�ng.");
                end;
            end;
            -- ��ȡ��ΰ�յ��غ�
            if GetTask(TASK_THREE) == 0 then
                if GetItemCount(2, 0, 40) ==0 then
                    AddItem(2, 0, 40, 1);
                end;
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;
