function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,0);
	local nNpcIdx = CreateNpc("Bao tr��ng l�o","Bao tr��ng l�o",215,1748,3066);
	SetNpcScript(nNpcIdx,"\\script\\��ԭһ��\\�ڷ綴\\npc\\������.lua");
end