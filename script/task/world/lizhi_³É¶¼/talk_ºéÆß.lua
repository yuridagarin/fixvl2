--�ļ�˵��
--����߶Ի�
--created by lizhi
--2005-8-15 9:59

Include("\\script\\task\\world\\lizhi_�ɶ�\\task_main.lua");

function talk_four()
    local szTalk = {
        "Xin h�i c� ph�i l� H�ng Th�t ��i ca kh�ng? T�i h� ph�ng m�nh Ph�m Tr�ng Y�n ��n th�m h�i, ��y l� t�n v�t xin xem qua!",
        "<sex> kh�ng c�n �a l�. <sex> ��n ��y v� chuy�n c�a Ph�m ti�n sinh ph�i kh�ng?",
        "��ng v�y!",
        "Ta �� cho �� t� C�i Bang ��n ph�n �� Th�nh �� d� la, hi�n v�n ch�a v�. Ng��i gi�p ta khai th�ng con ���ng ��n D� Tr� l�m ���c kh�ng?"
    };
    local szTalk1 = {
        "H�n ta v� ch�a? Theo l�ch tr�nh h�m qua l� t�i.",
        "�� t�i h� �i xem sao"
    };
    local szBack = {
        "�� t� d� la tin t�c �� v�. �a t� <sex> d�c ���ng gi�p ��.",
        "H�ng ��i ca ��ng qu� kh�ch s�o, kh�ng bi�t Th�nh �� c� tin t�c g� kh�ng?"
    };
    local szBack2 = {
        "<sex> chu�n b� l�n ���ng ch�a?",
        "Ta �� s�n s�ng. Phi�n H�ng ��i ca!/task_four_yes",
        "Ta c�n chu�n b�, s� quay l�i sau!/task_exit"
    };
    
    local nStep = GetTask(TASK_FOUR);
    
    if nStep == 1 then
        TalkEx("task_four_01", szTalk);
        Msg2Player("T�m �� t� C�i Bang");
        TaskTip("T�m �� t� C�i Bang");
    elseif nStep == 2 or nStep == 3 or nStep == 4 then
        TalkEx("", szTalk1);
    elseif nStep == 5 then        
        SetTask(TASK_FOUR, 6);
        AddItem(2,0,80,1);
        TalkEx("task_four_05", szBack);
    elseif nStep == 6 then
        SelectSay(szBack2);
    end;
    
end;

function task_four_05()
    local szBack1 = {
        "Hi�n Th�nh �� �ang n�o lo�n. Phi�n <sex> mang th� n�y v� cho Ph�m ti�n sinh. C� c�n ta ��a <sex> v� Th�nh �� kh�ng?",
        "Ta �� s�n s�ng. Phi�n H�ng ��i ca!/task_four_yes",
        "Ta c�n chu�n b�, s� quay l�i sau!/task_exit"
    };
    SelectSay(szBack1);
end;