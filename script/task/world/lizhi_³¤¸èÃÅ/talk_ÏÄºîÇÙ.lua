--�ļ�˵��
--���ĺ��ٶԻ������Ľű�
-- created by lizhi
-- 2005-8-11 14:07

Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function talk_one()

    local szTalk = {
        "Ta ph�ng m�nh Tri�u Di�n Ni�n ti�n b�i th�ng b�o cho c� n��ng c�n �� ph�ng b�n d� t�c v� s�",
        "�a t� <sex>, ta s� �� ph�ng."
    }
    
    RemoveTrigger(GetRunningTrigger());
    if GetTask(TASK_ONE) == 110 then
        GivePlayerAward("Level_20", "easy");
    elseif GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard");
    end;
    
    SetTask(124, 2);
    if GetTask(125) == 2 and GetTask(126) == 2 then
        RemoveTrigger(GetTrigger(90));
        SetTask(111, 111);
    else
        RemoveTrigger(GetTrigger(90));
        CreateTrigger(1, 201, 90);
        ContinueTimer(GetTrigger(90));
    end;
    TalkEx("", szTalk);
end;

function talk_five()

    local szTaskThreeTalk = {
        "C� n��ng c� ph�i l� H� H�u C�m?",
        "Ta ng�y ng�y ng�i g�y ��n, n�o ph�i n� hi�p g� ��u?",
        "Ta v�a ��nh b�i Ch��ng V� C��ng, �o�t ���c m�t h�m b�n trong ghi chuy�n h�ng �� ���c chuy�n �i n�i kh�c, ngo�i ra c�n �� c�p c� ch�nh l� ng��i li�n l�c v�i {Tr��ng Ca M�n}, c�n ph�i tr� kh�!",
        "V�y �? Ng��i c� �em m�t h�m t�i kh�ng? Chuy�n h�ng �� r�t cu�c l� g�?",
        "��y! M�i c� xem qua! Theo t�i h� ���c bi�t chuy�n h�ng �� nghe ��u c� li�n quan ��n m�nh S�n H� X� T�c.",
        "C� chuy�n ��i s� th�t r�i, �a t� �� <sex> th�ng b�o. ��y ch�t t� l�, xin nh�n l�y!"
    };
    local szTaskFourTalk = {
        "Th�c ra ta ch�nh l� ng��i li�n l�c v�i {Tr��ng Ca M�n}, chuy�n n�y b�t ��u t� ng�y khai qu�c. L�c �� Th�i T� {b�nh ��nh giang s�n}, c�c v� t��ng nh� Th�ch Th� T�n, Cao Ho�i ��c, Tr��ng L�nh Phong, {Tri�u Ng�n Huy} ��u c�o l�o h�i h��ng, an d��ng tu�i gi�. ��ng ti�c Tri�u Ng�n Huy ��i nh�n kh�ng ch�u n�i s� c� ��n b�n li�n l�c m�t s� b�n b� giang h�, ng�m th�, t� v� ngh�.",
        "V� sau nh�ng v� b�ng h�u n�y th�nh l�p th�nh m�t m�n ph�i. L�c �� trong ph�i nhi�u ng��i s�ng t�c nh�c l�m th� cho n�n m�i c� t�n {Tr��ng Ca M�n}.",
        "Ta c� th� gi�p ���c g� cho c� n��ng ��y."
    };

    local szFinished = {
        "<sex> qu� nhi�n th�n th� b�t ph�m! Ch�t qu� m�n xin nh�n l�y!"
    };
    local szTaskFiveTalk = {
        "Hy v�ng <sex> c� th� gi�p ta th�ng b�o cho nh�ng ng��i li�n l�c kh�c trong {Tr��ng Ca M�n}, l� {C�ng T�n Th�} (T��ng D��ng), {Tri�u Di�n Ni�n} (Bi�n Kinh), {Gia C�t K�} (Giang T�n Th�n).",
        "Ta s� �i ngay!"
    };
    local szTaskFiveFinished = {
        "Ta �� ho�n th�nh nhi�m v� c� n��ng y�u c�u!",
        "�a t� <sex>, ��y l� ch�t qu� m�n, xin nh�n l�y!"
    };

    
    if GetTask(TASK_THREE) == 1 then
        TalkEx("task_four_00", szTaskThreeTalk);
        return
    end;
    
    local nStep = GetTask(TASK_FOUR);
    if nStep == 1 then
        TalkEx("task_four_01", szTaskFourTalk);
        return
    elseif nStep == 2 then
        Talk(1, "", "Phi�n b�ng h�u ��n Long Tuy�n th�n gi�t 20 con h� ly.");
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
        Talk(1, "", "Mau th�ng b�o cho nh�ng ng��i trong Tr��ng Ca M�n bi�t");
        return
    elseif nStep == 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, 6);
        GivePlayerAward("Level_18", "hard", "head", "Level_21");
		GivePlayerExp(SkeyQZWangyewei,"xiahouqindekaoyan")		--�ĺ��ٵĿ���
        TalkEx("", szTaskFiveFinished);
        return
    end;
        
end;

function task_four_00()
    SetTask(TASK_THREE, 2);
    SetTask(TASK_FOUR, 1);
    DelItem(2, 0, 40, 1);
    GivePlayerAward("Level_18", "hard");
	GivePlayerExp(SkeyQZWangyewei,"zhangweigangdemihan")		--��ΰ�յ��ܺ�
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
    RemoveTrigger(GetTrigger(99));
    CreateTrigger(0,506,99);
    Msg2Player("Gi�t 20 con h� ly � Long Tuy�n Th�n");
    TaskTip("Gi�t 20 con h� ly � Long Tuy�n Th�n");
end;

function task_four_03()
    SetTask(TASK_FOUR, 4);
    SetTask(TASK_FIVE, 1);
    GivePlayerAward("Level_18", "hard");
	GivePlayerExp(SkeyQZWangyewei,"lianluochanggemen")		--�ĺ��ٵĿ���
end;

function task_five_00()
    CreateTrigger(4, 208, 150);    --talk to ������
    SetTask(127,1);
    CreateTrigger(4, 210, 151);    --talk to �����
    SetTask(128,1);
    CreateTrigger(4, 211, 152);    --talk to ������
    SetTask(129,1);
    
    AddItem(2, 0, 41, 1);   --��������
    AddItem(2, 0, 42, 1);   --���������
    AddItem(2, 0, 43, 1);   --���������
    
    Msg2Player("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    TaskTip("Li�n l�c 3 v�i 3 ng��i c�n l�i trong Tr��ng Ca M�n");
    
    SetTask(TASK_FIVE, 2);
end;