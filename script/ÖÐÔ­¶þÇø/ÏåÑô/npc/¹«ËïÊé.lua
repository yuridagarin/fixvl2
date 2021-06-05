--������
--created by lizhi
--2005-8-24 19:24

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_����\\task_main.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function main()

    if GetTask(125) == 1 then
    	talk_one();
    	return
   	end;
   	
   	if GetTask(129) == 1 then
   		talk_five();
   		return
   	end;
   	
    local nStep = GetTask(TASK_XYTY);
    
    if nStep == 1 then
        task_01_00();
        return
    elseif nStep == 9 then
        task_09_00();
        return
    elseif nStep == 10 then
        task_10_00();
        return
    elseif nStep == 11 then
        task_11_00();
        return
    elseif nStep == 12 then
        task_12_00()
        return
    elseif nStep == 13 then
        task_13_00();
        return
    elseif nStep == 22 then
        task_22_00();
        return
    elseif nStep == 28 then
        task_28_00();
        return
    elseif nStep == 29 then
        task_29_00();
        return
    elseif nStep == 30 then
        task_30_00();
        return
    elseif nStep == 32 then
        task_32_00();
        return
    elseif nStep == 33 then
        task_33_00()
        return
    elseif nStep == 34 then
        task_34_00();
        return
    elseif nStep == 37 then
        task_37_00();
        return
    elseif nStep == 42 then
        task_42_00();
        return
    elseif nStep == 43 then
        task_43_00()
        return
    elseif nStep == 44 then
        task_44_00();
        return
    elseif nStep == 54 then
        task_54_00();
        return
    elseif nStep == 56 then
        task_56_00();
        return
    elseif nStep == 59 then
        task_59_00();
        return
    elseif nStep == 61 then
        task_61_00();
        return
    end;
    
    
    local szTalk = {
        "Ta b�nh sinh ch� t�m ��c m�t ch� th�ng n�o ng� ch�n nh�m ng��i ngay c� ��nh b�c c�ng thua."
    };
    TalkEx("", szTalk);
end;

function talk_one()
    local szMsg = {
        "Ta ph�ng m�nh Tri�u Di�n Ni�n th�ng b�o cho ti�n b�i c�n �� ph�ng b�n d� t�c v� s�",
        "�a t� <sex>, n�u th�t ch�ng ��n ta s� d�y cho b�i h�c."
    };
    if GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard");
		GivePlayerExp(SkeyBJShuxin,"shitaijinji2")		--��̬����2
    end;
    
    SetTask(125, 2);
    if GetTask(124) == 2 and GetTask(126) == 2 then
        SetTask(111, 111);
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
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(129,2);
        DelItem(2,0,42,1);
        TalkEx("", szMsg);
    end;
end;