-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC������Script
-- By StarryNight
-- 2006/01/11 PM 16:12

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV60_ID) == 3 then
        	SetTask(TASK_DL_LV60_ID, 4);
        	Msg2Player("��nh b�i Xi H�a �c t�ng, tr� v� t�m ��ng Gi� La!");
        	TaskTip("��nh b�i Xi H�a �c t�ng, tr� v� t�m ��ng Gi� La!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV60_ID) == 3 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV60_ID, 4);
           	Msg2Player("��nh b�i Xi H�a �c t�ng, tr� v� t�m ��ng Gi� La!");
           	TaskTip("��nh b�i Xi H�a �c t�ng, tr� v� t�m ��ng Gi� La!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;