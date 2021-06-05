Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"Th�n trang qu� l�n �� t�m th� l�nh tr� gi�p ch�ng ta l� �i�u kh�ng d�, m�i ng��i c�n ��ng t�m hi�p l�c!");
	end;
	local selTab = {
				"V�o chi�n tr��ng/enter_battle",
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

function enter_battle()
	local nCampPlace = BT_GetCamp()
	local tPos = {
			[SONG_ID] = tSongBornPos,
			[LIAO_ID] = tLiaoBornPos,
			}
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ��i tin t�c!.");
	else
		local nRandPos = random(1,getn(tPos[nCampPlace]));
		SetPos(tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
		BT_SetTempData(PTT_DIE_LOOP,0);
		SetFightState(1);
		BT_RestoreAll();
		CastState("state_dispear",0,INVINCIBILITY_TIME*18);
	end;
end;

function nothing()

end;
