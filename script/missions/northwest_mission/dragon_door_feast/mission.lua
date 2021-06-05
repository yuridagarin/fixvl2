--�ű����ƣ��������ؿ�missionϵͳ�ļ��ļ�
--�ű����ܣ�mission��ص�ϵͳ��
--�߻��ˣ��Ͼ�
--���뿪���ˣ��峤
--���뿪��ʱ�䣺2007-08-08
--�����޸ļ�¼��
--=================��������������
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")

function InitMission()
	SetMissionV(MS_STATE_ID,1)												--����Mission��״̬Ϊ׼��״̬
	SetMissionV(MS_PLAYER_NUM,0)
	SetMissionV(MS_TIMMER_LOOP_ID,feast_time_loop_num)	--���ü�ʱ���ܼ�ʱ����
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)				--����Ϊ-1�򲻼���
	StartMissionTimer(FEAST_MS_ID,Timmer_ID,Timer_interval)	--��ʼһ����ʱ��
end
function EndMission()
	local nMapID = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nMapID)									--�������npc
	ClearMapObj(nMapID)									--�����ͼ������Ʒ
	SetMissionV(MS_STATE_ID,MS_state_unuse)
	mf_ClearMissionData()
	StopMissionTimer(FEAST_MS_ID,Timmer_ID)
	--������
	local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,nMapID)
	local player_num = getn(player)
	if player_num > 0 then
		for i = 1, player_num do
			OnLeave(player[i])
		end
	end
	mf_DelAllMSPlayer(FEAST_MS_ID,CAMP_ALL)			--��Mission����ɾ�����е����
	mf_ClearMissionData()
	StopMissionTimer(FEAST_MS_ID,Timmer_ID)
end

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex
	OnLogin()
	PlayerIndex = RoleIndex
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex		
		AddMSPlayer(FEAST_MS_ID,nCamp)	
		--����ؿ�״̬����		
		InteractiveEnable(0)
		LeaveTeam()
		SetFightState(1)
		SetPKFlag(1,1)		--PK״̬
		ForbidChangePK(1)	--��ֹת��PK״̬
		SetCreateTeam(1)
		UseScrollEnable(0)	--��ֹʹ�ûسǷ�
		ForbitTrade(1)		--��ֹ����
		StallEnable(0)		--��ֹ��̯
		SetDeathPunish(0)	--�������ͷ�
		OpenFriendliness(0)	--�����Ӻøж�
		KillFollower()		
		CreateTrigger(3,Login_trigger_ID,Trigger_save_ID)		
		--����ؿ�ʱ�����������
		local ms_step = GetMissionV(Ms_feast_step)
		local sec_remain = GetMissionV(MS_TIMMER_LOOP_ID)
		--ϵͳ������
		for i = 1,getn(Tb_time_bar_info_main) do
			if sec_remain <=Tb_time_bar_info_main[i][1] and sec_remain > Tb_time_bar_info_main[i][2] then
				StartTimeGuage(Tb_time_bar_info_main[i][3],(sec_remain - Tb_time_bar_info_main[i][2]),0,1)
				break
			end
		end
		--ϵͳ������
		local ms_denputy_step = GetMissionV(Ms_feast_deputy_step)
		if ms_denputy_step ~= 0 then
			StartTimeGuage(Tb_time_bar_info_denputy[i][1],(Tb_time_bar_info_denputy[i][1] + GetMissionV(Ms_feast_forstep_time) - GetTime()),0,2)
		end
	PlayerIndex = RoleIndex
end


