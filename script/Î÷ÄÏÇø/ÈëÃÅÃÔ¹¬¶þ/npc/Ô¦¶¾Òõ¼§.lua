-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII ��������NPCԦ������Script
-- By StarryNight
-- 2006/01/04 PM 16:26

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
        if GetTask(TASK_DL_LV30_ID) == 3 then
        	SetTask(TASK_DL_LV30_ID, 4);
        	Msg2Player("�� thu ph�c Ng� ��c �m C�, tr� v� h�i b�o B�ch Doanh Doanh!");
        	TaskTip("�� thu ph�c Ng� ��c �m C�, tr� v� h�i b�o B�ch Doanh Doanh!");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_DL_LV30_ID) == 3 and nDist >= 0 and nDist <= 50 then
            	SetTask(TASK_DL_LV30_ID, 4);
        			Msg2Player("�� thu ph�c Ng� ��c �m C�, tr� v� h�i b�o B�ch Doanh Doanh!");
        			TaskTip("�� thu ph�c Ng� ��c �m C�, tr� v� h�i b�o B�ch Doanh Doanh!");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;