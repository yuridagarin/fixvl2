-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPCĦ������Script
-- By StarryNight
-- 2006/01/13 PM 13:20

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos(); 

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV75_ID) == 7 then
        	SetTask(TASK_DL_LV75_ID, 8);
        	Msg2Player("V� th�ng b�o cho Tr�nh Qu�n Chi �� ��nh b�i Ma H� La Gi�");
        	TaskTip("V� th�ng b�o cho Tr�nh Qu�n Chi �� ��nh b�i Ma H� La Gi�");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV75_ID) == 7 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV75_ID, 8);
           	Msg2Player("V� th�ng b�o cho Tr�nh Qu�n Chi �� ��nh b�i Ma H� La Gi�");
           	TaskTip("V� th�ng b�o cho Tr�nh Qu�n Chi �� ��nh b�i Ma H� La Gi�");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end
