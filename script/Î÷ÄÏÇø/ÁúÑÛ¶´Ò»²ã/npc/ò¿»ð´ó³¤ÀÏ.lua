-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC�����Script
-- By StarryNight
-- 2006/01/13 PM 10:15

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV75_ID) == 1 then
        	SetTask(TASK_DL_LV75_ID, 2);
        	Msg2Player("H�i b�o Ng� ��c gi�o ch� �� ��nh b�i Xi H�a ��i tr��ng l�o");
        	TaskTip("H�i b�o Ng� ��c gi�o ch� �� ��nh b�i Xi H�a ��i tr��ng l�o");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV75_ID) == 1 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV75_ID, 2);
           	Msg2Player("H�i b�o Ng� ��c gi�o ch� �� ��nh b�i Xi H�a ��i tr��ng l�o");
           	TaskTip("H�i b�o Ng� ��c gi�o ch� �� ��nh b�i Xi H�a ��i tr��ng l�o");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;