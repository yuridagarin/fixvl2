Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(nNpcIndex)
	local sNpcName = GetNpcName(nNpcIndex);
	if sNpcName == nil then
		WriteLog("[Chi�n tr��ng b�o l�i]: GetNpcName trong file g�c cateran_death.lua nh�n t�n NPC b�o l�i");
		return 0;
	end;
	local nPlayerCamp = BT_GetCamp();
	local nEnemyCamp = 3 - nPlayerCamp;
	local nNpcCamp = get_npc_camp(sNpcName);
	if nPlayerCamp == nNpcCamp then
		if nPlayerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"T�ng"..GetName().." l� tay gi�t ch�t s�n t�c l�u la, phe Li�u nh�n c� h�i thu h�i 15 bao l��ng th�o")
		else
			Msg2MSAll(MISSION_ID,"Li�u"..GetName().." l� tay gi�t ch�t s�n t�c l�u la, phe T�ng nh�n c� h�i thu h�i 15 bao l��ng th�o")
		end;
		Add_Resource(nEnemyCamp,15);
		Dec_Resource(nPlayerCamp,15);
	else
		Add_Resource(nPlayerCamp,15);
		Dec_Resource(nEnemyCamp,15);
		if nPlayerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"T�ng"..GetName().."T�m S�n t�c l�u la �o�t v� 15 bao l��ng th�o");
		else
			Msg2MSAll(MISSION_ID,"Li�u"..GetName().."T�m S�n t�c l�u la �o�t v� 15 bao l��ng th�o");
		end;
	end;
	SetNpcLifeTime(nNpcIndex,DEAD_BODY_TIME);
end;

function get_npc_camp(sNpcName)
	if sNpcName == "S�n t�c l�u la (T�ng)" then
		return SONG_ID;
	else
		return LIAO_ID;
	end; 
end;