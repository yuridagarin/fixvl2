function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,0);
	local nNpcIdx = CreateNpc("H�m S�n ��i v��ng","H�m S�n ��i v��ng",508,1750,3331);
	SetNpcScript(nNpcIdx,"\\script\\task\\npc\\��ɽ����Death.lua");
end