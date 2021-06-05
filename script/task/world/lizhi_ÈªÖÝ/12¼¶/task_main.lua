--  ===============�ļ���Ϣ=================
--  ������ԵonlineII Ȫ�� 12 ����������ű�
--  Edited by lizhi
--  2005-8-2 15:36
--  ========================================

-- ���������ļ�
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "N�i n�y c�n ch� cho ng��i ngh�o tr� kh�ng?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "Nghe n�i ng��i t�ng l� thu�c h� Di�u L�p Th�nh c� tham gia v� c��p V��ng Nghi�p V�.",
        "Ng��i l� ai? Ph�i Di�u L�p Th�nh ph�i ��n gi�t ta di�t kh�u kh�ng? Hay l� ng��i quan ph�? Ta c� bi�t chuy�n g� ��u!",
        "Y�n t�m! Ta ch� mu�n bi�t chuy�n c�a Di�u L�p Th�nh.",
        "�� ch�ng minh, ng��i gi�p ta ��nh b�i {10 t�n L�u manh} v� {10 t�n C�n ��}!",
        "���c th�i!"
    };
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    
	Msg2Player("Tr� 10 t�n L�u manh v� 10 t�n C�n ��");
	TaskTip("Tr� 10 t�n L�u manh v� 10 t�n C�n ��");
	
	CreateTrigger(0, 191, 81);  --ɱ����å10��
	CreateTrigger(0, 192, 82);  --ɱ������10��
	
    SetTask(TASK_LEV_12_ID, 1);
    SetTask(TASK_LEV_10_ID, GetTask(TASK_LEV_10_ID) + 1);   --�����������
    
end;

function task_001_01()
    
    local szTalk = {
        "Ng��i ��nh b�i {10 t�n L�u manh} v� 10 {t�n C�n ��} ta m�i tin!"
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
    if GetTrigger(81) == 0 then
        CreateTrigger(0, 191, 81);  --ɱ����å10��
    end;
    
    if GetTrigger(82) == 0 then
        CreateTrigger(0, 192, 82);  --ɱ������10��
    end;
end;

function task_003_00()

    local szTalk = {    
        "Kh� l�m! Th�c ra ta c�ng kh�ng mu�n l�m vi�c cho Di�u L�p Th�nh nh�ng th� t� b� b�nh th��ng h�n, c�n d��c li�u tr� b�nh.",
        "Ng��i c�n d��c li�u n�o?",
        "��i phu n�i {D��c ph��ng} c�n {Ng�i b�i}, {R� s�n}, {B�i Lan}, {Li�n Ki�u}, {Kim Ng�n hoa} m�i th� {3 c�i} v� {10 l�ng} {S�i xanh }.",
        "Tr� b�nh l� quan tr�ng, �� ta gi�p ng��i t�m ch�ng v�!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    Msg2Player("��n T�y Tuy�n Ch�u t�m Ng�i b�i, R� s�n, B�i Lan, Li�n Ki�u, Kim Ng�n hoa m�i th� 3 c�i v� 10 l�ng S�i xanh.");
    TaskTip("T�m Ng�i b�i, R� s�n, B�i Lan, Li�n Ki�u, Kim Ng�n hoa m�i th� 3 c�i v� 10 l�ng S�i xanh.");
    
    CreateTrigger(0, 193, 83);  --ɱ��ҩ��
    SetTask(TASK_LEV_12_ID, 4);
    GivePlayerAward("Level_12", "easy");    --����
    GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong1")		--�ĽܵĿ���1
end;

function task_004_01()
    
    local szFinished = {
        "D��c li�u ��y r�i! �a t� �n nh�n! Di�u L�p Th�nh h�nh nh� l� ti�u ��u m�c c�a {Xi H�a gi�o}, {m�nh S�n H� X� T�c} hi�n n�m trong chuy�n h�ng c�a V��ng Nghi�p V�.",
        "V� v�y Di�u L�p Th�nh m�i c��p chuy�n h�ng c�a V��ng Nghi�p V�. Nh�ng sao ch�ng l�i c��p s� s�ch?",
        "H�nh nh� chuy�n h�ng Di�u L�p Th�nh c��p ���c kh�ng c� m�nh S�n H� X� T�c v� v�y m�i l�y s� s�ch xem �� b�n cho ai mong t�m ra manh m�i t�m b�n ��.",
        "V�y l� r�c r�i to r�i.",
        "��ng v�y! H�y ��n {Tuy�n Ch�u} t�m {V��ng Nghi�p V�} xem danh s�ch ng��i mua.",
        "Ta �i ngay!",
        "M�n �� n�y ta gi� l�i c�ng kh�ng d�ng, t�ng cho ng��i!"
    };
    local szNotFinished = {
        "��i phu n�i {D��c ph��ng} c�n {Ng�i b�i}, {R� s�n}, {B�i Lan}, {Li�n Ki�u}, {Kim Ng�n hoa} m�i th� {3 c�i} v� {10 l�ng} S�i xanh."
    };
    local nQingCount = 0;
    local nGeCount = 0;
    local nPeiCount = 0;
    local nLianCount = 0;
    local nJinCount = 0;
    local nMaoCount = 0;
    
    nQingCount = GetItemCount(2, 0, 33);    --����
    nGeCount = GetItemCount(2, 0, 34);      --���
    nPeiCount = GetItemCount(2, 0, 35);     --����
    nLianCount = GetItemCount(2, 0, 36);    --����
    nJinCount = GetItemCount(2, 0, 37);     --������
    nMaoCount = GetItemCount(2, 1, 5);      --��ë
    
    if ((nQingCount >= 3) and (nGeCount >= 3) and (nPeiCount >= 3) and (nLianCount >= 3) and (nJinCount >= 3) and (nMaoCount >= 10)) then
        TalkEx("task_005_00", szFinished);
    else
        TalkEx("task_005_01", szNotFinished);
    end;

end;

function task_005_01()
    if GetTrigger(83) == 0 then
        CreateTrigger(0, 193, 83);  --ɱ��ҩ��
    end;
end;

function task_005_00()
    GivePlayerAward("Level_12", "hard", "head", "Level_13");    --����
	GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong2")		--�ĽܵĿ���2
    SetTask(TASK_LEV_12_ID, 5);
    --ɾ���������
    DelItem(2, 0, 33, 3);
    DelItem(2, 0, 34, 3);
    DelItem(2, 0, 35, 3);
    DelItem(2, 0, 36, 3);
    DelItem(2, 0, 37, 3);
    DelItem(2, 1, 5, 10);
    RemoveTrigger(GetTrigger(83));  --ɾ����ҩ������
end;