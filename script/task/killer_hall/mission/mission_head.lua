--date:2007-3-6
--author:yanjun
--describe:header script of the killer hall mission!it's a dynamic mission template!
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");
MISSION_ID = 34;									--Mission��ID
TIMER_ID = 62;										--��ʱ����ID
LOG_ID = 205;										--��½������ID
LOG_CUSTOM_ID = 3016;								--��½�������Զ�����
--=========================================================================================
MAX_PLAYER = 200;									--�����������
BOSS1_NEEDED_TEAM_COUNT = 1;						--��ˢһ��������Ҫ�Ķ�����
BOSS2_NEEDED_TEAM_COUNT = 1;						--��ˢһ����������Ҫ�Ķ�����
BOSS3_NEEDED_TEAM_COUNT = 1;						--��ˢһ���������Ҫ�Ķ�����
TEAM_MEMBER_COUNT = 8;								--һ֧������������ж�����
--=========================================================================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��
--��������׶εĳ���ʱ�䣬ֻ�����0������==================================================
READY_TIME = 10;									--׼��ʱ�䣬10����
STARTED_TIME = PLAY_TIME;							--����ʱ��ʱ�䣬60���ӡ�
ENDING_TIME = 3;									--�ȴ�����ʱ�䣬3����
--��������׶μ�ʱ���Ĵ������=============================================================
READY_TIMER_INTERVAL = 2;							--��ʱ��������ʱ��������λ����
READY_TIMER_COUNT = (READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 5;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = (ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS����=============================================================================

--MissionV����=============================================================================
MV_MISSION_STATE = 1;								--��¼Mission״̬
MV_TIMER_LOOP = 2;									--��¼��ʱ���ļ���
MV_MISSION_UID = 3;									--��¼Mission��ΨһID
MV_PLAYER_ENTER_TIME = 4;							--��¼�볡�˴�
--Mission״̬��============================================================================
MS_STATE_IDEL = 0;									--���ؿ���
MS_STATE_READY = 1;									--׼���׶�
MS_STATE_STARTED = 2;								--��ս�׶�
MS_STATE_ENDING = 3;								--�ȴ������׶�
--=========================================================================================
tMissionTS =	--MissionTimeState������Mission��Ծʱ��
{
	[MS_STATE_READY]   = {{2100,2110}},	--׼��ʱ������
	[MS_STATE_STARTED] = {{2111,2210}},	--��ʼʱ������
	[MS_STATE_ENDING]  = {{2211,2211}},	--�ȴ�����ʱ������
}
--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	local nCurState,nLeftMin,nTimeInterval = 0,0,0;
	if SETTING_DYNAMIC_MISSION == 1 then	--���֧�ֶ�̬Mission
		nCurState,nLeftMin = mf_GetMissionCurState();
		if nCurState == MS_STATE_READY or nCurState == MS_STATE_IDEL then
			nTimeInterval = READY_TIMER_INTERVAL;
		elseif nCurState == MS_STATE_STARTED then
			nTimeInterval = STARTED_TIMER_INTERVAL;
		elseif nCurState == MS_STATE_ENDING then
			nTimeInterval = ENDING_TIMER_INTERVAL;
		end;
	else	--��̬Mission�ĳ�ʼ��
		nCurState = MS_STATE_READY;
		nLeftMin = READY_TIME - READY_TIMER_INTERVAL;	--����Ҫ�ȼ�ȥREADY_TIMER_INTERVAL����Ȼ���һ��ѭ��
		nTimeInterval = READY_TIMER_INTERVAL;
	end;
	local nLoop = floor(nLeftMin/nTimeInterval);
	SetMissionV(MV_MISSION_STATE,nCurState);
	SetMissionV(MV_TIMER_LOOP,nLoop);
	StartMissionTimer(MISSION_ID,TIMER_ID,nTimeInterval*FRAME_PER_MIN);
	if nCurState == MS_STATE_STARTED then --����ǽ�����
		if mod(nLoop,floor(5/STARTED_TIMER_INTERVAL)) == 0 then
			MS_CreateBoss(NPC_TYPE_XIANGZHU);
			MS_CreateBoss(NPC_TYPE_FUTANGZHU);
		end;
		if mod(nLoop,floor(15/STARTED_TIMER_INTERVAL)) == 0 then
			MS_CreateBoss(NPC_TYPE_LIDAZUI);
		end;
	end;
	KH_Clear_Map_Value();	--���ͼ����
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	local nNpcIdx1 = CreateNpc("Ch�n T� ��n","���ng Minh ��c",885,1562,3188);
	SetNpcScript(nNpcIdx1,"\\script\\task\\killer_hall\\quest_npc.lua");
	WriteLog("[S�t Th� ���ng]: tr�n Mission b�t ��u, MSUID l�:"..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
	SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
	StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
	StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	MS_InitBoss();
end;
--Mission����
function MS_EndMission()
	ClearMapNpc(MAP_ID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);	--��mf_ClearMissionDataҲ���壬����ֻ����һ��ǿ��
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,0);	--��Mission����ɾ�����е����
	local nBox1Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX1_COUNT);
	local nBox2Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX2_COUNT);
	local nBox3Count = GetMapTaskTemp(MAP_ID,MAPV_OPENED_BOX3_COUNT);
	if nBox1Count > MAX_BOX1_COUNT then
		WriteLog("[S�t Th� ���ng l�m l�i]: nBox1Count �� v��t qu� ph�m vi, tr� s� l�:"..nBox1Count);
	end;
	if nBox2Count > MAX_BOX2_COUNT then
		WriteLog("[S�t Th� ���ng l�m l�i]: nBox2Count �� v��t qu� ph�m vi, tr� s� l�:"..nBox2Count);
	end;
	if nBox3Count > MAX_BOX3_COUNT then
		WriteLog("[S�t Th� ���ng l�m l�i]: nBox3`Count �� v��t qu� ph�m vi, tr� s� l�:"..nBox3Count);
	end;
	local nPlayerEnterTime = GetMissionV(MV_PLAYER_ENTER_TIME);
	WriteLog("[S�t Th� ���ng]: Tr�n Mission k�t th�c, MSUID l�:"..nMSUID..". S� ng��i v�o tr�n:"..nPlayerEnterTime..". S� r��ng m�:"..nBox1Count..", "..nBox2Count..", "..nBox3Count);
	mf_ClearMissionData();
	KH_Clear_Map_Value();
end;
--�뿪Mission
function MS_LeaveMission()
	MS_RestorePlayerState();
	local nPosIdx = random(1,getn(tExitPos));
	NewWorld(tExitPos[nPosIdx][1],tExitPos[nPosIdx][2],tExitPos[nPosIdx][3]);
end;
--����Mission
function MS_JoinMission(nCamp)
	gf_Msg2Team(GetName().."V�o S�t Th� ���ng");
	MS_SetPlayerState();
	AddMSPlayer(MISSION_ID,nCamp)
	SetMissionV(MV_PLAYER_ENTER_TIME,GetMissionV(MV_PLAYER_ENTER_TIME)+1);	--��¼�볡�˴�
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		Msg2MSAll(MISSION_ID,"C�c v� ��i hi�p ch� �: S�t th� c�a S�t Th� ���ng �� xu�t hi�n");
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Th�i gian S�t th� xu�t hi�n v�n c�n"..(nLoop*READY_TIMER_INTERVAL).." ph�t ");
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
		Msg2MSAll(MISSION_ID,"M�t n� n�y �� b� h� ph�t hi�n r�i, ph�i ra tay th�i!");
		ClearMapNpc(MAP_ID);
		local lfFunc = function(tArg)
			Say("Ng��i l� ai? Sao d�m x�ng v�o ��y?",
					1,
					"M�t n� n�y �� b� h� ph�t hi�n r�i,/MS_Nothing");
		end;
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},0,MAP_ID);
		local nNpcIdx = CreateNpc("Giang h� tu�n ki�t","Nam nh�n th�n b�",MAP_ID,1570,3190);
		SetNpcScript(nNpcIdx,"\\script\\task\\killer_hall\\entrance_npc.lua");
	else
		local nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount = MS_GetBossCount();
		if mod(nLoop,floor(5/STARTED_TIMER_INTERVAL)) == 0 then	--ÿ5����ˢһ��ɱ����������ɱ���ø�����
			MS_CreateBoss(NPC_TYPE_XIANGZHU,nXiangZhuCount);
			MS_CreateBoss(NPC_TYPE_FUTANGZHU,nFuTangZhuCount);
		end;
		if mod(nLoop,floor(15/STARTED_TIMER_INTERVAL)) == 0 then	--ÿ15����ˢһ�������������
			MS_CreateBoss(NPC_TYPE_LIDAZUI,nLiDaZuiCount);
		end;
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Th�i gian ho�n th�nh nhi�m v� S�t Th� ���ng c�n"..(nLoop*STARTED_TIMER_INTERVAL).." ph�t ");
		Msg2MSAll(MISSION_ID,"S� ng��i trong tr�n:"..nPlayerCount..", s� l��ng S�t th� xu�t hi�n:"..nXiangZhuCount.."H��ng ch�, "..nFuTangZhuCount.."Ph� ���ng ch�,"..nLiDaZuiCount.."L� ��i Ch�y");
	end;
end;
--���㵱ǰӦ�ò�����BOSS������
function MS_GetBossCount()
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,0);
	local nXiangZhuCount = ceil(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS1_NEEDED_TEAM_COUNT));
	local nFuTangZhuCount = ceil(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS2_NEEDED_TEAM_COUNT));
	local nLiDaZuiCount = floor(nPlayerCount/(TEAM_MEMBER_COUNT*BOSS3_NEEDED_TEAM_COUNT));
	if nXiangZhuCount >= BOSS1_POS_COUNT then
		nXiangZhuCount = BOSS1_POS_COUNT;
	end;
	if nFuTangZhuCount >= BOSS2_POS_COUNT then
		nFuTangZhuCount = BOSS2_POS_COUNT;
	end;
	if nLiDaZuiCount >= BOSS3_POS_COUNT then
		nLiDaZuiCount = BOSS3_POS_COUNT;
	end;
	return nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C�c v� ��i hi�p n�i trong"..(nLoop*ENDING_TIMER_INTERVAL).." ph�t ph�i r�i kh�i S�t Th� ���ng");
	end;
end;
--��½����������
function OnLogin()
	MS_RestorePlayerState();
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = 0;
	nMSUID = tonumber(date("%y%m%d%H"));
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()
	Say("V� mang m�t n� n�n ch�ng ai nh�n ra ng��i. � ��y th�t gi� tr� tr�n kh�ng d� d�ng tin ���c.",0);
	SetTask(KH_TASK_MSUID,GetMissionV(MV_MISSION_UID));
	SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetDeathPunish(0);
	SetPKFlag(2,1);
	ForbidChangePK(1);
	UseScrollEnable(0);
	ForbitTrade(1);
	StallEnable(0);
	SetFightState(1);
	UseMask(1,0);
	SetCreateTeam(1);	--��ֹ���
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetTempRevPos(305,1584*32,2830*32);
	OpenFriendliness(0);	--�����Ӻøж�
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		gf_ForbidFactionSkill(1)	
	end
end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()
	SetTaskTemp(KH_TASK_TEMP_BOX_INDEX,0);
	SetLogoutRV(0)
	SetDeathPunish(1);
	ForbidChangePK(0);
	UseScrollEnable(1);
	ForbitTrade(0);
	StallEnable(1);
	SetPKFlag(0,0);
	SetFightState(0);
	UseMask(0,0);
	SetCreateTeam(0);
	--LeaveTeam();	--���Ҫ����SetCreateTeam(0)֮���������
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	SetTempRevPos(0,0,0);
	OpenFriendliness(1);	--�ָ����Ӻøж�
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		gf_ForbidFactionSkill(0)	
	end
end;
--����Boss
function MS_CreateBoss(nType,nNum)
	local tBossPos = tNpcRegion[nType];
	local nNpcIdx = 0;
	local sBossModel,sBossName,nLifeTime = tNpcInfo[nType][1],tNpcInfo[nType][2],tNpcInfo[nType][3];
	local nBasePosIdx = random(1,getn(tBossPos));	--���һ����ʼλ������
	for i=1,nNum do
		local nBossPosIdx = mod(nBasePosIdx+i-2,getn(tBossPos))+1;	--���һ��ˢ��BOSS�ķ��������
		local nPosIdx = random(1,getn(tBossPos[nBossPosIdx]));	--���BOSS������������һ��ˢ�µ�
		nNpcIdx = CreateNpc(sBossModel,sBossName,tBossPos[nBossPosIdx][nPosIdx][1],tBossPos[nBossPosIdx][nPosIdx][2],tBossPos[nBossPosIdx][nPosIdx][3]);
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\killer_hall\\npc_death.lua");
		SetNpcLifeTime(nNpcIdx,nLifeTime);
	end;
end;
--��ʼ��BOSS��λ�ã�������ִ��RunMission��ʱ�����
function MS_InitBoss()
	local nXiangZhuCount,nFuTangZhuCount,nLiDaZuiCount,nPlayerCount = MS_GetBossCount();
	MS_CreateBoss(NPC_TYPE_XIANGZHU,nXiangZhuCount);
	MS_CreateBoss(NPC_TYPE_FUTANGZHU,nFuTangZhuCount);
	MS_CreateBoss(NPC_TYPE_LIDAZUI,nLiDaZuiCount);
	Msg2MSAll(MISSION_ID,"S� ng��i trong tr�n:"..nPlayerCount..", s� l��ng S�t th�:"..nXiangZhuCount.."H��ng ch�, "..nFuTangZhuCount.."Ph� ���ng ch�,"..nLiDaZuiCount.."L� ��i Ch�y");
end;

function MS_Nothing()

end;