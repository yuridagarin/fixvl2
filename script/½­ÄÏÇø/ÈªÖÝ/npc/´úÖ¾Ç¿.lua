--  �ļ�˵��
--  ��ӦNPC���ƣ���־ǿ
--  created by lizhi
--  2005-8-4 15:14

Include("\\script\\task\\world\\lizhi_Ȫ��\\14��\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    
    nStep = GetTask(TASK_LEV_14_ID);
    if (nStep == 100) then
        task_000_00();
    elseif (nStep == 1) then
        task_001_01();
    else
        can_not_accept_task();
    end;
end;