Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	if tGtTask:check_cur_task(106) == 0  or GetTask(Task_id_017) == 1 then
		Talk(1,"","C� quan r�t nguy hi�m kh�ng n�n ��n g�n!");
		return 0;
	end
	if GetItemCount(2,0, 30059) > 0 then
		SetTask(Task_id_017, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 974, 2, 0, 5);
	else
		Talk(1,"","Kh�ng c� ch�a kh�a kh�ng th� kh�i ��ng c� quan")
	end
end