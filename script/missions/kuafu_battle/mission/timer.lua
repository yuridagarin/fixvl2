Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

function OnTimer()
	SetMissionV(MV_BATTLE_GAME_FRAMETIME,GetGameLoop());
	local nState = GetMissionV(MV_BATTLE_STATE);
	if nState == MS_STATE_FIGHT then
		KF_FloatMsg2PlayerToAll();
	end
	local tFunc = {
		[MS_STATE_PEACE] = "kf_state_peace()",
		[MS_STATE_READY] = "kf_state_ready()",
		[MS_STATE_FIGHT] = "kf_state_fight()",
		[MS_STATE_COMPLETE] = "kf_state_complete()",
	}
	if tFunc[nState] then
		dostring(tFunc[nState]);
	end
end

function kf_state_peace()
	local nLoop = GetMissionV(MV_BATTLE_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,CampTwo_ID);
	if nLoop == 0 then
		if nPlayerOne >= PLAYER_ALLOW_NUM and nPlayerTwo >= PLAYER_ALLOW_NUM then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, READY_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, READY_TIMER_LOOP);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_READY);
			Msg2MSAll(KF_MISSION_ID,format("Chi�n tr��ng li�n ��u s� b�t ��u sau %ds, chi�m l�nh tr�n k� l� �i�m m�u ch�t �� gi�nh chi�n th�ng, c�c v� anh h�ng h�y chu�n b�.", (READY_TIME * (READY_TIMER_LOOP + 1))/FRAME_PER_SECOND));
		else
			--û�п���
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, WAITOUT_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, WAITOUT_TIMER_LOOP);
			SetMissionV(MV_BATTLE_WINNER, ALL_ID);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_COMPLETE);
			SetMissionV(MV_BATTLE_IS_OPEN_SUCC, MISSION_OPEN_FAIL_FLAG);
			Msg2MSAll(KF_MISSION_ID,"Do s� ng��i 2 b�n tham gia kh�ng ��, chi�n tr��ng li�n ��u ch�a th� kh�i ��ng.");
			WriteLog("[Chi�n tr��ng li�n ��u b�t ��u]: "..tostring(date()).."Ch�a th� kh�i ��ng th�nh c�ng");
			
			_stat_on_misson_none_start()
		end 
	else
		SetMissionV(MV_BATTLE_TIMER_LOOP, nLoop-1);
		if mod(nLoop, 6) == 0 then --30�벥��һ��
			Msg2MSAll(KF_MISSION_ID, "Ti�n �� th�i gian: ["..(PEACE_TIMER_LOOP-nLoop+1)..":"..(PEACE_TIMER_LOOP+1).."]");
			local nTime = (nLoop - 1) * PEACE_TIME / FRAME_PER_SECOND
			local szMsg = format("S� ng��i hai b�n hi�n t�i: %s[%d]:%s[%d], %ds, chi�n ��u b�t ��u.", CampOne_Name, nPlayerOne, CampTwo_Name, nPlayerTwo, nTime)
			Msg2MSAll(KF_MISSION_ID, szMsg);
		end
		if nPlayerOne >= PLAYER_MAX_NUM and nPlayerTwo >= PLAYER_MAX_NUM then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, READY_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, READY_TIMER_LOOP);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_READY);
			Msg2MSAll(KF_MISSION_ID,format("Chi�n tr��ng li�n ��u s� b�t ��u sau %d ph�t, chi�m l�nh tr�n k� l� �i�m m�u ch�t �� gi�nh chi�n th�ng, c�c v� anh h�ng h�y chu�n b�.", 1));
		end
	end
end

t_player_num_to_score ={
	--min,max,score
	{-2100000000,19,0},
	{20,39,2000},
	{40,79,4000},
	{80,159,6000},
	{160,240,8000},
	{241,2100000000,8000},
}
--ʤ������
function kf_initial_top_socre(nTotalPlayerCount)
	if nTotalPlayerCount >=0 and nTotalPlayerCount < 2100000000 then
		for i=1,getn(t_player_num_to_score) do
			local t = t_player_num_to_score[i]
			if nTotalPlayerCount >= t[1] and nTotalPlayerCount <= t[2] then
				SetMissionV(KF_SCORE_MAX, t[3])
				SetMissionV(KF_JIANGJUN_SCORE, floor(t[3] / 2))
				SetMissionV(KF_SCORE_JIANGJUN, floor(t[3] * 20 / 100))
			end
		end
	end
end

function kf_state_ready()
	local nLoop = GetMissionV(MV_BATTLE_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID,CampTwo_ID);	
	if nLoop == 0 then
		--�ж�������
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		RunMission(KF_MISSION_ID);
		kf_initial_top_socre(nPlayerOne+nPlayerTwo)
		WriteLog("[Chi�n tr��ng li�n ��u b�t ��u]: Th�i gian l�"..tostring(date()).."Chi�n tr��ng li�n ��u �� b�t ��u, s� ng��i hi�n t�i: ["..nPlayerOne.."]:["..nPlayerTwo.."], t�ng s� ng��i l�: "..(nPlayerOne+nPlayerTwo));
		
		_stat_on_misson_start(KF_MISSION_ID)
	else
		SetMissionV(MV_BATTLE_TIMER_LOOP, nLoop-1);
		Msg2MSAll(KF_MISSION_ID," c�n "..tostring(READY_TIME/18*nLoop).."s, chi�n tr��ng li�n ��u ch�nh th�c b�t ��u. S� ng��i hi�n t�i l�: "..CampOne_Name.."["..nPlayerOne.."]:"..CampTwo_Name.."["..nPlayerTwo.."]");
	end;
end

function kf_state_fight()
	local nLoop = GetMissionV(MV_BATTLE_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(KF_MISSION_ID, ALL_ID);
	local nPlayerOne = GetMSPlayerCount(KF_MISSION_ID, CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(KF_MISSION_ID, CampTwo_ID);	
	if nLoop == 0 then
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, WAITOUT_TIME);
		SetMissionV(MV_BATTLE_TIMER_LOOP, WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE, MS_STATE_COMPLETE);
		--�жϷ���
		local nSongScore = GetMissionV(MV_BATTLE_SONG_SCORE);
		local nLiaoScore = GetMissionV(MV_BATTLE_LIAO_SCORE);
		if nSongScore > nLiaoScore then
			SetMissionV(MV_BATTLE_WINNER, CampOne_ID);
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampOne_ID}, ALL_ID);
			if nSongScore >= GetMissionV(KF_SCORE_MAX) then
				Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", CampOne_Name, GetMissionV(KF_SCORE_MAX)));	
			else
				Msg2MSAll(KF_MISSION_ID, format("�i�m t�ch l�y phe %s cao h�n phe %s, %s gi�nh chi�n th�ng!", CampOne_Name, CampTwo_Name, CampOne_Name));	
			end
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;		
		elseif nSongScore < nLiaoScore then
			SetMissionV(MV_BATTLE_WINNER, CampTwo_ID);
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampTwo_ID}, ALL_ID);
			if nSongScore >= GetMissionV(KF_SCORE_MAX) then
				Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", CampTwo_Name, GetMissionV(KF_SCORE_MAX)));
			else
				Msg2MSAll(KF_MISSION_ID, format("�i�m t�ch l�y phe %s cao h�n phe %s, %s gi�nh chi�n th�ng!", CampTwo_Name, CampOne_Name, CampTwo_Name));	
			end
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		else
			local nSongActivity = GetMissionV(MV_BATTLE_SONG_ACTIVITY);
			local nLiaoActivity = GetMissionV(MV_BATTLE_LIAO_ACTIVITY);
			if nSongActivity > nLiaoActivity then
				SetMissionV(MV_BATTLE_WINNER, CampOne_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampOne_ID}, ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",CampOne_Name, nSongActivity, CampTwo_Name, nLiaoActivity, CampOne_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 1)
				return 0;
			elseif nSongActivity < nLiaoActivity then
				SetMissionV(MV_BATTLE_WINNER, CampTwo_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampTwo_ID}, ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",CampOne_Name, nSongActivity, CampTwo_Name, nLiaoActivity, CampTwo_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 2)
				return 0;
			else
				SetMissionV(MV_BATTLE_WINNER, ALL_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {ALL_ID}, ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], tr�n chi�n tr��ng li�n ��u l�n n�y b�t ph�n th�ng b�i.",CampOne_Name, nSongActivity, CampTwo_Name, nLiaoActivity));
				
				_stat_on_misson_end(KF_MISSION_ID, 0)
				return 0;
			end
		end
	else
		SetMissionV(MV_BATTLE_TIMER_LOOP, nLoop-1)
		--ÿ��15��ͼ��˫��������
		if mod(nLoop, 5) == 0 then
			local tMissionV = {
				MV_BATTLE_FLAG_JM,
				MV_BATTLE_FLAG_MM,
				MV_BATTLE_FLAG_SM,
				MV_BATTLE_FLAG_SI,
				MV_BATTLE_FLAG_DA,
			}
			for i = 1, getn(tMissionV) do
				local nTag = GetMissionV(tMissionV[i]);
				KF_AddScore(KF_ZHENQI_INC, nTag);
			end
		end
		--�жϷ���
		local nSongScore = GetMissionV(MV_BATTLE_SONG_SCORE);
		local nLiaoScore = GetMissionV(MV_BATTLE_LIAO_SCORE);
		--���ȷ�
		if nSongScore >= GetMissionV(KF_SCORE_MAX) and nLiaoScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, WAITOUT_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, WAITOUT_TIMER_LOOP);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_COMPLETE);
			--�жϷ���			
			local nSongActivity = GetMissionV(MV_BATTLE_SONG_ACTIVITY);
			local nLiaoActivity = GetMissionV(MV_BATTLE_LIAO_ACTIVITY);
			if nSongActivity > nLiaoActivity then
				SetMissionV(MV_BATTLE_WINNER, CampOne_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampOne_ID}, ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",CampOne_Name, nSongActivity, CampTwo_Name, nLiaoActivity, CampOne_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 1)
				return 0;
			elseif nSongActivity < nLiaoActivity then
				SetMissionV(MV_BATTLE_WINNER, CampTwo_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampTwo_ID}, ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], %s gi�nh ���c chi�n th�ng chi�n tr��ng li�n ��u l�n n�y.",CampOne_Name, nSongActivity, CampTwo_Name, nLiaoActivity, CampTwo_Name));
				
				_stat_on_misson_end(KF_MISSION_ID, 2)
				return 0;
			else
				SetMissionV(MV_BATTLE_WINNER, ALL_ID);
				KF_OperateAllPlayer(KF_SetRezultToPlayer, {ALL_ID}, ALL_ID);
				Msg2MSAll(KF_MISSION_ID, format("�� t�ch c�c [%s:%d]:[%s:%d], tr�n chi�n tr��ng li�n ��u l�n n�y b�t ph�n th�ng b�i.",CampOne_Name, nSongActivity, CampTwo_Name, nLiaoActivity));
				
				_stat_on_misson_end(KF_MISSION_ID, 0)
				return 0;
			end
			return 0;								
		end		
		if nSongScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, WAITOUT_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, WAITOUT_TIMER_LOOP);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_COMPLETE);
			SetMissionV(MV_BATTLE_WINNER, CampOne_ID);
			Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", CampOne_Name, GetMissionV(KF_SCORE_MAX)));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampOne_ID}, ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;			
		end
		if nLiaoScore >= GetMissionV(KF_SCORE_MAX) then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, WAITOUT_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, WAITOUT_TIMER_LOOP);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_COMPLETE);
			SetMissionV(MV_BATTLE_WINNER, CampTwo_ID);
			Msg2MSAll(KF_MISSION_ID, format("Phe %s �i�m t�ch l�y ��t tr��c %d,�� gi�nh chi�n th�ng tr�n li�n ��u chi�n tr��ng n�y.", CampTwo_Name, GetMissionV(KF_SCORE_MAX)));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampTwo_ID}, ALL_ID);		
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		end
		if nPlayerOne == 0 and nPlayerTwo ~= 0 then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, WAITOUT_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, WAITOUT_TIMER_LOOP);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_COMPLETE);
			SetMissionV(MV_BATTLE_WINNER, CampTwo_ID);
			Msg2MSAll(KF_MISSION_ID, format("S� ng��i phe %s kh�ng ��, %s �� gi�nh chi�n th�ng tr�n li�n ��u l�n n�y.", CampOne_Name, CampTwo_Name));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampTwo_ID}, ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 2)
			return 0;
		end
		if nPlayerTwo == 0 and nPlayerOne ~= 0 then
			StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
			StartMissionTimer(KF_MISSION_ID, KF_TIMER_ID, WAITOUT_TIME);
			SetMissionV(MV_BATTLE_TIMER_LOOP, WAITOUT_TIMER_LOOP);
			SetMissionV(MV_BATTLE_STATE, MS_STATE_COMPLETE);
			SetMissionV(MV_BATTLE_WINNER, CampOne_ID);
			Msg2MSAll(KF_MISSION_ID, format("S� ng��i phe %s kh�ng ��, %s �� gi�nh chi�n th�ng tr�n li�n ��u l�n n�y.", CampTwo_Name, CampOne_Name));
			KF_OperateAllPlayer(KF_SetRezultToPlayer, {CampOne_ID}, ALL_ID);	
			
			_stat_on_misson_end(KF_MISSION_ID, 1)
			return 0;
		end
		if mod(nLoop, 10) == 0 then
			Msg2MSAll(KF_MISSION_ID,"Ti�n �� th�i gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
			Msg2MSAll(KF_MISSION_ID,"�i�m t�ch l�y 2 phe hi�n t�i l�: "..CampOne_Name.."["..nSongScore.."]:"..CampTwo_Name.."["..nLiaoScore.."]")
			KF_OperateAllPlayer(KF_KickSleep, {}, ALL_ID); --˯�ߵ�ǿ���߳�ս��
		end		
		if mod(nLoop, 20) == 0 then
			Msg2MSAll(KF_MISSION_ID,format("S� ng��i 2 phe hi�n t�i l�: %s[%d]:%s[%d]", CampOne_Name, nPlayerOne, CampTwo_Name, nPlayerTwo));
		end;
		KF_OperateAllPlayer(KF_KickDeather, {}, ALL_ID); --������ǿ���߳�ս��
		if GetMissionV(MV_BATTLE_JIANGJUN_TAG) == 0 and (nSongScore >= GetMissionV(KF_JIANGJUN_SCORE) or nLiaoScore >= GetMissionV(KF_JIANGJUN_SCORE)) then
			KF_CreateJiangJun(); --��������
		end
		if mod(nLoop, 15) == 0 then
			SetMissionV(MV_BATTLE_TEMP_SAFE_POS_INDEX_SONG, random(3));
			SetMissionV(MV_BATTLE_TEMP_SAFE_POS_INDEX_LIAO, random(3));
		end
	end
	--�㲥�������
	if mod(nLoop, 10) == 0 then
		KF_MsgZhenQiState();
	end
end

function kf_state_complete()
	local nLoop = GetMissionV(MV_BATTLE_TIMER_LOOP);
	if nLoop == 0 then
		if GetMissionV(MV_BATTLE_IS_OPEN_SUCC) ~= MISSION_OPEN_FAIL_FLAG then
			KF_KillPaiMing();
		end
		StopMissionTimer(KF_MISSION_ID, KF_TIMER_ID);
		CloseMission(KF_MISSION_ID);
	else
		SetMissionV(MV_BATTLE_TIMER_LOOP, nLoop-1);
	end;
end