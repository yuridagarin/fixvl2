--�������񴥷���������
--created by lizhi
--2005-8-19 11:35
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\task\\world\\g_random_head.lua");

function LaoHu_Killed()
    if g_probability(35, 100) then
        AddItem(2,0,55,1);
    end;
    
    if GetItemCount(2,0,55) >= 10 then
        SetTask(TASK_XYTY, 6);
    end;
end;

function LieHu_Killed()
    if GetTask(TASK_XYTY) == 10 or GetTask(TASK_XYTY) == 11 then
        if g_probability(10, 70) then
            if GetItemCount(2,0,56) < 1 then 
                AddItem(2,0,56,1);
                SetTask(TASK_XYTY, 11);
                Talk(1,"","Tr�n ng��i Li�p h� Linh B�o s�n c� c� c�a ti�u c�c, c� l� ti�u s� �� b� gi�t ph�i v� b�m b�o l�i v�i C�ng T�n Th� ti�n b�i!");
            end;
        end;
    elseif GetTask(TASK_XYTY) == 12 or GetTask(TASK_XYTY) == 13 then
        if g_probability(35, 100) then
            AddItem(2,0,57,1);
        end;
        
        if GetItemCount(2,0,57) >= 20 then
            SetTask(TASK_XYTY, 13);
        end;
    end;
end;

function Mxsz_Killed()
    if GetTask(TASK_XYTY) == 15 or GetTask(TASK_XYTY) == 16 then
        if g_probability(70, 1000) then
            RemoveTrigger(GetRunningTrigger());
            SetTask(TASK_XYTY, 16);
            local szMsg = {
                "Mau n�i! M�t kh�u v�o M� Tuy�t s�n trang l� g�?",
                "���i hi�p tha m�ng, l��{M�} ai tr�m tr�m, {Tuy�t} d� h�n h�n, {S�n} l�c tr�ng tr�ng, {Trang} x� th�m th�m."
            };
            TalkEx("", szMsg);
        end;
    elseif GetTask(TASK_XYTY) == 17 or GetTask(TASK_XYTY) == 18 then
        if GetItemCount(2,0,58) < 1 then
            if g_probability(80, 1000) then
                AddItem(2,0,58,1);
                SetTask(TASK_XYTY, 18);
            end;
        end;
    end;
end;

function Db_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_XY_TEMP, 1);
    if GetTask(TASK_XY_TEMP1) == 1 then
        Talk(1,"","��i qu�n ti�n phong �� b� ti�u di�t g�n h�t, Li�u qu�n t�m th�i kh�ng d�m ti�n qu�n ti�n ��nh T��ng D��ng, v� b�m b�o v�i C�ng T�n Th� ti�n b�i tr��c!");
        SetTask(TASK_XYTY, 28);
        SetTask(TASK_XY_TEMP, 0);
        Msg2Player("V� b�m b�o C�ng T�n Th�");
        TaskTip("V� b�m b�o C�ng T�n Th�");
    end;
end;

function Qb_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_XY_TEMP1, 1);
    if GetTask(TASK_XY_TEMP) == 1 then
        Talk(1,"","��i qu�n ti�n phong �� b� ti�u di�t g�n h�t, Li�u qu�n t�m th�i kh�ng d�m ti�n qu�n ti�n ��nh T��ng D��ng, v� b�m b�o v�i C�ng T�n Th� ti�n b�i tr��c!");
        SetTask(TASK_XYTY, 28);
        SetTask(TASK_XY_TEMP, 0);
        Msg2Player("V� b�m b�o C�ng T�n Th�");
        TaskTip("V� b�m b�o C�ng T�n Th�");
    end;
end;

function Jmg_Killed()
    if g_probability(50, 1000) then
        AddItem(2,0,61,1);
        SetTask(TASK_XYTY, 30);
        Msg2Player("V� b�m b�o C�ng T�n Th�");
        TaskTip("V� b�m b�o C�ng T�n Th�");
    end;
end;

--function Jl_Killed()
--    AddItem(2,0,62,3);
--    RemoveTrigger(GetRunningTrigger());
--    SetTask(TASK_XYTY, 32);
--    Msg2Player("�ر�������");
--end;

function Sd_Killed()
    if GetTask(TASK_XYTY) == 33 or GetTask(TASK_XYTY) == 34 then
        if g_probability(25, 100) then
            AddItem(2,0,63,1);
        end;
        if GetItemCount(2,0,63) >= 10 then
            SetTask(TASK_XYTY, 34);
            Msg2Player("V� b�m b�o C�ng T�n Th�");
            TaskTip("V� b�m b�o C�ng T�n Th�");
        end;
    elseif GetTask(TASK_XYTY) == 41 or GetTask(TASK_XYTY) == 42 then
        if g_probability(20, 100) then
            AddItem(2,0,66,1);
        end;
        if GetItemCount(2,0,66) >= 5 then
            SetTask(TASK_XYTY,42);
            Msg2Player("V� b�m b�o C�ng T�n Th�");
            TaskTip("V� b�m b�o C�ng T�n Th�");
        end;
    end;
end;

function Njx_Killed()
    if g_probability(25, 100) then
        AddItem(2,0,65,1);
    end;
    
    if GetItemCount(2,0,65) >= 10 then
        SetTask(TASK_XYTY, 40);
        Msg2Player("Thu th�p �� m� h�n h��ng");
        TaskTip("Thu th�p �� m� h�n h��ng");
    end;
end;

function Dyx_Killed()
    AddItem(2,0,67,1);
    SetTask(TASK_XYTY, 44);
    RemoveTrigger(GetRunningTrigger());
    Msg2Player("V� b�m b�o C�ng T�n Th�");
    TaskTip("V� b�m b�o C�ng T�n Th�");
end;

function Ldb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP, 1);
    if GetTask(TASK_XY_TEMP1) == 1 and GetTask(TASK_XY_TEMP2) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Lqb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP1, 1);
    if GetTask(TASK_XY_TEMP) == 1 and GetTask(TASK_XY_TEMP2) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Ljb_Killed()
    RemoveTrigger(GetRunningTrigger());
    
    SetTask(TASK_XY_TEMP2, 1);
    if GetTask(TASK_XY_TEMP1) == 1 and GetTask(TASK_XY_TEMP) == 1 then
        SetTask(TASK_XYTY, 49);
        SetTask(TASK_XY_TEMP, 0);
        SetTask(TASK_XY_TEMP1, 0);
        SetTask(TASK_XY_TEMP2, 0);
    end;
end;

function Xs_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,68,1);
    end;
    
    if GetItemCount(2,0,68) >= 10 then
        SetTask(TASK_XYTY, 52);
    end;
end;

--function Zs_Killed()
--    if GetItemCount(2,0,210) >= 1 then
--        DelItem(2,0,210,1);
--        Msg2Player("��������ʦʬ��ʹ������ˮ");
--        local nStep = GetTask(TASK_XY_TWO_ONE);
--        SetTask(TASK_XY_TWO_ONE, nStep + 1);
--    else
--        Talk(1,"","<color=green>���<color>����⣬û��<color=yellow>����ˮ<color>�ˣ������ȳ��˻��䵱���Ϻ�������������������");
--        SetTask(TASK_XY_TWO, 4);
--    end;
--    
--    if GetTask(TASK_XY_TWO_ONE) == 3 then
--        SetTask(TASK_XY_TWO, 5);
--        RemoveTrigger(GetRunningTrigger());
--        AddItem(2,0,72,1);
--        if GetTask(TASK_XY_ONE) == 5 and GetTask(TASK_XY_TWO) == 5 then  --�������֧����������ˣ����������
--            SetTask(TASK_XYTY, 56);
--            Msg2Player("�ر�������");
--            TaskTip("�ر�������");
--        end;
--    end;
--end;

--326,1496,2945
--function Leave_Game()
--    if GetTask(TASK_XYTY) == 24 then
--        SetTask(TASK_XYTY, 23);
--        SetNpcLifeTime(GetTask(TASK_XY_TEMP), 0);
--        local npcIndex = CreateNpc("��ͷ���", "��ͷ���", 326, 1496, 2945);
--        SetNpcScript(npcIndex, "\\script\\��ԭ����\\ĺѩɽׯ\\npc\\��ͷ���.lua");
--        SetDeathScript("");
--        SetTask(TASK_XY_TEMP, 0);
--        RemoveTrigger(GetRunningTrigger());
--        RemoveTrigger(GetTrigger(LEAVE_RECT_XY));
--    end;
--end;

--function Leave_Map()
--    if GetTask(TASK_XYTY) == 24 then
--        SetTask(TASK_XYTY, 23);
--        SetNpcLifeTime(GetTask(TASK_XY_TEMP), 0);
--        local npcIndex = CreateNpc("��ͷ���", "��ͷ���", 326, 1496, 2945);
--        SetNpcScript(npcIndex, "\\script\\��ԭ����\\ĺѩɽׯ\\npc\\��ͷ���.lua");
--        SetDeathScript("");
--        SetTask(TASK_XY_TEMP, 0);
--        RemoveTrigger(GetTrigger(LEAVE_GAME_XY));
--        RemoveTrigger(GetRunningTrigger());
--    end;
--end;