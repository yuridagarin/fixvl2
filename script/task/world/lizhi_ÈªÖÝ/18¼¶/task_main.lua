
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII Ȫ�� 18 ����������ű�
-- Edited by lizhi
-- 2005-8-4 16:36
-- ======================================================

-- ���������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");

function can_not_accept_task()
    local szTalk = {
        "Th�i gian ng�n v�y sao ta l�m h�t ���c s� �ao n�y?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "Nghe n�i ng��i l� ch� m�u c�a v� l�y tr�m nh� ��i Ch� C��ng.",
        "Ta c�ng kh�ng mu�n nh�ng v� con b� t�n h�c y nh�n b�t �i, h�n b�o c�n chuy�n h�ng ng�c c�a ��i Ch� C��ng m�i th� v� con v�.",
        "Sao ng��i l�y ���c ch�a kh�a kho b�u c�a ��i Ch� C��ng? Theo ta bi�t ch�a kh�a �� ch� c� m�t c�i.",
        "Ch�a kh�a nh� ��i Ch� C��ng l� do ta l�m, s� th�ch c�a ta l� khi l�m ch�a cho ng��i kh�c th��ng l�m th�m m�t c�i. T�n h�c y nh�n b�t ta ph�i �em �� ng�c v� b�ng kh�ng v� con g�p nguy hi�m.",
        "Ng��i bi�t ng��i �� l� ai, � ��u kh�ng?",
        "Nghe ��u h�n t�n Ch��ng V� C��ng, ti�u ��u m�c c�a Xi H�a gi�o. �ang � B�c Tuy�n Ch�u.",
        "�� ta �i t�m h�n."
    };
    
    TalkEx("task_001_00", szTalk);
    
end;
    
function task_001_00()

    Msg2Player("��n B�c Tuy�n Ch�u t�m Ch��ng V� C��ng (179.180)");
    TaskTip("��n B�c Tuy�n Ch�u t�m Ch��ng V� C��ng (179.180)");
    --CreateTrigger(0, 195, 85);  --ɱ����ΰ��
    KillFollower();
    SetTask(TASK_LEV_18_ID, 1);
    SetTask(TASK_LEV_14_ID, GetTask(TASK_LEV_14_ID) + 1);   --�����������
    
end;

function task_001_01()
    local szTalk = {
        "Ch��ng V� C��ng g� ��? Nghe ��u l�m ti�u ��u m�c c�a Xi H�a gi�o, hi�n �ang � B�c Tuy�n Ch�u."
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
--    if GetTrigger(85) == 0 then
--        CreateTrigger(0, 195, 85);  --ɱ����ΰ��
--    end;
	KillFollower();
end;

function task_002_00()
    local szTalk = {
        "�a t� �n nh�n! Phu th� ta �� ���c �o�n t�!"
    };
    TalkEx("task_003_00", szTalk);
end;

function task_003_00()
    KillFollower();
    RemoveTrigger(GetTrigger(86));
    RemoveTrigger(GetTrigger(87));
    GivePlayerAward("Level_18", "hell", "chest", "Level_19");    --����
	GivePlayerExp(SkeyQZWangyewei,"zongfangdekunao")		--�ӷŵĿ���
    SetTask(TASK_LEV_18_ID, 3);
end;

function task_003_01()
    local szTalk = {
        "��i nh�n r�nh r�i ��n Tuy�n Ch�u th��ng ngo�n m�t chuy�n!"
    };
    TalkEx("task_001_02", szTalk);
end;
