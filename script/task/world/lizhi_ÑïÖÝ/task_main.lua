--��������
--created by lizhi
--2005-9-1 10:21

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function task_06_00()
    local szTalk = {
        "C� chuy�n g� v�y?",
        "Ng��i th�n g�i ta nu�i d�m hai ��a con, ��a l�n t�n {H� H�u Anh}, ��a nh� t�n {H� H�u Li�n}. Hi�n em g�i �ang m�c ch�ng b�nh l�. ��i phu {Tr�n M�n} b�o c�n m�t s� d��c li�u, ng��i ��n h�i gi�p ta ���c kh�ng?",
        "Chuy�n nh� th�i m�!"
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    SetTask(TASK_FIVE, 7);
    Msg2Player("Gi�p H� H�u C�m t�m ��i phu Tr�n M�n");
    TaskTip("Gi�p H� H�u C�m t�m ��i phu Tr�n M�n");
end;

function task_07_xh_00()
    local szTalk = {
        "��i phu {Tr�n M�n} �ang � trong th�nh. <sex> ��n �� xem."
    };
    TalkEx("", szTalk);
end;

function task_07_cm_00()
    local szTalk = {
        "H� H�u C�m nh� t�i h� ��n h�i th� b�nh t�nh c�a ��a b� H� H�u Li�n c�n t�m d��c li�u g�?",
        "��a b� �� h�nh nh� tr�ng ��c, ta �ang theo d�i b�nh t�nh, ng��i gi�p ta t�m 1 Ho�ng h� linh c�t v� ��y!"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    SetTask(TASK_FIVE, 8);
    CreateTrigger(0,533,KILL_YZ_LAOHU);
    Msg2Player("T�m Ho�ng h� linh c�t cho Tr�n M�n");
    TaskTip("T�m Ho�ng h� linh c�t cho Tr�n M�n");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng1")		--��������֢1
end;

function task_08_00()
    local szTalk = {
        "Ch� c� Ho�ng h� linh c�t m�i l�m th�i gi�m b�nh t�nh ��a b�."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    if GetTrigger(KILL_YZ_LAOHU) == 0 then
        CreateTrigger(0,533,KILL_YZ_LAOHU);
    end;
end;

function task_09_00()
    local szTalk = {
        "��ng l� th� n�y r�i!",
        "��",
        "Ng��i mau �em H� c�t linh ph�n cho H� H�u Li�n.",
        "T�i h� l�n ���ng ngay!"
    };
    local szNot = {
        "<sex> t�m ���c Ho�ng h� linh c�t ch�a?",
        "V�n ch�a t�m ���c."
    };
    if GetItemCount(2,0,44) >= 1 then
        TalkEx("task_09_01", szTalk);
    else
        TalkEx("task_08_01", szNot);
    end;
end;

function task_09_01()
    SetTask(TASK_FIVE, 10);
    RemoveTrigger(GetTrigger(KILL_YZ_LAOHU));
    DelItem(2,0,44,1);
    AddItem(2,0,45,1);
    Msg2Player("Mang thu�c gi�i cho H� H�u Li�n");
    TaskTip("Mang thu�c gi�i cho H� H�u Li�n");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng2")		--��������֢2
end;

function task_10_00()
    local szTalk = {
        "��y l� thu�c c�a Tr�n ��i phu ti�u mu�i mu�i mau u�ng �i!",
        "M� c� b�o kh�ng ���c t�y ti�n l�y �� c�a ng��i kh�c.",
        "Ca ca �i! �au qu�!",
        "Mau u�ng �i! Thu�c n�y th�m H� H�u C�m b�o ta mang t�i.",
        "�",
        "Mu�i mu�i mau u�ng thu�c �i!",
        "�a t�!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_FIVE, 11);
    DelItem(2,0,45,1);
    Msg2Player("V� g�p H� H�u C�m");
    TaskTip("V� g�p H� H�u C�m");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng3")		--��������֢3
end;

function task_11_00()
    local szTalk = {
        "C� n��ng y�n t�m t�i h� �� �em thu�c cho H� H�u Li�n nh�ng ��i phu c� n�i c�n ph�i theo d�i b�nh t�nh.",
        "V�y ta y�n t�m r�i! Ch�t qu� xin nh�n l�y!"
    };
    TalkEx("task_11_01", szTalk);
end;

function task_11_01()
    SetTask(TASK_FIVE, 12);
    local szTalk = {
        "Nghe n�i gi� c� v� nguy�n li�u l�m v� kh� � Giang Nam ��t nhi�n t�ng cao, th� r�n {M�nh Nham } b� �p l�m m�t s� binh kh�, ng��i ��n �� �i�u tra xem!",
        "T�i h� l�n ���ng ngay!"
    };
    TalkEx("task_12_01", szTalk);
    GivePlayerAward("Level_20","hard");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng4")		--��������֢4
end;

function task_12_00()
    local szTalk = {
        "Nghe n�i gi� c� v� nguy�n li�u l�m v� kh� � Giang Nam ��t nhi�n t�ng cao, th� r�n {M�nh Nham } b� �p l�m m�t s� binh kh�, ng��i ��n �� �i�u tra xem!",
        "T�i h� l�n ���ng ngay!"
    };
    TalkEx("task_12_01", szTalk);
end;

function task_12_01()
    SetTask(TASK_FIVE, 13);
    Msg2Player("H�i M�nh Nham  v� nguy�n li�u ch� t�o binh kh�");
    TaskTip("H�i M�nh Nham  v� nguy�n li�u ch� t�o binh kh�");
end;

function task_13_00()
    local szTalk = {
        "Nghe n�i gi� c� v� kh� ��t nhi�n t�ng cao, ti�n b�i bi�t nguy�n nh�n kh�ng?",
        "Do m�t s� ��a ph��ng thu mua t�t c� binh kh�, d�n ��n kho�ng th�ch c�ng t�ng gi�, ng��i c� ti�n ch�a ch�c mua ���c. M�i ��y c� b� l�o d�ng dao �p ta l�m m�t s� binh kh�.",
        "Ng��i �p ti�n b�i l�m binh kh� l� ai?",
        "��i ng��i t�m �� nguy�n li�u v� ta s� n�i sau.",
        "Ti�n b�i c�n nguy�n li�u g�? ��n ��u m�i c� th� t�m ch�ng?",
        "Nghe n�i th��ng nh�n � D��ng Ch�u l�c v�n chuy�n Sinh Thi�t ngang qua Long Tuy�n Th�n b� Th�o Kh�u c��p m�t, ng��i mau ��n �� �o�t 20 mi�ng v�!",
        "���c th�i!"
    };
    TalkEx("task_13_01", szTalk);
end;

function task_13_01()
    SetTask(TASK_FIVE, 14);
    CreateTrigger(0,534,KILL_YZ_CK);
    Msg2Player("��n Long Tuy�n Th�n ��nh th�o kh�u l�y 20 Sinh Thi�t!");
    TaskTip("��n Long Tuy�n Th�n ��nh th�o kh�u l�y 20 Sinh Thi�t!");
    GivePlayerAward("Level_25", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"jiagegaozhangdewuqi1")		--�۸���ǵ�����1
end;

function task_14_00()
    local szTalk = {
        "C� nguy�n li�u r�i ta b�t tay l�m binh kh� ��y! Ng��i �p ta t�n H��ng Ti Thanh, h�n �ang � Long Tuy�n Th�n!"
    };
    local szNot = {
        "Gi�p ta t�m 20 Sinh Thi�t � Long Tuy�n th�n, ta s� cho ng��i bi�t t�ng t�ch c� g�i ��!"
    };
    if GetItemCount(2,0,98) >= 20 then
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szNot);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_YZ_CK) == 0 then
        CreateTrigger(0,534,KILL_YZ_CK);
    end;
end;

function task_14_01()
    RemoveTrigger(GetTrigger(KILL_YZ_CK));
    DelItem(2,0,98,20);
    SetTask(TASK_FIVE, 15);
    Msg2Player("��n Long Tuy�n Th�n t�m H��ng Ti Thanh");
    TaskTip("��n Long Tuy�n Th�n t�m H��ng Ti Thanh");
    GivePlayerAward("Level_25", "hard", "trinket", "Level_25");
	GivePlayerExp(SkeyYZxiahouqin,"jiagegaozhangdewuqi2")		--�۸���ǵ�����2
end;

function task_15_00()
    local szTalk = {
        "Nghe n�i ng��i thu mua l��ng l�n binh kh�, c� d� t�m g� kh�ng?",
        "Ha! Ha! L�o n��ng ��y ch�nh l� ng��i Xi H�a gi�o, ng��i hi�u r�i ch�!",
        "Th� ra l� v�y!",
        "Ta c� l�ng t�t mu�n c�u ��a b� g�i gi� ng��i n�i v�y, ta kh�ng th�m quan t�m s� s�ng ch�t c�a n� n�a.",
        "C�u ai? Kh�ng l� H� H�u Li�n? N�u c� n��ng c�u ���c t�i h� mu�n ph�n c�m k�ch.",
        "Ta c�ng mu�n c�u nh�ng thi�u m�t s� d��c li�u t�m m�i kh�ng th�y! C� th� gi�p ta ��n {V�n M�ng Tr�ch} ��nh {C�c ��c} l�y {3 ch�n Thi�m T�} v� kh�ng?",
        "Ta �i ngay!"
    };
    TalkEx("task_15_01", szTalk);
end;

function task_15_01()
    SetTask(TASK_FIVE, 16);
    CreateTrigger(0,535,KILL_YZ_DCC);
    Msg2Player("��n V�n M�ng Tr�ch gi�t c�c ��c l�y 3 c�i Thi�m T�");
    TaskTip("��n V�n M�ng Tr�ch gi�t c�c ��c l�y 3 c�i Thi�m T�");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren1")		--����Ů��1
end;

function task_16_00()
    local szTalk = {
        "T�m ���c r�i �?",
        "��",
        "H�y ��a {Thi�n Thi�m H�a ��c cao} cho ��i phu {Tr�n M�n} ki�m nghi�m xem!",
        "�a t� {Tr�n M�n} c� n��ng, t�i h� l�n ���ng ngay!"
    };
    local szNot = {
        "C�n kh�ng mau ��n {V�n M�ng Tr�ch} ��nh {c�c ��c} l�y {3 ch�n Thi�m T�} v�!"
    };
    if GetItemCount(2,0,99) >= 3 then
        TalkEx("task_16_01", szTalk);
    else
        TalkEx("task_16_02", szNot);
    end;
end;

function task_16_02()
    if GetTrigger(KILL_YZ_DCC) == 0 then
        CreateTrigger(0,535,KILL_YZ_DCC);
    end;
end;

function task_16_01()
    RemoveTrigger(GetTrigger(KILL_YZ_DCC));
    SetTask(TASK_FIVE, 17);
    AddItem(2,0,302,1);   --��󸻯����
    DelItem(2,0,99,3);
    Msg2Player("T�m ��i phu Tr�n M�n xem th� c� ph�i thu�c gi�i kh�ng");
    TaskTip("T�m ��i phu Tr�n M�n xem th� c� ph�i thu�c gi�i kh�ng");
    GivePlayerAward("Level_30", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren2")		--����Ů��2
end;

function task_17_00()
    local szTalk = {
        "��i nh�n xem th� cao {Thi�n Thi�m H�a ��c} n�y c�u ���c H� H�u Li�n kh�ng?",
        "Ta ch�a th�y qua lo�i thu�c n�y bao gi� nh�ng �� ta xem.",
        "��",
        "���c r�i! Ng��i c� th� mang s� thu�c n�y �i t�m H� H�u C�m!",
        "�a t� ��i nh�n."
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    SetTask(TASK_FIVE, 18);
    Msg2Player("Tr�n M�n ��i phu n�i thu�c kh�ng sao nh�ng ph�i h�i � ki�n H� H�u C�m");
    TaskTip("Tr�n M�n ��i phu n�i thu�c kh�ng sao nh�ng ph�i h�i � ki�n H� H�u C�m");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren3")		--����Ů��3
end;

function task_18_00()
    local szTalk = {
        "M�t ng��i t�n {H��ng Ti Thanh} t�ng b�nh ch�a cao {Thi�n Thi�m H�a ��c} n�i �� c�u Li�n Nhi, t�i h� �� cho Tr�n M�n ��i phu ki�m ch�ng, m�i ng��i xem qua!",
        "{H��ng Ti Thanh}? Ta kh�ng bi�t ng��i n�y nh�ng Tr�n M�n ��i phu �� n�i kh�ng sao th� c� mang cho Linh Nhi.",
        "T�i h� l�n ���ng ngay!"
    };
    TalkEx("task_18_01", szTalk);
end;

function task_18_01()
    SetTask(TASK_FIVE, 19);
    Msg2Player("�em cao Thi�n Thi�m H�a ��c cho Li�n Nhi");
    TaskTip("�em cao Thi�n Thi�m H�a ��c cho Li�n Nhi");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren4")		--����Ů��4
end;

function task_19_00()
    local szTalk = {};
    if GetSex() == 1 then
        szTalk = {
            "Thu�c n�y c� th� tr� ch�ng �au b�ng, mau d�ng �i!",
            "�.",
            "�! Thu�c hay qu�! Ta kh�ng sao r�i, �a t� ca ca!",
            "Ta v� b�m b�o v�i thi�m H� H�u C�m c�a ng��i ��y."
        };
    elseif GetSex() == 2 then
        szTalk = {
            "Thu�c n�y c� th� tr� ch�ng �au b�ng, mau d�ng �i!",
            "�.",
            "�! Thu�c hay qu�! Ta kh�ng sao r�i, �a t� t� t�!",
            "Ta v� b�m b�o v�i thi�m H� H�u C�m c�a ng��i ��y."
        };
    end;
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    SetTask(TASK_FIVE, 20);
    DelItem(2,0,302,1);
    Msg2Player("�em s� vi�c n�i l�i v�i H� H�u C�m");
    TaskTip("�em s� vi�c n�i l�i v�i H� H�u C�m");
    GivePlayerAward("Level_30", "hard", "weapon", "Level_28");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren5")		--����Ů��5
end;

function task_20_00()
    local szTalk = {
        "Li�n Nhi n�i u�ng thu�c xong b�ng h�t �au r�i!",
        "V�y ta y�n t�m �a t� ng��i!"
    };
    TalkEx("task_20_01", szTalk);
end;

function task_20_01()
    local szTalk = {
        "Ta nh�n ���c tin b�o {L�i Th�ng} trong l�c ��n D��ng Ch�u b� k� ��ch truy s�t hi�n �ang �n n�p � {Thanh Kh� ��ng}, ng��i gi�p ta ��n �� gi�i v�y cho �ng ta.",
        "T�i h� l�p t�c l�n ���ng!"
    };
    SetTask(TASK_FIVE, 21);
    TalkEx("", szTalk);
    Msg2Player("��n Thanh Kh� ��ng gi�i v�y L�i Th�ng");
    TaskTip("��n Thanh Kh� ��ng gi�i v�y L�i Th�ng");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"jiuzhuleisheng")		--������ʤ
end;

function task_22_00()
    local szTalk = {
        "B�o c� n��ng tin bu�n, L�i Th�ng �� ch�t trong Thanh Kh� ��ng.",
        "Sao? H�n ch�t r�i �?"
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    local szTalk = {
        "L�i Th�ng ��n D��ng Ch�u l�n n�y c� mang theo v�t ph�m quan tr�ng ng��i th� ki�m tra tr�n thi th� h�n xem.",
        "�� t�i h� ki�m tra xem."
    };
    TalkEx("task_22_02", szTalk);
end;

function task_22_02()
    SetTask(TASK_FIVE, 23);
    Msg2Player("L�c so�t thi th� c�a L�i Th�ng");
    TaskTip("L�c so�t thi th� c�a L�i Th�ng");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu1")		--���ر���1
end;

function task_23_00()
    local szTalk = {
        "T�i h� ph�t hi�n {n�a t�m b�n �� th�n b�} tr�n thi th� c�a L�i Th�ng ngo�i ra trong ��ng c�n xu�t hi�n nhi�u ng��i Khi�t �an, n�a t�m c�n l�i ch�c tr�n ng��i ch�ng.",
        "Sao? Thi�n �m gi�o Khi�t �an c�ng tham gia v� n�y �? Ng��i mau quay l�i {Thanh Kh� ��ng} ��nh {Thi�n �m v� s�} �o�t n�a t�m b�n �� c�n l�i!",
        "Ta �i ngay!"
    };
    local szNot = {
        "Ng��i th� �i �i�u tra thi th� c�a L�i Th�ng xem c� ph�t hi�n g� kh�ng?"
    };
    if GetItemCount(2,0,103) >= 1 then
        TalkEx("task_23_01", szTalk);
    else
        TalkEx("", szNot);
    end;
end;

function task_23_01()
    SetTask(TASK_FIVE, 24);
    DelItem(2,0,103,1);
    CreateTrigger(0,537,KILL_YZ_WS);
    Msg2Player("��nh Thi�n �m v� s� trong Thanh Kh� ��ng �o�t n�a t�m b�n ��!");
    TaskTip("��nh Thi�n �m v� s� trong Thanh Kh� ��ng �o�t n�a t�m b�n ��!");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu2")		--���ر���2
end;

function task_24_00()
    local szTalk = {
        "H�y ��n T�p h�a mua {Cu�c}, mang theo {B�n �� th�n b�} t�m t�m bia � {V� Di s�n} khai qu�t l�n.",
        "Chuy�n n�y ��n gi�n th�i."
    };
    local szNot = {
        "Mau ��n {Thanh Kh� ��ng} ��nh b�i {Thi�n �m v� s�} �o�t {n�a t�m b�n ��} c�n l�i!"
    };
    if GetItemCount(2,0,104) >= 1 then
        TalkEx("task_24_01", szTalk);
    else
        TalkEx("task_24_02", szNot);
    end;
end;

function task_24_02()
    if GetTrigger(KILL_YZ_WS) == 0 then
        CreateTrigger(0,537,KILL_YZ_WS);
    end;
end;

function task_24_01()
    AddItem(2,0,105,1);
    DelItem(2,0,104,1);
    SetTask(TASK_FIVE, 25);
    Msg2Player("Mang cu�c v� b�n �� th�n b� l�n V� Di s�n t�m b�o v�t!");
    TaskTip("Mang cu�c v� b�n �� th�n b� l�n V� Di s�n t�m b�o v�t!");
    GivePlayerAward("Level_34", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu3")		--���ر���3
end;

function task_25_00()
    local szTalk = {
        "H�y ��n T�p h�a mua {Cu�c}, mang theo {B�n �� th�n b�} l�n {V� Di s�n} khai qu�t l�n!"
    };
    local szMsg = {
        "T�m kh�ng ���c {B�n �� th�n b�}�? May m� ta c�n 1 t�m, c�m l�y �i!"
    };
    if GetItemCount(2,0,105) >= 1 then
        TalkEx("", szTalk);
    else
        TalkEx("task_25_00_00", szMsg);
    end;
end;

function task_25_00_00()
    AddItem(2,0,105,1);
end;

function task_26_00()
    local szTalk = {
        "��y l� v�t ph�m c�a L�i Th�ng mang theo.",
        "��ng r�i! Ng��i mau mang ��n cho {���ng Ninh} � {V� Di s�n}."
    };
    TalkEx("task_26_01", szTalk);
end;

function task_26_01()
    SetTask(TASK_FIVE, 27);
    Msg2Player("�em b�o v�t th�n b� giao cho ���ng Ninh");
    TaskTip("�em b�o v�t th�n b� giao cho ���ng Ninh");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu4")		--���ر���4
end;

function task_27_00()
    local szTalk = {
        "H� H�u C�m nh� ta mang ��n cho ��i nh�n.",
        "Ng��i gi�p ta chuy�n l�i v�i H� H�u C�m."
    };
    TalkEx("task_27_01", szTalk);
end;

function task_27_01()
    SetTask(TASK_FIVE, 28);
    DelItem(2,0,106,1);
    Msg2Player("Chuy�n l�i v�i H� H�u C�m");
    TaskTip("Chuy�n l�i v�i H� H�u C�m");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu5")		--���ر���5
end;

function task_28_00()
    local szTalk = {
        "Ta �� �em b�o v�t th�n b� cho ���ng Ninh, c� n��ng c� th� an t�m.",
        "Phi�n <sex> qu�!"
    };
    TalkEx("task_28_01", szTalk);
end;

function task_28_01()
    SetTask(TASK_FIVE, 29);
    GivePlayerAward("Level_34", "hard", "weapon", "Level_34");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu6")		--���ر���6
end;

