TASKVALUE_DIFFICULT_LEVEL_ID = 335	-- ��ǰѡ���ʦ��������Ѷȵȼ�

function killmonster()
	local task_id = 11
	local task_info = GetInfo(task_id, 4)					-- ����NPCģ��ID
			 	 
   	if (GetIfDoingTask(task_id, task_info) == 1) then
		FillTaskValue(task_id)
		TaskTip("Nhi�m v� th��ng h�i: Truy s�t "..task_info.." �� ho�n th�nh")
	end
end

function killmonster1()
	local task_id = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)
	local task_info = GetInfo(task_id, 4)					-- ����NPCģ��ID
			 	 
   	if (GetIfDoingTask(task_id, task_info) == 1) then
		FillTaskValue(task_id)
		TaskTip("Nhi�m v� s� m�n tu�n ho�n: Truy s�t "..task_info.." �� ho�n th�nh")
	end
end