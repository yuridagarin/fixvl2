
-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII Ȫ�� 14 ����������ű�
-- Edited by lizhi
-- 2005-8-4 10:38
-- ======================================================

-- ���������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "Canh g�c nghi�m ng�t v�y sao m�t tr�m ���c?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

    local szTalk = {
        "Nghe n�i kho b�u c�a ��i nh�n b� tr�m, ta �ang �i�u tra chuy�n n�y, xin n�i r� h�n ���c kh�ng?",
        "H�m ��, khi ta th�c d�y, g�i c� n�a ng�y m� kh�ng th�y L�u qu�n gia ��u, ��n ph�ng �ng ta th� th�y �� ��c �� d�n �i.",
        "R�i sao n�a?",
        "V�a l�c ��, a ho�n Ti�n T��ng h�t ho�ng ch�y ��n b�o c�a kh� ph�ng �� b� m�, n�i �� ch� c� ta m�i c� ch�a kh�a ra v�o.",
        "Chung quy l� m�t nh�ng th� g�? C� ph�i L�u qu�n gia l�y c�p kh�ng?"
    };
    
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    local szMsg = {
        "Th�t ��ng ti�c! chuy�n h�ng b�ng ng�c m�t h�t. Ta ch� ph�t hi�n b�c th� trong ph�ng c�a L�u qu�n gia, ch�c trong l�c g�p g�p �ng ta �� qu�n. Ch� trong th� �� m� do d�nh n��c, ng��i th� mang �i �i�u tra xem.",
        "L�m sao �� ��c ���c c�c ch� n�y?",
        "Ng��i th� ��n t�m Chu B�n C� (162.185), bi�t ��u kh�i ph�c ���c b�c th�."
    };
    
    TalkEx("", szMsg);

	Msg2Player("��n ph� Tuy�n Ch�u t�m Chu B�n C�");
	TaskTip("��n ph� Tuy�n Ch�u t�m Chu B�n C�");
	
	AddItem(2, 0, 38, 1);   --ģ��������
	
	SetTask(TASK_LEV_14_ID, 1);
	SetTask(TASK_LEV_12_ID, GetTask(TASK_LEV_12_ID) + 1);   --�����������
end;


function task_001_01()

    local szTalk = {
        "Ng��i th� ��n t�m Chu B�n C� (162.185), bi�t ��u kh�i ph�c ���c b�c th�."
    };

    TalkEx("", szTalk);
end;

function task_001_02()

    local szTalk = {
        "T�i h� c� b�c th� kh�ng may th�m n��c kh�ng bi�t ��i nh�n gi�p kh�i ph�c l�i ���c kh�ng?",
        "Vi�c n�y kh�ng kh�, nh�ng c�n c�: 1 Linh ph� ch�, 1 Chu sa, 1 D� Tr� mao.",
        "�� ta �i t�m."
    };
    
    TalkEx("task_002_00",szTalk);
end;

function task_002_00()

    Msg2Player("T�m Linh ph� ch�, Chu sa v� D� Tr� mao cho Chu B�n C�");
    TaskTip("T�m Linh ph� ch�, Chu sa v� D� Tr� mao cho Chu B�n C�");
    CreateTrigger(0, 194, 84);  --ɱ��Ұ��
    SetTask(TASK_LEV_14_ID, 2);
end;

function task_002_01()
    
    local szNotFinished = {
        "Ta nh�c l�i l�n n�a! Nguy�n li�u c�n t�m l�: 1 Linh ph� ch�, 1 Chu sa, 1 D� Tr� mao!"
    };
    local szMaleFinished = {
        "��ng r�i! ��i ta m�t l�t!",
        "�.",
        "B�c th� �� ���c kh�i ph�c. Hihi�B�c th� n�y ch�c c�ng t� vi�t cho v� h�ng nhan n�o ��y? Trong �� ghi Ph� t�y Tuy�n Ch�u, g�p � ch� c�. Th�i gian kh�ng c�n s�m, c�ng t� mau �i k�o b� l� c� h�i."
    };
    local szFemaleFinished = {
        "��ng r�i! ��i ta m�t l�t!",
        "�.",
        "B�c th� �� ���c kh�i ph�c. Hihi�B�c th� n�y ch�c c�ng t� vi�t cho v� h�ng nhan n�o ��y? Trong �� ghi Ph� t�y Tuy�n Ch�u, g�p � ch� c�. Th�i gian kh�ng c�n s�m, c�ng t� mau �i k�o b� l� c� h�i."
    };
        
    local nPen = 0;
    local nPaper = 0;
    local nHair = 0;
    
    nPen = GetItemCount(2, 2, 65);     --���ֽ
    nPaper = GetItemCount(2, 2, 30);  --��ɰ
    nHair = GetItemCount(2, 0, 39);     --��ϸ��Ұ��ë
    
    if ((nPen >= 1) and (nPaper >= 1) and (nHair >= 1)) then
        if (GetSex() == 1) then
            TalkEx("task_003_00", szMaleFinished);
        elseif (GetSex() == 2) then
            TalkEx("task_003_00", szFemaleFinished);
        end;
    else
        TalkEx("task_003_10", szNotFinished);
    end;
end;

function task_003_10()
    if GetTrigger(84) == 0 then
        CreateTrigger(0, 194, 84);  --ɱ��Ұ��
    end;
end;

function task_003_00()

    GivePlayerAward("Level_14", "easy");    --����
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei1")		--��������1
    SetTask(TASK_LEV_14_ID, 3);
    
    DelItem(2,2,65,1);
    DelItem(2,2,30,1);
    DelItem(2,0,39,1);
    DelItem(2, 0, 38, 1);   --ģ��������
    RemoveTrigger(GetTrigger(84));

end;

function task_003_01()
    
    local szTalk = {
        "Ph� t�y Tuy�n Ch�u, ch� g�p c�, ng��i c�n kh�ng mau �i!"
    };
    TalkEx("", szTalk);

end;

function task_003_02()
    
    local szTalk = {
        "L�u qu�n gia! T��ng l�y c�p �� xong tho�t ���c �? Khai mau chuy�n h�ng c�a ��i Ch� C��ng �� ��u? Ai sai ng��i l�m?",
        "��i nh�n, xin tha m�ng! �� ta n�i!",
        "N�i mau!",
        "L��.th� r�n Chung Ph�ng � ph� Tuy�n Ch�u b�o ta l�y c�p, h�n n�i l�c tr��c l�m ch�a kh�a cho ��i l�o gia l�n l�t l�m th�m m�t ch�a, n�i sau khi th�nh c�ng s� chia cho ta nhi�u h�n. Hi�n h�n mang chuy�n h�ng �� �i r�i, ng��i t�m h�n h�i xem, xin tha m�ng!",
        "H�m nay ta t�m tha cho ng��i!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    GivePlayerAward("Level_14", "hard", "weapon", "Level_16");    --����
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei2")		--��������2
    SetTask(TASK_LEV_14_ID, 4);
    SetTask(TASK_LEV_18_ID, 100);   --Ȫ���ӷ�������
end;

function task_004_01()
    
    local szTalk = {
        "T�t c� l� do Chung Ph�ng ch� th�, ng��i t�m h�n h�i xem, xin tha m�ng!"
    };
    TalkEx("", szTalk);
end;