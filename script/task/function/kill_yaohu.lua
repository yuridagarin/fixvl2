--Task150
function kill_yaohu()
	local npcIndex;
	npcIndex = CreateNpc("zhandouzhoubuhuo", "Chu B�t Ho�c", 6073, 1598, 3212);
	SetNpcLifeTime(npcIndex, 6*60)
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\zbh_che_death.lua");
	SetCampToNpc(npcIndex,"camp_enemy");
	npcIndex = CreateNpc("zhandouchaihuanger", "S�i Ho�ng Nhi", 6073, 1601, 3210);
	SetNpcLifeTime(npcIndex, 6*60)
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\zbh_che_death.lua");
	SetCampToNpc(npcIndex,"camp_enemy");
	npcIndex = CreateNpc("zhandouyaohu", "Y�u H�", 6073, 1600, 3208);
	SetNpcLifeTime(npcIndex, 10*60)
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yaohu_death.lua");
	SetCampToNpc(npcIndex, "camp_evil");
end    

dostring("kill_yaohu()") 