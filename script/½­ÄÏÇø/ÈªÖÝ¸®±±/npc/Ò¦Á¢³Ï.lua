--npcҦ���Ͻű�
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua")
Include("\\script\\task\\world\\lizhi_Ȫ��\\12��\\task_main.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_LEV_10_ID) == 2 then
        	SetTask(TASK_LEV_10_ID, 3);
        	Msg2Player("Tr� s� s�ch cho V��ng Nghi�p V�");
        	TaskTip("Tr� s� s�ch cho V��ng Nghi�p V�");
        	AddItem(2, 0, 32, 1);
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_LEV_10_ID) == 2 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_LEV_10_ID, 3);
            	Msg2Player("Tr� s� s�ch cho V��ng Nghi�p V�");
            	TaskTip("Tr� s� s�ch cho V��ng Nghi�p V�");
            	AddItem(2, 0, 32, 1);
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;
