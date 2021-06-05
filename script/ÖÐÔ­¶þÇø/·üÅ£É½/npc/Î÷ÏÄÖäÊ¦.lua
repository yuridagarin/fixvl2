--npc������ʦ
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
        if GetTask(TASK_XY_TWO) == 3 then
            if GetItemCount(2,0,210) >= 1 then
                DelItem(2,0,210,1);
                Msg2Player("R�c Ph� Ch� Th�y l�n thi th� Ph�p S� T�y H�");
                local nStep = GetTask(TASK_XY_TWO_ONE);
                SetTask(TASK_XY_TWO_ONE, nStep + 1);
            else
                Talk(1,"","Ch�t r�i! Kh�ng c� <color=yellow>Ph� Ch� Th�y<color> hay l� quay v� V� �ang nh� T� H�c Ch�n Nh�n l�p tr�n ph�p.");
            end;
            
            if GetTask(TASK_XY_TWO_ONE) >= 3 then
                SetTask(TASK_XY_TWO, 5);
                AddItem(2,0,72,1);
                if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --�������֧����������ˣ����������
                    SetTask(TASK_XYTY, 56);
                    Msg2Player("V� b�m b�o C�ng T�n Th�");
                    TaskTip("V� b�m b�o C�ng T�n Th�");
                end;
            end;
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if GetTask(TASK_XY_TWO) == 3 and nDist >= 0 and nDist <= 50 then
                if GetItemCount(2,0,210) >= 1 then
                    DelItem(2,0,210,1);
                    Msg2Player("R�c Ph� Ch� Th�y l�n thi th� Ph�p S� T�y H�");
                    local nStep = GetTask(TASK_XY_TWO_ONE);
                    SetTask(TASK_XY_TWO_ONE, nStep + 1);
                else
                    Talk(1,"","Ch�t r�i! Kh�ng c� <color=yellow>Ph� Ch� Th�y<color> hay l� quay v� V� �ang nh� T� H�c Ch�n Nh�n l�p tr�n ph�p.");
                end;
                
                if GetTask(TASK_XY_TWO_ONE) >= 3 then
                    SetTask(TASK_XY_TWO, 5);
                    AddItem(2,0,72,1);
                    if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --�������֧����������ˣ����������
                        SetTask(TASK_XYTY, 56);
                        Msg2Player("V� b�m b�o C�ng T�n Th�");
                        TaskTip("V� b�m b�o C�ng T�n Th�");
                    end;
                end;
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;
end;
