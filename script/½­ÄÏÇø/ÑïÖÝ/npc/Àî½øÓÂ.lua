--�����
--created by lizhi
--2005-9-1 16:19

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\lizhi_����\\task_three_main.lua");
Include("\\script\\task\\world\\lizhi_����\\task_four_main.lua");

function main()
    if (GetTask(TASK_YZ_FOUR) >= 3 and GetTask(TASK_YZ_FOUR) <= 4) and (GetTask(TASK_YZ_THREE) >= 3 and GetTask(TASK_YZ_THREE) <= 6) then
        local szSay = {
            "Ch�ng hay <sex> t�m ta c� chuy�n g�?",
            "Chuy�n V� Di s�n/task_three",
            "Chuy�n ��ng H�i/task_four"
        };
        SelectSay(szSay);
        return
    end;
    
    if GetTask(TASK_YZ_THREE) >= 3 and GetTask(TASK_YZ_THREE) <= 6 then
        task_three();
        return
    end;
    
    if GetTask(TASK_YZ_FOUR) >= 3 and GetTask(TASK_YZ_FOUR) <= 4 then
        task_four();
        return
    end;

    local szTalk = {
        "<sex> n�y �n ���ng ph�t s�ng, d��ng nh� c� h� s� l�m m�n! Ng��i c� mu�n ta b�i th� m�t qu� kh�ng?"
    };
    TalkEx("", szTalk);
end;

function task_four()
    local nStep = GetTask(TASK_YZ_FOUR);
    if nStep == 3 then
        four_03_00();
    elseif nStep == 4 then
        four_04_00();
    end;
end;

function task_three()
    local nStep = GetTask(TASK_YZ_THREE);
    if nStep == 3 then
        task_03_00();
    elseif nStep == 4 then
        task_04_00();
    elseif nStep == 5 then
        task_05_00();
    elseif nStep == 6 then
        local szTalk = {
            "��n T�y Nam D��ng Ch�u th�nh c� th� t�m ���c L�u Huy�n Thanh h�i trong L��ng Th�y ��ng �� x�y ra chuy�n g�?"
        };
        TalkEx("", szTalk);
    end;
end;