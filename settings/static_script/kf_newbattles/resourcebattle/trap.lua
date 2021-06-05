Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	local nCampPlace = BT_GetCamp()
	SubWorld = SubWorldID2Idx(MAPID);
	local tPos = {
			[SONG_ID] = {1606,3505},
			[LIAO_ID] = {1724,3264},
			}
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3])
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ��i tin t�c!!");
	else
		SetPos(tPos[nCampPlace][1],tPos[nCampPlace][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
	end;
end;