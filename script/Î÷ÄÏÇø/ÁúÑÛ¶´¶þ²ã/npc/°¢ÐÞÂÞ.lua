-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC������Script
-- By StarryNight
-- 2006/01/13 PM 16:22

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath(index)
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV70_ID) == 1 or GetTask(TASK_DL_LV70_ID) == 2 then
        	SetTask(TASK_DL_LV70_ID, 2);
        	AddItem(2,0,380,1);--�õ�����ܺ�
        	Msg2Player("Nh�n ���c Si H�a Gi�o m�t h�m, h�y mau m� ra xem c� manh m�i g� ch�ng!");
        	TaskTip("Nh�n ���c Si H�a Gi�o m�t h�m, h�y mau m� ra xem c� manh m�i g� ch�ng!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV70_ID) == 1 or GetTask(TASK_DL_LV70_ID) == 2 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV70_ID, 2);
           	AddItem(2,0,380,1);--�õ�����ܺ�
           	Msg2Player("Nh�n ���c Si H�a Gi�o m�t h�m, h�y mau m� ra xem c� manh m�i g� ch�ng!");
           	TaskTip("Nh�n ���c Si H�a Gi�o m�t h�m, h�y mau m� ra xem c� manh m�i g� ch�ng!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end