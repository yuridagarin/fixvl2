--�����ű�
--created by lizhi
--2005-9-5 19:43

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function task_01_00()
    local szTalk = {
        "Xin h�i c� ph�i Gia C�t ti�n b�i kh�ng?",
        "Ch�nh l�o phu ��y, kh�ng bi�t <sex> t�m ta c� chuy�n g�?",
        "Th�nh �� ph� m��n c� chuy�n Hoa C��ng th�ch th�c ch�t chuy�n m�nh S�n H� X� T�c v�o cung, b�n ng��i L��ng S�n B�c �ang �m m�u, ngo�i ra ��m ng��i T�y H� nh�t ph�m ���ng c�ng �ang manh ��ng. T�i h� nh�t th�i kh�ng ngh� ra h��ng gi�i quy�t, xin ti�n b�i ch� th�. ��y l� t�n v�t ti�n b�i xem qua!",
        "<sex> c� bi�t Tr��ng Ca M�n kh�ng? �� l� t� ch�c ���c s�ng l�p b�i nguy�n l�o khai qu�c nh� T�ng. M�y h�m tr��c C�ng T�n Th� ph�t hi�n c�a ��ng Phong Ma �� m�, y�u ma nh�n c� h�i ra ngo�i h�i ng��i ta c�ng m�t s� �� t� ph�i ��n �� b�y tr�n. Chuy�n <sex> l�o phu kh�ng gi�p ���c r�i!",
        "V�y b�y gi� ph�i l�m sao?"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    local szTalk = {
        "<sex> kh�ng ph�i lo l�ng, l�o phu s� gi�i thi�u m�t ng��i nh�t ��nh gi�p ���c!",
        "L� ai v�y?",
        "Ng��i n�y t�n Tr�n Phi D��ng, �� t� 6 t�i C�i Bang, c��ng ngh� quy�t �o�n, r�t c� ngh�a kh�. <sex> h�y mang b�c th� n�y ��n Th�nh �� t�m N�n D�n gi�p, ng��i n�y s� d�n �i g�p Tr�n Phi D��ng.",
        "�a t� Gia C�t ti�n b�i!",
        "Kh�ng c�n �a l�!"
    };
    TalkEx("task_01_02", szTalk);
end;

function task_01_02()
    SetTask(TASK_JJC, 2);
    DelItem(2,0,78,1);
    AddItem(2,0,81,1);
    Msg2Player("T�m N�n D�n gi�p Th�nh ��");
    TaskTip("T�m N�n D�n gi�p Th�nh ��");
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"baifangzhugeqi1")		--�ݷ������1
end;

function task_02_00()
    local szTalk = {
        "Cho h�i c� ph�i {huynh �� C�i Bang} kh�ng?",
        "��ng r�i! Kh�ng bi�t <sex> ��n ��y g�y th� hay k�t b�n?",
        "T�i h� ���c {Gia C�t K�} gi�i thi�u ��n g�p m�t ���ng ch� Tr�n Phi D��ng, � ��y c� Phong th� xin xem qua.",
        "Ta kh�ng bi�t ch�, xem <sex> hi�n l�nh ch�c kh�ng g�t ta, nh�ng hi�n ta �ang th�m r��u. <sex> t�m gi�p ta 20 b�nh Thi�u t�u ���c kh�ng?",
        "���c th�i!"
    };
    TalkEx("task_02_01", szTalk);
end;

--2,1,12  �վ�

function task_02_01()
    SetTask(TASK_JJC, 3);
    Msg2Player("T�m 20 b�nh Thi�u t�u v� cho n�n d�n Gi�p");
    TaskTip("T�m 20 b�nh Thi�u t�u v� cho n�n d�n Gi�p");
    GivePlayerAward("Level_20", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"baifangzhugeqi2")		--�ݷ������2
end;

function task_03_00()
    local szSay = {
        "<sex> v� r�i �? C� mang r��u kh�ng?",
        "20 b�nh r��u ��y!/have_one",
        "Ch�a mua ���c, s� quay lai sau!/have_none"
    };
    SelectSay(szSay);
end;

function have_one()
    local szMsg = {
        "Ta �ang th�m r��u. <sex> gi�p ta t�m 20 b�nh Thi�u T�u ���c kh�ng?"
    };
    local szTalk = {
        "Nh�n m�y b�nh r��u n�y l�m ta li�n t��ng ��n m�y huynh �� c�ng ho�n n�n � Giang T�n th�n. <sex> gi�p ta �em m�y b�nh r��u n�y cho c�c huynh �� �y ���c kh�ng?",
        "���c th�i!"
    };
    if GetItemCount(2,1,12) >= 20 then
        TalkEx("task_03_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_03_01()
    SetTask(TASK_JJC, 4);
    SetTask(TASK_JJC_YI, 1);
    SetTask(TASK_JJC_BING, 1);
    SetTask(TASK_JJC_DING, 1);
    DelItem(2,1,12,5);
    Msg2Player("�em Thi�u t�u c�n l�i chia cho m�y n�n d�n kh�c");
    TaskTip("�em Thi�u t�u c�n l�i chia cho m�y n�n d�n kh�c");
    GivePlayerAward("Level_20", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangtangzhu1")		--ؤ������1
end;

function task_04_00()
    local szTalk = {
        "<sex> mau �em r��u ngon ph�n ph�t cho m�y n�n d�n kh�c!"
    };
    --�޲�����bug������
    if GetTask(TASK_JJC_YI) == 2 and GetTask(TASK_JJC_BING) == 2 and GetTask(TASK_JJC_DING) == 2 then
        --SetTask(TASK_JJC, 5);
        SetTask(TASK_JJC_YI, 0);
        SetTask(TASK_JJC_BING, 0);
        SetTask(TASK_JJC_DING, 0);
        task_05_00();
    else
    	TalkEx("", szTalk);
    end;
end;

function task_jjc_fq(nPerson)
    local szTalk = {};
    local nTaskID = 0;
    if GetItemCount(2,1,12) >= 5 then
        if nPerson == 2 then    --������
            szTalk = {
                "R��u ngon qu�! Nh�t ��nh l� Thi�u t�u!",
                "� ��y c�n 5 b�nh t� t� u�ng th�i!"
            };
            nTaskID = TASK_JJC_YI;
        elseif nPerson == 3 and GetCash() >= 50 then    --���������50ͭ����
            szTalk = {
                "Kh�ng r��u, kh�ng b�nh ng�, sao s�ng ��y!",
                "Ha ha! � ��y c� 5 b�nh Thi�u t�u. C�n v�i chung m�i ���c!.",
                "R��u ngon th� ph�i c� b�nh ng� n�a ch�. <sex> c� mang theo kh�ng?",
                "Kh�ng c�! Nh�ng ta c� th� cho ng��i 10 ti�n ��ng mua b�nh ng�."
            };
            nTaskID = TASK_JJC_BING;
        elseif nPerson == 3 and GetCash() < 50 then     --�������û��50ͭ
            szTalk = {
                "Kh�ng r��u, kh�ng b�nh ng�, sao s�ng ��y!",
                "Ha ha! � ��y c� 5 b�nh Thi�u t�u. C�n v�i chung m�i ���c!.",
                "R��u ngon th� ph�i c� b�nh ng� n�a ch�. <sex> c� mang theo kh�ng?",
                "��ng c�nh ng� m�!"
            };
            nTaskID = TASK_JJC_BING;
        elseif nPerson == 4 then    --����
            szTalk = {
                "N�n d�n Gi�p nh� ta mang {5 b�nh r��u} t�i, ng��i c�m l�y �i!",
                "(�c..�c�)",
                "Th� v� nh�!"
            };
            nTaskID = TASK_JJC_DING;
        end;
        if GetTask(nTaskID) == 1 then
            TalkEx("#task_jjc_fq_01("..nTaskID..")", szTalk);
        end;
    else
        szTalk = {
            "Kh�ng �� r��u! Ta �i t�m v�i b�nh n�a ��y!"
        };
        TalkEx("", szTalk);
    end;
end;

function task_jjc_fq_01(nTaskID)
    --GivePlayerAward("Level_20", "normal");
	if nTaskID == TASK_JJC_BING and GetCash() >= 50 then
    	Pay(10);
    end;
    ModifyExp(100);
	DelItem(2,1,12,5);
	SetTask(nTaskID, 2);
    --���3�������͹���
    if GetTask(TASK_JJC_YI) == 2 and GetTask(TASK_JJC_BING) == 2 and GetTask(TASK_JJC_DING) == 2 then
        SetTask(TASK_JJC, 5);
        SetTask(TASK_JJC_YI, 0);
        SetTask(TASK_JJC_BING, 0);
        SetTask(TASK_JJC_DING, 0);
    end;
end;

function task_05_00()
    local szTalk = {
        "M�y h�m r�i kh�ng g�p Tr�n �� ch�, nghe ��u �� ch� ��n Ki�m C�c th�c ��o, ng��i th� ��n �� t�m xem!",
        "���c! �� ta �i m�t chuy�n."
    };
    TalkEx("task_05_01", szTalk);
end;

function task_05_01()
    SetTask(TASK_JJC, 6);
    Msg2Player("�i Ki�m C�t Th�c ��o t�m Tr�n Phi D��ng");
    TaskTip("�i Ki�m C�t Th�c ��o t�m Tr�n Phi D��ng");
    GivePlayerAward("Level_20", "hard", "chest", "Level_27");
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangtangzhu2")		--ؤ������2
end;

function task_06_00()
    local szTalk = {
        "V� ��i ca ��y c� ph�i {Tr�n Phi D��ng} kh�ng?",
        "Ng�i qu�! K�u ta Tr�n huynh �� ���c r�i, t�m ta c� chuy�n g� kh�ng?",
        "Tr�n huynh �� qu� nhi�n lanh l�i! Ta ���c {Gia C�t ti�n b�i} gi�i thi�u ��n, t�n v�t ��y m�i xem qua!",
        "(��c xong v� m�t thay ��i h�n) Ta c�ng �ang phi�n chuy�n n�y. <sex> th�y cu�c chi�n gi�a T�y H� v� ��i T�ng th� n�o?"
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    local szTalk = {
        "V�n b�i m�i b��c ch�n v�o giang h� n�n kh�ng hi�u r� l�m, nh�ng �� l� con ch�u ��i T�ng th� kh�ng th� �� b�n �� S�n H� X� T�c r�i v�o tay k� ��ch. H�n n�a gia s� c� n�i m�t v� anh h�ng th�t s� kh�ng ph�i qua d�n t�c m� l� do ph�m ch�t c�a t�ng ng��i.",
        "� ch� c�a <sex> th�t ��ng kh�m ph�c. (suy ngh�) Ta ��nh xu�ng n�i gi�p <sex>m�t tay nh�ng b� b�n y�u ma trong Kim Quang ��ng �� th��ng, hi�n �i ��ng b�t ti�n. <sex> c� th� gi�p ta t�m h� c�t ���c kh�ng?",
        "Tr�n ��i ca c�n bao nhi�u h� c�t?",
        "10 c�i �� r�i!"
    };
    TalkEx("task_06_02", szTalk);
end;

function task_06_02()
    SetTask(TASK_JJC, 7);
    CreateTrigger(0,546,KILL_JJC_LAOHU);
    DelItem(2,0,81,1);
    Msg2Player("L�y 10 h� c�t cho Tr�n Phi D��ng");
    TaskTip("L�y 10 h� c�t cho Tr�n Phi D��ng");
    GivePlayerAward("Level_24", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"liaoshangzhiyao1")		--����֮ҩ1
end;

function task_07_00()
    local szTalk = {
        "<sex> �� t�m ���c h� c�t ch�a?",
        "10 h� c�t ��y!",
        "Xem ra v� c�ng <sex> kh�ng t�i, ��ng l� h�u sinh kh� �y.",
        "Tr�n ��i ca ��ng c��i!",
        "C� H� c�t ta ch� c�n d��ng th��ng v�i ng�y l� kh�i b�nh. L��ng S�n cao th� nh� m�y, h�y ��n �� m�t chuy�n. <sex>, ��y l� ph�p kh� ta l�y ���c trong Kim Quang ��ng, xin mang v� choGia C�t K� tr� y�u. N�u c� tin t�c l�p t�c ��n Ki�m C�c Th�c ��o h�i ng� v�i c�c huynh ��!",
        "Ta v� Th�nh �� tr��c ��y, xin b�o tr�ng!"
    };
    local szMsg = {
        "<sex> �� t�m ���c h� c�t ch�a?",
        "V�n ch�a t�m ���c."
    };
    if GetItemCount(2,0,55) >= 10 then
        TalkEx("task_07_01", szTalk);
    else
        TalkEx("task_07_02", szMsg);
    end;
end;

function task_07_02()
    if GetTrigger(KILL_JJC_LAOHU) == 0 then
        CreateTrigger(0,546,KILL_JJC_LAOHU);
    end;
end;

function task_07_01()
    DelItem(2,0,55,10);
    AddItem(2,0,83,1);
    SetTask(TASK_JJC, 8);
    Msg2Player("Mang ph�p kh� giao cho Gia C�t K�");
    TaskTip("Mang ph�p kh� giao cho Gia C�t K�");
    GivePlayerAward("Level_24", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"liaoshangzhiyao2")		--����֮ҩ2
end;

function task_08_00()
    local szTalk = {
        "<sex> t�m ���c Tr�n Phi D��ng ch�a?",
        "T�m ���c r�i! Tr�n ��i ca b�o ta mang ph�p kh� n�y v� ti�u di�t y�u ma.",
        "�� ta xem ti�u t� Phi D��ng t�m ���c b�o b�i g�? Kh� l�m! Kh�ng ng� h�n t�m ���c T�a Y�u Chung.",
        "T�a Y�u Chung?",
        "��y l� lo�i chu�ng Tr��ng Thi�n S� s� d�ng nh�t c�c h�n ma. <sex>c� th� d�ng ch�ng nh�t th�y ma, c��ng thi. N�u n�ng l�c kh�ng ��, c� th� ��n Giang T�n Th�n t�m Tr��ng ��nh (191.167) ngh� c�ch.",
        "Ta c�ng mu�n th� uy l�c c�a lo�i chu�ng n�y."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    DelItem(2,0,83,1);
    AddItem(2,0,84,1);
    CreateTrigger(0,547,KILL_JJC_FS);
    CreateTrigger(0,548,KILL_JJC_XS);
    SetTask(TASK_JJC, 9);
    Msg2Player("T�m 25 Oan h�n H� Thi v� 15 Oan h�n H�nh thi");
    TaskTip("T�m 25 Oan h�n H� Thi v� 15 Oan h�n H�nh thi");
    GivePlayerAward("Level_26", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"huangyeyuanhun1")		--��Ұԩ��1
end;

function task_09_00()
    local szTalk = {
        "<sex> t�m ���c bao nhi�u Oan h�n r�i?",
        "Thu ���c 25 Oan h�n H� Thi v� 15 Oan h�n H�nh Thi.",
        "H�m..!",
        "Ti�n b�i phi�n mu�n chuy�n g� v�y?",
        "<sex> c� bi�t c�c th�y ma, c��ng thi n�y ��u l� nh�ng d�n l�ng ch�t kh�ng ���c si�u tho�t h�a th�nh kh�ng? Ta kh�ng nh�n t�m h�y ch�ng.",
        "Nghe n�i {cao t�ng Thi�u L�m c� th� d�ng Ph�t ph�p si�u �� cho c�c h�n ma}, c� c�n t�i h� ��n Thi�u L�m m�t chuy�n kh�ng?",
        "<sex> qu� l� t� bi, sau n�y s� g�p �i�u l�nh! Gi� nh� <sex> ��n Thi�u L�m m�t chuy�n!"
    };
    local szMsg = {
        "<sex> mau mang theo T�a Y�u Chung n�y thu ph�c Oan h�n {H� Thi v� H�nh Thi}!"
    };
    --ԩ����������
    if GetItemCount(2,0,85) < 25 or GetItemCount(2,0,86) < 15 then
        TalkEx("task_09_02", szMsg);
        if GetItemCount(2,0,84) == 0 then
            AddItem(2,0,84,1);
        end;
    else
        TalkEx("task_09_01", szTalk);
    end;
end;

function task_09_02()
    if GetTrigger(KILL_JJC_FS) == 0 then
        CreateTrigger(0,547,KILL_JJC_FS);
    end;
    if GetTrigger(KILL_JJC_XS) == 0 then
        CreateTrigger(0,548,KILL_JJC_XS);
    end;
end;

function task_09_01()
    RemoveTrigger(GetTrigger(KILL_JJC_FS));
    RemoveTrigger(GetTrigger(KILL_JJC_XS));
    if GetItemCount(2,0,84) == 0 then
        AddItem(2,0,84,1);
    end;
    SetTask(TASK_JJC, 10);
    Msg2Player("�em oan h�n ��n Thi�u L�m t�m cao t�ng si�u ��");
    TaskTip("�em oan h�n ��n Thi�u L�m t�m cao t�ng si�u ��");
    GivePlayerAward("Level_26", "hard", "head", "Level_30");
	GivePlayerExp(SkeyCDFanzhongyan,"huangyeyuanhun2")		--��Ұԩ��2
end;

function task_10_00()
    local szTalk = {
        "Th� ch� xin d�ng b��c! N�i ��y cho c�c cao t�ng tu luy�n, kh�ng n�n mang {h�n ma} v�o.",
        "T�i h� ��n ��y v� chuy�n oan h�n. (K� cho V� Danh t�ng nghe chuy�n x�y ra � Giang T�n Th�n)",
        "��m Oan H�n kia �� ch�t nh�ng kh�ng th� gi�i tho�t! Th� ch� c� th� giao T�a Y�u Chung cho B�n T�ng. Ta s� c� c�ch gi�p ch�ng si�u tho�t. <sex> h�y ��n Giang T�n Th�n t�m {Di v�t} �� gi�i tho�t cho Oan H�n",
        "Di v�t n�o?",
        "{B�t c� th� g�} � Giang T�n Th�n.",
        "Ta th�y Giang T�n Th�n c� m�t lo�i hoa m�u �� r�t ��p t�n {V�ng Giang H�ng}, �� ta h�i 5 ��a v�.",
        "A Di �� Ph�t!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_JJC, 11);
    DelItem(2,0,84,1);
    DelItem(2,0,85,25);
    DelItem(2,0,86,15);
    CreateTrigger(0, 549, KILL_JJC_WJH);
    Msg2Player("��n Giang T�n Th�n t�m 5 ��a V�ng Giang H�ng");
    TaskTip("��n Giang T�n Th�n t�m 5 ��a V�ng Giang H�ng");
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi1")		--��������1
end;

function task_11_00()
    local szTalk = {
        "<sex> c� �em ���c di v�t � Giang T�n Th�n v� kh�ng?",
        "{V�ng Giang H�ng} ��y!",
        "Ta s� �em T�a Y�u Chung v� V�ng Giang H�ng ��t d��i th�p, c�c �� t� s� ni�m kinh si�u tho�t oan h�n, kho�ng 1 gi� sau th� ���c. Hi�n b�n t�ng c� chuy�n kh�ng r� mu�n th�nh gi�o s� ph�!",
        "Xin ��i s� c� h�i.",
        "B�n t�ng nghe n�i T�a Y�u Chung b� m�t t�ch trong cu�c chi�n ch�nh t�, kh�ng bi�t th� ch� l�y t� ��u?"
    };
    local szMsg = {
        "<sex> c� �em ���c di v�t � Giang T�n Th�n v� kh�ng?",
        "�� ta ��n {Giang T�n Th�n}."
    };
    if GetItemCount(2,0,87) >= 5 then
        TalkEx("task_11_01", szTalk);
    else
        TalkEx("task_11_02", szMsg);
    end;
end;

function task_11_02()
    if GetTrigger(KILL_JJC_WJH) == 0 then
        CreateTrigger(0, 549, KILL_JJC_WJH);
    end;
end;

function task_11_01()
    local szTalk = {
        "C� ���c chu�ng l� nh� s� gi�p �� c�a {Tr�n Phi D��ng}, �� ch� ��ng T� ���ng c�a C�i Bang.",
        "Ch� tr�ch m�y h�m tr��c l�o n�p th�y Phi D��ng ��n th�m vi�ng Ph��ng Tr��ng.",
        "Nghe ��i s� n�i v�y, kh�ng l� Tr�n ��i ca l� ng��i c�a Thi�u L�m?",
        "Phi D��ng t� nh� �� m�t song th�n, ���c Huy�n T� ��i s� mang v� Thi�u L�m nu�i d��ng, v� sau l�i ���c Long T�i Thi�n bang ch� c�a C�i Bang thu l�m �� t�, truy�n d�y v� c�ng.",
        "Ta th�y Tr�n ��i ca �ang phi�n mu�n.",
        "Th�i gian kh�ng c�n nhi�u, th� ch� � ��y ��i ta mang chu�ng v�."
    };
    TalkEx("task_11_02", szTalk);
end;

function task_11_02()
    SetTask(TASK_JJC, 12);
    DelItem(2,0,87,5);
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi2")		--��������2
end;

function task_12_00()
    local szTalk = {
        "Oan h�n b�n trong �� ���c si�u tho�t, qu� th�t c�ng ��c v� l��ng.",
        "Vi�c si�u �� oan h�n ��i s� c� c�ch n�o hay h�n kh�ng?",
        "Th�nh �� x�y ra bi�n c� l�n nh� v�y Thi�u L�m kh�ng th� ��ng nh�n. Th� ch� y�n t�m, l�o n�p s� n�i l�i v�i Ph��ng Tr��ng l�u � chuy�n n�y!",
        "Phi�n ��i s�!",
        "A Di �� Ph�t!"
    };
    TalkEx("task_12_01", szTalk);
end;

function task_12_01()
    SetTask(TASK_JJC, 13);
    Msg2Player("Quay v� g�p Gia C�t K�");
    TaskTip("Quay v� g�p Gia C�t K�");
    GivePlayerAward("Level_28", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi3")		--��������3
end;

function task_13_00()
    local szTalk = {
        "<sex> ngh� Oan h�n �� ���c si�u tho�t ch�a?",
        "��i hi�p y�n t�m, nh�ng oan h�n �� �� ���c cao t�ng si�u tho�t h�n n�a Thi�u L�m �ang cho ng��i ��n gi�p tr� y�u.",
        "Ta ph�t hi�n trong h�nh l� c�a Tr�n Phi D��ng c�n b�c th� ���c vi�t b�ng lo�i m�c ��c bi�t.",
        "V�y sao ��c?",
        "Giang T�n Th�n c� r�t nhi�u qu� �en, ch� c�n �em l�ng c�a ch�ng v� ta s� c� c�ch."
    };
    TalkEx("task_13_01", szTalk);
end;

function task_13_01()
    SetTask(TASK_JJC, 14);
    CreateTrigger(0,550,KILL_JJC_HY);
    Msg2Player("��nh Qu� �en � Giang T�n Th�n l�y  4 s�i l�ng v�");
    TaskTip("��nh Qu� �en � Giang T�n Th�n l�y  4 s�i l�ng v�");
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"mixinyiyun1")		--��������1
end;

function task_14_00()
    local szTalk = {
        "�em l�ng v� ��t th�nh tro r�i l�n b�c th� ch� s� hi�n ra. <sex> c� t�m ���c kh�ng?",
        "C� ��y!",
        "C� l� chuy�n n�y Tr�n ��i ca qu�n c�n d�n, ta ph�i ��n {� M�ng b�} ��y!",
        "� M�ng b� l� ��a b�n c�a ng��i Mi�u, nghe n�i ch�ng thu�c gi�o �� Xi H�a gi�o. <sex> nh� th�n tr�ng!"
    };
    local szMsg = {
        "�em l�ng v� ��t th�nh tro r�i l�n b�c th� ch� s� hi�n ra. <sex> c� t�m ���c kh�ng?",
        "Ch�a t�m ���c qu� �en."
    };
    if GetItemCount(2,0,88) >= 4 then
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szMsg);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_JJC_HY) == 0 then
        CreateTrigger(0,550,KILL_JJC_HY);
    end;
end;

function task_14_01()
    SetTask(TASK_JJC, 15);
    RemoveTrigger(GetTrigger(KILL_JJC_HY));
    DelItem(2,0,88,4);
    CreateTrigger(0,551,KILL_JJC_SN);
    Msg2Player("��n � M�ng b� �o�t v�t ph�m");
    TaskTip("��n � M�ng b� �o�t v�t ph�m");
    GivePlayerAward("Level_28", "hard", "legs", "Level_32");
	GivePlayerExp(SkeyCDFanzhongyan,"mixinyiyun2")		--��������2
end;

function task_15_00()
    local szTalk = {
        "Tr�n Phi D��ng �� c�p trong th� v� m�n �� qu� r�i v�o tay � M�ng b�. <sex> mau gi�p �o�t v�!"
    };
    TalkEx("task_15_01", szTalk);
end;

function task_15_01()
    if GetTask(TASK_JJC) == 15 then
        if GetTrigger(KILL_JJC_SN) == 0 then
            CreateTrigger(0,551,KILL_JJC_SN);
        end;
    elseif GetTask(TASK_JJC) == 16 then
        if GetTrigger(KILL_JJC_SN) == 0 then
            CreateTrigger(0,551,KILL_JJC_SN);
        end;
        if GetTrigger(KILL_JJC_ZR) == 0 then
            CreateTrigger(0,552,KILL_JJC_ZR);
        end;
        if GetTrigger(KILL_JJC_YS) == 0 then
            CreateTrigger(0,553,KILL_JJC_YS);
        end;
    end;
end;

function task_17_00()
    local szTalk = {
        "C� m�t t�n h�o h�n �ang ��n, ng��i mau xu�ng n�i xem h�n l� ai.",
        "N�u kh�ng ���c m�i<sex> ta c�ng kh�ng ��n.",
        "Kh�u kh� kh� l�m! Mu�n th� s�c th� qua b�n kia ��u v�i V�n L� Kim Cang T�ng V�n, Th�i M�nh Ph�n Quan L� L�p, M�u ��i Tr�ng C� ��i T�u, n�u th�ng ���c h� ta s� cho ng��i � l�i.",
        "���c �� ta cho h� th�y l�i h�i th� n�o."
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    SetTask(TASK_JJC, 18);
    SetTask(TASK_JJC_BEAT_SW, 0);
    SetTask(TASK_JJC_BEAT_LL, 0);
    SetTask(TASK_JJC_BEAT_G, 0);
    Msg2Player("��nh b�i V�n L� Kim Cang T�ng V�n, Th�i M�nh Ph�n Quan L� L�p v� M�u ��i Tr�ng C� ��i T�u");
    TaskTip("��nh b�i V�n L� Kim Cang T�ng V�n, Th�i M�nh Ph�n Quan L� L�p v� M�u ��i Tr�ng C� ��i T�u");
    GivePlayerAward("Level_34", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"liangshanhaohan1")		--��ɽ�ú�1
end;

function task_18_00()
    local szTalk = {
        "Th�ng kh�ng n�i h� th� ��ng x�ng hi�p kh�ch v�i ta�Haha!",
        "Ch�a ��nh xong m�!"
    };
    if GetTask(TASK_JJC_BEAT_SW) == 2 and GetTask(TASK_JJC_BEAT_LL) == 2 and GetTask(TASK_JJC_BEAT_G) == 2 then
    	task_19_00();
    else
    	TalkEx("", szTalk);
    end;
end;

function task_19_00()
    local szTalk = {
        "Th�ng kh�ng n�i h� th� ��ng x�ng hi�p kh�ch v�i ta�Haha!",
        "Ta �� ��nh b�i 3 ng��i ��.",
        "<sex> tu�i tr� t�i cao. Ta �� nh�n l�m ng��i!",
        "N�u kh�ng c� {th� m�i} ta c�ng kh�ng l�n L��ng S�n ��u!",
        "Th� g�?",
        "Th� g�i cho Tr��ng Ca M�n?",
        "(Kinh ng�c) Sao n� l�i � ��y! Kh�ng lυNg��i ��u b�t t�n tr�m th� cho ta!"
    };
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    local szTalk = {
        "��ng n�ng, b�c th� n�y ta �o�t t� tay ng��i Mi�u. M� sao ti�n b�i h�i v� th�n th� c�a {Tr�n ��i ca}?",
        "<sex> ch�c c�ng c� nghe qua chuy�n h�ng Hoa C��ng th�ch b�n trong ch�a m�nh S�n H� X� T�c. Tin n�y do Tr�n Phi D��ng n�i v�i ta. G�n ��y ta l�i nh�n ���c tin ��m ng��i T�y H� Nh�t Ph�m ���ng mu�n nh�ng tay v�o v� n�y. Ta nghi c� ng��i ti�t l�, ng��i ta nghi ng� l� Tr�n Phi D��ng, h�n v�n d� kh�ng ph�i ng��i H�n.",
        "Ta kh�ng tin Tr�n ��i ca ti�t l� cho ng��i Nh�t Ph�m ���ng!"
    };
    TalkEx("task_19_02", szTalk);
end;

function task_19_02()
    local szTalk = {
        "M�nh S�n H� X� T�c li�n quan ��n giang s�n ��i T�ng, Tr�n Phi D��ng t� nh� ���c Thi�u L�m nu�i d��ng. <sex> th� ��n �� h�i xem, ta c�ng hy v�ng Tr�n Phi D��ng trong s�ch.",
        "Ta �i ngay, b�c th� c�a ti�n b�i ��y!"
    };
    TalkEx("task_19_03", szTalk);
end;

function task_19_03()
    SetTask(TASK_JJC, 20);
    DelItem(2,0,89,1);
    DelItem(2,0,90,1);
    DelItem(2,0,91,1);
    DelItem(2,0,92,1);
    DelItem(2,0,93,1);
    Msg2Player("T�ng Giang nghi Tr�n Phi D��ng ti�t l�, ��n Thi�u L�m l�m r� ch�n t��ng s� vi�c");
    TaskTip("T�ng Giang nghi Tr�n Phi D��ng ti�t l�, ��n Thi�u L�m l�m r� ch�n t��ng s� vi�c");
    GivePlayerAward("Level_34", "hell", "chest", "Level_35");
	GivePlayerExp(SkeyCDFanzhongyan,"liangshanhaohan2")		--��ɽ�ú�2
end;

function task_20_00()
    local szTalk = {
        "Tham ki�n ��i s�!",
        "Kh�ng c�n �a l�, th� ch� t�m l�o n�p c� chuy�n g�?",
        "T�i h� c� ch�t giao t�nh v�i Tr�n ��i ca, nghe n�i ng��i n�y t� nh� �� � trong Thi�u L�m, ch�c ��i s� hi�u r� t�nh c�ch (k� l�i c�u chuy�n T�ng Giang nghi ng�), mong ��i s� gi�i th�ch d�m.",
        "Th� ch� th�y chuy�n n�y th� n�o? L�o n�p ch� c� th� cung c�p cho <sex> m�t manh m�i, Phi D��ng t� nh� s�ng t�i Thi�u L�m nh�ng c��ng quy�t kh�ng ch�u xu�t gia, ��n n�m 17 tu�i trong t� c� m�t ng��i th� chuy�n tu s�a ��ng nh�n � {m�t th�t}, t� �� Phi D��ng th��ng lui t�i, kh�ng l�u sau b�i Long T�i Thi�n l�m s� ph�, gia nh�p C�i Bang.",
        "�a t� ��i s�!",
        "A Di �� Ph�t!"
    };
    TalkEx("task_20_01", szTalk);
end;

function task_20_01()
    SetTask(TASK_JJC, 21);
    CreateTrigger(0,557,KILL_JJC_TR);
    Msg2Player("��n m�t th�t Thi�u L�m ��nh b�i ��ng nh�n t�m ra manh m�i");
    TaskTip("��n m�t th�t Thi�u L�m ��nh b�i ��ng nh�n t�m ra manh m�i");
    GivePlayerAward("Level_36", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"tongrendemimi1")		--ͭ�˵�����1
end;

function task_21_00()
    local szTalk = {
        "T�i h� ph�t hi�n {��ng nh�n} gi� nhi�u {M�nh ��ng}, tr�n �� c� {kh�c ch�} kh�ng bi�t l� g�?",
        "��y kh�ng ph�i kinh v�n, l�o n�p c�ng kh�ng hi�u. <sex> th� t�m Gia C�t K� xem c� gi�i th�ch ���c kh�ng?"
    };
    local szMsg = {
        "L�o n�p ch� c� th� cung c�p cho <sex> m�t manh m�i. Phi D��ng t� nh� s�ng t�i Thi�u L�m nh�ng c��ng quy�t kh�ng ch�u xu�t gia, ��n n�m 17 tu�i trong t� c� m�t ng��i th� chuy�n tu s�a ��ng nh�n � {m�t th�t}, t� �� Phi D��ng th��ng lui t�i."
    };
    if GetItemCount(2,0,94) >= 8 then
        TalkEx("task_21_01", szTalk);
    else
        TalkEx("task_21_02", szMsg);
    end;
end;

function task_21_02()
    if GetTask(KILL_JJC_TR) == 0 then
        CreateTrigger(0,557,KILL_JJC_TR);
    end;
end;

function task_21_01()
    SetTask(TASK_JJC, 22);
    Msg2Player("V� Giang T�n Th�n t�m Gia C�t K�");
    TaskTip("V� Giang T�n Th�n t�m Gia C�t K�");
    GivePlayerAward("Level_36", "hard", "head", "Level_38");
	GivePlayerExp(SkeyCDFanzhongyan,"tongrendemimi2")		--ͭ�˵�����2
end;

function task_22_00()
    local szTalk = {
        "Chuy�n �i � M�ng b� c�a <sex>c� thu th�p ���c tin t�c g� kh�ng?",
        "(Thu�t l�i c�u chuy�n). ��y l� {M�nh ��ng}, nh� ti�n b�i xem gi�p b�n tr�n ghi g�?",
        "Ta ph�i t�n ch�t th�i gian cho m�y d�ng ch� n�y, s� <sex> ��i l�u th�i! ��y c� 10 l��ng, gi�p ta mua 2 ��a m�ng x�o, 4 c�i b�nh ng� v� ��y!",
        "V�y kh�ng l�m phi�n, ti�n b�i c� nghi�n c�u."
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    Earn(1000);
    SetTask(TASK_JJC, 23);
    DelItem(2,0,94,8);
    Msg2Player("Mua 2 ��a m�ng chay, 4 b�nh ng� cho Gia C�t K�");
    TaskTip("Mua 2 ��a m�ng chay, 4 b�nh ng� cho Gia C�t K�");
    GivePlayerAward("Level_38", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shizhengshixie1")		--������а1
end;

function task_23_00()
    local szTalk = {
        "Tuy�t di�u! Kh�ng ng� ng��i T�y H� thi�t k� ���c m�t m� n�y.",
        "Th� ti�n b�i c�n ��y!",
        "<sex> v� ��ng l�c l�m, ta �� t�m ra b� m�t b�n trong, ��y l� m�t m� giao ti�p ���c vi�t b�ng th� ch� l� c�a ng��i T�y H�.",
        "Kh�ng l� Tr�n ��i ca l� {gian t�}!",
        "Ta c�ng kh�ng r�! B�ng h�u th� ��n g�p Tr�n Phi D��ng. Chuy�n �i l�n n�y n�n h�t s�c th�n tr�ng!"
    };
    local szMsg = {
        "Tuy�t di�u! Kh�ng ng� ng��i T�y H� thi�t k� ���c m�t m� n�y.",
        "Ti�n b�i t� t� nghi�n c�u."
    };
    if GetItemCount(1,1,1) >= 4 and GetItemCount(1,1,6) >= 2 then
        TalkEx("task_23_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_23_01()
    local szTalk = {
        "Xin ti�n b�i ch� gi�o!",
        "Hi�n gi� v�n ch�a kh�ng ��nh ���c Tr�n Phi D��ng thu�c phe ch�nh hay t�. T�t c� ��u l� gi� thi�t, kh�ng ch�ng c�. Phi�n <sex> l�i ��n �� m�t chuy�n xem sao!",
        "T�i h� �i ngay!",
        "Tr�n Phi D��ng th�nh danh �� l�u, v� c�ng cao c��ng. <sex> kh�ng n�n khi�u chi�n v�i h�n.",
        "�a t� ti�n b�i nh�c nh�!",
    };
    TalkEx("task_23_02", szTalk);
end;

function task_23_02()
    DelItem(1,1,1,4);
    DelItem(1,1,6,2);
    SetTask(TASK_JJC, 24);
    Msg2Player("�i Ki�m C�t Th�c ��o t�m Tr�n Phi D��ng");
    TaskTip("�i Ki�m C�t Th�c ��o t�m Tr�n Phi D��ng");
    GivePlayerAward("Level_38", "hard", "legs", "Level_40");
	GivePlayerExp(SkeyCDFanzhongyan,"shizhengshixie2")		--������а2
end;

function task_24_00()
    local szTalk = {
        "<sex> c� chuy�n g� m� g�p v�y. �ang ��nh ��n L��ng S�n h�i th�m m�t s� tin t�c th� ng��i ��n.",
        "Ta �o�n ng��i s� kh�ng ��n ��!",
        "<sex> sao l�i n�i v�y?",
        "Ng��i l� {n�i �ng c�a T�y H� � Trung Nguy�n}, �o�t ���c 1 quy�n S�n H� X� T�c ch�nh l� �� {ti�t l�} cho T�y H� Nh�t Ph�m ���ng!",
        "<sex> c� ch�ng c� g� kh�ng?",
        "Kh�ng nh�ng ta �i�u tra ���c qu� kh� m� c�n t�m th�y ch�ng c� ng��i c�u k�t v�i {T�y H�}. Mau theo ta v� ch�u t�i.",
        "N�u ng��i �� bi�t r�i th� ��ng mong r�i kh�i ��y. �ao Tuy�t, Ki�m Cu�ng mau b�t h�n l�i!"
    };
    TalkEx("task_24_01", szTalk);
end;

function task_24_01()
    CreateTrigger(0,558,KILL_JJC_JK);
    CreateTrigger(0,559,KILL_JJC_DJ);
    SetTask(TASK_JJC, 25);
    Msg2Player("��nh b�i 10 t�n �ao Tuy�t, 8 t�n Ki�m Cu�ng");
    TaskTip("��nh b�i 10 t�n �ao Tuy�t, 8 t�n Ki�m Cu�ng");
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"zhenshishenfen1")		--��ʵ���1
end;

function task_25_00()
    local szMsg = {
        "�ao Tuy�t, Ki�m Cu�ng b�t l�y h�n!"
    };
    TalkEx("task_25_01", szMsg);
end;

function task_25_01()
    if GetTask(TASK_JJC_JK) == 0 and GetTrigger(KILL_JJC_JK) == 0 then
        CreateTrigger(0,558,KILL_JJC_JK);
    end;
    if GetTask(TASK_JJC_DJ) == 0 and GetTrigger(KILL_JJC_DJ) == 0 then
        CreateTrigger(0,559,KILL_JJC_DJ);
    end;
end;

function task_27_00()
    local szTalk = {
        "M�y ng�y kh�ng g�p m� v� c�ng <sex> ti�n b� h�n, ngay c� cao th� c�a T�y H� c�ng b� ��nh b�i. Xem ra cu�c chi�n gi�a ta v� ng��i kh�ng th� tr�nh kh�i.",
        "K� th�c ta c�ng kh�ng mu�n nh� v�y.",
        "��ng nhi�u l�i, ra tay �i!"
    };
    TalkEx("task_27_01", szTalk);
    SetTask(TASK_JJC_TEMP, GetTargetNpc());
end;

function task_27_01()
    
    ChangeNpcToFight(GetTask(TASK_JJC_TEMP));

--    SetTask(TASK_JJC, 28);
--    --log������
--    CreateTrigger(3, 205, LEAVE_GAME_JJC);
--    SetLogType(GetTrigger(LEAVE_GAME_JJC), 1); --����Ϊ�ų�����
--    
--    --rect ������
--    CreateTrigger(2,1302,LEAVE_RECT_JJC);
--    
--    SetDeathScript("\\script\\task\\world\\lizhi_�����\\task_Death.lua");
    Msg2Player("��nh b�i Tr�n Phi D��ng");
    TaskTip("��nh b�i Tr�n Phi D��ng");
end;

function task_29_00()
    local szTalk = {
        "Ta ch� th� th�i, kh�ng ng� ng��i ch�nh l� gian t� c�a T�y H�.",
        "Gian t� th� sao? Ta ��u ph�i ng��i H�n, c� l� ch�t l� c�ch hay nh�t!",
        "�",
        "Ta kh�ng s�ng ���c bao l�u, � ��y c� 2 b�c th� vi�t cho bang ch� C�i Bang v� Ph��ng Tr��ng Thi�u L�m, hy v�ng <sex> gi�p ta ��a cho h� n�i r�ng Phi D��ng c� l�i v�i hai v�.",
        "Ta s� trao t�n tay cho h�.",
        "V�y ta y�n t�m r�i!",
        "�"
    };
    TalkEx("task_29_01", szTalk);
    SetTask(TASK_JJC, 30);
    AddItem(2,0,95,1);  --�����ֵ���
    AddItem(2,0,96,1);  --��ؤ�����
end;

function task_29_01()
    Msg2Player("�em di th� Tr�n Phi D��ng g�i cho Thi�u L�m");
    TaskTip("�em di th� Tr�n Phi D��ng g�i cho Thi�u L�m");
    GivePlayerAward("Level_40", "hell", "weapon", "Level_40");
	GivePlayerExp(SkeyCDFanzhongyan,"zhenshishenfen2")		--��ʵ���2
end;

function task_30_00()
    local szTalk = {
        "� ��y c� {b�c th�} g�i cho ��i s�, tr��c khi l�m chung Tr�n Phi D��ng mu�n n�i l�i {xin l�i}.",
        "Phi D��ng v�n l���! �a t� �� <sex> chuy�n l�i.",
        "Ph��ng Tr��ng ��ng nh�c n�a, ban ��u t�i h� t��ng Tr�n Phi D��ng l� trang nam t�, kh�ng ngꅅ"
    };
    TalkEx("task_30_01", szTalk);
end;

function task_30_01()
    local szTalk = {
        "Th� ch� �� tr�ch nh�m Tr�n Phi D��ng, m�y ng�y tr��c h�n c� ��n ��y t�m l�o n�p t�m s�, t�m tr�ng h�n r�i b�i m�t b�n l� v� l�m Trung Nguy�n, m�t b�n t� qu�c. Ta c� gi�i th�ch nh�ng cu�i c�ng v�n ch�n k�t li�u ��i m�nh. H�n xem <sex> l� m�t ng��i b�n th�t s�.",
        "(Suy ngh�)...t�i h� c�n b�c th� ph�i g�i cho {C�i Bang}, xin c�o t�!",
        "A Di �� Ph�t! �i ���ng b�o tr�ng!"
    };
    TalkEx("task_30_02", szTalk);
end;

function task_30_02()
    SetTask(TASK_JJC, 31);
    DelItem(2,0,95,1);
    Msg2Player("�em di th� Tr�n Phi D��ng g�i cho C�i Bang");
    TaskTip("�em di th� Tr�n Phi D��ng g�i cho C�i Bang");
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang1")		--������1
end;

function task_31_00()
    local szTalk = {
        "Tr�n Phi D��ng nh� t�i h� mang {b�c th�} g�i cho Long l�o ti�n b�i!",
        "Tr�n huynh �� sao sao r�i? <sex> Sao ng��i l�i c� b�c th� n�y?",
        "Tr�n Phi D��ng l�c l�m chung nh� t�i h� g�i cho C�i Bang. Tr��c khi ch�t anh ta c�n mu�n n�i l�i xin l�i ��n {Long l�o bang ch�}.",
        "Tr�n huynh �� n�y th�t l� h� ��, l�o ��y tuy gi� nh�ng v�n c�n mu�n s�ng, h� t�t g� ph�i t�m ��n c�i ch�t?"
    };
    TalkEx("task_31_01", szTalk);
end;

function task_31_01()
    local szTalk = {
        "Nghe Long l�o ti�n b�i n�i, kh�ng l� Tr�n Phi D��ng mu�n t� h�y ho�i danh ti�ng m�nh?",
        "<sex> t� ch�t h�n ng��i, v� c�ng phi ph�m nh�ng v�n kh�ng ph�i ��i th� c�a Tr�n huynh ��, n�u kh�ng ph�i h�n nh��ng <sex> kh�ng t�i n�o �� th��ng ���c.",
        "��Nghe Ph��ng Tr��ng Thi�u L�m v� ti�n b�i n�i, xem ra b�n trong nhi�u u�n kh�c, t�i h� ch�a nh�n ra v�n �� ����"
    };
    TalkEx("task_31_02", szTalk);
end;

function task_31_02()
    local szTalk = {
        "<sex> c�ng kh�ng n�n t� tr�ch m�nh, l�o ��y c�m �n <sex>ng��i �� gi�p cho huynh �y to�i nguy�n. Trong th� Tr�n huynh �� c� nh�c ��n k� ho�ch c��p m�nh S�n H� X� T�c. <sex> mau v� n�i v�i Ph�m ti�n sinh �� ph�ng.",
        "V�y c�ng t�t! Sau n�y c� chuy�n g� b�o cho v�n b�i ��y bi�t v�i.",
        "���c! N�u c� tin t�c g� ta s� cho ng��i th�ng bao ngay<sex>."
    };
    TalkEx("task_31_03", szTalk);
end;

function task_31_03()
    SetTask(TASK_JJC, 32);
    DelItem(2,0,96,1);
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang2")		--������2
end;

function task_32_00()
    local szTalk = {
        "Gi� tho�ng m�y bay. ��p qu�! ��p qu�!",
        "Tr�n ��i ca! May qu� huynh �y c�n s�ng!",
        "Th� ch� nh�n l�m ng��i ch�ng? B�n t�ng l� V�n Du t�ng nh�n, ph�p hi�u Thanh Phong",
        "Xin l�i ��i s�!"
    };
    TalkEx("", szTalk);
end;

function task_32_zgq()
    local szTalk = {
        "<sex> h�y ra giang h� r�n luy�n th�m �i!"
    }
    TalkEx("task_32_01", szTalk);
end;

function task_32_01()
    SetTask(TASK_JJC, 33);
    GivePlayerAward("Level_40", "hard", "legs", "Level_49");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang3")		--������3
end;

function task_33_00()
    local szTalk = {
        "<sex> h�y ra giang h� r�n luy�n th�m �i!"
    }
    TalkEx("", szTalk);
end;