--����ɢ�ű�
Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnUse(nIndex)
	if tGtTask:check_cur_task(3) == 0 or GetTask(Task_id_003) >= 1 then
		return 0;
	end
	if DelItem(2,0,30020,1) == 1 then
		SetTask(Task_id_003,GetTask(Task_id_003)+1);
		local tSex = gf_GetPlayerSexName();
		Msg2Player(tSex.."�� s� d�ng Thanh L� T�n do Nh�c B�t Qu�n luy�n ch�, b�ch ��c b�t x�m, h�y nhanh ch�ng ��n Long M�n Tr�n xem t�nh h�nh c�a B�ch Hi�u Sinh th� n�o!")
	end
end