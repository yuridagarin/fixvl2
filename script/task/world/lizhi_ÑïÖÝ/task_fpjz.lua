--���ٽ���
--created by lizhi
--2005-9-1 16:39

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    local szMsg = {
        "Phi B�c Kim Ch�m h�nh nh� l� hung kh� gi�t ch�t L�i Th�ng. Ng��i th� ��n ���ng M�n t�m ���ng Xu�n h�i xem!"
    };
    if GetTask(TASK_YZ_TWO) == 0 then
        TalkEx("task_00_01", szMsg);
    end;
end;

function task_00_01()
    SetTask(TASK_YZ_TWO, 1);
    Msg2Player("��n ���ng M�n t�m ���ng Xu�n");
    TaskTip("��n ���ng M�n t�m ���ng Xu�n");
end;
