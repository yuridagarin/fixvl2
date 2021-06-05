Include("\\script\\newbattles\\mainbattle\\mainbattle_head.lua");

SZ_BF_CHEAT_OP_SCRIPT = "\\script\\newbattles\\mainbattle\\anti_cheat\\player_cheat_op.lua"

function main()
	if random(1,100) == 1 then
		NpcChat(GetTargetNpc(),"M�i ng��i c�n ra s�c b�o v� t� qu�c!");
	end;
	local selTab = {
				" �� ti�n v�o h�u doanh/enter_back_camp",						
				"R�i kh�i chi�n tr��ng/ask_reason",
				"K�t th�c ��i tho�i/nothing",
				}
	local nCamp = BT_GetCamp()
	if nCamp == SONG_ID and GetMissionV(MV_MID_TRAP_SONG) == 1 then
		tinsert(selTab,2," ti�n v�o b�n trong chi�n tr��ng/enter_mid_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_MID_TRAP_LIAO) == 1 then
		tinsert(selTab,2," ti�n v�o b�n trong chi�n tr��ng/enter_mid_camp");
	end;
	local nCamp = BT_GetCamp()
	local nRandPos = 0;
	if nCamp == SONG_ID and GetMissionV(MV_FRONT_TRAP_SONG) == 1 then
		tinsert(selTab,3," �� ti�n v�o ti�n doanh/enter_front_camp");
	elseif nCamp == LIAO_ID and GetMissionV(MV_FRONT_TRAP_LIAO) == 1 then
		tinsert(selTab,3," �� ti�n v�o ti�n doanh/enter_front_camp");
	end;
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

function enter_back_camp()
	local nCampPlace = BT_GetCamp()
	local nRandPos = 0;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	local tPos = {tBackBornPlaceSong,tBackBornPlaceLiao};
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		nRandPos = random(1,getn(tPos[nCampPlace]));
		
		local szScript = format("pco_on_enter_battle_field(%d,%d)",tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
		SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
		SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
	else
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ��i tin t�c!.");
	end;
end;

function enter_mid_camp()
	local nCamp = BT_GetCamp()
	local nCampPlace = nCamp;
	local nRandPos = 0;
	local tPos = {tMidBornPlaceSong,tMidBornPlaceLiao};
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_MID_TRAP_SONG+nCamp-1) == 1 then
			nRandPos = random(1,getn(tPos[nCampPlace]));
			
			local szScript = format("pco_on_enter_battle_field(%d,%d)",tPos[nCampPlace][nRandPos][1],tPos[nCampPlace][nRandPos][2])
			SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
			SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		else
			Talk(1,"","Ti�n ph��ng �ang giao tranh �c li�t, ch�ng ta kh�ng th� ti�n v�o qu�n doanh");
		end;
	else
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ��i tin t�c!.");
	end;
end;

function enter_front_camp()
	local nCamp = BT_GetCamp()
	local nRandPos = random(1,getn(tFrontBornPlace));
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if GetMissionV(MV_FRONT_TRAP_SONG+nCamp-1) == 1 then
			local szScript = format("pco_on_enter_battle_field(%d,%d)",tFrontBornPlace[nRandPos][1],tFrontBornPlace[nRandPos][2])
			SetPlayerScript(SZ_BF_CHEAT_OP_SCRIPT);
			SendScript2VM(SZ_BF_CHEAT_OP_SCRIPT,szScript);
		else
			Talk(1,"","Ti�n ph��ng �ang giao tranh �c li�t, ch�ng ta kh�ng th� ti�n v�o qu�n doanh");
		end;
	else
		Talk(1,"","Th�m t� �� ���c c� �i, c�c v� xin nh�n n�i ��i tin t�c!.");
	end;
end;

function nothing()

end;
