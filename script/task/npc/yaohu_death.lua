function OnDeath(id)
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("lihai", "L� H�i", 6073, 1590, 3220);
	SetNpcLifeTime(npcIndex, 10);
	Msg2Player("L� H�i:".."Ho�ng Nhi........")
	Msg2Player("L� H�i:".."Ho�ng Nhi........")
	NpcChat(ncpIndex, "Ho�ng Nhi........")
end