-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC�γж�Script
-- By StarryNight
-- 2006/01/13 PM 20:37

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV80_ID) == 1 then
        	SetTask(TASK_DL_LV80_ID, 2);
        	Msg2Player("�� ��nh b�i �o�n Th�a �n, ch�c ch�n Nh� Ho�ng T� � g�n ��y th�i.");
        	TaskTip("�� ��nh b�i �o�n Th�a �n, ch�c ch�n Nh� Ho�ng T� � g�n ��y th�i.");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 1 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 2);
           	Msg2Player("�� ��nh b�i �o�n Th�a �n, ch�c ch�n Nh� Ho�ng T� � g�n ��y th�i.");
           	TaskTip("�� ��nh b�i �o�n Th�a �n, ch�c ch�n Nh� Ho�ng T� � g�n ��y th�i.");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end
