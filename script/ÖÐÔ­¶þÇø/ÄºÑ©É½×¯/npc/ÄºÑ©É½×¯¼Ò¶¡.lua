--��ĺѩɽׯ�Ҷ��Ի��ű�
--created by lizhi
--2005-8-22 10:12
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");

function main()
    if GetTask(TASK_XYTY) == 16 then
        task_16_00();
        return
    elseif GetTask(TASK_XYTY) == 17 then
        task_17_00();
        return
    end;
    Talk(1,"","<color=green>M� Tuy�t S�n Trang Gia �inh<color>: ��");
end;
