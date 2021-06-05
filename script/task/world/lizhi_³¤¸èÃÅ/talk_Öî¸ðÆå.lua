--�ļ�˵��
--�������Ի������Ľű�
--created by lizhi
--2005-8-11 17:16

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function talk_one()

    local szMsg = {
        "V�n b�i ph�ng m�nh Tri�u Di�n Ni�n ti�n b�i th�ng b�o ti�n b�i c�n �� ph�ng b�n d� t�c v� s� .",
        "Haha! �a t� <sex>, kh�ng bi�t t�i ch�i c� c�a h� th� n�o?"
    };
    
    RemoveTrigger(GetRunningTrigger());
    
    if GetTask(TASK_ONE) == 110 then
        GivePlayerAward("Level_20", "easy", "weapon", "Level_22");
    elseif GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
    end;
    
    SetTask(126, 2);
    if GetTask(125) == 2 and GetTask(124) == 2 then
        RemoveTrigger(GetTrigger(90));
        SetTask(111, 111);
    else
        RemoveTrigger(GetTrigger(90));
        CreateTrigger(1, 201, 90);
        ContinueTimer(GetTrigger(90));
    end;
    TalkEx("", szMsg);
end;

function talk_five()

    local szMsg = {
        "H� H�u C�m nh� v�n b�i ��n th�ng b�o v� m�nh S�n H� X� T�c c� kh� n�ng r�i v�o tay Xi H�a gi�o, xin ti�n b�i xem qua th� n�y!",
        "�a t� anh h�ng!",
        "C�n nhi�u ng��i c�n ph�i th�ng b�o n�a, v�n b�i �i ��y!"
    };
    local nStep = 0;
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(128,2);
        DelItem(2,0,41,1);
        TalkEx("", szMsg);
        return
    end;
end;