--���������֧
--created by lizhi
--2005-9-2 10:12

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

---------------------------------------���ݷ�֧��-------------------------------------

function task_01_00()
    local szTalk = {
        "Th�t l� xui x�o!",
        "Chuy�n g� v�y?",
        "M�y ng�y tr��c con trai ta t� b� th��ng � ch�n, ta ��nh l�n {V� Di s�n} h�i �t D��c th�o v� k�t qu� b� ��m v��n tr�ng, h� ly t�n c�ng, ng��i gi�p ta ��n �� mang {tay n�i} v� ���c kh�ng?",
        "Chuy�n n�y �� t�i h� lo li�u!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    SetTask(TASK_YZ_THREE, 2);
    CreateTrigger(0,538,KILL_YZ_BG);
    Msg2Player("��n V� Di s�n t�m tay n�i Tr��ng B� H�n");
    TaskTip("��n V� Di s�n t�m tay n�i Tr��ng B� H�n");
end;

function task_02_00()
    local szMsg = {
        "Tay n�i c�a ta r�i � {V� Di s�n} phi�n <sex> gi�p ta l�y v�!"
    }
    local szTalk = {
        "��ng n� r�i! �a t�! �a t�!",
        "��m qu�i n�y � ��u ra v�y?",
        "Sao ta bi�t? Ng��i th� ��n D��ng Ch�u t�m {L� Ti�n D�ng}, ���c m�nh danh Thi�t Ch�y, may ra s� gi�p ���c cho ng��i!",
        "�� t�i h� �i h�i th�!"
    };
    if GetItemCount(2,0,144) >= 1 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("task_02_02", szMsg);
    end;
end;

function task_02_02()
    if GetTask(KILL_YZ_BG) == 0 then
        CreateTrigger(0,538,KILL_YZ_BG);
    end;
end;

function task_02_01()
    RemoveTrigger(GetTrigger(KILL_YZ_BG));
    SetTask(TASK_YZ_THREE, 3);
    DelItem(2,0,144,1);
    Msg2Player("H�i L� Ti�n D�ng chuy�n V� Di S�n");
    TaskTip("H�i L� Ti�n D�ng chuy�n V� Di S�n");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi1")		--��������1
end;

function task_03_00()
    local szTalk = {
        "G�n ��y V� Di s�n xu�t hi�n nhi�u Th��ng Vi�n v� Ng�n H�, ti�n sinh bi�t nguy�n nh�n kh�ng?",
        "C� chuy�n n�y n�a sao? Th��ng Vi�n xu�t hi�n b�o hi�u �i�m x�u b�t ��u.",
        "V�y ph�i l�m sao?",
        "Phi�n <sex> ��n V� Di s�n t�m t�m da Th��ng Vi�n v�!",
        "T�i h� �i ngay!"
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_YZ_THREE, 4);
    CreateTrigger(0,539,KILL_YZ_CY);
    Msg2Player("��n V� Di s�n t�m t�m da Th��ng Vi�n v� cho L� Ti�n D�ng");
    TaskTip("��n V� Di s�n t�m t�m da Th��ng Vi�n v� cho L� Ti�n D�ng");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi2")		--��������2
end;

function task_04_00()
    local szTalk = {
        "��ng l� t�m da n�y r�i! � ��y mu�n n�i s�p c� th�m h�a chi�n tranh, k�t qu� thׅ�",
        "R�t cu�c l� g�?",
        "L��M� ng��i n�i V� Di s�n c� Th��ng Vi�n v� Ng�n H� ph�i kh�ng?",
        "��ng r�i! C� ng�n h� n�a!",
        "Th�i v�y �i phi�n <sex> ��n V� Di s�n m�t chuy�n l�y l�ng ng�n h� v� ��y!",
        "���c th�i! Hy v�ng l�n n�y ti�n b�i c� th� n�i ra nguy�n nh�n d� th� xu�t hi�n v� chuy�n g� s�p x�y ra."
    };
    local szMsg = {
        "Phi�n <sex> ��n V� Di s�n t�m t�m da Th��ng Vi�n v�!"
    };
    if GetItemCount(2,0,145) >= 1 then
        TalkEx("task_04_01", szTalk);
    else
        TalkEx("task_04_02", szMsg);
    end;
end;

function task_04_02()
    if GetTrigger(KILL_YZ_CY) == 0 then
        CreateTrigger(0,539,KILL_YZ_CY);
    end;
end;

function task_04_01()
    RemoveTrigger(GetTrigger(KILL_YZ_CY));
    DelItem(2,0,145,1);
    SetTask(TASK_YZ_THREE, 5);
    CreateTrigger(0,540,KILL_YZ_YH);
    Msg2Player("��n V� Di s�n t�m 1 l�ng ng�n h� v� cho L� Ti�n D�ng");
    TaskTip("��n V� Di s�n t�m 1 l�ng ng�n h� v� cho L� Ti�n D�ng");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi3")		--��������3
end;

function task_05_00()
    local szTalk = {
        "��ng l� lo�i l�ng n�y! � ��y ch� �i�m may, ng��i c� th� y�n t�m.",
        "R�t cu�c l� sao, t�t hay x�u?",
        "C�i n�y thׅ�ta kh�ng ti�n n�i ra, ng��i th� t�m ng��i b�n L�u Huy�n Thanh c�a ta xem!",
        "Sao ph�i h�i anh ta?",
        "Phong th�y � V� Di s�n ��u t�p trung � L��ng Th�y ��ng, ta nghi d� th� xu�t hi�n c� li�n quan ��n vi�c n�y m� L�u Huy�n Thanh ng�y ng�y ��u v�o ��ng luy�n ��n, ng��i th� ��n D��ng Ch�u t�m anh ta xem!",
        "�� ta �i h�i th� xem!"
    };
    local szMsg = {
        "Phi�n <sex> ��n V� Di s�n mang l�ng ng�n h� v�!"
    };
    if GetItemCount(2,0,146) >= 1 then
        TalkEx("task_05_01", szTalk);
    else
        TalkEx("task_05_02", szMsg);
    end;
end;

function task_05_02()
    if GetTask(KILL_YZ_YH) == 0 then
        CreateTrigger(0,540,KILL_YZ_YH);
    end;
end;

function task_05_01()
    RemoveTrigger(GetTrigger(KILL_YZ_YH));
    DelItem(2,0,146,1);
    SetTask(TASK_YZ_THREE, 6);
    Msg2Player("T�m L�u Huy�n Thanh h�i chuy�n L��ng Th�y ��ng");
    TaskTip("T�m L�u Huy�n Thanh h�i chuy�n L��ng Th�y ��ng");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi4")		--��������4
end;

function task_06_00()
    local szTalk = {
        "Nghe n�i ti�n b�i bi�t ���c nguy�n nh�n xu�t hi�n d� th�, v�n b�i m�o mu�i ��n h�i th�!",
        "Chuy�n g� v�y? Sao l�i phong t�a c�a ��ng, c�n ��nh ng��i b� th��ng n�a, th�t kh�ng xem v��ng ph�p ra ch�t n�o?",
        "Ng��i ��nh b�i 30 t�n Th��ng th�n �� ta ngu�i c�n gi�n r�i m�i n�i!",
        "Ti�n b�i b�t n�ng, chuy�n n�y kh�ng kh� �� t�i h� lo li�u."
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    CreateTrigger(0,541,KILL_YZ_QS);
    SetTask(TASK_YZ_THREE, 7);
    Msg2Player("Gi�p L�u Huy�n Thanh tr�ng tr� 30 t�n Th��ng th�n");
    TaskTip("Gi�p L�u Huy�n Thanh tr�ng tr� 30 t�n Th��ng th�n");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan1")		--�춯֮Դ1
end;

function task_07_00()
    local szTalk = {
        "Ng��i n�i tr�ng tr� 30 t�n Th��ng th�n sao c�n ch�a l�m n�a?"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    if GetTrigger(KILL_YZ_QS) == 0 then
        CreateTrigger(0,541,KILL_YZ_QS);
    end;
end;

function task_08_00()
    local szTalk = {
        "T�i h� �� l�m xong vi�c ti�n b�i giao.",
        "<sex> qu� nhi�n th�n th� b�t ph�m, n�i v� L��ng Th�y ��ng th� kh�ng ai hi�u b�ng ta, n�i �� ch�nh l� �i�m t�ch t� linh kh� c�a V� Di s�n. 30 n�m tr��c ta v� phu nh�n ng�y ng�y ��u ��n �� luy�n ��n mong t�m ���c tr��ng sinh ��n. Kh�ng ng� �� 10 n�m.....",
        "10 n�m tr��c �� x�y ra chuy�n g�?",
        "10 n�m tr��c trong m�t l�n luy�n ��n g�p s� c� do li�u l��ng thu�c qu� nhi�u d�n ��n l� luy�n n� tung ta may m�n tho�t ch�t nh�ng phu nh�n ta �� kh�ng qua kh�i."
    };
    TalkEx("task_08_00_00", szTalk);
end;

function task_08_00_00()
    local szTalk = {
        "Ti�n b�i ��ng qu� �au l�ng!",
        "Kh�ng sao! K� t� �� ta v�n � ��y luy�n ��n �� t��ng nh� phu nh�n, ng��i gi�p ta l�m m�t chuy�n n�a ���c kh�ng, ta h�a s� n�i h�t nh�ng g� ta bi�t.",
        "Ti�n b�i c� c�n d�n!",
        "� ��y c� chi�c b�nh kh�ng ng��i v�o L��ng Th�y ��ng t�ng 1 l�y m�t �t c�t v� ��y. Ta mu�n d�ng c�t r�i quanh nh� �� t��ng nh� ng��i qu� c�. M�y ng�y nay ta m�i t�nh ng�, phu nh�n ch�t r�i, luy�n ti�n ��n tr��ng sinh b�t l�o �� l�m g�!"
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    SetTask(TASK_YZ_THREE, 9);
    AddItem(2,0,147,1);
    Msg2Player("�em chi�c b�nh kh�ng ��n L��ng Th�y ��ng t�ng 1 l�y m�t �t c�t v�");
    TaskTip("�em chi�c b�nh kh�ng ��n L��ng Th�y ��ng t�ng 1 l�y m�t �t c�t v�");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan2")		--�춯֮Դ2
end;

function task_09_00()
    local szTalk = {
        "Phi�n <sex> qu�! �� ta n�i ng��i nghe l�n cu�i c�ng v�o ��ng ta th�y ��m ng��i Xi H�a gi�o �� �ang b�n k� ho�ch g� �� � t�ng 2. xem ra ch�ng c� li�n quan ��n d� th� � V� Di s�n.",
        "L�n tr��c ngang qua T�y Xu�n l�u ta th�y Thu Dung c� n��ng c� qua l�i v�i b�n Xi H�a gi�o ��, ng��i ��n h�i c� ta th� xem!",
        "�� t� ti�n b�i, t�i h� �i ��y!"
    };
    local szHaveNoBottle = {
        "Chi�c b�nh kh�ng ta ��a ng��i l�m m�t r�i �? May ta c�n m�y b�nh ��ng ��n d��c, chuy�n n�y phi�n <sex> v�y."
    }
    local szHaveBottle = {
        "� ��y c� chi�c b�nh kh�ng ng��i v�o L��ng Th�y ��ng t�ng 1 l�y m�t �t c�t v� ��y. Ta mu�n d�ng c�t r�i quanh nh� �� t��ng nh� ng��i qu� c�."
    };
    if GetItemCount(2,0,148) >= 1 then  --�Ѿ���������
        TalkEx("task_09_01", szTalk);
    else
        if GetItemCount(2,0,147) >= 1 then  --û�������п�ƿ��
            TalkEx("", szHaveBottle);
        else                                --û������Ҳû��ƿ��
            TalkEx("", szHaveNoBottle);
            AddItem(2,0,147,1);
        end;
    end;
end;

function task_09_01()
    SetTask(TASK_YZ_THREE, 10);
    DelItem(2,0,148,1);
    Msg2Player("��n T�y Xu�n l�u D��ng Ch�u t�m Thu Dung c� n��ng");
    TaskTip("��n T�y Xu�n l�u D��ng Ch�u t�m Thu Dung c� n��ng");
    GivePlayerAward("Level_45", "hard", "head", "Level_39");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan3")		--�춯֮Դ3
end;

function task_10_00()
    local szTalk = {
        "Ta mu�n h�i th�m c� n��ng m�t s� chuy�n v� ��m ng��i Xi H�a gi�o ��.",
        "Ha! Ha! Sao ta ph�i n�i cho ng��i nghe?",
        "T�i h� gi�p ���c g� cho c� n��ng kh�ng?",
        "T�y Xu�n l�u ta n�u c� lo�i ph�n �� th� kh�ch s� ��n n��m n��p.",
        "Lo�i ph�n �� t�n g�? Mua � ��u v�y?",
        "N�u d� v�y ta mua t� l�u r�i, lo�i ph�n �� t�n Thi�n H��ng ph�n ch� ti�m ph�n T��ng Duy � D��ng Ch�u m�i c�, ta ��n v�i l�n nh�ng kh�ng mua ���c, ng��i gi�p ta t�m m�t c�i ���c kh�ng?",
        "���c th�i!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_YZ_THREE, 11);
    Msg2Player("��n D��ng Ch�u t�m T��ng Duy h�i Thi�n H��ng ph�n");
    TaskTip("��n D��ng Ch�u t�m T��ng Duy h�i Thi�n H��ng ph�n");
end;

function task_11_00()
    local szTalk = {
        "Nghe n�i ti�n b�i l�m lo�i ph�n t�n {Thi�n H��ng} kh�ng bi�t c� th� l�m cho t�i h� m�t h�p ���c kh�ng?",
        "Kh�ng ph�i ta kh�ng mu�n l�m th�c ch�t nguy�n li�u r�t kh� t�m, c�n ��n Giang T�n Th�n t�m kh�i �m tr�n ng��i �m h�n, chu sa tr�n m�nh Heo r�ng, t� ong tr�n ng��i ong v�ng l�n v� l��c trang s�c tr�n ng��i N� Ki�m H�o, t�m �� nguy�n li�u ta s� gi�p ng��i l�m.",
        "�� t�i h� t�m th�!"
    };
    TalkEx("task_11_01", szTalk);
end;

function task_11_01()
    SetTask(TASK_YZ_THREE, 12);
    Msg2Player("��n Giang T�n Th�n t�m kh�i �m tr�n ng��i �m h�n, chu sa tr�n m�nh Heo r�ng, t?ong tr�n ong v�ng v?l��c trang s�c tr�n ng��i N?Ki�m h�o cho T��ng Duy.");
end;

--����	2,1,26
--Ұ�� ��ɰ (2,2,30)
--��Ʒ� �䳲 (2,1,13)
--Ů���� ��ױϻ (2,1,57)

function task_12_00()
    local szTalk = {
        "��ng l� s� nguy�n li�u n�y r�i! ��i ta m�t l�t!",
        "��",
        "Thi�n H��ng ph�n ��y! <sex> c�m l�y!",
        "�a t�!"
    };
    local szMsg = {
        "Nh�ng nguy�n li�u n�y h�i kh?nh? ph�i ��n Giang T�n Th�n t�m kh�i �m tr�n ng��i �m h�n, chu sa tr�n m�nh Heo r�ng, t?ong tr�n ong v�ng v?l��c trang s�c tr�n ng��i N?Ki�m h�o, t�m �� nguy�n li�u ta s?gi�p ng��i l�m."
    };
    if GetItemCount(2,1,26) >= 1 and GetItemCount(2,2,30) >= 1 and GetItemCount(2,1,13) >= 1 and GetItemCount(2,1,57) >= 1 then
        TalkEx("task_12_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_12_01()
    DelItem(2,1,26,1);
    DelItem(2,2,30,1);
    DelItem(2,1,13,1);
    DelItem(2,1,57,1);
    AddItem(2,0,149,1);
    SetTask(TASK_YZ_THREE, 13);
    Msg2Player("Mang Thi�n H��ng ph�n cho Thu Dung");
    TaskTip("Mang Thi�n H��ng ph�n cho Thu Dung");
    GivePlayerAward("Level_40", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou1")		--��ˮ��ı
end;

function task_12_02()
    DelItem(2,1,26,1);
    DelItem(2,2,30,1);
    DelItem(2,1,13,1);
    DelItem(2,1,57,1);
    AddItem(2,0,149,1);
    SetTask(TASK_YZ_THREE, 13);
    Msg2Player("Mang Thi�n H��ng ph�n cho Thu Dung");
    TaskTip("Mang Thi�n H��ng ph�n cho Thu Dung");
end

function task_13_jw_00()
    local szMsg = {
        "<sex> mu�n l�m Thi�n H��ng ph�n n�a kh�ng? Ch?c�n ��n Giang T�n Th�n t�m kh�i �m tr�n ng��i �m h�n, chu sa tr�n m�nh Heo r�ng, t?ong tr�n ong v�ng v?l��c trang s�c tr�n ng��i N?Ki�m h�o, t�m �� nguy�n li�u ta s?gi�p ng��i l�m."
    };
    local szElse = {
        "Ph� n� ch� c�n s�ng kh�e ch� son ph�n sao s�nh ���c v�i c�i ��p t� nhi�n."
    };
    local szTalk = {
        "��ng l� s� nguy�n li�u n�y r�i! ��i ta m�t l�t!",
        "��",
        "Thi�n H��ng ph�n ��y! <sex> c�m l�y!",
        "�a t�!"
    };
    if GetItemCount(2,0,149) >= 1 then
        TalkEx("", szElse);
    else
        if GetItemCount(2,1,26) >= 1 and GetItemCount(2,2,30) >= 1 and GetItemCount(2,1,13) >= 1 and GetItemCount(2,1,57) >= 1 then
            TalkEx("task_12_02", szTalk);
        else
            TalkEx("", szMsg);
        end;
    end;
end;

function task_13_qr_00()
    local szMsg = {
        "Sao tr� nh� k�m v�y, ta n�i l�i m�t l�n th�i �� Thi�n H��ng ph�n ch� c� T��ng Duy � D��ng Ch�u m�i l�m ���c."
    };
    local szTalk = {
        "T�m ���c r�i �? Xem c� ch�t b�n l�nh! M� ta c�n chuy�n mu�n nh� <sex> gi�p ��.",
        "C� n��ng c� n�i!",
        "Y�n t�m! Vi�c n�y l� l�n cu�i ta nh� ng��i, l�n tr��c b�n ng��i Xi H�a gi�o ��n ��y �� l�y c�p T� Ph�ng kim thoa c�a ta.",
        "�� l� v�t ��nh t�nh, ng��i gi�p ta ��n L��ng Th�y ��ng t�ng 2 ��nh Xi H�a gi�o �� l�y T� Ph�ng kim thoa v�.",
        "T�i h� l�n ���ng ngay!"
    };
    if GetItemCount(2,0,149) >= 1 then
        TalkEx("task_13_qr_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_13_qr_01()
    SetTask(TASK_YZ_THREE, 14);
    DelItem(2,0,149,1);
    CreateTrigger(0,542,KILL_YZ_JT);
    Msg2Player("Gi�p Thu Dung ��n L��ng Th�y ��ng t�ng 2 ��nh Xi H�a gi�o �� l�y T� Ph�ng kim thoa");
    TaskTip("Gi�p Thu Dung ��n L��ng Th�y ��ng t�ng 2 ��nh Xi H�a gi�o �� l�y T� Ph�ng kim thoa");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou2")		--��ˮ��ı2
end;

function task_14_00()
    local szTalk = {
        "��ng l� v�t n�y r�i! �a t� <sex> gi�p ��!",
        "Gi� c� n��ng c� th� n�i cho t�i h� nghe chuy�n Xi H�a gi�o �� ch�a?",
        "L�n tr��c h� ��n ��y u�ng r��u c� nh�c ��n m�nh S�n H� X� T�c c� th� tri�u g�i h�a k� l�n trong L��ng Th�y ��ng. Con v�t n�y n�u qua 49 ng�y s� c� s�c m�nh th�n k�, nu�t ���c c� n�a nh� T�ng. Ta ch� bi�t v�y th�i!",
        "T�i h� l�p t�c ��n {L��ng Th�y ��ng t�ng 2} ng�n c�n b�n ch�ng.",
        "��nh b�i k� l�n nh� v� k� ta nghe nha!"
    };
    local szMsg = {"��m ng��i Xi H�a gi�o �� �ang tr�n � L��ng Th�y ��ng t�ng 2. ng��i nh� gi�p ta �o�t T� Ph�ng kim thoa v�!"};
    if GetItemCount(2,0,303) >= 1 then --�Ϸ����
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szMsg);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_YZ_JT) == 0 then
        CreateTrigger(0,542,KILL_YZ_JT);
    end;
end;

function task_14_01()
    RemoveTrigger(GetTrigger(KILL_YZ_JT));
    SetTask(TASK_YZ_THREE, 15);
    DelItem(2,0,303,1);   --�Ϸ����
    Msg2Player("��n L��ng Th�y ��ng t�ng 2 ��nh b�i H�a K� l�n");
    TaskTip("��n L��ng Th�y ��ng t�ng 2 ��nh b�i H�a K� l�n");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou3")		--��ˮ��ı3
end;

function task_16_00()
    local szTalk = {
        "T�i h� �� ��nh b�i h�a k� l�n tr��c th�i h�n, c� n��ng c� th� y�n t�m!",
        "Nguy hi�m l�m! Chuy�n l��",
        "Hay qu�! Hay qu�!",
        "Nh�ng m�nh S�n H� X� T�c c�n trong tay Tr��ng Ca M�n sao l�i r�i v�o tay Xi H�a gi�o? ��ng r�i! Ph�i v� {���ng M�n} g�p {���ng Xu�n} xem c� k�t qu� gi�m ��nh �m kh� ch�a!"
    };
    TalkEx("task_16_01", szTalk);
end;

function task_16_01()
    SetTask(TASK_YZ_THREE, 17);
    SetTask(TASK_YZ_TWO, 4);
    GivePlayerAward("Level_50", "hell", "chest", "Level_44");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou4")		--��ˮ��ı4
end;