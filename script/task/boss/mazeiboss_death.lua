function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30);
	SetNpcScript(npcIndex,"");
	local MapID,MapX,MapY = GetNpcWorldPos(npcIndex);
	if MapID == 203 then
		for i=1,20 do
			xnsIndex = CreateNpc("M� T�c L�u La","M� T�c L�u La",203,1506,3002,-1,1,1,1500);
			SetNpcDeathScript(xnsIndex,"\\script\\task\\boss\\mazeilouluo_death.lua");
		end
	end
end