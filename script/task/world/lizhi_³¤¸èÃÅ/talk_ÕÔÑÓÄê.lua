--�ļ�˵��
--npc��������
--created by lizhi
--2005-8-10 10:37

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");

function talk_one()
    
    local szTalk = {
        "M�y ng�y kh�ng g�p <sex> qu� nhi�n ti�n b� h�n!",
        "Kh�u Chu�n ��i nh�n c�th� g�i cho ti�n b�i!",
        "Th� g�? ��a ta xem.....",
        "[Tri�u Di�n Ni�n m� th� ra xem xong suy ngh� h�i l�u]",
        "Kh�ng ng� s� vi�c l�i h� tr�ng ��n v�y. Ng��i ra s�c gi�p ��i T�ng, Tri�u m� n�y r�t kh�m ph�c. Kh�ng gi�u g� ng��i, ta ch�nh l� ng��i li�n l�c v�i {Tr��ng Ca M�n}.",
        "Ra l� v�y! {Tr��ng Ca M�n}, {Thi�n �m gi�o} l�m ta r�i c� l�n, ti�n b�i gi�i th�ch m�t ch�t ���c kh�ng?"
    };
    
    if GetTask(TASK_ONE) == 101 then
        TalkEx("task_002_00", szTalk);
    end;
end;

function talk_five()
    local szMsg = {
        "V�n b�i ���c l�nh c�a H� H�u C�m ��n th�ng b�o v� m�nh S�n H� X� T�c g�n Giang Nam c� kh� n�ng r�i v�o tay b�n Xi H�a gi�o, h�n n�a th�n ph�n �ng ta b� b�i l�, xin xem qua b�c th� s� r�!",
        "�a t� ng��i!",
        "C�n nhi�u ng��i c�n ph�i th�ng b�o n�a, v�n b�i �i ��y!"
    };
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(127,2);
        DelItem(2,0,43,1);
        TalkEx("", szMsg);
    end;
end;

function task_002_00()
    local szTalk = {
        "Lai l�ch Tr��ng Ca M�n b�t ��u t� ng�y khai qu�c. L�c �� Th�i T� b�nh ��nh giang s�n, c�c v� t��ng nh� Th�ch Th� T�n, Cao Ho�i ��c, Tr��ng L�nh Phong, Tri�u Ng�n Huy ��u c�o l�o h�i h��ng, an d��ng tu�i gi�. ��ng ti�c {Tri�u Ng�n Huy} ��i nh�n kh�ng ch�u n�i s� c� ��n b�n li�n l�c m�t s� b�n b� giang h�, ng�m th�, t� v� ngh�.",
        "V� sau nh�ng v� b�ng h�u n�y th�nh l�p th�nh m�t m�n ph�i. L�c �� trong ph�i nhi�u ng��i s�ng t�c nh�c l�m th� cho n�n m�i c� t�n {Tr��ng Ca M�n}. Vi�c c�n l�m l�c n�y l� th�ng b�o cho nh�ng huynh �� �y bi�t.",
        "Hi�n {4 ng��i} ��u �ang ph�ng m�nh �i�u tra, ta ph�i th�ng b�o cho {�u D��ng H�a} tr��c. {H� H�u C�m} � {D��ng Ch�u}, {C�ng T�n Th�} � {T��ng D��ng}, {Gia C�t K�}� {Giang T�n Th�n}, kh�ng bi�t <sex> c� th� gi�p ta th�ng b�o cho 3 v� kh�ng?",
        "V�n b�i �i ngay!"
    };
    TalkEx("task_002_000", szTalk);
end;

function task_002_000()
    local szTalk = {
        "C�m �n <sex>! Th�c ra B�ch Hi�u Sinh c�ng l� ng��i c�a Tr��ng Ca M�n, ng��i ��i g�i �ng ta l� {Tr� hi�p}. <sex> mu�n bi�t th�m v� Tr��ng Ca M�n c� th� ��n ��.",
        "�� ta ti�n b�i ch� d�n, sau khi th�ng b�o cho xong 3 v� ti�n b�i kia v�n b�i s� t�m {B�ch Hi�u Sinh} th�nh gi�o."
    };
    TalkEx("task_002_01", szTalk);
end;

function task_002_01()
    --����������ʱ���ĺ��١�����塢�����飬��ʱ������ɵõ�ȫ����������ʱ������Ϊ1/3��
    SetTask(TASK_ONE, 102);
    RemoveTrigger(GetTrigger(90));
    
    CreateTrigger(1, 201, 90);
    ContinueTimer(GetTrigger(90));
    
    CreateTrigger(3, 203, 89);
    SetLogType(GetTrigger(89), 1);
    
    CreateTrigger(4, 201, 91);    --talk to �ĺ���
    SetTask(124,1);
    CreateTrigger(4, 206, 96);    --talk to �����
    SetTask(126,1);
    CreateTrigger(4, 207, 97);    --talk to ������
    SetTask(125,1);
    
    Msg2Player("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    TaskTip("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    
    --���������Ұ�����
    SetTask(TASK_TWO, 1);
end;