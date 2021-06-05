--npc��ͷ���ű�
--created by lizhi
--2005-8-24 15:25
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()
    if GetTask(TASK_XYTY) == 18 then
        task_18_00();
        return
    elseif GetTask(TASK_XYTY) == 23 or GetTask(TASK_XYTY) == 24 then
        task_23_00();
        return
    else
        Talk(1,"","Ch�y c�i g� m� ch�y! Ch�t quy t�c c�ng kh�ng c�, n�i n�y c� th� �� ng��i ch�y lung tung sao? C�n kh�ng mau r�i kh�i ��y!");
    end;
end;

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();

    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_XYTY) == 23 or GetTask(TASK_XYTY) == 24 then
            AddItem(2,0,60,1);  --���ذ������
            SetTask(TASK_XYTY, 25);
            SetTask(TASK_XY_TEMP, 0);
--            RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
--            RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
            Msg2Player("T�m Th�c B�t K�");
            TaskTip("T�m Th�c B�t K�");
        end;
    else
        for i=1,nMemCount do
            PlayerIndex = GetTeamMember(i);
            local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
            local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
            if (GetTask(TASK_XYTY) == 23 or GetTask(TASK_XYTY) == 24) and nDist >= 0 and nDist <= 50 then
                AddItem(2,0,60,1);  --���ذ������
                SetTask(TASK_XYTY, 25);
                SetTask(TASK_XY_TEMP, 0);
--                RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
--                RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
                Msg2Player("T�m Th�c B�t K�");
                TaskTip("T�m Th�c B�t K�");
            end;
		end;
		PlayerIndex = nPreservedPlayerIndex; -- ����֮ǰ�������ұ��
    end;

end;
