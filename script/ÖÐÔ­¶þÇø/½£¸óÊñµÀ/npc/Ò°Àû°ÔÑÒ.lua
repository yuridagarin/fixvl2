--npcҰ�����ҽű�
--created by lizhi
--2005-8-24 15:25

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();

    local nMapId, nX, nY = GetWorldPos();
    
    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_XYTY) == 36 then
            AddItem(2,0,64,1);
            SetTask(TASK_XYTY, 37);
            Msg2Player("V� b�m b�o C�ng T�n Th�");
            TaskTip("V� b�m b�o C�ng T�n Th�");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XYTY) == 36 and nDist >= 0 and nDist <= 50 then
                AddItem(2,0,64,1);
                SetTask(TASK_XYTY, 37);
                Msg2Player("V� b�m b�o C�ng T�n Th�");
                TaskTip("V� b�m b�o C�ng T�n Th�");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;