--�ļ�˵��
--��ؤ����ӶԻ�
--created by lizhi
--2005-8-15 10:11

Include("\\script\\task\\world\\lizhi_�ɶ�\\task_main.lua");

function talk_four()
    local szTalk = {
        "�i�!",
        "V� ti�u huynh �� ��y c� ph�i �� t� C�i Bang kh�ng? H�ng s� th�c sai ta t�m huynh.",
        "<sex> kh�ng hi�u ��u! Kh�ng ph�i ta kh�ng mu�n v�, m� l�.....",
        "Sao th�?",
        "M�y h�m tr��c �i ngang qua L��ng S�n B�c b� ��m s�n t�c ph�c k�ch, may ch�y tho�t nh�ng h�nh l� �� b� ch�ng l�y m�t.",
        "�� ta gi�p ng��i t�m {h�nh l�} v�."
    };
    local szTalk1 = {
        "T�m ���c h�nh l� ch�a?",
        "� ��y nhi�u s�n t�c qu�, �� ta t�m l�i!"
    };
    local szFinished = {
        "T�m ���c h�nh l� ch�a?",
        "H�nh l� n�y ph�i c�a huynh kh�ng?",
        "��ng v�y! �a t� <sex>, ta l�p t�c v� g�p s� th�c ��y!"
    };
    local szTalk2 = {
        "Kh�ng lo s� th�c khi�n tr�ch n�a r�i!"
    };
    
    local nStep = GetTask(TASK_FOUR);
    
    if nStep == 2 then
        TalkEx("task_four_02", szTalk);
        Msg2Player("Gi�p �� t� C�i Bang t�m h�nh l�");
        TaskTip("Gi�p �� t� C�i Bang t�m h�nh l�");
    elseif nStep == 3 then
        TalkEx("", szTalk1);
    elseif nStep == 4 then
        TalkEx("task_four_04", szFinished);
    elseif nStep == 5 then
        TalkEx("", szTalk2);
    end;
end;
    