--create date:2007-07-04
--author:yanjun
--describe:���ؿ�Missionͷ�ļ�
Include("\\script\\missions\\tong_mission\\main_function.lua");

--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_SECOND);	--��ʼһ����ʱ��
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	local nMapID = SubWorldIdx2ID(SubWorld);
	SetMissionV(MV_STAGE_OVER,1);	--�Ǵ���ʱ���
	TM_CreateFieldNpc(nMapID);
	local nYearWeek = tonumber(date("%y%W"));
	SetMissionV(MV_WEEK,nYearWeek);
	local szTongName = GetMissionS(MS_TONG_NAME);
	TM_SetRelayTongData(szTongName,KEY_ATTEND,"d",nYearWeek);
	DelRelayShareDataCopy(szTongName,0,0);
	WriteLog("[Bang h�i v��t �i]:"..szTongName.."Bang h�i b�t ��u v��t �i, nMSUID: "..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,ALL_CAMP);
	if nPlayerCount < MIN_PLAYER_COUNT then
		Msg2MSAll(MISSION_ID,"T�ng ng��i trong �i �t h�n "..MIN_PLAYER_COUNT.." ng��i, c�a �i �� b� ��ng.");
		CloseMission(MISSION_ID);
		return 0;
	end;
	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
	StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
	Msg2MSAll(MISSION_ID,"Th�i gian chu�n b� �� k�t th�c");
end;
--Mission����
function MS_EndMission()
	local nMapID = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nMapID);
	ClearMapObj(nMapID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	local szTongName = GetMissionS(MS_TONG_NAME);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--��Mission����ɾ�����е����
	mf_ClearMissionData();
	TM_SetTongFieldState(nMapID,0);
	WriteLog("[Bang h�i v��t �i]:"..szTongName.."�i bang h�i �� k�t th�c, nMSUID?"..nMSUID);
end;
--�뿪Mission
function MS_LeaveMission()
	local nMapID = GetTaskTemp(TSK_TEMP_MAP_ID);
	MS_RestorePlayerState();
	NewWorld(nMapID,tPos_Entrance[nMapID][1],tPos_Entrance[nMapID][2]-10);
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,ALL_CAMP);
	gf_ShowDebugInfor("player count:"..GetMSPlayerCount(MISSION_ID,0));
	if nPlayerCount < MIN_PLAYER_COUNT then
		if GetMissionV(MV_MISSION_STATE) > MS_STATE_READY then
			Msg2MSAll(MISSION_ID,"Ng��i ch�i trong �i �t h�n "..MIN_PLAYER_COUNT.." ng��i, c�a �i s� k�t th�c.");
			CloseMission(MISSION_ID);
		end;
	end;
end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	local nMapID = SubWorldIdx2ID(SubWorld);
	NewWorld(nMapID,tPos_Out_Room[1],tPos_Out_Room[2]-10);
	MS_SetPlayerState();
	AddMSPlayer(MISSION_ID,nCamp)
	Msg2MSAll(MISSION_ID,GetName().."Ti�n v�o �i");
	Say("Ch� �: s� ng��i n�i ���ng v� ngo�i ���ng kh�ng  ���c �t h�n <color=yellow>"..MIN_PLAYER_COUNT.."<color> ng��i, n�u kh�ng c�a �i s� t� ��ng ��ng c�a.",0);
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Th�i gian chu�n b� k�t th�c c�n "..(tf_GetTimeString(nLoop*READY_TIMER_INTERVAL)));
	end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	SetMissionV(MV_TIMER_LOOP,nLoop+1);
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:ProcessTimer();
	nLoop = nLoop + 1;
	local szMsg = "";
	local nPlayerCount = mf_GetPlayerCount(MISSION_ID,ALL_ID);
	if mod(nLoop,12) == 0 then	--1����һ��
		szMsg = "Hi�n t�i s� ng��i trong �i c�: "..nPlayerCount;
	end;
	if nPlayerCount < MIN_PLAYER_COUNT then
		Msg2MSAll(MISSION_ID,"T�ng ng��i trong �i �t h�n "..MIN_PLAYER_COUNT.." ng��i, c�a �i �� b� ��ng.");
		CloseMission(MISSION_ID);
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H�n l� s�p k�t th�c, ch� c�n"..(tf_GetTimeString(nLoop*ENDING_TIMER_INTERVAL)));
	end;
end;
--��½����������
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[�i Bang H�i]: Ng��i ch�i "..GetName().." R�i Mission kh�ng b�nh th��ng, �ang trong qu� tr�nh x� l� ��ng nh�p.");
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = random(1,999999);	--���һ���ɣ�MSUID�Թؿ�����ûʲô�ô�
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()
	local nCurWeek = tonumber(date("%y%W"));
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetFightState(1);	--ս��״̬
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetDeathScript("\\script\\missions\\tong_mission\\npc\\death_player.lua");
	local nMapID = GetTaskTemp(TSK_TEMP_MAP_ID);
	SetTempRevPos(nMapID,tPos_Entrance[nMapID][1]*32,(tPos_Entrance[nMapID][2]-10)*32);	--����������
	SetPKFlag(1,1);	--PK״̬
	ForbidChangePK(1);	--��ֹת��PK״̬
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	ForbitTrade(1);	--��ֹ����
	StallEnable(0);	--��ֹ��̯
	OpenFriendliness(0);	--�����Ӻøж�
	SetDeathPunish(0);	--�������ͷ�
	SetMomentum(0);		--���ɱ��ֵ
	InteractiveEnable(0);	--��ֹ����
	ClearStolenSkill();	--�����͵ȡ�ļ��ܣ���Թ���
	if GetTongName() ~= GetMissionS(MS_TONG_NAME) then
		SetTaskTemp(TSK_TEMP_HELPER,1);	--���Ϊ��Ԯ
	end;
	TM_WeeklyClear();	--һ��һ��
end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()
	SetLogoutRV(0);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	SetFightState(0);	--��ƽ״̬
	SetDeathScript("");	--��������ű�
	SetTempRevPos(0,0,0);	--ɾ����ʱ������
	ForbidChangePK(0);	--����ת��PK״̬
	SetPKFlag(0,0);	--��PK״̬
	UseScrollEnable(1);	--����ʹ�ûسǷ�
	ForbitTrade(0);	--������
	StallEnable(1);	--�����̯
	OpenFriendliness(1);	--�����Ӻøж�
	SetDeathPunish(1);	--�������ͷ�
	LeaveTeam();	--�뿪����
	StopTimeGuage(-2);
	InteractiveEnable(1);	--������
	MS_ClearTempTaskValue();
end;
--���Mission���õ�����ʱ����
function MS_ClearTempTaskValue()
	for i=TEMP_BEGIN,TEMP_END do
		SetTaskTemp(i,0);
	end;
end;

