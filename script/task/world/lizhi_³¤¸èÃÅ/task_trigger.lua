--�ļ�˵��
--���������񴥷����ű�
--created by lizhi
--2005-8-10 15:19

Include("\\script\\task\\world\\lizhi_������\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");

function Yzl_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,51,1);  --������������
    end;
    if GetItemCount(2,0,51) >= 9 then
    	Msg2Player("Thu th�p xong Tr��ng M�n s�ch");
    	TaskTip("Thu th�p xong Tr��ng M�n s�ch");
   	end;
end;

function Lbs_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,52,1);  --����������
    end;
    if GetItemCount(2,0,52) >= 9 then
    	Msg2Player("Thu th�p xong Thi�n �m gi�o t�p th�");
    	TaskTip("Thu th�p xong Thi�n �m gi�o t�p th�");
   	end;
end;

function Wmb_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,53,1);  --�������
    end;
    if GetItemCount(2,0,53) >= 9 then
    	Msg2Player("Thu th�p xong phong t�c Xi H�a gi�o");
    	TaskTip("Thu th�p xong phong t�c Xi H�a gi�o");
   	end;
end;

function Mxsz_Killed()
    if g_probability(20, 100) then
        AddItem(2,0,54,1);  --һƷ������
    end;
    if GetItemCount(2,0,54) >= 9 then
    	Msg2Player("Thu th�p xong vi�c l�m c�a Nh�t Ph�m ���ng");
    	TaskTip("Thu th�p xong vi�c l�m c�a Nh�t Ph�m ���ng");
   	end;
end;

function Hl_Killed()
    RemoveTrigger(GetRunningTrigger());
    SetTask(TASK_FOUR, 3);
end;

--function Cgm_OnTimer()
--    RemoveTrigger(GetRunningTrigger());
--    SetTask(TASK_ONE, 110);
--end;

--function Leave_Game()
--    if GetTask(124) == 2 or GetTask(125) == 2 or GetTask(126) == 2 then
--        RemoveTrigger(GetRunningTrigger());
--        RemoveTrigger(GetTrigger(90));
--    end;
--end;