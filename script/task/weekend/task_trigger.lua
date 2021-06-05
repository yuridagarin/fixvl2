--������
--created by lizhi
--2005-9-10 13:29

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")

function Path_Wrong(nPath)
	if nPath == PATH_BJ2QZ then
	    SetTask(TASK_GQ_DELIVER, 0);
	    for index, value in rect_trigger_table do
	        RemoveTrigger(GetTrigger(value[2]));
	    end;
	    for index, value in path_table do
	        SetTask(value, 0);
	    end;
    elseif nPath == PATH_XY2YZ then
		SetTask(TASK_GQ_DELIVER, 0);
	    for index, value in rect_trigger_table_2 do
	        RemoveTrigger(GetTrigger(value[2]));
	    end;
	    for index, value in path_table_2 do
	        SetTask(value, 0);
	    end;
    else
		SetTask(TASK_GQ_DELIVER, 0);
	    for index, value in rect_trigger_table_3 do
	        RemoveTrigger(GetTrigger(value[2]));
	    end;
	    for index, value in path_table_3 do
	        SetTask(value, 0);
	    end;
	end;
	
	Msg2Player(ErrorMsg);
	TaskTip(ErrorMsg);
end;

function Enter_Map()
    local nMapId = GetWorldPos();
    local nPath = GetTask(TASK_GQ_DELIVER);
    local nIndex = 0;
    local nCount = 0;
    
    if is_exist(finished_product_table) == 0 then	--���û�л���
        SetTask(TASK_GQ_DELIVER, 0);
    	--�Ƴ�������
    	if nPath == PATH_BJ2QZ then
		    for index, value in rect_trigger_table do
		        if GetTrigger(value[2]) ~= 0 then
		            RemoveTrigger(GetTrigger(value[2]));
		        end;
		    end;
		else
			for index, value in rect_trigger_table_2 do
		        if GetTrigger(value[2]) ~= 0 then
		            RemoveTrigger(GetTrigger(value[2]));
		        end;
		    end;
		end;
		for i=1730, 1736 do	--ûʱ���ˣ�ֱ��д��
    		SetTask(i, 0);
    	end;
		Msg2Player("H�nh nh� ng��i kh�ng mang v�t t�!");
		TaskTip("H�nh nh� ng��i kh�ng mang v�t t�!");
	    return
	end
    
    if nPath == PATH_BJ2QZ then
		nIndex = 0;
		for index, value in path_table_index do
			if value == nMapId then
				nIndex = index;
				break
			end;
		end;
		SetTask(path_table[nIndex], 1);
    elseif nPath == PATH_XY2YZ then
		nIndex = 0;
		for index, value in path_table_2_index do
			if value == nMapId then
				nIndex = index;
				break
			end;
		end;
		SetTask(path_table_2[nIndex], 1);
	elseif nPath == PATH_YZ2XY then
		nIndex = 0;
		for index, value in path_table_3_index do
			if value == nMapId then
				nIndex = index;
				break
			end;
		end;
		SetTask(path_table_3[nIndex], 1);
    end;
    
    --�ж��Ƿ���·������
	if nPath == PATH_BJ2QZ then
		nCount = 0;
		for index, value in path_table_index do
			if value == nMapId then
				nCount = index;
				break
			end;
		end;
		for i=1, nCount do
			if GetTask(path_table[i]) == 0 then		--û�а����н�·�߽���
				Path_Wrong(nPath);
				return
			end;
		end;
	elseif nPath == PATH_XY2YZ then
		nCount = 0;
		for index, value in path_table_2_index do
			if value == nMapId then
				nCount = index;
				break
			end;
		end;
		for i=1, nCount do
			if GetTask(path_table_2[i]) == 0 then		--û�а����н�·�߽���
				Path_Wrong(nPath);
				return
			end;
		end;
	elseif nPath == PATH_YZ2XY then
		nCount = 0;
		for index, value in path_table_3_index do
			if value == nMapId then
				nCount = index;
				break
			end;
		end;
		for i=1, nCount do
			if GetTask(path_table_3[i]) == 0 then
				Path_Wrong(nPath);
				return
			end;
		end;
	end;

    Msg2Player(map_message[nPath][nMapId]);
    TaskTip(map_message[nPath][nMapId]);
end;

function Leave_Map_Boss()
    SetTask(TASK_NPC_INDEX, 0);
	SetTask(TASK_BOSS_INDEX, 0);
	--ɾ��boss��rect������
	RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
	RemoveTrigger(GetTrigger(log_boss_table[2]));
	RemoveTrigger(GetTrigger(time_boss_table[2]));
end;

function Leave_Game_Boss()
    SetTask(TASK_NPC_INDEX, 0);
    SetTask(TASK_BOSS_INDEX, 0);
    --ɾ��boss��rect������
    RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(time_boss_table[2]));
end;

function Leave_Game_Wk()
    --�����������
    SetTask(TASK_GQ_DELIVER, 0);
    SetTask(TASK_GQ_KILLWK, 0);
    SetTask(TASK_GQ_KILLWK_START, 0);
    SetFightState(0);
    RemoveTrigger(GetRunningTrigger());
    
    for index, value in rect_wk_table do    --�ƴ����򴥷���
        RemoveTrigger(GetTrigger(value[2]));
    end;
    for index, value in kill_trigger_table do
        RemoveTrigger(GetTrigger(value[2]));
    end;
    
    RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
end;

function Leave_Map_Wk()
    --�����������
    SetTask(TASK_GQ_DELIVER, 0);
    SetTask(TASK_GQ_KILLWK, 0);
    SetTask(TASK_GQ_KILLWK_START, 0);
    ForbidChangePK(0);  --pk
    SetFightState(0);
    SetLogoutRV(0);
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(log_wk_table[2]));

    for index, value in kill_trigger_table do
        RemoveTrigger(GetTrigger(value[2]));
    end;

    RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
    TaskTip("B�n �� r�i kh�i chi�n tr��ng v�o Oa Kh�u.");
end;

function Kill_Wk()
    SetTask(TASK_GQ_KILLWK, GetTask(TASK_GQ_KILLWK) + 1);
    Msg2Player("�� ho�n th�nh nhi�m v� c�p ("..GetTask(TASK_GQ_KILLWK).."/"..MAXNUM_KILLWK..")");
    
    if GetTask(TASK_GQ_KILLWK) >= MAXNUM_KILLWK then
        --�ƴ�������
        RemoveTrigger(GetRunningTrigger());

        for index, value in rect_wk_table do    --�ƴ����򴥷���
            RemoveTrigger(GetTrigger(value[2]));
        end;

        RemoveTrigger(GetTrigger(log_wk_table[2]));
        --�Ƴ���ʱ��
        RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
        
        SetTask(TASK_GQ_DELIVER, 0);
    	SetTask(TASK_GQ_KILLWK, 0);
    	SetTask(TASK_GQ_KILLWK_START, 0);
        SetLogoutRV(0);
        ForbidChangePK(0);  --pk
        SetFightState(0);
        --���ͳ�ɱ���ܵ�ͼ
        NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
        --��һ��
    	AddKillWkTimes(1);
    	SetTask(TASK_WK_ISDISCONNECT, 0);
        TaskTip("��n Ch� huy s� nh�n b�o v�t ��i T�ng �i!");
    end;
end;

function Kill_All()
    local npcIndex, npcTemplete, npcName = GetTriggeringUnit();
    
    if CheckTime(5) == 0 and CheckTime(6) == 0 then	--����5�Ǵ�ֵ�����ϵ�ʱ��
    	return
    end;
    
    if npcName == "Oa Kh�u" or npcName == "Oa Kh�u Binh s�" or npcName == "Oa Kh�u Th�y Binh" or npcName == "Oa Kh�u L�c Binh" or npcName == "Oa Kh�u V� S�" then
        return
    end;

    local nMapId = GetWorldPos();
    local nCount = getn(material_table);
    local i = random(1, nCount);
    
    local maps_table = {105, 108, 201, 203, 205, 301, 304, 308};	--���ֵ�ͼ
	local nFlag = 0;
	for index, value in maps_table do
		if nMapId == value then
			nFlag = 1;
			break
		end;
	end;

	local nProbability = 1
	local nValue = GetTask(TASK_IB_BOOK1)
	if nValue ~= 0 then
		local nDate = mod(nValue, 1000000)
		if nDate >= tonumber(date("%y%j")) then
			nProbability = floor(nValue / 1000000)
		else
			SetTask(TASK_IB_BOOK1, 0)
		end
	end

	if nFlag == 1 then	--�����ֵ�ͼ��
        if g_probability(nProbability * 10, 100) then
            AddItem(material_table[i][1], material_table[i][2], material_table[i][3], 1, 1);
        end;
    else
        if g_probability(nProbability * 20, 100) then
            AddItem(material_table[i][1], material_table[i][2], material_table[i][3], 1, 1);
        end;
    end;
end;

function KillWk_OnTimer()   --ʱ�䵽
    --���͵�ԭ���ĵط�
    SetFightState(0);
    ForbidChangePK(0);  --��ֹpk
    SetLogoutRV(0);
    NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
    
end;

function KillBoss_OnTimer()   --ʱ�䵽
	if GetTrigger(2516) ~= 0 then	
		local nFlag = floor(GetTask(TASK_PET_FIGHT)/10)	
			
		RemoveTrigger(GetTrigger(2516))
		
		SetTaskTemp(TSK_TMP_PET_INDEX,0)
		SetTaskTemp(TSK_TMP_ENEMY_INDEX,0)
		SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,0)
		
		AddUnitStates(nFlag,6, - GetUnitCurStates(nFlag,6))
		
		SetTask(TASK_PET_FIGHT,2)
		Say("So t�i B�n ��ng H�nh l�n n�y 2 b�n h�a nhau!",0)
		Msg2Player("So t�i B�n ��ng H�nh l�n n�y 2 b�n h�a nhau.")			
	else
	    SetTask(TASK_NPC_INDEX, 0);
	    SetTask(TASK_BOSS_INDEX, 0);
	    RemoveTrigger(GetRunningTrigger());
	    RemoveTrigger(rect_boss_table[1][2]);
	    RemoveTrigger(log_boss_table[2]);
	 end
end;