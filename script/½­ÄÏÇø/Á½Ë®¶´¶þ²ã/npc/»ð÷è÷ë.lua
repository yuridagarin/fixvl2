--������
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
        if GetTask(TASK_YZ_THREE) == 15 then
            SetTask(TASK_YZ_THREE, 16);
            AddItem(2,0,150,1);
            Msg2Player("Quay v� g�p Thu Dung");
            TaskTip("Quay v� g�p Thu Dung");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_YZ_THREE) == 15 and nDist >= 0 and nDist <= 50 then
                SetTask(TASK_YZ_THREE, 16);
                AddItem(2,0,150,1);
                Msg2Player("Quay v� g�p Thu Dung");
                TaskTip("Quay v� g�p Thu Dung");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;
