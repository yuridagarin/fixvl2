-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC�������Script
-- By StarryNight
-- 2006/01/11 PM 18:28

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV60_1_ID) == 2 then
        	SetTask(TASK_DL_LV60_1_ID, 3);
        	Msg2Player("V� Th�nh �� g�p V� N��ng th�ng b�o �� ��nh b�i Ng�c H�a Cu�ng Nh�n");
        	TaskTip("V� Th�nh �� g�p V� N��ng th�ng b�o �� ��nh b�i Ng�c H�a Cu�ng Nh�n");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV60_1_ID) == 2 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV60_1_ID, 3);
           	Msg2Player("V� Th�nh �� g�p V� N��ng th�ng b�o �� ��nh b�i Ng�c H�a Cu�ng Nh�n");
           	TaskTip("V� Th�nh �� g�p V� N��ng th�ng b�o �� ��nh b�i Ng�c H�a Cu�ng Nh�n");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;