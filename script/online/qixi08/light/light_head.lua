--������Ϧ����ͷ�ļ�
--by vivi
--2008\07\17

Include("\\script\\online\\qixi08\\function.lua");

--�������
TSK_AOYUN_LIGHT_AWARD = 1970;    --�Ƿ���ȡ������
TSK_AOYUN_LIGHT_DATE = 1971;		 --��ȡ����������
TSK_AOYUN_LIGHT_GUAN = 1972;     --ͨ�˵ڼ���
TSK_AOYUN_LIGHT_NUM = 1973;      --����ͨ�ش���	

--MISSION���
AOYUN_LIGHT_MISSION_ID = 45;        --mission id
AOYUN_LIGHT_TIMER_ID = 74;           --��ʱ��ID
AOYUN_LIGHT_LOG_ID = 1113;          --��½������ID
AOYUN_LIGHT_LOG_CUSTOM_ID = 558;    --��½�������Զ�����

--=========================================================================================
AOYUN_LIGHT_FRAME_PER_SECOND = 18;								--��Ϸ�����ٶȣ�ÿ�룱��֡
--��������׶εĳ���ʱ�䣬ֻ�����0������==================================================
AOYUN_LIGHT_READY_TIME = 20;										--׼��ʱ�䣬20s
AOYUN_LIGHT_STARTED_TIME = 120;								--����ʱ�䣬2����
AOYUN_LIGHT_ENDING_TIME = 20;									--�ȴ�����ʱ�䣬20s

--��������׶μ�ʱ���Ĵ������=============================================================
AOYUN_LIGHT_READY_TIMER_INTERVAL = 10;							--��ʱ��������ʱ��������λs
AOYUN_LIGHT_READY_TIMER_COUNT = (AOYUN_LIGHT_READY_TIME/AOYUN_LIGHT_READY_TIMER_INTERVAL)-1;	
AOYUN_LIGHT_DIANDENG_TIMER_INTERVAL = 10;            --ϵͳÿ5s��һ�ε�
AOYUN_LIGHT_STARTED_TIMER_INTERVAL = 30;					
AOYUN_LIGHT_STARTED_TIMER_COUNT = (AOYUN_LIGHT_STARTED_TIME/AOYUN_LIGHT_STARTED_TIMER_INTERVAL)-1;	
AOYUN_LIGHT_ENDING_TIMER_INTERVAL = 10;
AOYUN_LIGHT_ENDING_TIMER_COUNT = (AOYUN_LIGHT_ENDING_TIME/AOYUN_LIGHT_ENDING_TIMER_INTERVAL)-1;	

--MissionV����=============================================================================
AOYUN_LIGHT_MISSION_STATE = 1;								--��¼Mission״̬
AOYUN_LIGHT_TIMER_LOOP = 2;									--��¼��ʱ���ļ���
AOYUN_LIGHT_MISSION_UID = 3;									--��¼Mission��ΨһID
AOYUN_LIGHT_MAPID = 4;                        --��¼mission��ͼ��id
AOYUN_LIGHT_MAPIDX = 5;											--��¼mission��ͼ������
AOYUN_LIGHT_GUAN_TYPE = 6;                   --��¼��ս�ڼ���
AOYUN_LIGHT_GUAN_SUC = 7;                    --�����Ƿ�ɹ�

AOYUN_LIGHT_IDX = 11;                      --11-26Ϊʥ��̨����

--MissionS����=============================================================================
AOYUN_LIGHT_DENG_SEQ = 1;                  --���˳��
AOYUN_LIGHT_PLAYER_SEQ = 2;                --��ҵ��˳��

--Mission״̬��============================================================================
AOYUN_LIGHT_STATE_IDEL = 0;									--���ؿ���
AOYUN_LIGHT_STATE_READY = 1;									--׼���׶�
AOYUN_LIGHT_STATE_DIANDENG = 2;               --ϵͳ��ƽ׶�
AOYUN_LIGHT_STATE_STARTED = 3;								--��ҵ�ƽ׶�
AOYUN_LIGHT_STATE_ENDING = 4;								--�ȴ������׶�
--=========================================================================================

--ȫ�ֱ���
tMapId = {
	{977,1622,3181},
	{{100,1445,2950},
	 {200,1412,2853},
	 {300,1776,3541}
	}};
tLightNpc = {
	{"��i �u�c","��n 1",1621,3141,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 2",1607,3154,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 3",1593,3167,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 4",1579,3183,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 5",1594,3198,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 6",1608,3214,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 7",1624,3228,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 8",1640,3213,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 9",1654,3200,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 10",1667,3187,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 11",1649,3170,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 12",1636,3154,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 13",1635,3168,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 14",1609,3194,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 15",1610,3169,"\\script\\online\\qixi08\\light\\light_npc.lua"},
	{"��i �u�c","��n 16",1638,3197,"\\script\\online\\qixi08\\light\\light_npc.lua"}
	};

AOYUN_LIGHT_CAMP = 1;							--�����Ӫ
AOYUN_LIGHT_TOTAL_MAP = 10;        --���20�����ڹؿ�

--����
tLightAward = {--���飬��ʯ����id����������������
	{1000000,2,1,2642,2,2500000},
	{1000000,2,1,2642,3,3000000},
	{1000000,2,1,2642,4,3500000},
	{1000000,2,1,2642,5,4000000},
	{2000000,2,1,2642,6,4000000}
};

function aoyun_light_random(nMin,nMax,nType)
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	local sBackNum = "";
	if nType == 1 then	
		for i=nMin,nMax do
			local nRand = random(nMin,nMax);
			sBackNum = sBackNum..tLetter[nRand];
		end
	elseif nType == 2 then
		local tArgNum = {};
		for i=nMin,nMax do
			tinsert(tArgNum,i);
		end
		for j=1,getn(tArgNum) do
			local nRand = random(1,getn(tArgNum));
			sBackNum = sBackNum..tLetter[nRand];
			tremove(tLetter,nRand);
			tremove(tArgNum,nRand);
		end
	end
	return sBackNum;
end

--��ȡ��̬�ؿ�ID
function aoyun_light_GetIdleRoom()
	local nCount = 0;
	local nMapID,nMapIdx = 0,0;
	nCount = GetMapLoadCount(tMapId[1][1]);
	if nCount < AOYUN_LIGHT_TOTAL_MAP then
		nMapID,nMapIdx = DynamicLoadMap(tMapId[1][1]);
		return nMapID,nMapIdx;
	end;			
	return 0,0;
end;

--����һ���ؿ�
function aoyun_light_OpenMatch()
	local nMapID,nMapIdx = aoyun_light_GetIdleRoom();
	if nMapID == 0 and nMapIdx == 0 then
		Talk(1,"","Khu thi ��u hi�n t�i �� ��y, xin quay l�i sau.")
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	if mf_OpenMission(AOYUN_LIGHT_MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_GUAN_TYPE,1,nMapID);	
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_MAPID,nMapID,nMapID);
		mf_SetMissionV(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_MAPIDX,nMapIdx,nMapID);
		ClearMapTrap(nMapID); --�����ǰ��ͼ��trap��
		local nTeamSize = GetTeamSize();
		if nTeamSize == 0 or nTeamSize == 1 then
			mf_JoinMission(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_CAMP,nMapID);
		else	
			for i=1,GetTeamSize() do
				PlayerIndex = GetTeamMember(i);
				mf_JoinMission(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_CAMP,nMapID);
			end
		end
	end
	PlayerIndex = nOldPIdx;
end;

--��ʼ������boss
function aoyun_light_InitFieldNpc(nType)
	local nMapID = gf_GetCurMapID();
	local nNpcIdx = 0;
	if nType == 1 then	
		for i=1,8 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end
	end
	if nType == 2 or nType == 4 then
		return
	end 
	if nType == 3 then
		for i=9,12 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end	
	end
	if nType == 5 then
		for i=13,16 do
			nNpcIdx = CreateNpc(tLightNpc[i][1],tLightNpc[i][2],nMapID,tLightNpc[i][3],tLightNpc[i][4]);
			SetNpcScript(nNpcIdx,tLightNpc[i][5]);
			SetMissionV(i+10,nNpcIdx);
		end	
	end
end;

--�رյ�Ƴ���
function aoyun_light_CloseField()
	local nMapID = GetMissionV(AOYUN_LIGHT_MAPID);
	local nMapIdx = GetMissionV(AOYUN_LIGHT_MAPIDX);
	CloseMission(AOYUN_LIGHT_MISSION_ID);
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMapҲ�����CloseMisssion
	if nRetCode ~= 1 then
		WriteLog("[Th� v�n h�i th�p ��n b� l�i]:FreeDynamicMap b� l�i, nRetCode:"..nRetCode);
	end;
end;

--ת��Mission��ǰ״̬
function aoyun_light_ChangeMSState(nState)
	if nState == AOYUN_LIGHT_STATE_IDEL then
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--����ǰһ����ʱ��
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_IDEL);
	elseif nState == AOYUN_LIGHT_STATE_READY then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_READY_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);	--��ʼһ����ʱ��	
	elseif nState == AOYUN_LIGHT_STATE_DIANDENG then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_DIANDENG);
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)));
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_DIANDENG_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);
	elseif nState == AOYUN_LIGHT_STATE_STARTED then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_STARTED_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_STARTED_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);	--��ʼһ���µļ�ʱ��
	elseif nState == AOYUN_LIGHT_STATE_ENDING then
		SetMissionV(AOYUN_LIGHT_MISSION_STATE,AOYUN_LIGHT_STATE_ENDING);
		SetMissionV(AOYUN_LIGHT_TIMER_LOOP,AOYUN_LIGHT_ENDING_TIMER_COUNT);
		StopMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID);
		StartMissionTimer(AOYUN_LIGHT_MISSION_ID,AOYUN_LIGHT_TIMER_ID,AOYUN_LIGHT_ENDING_TIMER_INTERVAL*AOYUN_LIGHT_FRAME_PER_SECOND);
	end;
end;

function aoyun_light_right_seq(nType)
	local tLetter = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P"};
	local sSeq = "";
	if nType == 1 then
		for i=1,strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) do
			for j=1,getn(tLetter) do
				if strsub(GetMissionS(AOYUN_LIGHT_DENG_SEQ),i,i) == tLetter[j] then
					if i ~= strlen(GetMissionS(AOYUN_LIGHT_DENG_SEQ)) then	
						sSeq = sSeq..j..",";
					else
						sSeq = sSeq..j;
					end
					break;
				end
			end
		end
	elseif nType == 2 then
		for i=1,strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) do
			for j=1,getn(tLetter) do
				if strsub(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ),i,i) == tLetter[j] then
					if i ~= strlen(GetMissionS(AOYUN_LIGHT_PLAYER_SEQ)) then	
						sSeq = sSeq..j..",";
					else
						sSeq = sSeq..j;
					end
					break;
				end
			end
		end		
	end
	return sSeq;
end
