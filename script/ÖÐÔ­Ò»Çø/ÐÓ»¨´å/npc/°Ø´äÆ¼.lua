-- �ļ�˵��
-- npc:�ٲݹ���
-- created by lizhi
-- 2005-8-8 12:04

Include("\\script\\task\\world\\lizhi_�꾩\\task_head.lua");
Include("\\script\\task\\world\\lizhi_�꾩\\task_main.lua");

function main()
    local nStep =0;
    nStep = GetTask(TASK_BJ_ID);
    
    if (nStep == 7) then
        task_007_00();
    elseif (nStep == 8) then
        task_008_00();
    elseif (nStep == 9) then
        task_009_00();
    elseif (nStep == 10) or (nStep == 11) or (nStep == 100) then
        task_010_00();
    end;
end;