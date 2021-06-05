Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");

function OnUse()
	local nMapID,nMapX,nMapY = GetWorldPos();
	if nMapID ~= MAPID then
		Msg2Player("S�n t�c-binh k� ch� d�ng ���c trong Chi�n tr��ng Th�o c�c.");
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT or GetFightState() == 0 then
		Msg2Player("T�m th�i kh�ng d�ng ���c s�n t�c-binh k�.");
		return 0;
	end;
	if check_place() == 1 then
		if DelItem(tBattleItem[7][2],tBattleItem[7][3],tBattleItem[7][4],1) == 1 then
			local nCamp = BT_GetCamp();
			local nEnemyCamp = 3 - nCamp;
			local nNpcIndex = CreateNpc("S�n t�c l�u la","S�n t�c l�u la ("..tCampNameZ[nCamp]..")",GetWorldPos())
			SetNpcDeathScript(nNpcIndex,"\\settings\\static_script\\kf_newbattles\\resourcebattle\\cateran_louluo_death.lua");
			SetNpcLifeTime(nNpcIndex,15);
			Dec_Resource(nEnemyCamp,15);	--�۶Է�������
			Add_Resource(nCamp,15);	--���ӱ�������
			if nCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"Ng��i ch�i phe T�ng: "..GetName().." d�ng s�n t�c binh k� g�i ra m�t s�n t�c l�u la, nh�n c� h�i phe Li�u kh�ng ch� � l�y �i 15 bao l��ng th�o");
			else
				Msg2MSAll(MISSION_ID,"Ng��i ch�i phe Li�u: "..GetName().." d�ng s�n t�c binh k� g�i ra m�t s�n t�c l�u la, nh�n c� h�i phe T�ng kh�ng ch� � l�y �i 15 bao l��ng th�o");
			end;
		end;
	else
		Msg2Player("Khu v�c hi�n t�i kh�ng d�ng ���c s�n t�c-binh k�!");
	end;
end;

function check_place()
	return 1;
end;                      