--���������֧
--created by lizhi
--2005-9-2 10:12

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

---------------------------------------���ݷ�֧��-------------------------------------

function four_00_00()
    local szTalk = {
        "G�n ��y ��ng H�i H�i T�n xu�t hi�n nhi�u ng� qu�i, nhi�u ng� d�n kh�ng d�m ra bi�n ��nh b�t, nghe n�i h� �� ph�m th��ng v�i Long V��ng gia, m�i b� tr�ng ph�t nh� v�y.",
        "Chuy�n g� l� v�y?",
        "Phu qu�n ta m�y ng�y tr��c ra bi�n hi�n ch�a tr� v�, ta e �� b� l� th�y t�c gi�t h�i. <sex> gi�p ti�u n� tr� th� ���c kh�ng?",
        "Tr� th� b�ng c�ch n�o?",
        "Nghe n�i ��ng H�i H�i T�n c� lo�i ��u m�c ng� qu�i, ch� c�n gi�t ch�ng l� c� th� tr� th� cho phu qu�n ti�u n�.",
        "���c! Ta ��ng �!"
    };
    TalkEx("four_00_01", szTalk);
end;

function four_00_01()
    SetTask(TASK_YZ_FOUR, 1);
    Msg2Player("��n ��ng H�i H�i T�n gi�t ��u m�c ng� qu�i");
    TaskTip("��n ��ng H�i H�i T�n gi�t ��u m�c ng� qu�i");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai1")		--�������1
end;

function four_02_00()
    local szTalk = {
        "Ta �� gi�p c� n��ng h� ��u m�c ng� qu�i, ��y l� {Lang Nha ng�c b�i}, c� th� l� c�a l�nh c�ng...",
        "�a t� �n nh�n! ��ng l� v�t ��nh t�nh c�a ch�ng ta, ch�ng v�n mang theo b�n m�nh, huhu�",
        "Ta mu�n t�m hi�u r� {��ng H�i h�i t�c}, c� n��ng c� th� gi�p ta kh�ng?",
        "Th� t�m L� Ti�n D�ng xem!",
        "L�n sau s� gh� th�m c� n��ng, xin c�o t�!"
    };
    TalkEx("four_02_01", szTalk);
end;

function four_02_01()
    SetTask(TASK_YZ_FOUR, 3);
    DelItem(2,0,304,1);   --�ūe����
    Msg2Player("��n D��ng Ch�u t�m L� Ti�n D�ng h�i th�m");
    TaskTip("��n D��ng Ch�u t�m L� Ti�n D�ng h�i th�m");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai2")		--�������2
end;

function four_03_00()
    local szTalk = {
        "L� ti�n sinh kh�e kh�ng?",
        "T�m ta c� chuy�n g�?",
        "Ch�c ti�n b�i c� nghe qua ��ng H�i h�i t�c, t�i h� ngh� kh�ng ph�i Long V��ng l�o gia l�m, ng��i c� cao ki�n g� kh�ng?",
        "Ta ch� nghe n�i tr�n ng��i ch�ng c� mang m�t s� ��, ng��i gi�p ta thu th�p th��ng y v� h� y c�a d�n l�ng m�i th� 5 c�i ���c kh�ng?",
        "���c th�i!"
    };
    TalkEx("four_03_01", szTalk);
end;

function four_03_01()
    SetTask(TASK_YZ_FOUR, 4);
    CreateTrigger(0,544,KILL_YZ_SZ);
    CreateTrigger(0,545,KILL_YZ_SZSB);
    Msg2Player("��nh ��ng H�i th�y t�c v� qu�n s� th�y t�c l�y th��ng y v� h� y m�i th� 5 c�i");
    TaskTip("��nh ��ng H�i th�y t�c v� qu�n s� th�y t�c l�y th��ng y v� h� y m�i th� 5 c�i");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai3")		--�������3
end;

function four_04_00()
    local szTalk = {
        "��ng l� qu�n �o c�a d�n l�ng b� m�t. S�ch c� c� ghi ch�p, m�i khi th�y t�c xu�t hi�n d�n l�ng s� bi�n m�t.",
        "N�u n�i v�y th� d�n l�ng �� b� bi�n th�nh {��ng H�i th�y t�c}.",
        "��ng r�i!",
        "N�u n�i v�y, th�y t�c r�i ra ng�c b�i ch�nh l� {phu qu�n} c�a Vi�n Tinh. Ta ph�i �i b�o ngay cho c� �y bi�t!",
        "T�i h� xin c�o t�!"
    };
    local szMsg = {
        "Ta ch� nghe n�i tr�n ng��i ch�ng c� mang m�t s� ��, ng��i gi�p ta thu th�p th��ng y v� h� y c�a d�n l�ng m�i th� 5 c�i ���c kh�ng?"
    };
    if GetItemCount(2,0,305) >= 5 and GetItemCount(2,0,306) >= 5 then
        TalkEx("four_04_01", szTalk);
    else
        TalkEx("four_04_02", szMsg);
    end;
end;

function four_04_02()
    if GetTrigger(KILL_YZ_SZ) == 0 then
        CreateTrigger(0,544,KILL_YZ_SZ);
    end;
    if GetTrigger(KILL_YZ_SZSB) == 0 then
        CreateTrigger(0,545,KILL_YZ_SZSB);
    end;
end;

function four_04_01()
    SetTask(TASK_YZ_FOUR, 5);
    DelItem(2,0,305,5);
    DelItem(2,0,306,5);
    RemoveTrigger(GetTrigger(KILL_YZ_SZ));
    RemoveTrigger(GetTrigger(KILL_YZ_SZSB));
    Msg2Player("N�i s� th�t v�i cho Vi�n Tinh");
    TaskTip("N�i s� th�t v�i cho Vi�n Tinh");
end;

function four_05_00()
    local szTalk = {
        "<sex> ��n ��y c� chuy�n g�?"
    };
    TalkEx("four_05_01", szTalk);
end;

function four_05_01()
    local szSay = {
        "Ta c� m�t chuy�n mu�n n�i v�i c� n��ng.",
        "N�i s� th�t/tell_true",
        "G�t c� ta/tell_false"
    };
    SelectSay(szSay);
end;

function tell_true()
    local szTalk = {
        "<sex> xin c� n�i!",
        "Theo �i�u tra d�n l�ng kh�ng b� m�t t�ch m� l� bi�n th�nh ��ng H�i th�y t�c.",
        "V� v�y ng��i ta gi�t ch�nh l� {phu qu�n} c�, xin th� l�i!",
        "Huhu�Ta �� gi�t ch�ng r�i!",
        "��y c� ph�i s� th�t kh�ng!",
        "Huhu��."
    };
    TalkEx("four_05_02", szTalk);
end;

function four_05_02()
    SetTask(TASK_YZ_FOUR, 6);
    GivePlayerAward("Level_50", "hell");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai4")		--�������4
    ModifyReputation(10, 0);
end;

function tell_false()
    local szTalk = {
        "<sex> xin c� n�i!",
        "Theo �i�u tra d�n l�ng kh�ng b� m�t t�ch m� l� b� {��ng H�i th�y t�c} b�t ��n Long cung l�m lao d�ch, tu s�a long cung.",
        "N�u n�i v�y th� ng�c b�i �� do m�t ng� qu�i kh�c nh�t ���c, qua m�t th�i gian phu qu�n c� n��ng s� tr� v�.",
        "�a t� <sex>, hy v�ng ch�ng c�n s�ng!"
    };
    TalkEx("four_05_03", szTalk);
end;

function four_05_03()
    SetTask(TASK_YZ_FOUR, 7);
    GivePlayerAward("Level_50", "hell", "chest", "Level_52");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai4")		--�������4
end;

function four_06_00()
    local szTalk = {
        "L� ng��i gi�t phu qu�n ta! Mau tr� phu qu�n cho ta, huhu!"
    };
    TalkEx("", szTalk);
end;

function four_07_00()
    local szTalk = {
        "<sex> bi�t ���c tin t�c g� v� phu qu�n kh�ng?"
    };
    TalkEx("", szTalk);
end;