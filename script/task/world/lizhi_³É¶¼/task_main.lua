--�ļ�˵��
--�ɶ��ű�
--created by lizhi
--2005-8-12 14:41

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua")

function task_one_00()
    local szTalk = {
        "T�i h� thu lai phong c�nh d�, H�nh d��ng nh�n kh� v� l�u ��",
        "Th� hay l�m! Ph�m ti�n sinh v�n ch��ng xu�t ch�ng, h�u sinh kh�m ph�c.",
        "<sex> qu� khen! Kh�ng bi�t <sex> t�m Ph�m m� c� chuy�n g�?",
        "T�i h� trong l�c �i�u tra Thanh Minh Th��ng H� �� ph�t hi�n T� H�ng m��n danh v�n chuy�n Hoa Th�ch C��ng th�c ch�t v�n chuy�n m�nh S�n H� X� T�c v�o cung. ��m ng��i L��ng s�n b�y m�u c��p Hoa Th�ch C��ng v� S�n H� X� T�c. S� vi�c tr�ng ��i D� T�u nh� ta h�i � ki�n Ph�m ti�n sinh.",
        "Chuy�n n�y kh�ng ��n gi�n! Hi�n Ph�m m� c� ch�t chuy�n mu�n nh� <sex> gi�p ��!",
        "Gi�p ���c ti�n b�i l� vinh d� c�a v�n b�i ��y.",
        "Ph�m m� c� nh� ���ng K� gi�p l�m Lang C�t t�u, kh�ng bi�t xong ch�a? Phi�n <sex> ��n �� xem th�! V� mang r��u v� ��y!",
        "Xin Ph�m ti�n sinh ��i tin vui c�a ta!"
    };
    TalkEx("task_one_01", szTalk);
end;

function task_one_01()
    DelItem(2,0,49,1);
    GivePlayerAward("Level_10", "easy");    --����
	GivePlayerExp(SkeyCDFanzhongyan,"baifangfanzhongyan")	--�ݷ÷�����
    SetTask(TASK_CD_ONE, 1);
    SetTask(TASK_CD_TWO, 101);
    Msg2Player("��n ���ng M�n t�m ���ng K� mang Lang C�t t�u v�!");
    TaskTip("��n ���ng M�n t�m ���ng K� mang Lang C�t t�u v�!");
end;

function task_one_01_00()
    local szTalk = {
        "<sex>, ta nghe n�i Lang C�t t�u c�a ���ng M�n danh ch�n thi�n h�, kh�ng bi�t khi n�o m�i th��ng th�c ���c."
    };
    TalkEx("", szTalk);
end;

function task_two_01()
    local szTalk = {
        "<sex> ��n c� chuy�n g� kh�ng?",
        "Ph�m ti�n sinh b�o ta ��n l�y Lang C�t t�u.",
        "Do d�o n�y ���ng ph� b�n nhi�u vi�c qu�n m�t chuy�n Lang C�t t�u, kh�ng bi�t <sex> c� th� gi�p ta t�m {10 Th� Lang c�t}, {10 Thanh Lang c�t} kh�ng?",
        "��n gi�n th�i, �� ta t�m v�!"
    };
    TalkEx("task_two_01_01", szTalk);
end;

function task_two_01_01()
    SetTask(TASK_CD_TWO, 102);
    
    CreateTrigger(0, 513, KILL_CD_TL); --ɱС����
    CreateTrigger(0, 514, KILL_CD_QL); --ɱС����
    Msg2Player("Thu th�p 10 Th� Lang c�t v� 10 Thanh Lang c�t");
    TaskTip("Thu th�p 10 Th� Lang c�t v� 10 Thanh Lang c�t");
end;

function task_two_02()
    local szTalk = {
        "Nh�ng mu�n l�m Lang C�t t�u c�n {8 ��a T� Tinh Hoa}, {B�ch Nh�t Ti�n} � g�n ���ng M�n c� lo�i hoa n�y. <sex> gi�p ta nh�!"
    };
    local szNot = {
        "<sex> ch�a t�m �� {Th� lang c�t} v� {Thanh lang c�t} �?"
    };
    if GetItemCount(2,0,74) >= 10 and GetItemCount(2,0,75) >= 10 then
        TalkEx("task_two_02_01", szTalk);
    else
        TalkEx("task_two_02_02", szNot);
    end;
end;

function task_two_02_02()
    if GetTrigger(KILL_CD_TL) == 0 then
        CreateTrigger(0, 513, KILL_CD_TL); --ɱС����
    end;
    if GetTrigger(KILL_CD_QL) == 0 then
        CreateTrigger(0, 514, KILL_CD_QL); --ɱС����
    end;
end;

function task_two_02_01()

    GivePlayerAward("Level_14", "easy");    --����
	GivePlayerExp(SkeyCDFanzhongyan,"nenglishilian")	--��������
    RemoveTrigger(GetTrigger(KILL_CD_TL));
    RemoveTrigger(GetTrigger(KILL_CD_QL));

    DelItem(2,0,74,10);
    DelItem(2,0,75,10);
    SetTask(TASK_CD_TWO, 103);
    CreateTrigger(0,515,KILL_CD_BRJ);   --ɱ���ռ�
    
    Msg2Player("Thu th�p 8 ��a T� Tinh hoa");
    TaskTip("Thu th�p 8 ��a T� Tinh hoa");
end;

function task_two_03()
    local szSay = {
        "B�ch Nh�t Ti�n tuy l�i h�i nh�ng kh�ng ��nh l�i <sex> ��u.",
        "���ng nhi�n! Ta �� mang T� Tinh hoa v�./task_two_03_yes",
        "��/task_two_03_no"
    };
    SelectSay(szSay);
end;

function task_two_03_no()
    if GetTrigger(KILL_CD_BRJ) == 0 then
        CreateTrigger(0,515,KILL_CD_BRJ);   --ɱ���ռ�
    end;
end;

function task_two_03_yes()
    local szTalk = {
        "V� c�ng c�a <sex> qu� nhi�n cao c��ng. Lang C�t t�u ��y. Phi�n <sex> mang cho Ph�m ti�n sinh."
    };
    local szNot = {
        "<sex> ch�a t�m �� {T� Tinh hoa} �?"
    };
    
    if GetItemCount(2,0,76) >= 8 then
        TalkEx("task_two_03_01", szTalk);
    else
        TalkEx("task_two_03_no", szNot);
    end;
end;

function task_two_03_01()
    RemoveTrigger(GetTrigger(KILL_CD_BRJ));
    DelItem(2,0,76,8);
    AddItem(2,0,77,1);  --�ǹǾ�
    SetTask(TASK_CD_TWO, 104);
    SetTask(TASK_CD_THREE, 1);
    Msg2Player("Mang Lang C�t t�u v� cho Ph�m Tr�ng Y�m");
    TaskTip("Mang Lang C�t t�u v� cho Ph�m Tr�ng Y�m");
end;

function task_three_01()
    local szTalk = {
        "<sex> v� r�i �? C� mang Lang C�t t�u kh�ng?",
        "Lang C�t t�u ��y, ti�n b�i xem ��ng kh�ng?",
        "R��u ngon! R��u ngon! <sex> gi�p Ph�m m� m�t l�n n�a ���c kh�ng? Th�i th� Th�nh �� mu�n t�m Ph�m m�, phi�n <sex> ��n �� m�t chuy�n."
    };
    TalkEx("task_three_00_01", szTalk);
end;

function task_three_00_01()
    GivePlayerAward("Level_14", "hard", "head", "Level_14");    --����
	GivePlayerExp(SkeyCDFanzhongyan,"zhengyishilian1")	--��������1
    DelItem(2,0,77,1);
    SetTask(TASK_CD_THREE, 2);
    SetTask(TASK_CD_ONE, 2);   --�����ݷ÷������������
    
    Msg2Player("Th�m th�i th� Th�nh ��");
    TaskTip("Th�m th�i th� Th�nh ��");
end;

function task_three_02()
    local szTalk = {
        "Th�i th� t�m ta kh�ng bi�t c� chuy�n g� kh�ng?",
        "�� ta� h� ��n �� xem sao"
    };
    TalkEx("", szTalk);
end;

function task_three_02_01()
    local szTalk = {
        "L� ai v�y?",
        "T�i h� ph�ng m�nh Ph�m ti�n sinh ��n t�m th�i th�, kh�ng bi�t ng��i �ang phi�n mu�n chuy�n g�?",
        "Haha! V� h�u b�i n�y c� mu�n ra s�c gi�p tri�u ��nh kh�ng?",
        "Hi�n ��t n��c �ang lo�n trong gi�c ngo�i, ng��i h�c v� nh� t�i h� ��y sao c� th� ��ng l�m ng�.",
        "Ch� c�n <sex> gi�p ta l�m m�t chuy�n, b�n quan b�o ��m ti�n �� c�a ng��i kh�ng t�i ��u.",
        "Kh�ng bi�t ��i nh�n mu�n n�i chuy�n g�?",
        "L�o gi� Ph�m Tr�ng Y�m kh�ng n� m�t b�n quan, m� c�n l�ng m� n�a, ta mu�n <sex> h�y ho�i danh ti�ng c�a h�n.",
        "Chuy�n n�y t�i h� kh�ng gi�p ���c.",
        "<sex> xin ch�m b��c! V� v�i ta, c�ng danh b�ng l�c, vinh hoa ph� qu� c� ��i h��ng kh�ng h�t.",
        "T�i h� �� quy�t, xin c�o t�!"
    };
    TalkEx("task_three_02_02", szTalk);
end;

function task_three_02_02()
    SetTask(TASK_CD_THREE, 3);
end;

function task_three_03()
    local szTalk = {
        "<sex> v� r�i �? Kh�ng bi�t th�i th� t�m ta c� chuy�n g�?",
        "Th�i th� mu�n mua chu�c ta h�m h�i Ph�m ti�n sinh, tuy t�i h� kh��c t� nh�ng thi�t ngh� �ng ta s� kh�ng b� qua chuy�n n�y ��u.",
        "<sex> t�nh kh� th�ng th�n, n�u �ng ta c� c�ch th� ta r�i kh�i ��y l�u r�i. <sex> ��ng qu� lo l�ng!",
        "Kh�ng l� Ph�m ti�n sinh bi�t ���c � �� c�a �ng ta?",
        "B�n �� S�n H� X� T�c li�n qua t�i v�n m�nh qu�c gia. Ph�m m� c�n ph�i ki�m tra n�ng l�c <sex>, �i t�m Lang C�t t�u �� th� l�ng ki�n nh�n <sex>, t�m th�i th� mu�n hi�u ph�m ch�t c�a <sex>. <sex> qu� nhi�n ng��i l� ng��i ngay th�ng kh�ng m�ng danh l�i, th�t ��ng kh�m ph�c!",
        "Kh�ng d�m! Kh�ng d�m! V�y b��c ti�p theo s� l�m g�?",
        "C�i Bang tai m�t nhi�u, l�o c� vi�t b�c th� nh� �� t� C�i Bang d� la tin t�c! Xin gi�p ta mang t�n v�t n�y ��n C�i Bang t�m H�ng Th�t."
    };
    TalkEx("task_three_03_02", szTalk);
end;

function task_three_03_02()

    GivePlayerAward("Level_16", "hell");    --����
    GivePlayerExp(SkeyCDFanzhongyan,"zhengyishilian2")	--��������2
    AddItem(2,0,78,1);
    --RemoveTrigger(GetTrigger(153));
    SetTask(TASK_CD_FOUR, 1);
    SetTask(TASK_CD_THREE, 4);
    Msg2Player("��n C�i Bang d� la tin t�c");
    TaskTip("��n C�i Bang d� la tin t�c");
end;

function task_three_03_01()
    local szTalk = {
        "<sex> ��i � ��n gi�p b�n quan r�i �?",
        "Ch� ngang qua th�i! C�o t�!"
    };
    TalkEx("", szTalk);
end;

function task_three_04()
    local szTalk = {
        "C�i Bang tai m�t nhi�u, kh�ng ch�ng �� c� tin t�c.",
        "T�i h� ��n C�i Bang ngay!"
    };
    TalkEx("", szTalk);
end;

function task_four_01()

    GivePlayerAward("Level_18", "easy");    --����
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing1")	--ؤ��֮��1
    DelItem(2,0,78,1);
    SetTask(TASK_CD_FOUR, 2);
    Msg2Player("T�m �� t� C�i Bang");
    TaskTip("T�m �� t� C�i Bang");
end;

function task_four_02()
    SetTask(TASK_CD_FOUR, 3);
    CreateTrigger(0, 516, KILL_CD_XT); --ɱС͵
    CreateTrigger(0, 517, KILL_CD_FZ); --�ٷ���
    Msg2Player("Gi�p �� t� C�i Bang t�m h�nh l�");
    TaskTip("Gi�p �� t� C�i Bang t�m h�nh l�");
end;

function task_four_03()
    if GetTrigger(KILL_CD_XT) == 0 then
        CreateTrigger(0, 516, KILL_CD_XT); --ɱС͵
    end;
    if GetTrigger(KILL_CD_FZ) == 0 then
        CreateTrigger(0, 517, KILL_CD_FZ); --ɱ����
    end;
end;

function task_four_04()

    GivePlayerAward("Level_18", "easy");    --����
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing2")	--ؤ��֮��2
    DelItem(2,0,79,1);
    SetTask(TASK_CD_FOUR, 5);
end;

function task_four_05()
    local szBack1 = {
        "Hi�n Th�nh �� �ang n�o lo�n. Phi�n <sex> mang th� n�y v� cho Ph�m ti�n sinh. C� c�n ta ��a <sex> v� Th�nh �� kh�ng?",
        "Ta �� s�n s�ng. Phi�n H�ng ��i ca!/task_four_yes",
        "Ta c�n chu�n b�, s� quay l�i sau!/task_exit"
    };
    SelectSay(szBack1);
end;

function task_four_yes()
    --RemoveTrigger(GetTrigger(154));
    
    SetTask(TASK_CD_FOUR, 7);
    
    --���͵��ɶ�
	SetFightState(0);
	i=random(1,3);
--	if i==1 then
--		NewWorld(300, 1896 ,3655)
	if i==2 then
		NewWorld(300, 1677 ,3671);
	elseif i==3 then
		NewWorld(300, 1681 ,3464);
	else 
		NewWorld(300, 1911 ,3442);
	end;
end;

function task_four_0607()
    local szTalk = {
        "<sex> v�t v� qu�! C� tin t�c g� t� C�i Bang kh�ng?",
        "C� th� c�a H�ng Th�t ��i ca, m�i ti�n sinh xem qua.",
        "Th� ra c�n b� m�t b�n trong.",
        "Ti�n sinh sao ��m chi�u v�y?",
        "Ng��i bi�t T�y H� Nh�t Ph�m ���ng kh�ng?",
        "T�i h� m�i b��c ch�n v�o ch�n giang h�, xin ti�n sinh ch� gi�o.",
        "�� l� m�t t� ch�c gi�n �i�p c�a n��c T�y H�, h� ph� tr�ch ph�a t�y ph� ho�i v� ng�n c�n ng��i kh�c. T�y H� m�t b�o cho L��ng S�n bi�t �m m�u Hoa Th�ch C��ng b�n trong ch�a b�n �� S�n H� X� T�c.",
        "N�i nh� v�y gi�a ch�ng c� m�i quan h� m�t thi�t?",
        "L��ng S�n tuy l� S�n t�c nh�ng th� l�nh T�ng Giang ch�nh tr�c, c� l�ng y�u n��c kh�ng th� n�o c�u k�t v�i ��m ng��i T�y H�. S� vi�c h� tr�ng! Xin mang t�n v�t n�y ��n Giang T�n Th�n t�m Gia C�t K�.",
        "T�i h� l�p t�c l�n ���ng ngay!"
    };
    TalkEx("task_four_0607_01", szTalk);
end;

function task_four_0607_01()
    GivePlayerAward("Level_18", "hell");    --����
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangzhixing3")	--ؤ��֮��3
    SetTask(TASK_CD_FOUR, 8);
    SetTask(TASK_JJC, 1);
    AddItem(2,0,78,1);
    DelItem(2,0,80,1);
    Msg2Player("��n Giang T�n Th�n t�m Gia C�t K�");
    TaskTip("��n Giang T�n Th�n t�m Gia C�t K�");
end;

function task_four_08()
    local szTalk = {
        "Giang h� s�p c� cu�c ��m m�u n�a."
    };
    TalkEx("", szTalk);
end;

function task_exit()

end;
