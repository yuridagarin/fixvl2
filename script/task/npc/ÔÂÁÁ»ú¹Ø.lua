Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	if tGtTask:check_cur_task(40) == 0  then
		Talk(1,"","C� quan r�t nguy hi�m kh�ng n�n ��n g�n!");
	else
		if GetTask(Task_id_005) == 2 then
			if GetMapTaskTemp(111,Map_Glb_Valve3) >= 10 then
				Talk(1,"","Qu� nhi�u R�n H�, h�y quay l�i sau.")
				return 0;
			end
			--ˢ��
			local nNpcIndex;
			for i=1,10 do 
				nNpcIndex = CreateNpc("Nh�n k�nh x�","Nh�n k�nh x�",111,1665,2826,0,1,1,100);
				SetNpcDeathScript(nNpcIndex,"\\script\\task\\npc\\�۾���Death.lua");
				SetMapTaskTemp(111,Map_Glb_Valve3,GetMapTaskTemp(111,Map_Glb_Valve3)+1);
			end	
			local sName = gf_GetPlayerSexName();
			Talk(1,"",format("%s c�n th�n, xu�t hi�n 1 ��t M�ng x�.",sName));
			Msg2Player(format("%s c�n th�n, xu�t hi�n 1 ��t M�ng x�.",sName));
		else
			Talk(1,"","C� quan r�t nguy hi�m kh�ng n�n ��n g�n!");
		end
	end
end