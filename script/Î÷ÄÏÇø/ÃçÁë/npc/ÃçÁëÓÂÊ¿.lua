-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPC������ʿScript
-- By StarryNight
-- 2006/01/04 PM 17:46

--������ ������ ������ 
--��: ���� �ܻ� ���� ���� ���� ��Ȣ �ɲ� ��ж ���� ���� ���� ���� ���� ���� ��լ ���� ���� ��׽ ��� ��ľ ���˿� ��ˮ 
--��: ���� ���� �޷� ���� 
--��������: �帻 ����  
--�����˼�: ��ɷ С�� ���� ���� Ԫ��  
--ÿ��̥��ռ��: ռ�������ڱ� 
--����: ����ˮ ִִλ 
--��: ����(����)ɷ�� 
--����ټ�: �ﲻ����������ǿ �Ѳ�Զ�в������ 

-- ======================================================

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\����\\task_head.lua")

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_DL_LV40_ID) == 3 then
        	SetTask(TASK_DL_LV40_ID, 4);
        	Msg2Player("�� ��nh b�i Mi�u L�nh D�ng S�, quay v� g�p T�c tr��ng Mi�u L�nh");
        	TaskTip("�� ��nh b�i Mi�u L�nh D�ng S�, quay v� g�p T�c tr��ng Mi�u L�nh");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_DL_LV40_ID) == 3 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_DL_LV40_ID, 4);
        			Msg2Player("�� ��nh b�i Mi�u L�nh D�ng S�, quay v� g�p T�c tr��ng Mi�u L�nh");
        			TaskTip("�� ��nh b�i Mi�u L�nh D�ng S�, quay v� g�p T�c tr��ng Mi�u L�nh");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;