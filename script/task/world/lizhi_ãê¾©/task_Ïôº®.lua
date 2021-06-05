--��ӦNPC�����Ľű�

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua")

function main()
    local szTalk= {
        "Ng��i l� ai? ��n ��y l�m g�?",
        "C�u t�c to gan! Ta ��n c�u B�ch ti�n b�i ��y!",
        "Ha! Ha!Ha! V�y ta c�ng kh�ng kh�ch s�o! Cho ng��i n�m m�i l�i h�i c�a Thi�n �m gi�o ta!"
    };
    if GetTask(TASK_BJ_ID) == 11 then
        if GetTask(135) == GetTargetNpc() then
            Msg2Player("H� s�t Ti�u H�n");
            TaskTip("H� s�t Ti�u H�n");
            TalkEx("change", szTalk);
            return
        end;
    end;

    Talk(1,"","Ta v�i ng��i kh�ng th� kh�ng o�n! ��ng n�n can thi�p v�o nh�ng chuy�n c�a Thi�n �m gi�o!");
end;

function change()
    local nIndex = GetTask(135);
    ChangeNpcToFight(nIndex);
end;

function OnDeath()
    local nPreservedPlayerIndex = PlayerIndex;
    local nMemCount = GetTeamSize();
    local nMapId, nX, nY = GetWorldPos();
    
    if nMemCount == 0 then -- ���δ���
        if GetTask(TASK_BJ_ID) == 10 then
            AddItem(2, 0, 50, 1);
            SetTask(TASK_BJ_ID, 12);
            Msg2Player("B�n l�y ���c m�t th� c�a Ti�u H�n");
            bcw_talk();
    	elseif GetTask(TASK_BJ_ID) == 11 then
    	    local nMask = GetMapTaskTemp(202, 0);   --ȡmap��0�ű���
	        nMask = SetBit(nMask, GetTask(137), 0);
            SetMapTaskTemp(202, 0, nMask);
            
	        RemoveTrigger(GetTrigger(TIME_BJ_XH));   --ɾ����ʱ��
	        RemoveTrigger(GetTrigger(LOG_BJ_XH));    --ɾ����½������
	        RemoveTrigger(GetTrigger(RECT_BJ_XH));   --ɾ�����򴥷���
    	    -- ����������
            AddItem(2, 0, 50, 1);
            SetTask(TASK_BJ_ID, 12);
        	Msg2Player("B�n l�y ���c m�t th� c�a Ti�u H�n");
        	
        	SetNpcLifeTime(GetTask(135), 0);
        	SetTask(135,0);
        	SetTask(137,0);
        	bcw_talk();
        end;
    else
        for i=1, nMemCount do
	        PlayerIndex = GetTeamMember(i);
            if GetTask(TASK_BJ_ID) == 10 then
                AddItem(2, 0, 50, 1);
                SetTask(TASK_BJ_ID, 12);
            	Msg2Player("B�n l�y ���c m�t th� c�a Ti�u H�n");
            	bcw_talk();
	        elseif GetTask(TASK_BJ_ID) == 11 then
    	        nMask = SetBit(nMask, GetTask(137), 0);
                SetMapTaskTemp(202, 0, nMask);
                
    	        RemoveTrigger(GetTrigger(TIME_BJ_XH));   --ɾ����ʱ��;
    	        RemoveTrigger(GetTrigger(LOG_BJ_XH));   --ɾ����½������;
    	        RemoveTrigger(GetTrigger(RECT_BJ_XH));   --ɾ�����򴥷���
        	    -- ����������
                AddItem(2, 0, 50, 1);
                SetTask(TASK_BJ_ID, 12);
            	Msg2Player("B�n l�y ���c m�t th� c�a Ti�u H�n");
            	
            	SetNpcLifeTime(GetTask(135), 0);
            	SetTask(135,0);
            	SetTask(137,0);
            	bcw_talk();
            end;
        end;
    end;
end;

function bcw_talk()
    local szTalk = {
        "�a t� <sex>! T�n Ti�u H�n mu�n b�t l�o phu v� ch�a b�nh cho Gi�o ch� c�a h�n! N�u <sex> kh�ng ra tay, c� l� l�o �� v� ch�n su�i!",
        "N�u kh�ng nh� c� ph��ng thu�c c�a con g�i l�o th� t�i h� ch�c c�ng kh�ng l�m ���c g�!",
        "Ha! Ha! Ha! V�y l� l�o �� c� ng��i n�i nghi�p r�i! Ph�i r�i <sex> c� th� cho l�o xem qua b�c th� l�y l�c n�y kh�ng?",
        "Xin ti�n b�i xem qua!",
        "[B�ch Th�o �ng ��c nhanh m�t th�]"
    };
    if GetTask(TASK_BJ_ID) == 12 then
        
        SetTask(TASK_BJ_ID, 13);
        -- ɾ�����ٽ�׹�
        DelItem(2,0,47,1);
        --�ҹ��������񴥷�
        SetTask(TASK_XYTY, 1);
        TalkEx("bcw_talk_1", szTalk);
    end;
end;

function bcw_talk_1()
    local szTalk = {
        "Th� ra Ti�u H�n l� K� ch� c�a Thi�n �m gi�o. Ta xem trong th� c� nh�c ��n C�ng T�n Th� l� 1 trong 4 ng��i c�a Tr��ng ca m�n. Xem ra �ang c� chuy�n g� m� �m! <sex> h�y mau ��n T��ng D��ng b�o cho C�ng T�n Th� �� ph�ng!",
        "{Thi�n �m gi�o}? {Tr��ng ca m�n}? T�i h� kh�ng hi�u g� c�! Xin l�o b�i ch� gi�o th�m cho!",
        "Tr��ng ca m�n l� m�t m�n ph�i th�n b� c�a Trung Nguy�n, c� quan h� m�t thi�t v�i Ho�ng t�c. C�n Thi�n �m gi�o th� ta ch�a h� nghe nh�c ��n. <sex> h�y v� Bi�n Kinh t�m Kh�u Chu�n ��i nh�n b�o s� vi�c, bi�t ��u s� t�m ra manh m�i!",
        "V�y xin ti�n b�i h�y t� b�o tr�ng! T�i h� �i ��y!"
    };
    TalkEx("", szTalk);
end;
