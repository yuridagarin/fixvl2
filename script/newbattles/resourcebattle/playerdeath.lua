Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnDeath(Launcher)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local KillerIndex = NpcIdx2PIdx(Launcher);
	local nOldPlayerIndex = PlayerIndex;
	local nDeathCamp = BT_GetCamp();
	local nCampPlace = nDeathCamp;
	if GetGlbValue(RANDOM_PLACE) == 1 then
		nCampPlace = 3 - nCampPlace;
	end;
	BT_SetTempData(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetTempRevPos(ENTRANCE_POINT[nCampPlace][1],ENTRANCE_POINT[nCampPlace][2]*32,ENTRANCE_POINT[nCampPlace][3]*32);	--����������
	if Launcher == -1 then
		return 0;	--��caststate������
	end;
	if KillerIndex == 0 then

	elseif KillerIndex > 0 then
		--�����ɱ��
		PlayerIndex = KillerIndex;
		local nKillerCamp = BT_GetCamp();
		if nKillerCamp == nDeathCamp then	--���Լ���ɱ����
			return 0;
		end;
		BT_SetData(PT_KILL_SONG_PLAYER+nDeathCamp-1,BT_GetData(PT_KILL_SONG_PLAYER+nDeathCamp-1)+1);
		PlayerIndex = nOldPlayerIndex;
		BT_SetData(PT_KILL_BY_SONG+nKillerCamp-1,BT_GetData(PT_KILL_BY_SONG+nKillerCamp-1)+1);
	end;
	PlayerIndex = nOldPlayerIndex;
end;