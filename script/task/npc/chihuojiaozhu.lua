
function CreateNpcCHZJ()
	local npcIndex = CreateNpc("chihuojiaojiaozhu","Xi H�a Gi�o Ch�", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\chihuojiaozhu.lua");
	SetNpcLifeTime(npcIndex, 15 * 60);
end

function OnDeath(id)
	SetNpcLifeTime(id, 0);
end
