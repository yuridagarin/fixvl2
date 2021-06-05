--���������֧
--created by lizhi
--2005-9-1 10:21

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

--------------------------------------------���ݷ�֧��--------------------------------------

function task_01_00()
    local szTalk = {
        "V�n b�i v�n an l�o l�o.",
        "Ta v�i ng��i kh�ng quen bi�t, c� chuy�n g� kh�ng?",
        "T�i h� c� m�t ng��i b�n b� gi�t, tr�n thi th� t�m ���c {Phi B�c kim ch�m}, thi�t ngh� ��y l� v�t ph�m c�a ���ng M�n, t�i h� mu�n nh� L�o L�o �i�u tra xem ai l� hung th�.",
        "M�t ng�y ta c�n ��ng trong ���ng M�n s� tu�n th� theo gia ph�p, kh�ng c�n <sex> ra tay.",
        "T�i h� t� xa ��n mong L�o L�o gi�p ��.",
        "Ta c� th� gi�p ng��i, nh�ng tr��c ti�n ph�i ��n V�n M�ng Tr�ch l�y 20 c�i �u�i b� c�p v� ��y!",
        "Kh�ng th�nh v�n ��!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,100,1);
    SetTask(TASK_YZ_TWO, 2);
    CreateTrigger(0,536,KILL_YZ_TX);
    Msg2Player("��n V�n M�ng Tr�ch l�y 20 c�i �u�i b� c�p v� cho ���ng Xu�n");
    TaskTip("��n V�n M�ng Tr�ch l�y 20 c�i �u�i b� c�p v� cho ���ng Xu�n");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi1")		--׷�鰵��1
end;

function task_02_00()
    local szTalk = {
        "��ng th� n�y r�i! Ta s� gi�p ng��i �i�u tra nh�ng c�n kho�ng th�i gian, l�t quay l�i �i!"
    };
    local szNot = {
        "N�u nh� th�y kh� t�m �u�i b� c�p th� c� n�i v�i ta nh�!"
    };
    if GetItemCount(2,0,102) >= 20 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("task_02_02", szNot);
    end;
end;

function task_02_02()
    if GetTrigger(KILL_YZ_TX) == 0 then
        CreateTrigger(0,536,KILL_YZ_TX);
    end;
end;

function task_02_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,102,20);
    SetTask(TASK_YZ_TWO, 3);
    SetTask(TASK_YZ_THREE, 1);  --�������ݷ�֧��
    Msg2Player("���ng Xu�n b�o b�n m�t th�i gian sau m�i c� th� tr� l�i");
    TaskTip("���ng Xu�n b�o b�n m�t th�i gian sau m�i c� th� tr� l�i");
    GivePlayerAward("Level_36", "hard", "chest", "Level_36");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi2")		--׷�鰵��2
end;

function task_04_00()
    local szTalk = {
        "<sex> ��n ��ng l�c l�m! T�t c� �m kh� v� ��c d��c ��u c� l�m d�u, ch� c� ���ng Ninh kh�ng b� kh�ng ch� do h�n �� tinh th�ng thu�t ch� t�o �m kh�, hi�n ta kh�ng bi�t h�n tr�n � ��u.",
        "Sao tr�ng h�p v�y? T�i h� c� g�p qua ng��i n�y."
    };
    TalkEx("task_04_01", szTalk);
end;

function task_04_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    SetTask(TASK_YZ_TWO, 5);
    Msg2Player("T�m ���ng Ninh h�i th�m");
    TaskTip("T�m ���ng Ninh h�i th�m");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi3")		--׷�鰵��3
end;

function two_05_00()
    local szTalk = {
        "<sex> qu� nhi�n ��n t�m ta, c� ph�i H� H�u C�m ph�i t�i?",
        "N�i mau! Sao ng��i gi�t L�i Th�ng?",
        "Ng��i qu� th�t th�ng minh t� Phi B�c kim ch�m �i�u tra ���c ��n ��y, ��ng ti�c ta ch�m h�n ng��i m�t b��c.",
        "Phu qu�n {Th�i H�ng Tuy�t} l� ng��i Xi H�a gi�o n�n con ���ng s�t th� c�a ta c�ng b�t ��u t� ��, kh�ng may ch�ng �� ch�t d��i tay h�a k� l�n, ta v� Xi H�a gi�o c�ng c�t ��t quan h�."
    };
    TalkEx("two_05_01", szTalk);
end;

function two_05_01()
    local szTalk = {
        "C� n��ng l� ng��i th�ng minh sao l�i ra n�ng n�i v�y?",
        "Th� sao n�o?",
        "Xi H�a gi�o �ang s� d�ng t�m b�n �� S�n H� l� b�o v�t th�n b� m� H� H�u C�m b�o ng��i mang t�i. L�c �� m�t ng��i ph� n� t�n H��ng Ty Thanhra l�nh ta ph�i gi�t L�i Th�ng, �o�t l�y m�nh b�n �� S�n H� X� T�c, ti�c thay ta kh�ng t�m ���c.",
        "Ch�nh v� v�y ng��i m�i t�m ���c �m kh� c�a ta nh�ng ta v�n kh�ng hi�u v� sao {H� H�u C�m} b�o ng��i mang m�nh S�n H� X� T�c ��n, ng��i v� h�i l�i xem!",
        "�a t� c� n��ng!"
    };
    TalkEx("two_05_02", szTalk);
end;

function two_05_02()
    SetTask(TASK_YZ_TWO, 6);
    Msg2Player("��n D��ng Ch�u t�m H� H�u C�m");
    TaskTip("��n D��ng Ch�u t�m H� H�u C�m");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang1")		--��֪����1
end;

function two_06_00()
    local szTalk = {
        "Sao ng��i ph�n b�i Tr��ng Ca M�n? �em m�nh S�n H� X� T�c cho Xi H�a gi�o.",
        "Ng��i �i�u tra ra r�i �? Chuy�n n�y l�m ta day d�t b�y l�u, c� l� n�i ra c�ng l� c�ch gi�i quy�t.....",
        "Ng��i ��n b� H��ng Ty Thanh�� b� tr�n c�ng phu qu�n Ta, � c�n c� � ��nh c��p Anh Nhi �i. ��ng r�i, Anh Nhi v� Li�n Nhi l� con c�a ta, �a t� <sex> ch�m s�c.",
        "Tr�n ��i c�n c� lo�i ��n b� ��c �c n�y n�a sao!",
        "Kh�ng bi�t <sex> c�n nh� chuy�n Li�n Nhi b� tr�ng ��c kh�ng? Ch�nh � �� ra tay, � n�i n�u kh�ng giao Anh Nhi s� ��c ch�t Li�n Nhi, v� sau kh�ng bi�t sao l�i ��i �."
    };
    TalkEx("two_06_01", szTalk);
end;

function two_06_01()
    local szTalk = {
        "Ch�nh c� ta ��a cao Thi�n Thi�m H�a ��c m�! Kh�ng l� c� ta �� h�i c�i?",
        "H�m! {H�a ��c cao} ��ng l� thu�c gi�i nh�ng c� th�m {Thi�m T�} v� s� l� lo�i ��c ��nh k� ph�t t�c, n�u kh�ng c� thu�c gi�i k�p s� �au ��n m� ch�t, � �� uy hi�p ta l�m nhi�u �i�u c� l�i v�i l��ng t�m.",
        "Kh�ng th� tr�ch c� n��ng, v�y c� c� bi�t m�nh S�n H� X� T�c c�a Xi H�a gi�o �em �i ��u kh�ng?",
        "H�nh nh� Xi H�a gi�o �ang �m m�u l�n � {��ng H�i H�i T�n}, ng��i th� ��n �� xem th�!",
        "���c! T�i h� l�n ���ng ngay!"
    };
    TalkEx("two_06_02", szTalk);
end;

function two_06_02()
    SetTask(TASK_YZ_TWO, 7);
    GivePlayerAward("Level_50", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang2")		--��֪����2
end;

function two_07_00()
    local szSay = {
        "<sex> t�m ta c� chuy�n g� kh�ng?",
        "Li�n quan Xi H�a gi�o/about_chj",
        "Li�n quan H� H�u Li�n/about_xhl"
    };
    SelectSay(szSay);
end;

function about_chj()
    local szTalk = {
        "Xi H�a gi�o �ang t� t�p � ��ng H�i H�i T�n. <sex> mau �i ng�n c�n ch�ng!"
    };
    TalkEx("", szTalk);
end;

function about_xhl()
    local szSay = {
        "Ch�t ��c trong ng��i Li�n Nhi ch� c� m�u c�a {H�a k� l�n} trong truy�n thuy�t m�i gi�i ���c.",
        "M�u c�a h�a k� l�n ��y/have_one",
        "Ta ch�a th�y qua b�o v�t n�y/have_none"
    };
    SelectSay(szSay);
end;

function have_one()
    local szTalk = {
        "�a t� <sex> mang b�o v�t ra c�u Li�n Nhi.",
        "Kh�ng c�u ng��i b�o v�t n�y �� l�m g�!"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    SetTask(TASK_YZ_TWO, 8);
    DelItem(2,0,150,1);
end;

function have_none()

end;