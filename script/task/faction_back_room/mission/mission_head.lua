Include("\\script\\task\\faction_back_room\\back_room_function.lua");

--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	SetMissionS(MS_MISSION_NAME,MISSION_NAME..nMSUID);	--��¼Mission������
	SetMissionS(MS_MISSION_STRING,"�i s� m�n");
	WriteLog(LOG_HEADER.."Mission �� b�t ��u, MSUID:"..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	BR_ChangeMSState(MS_STATE_STARTED);
end;
--Mission����
function MS_EndMission()
	BR_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--��Mission����ɾ�����е����
	local nMapID = SubWorldIdx2ID(SubWorld);
	BR_ClearMapNpcSafe(nMapID);
	WriteLog(LOG_HEADER.."Mission �� k�t th�c, MSUID:"..nMSUID);
	mf_ClearMissionData();
end;
--�뿪Mission
function MS_LeaveMission()
	local nFaction = GetMissionV(MV_FACTION);
	local nDesMapID = GetMissionV(MV_ENTRY_MAPID);
	if DEBUG_VERSION == 1  then
		NewWorld(100,1456,2789);
	else
		if BR_CheckEntryMapID(nDesMapID) == 1 then
			NewWorld(nDesMapID,TB_EXIT_POS[nDesMapID][1],TB_EXIT_POS[nDesMapID][2]);
		else
			BR_SafeTransmission();	--��ȫ�Ĵ���
		end;
	end;
	MS_RestorePlayerState();
end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	local nFaction = GetPlayerFaction();
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nMapX = TB_ENTRY_POS[nFaction][1];
	local nMapY = TB_ENTRY_POS[nFaction][2];
	NewWorld(nMapID,nMapX,nMapY);
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		BR_ChangeMSState(MS_STATE_STARTED);	--�����Ͳ���ҪRunMission
		Msg2MSAll(MISSION_ID,"Th�i gian chu�n b� k�t th�c, b�t ��u v��t �i...");
		BR_NextStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Giai �o�n chu�n b�, th�i gian c�n "..tf_GetTimeString((nLoop*READY_TIMER_INTERVAL)*60));
	end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nCurDiff = BR_GetCurDiff();
	local nCurStage= BR_GetCurStage();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"V��t �i th�t b�i ......");
		BR_UnInitStageEven(nCurDiff,nCurStage);
		BR_ChangeMSState(MS_STATE_END_WAITING);
		BR_CreateDisciple();
		WriteLog(LOG_HEADER.."V��t �i th�t b�i. �� kh�: "..nCurDiff..", �i  "..nCurStage..". T�n: "..GetName(nPIdx)..", c�p:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", nguy�n nh�n: v��t qu� th�i gian cho ph�p");
	else
		BR_ProcStageEven(nCurDiff,nCurStage);
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,6) == 0 then
			Msg2MSAll(MISSION_ID,"�ang v��t �i, th�i gian c�n "..tf_GetTimeString(60*nLoop*STARTED_TIMER_INTERVAL));
		end;
	end;
end;
--������ض��ݵȴ��ļ�ʱ������
function MS_ProcessShortPauseTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"Th�i gian chu�n b� k�t th�c, v�o �i k� ti�p ...");
		BR_NextStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nSec = 60*nLoop*SHORT_PAUSE_TIMER_INTERVAL;
		Msg2MSAll(MISSION_ID,"Giai �o�n chu�n b�, th�i gian c�n "..tf_GetTimeString(nSec));
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,", b�y gi� xin m�i r�i �i...");
		BR_CloseStage();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Giai �o�n k�t th�c, th�i gian c�n "..tf_GetTimeString(60*nLoop*ENDING_TIMER_INTERVAL));
	end;
end;
--��½����������
function OnLogin()
	MS_RestorePlayerState();
	WriteLog(LOG_HEADER.."Ng��i ch�i "..GetName().." R�i Mission kh�ng b�nh th��ng, �ang trong qu� tr�nh x� l� ��ng nh�p.");
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = BR_GetCurMapID();	--�õ�ͼID����ʶ����Ȼ������Ψһ��ʶ������Ҳ������
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()
	local nWeek = tonumber(date("%y%W"));
	local nFaction = GetPlayerFaction();
	local nRoute = GetPlayerRoute();
	local nMapID = SubWorldIdx2ID(SubWorld);
	BR_ClearTempTask();	--��ʱ������0
	BR_ClearNCTask();	--NC������0
	BR_ClearMapTask(nMapID);	--��ͼ������0
	SetTask(TSK_ATTEND_WEEK,nWeek);
	SetTask(TSK_WC_ATTEND_TIMES,GetTask(TSK_WC_ATTEND_TIMES)+1);
	SetMissionV(MV_FACTION,nFaction);
	SetMissionV(MV_ROUTE,nRoute);
	SetMissionV(MV_PLAYERINDEX,PlayerIndex);
	--===================================================================
	SetPKFlag(1,1);
	ForbidChangePK(1);
	SetFightState(1);
	SetDeathScript("\\script\\task\\faction_back_room\\death_player.lua");
	SetLogoutRV(1);
	UseScrollEnable(0);
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	LeaveTeam();	--�뿪����
	SetDeathPunish(0);	--�������ͷ�
	SetCreateTeam(1);	--�ر��齨����(���ߺ�ᱻ���)
	ForbitTrade(1);	--��ֹ����
	InteractiveEnable(0);	--�رս���	������NewWorld֮��ִ�в���Ч
	SetPlayerScript("");
	SetMomentumBoundSwitch(1);	--��������ɱ��ֵ
	CreateTrigger(3,LOGIN_ID,LOGIN_TRIGGER_ID);
	Msg2Player("Xin h�y b�t ��u v��t �i trong th�i gian quy ��nh.");	
	SetCampToPlayer(TB_CAMP_NAME[CAMP_PLAYER]);
	UseDummy(0,1);	--��������Ч��
	RemoveState(9900);	--������н��»���״̬
	MonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_EVIL]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_ENEMY]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_EVIL]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_PLAYER]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_PLAYER]);
	MonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_ENEMY]);
	gf_ForbidFactionSkill(1);	--��������
	RemvoeTempEffect();
	BR_RestorePlayer();
	BR_PauseStage();
end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()
	ForbidChangePK(0);
	SetPKFlag(0,0);
	SetFightState(0);
	SetDeathScript("");
	SetLogoutRV(0);
	UseScrollEnable(1);
	StallEnable(1);	
	LeaveTeam();
	SetDeathPunish(1);
	SetCreateTeam(0);
	ForbitTrade(0);
	SetMomentumBoundSwitch(0);
	InteractiveEnable(1);
	SetPlayerScript("");
	RemoveTrigger(GetTrigger(LOGIN_TRIGGER_ID));
	SetCampToPlayer("");
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_EVIL]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_ENEMY]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_EVIL]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_EVIL],TB_CAMP_NAME[CAMP_PLAYER]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_ENEMY],TB_CAMP_NAME[CAMP_PLAYER]);
	UnMonitorCampRelation(TB_CAMP_NAME[CAMP_PLAYER],TB_CAMP_NAME[CAMP_ENEMY]);
	gf_ForbidFactionSkill(0);
	BR_ClearTempTask();
	BR_ClearNCTask();
	BR_StopTimeGuage(-2);
	BR_LockEquipment(0);
end;