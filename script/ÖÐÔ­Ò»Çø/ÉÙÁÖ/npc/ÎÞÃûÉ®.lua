--����ɮ
--created by lizhi
--2005-8-24 19:09
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_�����\\task_main.lua");
Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	
	local nStep = GetTask(TASK_JJC);
	if nStep == 10 then
		task_10_00();
		return
	elseif nStep == 11 then
		task_11_00();
		return
	elseif nStep == 12 then
		task_12_00();
		return
	end;
	
	i=random(1,3)
	if i == 1 then
		Say("A Di �� Ph�t! N�i ��y xin th� ch� ch� l�m lo�n! ��c t�i! ��c t�i!",0)
	elseif	i == 2 then
		Say("B� �� v�n v� th�, minh k�nh di�t phi ��i, b�n th� v� nh�t v�t, h� x� nh� tr�n ai.",0)
	else
		Say("L�o t�ng th�t t�, c�n kh�ng nh� m�nh tu � ��y bao nhi�u n�m n�a.",0)
	end
end;