--npc����
--created by lizhi
--2005-9-1 11:07
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");

function main()
    local nStep = GetTask(TASK_FIVE);
    if nStep == 7 then
        task_07_cm_00();
    elseif nStep == 8 then
        task_08_00();
    elseif nStep == 9 then
        task_09_00();
    elseif nStep == 17 then
        task_17_00();
    else
        local szTalk = {
            "Ph�m d�ng ch�m gi�, h� t�c th�c chi, m�n t�c ti�t chi, uy�n tr�n t�c tr� chi, t� th�ng t�c h� chi."
        };
        TalkEx("", szTalk);
    end;
end;