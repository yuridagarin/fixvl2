Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	if tGtTask:check_cur_task(40) == 0  then
		Talk(1,"","C� quan r�t nguy hi�m kh�ng n�n ��n g�n!");
	else
		if GetTask(Task_id_005) == 3 then
			if GetMapTaskTemp(111,Map_Glb_Valve5) >= 8 then
				Talk(1,"","Qu� nhi�u Ni�n Th� l�n, h�y quay l�i sau.")
				return 0;
			end
			--ˢ��
			local nNpcIndex;
			nNpcIndex = CreateNpc("Ni�n th� to l�n","Ni�n th� to l�n",111,1698,3114,0,1,1,100)
			SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\����Death.lua");
			SetMapTaskTemp(111,Map_Glb_Valve5,GetMapTaskTemp(111,Map_Glb_Valve5)+1);
			local sName = gf_GetPlayerSexName();
			Talk(1,"",format("%s c�n th�n, xu�t hi�n 1 Ni�n Th� to l�n.",sName));
			Msg2Player(format("%s c�n th�n, xu�t hi�n 1 Ni�n Th� to l�n.",sName));
		else
			Talk(1,"","C� quan r�t nguy hi�m kh�ng n�n ��n g�n!");
		end
	end
end