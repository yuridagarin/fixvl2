--�ļ�˵��
--�빫����Ի������Ľű�
--created by lizhi
--2005-8-11 17:16

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function talk_one()
    local szMsg = {
        "Ta ph�ng m�nh Tri�u Di�n Ni�n th�ng b�o cho ti�n b�i c�n �� ph�ng b�n d� t�c v� s�",
        "�a t� <sex>, n�u th�t ch�ng ��n ta s� d�y cho b�i h�c."
    };
    RemoveTrigger(GetRunningTrigger());
    if GetTask(TASK_ONE) == 110 then
        GivePlayerAward("Level_20", "easy", "legs", "Level_23");
    elseif GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard", "legs", "Level_23");
    end;
    
    SetTask(125, 2);
    if GetTask(124) == 2 and GetTask(126) == 2 then
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
        "H� H�u C�m b�o v�n b�i ��n th�ng b�o v� m�nh S�n H� X� T�c c� kh� n�ng r�i v�o tay Xi H�a gi�o, ��y l� th� c�a �ng ta, m�i ti�n b�i xem qua!",
        "�a t� ti�u huynh ��!",
        "C�n nhi�u ng��i c�n ph�i th�ng b�o n�a, v�n b�i �i ��y!"
    };
    local nStep = 0;
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(129,2);
        DelItem(2,0,42,1);
        TalkEx("", szMsg);
    end;
end;