Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online_activites\\tiaozhansilingboss\\string.lua")
MISSION_ID = 51;									--Mission��ID
TIMER_ID = 80;										--��ʱ����ID
LOG_ID = 3002;										--��½������ID
LOG_CUSTOM_ID = 2501;								--��½�������Զ�����
MAP_ID = {
    [1] = {106,1466,3071}, --��Ȫ��
    [2] = {151,1481,2961}, --������
    [3] = {205,1670,3015}, --�꾩����
    [4] = {105,1553,3098}, --Ȫ����
    [5] = {108,1448,3097}, --Ȫ�ݱ�
}								--�����ͼ��ID
--=========================================================================================
FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--ÿ������Ϸ֡��
--��������׶εĳ���ʱ�䣬ֻ�����0������==================================================
STARTED_TIME = 60;									--����ʱ��ʱ�䣬60����
ENDING_TIME = 3;									--�ȴ�����ʱ�䣬3����
--��������׶μ�ʱ���Ĵ������=============================================================
READY_TIMER_INTERVAL = 1;
READY_TIMER_COUNT = 1;
STARTED_TIMER_INTERVAL = 1;					
STARTED_TIMER_COUNT = (STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = 1;
--MissionS����=============================================================================

--MissionV����=============================================================================
MV_MISSION_STATE = 1;								--��¼Mission״̬
MV_TIMER_LOOP = 2;									--��¼��ʱ���ļ���
MV_MISSION_UID = 3;									--��¼Mission��ΨһID
--Mission״̬��============================================================================
MS_STATE_IDEL = 0;									--���ؿ���
MS_STATE_READY = 1;									--׼���׶�
MS_STATE_STARTED = 2;								--��ս�׶�
MS_STATE_ENDING = 3;								--�ȴ������׶�
--=========================================================================================

MS_MAX_NUM_TANXIANGMU = 200
VET_201008_SILING_EVENT_NUMBER = 12
--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
    --print("enter MS_InitMission--------------------------------")
    mf_ClearMissionData();
    SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ׼��״̬
    SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
    StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��
    local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
    SetMissionV(MV_MISSION_UID,nMSUID);	
    AddGlobalCountNews(format(VET_201008_02_TB_STR_LIST[1],VET_201008_02_STR_CITY_NAME[GetGlbValue(1033)]),2)
end;
--Mission��ʼ
function MS_StartMission()
    --print("enter MS_StartMission--------------------------------")
    SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
    SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
    StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
    StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
end;
--Mission����
function MS_EndMission()
    --print("enter MS_EndMission--------------------------------")
    local nNpcIndex = GetGlbValue(1032)
    local nRandom = GetGlbValue(1033)
    SetNpcLifeTime(nNpcIndex,0)
    SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
    StopMissionTimer(MISSION_ID,TIMER_ID);
    StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
    mf_ClearMissionData(MAP_ID[nRandom][1]);
    --SetGlbValue(1001,0)
end;


--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
    --print("enter MS_ProcessReadyTimer--------------------------------")
    local nLoop = GetMissionV(MV_TIMER_LOOP);
    if nLoop == 0 then
        RunMission(MISSION_ID);
    else
        SetMissionV(MV_TIMER_LOOP,nLoop-1);
        AddTanMuXiang()
    end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
    --print("enter MS_ProcessStartedTimer--------------------------------")
    local nLoop = GetMissionV(MV_TIMER_LOOP);
    if nLoop == 0 then
        SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
	SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
        local nNpcIndex = GetGlbValue(1032)
        local nNpcState = GetUnitCurStates(nNpcIndex,1)-1
        if nNpcState == nil or nNpcState < MS_MAX_NUM_TANXIANGMU then
            AddGlobalCountNews(VET_201008_02_TB_STR_LIST[2],2)
        else
            AddGlobalCountNews(format(VET_201008_02_TB_STR_LIST[3],VET_201008_02_STR_CITY_NAME[GetGlbValue(1033)]),2)
        end
    else
	SetMissionV(MV_TIMER_LOOP,nLoop-1);
        AddTanMuXiang()
    end;
end;

--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
    --print("enter MS_ProcessEndingTimer--------------------------------")
   --Msg2SubWorld("MS_ProcessEndingTimer")
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
	    CloseMission(MISSION_ID);
            local nNpcIndex = GetGlbValue(1032)
            local nNpcState = GetUnitCurStates(nNpcIndex,1)-1
            local nRandMap = GetGlbValue(1033)
            if nNpcState >= MS_MAX_NUM_TANXIANGMU then
                local nRandom = random(1,4)
                Msg2Global(VET_201008_02_TB_STR_LIST[21])
                --print("//////////////*******************\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
                nNpcIndex = CreateNpc(VET_201008_02_TB_BOSS_LIST[nRandom][1],VET_201008_02_TB_BOSS_LIST[nRandom][2],MAP_ID[nRandMap][1],MAP_ID[nRandMap][2],MAP_ID[nRandMap][3])
                SetNpcLifeTime(nNpcIndex,3600)
                SetNpcDeathScript(nNpcIndex,VET_201008_02_TB_BOSS_LIST[nRandom][3])
                --AddUnitStates(nNpcIndex,1,nRandom)
            end
	else
	    SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--��½����������
function OnLogin()
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;

function AddSiLingDing(nRandMap)
    local nNpcIndex = CreateNpc(VET_201008_02_TB_NPC_LIST[1][1],VET_201008_02_TB_NPC_LIST[1][2],MAP_ID[nRandMap][1],MAP_ID[nRandMap][2],MAP_ID[nRandMap][3],-1,1,1,100)
    SetNpcScript(nNpcIndex,VET_201008_02_TB_NPC_LIST[1][3])
    SetGlbValue(1032,nNpcIndex)
    --AddUnitStates(nNpcIndex,1,0) --��¼npc����̴��ľ������
    --print("nNpcIndex **************"..nNpcIndex)
end

function AddTanMuXiang()
    local nRandMap = GetGlbValue(1033)
    local nNpcIndex = 0
    local nMapID, nWx, nWy = MAP_ID[nRandMap][1], MAP_ID[nRandMap][2], MAP_ID[nRandMap][3]
    local nAddX = 0
    local nAddY = 0
    Msg2Global(VET_201008_02_TB_STR_LIST[19])
    --DoFireworks(871, 1)
    for i = 1, 68 do
        nAddX = random(-30, 30)
	nAddY = random(-30, 30)
        nNpcIndex = CreateNpc(VET_201008_02_TB_NPC_LIST[2][1],VET_201008_02_TB_NPC_LIST[2][2],nMapID,nWx+nAddX,nWy+nAddY)
        SetNpcScript(nNpcIndex,VET_201008_02_TB_NPC_LIST[2][3])
        SetNpcLifeTime(nNpcIndex, 55)
    end
end

