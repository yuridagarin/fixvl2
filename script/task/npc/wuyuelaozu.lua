function Call_wuyuelaozu()
	local npcIndex = CreateNpc("Ng� Vi�t L�o T�","Ng� Vi�t L�o T�", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\wuyuelaozu.lua");
	SetNpcLifeTime(npcIndex, 15 * 60);
end


function OnDeath(id)
	SetNpcLifeTime(id, 0);
end