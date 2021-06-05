--�����������ĺ���
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");
Include("\\script\\task\\world\\lizhi_����\\task_two_main.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

szTaskThreeTalk = {
    "C� n��ng c� ph�i l� H� H�u C�m?",
    "Ta ng�y ng�y ng�i g�y ��n, n�o ph�i n� hi�p g� ��u?",
    "Ta v�a ��nh b�i Ch��ng V� C��ng, �o�t ���c m�t h�m b�n trong ghi chuy�n h�ng �� ���c chuy�n �i n�i kh�c, ngo�i ra c�n �� c�p c� ch�nh l� ng��i li�n l�c v�i {Tr��ng Ca M�n}, c�n ph�i tr� kh�!",
    "V�y �? Ng��i c� �em m�t h�m t�i kh�ng? Chuy�n h�ng �� r�t cu�c l� g�?",
    "��y! M�i c� xem qua! Theo t�i h� ���c bi�t chuy�n h�ng �� nghe ��u c� li�n quan ��n m�nh S�n H� X� T�c.",
    "C� chuy�n ��i s� th�t r�i, �a t� �� <sex> th�ng b�o. ��y ch�t t� l�, xin nh�n l�y!"
};
szTaskFourTalk = {
    "Th�c ra ta ch�nh l� ng��i li�n l�c v�i {Tr��ng Ca M�n}, chuy�n n�y b�t ��u t� ng�y khai qu�c. L�c �� Th�i T� {b�nh ��nh giang s�n}, c�c v� t��ng nh� Th�ch Th� T�n, Cao Ho�i ��c, Tr��ng L�nh Phong, {Tri�u Ng�n Huy} ��u c�o l�o h�i h��ng, an d��ng tu�i gi�. ��ng ti�c Tri�u Ng�n Huy ��i nh�n kh�ng ch�u n�i s� c� ��n b�n li�n l�c m�t s� b�n b� giang h�, ng�m th�, t� v� ngh�.",
    "V� sau nh�ng v� b�ng h�u n�y th�nh l�p th�nh m�t m�n ph�i. L�c �� trong ph�i nhi�u ng��i s�ng t�c nh�c l�m th� cho n�n m�i c� t�n {Tr��ng Ca M�n}.",
    "Ta c� th� gi�p ���c g� cho c� n��ng ��y."
};

szFinished = {
    "<sex> qu� nhi�n th�n th� b�t ph�m! Ch�t qu� m�n xin nh�n l�y!"
};
szTaskFiveTalk = {
    "Hy v�ng <sex> c� th� gi�p ta th�ng b�o cho nh�ng ng��i li�n l�c kh�c trong {Tr��ng Ca M�n}, l� {C�ng T�n Th�} (T��ng D��ng), {Tri�u Di�n Ni�n} (Bi�n Kinh), {Gia C�t K�} (Giang T�n Th�n).",
    "Ta s� �i ngay!"
};
szTaskFiveFinished = {
    "Ta �� ho�n th�nh nhi�m v� c� n��ng y�u c�u!",
    "�a t� <sex>, ��y l� ch�t qu� m�n, xin nh�n l�y!"
};

function main()
    
    if GetTask(124) == 1 then
    	talk_one();
    	return
   	end;
    
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep == 6 then
        two_06_00();
        return
    elseif nStep == 7 then
        two_07_00();
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 6 then
        task_06_00();
        return
    elseif nStep == 7 then
        task_07_xh_00();
        return
    elseif nStep == 11 then
        task_11_00();
        return
    elseif nStep == 12 then
        task_12_00();
        return
    elseif nStep == 18 then
        task_18_00();
        return
    elseif nStep == 19 then
        Talk(1,"","Ng��i ch�a mang <color=yellow>Thi�n Thi�m H�a ��c Cao<color> cho <color=yellow>H� H�u Li�n<color> sao?");
        return
    elseif nStep == 20 then
        task_20_00();
        return
    elseif nStep == 21 then
        Talk(1,"","Mau ��n <color=yellow>Thanh Kh� ��ng <color> � <color=yellow>Long Tuy�n th�n<color> c�u <color=yellow>L�i Th�ng<color> tho�t n�n!");
        return
    elseif nStep == 22 then
        task_22_00();
        return
    elseif nStep == 23 then
        task_23_00();
        return
    elseif nStep == 24 then
        task_24_00();
        return
    elseif nStep == 25 then
        task_25_00();
        return
    elseif nStep == 26 then
        task_26_00();
        return
    elseif nStep == 27 then
        Talk(1,"","H�y mang <color=yellow>b�o v�t th�n b�<color> ��n t�n tay <color=yellow>���ng Ninh<color> � <color=yellow>V� Di s�n<color>!");
        return
    elseif nStep == 28 then
        task_28_00();
        return
    elseif nStep == 29 then
        local szTalk = {
            "Hi�n ch�a c� g� c�n ng��i gi�p. <sex> h�y �i tu luy�n th�m!"
        };
        TalkEx("", szTalk);
        return
    end;
    
    if GetTask(TASK_THREE) == 1 then
        TalkEx("task_four_00", szTaskThreeTalk);
        return
    end;
    
    local nStep = GetTask(TASK_FOUR);
    if nStep == 1 then
        TalkEx("task_four_01", szTaskFourTalk);
        return
    elseif nStep == 2 then
        Talk(1, "task_four_02_00", "Phi�n b�ng h�u ��n Long Tuy�n th�n gi�t 20 con h� ly.");
        return
    elseif nStep == 3 then
        TalkEx("task_four_03", szFinished);
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 1 then
        TalkEx("task_five_00", szTaskFiveTalk);
        return
    elseif nStep == 2 then
        Talk(1, "", "Mau b�o r� t�nh h�nh n�i n�y cho c�c ng��i li�n l�c c�a Tr��ng Ca M�n!");
        return
    elseif nStep == 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, 6);
        GivePlayerAward("Level_18", "hard", "head", "Level_21");
        TalkEx("", szTaskFiveFinished);
        return
    end;
    
    local szTalk = {
        "<sex> n�u r�nh r�i, h�y nghe ta t�u kh�c!"
    };
    TalkEx("", szTalk);
end;

function talk_one()
    local szTalk = {
        "Ta ph�ng m�nh Tri�u Di�n Ni�n ti�n b�i th�ng b�o cho c� n��ng c�n �� ph�ng b�n d� t�c v� s�",
        "�a t� <sex>, ta s� �� ph�ng."
    };
    GivePlayerAward("Level_20", "hard");
    GivePlayerExp(SkeyBJShuxin,"shitaijinji2")		--��̬����1
    SetTask(124, 2);
    if GetTask(125) == 2 and GetTask(126) == 2 then
        SetTask(111, 111);
    end;
    TalkEx("", szTalk);
end;

function task_four_00()
    SetTask(TASK_THREE, 2);
    SetTask(TASK_FOUR, 1);
    DelItem(2, 0, 40, 1);
    GivePlayerAward("Level_18", "hard");
end;

function task_four_01()
    local szTalkFourTalk2 = {
        "Th�n ph�n ta �� b� ng��i {Xi H�a gi�o} ph�t hi�n, ng��i mau gi�p ta ��n {Long Tuy�n Th�n} gi�t 20 con {h� ly} v� ��y!",
        "���c! Ta �i ngay!"
    };
    TalkEx("task_four_02", szTalkFourTalk2);
end;

function task_four_02()
    SetTask(TASK_FOUR, 2);
    CreateTrigger(0,506,99);	--ɱ����
    Msg2Player("Gi�t 20 con h� ly � Long Tuy�n Th�n");
    TaskTip("Gi�t 20 con h� ly � Long Tuy�n Th�n");
end;

function task_four_02_00()
	if GetTrigger(99) == 0 then
		CreateTrigger(0,506,99);	--ɱ����
	end;
end;

function task_four_03()
    SetTask(TASK_FOUR, 4);
    SetTask(TASK_FIVE, 1);
    GivePlayerAward("Level_18", "hard");
end;

function task_five_00()
    SetTask(127,1);
    SetTask(128,1);
    SetTask(129,1);
    
    AddItem(2, 0, 41, 1);   --��������
    AddItem(2, 0, 42, 1);   --���������
    AddItem(2, 0, 43, 1);   --���������
    
    Msg2Player("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    TaskTip("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    
    SetTask(TASK_FIVE, 2);
end;