Include("\\script\\lib\\missionfunctions.lua");
MISSION_ID = 46;									--Mission��ID
TIMER_ID = 75;										--��ʱ����ID
LOG_ID = 3001;										--��½������ID
LOG_CUSTOM_ID = 2501;								--��½�������Զ�����
HUASHAN_MAP_ID = 969								--��ɽ��ͼ��ID
--=========================================================================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��
--��������׶εĳ���ʱ�䣬ֻ�����0������==================================================
READY_TIME = 30;									--׼��ʱ�䣬30����
STARTED_TIME = 60;									--����ʱ��ʱ�䣬60����
ENDING_TIME = 0.5;									--�ȴ�����ʱ�䣬0.5����
--��������׶μ�ʱ���Ĵ������=============================================================
READY_TIMER_INTERVAL = 2;							--��ʱ��������ʱ��������λ����
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 2;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 0.5;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS����=============================================================================

--MissionV����=============================================================================
MV_MISSION_STATE = 1;								--��¼Mission״̬
MV_TIMER_LOOP = 2;									--��¼��ʱ���ļ���
MV_MISSION_UID = 3;									--��¼Mission��ΨһID
MV_TEAM_NUM = 4;									--��¼����Mission�Ķ�������
MV_BOX_NPC_INDEX = 5;								--��¼��ɽ���������
MV_HUASHAN_NPC_INDEX = 6;							--��¼��ɽnpc������
MV_OPENBOX_FLAG = 7;								--��¼��ɽ�����ѱ���ȡ
--Mission״̬��============================================================================
MS_STATE_IDEL = 0;									--���ؿ���
MS_STATE_READY = 1;									--׼���׶�
MS_STATE_STARTED = 2;								--��ս�׶�
MS_STATE_ENDING = 3;								--�ȴ������׶�
--=========================================================================================

--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	mf_ClearMissionData();

	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);	
end;
--Mission��ʼ
function MS_StartMission()
--	SetNpcLifeTime(GetMissionV(MV_HUASHAN_NPC_INDEX),0)--ɾȥ�˳�Npc
	Msg2MSAll(MISSION_ID,"Ho�t ��ng bang h�i tinh anh �� b�t ��u, c�c v� bang ph�i � th� �i �o�t b�o r��ng.");
	mf_Talk2Camp(MISSION_ID,0,"Ho�t ��ng bang h�i tinh anh �� b�t ��u, c�c v� bang ph�i � th� �i �o�t b�o r��ng.");

	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
	SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
	StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
	StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	MS_SetPlayerState(2);
end;
--Mission����
function MS_EndMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	local nMSUID = GetMissionV(MV_MISSION_UID);
--	mf_DelAllMSPlayer(MISSION_ID,0);	--��Mission����ɾ�����е����
	mf_ClearMissionData();
	SetGlbValue(1001,0)
end;
--�뿪Mission
function MS_LeaveMission()
	local i = 0;
	local nOldPlayer = 0;
	local nDeaNum = 0;
	local nCamptainState = 0;
	local TeamMemberTab = {};
	
	if GetMissionV(MV_MISSION_STATE) < 3 and GetMissionV(MV_MISSION_STATE) > 0 then
		nDeaNum = 0;
		nCamptainState = 0;
		if PlayerIndex == GetTeamMember(0) then
			nOldPlayer = PlayerIndex;
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i)
				if PlayerIndex > 0 then
					if IsPlayerDeath() ~= 0 then
						nDeaNum = nDeaNum + 1;
					end
					tinsert(TeamMemberTab,GetTeamMember(i))
				end
			end
			
			if nDeaNum == GetTeamSize() then
				nCamptainState = 1;
			end

			for i=1,getn(TeamMemberTab) do
				PlayerIndex = TeamMemberTab[i];
				if PlayerIndex > 0 then
					if PlayerIndex ~= nOldPlayer then						
						if nCamptainState ~= 1 then
							Msg2Player("Do ��i tr��ng r�i kh�i tr�n ��a, t�t c� ��i vi�n s� b� chuy�n ra kh�i ��u tr��ng!");
						else
							Msg2Player("Do v� t�t c� m�i ng��i trong ��i �� ch�t n�n t� ��i c�a b�n s� chuy�n ra khu v�c.");
						end
						DelMSPlayer(MISSION_ID,0);
					end
				end
			end
			PlayerIndex = nOldPlayer;
			if nCamptainState ~= 1 then
				Msg2Player("Do ��i tr��ng r�i kh�i tr�n ��a, t�t c� ��i vi�n s� b� chuy�n ra kh�i ��u tr��ng!");
			else
				Msg2Player("Do v� t�t c� m�i ng��i trong ��i �� ch�t n�n t� ��i c�a b�n s� chuy�n ra khu v�c.");
			end
		end
	end
	
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0); 
	end

	MS_SetPlayerState(3);
	NewWorld(100,1420,2989);

end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState(1);
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("C�n %d ph�t n�a ch�nh th�c b�t ��u ho�t ��ng bang h�i tinh anh ", (nLoop*READY_TIMER_INTERVAL)));
	end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		
--		SetNpcLifeTime(GetMissionV(MV_BOX_NPC_INDEX),0)--ɾȥ��ɽ����
		Msg2MSAll(MISSION_ID,"Ho�t ��ng bang h�i tinh anh �� k�t th�c ");
		mf_Talk2Camp(MISSION_ID,0,"Ho�t ��ng bang h�i tinh anh �� k�t th�c ");
	else
		if GetMissionV(MV_OPENBOX_FLAG) == 1 then		--��ȡ�������ʱ�˳�
			CloseMission(MISSION_ID);
		end
		
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID, format("C�n %d ph�t n�a k�t th�c ho�t ��ng bang h�i tinh anh ", (nLoop*STARTED_TIMER_INTERVAL)));
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--��½����������
function OnLogin()
	MS_SetPlayerState(3);
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;

--������Ҳ�ͬ�����µ�״̬
function MS_SetPlayerState(nMissionState)
	if nMissionState == 1 then					--׼���׶ν�ɫ״̬����
		CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
		SetLogoutRV(1);							--���õ�½��Ϊ����������
		SetDeathPunish(0);						--�������ͷ�
		SetCreateTeam(1);						--�ر���ӹ���
		ForbitTrade(1);							--��ֹ����
		SetFightState(1);						--ս��״̬
  		InteractiveEnable(0);					--�������أ�0�رգ�1��
  		CleanInteractive();						--��ɢǣ��״̬
  		StallEnable(0); 						--��̯����		  
		UseScrollEnable(0);						--�س̷�����			
		SetPKFlag(2,0);							--��ɱģʽ
		ForbidChangePK(1);						--��ֹת��PK״̬
--		SetTempRevPos(100,1420,2989);			--����������
		SetDeathScript("");

	elseif nMissionState == 2 then				--ս���׶ν�ɫ״̬����
		SetFightState(1);

	elseif nMissionState == 3 then				--���������׶ν�ɫ״̬����
		RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
		SetLogoutRV(0);
		SetFightState(0);
		SetDeathPunish(1);
		ForbidChangePK(0);
		ForbitTrade(0);
		SetCreateTeam(0);
		SetPKFlag(0,0)							--�ر�PK����
  		InteractiveEnable(1);
  		StallEnable(1);
  		UseScrollEnable(1);
  		UseSkillEnable(1);
--		SetTempRevPos(0,0,0);					--ɾ����ʱ������
		RemvoeTempEffect();
  		SetDeathScript("");
	end
end

