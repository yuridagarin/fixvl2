-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC������Script
-- By StarryNight
-- 2006/01/13 PM 20:37

--������������ת������ɫ��ʣ�µĻ���ʲô����

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV80_ID) == 6 then
        	SetTask(TASK_DL_LV80_ID, 7);
        	AddItem(2,0,383,1,1);--�õ�������Ʒ����
        	Msg2Player("�� ��nh b�i Kh�n Na La, h�y mau v� ��i L� giao kim kh�u cho qu�c s�!");
        	TaskTip("�� ��nh b�i Kh�n Na La, h�y mau v� ��i L� giao kim kh�u cho qu�c s�!");
        end;
    else
        for i=1,nMemCount do
           PlayerIndex = GetTeamMember(i);
           local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
           local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
           if GetTask(TASK_DL_LV80_ID) == 6 and nDist >= 0 and nDist <= 50 then
           	SetTask(TASK_DL_LV80_ID, 7);
           	AddItem(2,0,383,1,1);--�õ�������Ʒ����
           	Msg2Player("�� ��nh b�i Kh�n Na La, h�y mau v� ��i L� giao kim kh�u cho qu�c s�!");
           	TaskTip("�� ��nh b�i Kh�n Na La, h�y mau v� ��i L� giao kim kh�u cho qu�c s�!");
           end;
				end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end
