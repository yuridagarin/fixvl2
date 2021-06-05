--  �ļ�˵��
--  Ȫ�ݵ����д������¼�
--  Created by lizhi
--  2005-8-3 15:05

Include("\\script\\task\\world\\lizhi_Ȫ��\\task_head.lua");
Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Wl_Killed()    --ɱ������

    local nStep = 0;

    RemoveTrigger(GetRunningTrigger());
    
    nStep = GetTask(TASK_LEV_12_ID);
    SetTask(TASK_LEV_12_ID, nStep + 1);
    
    if (nStep == 2) then
        TaskTip("�� ��nh b�i 10 t�n l�u manh v� 10 t�n C�n ��, v� t�m H� Ki�t");
    end;
end;

function Lm_Killed_1()
    local nItemCount = GetItemCount(2, 1, 154); 
    if nItemCount >= 20 then
        TaskTip("�� thu th�p �� 20 Ng�c kh�");
    end;
    
    if g_probability(40, 100) then
        AddItem(2,1,154,1);
    end;
end;

function Lm_Killed_10()    --ɱ����å

    local nStep = 0;
    
    RemoveTrigger(GetRunningTrigger());

    nStep = GetTask(TASK_LEV_12_ID);
    SetTask(TASK_LEV_12_ID, nStep + 1);
    
    if (nStep == 2) then
        TaskTip("�� ��nh b�i 10 t�n l�u manh v� 10 t�n C�n ��, v� t�m H� Ki�t");
    end;
end;

function Yc_Killed()    --ɱ����ҩ

    local nType = 0;
    local nTrigger = 0;
    local nQingCount = 0;
    local nGeCount = 0;
    local nPeiCount = 0;
    local nLianCount = 0;
    local nJinCount = 0;
    
    nQingCount = GetItemCount(2, 0, 33);    --����
    nGeCount = GetItemCount(2, 0, 34);      --���
    nPeiCount = GetItemCount(2, 0, 35);     --����
    nLianCount = GetItemCount(2, 0, 36);    --����
    nJinCount = GetItemCount(2, 0, 37);     --������
    
    if ((nQingCount >= 3) and (nGeCount >= 3) and (nPeiCount >= 3) and (nLianCount >= 3) and (nJinCount >= 3)) then
        Msg2Player("Thu th�p ���c t�t c� d��c li�u");
    end;
    
    nType = random(0, 4);

    if (nType == 0) then
        AddItem(2, 0, 33, 1);   --����
    elseif (nType == 1) then
        AddItem(2, 0, 34, 1);   --���
    elseif (nType == 2) then
        AddItem(2, 0, 35, 1);   --����
    elseif (nType == 3) then
        AddItem(2, 0, 36, 1);   --����
    elseif (nType == 4) then
        AddItem(2, 0, 37, 1);   --������
    end;
end;

function Yz_Killed()    --ɱ��Ұ��
    
    if g_probability(5, 100) then
        AddItem(2, 0, 39, 1);
    end;
end;

function Leave_Game()
    RemoveTrigger(GetRunningTrigger());
    --RemoveTrigger(GetTrigger(88));
    RemoveTrigger(GetTrigger(86));
    if GetTask(TASK_LEV_18_ID) == 2 then
        KillFollower();
        SetTask(TASK_LEV_18_ID, 1);
    end;
end;

function Zs_OnTimer()
    
    local nStep = 0;
    
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(87));
    --RemoveTrigger(GetTrigger(88));
    KillFollower();
    nStep = GetTask(TASK_LEV_18_ID);
    
    if (nStep == 2) then
        SetTask(TASK_LEV_18_ID, 1);
        Msg2Player("Trong th�i gian quy ��nh ch�a l�m xong, nhi�m v� th�t b�i");
        TaskTip("Trong th�i gian quy ��nh ch�a l�m xong, nhi�m v� th�t b�i");
        --CreateTrigger(0, 195, 85); --��ɱһ����ΰ��
    end;
end;

--function Enter_Map()
--    RemoveTrigger(GetTrigger(86));
--    RemoveTrigger(GetTrigger(87));
--    RemoveTrigger(GetRunningTrigger());
--    
--    Talk(2,"","<color=green>����<color>����л<sex>��ȣ������Ѿ���Ȫ�ݳ��ˣ��Ͳ��ͷ�<sex>�ˡ�<sex>�����ʱ�������￴������");
--end;