Include("\\script\\online\\item_buchang\\ibc_head.lua")

function OnDeath(id, f, x)
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("BC_jinbaoxiang", "R��ng V�ng ��n B�", IBC_MAPID, IBC_MAP_X, IBC_MAP_Y);
	if npcIndex > 0 then
		SetNpcScript(npcIndex, "\\script\\online\\item_buchang\\box_big.lua");
		SetNpcLifeTime(npcIndex, 10 * 60);
	end
end