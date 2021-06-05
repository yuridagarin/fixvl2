Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");
function main()
	local nCamp = BT_GetCamp()
	local nCampPlace = nCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local nRandPos = random(1,getn(tFrontBornPlace));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_FRONT_TRAP_SONG+nCamp-1) == 1 then
			SetPos(tFrontBornPlace[nRandPos][1],tFrontBornPlace[nRandPos][2]);
			BT_RestoreAll();
			SetFightState(1);
			BT_SetTempData(PTT_DIE_LOOP,0);
		else
			SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);
			Talk(1,"","Ti�n ph��ng �ang giao tranh �c li�t, ch�ng ta kh�ng th� ti�n v�o qu�n doanh");
		end;
	else
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3])
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ��i tin t�c!!");
	end;
end;