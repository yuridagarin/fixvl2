--������Ϧ���Mission
--by vivi
--2008/07/18
Include("\\script\\online\\qixi08\\light\\light_head.lua")

--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_READY);
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(AOYUN_LIGHT_MISSION_UID,nMSUID);
	aoyun_light_InitFieldNpc(1);
	WriteLog("[Th� v�n h�i th�p ��n]: Mission khu 1 b�t ��u, MSUID l�: "..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	local nGuanType = GetMissionV(AOYUN_LIGHT_GUAN_TYPE);
	if nGuanType == 3 or nGuanType == 5 then
		aoyun_light_InitFieldNpc(nGuanType);
	end
	Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"H�i th�p ��n �i "..nGuanType.." ch�nh th�c b�t ��u, h�y ch� � th�c t� ��n c�n th�p.");
	local nBackStr = "";
	if nGuanType == 1 then
		nBackStr = aoyun_light_random(1,8,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);
	elseif nGuanType == 2 then
		nBackStr = aoyun_light_random(1,8,1);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 3 then
		nBackStr = aoyun_light_random(1,12,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 4 then
		nBackStr = aoyun_light_random(1,12,1);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	elseif nGuanType == 5 then
		nBackStr = aoyun_light_random(1,16,2);
		SetMissionS(AOYUN_LIGHT_DENG_SEQ,nBackStr);	
	end	
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_DIANDENG);
end;
--Mission����
function MS_EndMission()
	local nMSUID = GetMissionV(AOYUN_LIGHT_MISSION_UID);
	mf_DelAllMSPlayer(AOYUN_LIGHT_MISSION_ID,0);	--��Mission����ɾ�����е����
	aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_IDEL);
	mf_ClearMissionData();
	WriteLog("[Th� v�n h�i th�p ��n]: Mission khu 1 k�t th�c, MSUID l�: "..nMSUID);
end;
--�뿪Mission
function MS_LeaveMission()
	MS_RestorePlayerState();
	for i=1,getn(tMapId[2]) do
		if SubWorldID2Idx(tMapId[2][i][1]) ~= -1 then
			NewWorld(tMapId[2][i][1],tMapId[2][i][2],tMapId[2][i][3]);
			break
		end
	end
end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState();
	AddMSPlayer(AOYUN_LIGHT_MISSION_ID,nCamp);
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(AOYUN_LIGHT_MISSION_ID);
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Th�i gian th�p ��n c�n "..tf_GetTimeString(nLoop*AOYUN_LIGHT_READY_TIMER_INTERVAL));
	end;
end;

--����ϵͳ��Ƽ�ʱ������
function MS_ProcessDiandengTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_STARTED);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"B�t ��u th�p ��n, xin th�p theo th� t� m� h� th�ng �� th�p.");
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
		local nLetter = strsub(GetMissionS(AOYUN_LIGHT_DENG_SEQ),strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ))+1-nLoop,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ))+1-nLoop);
		local nIdx = 0;
		for i=1,getn(tLetter) do
			if nLetter == tLetter[i] then
				nIdx = i;
				break;
			end
		end
		if nIdx ~= 0 then
			SetCurrentNpcSFX(GetMissionV(nIdx+10),909,2,0);
		end
	end
end

--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_ChangeMSState(AOYUN_LIGHT_STATE_ENDING);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"Th�p ��n th�t b�i, b�n kh�ng th�p trong th�i gian quy ��nh. ��i ng� chuy�n ra ngo�i �i sau 20 gi�y.");
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"K�t th�c th�p ��n c�n "..tf_GetTimeString(nLoop*AOYUN_LIGHT_STARTED_TIMER_INTERVAL));
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(AOYUN_LIGHT_TIMER_LOOP);
	if nLoop == 0 then
		aoyun_light_CloseField();
	else
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,nLoop-1);
		Msg2MSAll(AOYUN_LIGHT_MISSION_ID,"H�n l� s�p k�t th�c, ch� c�n"..tf_GetTimeString(nLoop*AOYUN_LIGHT_ENDING_TIMER_INTERVAL));
	end;
end;
--��½����������
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[Th� v�n h�i th�p ��n]: Ng��i ch�i  "..GetName().." R�i Mission kh�ng b�nh th��ng, �ang trong qu� tr�nh x� l� ��ng nh�p.");
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()
	local nMapID = gf_GetCurMapID();
	CreateTrigger(3,AOYUN_LIGHT_LOG_ID,AOYUN_LIGHT_LOG_CUSTOM_ID);
	SetFightState(1);	--ս��״̬
	SetPKFlag(1,1);	--PK״̬
	ForbidChangePK(1);	--��ֹת��PK״̬
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	ForbitTrade(1);	--��ֹ����
	StallEnable(0);	--��ֹ��̯
	SetDeathPunish(0);	--�������ͷ�
	InteractiveEnable(0);	--��ֹ����
	NewWorld(nMapID,tMapId[1][2],tMapId[1][3]);	
end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()
	RemoveTrigger(GetTrigger(AOYUN_LIGHT_LOG_CUSTOM_ID));
	SetFightState(0);	--��ƽ״̬
	ForbidChangePK(0);	--����ת��PK״̬
	SetPKFlag(0,0);	--��PK״̬
	UseScrollEnable(1);	--����ʹ�ûسǷ�
	ForbitTrade(0);	--������
	StallEnable(1);	--�����̯
	SetDeathPunish(1);	--�������ͷ�
	InteractiveEnable(1);	--������
end;



