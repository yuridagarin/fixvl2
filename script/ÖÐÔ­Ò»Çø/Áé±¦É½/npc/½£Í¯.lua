--��ͯĬ�϶Ի�
--created by lizhi
--2005-9-7 10:49

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");

function main()
    local nStep = GetTask(TASK_XYTY);
    if nStep == 3 then
        task_03_00();
        return
    elseif nStep == 7 then
        task_07_00();
        return
    end;
    
    Talk(1,"","S� Ph� lu�n n�i  c�ng phu c�a ki�m l� � b�n ngo�i ki�m c�n b�n trong r�t cu�c l� g� ta c�ng kh�ng r� n�a.");
end;