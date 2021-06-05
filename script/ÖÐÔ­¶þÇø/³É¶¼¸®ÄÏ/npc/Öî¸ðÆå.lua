--�����
--created by lizhi
--2005-8-24 19:09
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�����\\task_main.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function main()
	if GetTask(126) == 1 then	--������֪ͨ
    	talk_one();
    	return
   	end;
   	
   	if GetTask(128) == 1 then		--�ĺ���֪ͨ
   		talk_five();
   		return
   	end;
   	
    local nStep = GetTask(TASK_JJC);
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 8 then
        task_08_00();
        return
    elseif nStep == 9 then
        task_09_00();
        return
    elseif nStep == 13 then
        task_13_00();
        return
    elseif nStep == 14 then
        task_14_00();
        return
    elseif nStep == 15 or nStep == 16 then
        task_15_00();
        return
    elseif nStep == 22 then
        task_22_00();
        return
    elseif nStep == 23 then
        task_23_00();
        return
    elseif nStep == 32 then
        task_32_zgq();
        return
    elseif nStep >= 33 then
        task_33_00();
        return
    end;
   	
    local szTalk = {
        "Tung ho�nh b�n ph��ng, r�t cu�c c�ng ch� v� m�t ch� ���O� m� ra! H�y!..."
    };
    TalkEx("", szTalk);
end;

function talk_one()
    local szMsg = {
        "V�n b�i ph�ng m�nh Tri�u Di�n Ni�n ti�n b�i th�ng b�o ti�n b�i c�n �� ph�ng b�n d� t�c v� s� .",
        "Haha! �a t� <sex>, kh�ng bi�t t�i ch�i c� c�a h� th� n�o?"
    };
    
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyBJShuxin,"shitaijinji2")		--��̬����2
    SetTask(126, 2);
    if GetTask(125) == 2 and GetTask(124) == 2 then
        SetTask(111, 111);
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
