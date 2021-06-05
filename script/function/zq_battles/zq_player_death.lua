Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnDeath(Launcher)
	--����������
	local nCamp = ZQ_GetCamp();
	SetTempRevPos(ZQ_MAP_ID, ZQ_OUTER_EXITPOS[nCamp][1]*32, ZQ_OUTER_EXITPOS[nCamp][2]*32);
	SetDeathScript("\\script\\function\\zq_battles\\zq_player_death.lua");
	--����
	ZQ_ReStartSeal_Exit();
	ZQ_ProtectSeal_Clean();
	ZQ_RepairReal_Fail();
	ZQ_EvilBet_Clean();
	ZQ_Trigger_Clean();
	--
	local nOldPlayer = PlayerIndex;
	local nKillerIndex = NpcIdx2PIdx(Launcher);	--�����ߵ�Index
	--������
	if nKillerIndex > 0 and nKillerIndex ~= PlayerIndex then
		PlayerIndex = nKillerIndex;
		local nCamp =ZQ_GetCamp();
		if nCamp == SONG_ID and tGtTask:check_cur_task(112) == 1 then
			local nCount = GetTask(ZQ_KILL_PLAYER_SONG);
			if nCount < ZQ_KILL_PLAYER_SONG_MAX_COUNT then
				SetTask(ZQ_KILL_PLAYER_SONG, nCount + 1);
				AwardGenuineQi(ZQ_TASK_KILLPLAYER_AWARD);
				Msg2Player(format("Ti�u di�t %d/%d ��ch qu�n phe T�ng ho�c qu�n s� binh T�ng", nCount + 1, ZQ_KILL_PLAYER_SONG_MAX_COUNT));
			end
		end
		if nCamp == LIAO_ID and tGtTask:check_cur_task(117) == 1 then
			local nCount = GetTask(ZQ_KILL_PLAYER_LIAO);
			if nCount < ZQ_KILL_PLAYER_LIAO_MAX_COUNT then
				SetTask(ZQ_KILL_PLAYER_LIAO, nCount + 1);
				AwardGenuineQi(ZQ_TASK_KILLPLAYER_AWARD);
				Msg2Player(format("Ti�u di�t %d/%d ��ch qu�n phe Li�u ho�c qu�n s� binh Li�u", nCount + 1, ZQ_KILL_PLAYER_LIAO_MAX_COUNT));
			end
		end
		PlayerIndex = nOldPlayer;
	end
	SetFightState(1);
end