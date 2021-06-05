--�ű����ƣ��������ؿ�missionϵͳ�ļ��ļ�
--�ű����ܣ�mission��ص�ϵͳ��
--�߻��ˣ��Ͼ�
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-08
--�����޸ļ�¼��
--=================��������������
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")												--�峤�Ĺ�������

--mission��ʼ
function InitMission()
	SetMissionV(MS_STATE_ID,MS_state_wait_start)	--����Mission��״̬Ϊ׼��״̬
	SetMissionV(MS_TIMMER_LOOP_ID,Timmer_loop_num)	--���ü�ʱ���ܼ�ʱ����
	StartMissionTimer(MS_ID,Timmer_ID,Timer_interval)	--��ʼһ����ʱ��
end
--mission����
function EndMission()
	local nMapID = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nMapID)								--�������npc
	ClearMapObj(nMapID)								--�����ͼ������Ʒ
	mf_ClearMissionData()
	StopMissionTimer(MS_ID,Timmer_ID)
	mf_DelAllMSPlayer(MS_ID,0)			--��Mission����ɾ�����е����
end
--�뿪mission
function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex
	player_log_out_pub_deal()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local tb_player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	if getn(tb_player) == 0 then
		CloseMission(MS_ID)
	end
	PlayerIndex = RoleIndex
end
--����mission
function JoinMission(RoleIndex,nCamp)
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = RoleIndex
		local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
		local mission_diff = GetTask(Task_ID_stage_diff)
		CleanInteractive()
		StartTimeGuage(Stage_info[stage_seq].stage_start_time_bar,60,0,1)
		Msg2Player(Stage_info[stage_seq].stage_start_msg)
		Talk(1,"",Stage_info[stage_seq].stage_start_talk)
		--���ӹؿ���Ҫ�����⴦��
		if mission_diff == 2 then
			SetPKFlag(1,1)			--PK״̬
			ForbidChangePK(1)		--��ֹת��PK״̬
			SetCreateTeam(1)		--��ֹ�������
			--���Ĺص�������:����β�����
			if stage_seq == 4 then
				SetTask(1856,0)
			end
			--�ؿ�������¼
			local week_seq_save = GetTask(Mission_week_seq_TaskID)
			local times_save = GetTask(Mission_login_times_TaskID)
			local week_seq_now = Zgc_pub_week_seq()
			if week_seq_save == nil or week_seq_save < Zgc_pub_week_seq() then
				SetTask(Mission_week_seq_TaskID,week_seq_now)
				SetTask(Mission_login_times_TaskID,1)
			else
				SetTask(Mission_login_times_TaskID,(times_save + 1))
			end
			if week_seq_save ~= Zgc_pub_week_seq() then
				SetTask(Mission_week_seq_TaskID,Zgc_pub_week_seq())
				SetTask(Mission_login_times_TaskID,1)
			end
		end
		SetFightState(1)			--����ս��ģʽ
		UseScrollEnable(0)		--��ֹʹ�ûسǷ�
		ForbitTrade(1)			--��ֹ����
		StallEnable(0)				--��ֹ��̯
		SetDeathPunish(0)		--�������ͷ�
		OpenFriendliness(0)	--�����Ӻøж�
		gf_ForbidFactionSkill(1)	--��������
		KillFollower()
		CreateTrigger(3,Trigger_ID,Trigger_save_ID)
		SetDeathScript("\\script\\missions\\northwest_mission\\mission\\mission_player_death.lua")
		AddMSPlayer(MS_ID,nCamp)
	PlayerIndex = RoleIndex
end


