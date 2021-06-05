--=============================================
--create by baiyun 2009.11.25
--describe:Խ�ϰ�12�·�ʥ���ڻ������ʦmission����
--=============================================
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission �� b�t ��u, MSUID:"..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
end;
--Mission����
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--��Mission����ɾ�����е����
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission �� k�t th�c, MSUID:"..nMSUID);
end;
--�뿪Mission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nShengDanShuIndex = GetGlbValue(1026);
                local nMapId, nMapX, nMapY = GetNpcWorldPos(nShengDanShuIndex);
		for i = 1, 50 do
                    local nNewNpcIndex = CreateNpc("Event gi�ng sinh VN", "H�p qu� gi�ng sinh", nMapId, nMapX + random(-30, 30), nMapY + random(-30, 30));
                    SetNpcLifeTime(nNewNpcIndex, 150);
                    SetNpcScript(nNewNpcIndex, "\\script\\online\\viet_event\\200912\\3\\npc_shengdanlihe.lua");
		end
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

end;
--=====================================================================================
--ת��Mission��ǰ״̬
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
		SetMissionV(MV_TIMER_LOOP,floor(GetGlbValue(1018)/STARTED_TIMER_INTERVAL)-1);	--���ÿ�ʼ״̬�ĳ���ʱ��
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()

end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()

end;
