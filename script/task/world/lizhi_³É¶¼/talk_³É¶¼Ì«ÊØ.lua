--�ļ�˵��
--��ɶ�̫�ضԻ��Ľű�
--created by lizhi
--2005-8-12 15:11

Include("\\script\\task\\world\\lizhi_�ɶ�\\task_main.lua");

function talk_three()
    local nStep = GetTask(TASK_THREE);
    if nStep == 2 then
        task_three_02_01();
    elseif nStep == 3 then
        task_three_03_01();
    end;
end;