--ʹ���������Ժ�ִ�еĽű�
--created by lizhi
--2005-9-1 16:14

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()
    local szMsg = {
        "H�nh nh� ��y l� th� c�a L�i Th�ng vi�t cho ng��i y�u nh�ng sao anh ta kh�ng g�i �i, trong th� c� nh�c ��n ng��i y�u c�a L�i Th�ng �ang � D��ng Ch�u t�n Ph�ng ��ng Nhi. Gi�p anh ta ho�n th�nh t�m nguy�n n�y �i!"
    }
    if GetTask(TASK_YZ_ONE) == 0 then
        TalkEx("task_00_01", szMsg);
    end;
end;

function task_00_01()
    SetTask(TASK_YZ_ONE, 1);
    Msg2Player("�em th� cho Ph�ng ��ng Nhi � D��ng Ch�u");
    TaskTip("�em th� cho Ph�ng ��ng Nhi � D��ng Ch�u");
end;