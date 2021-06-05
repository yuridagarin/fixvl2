Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");

function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local nOldPlayerIndex = PlayerIndex;
	local nDeathCamp = BT_GetCamp();
	SetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1,GetMissionV(MV_DEATH_COUNT_SONG+nDeathCamp-1)+1);
	local nCampPlace = nDeathCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	BT_AddBattleActivity(BA_EMPL_DEATH);
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--����������
	BT_SetData(PTNC_DEATH,BT_GetData(PTNC_DEATH)+1);	--����������1,�����Ǳ�ʲô������
	if Launcher == -1 then
		return 0;	--��caststate������
	end;
	if KillerIndex == 0 then
		--��NPCɱ��
	elseif KillerIndex > 0 then
		--�����ɱ��
		local sPlayerName = GetName();
		local nJunXian = abs(BT_GetData(PT_CURRANK));
		if nJunXian == 0 then
			nJunXian = 1;
		end;
		PlayerIndex = KillerIndex;
		local nKillerCamp = BT_GetCamp();
		if nKillerCamp == nDeathCamp then	--���Լ���ɱ��
			return 0;
		end;
		BT_SetData(PTNC_KILL,BT_GetData(PTNC_KILL)+1);
		BT_AddBattleActivity(BA_EMPL_KILL_PLAYER);
		local sKillerName = GetName();
		BT_EmperorAward(0.1);
		Msg2Player("Hi�n b�n ti�u di�t ���c:"..BT_GetData(PTNC_KILL));
		local nEvenID = tKillPlayerBonus[nJunXian];
		local nPoint = BT_GetBattleEvenPoint(nEvenID);
		BT_AddBattleEvenPoint(nEvenID);
		BT_AddMissionPoint(nKillerCamp,nPoint);
		BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
		PlayerIndex = nOldPlayerIndex;
		BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
		BT_DecPersonalPoint(ceil(nPoint/3));
		if nKillerCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"T�ng"..sKillerName.." �� h� g�c phe Li�u_"..sPlayerName);
		else
			Msg2MSAll(MISSION_ID,"Li�u"..sKillerName.." �� h� g�c phe T�ng_"..sPlayerName);
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
end;