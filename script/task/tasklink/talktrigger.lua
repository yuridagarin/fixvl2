function talktask()
	task_id = 11
	task_info = {GetInfo(task_id, 1),
		     GetInfo(task_id, 2),
		     GetInfo(task_id, 3),
		     GetInfo(task_id, 4)}	

	if (GetIfDoingTask(task_id, task_info[1]) == 1) then
		RemoveTrigger(GetRunningTrigger())
		Say(task_info[3].."\n\n"..task_info[4], 0)
		TaskTip("c�ng v�i "..task_info[1].." ��i tho�i, ho�n th�nh nhi�m v�")
	else
		RemoveTrigger(GetRunningTrigger())
	end
end
