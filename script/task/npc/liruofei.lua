Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\tmp_task_id_def.lua")


nMapId, nX, nY = GetWorldPos();
if nMapId ~= 6025 then
	Msg2Player("Nhi�m v� kh�i ��ng th�t b�i, h�y h�y nhi�m v� v� b�t ��u l�i");
	return 0;
end
if tGtTask:check_cur_task(109) == 0  then
	Msg2Player("Nh�n nhi�m v� th�t b�i, h�y h�y nhi�m v� v� th� l�i l�i.");
	return 0;
end

--npcIndex = CreateNpc("zhandouyuebuqun", "����Ⱥ", GetWorldPos());
--print(npcIndex)
--SetCampToNpc(npcIndex,"camp_enemy");
--SetNpcLifeTime(npcIndex, 4 * 60);
--SetCampToPlayer("camp_enemy");


npcIndex = CreateNpc("liruofei", "L� Nh��c Phi", nMapId, nX + 2, nY + 2);
SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\liruofei_death.lua");
--SetCampToNpc(npcIndex, "camp_evil");
Msg2Player("L� Nh��c Phi �� xu�t hi�n!")

