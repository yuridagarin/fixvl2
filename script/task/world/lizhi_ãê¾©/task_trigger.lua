--  �ļ�˵��
--  �꾩�����д������¼�
--  Created by lizhi
--  2005-8-3 15:05

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Lm_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_BJ_ID, 3);
    return 1
end;

function Wl_Killed()    --ɱ������

    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_BJ_ID, 5);
    return 1
end;

function Wl_Killed_5()
    if g_probability(15,100) then
        AddItem(2,0,46,1);
    end;
end;

function OnUse()
    local nIndexNpcXh = 0;
    local nIndexNpcBcw = 0;
    local nFlag = 0;
    --������ˢ�µ�
    local xh_point = {
        {202,1472,2746,183,171},
        {202,1361,2836,170,177},
        {202,1571,3005,196,187},
        {202,1581,2824,197,176},
        {202,564,2918,195,182},
        {202,1576,3070,197,191},
        {202,1525,3159,190,197},
        {202,1451,3177,181,198},
        {202,1362,3029,170,189},
        {202,1357,2923,169,182}
    };
    if GetTask(TASK_BJ_ID) ~= 10 then
        return
    end;
    
    local nMapId = GetWorldPos();
    
    if nMapId ~= 202 then
        Msg2Player("B�n �� �i qu� xa ph�m vi M�ch T�ng C�! Xin quay l�i H�nh Hoa th�n �� t�m!");
        TaskTip("B�n �� �i qu� xa ph�m vi M�ch T�ng C�! Xin quay l�i H�nh Hoa th�n �� t�m!");
        return
    end;
    
    local nValue = GetMapTaskTemp(202, 0);  --ȡ��ͼ��0�ű���
    for i=1, 10 do
        if GetBit(nValue, i) == 0 then
            nValue = SetBit(nValue, i, 1);
            SetMapTaskTemp(202, 0, nValue);
            SetTask(137, i);
            SetTask(TASK_BJ_ID, 11);
            nIndexNpcXh = CreateNpc("Ti�u H�n", "Ti�u H�n", xh_point[i][1], xh_point[i][2], xh_point[i][3]);
            Msg2Player("B�ch Th�o �ng �  "..xh_point[i][4]..","..xh_point[i][5].." !!");
            TaskTip("B�ch Th�o �ng �  "..xh_point[i][4]..","..xh_point[i][5].." !!");
            nFlag = 1;
            break
        end;
    end;
    
    if nFlag == 0 then
        Msg2Player("M�ch T�ng C� v�n ch�a �� th�i gian ph�t ��c. Xin ��i 1 l�t!");
        TaskTip("M�ch T�ng C� v�n ch�a �� th�i gian ph�t ��c. Xin ��i 1 l�t!");
        return
    end;

    SetNpcDeathScript(nIndexNpcXh, "\\script\\task\\world\\lizhi_�꾩\\task_����.lua");
    
    SetTask(135, nIndexNpcXh);
    
    --��ʱ
    CreateTrigger(1, 200, TIME_BJ_XH);
    ContinueTimer(GetTrigger(TIME_BJ_XH));
    
    --log������
    CreateTrigger(3, 201, LOG_BJ_XH);
    SetLogType(GetTrigger(LOG_BJ_XH), 1); --����Ϊ�ų�����
    
    --rect ������
    CreateTrigger(2,1300,RECT_BJ_XH);
end;

function Bj_OnTimer()
    local nIndexXh = GetTask(135);
    local nValue = GetMapTaskTemp(202,0);

    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(LOG_BJ_XH));
    RemoveTrigger(GetTrigger(RECT_BJ_XH));
    
    if nIndexXh ~= 0 then
        SetNpcLifeTime(nIndexXh, 0);
    end;
        
    Msg2Player("B�ch Th�o �ng �� b� Ti�u H�n (183.170) b�t �i. Ti�p t�c d�ng M�ch T�ng C� �i t�m!");
    TaskTip("B�ch Th�o �ng �� b� Ti�u H�n (183.170) b�t �i. Ti�p t�c d�ng M�ch T�ng C� �i t�m!");

    if GetTask(137) ~= 0 then
        nValue = SetBit(nValue, GetTask(137), 0);
        SetMapTaskTemp(202, 0, nValue);
    end;
    SetTask(TASK_BJ_ID, 10);
    SetTask(135,0);
    SetTask(137,0);
end;

function Leave_Game()
    SetTask(TASK_BJ_ID, 10); --�����������
    RemoveTrigger(GetTrigger(TIME_BJ_XH));   --ɾ����ʱ��;
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(RECT_BJ_XH));

    if GetTask(135) ~= 0 then
        SetNpcLifeTime(GetTask(135), 0);
    end;

    if GetTask(137) ~= 0 then
        local nValue = GetMapTaskTemp(202,0);
        nValue = SetBit(nValue, GetTask(137), 0);
        SetMapTaskTemp(202, 0, nValue);
    end;
    
    SetTask(135,0);
    SetTask(137,0);
end;

function Leave_Map()
    SetTask(TASK_BJ_ID, 10); --�����������
    RemoveTrigger(GetTrigger(TIME_BJ_XH));   --ɾ����ʱ��;
    RemoveTrigger(GetTrigger(LOG_BJ_XH));
    RemoveTrigger(GetRunningTrigger());

    if GetTask(135) ~= 0 then
        SetNpcLifeTime(GetTask(135), 0);
    end;

    if GetTask(137) ~= 0 then
        local nValue = GetMapTaskTemp(202,0);
        nValue = SetBit(nValue, GetTask(137), 0);
        SetMapTaskTemp(202, 0, nValue);
    end;
    Msg2Player("B�n �� �i qu� xa ph�m vi M�ch T�ng Kim gi�p ��c. Xin quay l�i H�nh Hoa th�n �� t�m!");
    TaskTip("B�n �� �i qu� xa ph�m vi M�ch T�ng Kim gi�p ��c. Xin quay l�i H�nh Hoa th�n �� t�m!");
    SetTask(135,0);
    SetTask(137,0);
end;
