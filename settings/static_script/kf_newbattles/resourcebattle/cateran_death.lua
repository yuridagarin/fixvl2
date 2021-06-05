Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(nNpcIndex)
	local sNpcName = GetNpcName(nNpcIndex);
	if sNpcName == nil then
		WriteLog("[Chi�n tr��ng b�o l�i]: GetNpcName trong file g�c cateran_death.lua nh�n t�n NPC b�o l�i");
		return 0;
	end;
	local nNpcCamp = get_npc_camp(sNpcName);
	SetNpcLifeTime(nNpcIndex,DEAD_BODY_TIME);
	DelGroupUnit(CATERAN_GROUP_SONG+nNpcCamp-1,nNpcIndex);
end;

function get_npc_camp(sNpcName)
	if sNpcName == "S�n t�c (T�ng)" then
		return SONG_ID;
	else
		return LIAO_ID;
	end; 
end;