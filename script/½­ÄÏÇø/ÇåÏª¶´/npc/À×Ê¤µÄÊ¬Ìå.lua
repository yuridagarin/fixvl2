--������������ʤ��ʬ��
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");

function main()
    if GetTask(TASK_FIVE) >= 21 then
        PickUp();
    end;
end;

function PickUp()
    if GetItemCount(2,0,100) == 0 and GetTask(TASK_YZ_TWO) == 0 then
        AddItem(2,0,100,1); --���ٽ���
    end;
    if GetItemCount(2,0,101) == 0 and GetTask(TASK_YZ_ONE) == 0 then
        AddItem(2,0,101,1); --������
    end;
    local nStep = GetTask(TASK_FIVE);
    if nStep == 21 then
        SetTask(TASK_FIVE, 22);
        Msg2Player("H�i b�o H� H�u C�m");
        TaskTip("H�i b�o H� H�u C�m");
    elseif nStep == 23 then
        if GetItemCount(2,0,103) == 0 then
            AddItem(2,0,103,1);
            Msg2Player("H�i b�o H� H�u C�m");
            TaskTip("B�o H� H�u C�m");
        end;
    end;
    
    
end;