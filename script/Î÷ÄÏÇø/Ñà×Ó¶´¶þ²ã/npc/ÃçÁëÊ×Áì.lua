-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC��������Script
-- By StarryNight
-- 2006/01/09 PM 16:12

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV50_ID) == 4 then
        	SetTask(TASK_DL_LV50_ID, 5);
        	AddItem(2,0,370,1);
        	Msg2Player("�� l�y ���c Mi�u L�nh l�nh b�i, v� g�p T�c tr��ng Mi�u L�nh");
        	TaskTip("�� l�y ���c Mi�u L�nh l�nh b�i, v� g�p T�c tr��ng Mi�u L�nh");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV50_ID) == 4 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV50_ID, 5);
           	AddItem(2,0,370,1);
           	Msg2Player("�� l�y ���c Mi�u L�nh l�nh b�i, v� g�p T�c tr��ng Mi�u L�nh");
           	TaskTip("�� l�y ���c Mi�u L�nh l�nh b�i, v� g�p T�c tr��ng Mi�u L�nh");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;