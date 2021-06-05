Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function main()
	local nNpcIndex = GetTargetNpc();
	local _,nMapX,nMapY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nMapX,nMapY) >= 14 then
		return 0;
	end;
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Nghe n�i ph�o ��i nhi�u n�m kh�ng tu s�a n�n b� m�c n�t, ��ng g�n s� ch�u t�n th��ng nh�t ��nh, t��ng s� h�y c�n th�n!");
	end;
	local selTab = {
				" �� ti�n v�o ti�n doanh/enter_front_camp",
				" �� ti�n v�o h�u doanh/enter_back_camp",
				"R�i kh�i chi�n tr��ng/ask_reason",
				"K�t th�c ��i tho�i/nothing",
				}
	Say("T��ng s� phe ta kh�ng ph�n bi�t tu�i t�c, ch� c�n �o�n k�t ��nh �u�i ngo�i x�m l� ���c!",getn(selTab),selTab);
end;

function ask_reason()
	AskClientForString("leave","Nh� nh�ng r�i kh�i...",1,32,"Sao ph�i r�i kh�i?");
end;	

function leave(sLeaveMsg)
	local nBattleType = BT_GetData(PT_BATTLE_TYPE);
	local nMissionID = 0;
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(tBTMSInfo[nBattleType][2]);
	nMissionID = tBTMSInfo[nBattleType][1];
	DelMSPlayer(nMissionID,0);
	Msg2MSAll(nMissionID,"R�i kh�i �� l�i tin nh�n:"..sLeaveMsg);
	SubWorld = OldSubWorld;
end;

function enter_front_camp()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {tFrontPointSong,tBackPointSong},
			[LIAO_ID] = {tFrontPointLiao,tBackPointLiao},
			}
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRandPos = tPos[nCampPlace][1];
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ch� tin t�c!");
	else
		local nPosIndex = random(1,getn(tRandPos)); 
		SetPos(tRandPos[nPosIndex][1],tRandPos[nPosIndex][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function enter_back_camp()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = {tFrontPointSong,tBackPointSong},
			[LIAO_ID] = {tFrontPointLiao,tBackPointLiao},
			}
	SubWorld = SubWorldID2Idx(MAPID);
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tRandPos = tPos[nCampPlace][2];
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ch� tin t�c!");
	else
		local nPosIndex = random(1,getn(tRandPos)); 
		SetPos(tRandPos[nPosIndex][1],tRandPos[nPosIndex][2]);
		BT_RestoreAll();
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function nothing()

end;
