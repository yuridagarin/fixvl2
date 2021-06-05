Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

function OnDeath(Launcher)
	--���ҩCD
	ClearColdDown();
	--����ѩ��״̬�ټ�
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	--npc buff Remove
	for i = 20101, 20106 do
		RemoveState(i);
	end
	--�ǿ�ս״̬��������
	local nBattleState = GetMissionV(MV_BATTLE_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	
		return 0;
	end;
	--����
	KF_RevivePlayer();
	--������ʱ���¼����ʱ��
	SetTaskTemp(TMP_TASK_KF_TIME, GetTime());
	--��ɱ����Ծ��+1
	KF_AddActivity(KF_ACTIVITY_PLAYERDEATH);
	--������ɱ����
	gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2) + 1);
	--���������
	gf_SetTaskBit(KF_BATTLE_TASK, 27, 1, TASK_ACCESS_CODE_KF_BATTLE);
	--ɾ��NB����
	DelNBWeapon();
	
	--ɱ�˵���һ�Ծ�ͻ��ִ���
	local DeathPlayerIndex = PlayerIndex;
	local KillerPlayerIndex = NpcIdx2PIdx(Launcher);	
	if KillerPlayerIndex > 0 and KillerPlayerIndex ~= DeathPlayerIndex then
		local nOldPlayerIndex = PlayerIndex
		PlayerIndex = KillerPlayerIndex;
		KF_AddActivity(KF_ACTIVITY_PLAYER);
		KF_AddScore(KF_SCORE_PLAYER);
		--��¼ɱ�˴���
		gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4) + 1);
		
		_stat_when_kill_player()
		
		PlayerIndex = DeathPlayerIndex;
		_stat_when_death()
		
		PlayerIndex = nOldPlayerIndex
	end
end