--�Ų���
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_����\\task_three_main.lua");

function main()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 1 then
        task_01_00();
    elseif nStep == 2 then
        task_02_00();
    elseif nStep == 3 then
        Talk(1,"","H�y ��n <color=yellow>D��ng Ch�u<color> h�i Thi�t Ch�y <color=yellow>L� Ti�n D�ng<color> v� chuy�n ��ng v�t k� qu�i! May ra s� c� ch�t manh m�i!");
    else
        Talk(1,"","Sao V� Di s�n l�i c� qu� nhi�u Kh� tr�ng v� h� ly tr�ng! Mu�n h� ch�t ta sao?");
    end;
end;