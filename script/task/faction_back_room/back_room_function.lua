--���ߣ��Ͼ�
--�������ڣ�07��11��13��14:50
--ʦ�Źؿ����������ű��ļ�
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\faction_back_room\\back_room_head.lua");
Include("\\script\\task\\faction_back_room\\route_function.lua");
--������ҵ�ͼID����������ش�����û�ж����ͼʱ����0,0,0
function BR_FindIdleRoom_test(nFaction)
	return TB_BACKROOM[nFaction],0,0;
end;
function BR_FindIdleRoom(nFaction,nType)
	if UNCOMPLETED_VERSION == 1 then
		return BR_FindIdleRoom_test(nFaction);
	end;
	local nCount = 0;
	local nMaxRoomNum = 0;
	if nType == 1 then
		nCount = BR_GetRouteDynamicMapCount(nFaction);
		nMaxRoomNum = MAX_ROUTE_ROOM_COUNT;
	elseif nType == 2 then
		nCount = BR_GetShareDynamicMapCount();
		nMaxRoomNum = MAX_ROOM_COUNT;
	end;
	if nCount >= nMaxRoomNum then
		return 0,0,0;
	end;
	local nMapID,nMapIdx = DynamicLoadMap(TB_BACKROOM[nFaction]);
	return nMapID,nMapIdx,nCount;
end;
--��õ�ǰ�������Ѿ���̬�����˶�����ʦ�Źؿ��ĵ�ͼ
function BR_GetDynamicMapCount()
	local nCount = 0;
	for i=1,getn(TB_BACKROOM) do
		nCount = nCount + GetMapLoadCount(TB_BACKROOM[i]);
	end;
	return nCount;
end;
--��ȡĳ�����ɵ�ǰ���õ�ͼ����
function BR_GetRouteDynamicMapCount(nFaction,nRoute)
	local tbMapID = gf_GetDataTable(GetSameMaps(TB_BACKROOM[nFaction]));
	local nCount = 0;
	local nMapID = 0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if mf_GetMissionV(MISSION_ID,MV_MAP_TYPE,nMapID) == nRoute then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;
--��ȡ�����ͼ��ʹ������
function BR_GetShareDynamicMapCount()
	local nCount = 0;
	for i=1,7 do	--7������
		nCount = BR_GetRouteDynamicMapCount(i,0) + nCount;
	end;
	return nCount;
end;
--ɾ��ĳһ���ɵ�����
function BR_DelLingPai(nFaction,nCount)
	return DelItem(TB_LINGPAI[nFaction][1],TB_LINGPAI[nFaction][2],TB_LINGPAI[nFaction][3],nCount);
end;
--��ʱ������ʼ��
function BR_ClearTempTask()
	for i=TTSK_BEGIN,TTSK_END do
		SetTaskTemp(i,0);
	end;
end;
--���������0
function BR_ClearNCTask()
	for i=TSK_NC_BEGIN,TSK_NC_END do
		SetTask(i,0);
	end;
end;
--��ͼ������0
function BR_ClearMapTask(nMapID)
	for i=MAP_TSK_BEGIN,MAP_TSK_END do
		SetMapTaskTemp(nMapID,i,0);
	end;
end;
--��ʼ��һ��
function BR_NextStage()
	local nMapID = BR_GetCurMapID();
	BR_ClearMapNpcSafe(nMapID);
	local nCurDiff,nCurStage = 0,0;
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nCurStage == 1 or nCurStage == 5 or nCurStage == 9 then
		if BR_EnterNextStageCheck(nCurDiff,nCurStage,nPIdx) == 0 then
			Say2SomeOne(nPIdx,"B�n hi�n kh�ng �� �i�u ki�n �� v�o �i, xin h�y ki�m tra gi�i h�n v��t �i � Ti�p d�n m�t th�t s� m�n.",0);
			Msg2MSAll(MISSION_ID,"B�n hi�n kh�ng �� �i�u ki�n �� v�o �i, xin h�y ki�m tra gi�i h�n v��t �i � Ti�p d�n m�t th�t s� m�n.");
			BR_ChangeMSState(MS_STATE_END_WAITING);
			BR_CreateDisciple();
			return 0;
		end;
	end;
	BR_InitStage(nCurDiff,nCurStage);
	BR_RestorePlayer();
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nCurStage == 1 then	--����ǵ�һ��
		SetTask(TSK_ENTER_TYPE,0, 0, nPIdx);	--����������Ϊ0
		SetMissionV(MV_TOTAL_TIME,0);	--�ۼ�ʱ����0
	end;
	Msg2MSAll(MISSION_ID,""..TB_DIFF_NAME[nCurDiff].."�� kh� �i "..nCurStage.." b�t ��u");
	if DEBUG_VERSION == 1 then
		BR_CreateDisciple();
	end;
end;
--��ͣ�ؿ�
function BR_PauseStage()
	BR_ChangeMSState(MS_STATE_READY);
	BR_CreateDisciple();
end;
--����ĳһ�ء�����
function BR_EndStage()
	BR_UnInitStageEven(nCurDiff,nCurStage);
	local nCurDiff,nCurStage = 0,0;
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	nCurDiff = BR_GetCurDiff();
	nCurStage = BR_GetCurStage();
	local nNextDiff,nNextStage = nCurDiff,nCurStage+1;
	local nUseTime = GetTime() - GetMissionV(MV_BEGIN_TIME) + GetMissionV(MV_TOTAL_TIME); --���㱾ѭ������ʱ
	SetMissionV(MV_TOTAL_TIME,nUseTime);
	local nEnterType = GetTask(TSK_ENTER_TYPE,nPIdx);
	if nEnterType == 1 then
		Msg2MSAll(MISSION_ID,"B�n �� v��t qua "..TB_DIFF_NAME[nCurDiff].."�i "..nCurStage..", �ang ��c d� li�u, �� kh� n�y kh�ng ghi l�i th�i gian ");
	else
		Msg2MSAll(MISSION_ID,"B�n �� v��t qua "..TB_DIFF_NAME[nCurDiff].."�i "..nCurStage..", th�i gian: "..tf_GetTimeString(nUseTime)..".");
	end;
	if nCurStage == MAX_STAGE then	--�����ѭ�������һ��
		nNextDiff = nCurDiff + 1;	--������һѭ��
		nNextStage = 1;				--�ع��1��
		if nBeginTime ~= 0 then
			if nEnterType == 1 then
				Msg2MSAll(MISSION_ID,"Ch�c m�ng b�n �� v��t qua �i "..TB_DIFF_NAME[nCurDiff]..", �ang ��c d� li�u, �� kh� n�y kh�ng ghi l�i th�i gian");
				WriteLog(LOG_HEADER..", �� kh�: "..nCurDiff..", �i  "..nCurStage..". T�n: "..GetName(nPIdx)..", c�p:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", th�i gian: �ang ��c s� li�u, kh�ng ghi l�i th�i gian");			
			else
				Msg2MSAll(MISSION_ID,"Ch�c m�ng b�n �� v��t qua �i "..TB_DIFF_NAME[nCurDiff]..", th�i gian: "..tf_GetTimeString(nUseTime));
				if BR_UpDateTimeRecord(nCurDiff,nUseTime,nPIdx) == 1 then		--�ύʱ��
					Msg2MSAll(MISSION_ID,"Ch�c m�ng b�n �� chi�n th�ng b�n th�n "..TB_DIFF_NAME[nCurDiff].."V��t �i v�i th�nh t�ch nhanh nh�t");
				end;
				WriteLog(LOG_HEADER..", �� kh�: "..nCurDiff..", �i  "..nCurStage..". T�n: "..GetName(nPIdx)..", c�p:"..GetLevel(nPIdx)..","..GetMissionV(MV_ROUTE)..", th�i gian: "..nUseTime);			
			end;
		end;
	end;
	if nCurStage == 4 or nCurStage == 8 or nCurStage == 9 then
		BR_CreateAwardBox(nCurDiff,nCurStage,nPIdx);	--��������
		if GetTask(TSK_WC_FAIL_TIMES,nPIdx) >= MAX_FAILURE_TIMES then	--ʧ�ܳ���һ���������Զ��浵
			BR_SaveRecord(nNextDiff,nNextStage,nPIdx);
		end;
	end;
	BR_SetCurDiff(nNextDiff);	--������һ��
	BR_SetCurStage(nNextStage);	--������һ��
	if nCurDiff == MAX_DIFFICULTY_LEVEL and nCurStage == MAX_STAGE then	--��������ѭ�����ؿ�
		local szFactionName = gf_GetFactionName(GetMissionV(MV_FACTION));
		Msg2MSAll(MISSION_ID,"Ch�c m�ng b�n �� v��t qua to�n b� kh�o nghi�m, x�ng ��ng l� �� t� xu�t s�c c�a "..szFactionName..", xin h�y ��i m�t l�t, s� l�p t�c chuy�n b�n ra ngo�i")
		BR_FinalEndStage();
		return 0;
	end;
	if nCurStage == MAX_STAGE or nCurStage == floor(MAX_STAGE/2) or nCurStage == MAX_STAGE-1 then	--����4,8,9�غ�
		BR_PauseStage();	--�����׶�
	else	--���������Ϣ��
		--�Խ���ĳһ�ؿ���Ϊ�ؿ�֮��ķֽ��
		BR_ChangeMSState(MS_STATE_SHORT_PAUSE);
	end;
end;
--ͨȫ��
function BR_FinalEndStage()
	BR_ChangeMSState(MS_STATE_END_WAITING);
	BR_CreateDisciple();
end;
--������������
function BR_CreateDisciple()
	local nFaction = GetMissionV(MV_FACTION);
	local nMapID = BR_GetCurMapID();
	local nMapX = TB_ENTRY_POS[nFaction][1];
	local nMapY = TB_ENTRY_POS[nFaction][2];
	local nNpcIdx = CreateNpc("V��ng An Th�ch","Ti�p d�n �� t� ",nMapID,nMapX,nMapY);
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_disciple.lua");
end;
--�����ؿ�NPC
function BR_CreateStageNpc(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	local nFaction = GetMissionV(MV_FACTION);
	local nNpcModelName = TB_STAGE_INFO[nRoute][0][1][1]..nDiff;
	local nNpcName = TB_STAGE_INFO[nRoute][0][1][2];
	local nNpcCount = TB_STAGE_INFO[nRoute][nDiff][1][nStage];
	local nMapID = BR_GetCurMapID();
	local nMapX,nMapY = 0,0;
	local nNpcIdx = 0;
	local nPosSize = getn(TB_NPC_POS[nFaction]);
	local nPosIdx = 0;
	for i=1,nNpcCount do
		nPosIdx = mod(i-1,nPosSize)+1;
		nMapX,nMapY = TB_NPC_POS[nFaction][nPosIdx][1],TB_NPC_POS[nFaction][nPosIdx][2];
		nNpcIdx = BR_CreateNpc(nNpcModelName,nNpcName,nMapID,nMapX,nMapY);
		SetNpcDeathScript(nNpcIdx,"\\script\\task\\faction_back_room\\death_npc.lua");
		SetMissionV(MV_NPC_INDEX_BEGING+i-1,nNpcIdx);
	end;
end;
--����BOSS
function BR_CreateBoss(nDiff)
	local nRoute = GetMissionV(MV_ROUTE);
	local nFaction = GetMissionV(MV_FACTION);
	local nNpcModelName = TB_STAGE_INFO[nRoute][0][2][1]..nDiff;
	local nNpcName = TB_STAGE_INFO[nRoute][0][2][2];
	local nMapID = BR_GetCurMapID();
	local nMapX,nMapY = TB_BOSS_POS[nFaction][1],TB_BOSS_POS[nFaction][2];
	local nNpcIdx = BR_CreateNpc(nNpcModelName,nNpcName,nMapID,nMapX,nMapY);
	SetMissionV(MV_NSC_BOSS_INDEX,nNpcIdx);
	SetNpcDeathScript(nNpcIdx,"\\script\\task\\faction_back_room\\death_npc.lua");	
end;
--��鵱ǰ״���Ƿ����
function BR_CheckWinCondition(nDiff,nStage)
	local nMapID = BR_GetCurMapID();
	local nCurKillCount = GetMissionV(MV_NSC_KILL_NPC_COUNT);
	local nNeedKillCount = GetMissionV(MV_NSC_NEED_KILL_NUMBER);
	if nCurKillCount >= nNeedKillCount then
		return 1;
	else
		return 0;
	end;
end;
--һ��һ��
function BR_WeeklyClear()
	local nWeek = tonumber(date("%y%W"));
	if GetTask(TSK_ATTEND_WEEK) < nWeek then
		for i=TSK_WC_BEGIN,TSK_WC_END do
			SetTask(i,0);
		end;
	end;
end;
--��ʱ�䣨��λ�룩ת��Ϊѭ������
function BR_TransformTime2Loop(nState,nSec)
	local nLoop = 0;
	if nState == MS_STATE_READY then
		nLoop = floor((nSec/60)/READY_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_STARTED then
		nLoop = floor((nSec/60)/STARTED_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_SHORT_PAUSE then
		nLoop = floor((nSec/60)/SHORT_PAUSE_TIMER_COUNT)-1;
	elseif nState == MS_STATE_END_WAITING then
		nLoop = floor((nSec/60)/ENDING_TIMER_INTERVAL)-1;
	elseif nState == MS_STATE_IDEL then
		nLoop = 0;
	end;
	return nLoop;
end;
--����ѭ������
function BR_SetStageTimerLoop(nLoop)
	SetMissionV(MV_TIMER_LOOP,nLoop);
end;
--��ȡ��ǰѭ������
function BR_GetStageTimerLoop()
	return GetMissionV(MV_TIMER_LOOP);
end;
--��ȡ��ǰ�Ѷ�
function BR_GetCurDiff()
	return GetMissionV(MV_CUR_DIFF);
end;
--���õ�ǰ�Ѷ�
function BR_SetCurDiff(nDiff)
	SetMissionV(MV_CUR_DIFF,nDiff);
end;
--��ȡ��ǰ�ǵڼ���
function BR_GetCurStage()
	return GetMissionV(MV_CUR_STAGE);
end;
--���õ�ǰ�ǵڼ���
function BR_SetCurStage(nStage)
	SetMissionV(MV_CUR_STAGE,nStage);
end;
--��ȡMission��ǰ״̬
function BR_GetMSCurState()
	return GetMissionV(MV_MISSION_STATE);
end;
--��ȡ��ʱ����ǰ״̬
function BR_GetTimerState()
	return GetMissionV(MV_MISSION_STATE);
end;
--���ü�ʱ����ǰ״̬
function BR_SetTimerState(nState)
	SetMissionV(MV_MISSION_STATE,nState);
end;
--��鵱ǰ��ͼID�Ƿ�Ϸ�
function BR_CheckMap()
	return 1;
end;
--���ĳ����Ϣ
function BR_GetStageInfo(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if DEBUG_VERSION == 1 then
		if nStage == MAX_STAGE then
			return 180,1;
		else
			return 180,nDiff;
		end;
	end;
	if nStage == MAX_STAGE then	
		return TB_STAGE_INFO[nRoute][0][3][1],TB_STAGE_INFO[nRoute][0][3][2];	--��ʱ�䣬ҪɱNPC����
	else
		return TB_STAGE_INFO[nRoute][nDiff][2][nStage],TB_STAGE_INFO[nRoute][nDiff][3][nStage];	--��ʱ�䣬ҪɱNPC����
	end;
end;
--�ύʱ�䵽���ݿ�
function BR_UpDateTimeRecord(nDiff,nTime,nPIdx)
	local nRoute = GetMissionV(MV_ROUTE);
	local nTaskID = TSK_BEST_RECORD_BEGIN+nDiff-1;
	local nBestRecord = GetTask(nTaskID,nPIdx);
	if nBestRecord == 0 then
		nBestRecord = nTime;
	end;
	SetMissionV(MV_TOTAL_TIME,0);
	if nTime <= nBestRecord then
		SetTask(nTaskID,nTime, 0, nPIdx);
		AddRelayShareData(BACKROOM_RELAY_KEY,nRoute,nDiff,"","",1,GetName(nPIdx),"d",nTime);
		return 1;
	else
		return 0;
	end;
end;
--��ʼ���ؿ�
function BR_InitStage(nDiff,nStage)
	local nCurTime = GetTime();
	SetMissionV(MV_BEGIN_TIME,nCurTime);	--��ʼ��ʱ
	SetMissionV(MV_NSC_KILL_NPC_COUNT,0);
	if nDiff == 8 or nDiff == 9 then --20080825 ����8��9ѭ�����ܸ���װ������
		BR_LockEquipment(1);
	end
	if nStage == MAX_STAGE then
		BR_CreateBoss(nDiff);
	else
		BR_CreateStageNpc(nDiff,nStage);	
	end;
	BR_ChangeMSState(MS_STATE_STARTED);
	local nTime,nNpcCount = BR_GetStageInfo(nDiff,nStage);
	local nLoop = BR_TransformTime2Loop(MS_STATE_STARTED,nTime);
	BR_SetStageTimerLoop(nLoop);
	BR_InitStageEven(nDiff,nStage);
	BR_StartTimeGuage("T�ng th�i gian  ",nTime,0,0);
	SetMissionV(MV_NSC_NEED_KILL_NUMBER,nNpcCount);
	Msg2MSAll(MISSION_ID,"Th�i h�n: "..tf_GetTimeString(nTime)..". S� th� v� c�n ph�i ��nh b�i �� qua c�a: "..nNpcCount);
end;
--ת��Mission��ǰ״̬
function BR_ChangeMSState(nState)
	SetMissionV(MV_MISSION_STATE,nState);
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	elseif nState == MS_STATE_SHORT_PAUSE then
		SetMissionV(MV_TIMER_LOOP,SHORT_PAUSE_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,SHORT_PAUSE_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	elseif nState == MS_STATE_END_WAITING then
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--�ָ����״̬
function BR_RestorePlayer()
	local nOldPIdx = PlayerIndex;
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	Restore();
	RestoreNeili();
	ClearColdDown();	--�������ҩCD
	CastState("imme_clear_skill_interval",-1,0);	--�������м��ܵ���ȴʱ��
	PlayerIndex = nOldPIdx;
end;
--��������
function BR_CreateAwardBox(nDiff,nStage,nPIdx)
	local nFaction = GetMissionV(MV_FACTION);
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nMapID,nMapX,nMapY = GetWorldPos();
	local nNpcIdx = CreateNpc("R��ng ti�n",""..TB_DIFF_NAME[nDiff].."�� kh� �i "..nStage.."��ng b�o r��ng",nMapID,nMapX,nMapY);
	gf_SetUnitCurState(nNpcIdx,1,nDiff);
	gf_SetUnitCurState(nNpcIdx,2,nStage);
	gf_SetUnitCurState(nNpcIdx,3,0);	--����Ϊδʰȡ
	SetNpcScript(nNpcIdx,"\\script\\task\\faction_back_room\\npc_box.lua");
	PlayerIndex = nOldPIdx;
end;
--��ʼ���ؿ����á�ͳһ��ں���
function BR_InitStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_INIT_STAGE_FUN[nRoute] ~= nil then
		TB_INIT_STAGE_FUN[nRoute](nDiff,nStage);
	end;
end;
--ִ�йؿ��¼���ͳһ��ں���
function BR_ProcStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_PROC_STAGE_EVEN_FUN[nRoute] ~= nil then
		TB_PROC_STAGE_EVEN_FUN[nRoute](nDiff,nStage);
	end;
end;
--����ʼ���ؿ����á�ͳһ��ں���
function BR_UnInitStageEven(nDiff,nStage)
	local nRoute = GetMissionV(MV_ROUTE);
	if TB_UNINIT_STAGE_FUN[nRoute] ~= nil then
		TB_UNINIT_STAGE_FUN[nRoute](nDiff,nStage);
	end;
	BR_CastPlayerState("");
	BR_ClearNSCValue();
	local nMapID = BR_GetCurMapID();
	BR_ClearMapNpcSafe(nMapID);
	BR_StopTimeGuage(-2);
	if DEBUG_VERSION == 1 then
		BR_CreateDisciple();
	end;
end;
--���MS_STATE_STARTED�׶μ�ʱ����ǰλ��
--����1��ʾʱ�䣬����2Ϊ0ʱ��ʾ�жϵ�ǰ��ʱ���Ƿ��ڲ���1�����ʱ�����
--����2Ϊ1ʱ��ʾ��ǰ��ʱ���Ƿ����Բ���1Ϊ�����ʱ����ϣ�����2Ĭ��ֵΪ1
--���������Ϊ10,0ʱ�����ڼ�ʱ��ʱ��Ϊ10��ʱ��������1,����ʱ�䷵��0��
--���������Ϊ10,1ʱ�����ʱ��ʱ��Ϊ10,20,30,40......ʱ����1,����ʱ�䷵��0
--�������1����ֵ���Ǽ�ʱ��ʱ�������������������¶���
function BR_CheckTimerPosition(nStartTime,nTime,bInterval)
	bInterval = bInterval or 1;
	local nLoop = floor(nTime/(STARTED_TIMER_INTERVAL*60));
	local nStartLoop = floor(nStartTime/(STARTED_TIMER_INTERVAL*60));
	local nCurLoop = BR_GetStageTimerLoop();
	local nDiff = BR_GetCurDiff();
	local nStage = BR_GetCurStage();
	local nTime = BR_GetStageInfo(nDiff,nStage);
	local nTotalLoop = BR_TransformTime2Loop(MS_STATE_STARTED,nTime);
	if nTotalLoop - nCurLoop < nStartLoop then
		return 0;
	end;
	nCurLoop = nCurLoop + nStartLoop;
	if bInterval == 1 then
		if mod(nTotalLoop - nCurLoop + 1,nLoop) == 0 then
			return 1;
		else
			return 0;
		end;
	else
		if nTotalLoop - nCurLoop + 1 == nLoop then
			return 1;
		else
			return 0;
		end;
	end;
end;
--����Ҽ�״̬�����������Ϊ""���Ƴ��������������ʱ״̬
function BR_CastPlayerState(szState,nValue,nTime,bForceInstead,nID)
	local nOldPIdx = PlayerIndex
	nValue = nValue or 0;
	nTime = nTime or -1;
	bForceInstead = bForceInstead or 1;
	nID = nID or 0;
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	if szState == "" then
		gf_RemoveTempState();
	else
		CastState(szState,nValue,nTime*18,bForceInstead,TEMP_STATE_BEGIN+nID);
	end;
	PlayerIndex = nOldPIdx;
end;
--��õ�ǰ��ͼID
function BR_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;
--��ó��ص�MSUID
function BR_GetMSUID()
	return GetMissionV(MV_MISSION_UID);
end;
--���������¼NPC������Mission����
function BR_ClearNpcIndex()
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		SetMissionV(i,0);
	end;
end;
--�������NSC(New-Stage-Clear)����,������NPC�����ı���
function BR_ClearNSCValue()
	for i=MV_NSC_BEGIN,MV_NSC_END do
		SetMissionV(i,0);
	end;
	BR_ClearNpcIndex();
end;
--�Ƴ�һ��NPC����
function BR_RemoveNpcIndex(nNpcIdx)
	nNpcIdx = tonumber(nNpcIdx);
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		if GetMissionV(i) == nNpcIdx then
			SetMissionV(i,0);
			return 1;
		end;
	end;
	gf_ShowDebugInfor("BR_RemoveNpcIndex nh�n nNpcIdx kh�ng � bi�n l��ng k� l�c trong Mission");
	WriteLog(LOG_ERR_HEADER.."BR_RemoveNpcIndex nh�n nNpcIdx kh�ng � bi�n l��ng k� l�c trong Mission");
	return 0;
end;
--���һ�����õ�MissionV�������������������¼NPC����
function BR_GetNPCMissionV()
	for i=MV_NPC_INDEX_BEGING,MV_NPC_INDEX_END do
		if GetMissionV(i) == 0 then
			return i;
		end;
	end;
	return 0;
end;
--����һ��NPC�����λ�ã���ָ����Ӫ������������ʱ��
function BR_CreateFellow(szModelName,szNpcName,nCount,nCamp,tbPos,nLifeTime)
	local nNpcIdx = 0;
	local nMapID = BR_GetCurMapID();
	local nPosIdx = 0;
	local nPosSize = getn(tbPos);
	local tbTemp = gf_CopyTable(tbPos);	--����һ���µ�table
	local tbNpcIdx = {};
	for i=1,nCount do
		nPosIdx = random(1,getn(tbTemp));
		nMapX = tbTemp[nPosIdx][1];
		nMapY = tbTemp[nPosIdx][2];
		nNpcIdx = BR_CreateNpc(szModelName,szNpcName,nMapID,nMapX,nMapY,nCamp);
		tinsert(tbNpcIdx,nNpcIdx);
		if nLifeTime ~= nil then
			SetNpcLifeTime(nNpcIdx,nLifeTime);
		end;
		tremove(tbTemp,nPosIdx);
	end;
	return tbNpcIdx;
end;
--�������
function BR_SaveRecord(nDiff,nStage,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex
	if nDiff > MAX_DIFFICULTY_LEVEL then	--��������ѭ�����ؿ��Ͳ��浵��
		SetTask(TSK_WC_LAST_RECORD,0);	--ͨȫ�غ��嵵
		SetTask(TSK_WC_FAIL_TIMES,GetTask(TSK_WC_FAIL_TIMES)+1);
		Msg2MSAll(MISSION_ID,"�� xo� d� li�u, ��y l� l�n xo� th� "..GetTask(TSK_WC_FAIL_TIMES).." trong tu�n c�a b�n ");
		return 0;
	end;
	local nRecord = nDiff*100+nStage;
	SetTask(TSK_WC_LAST_RECORD,nRecord);
	Msg2MSAll(MISSION_ID,"Ti�n �� �� l�u: "..TB_DIFF_NAME[nDiff].."�� kh� �i "..nStage..".");
	PlayerIndex = nOldPIdx;
end;
--��ý��ȱ�����Ϣ
function BR_GetSaveRecord()
	local nRecord = GetTask(TSK_WC_LAST_RECORD);
	local nDiff = floor(nRecord/100);
	local nStage = mod(nRecord,100);
	return nDiff,nStage;
end;
--�رչؿ�
function BR_CloseStage()
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	CloseMission(MISSION_ID);
	if UNCOMPLETED_VERSION ~= 1 then
		local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMapҲ�����CloseMisssion
		if nRetCode ~= 0 then
			WriteLog(LOG_ERR_HEADER.."FreeDynamicMap ph�t sinh l�i, nRetCode:"..nRetCode);
		end;
	end;
end;
--�޸�NPCѪ��������1��NPC����������2��Ѫ��ֵ������3������ֵ���Ǿ���ֵ��1Ϊ����0Ϊ����������4���Ƿ�Ϊ�ٷֱȣ�1��ʾ�ǣ�0��ʾ���ǣ�Ĭ����1��
function BR_ModifyNpcLife(nNpcIdx,nValue,nFlag,bPercent)
	bPercent = bPercent or 1;
	if bPercent == 0 then	--������ǰٷֱ�
		ModifyNpcData(nNpcIdx,0,nValue,nFlag);
		return 0;
	end;
	local nNpcMaxLife = GetUnitCurStates(nNpcIdx,1);	
	local nDamage = floor(nNpcMaxLife*nValue/100);	--���ݰٷֱ�������ı��Ѫ��
	ModifyNpcData(nNpcIdx,0,nDamage,nFlag);
end;
--����ͼ�ǲ�����ȷ��
function BR_CheckMissionName()
	local nMSUID = BR_GetMSUID();
	if GetMissionS(MS_MISSION_NAME) == MISSION_NAME..nMSUID then
		return 1;
	else
		return 0;
	end;
end;
--��װ��CreateNpc
function BR_CreateNpc(szModelName,szName,nMapID,nMapX,nMapY,nCamp)
	nCamp = nCamp or CAMP_ENEMY;	--Ĭ��Ϊ�ж���Ӫ
	local nNpcIdx = CreateNpc(szModelName,szName,nMapID,nMapX,nMapY);	
	SetCampToNpc(nNpcIdx,TB_CAMP_NAME[nCamp]);
	return nNpcIdx;
end;
--��ȫɾ����ͼ�ϵ�����NPC
function BR_ClearMapNpcSafe(nMapID)
	if BR_CheckMissionName() == 1 then
		ClearMapNpc(nMapID);
		return 1;
	else
		WriteLog(LOG_ERR_HEADER.."H�m s� BR_ClearMapNpcSafe ph�t sinh l�i khi ki�m tra b�n ��");
		return 0;
	end;
end;
--����ʱ�������
function BR_StartTimeGuage(szInfo,Duration,bRepeat,nCustomID)
	local nOldPIdx = PlayerIndex
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	StartTimeGuage(szInfo,Duration,bRepeat,nCustomID);
	PlayerIndex = nOldPIdx;
end;
--ֹͣʱ�������
function BR_StopTimeGuage(nCustomID)
	local nOldPIdx = PlayerIndex
	PlayerIndex = GetMissionV(MV_PLAYERINDEX);
	StopTimeGuage(nCustomID);
	PlayerIndex = nOldPIdx;
end;

--����ͼ�Ƿ�Ϊ�Ϸ��Ŀɽ������ҵĵ�ͼ
function BR_CheckEntryMapID(nMapID)
	for i,v in TB_EXIT_POS do
		if i == nMapID then
			return 1;
		end;
	end;
	return 0;
end;
--��鵱ǰ��ͼ�ǲ��ǳ��е�ͼ
function BR_CheckCityMapID()
	local nMapID = GetWorldPos();
	local tb = {100,150,200,300,350,400,500};	--�ߴ���С�Ӧ�ò����������˰ɣ�
	for i=1,getn(tb) do
		if nMapID == tb[i] then
			return 1;
		end;
	end;
	return 0;
end;
--��ȫ�ɿ��Ĵ���
function BR_SafeTransmission()
	for i,v in TB_EXIT_POS do
		if SubWorldID2Idx(i) ~= -1 then	--������ŵ�ͼ�ڵ�ǰ�������б�����
			NewWorld(i,TB_EXIT_POS[i][1],TB_EXIT_POS[i][2]);
		end;
	end;
end;
--ʰȡ�����ý���
function BR_GetBoxAward(nDiff,nStage)
	local tbDropInfo = TB_DROP_INFO[nDiff][nStage];
	local nFaction = GetPlayerFaction();
	for i=1,getn(tbDropInfo) do
		local nCount = tbDropInfo[i];
		local nRand = 0;
		if nCount > 0 then
			if nCount >= 2 then	--��ֵ���ڵ���2����Ʒ������30%���ʵ���������1����30%���ʵ���������1����40%���ʲ���
				nRand = random(1,100);
				if nRand <= 30 then
					nCount = nCount - 1;
				elseif nRand <= 60 then
					nCount = nCount + 1;
				end;
			end;
			AddItem(TB_TOTEM_INFO[nFaction][i][1],TB_TOTEM_INFO[nFaction][i][2],TB_TOTEM_INFO[nFaction][i][3],nCount);
			Msg2Player("B�n nh�n ���c "..nCount.."c�i"..TB_TOTEM_INFO[nFaction][i][4]);
		end;
	end;
	local nExp = 0;
	local nGongXian = 0;
	if IB_VERSION == 1 then	--�����
		nExp = 160000;
		nGongXian = 25;
	else	--�շ���
		nExp = 250000;
		nGongXian = 40;	
	end;
	ModifyExp(nExp);
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m");
	local nCurGongXian = GetTask(336);
	if nCurGongXian > 12500 then
		Msg2Player("Hi�n t�i �i�m c�ng hi�n s� m�n c�a b�n �� v��t qu� 12500 �i�m, kh�ng th� nh�n ���c ph�n th��ng �i�m c�ng hi�n � m�t th�t s� m�n n�a");
	else
		SetTask(336,nCurGongXian+nGongXian);
		Msg2Player("B�n nh�n ���c "..nGongXian.." �i�m c�ng hi�n S� M�n ");
	end;
	Msg2Player("B�n �� nh�n r�i"..TB_DIFF_NAME[nDiff].."�� kh� �i "..nStage.."R��ng c�a �i");
	WriteLog(LOG_HEADER..GetName().." nh�n �� kh�"..nDiff.."th�"..nStage..".	");
end;
--����ÿ��ǰ�ļ��
function BR_EnterNextStageCheck(nDiff,nStage,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	if PlayerIndex == 0 then
		return 0;
	end;
	if BR_CheckLevel(nDiff,nStage) == 0 then
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	if BR_CheckTitle(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	if BR_CheckEquipment(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	if BR_CheckRouteFeature(nDiff,nStage) == 1 then
		PlayerIndex = nOldPIdx;
		return 1;
	end;
	PlayerIndex = nOldPIdx;
	return 0;
end;
function BR_CheckLevel(nDiff,nStage)
	local nLevel = GetLevel();
	local tbLevelNeed = {50,50,50,50,50,70,70,85,85};
	if nLevel < tbLevelNeed[nDiff] then
		return 0;
	end;
end;
--���ƺ�
function BR_CheckTitle(nDiff,nStage)
	local nTitleID1,nTitleID2 = GetCurTitle();
	if nDiff <= 5 then
		return 1;
	end;
	if nDiff == 8 or nDiff == 9 then  --8��9�ѶȲ��ж�
		return 0;
	end;
	local tbTitleNeed = 	--�������гƺ���Ϣ
	{
		[1] = {{30,11},{30,5}},	--����
		[2] = {{30,12},{30,6}},	--Ԫ˧
		[3] = {{51,1},{51,2},{51,5},{51,6},{51,9},{51,10}},	--����
		[4] = {{51,3},{51,7},{51,11}},	--��ʦ
		[5] = {{51,4},{51,8},{51,12}},	--����
		[6] = {{30,4},{30,10}},	--�ȷ�
		[7] = {{30,3},{30,9}},	--��ͳ
	}
	local tbCheck = 	--������Ѷ���Ҫ���ĳƺ�����
	{
		[1] = nil,
		[2] = nil,
		[3] = nil,
		[4] = nil,
		[5] = nil,
		[6] = {1,2,3,4,5,6,7},
		[7] = {1,2,3,4,5,6,7},
		[8] = {1,2,3},
		[9] = {1,2,3},
	}
	local tbTitleInfo = tbCheck[nDiff];
	if tbTitleInfo == nil then
		return 1;
	end;
	local nTitleType = 0;
	for i=1,getn(tbTitleInfo) do
		nTitleType = tbTitleInfo[i];
		for j=1,getn(tbTitleNeed[nTitleType]) do
			if nTitleID1 == tbTitleNeed[nTitleType][j][1] and nTitleID2 == tbTitleNeed[nTitleType][j][2] then
				return 1;
			end;
		end;	
	end;
	return 0;
end;
--���װ��
function BR_CheckEquipment(nDiff,nStage)
	if nDiff <= 5 then
		return 1;
	end;
	if (BR_CheckYanDiEquip() == 1 or BR_CheckHuangDiEquip() == 1 or BR_CheckTDXHEquip() == 1) and nDiff ~= 8 and nDiff ~= 9 then --8��9��ֻ�ܴ�ʦ�ŵ�4��
		return 1;
	end;
	if nDiff == 6 or nDiff == 7 then
		if BR_CheckFactionEquip(3,2) == 1 or BR_CheckFactionEquip(4,2) == 1 or BR_CheckFactionEquip(5,3) == 1 then
			return 1;
		end;
	end;
	if nDiff == 8 or nDiff == 9 then
		if BR_CheckFactionEquip(4,6) == 1 then
			return 1;
		end;	
	end;
	return 0;
end;
--����׵�װ
function BR_CheckYanDiEquip()
	local nSuitID1 = GetEquipSuitID(GetPlayerEquipIndex(0));
	local nSuitID2 = GetEquipSuitID(GetPlayerEquipIndex(1));
	local nSuitID3 = GetEquipSuitID(GetPlayerEquipIndex(3));
	local nBody = GetBody();
	if (nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 80000+nBody) or (nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 80064+nBody) then
		return 1;
	else
		return 0;
	end;
end;
--���Ƶ�
function BR_CheckHuangDiEquip()
	local nRoute = GetPlayerRoute();
	local nSuitID1 = GetEquipSuitID(GetPlayerEquipIndex(2));
	local nSuitID2 = GetEquipSuitID(GetPlayerEquipIndex(4));
	local nSuitID3 = GetEquipSuitID(GetPlayerEquipIndex(5));
	local nCheckRetCode,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRetCode ~= 1 then
		return 0;
	end;
	if nSuitID1 == nSuitID2 and nSuitID1 == nSuitID3 and nSuitID1 == 88000+nRoutePos then
		return 1;
	else
		return 0;
	end;
end;
--����������
function BR_CheckTDXHEquip()
	local nEquipIdx1 = GetPlayerEquipIndex(0);	--ͷ
	local nEquipIdx2 = GetPlayerEquipIndex(1);	--��
	local nEquipIdx3 = GetPlayerEquipIndex(2);	--����
	local nEquipIdx4 = GetPlayerEquipIndex(3);	--����
	local nID1,nID2,nID3 = 0,0,0;
	local nBody = GetBody();
	local tbTDXHWeapon = 
	{
		{0,3,67},{0,8,100},{0,0,17},{0,1,56},{0,2,39},{0,10,78},{0,0,17},
		{0,5,43},{0,2,39},{0,9,89},{0,6,111},{0,4,122},{0,11,15},{0,7,15},
	}
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx1);	--ͷ
	if nID1 ~= 0 or nID2 ~= 103 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx2);--��
	if nID1 ~= 0 or nID2 ~= 100 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx3);--����
	local bWeaponCheck = 0;
	for i=1,getn(tbTDXHWeapon) do
		if nID1 == tbTDXHWeapon[i][1] and nID2 == tbTDXHWeapon[i][2] and nID3 == tbTDXHWeapon[i][3] then
			bWeaponCheck = 1;
		end;
	end;
	if bWeaponCheck == 0 then
		return 0;
	end;
	nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx4);--����
	if nID1 ~= 0 or nID2 ~= 101 or nID3 ~= 85+nBody-1 then
		return 0;
	end;
	return 1;
end;
--���ʦ��װ��,����nGen��ʾ�ڼ��ף�nNum����ͼ�����
function BR_CheckFactionEquip(nGen,nNum)
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	local nFaction = GetPlayerFaction();
	local nSuitID = nRoute*1000+(nGen-1)*10+nBody;
	if nFaction == 3 then	--����Ƕ���
		nSuitID = nSuitID - 2;
	end;
	local nCheckNum = 0;
	local nEquipIdx = 0;
	for i=1,6 do	--���ͷ�¿���������1����2
		nEquipIdx = GetPlayerEquipIndex(i-1);
		if GetEquipSuitID(nEquipIdx) == nSuitID then
			nCheckNum = nCheckNum + 1;
		end;
	end;
	if nCheckNum >= nNum then
		return 1;
	else
		return 0;
	end;
end;
--���������ɫ
function BR_CheckRouteFeature(nDiff,nStage)
	if gf_CheckPlayerRoute() == 0 then
		return 0;
	end;
	local nRoute = GetPlayerRoute();
	if nDiff <= 5 then
		return 1;
	end;
	if nDiff == 8 or nDiff == 9 then  --8��9�ѶȲ��ж�
		return 0;
	end;	
	local nLL = GetAllStrength() - GetStrength();		--����1
	local nSF = GetAllDexterity() - GetDexterity();		--��2
	local nNG = GetAllEnergy() - GetEnergy();			--�ڹ�3
	local nDC = GetAllObserve() - GetObserve();			--����4
	local nGG = GetAllVitality() - GetVitality();		--����5
	local tbPro = {nLL,nSF,nNG,nDC,nGG};
	local tbRouteFeature = 
	{	--{{����1,����2},{45ѭ��������ֵ,67ѭ��������ֵ,89ѭ��������ֵ}}
		 [0] = {},
		 [1] = {},	
		 [2] = {{{1,5},{225,275,400}}},	--�����׼�
		 [3] = {{{3,5},{210,255,380}}},	--������ɮ
		 [4] = {{{3,5},{200,245,370}}},	--������ɮ
		 [5] = {},			--����
		 [6] = {{{1,2},{180,225,350}},{{2,3},{160,215,340}}},	--����
		 [7] = {},			--����
		 [8] = {{{3,5},{200,245,370}}},	--���ҷ��
		 [9] = {{{2,3},{165,215,340}},{{3,5},{185,230,350}}},	--�����׼�
		[10] = {},			--ؤ��
		[11] = {{{1,5},{220,265,390}}},--ؤ�ﾻ��
		[12] = {{{2,4},{110,155,280}},{{1,2},{160,205,330}}},--ؤ������
		[13] = {},			--�䵱
		[14] = {{{3,4},{170,215,340}},{{2,3},{150,195,320}}},--�䵱����
		[15] = {{{2,4},{110,155,280}},{{1,4},{160,205,330}}},--�䵱�׼�
		[16] = {},			--����
		[17] = {{{1,5},{220,265,390}}},--����ǹ��
		[18] = {{{1,2},{180,225,370}}},--���Ź���
		[19] = {},			--�嶾
		[20] = {{{1,2},{180,225,370}}},--�嶾а��
		[21] = {{{3,4},{160,205,330}},{{4,5},{150,195,320}}},--�嶾��ʦ
	}
	local nIndex = 0;
	if nDiff == 4 or nDiff == 5 then
		nIndex = 1;
	elseif nDiff == 6 or nDiff == 7 then	--080505�޸ģ�67�Ѷȸ�Ϊ��45�Ѷ�һ��
		nIndex = 1;
	elseif nDiff == 8 or nDiff == 9 then
		nIndex = 3;
	end;
	local tbInfo = {};
	for i=1,getn(tbRouteFeature[nRoute]) do
		tbInfo = tbRouteFeature[nRoute][i];
		if tbPro[tbInfo[1][1]]+tbPro[tbInfo[1][2]] >= tbInfo[2][nIndex] then
			return 1;
		end;
	end;
	return 0; 
end;
--��NPC������Ч
function BR_SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat)
	nPos = nPos or 2;	--Ĭ����ͷ����
	bRepeat = bRepeat or 0;	--Ĭ�ϲ�ѭ��
	if IsNpcDeath(nNpcIdx) == 0 then	--���NPC�����žͲ�����Ч
		SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat);
	end;
end;
--����Ҳ�����Ч
function BR_SetCurrentPlayerSFX(nEffectID,nPos,bRepeat)
	local nPIdx = GetMissionV(MV_PLAYERINDEX);
	if nPIdx == 0 then
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nNpcIdx = PIdx2NpcIdx(nPIdx);	--��ָ��Ҫ��PlayerIndex��Ч������²���������
	BR_SetCurrentNpcSFX(nNpcIdx,nEffectID,nPos,bRepeat);
	PlayerIndex = nOldPIdx;
	return 1;
end;
--���������װ��
function BR_LockEquipment(bLock)
	local tbEquipPos = {0,1,2,3,4,5};
	for i=1,getn(tbEquipPos) do
		ForbidEquipSolt(tbEquipPos[i],bLock);
	end;
end;
--===================================================================================
function BR_KnowLimit()
	local selTab = {
			". 6, 7 tu�n ho�n (��n c�p 70)/backroom_know_limit_2",
			". 8, 9 tu�n ho�n (��n c�p 85)/backroom_know_limit_3",
			"* Quay l�i/main",
			". K�t th�c ��i tho�i/nothing",
			}
	Say(g_szInforHeader.."1, 2, 3, 4, 5 tu�n ho�n, ��n c�p 50 c� th� tham gia.",getn(selTab),selTab);
end;

function backroom_know_limit_2()
	Talk(2,"backroom_know_limit_2_1","Ph�i �� t� c�ch 1 trong nh�ng �i�u ki�n b�n d��i: \nDanh hi�u: m�t trong b�t k� danh hi�u t��ng qu�n, nguy�n so�i, ti�n phong, �� th�ng, th�nh ch� qu�n s�, danh b�\nTrang b�: m�t trong b�t k� �� b� vi�m ��,  thien chi vi�m ��, ho�ng ��, thi�n ��a huy�n ho�ng, 2 m�n s� m�n b� 3 tr� l�n, 2 m�n s� m�n b� 4 tr� l�n\n    Thi�u L�m t�c gia: trang b�, tr�ng th�i c�ng v�i h� ph�i c� t�t c� c�c tr� s� s�c m�nh g�n c�t c�ng l�i h�n 225\n    Thi�u L�m v� t�ng:  trang b�, tr�ng th�i c�ng  c�c thu�c t�nh t�ng n�i c�ng v� g�n c�t c�ng l�i ph�i h�n 200 �i�m","    Thi�u L�m thi�n t�ng: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng g�n c�t, n�i c�ng t�ng c�ng h�n 210 �i�m\n    ���ng M�n: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, s�c m�nh t�ng c�ng h�n 180 �i�m ho�c t�ng th�n ph�p, n�i c�ng t�ng c�ng h�n 160 �i�m\n    Nga My ph�t gia: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng g�n c�t, n�i c�ng t�ng c�ng h�n 200 �i�m\n    Nga My t�c gia: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, n�i c�ng t�ng c�ng h�n 165 �i�m ho�c t�ng g�n c�t, n�i c�ng t�ng c�ng h�n 185 �i�m");

end;

function backroom_know_limit_2_1()
	Talk(2,"BR_KnowLimit","    C�i Bang t�nh y: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng g�n c�t, s�c m�nh t�ng c�ng h�n 220 �i�m\n    C�i Bang � y: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, nhanh nh�n t�ng c�ng h�n 110 �i�m ho�c t�ng th�n ph�p, s�c m�nh t�ng c�ng h�n 160 �i�m\n    V� �ang ��o gia: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng n�i c�ng, nhanh nh�n t�ng c�ng h�n 170 �i�m ho�c t�ng n�i c�ng, th�n ph�p t�ng c�ng h�n 150 �i�m\n    V� �ang t�c gia: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng nhanh nh�n, th�n ph�p t�ng c�ng h�n 110 �i�m ho�c t�ng nhanh nh�n, s�c m�nh t�ng c�ng h�n 160 �i�m","    D��ng M�n th��ng k�: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng s�c m�nh, g�n c�t t�ng c�ng h�n 220 �i�m\n    D��ng M�n cung k�: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, s�c m�nh t�ng c�ng h�n 180 �i�m\n    Ng� ��c t� hi�p: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, s�c m�nh t�ng c�ng h�n 180 �i�m\n    Ng� ��c c� s�: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng nhanh nh�n, n�i c�ng t�ng c�ng h�n 160 �i�m ho�c nhanh nh�n, g�n c�t t�ng c�ng h�n 150 �i�m");
end;

function backroom_know_limit_3()
--	Talk(2,"backroom_know_limit_3_1","�����������������κ�һ�ּ��ɣ�\n�ƺţ��ֳ�������Ԫ˧����ͳ���ȷ棬��������ʦ�������κ�һ��\nװ���������׵�ȫ�ף��Ƶ�ȫ�ף��������ȫ�ף�ʦ�ŵ�3��4���������ϣ�ʦ�ŵ�4��4�����������κ�һ��\n    �����׼ң�װ��,״̬�Լ����ɶ������Լӳ����ӵ�����������ֵ����400��","    ������ɮ��װ����״̬�Լ����ɶ������Լӳɵ��ڹ�������ֵ����370��\n    ������ɮ��װ����״̬�Լ����ɶ������Լӳɵ��ڹ�������ֵ����380��\n    ���ţ�װ����״̬�Լ����ɶ������Լӳɵ���������ֵ����350��������ڹ���ֵ����340��\n    ���ҷ�ң�װ����״̬�Լ����ɶ������Լӳɵ��ڹ�������ֵ����370��\n    �����׼ң�װ����״̬�Լ����ɶ������Լӳɵ��ڹ�����ֵ����340������ڹ�������ֵ����350��");
	Talk(1,"BR_KnowLimit","8, 9 tu�n ho�n, ch� c� th� m�c b� trang b� s� m�n 4, trong qu� tr�nh v��t �i kh�ng ���c thay ��i trang b�.")
end;

function backroom_know_limit_3_1()
	Talk(2,"BR_KnowLimit","    C�i Bang t�nh y: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng s�c m�nh, g�n c�t t�ng c�ng h�n 390 �i�m\n    C�i Bang � y: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, nhanh nh�n t�ng c�ng h�n 280 �i�m ho�c t�ng th�n ph�p, s�c m�nh t�ng c�ng h�n 330 �i�m\n    V� �ang ��o gia: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng n�i c�ng, nhanh nh�n t�ng c�ng h�n 340 �i�m ho�c n�i c�ng, th�n ph�p t�ng c�ng h�n 320 �i�m\n    V� �ang t�c gia: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng nhanh nh�n, th�n ph�p t�ng c�ng h�n 280 �i�m ho�c t�ng nhanh nh�n, s�c m�nh t�ng c�ng h�n 330 �i�m","    D��ng M�n th��ng k�: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng s�c m�nh, g�n c�t t�ng c�ng h�n 390 �i�m\n    D��ng M�n cung k�: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, s�c m�nh t�ng c�ng h�n 370 �i�m\n    Ng� ��c t� hi�p: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng th�n ph�p, s�c m�nh t�ng c�ng h�n 370 �i�m\n    Ng� ��c c� s�: trang b�, tr�ng th�i, thu�c t�nh l�u ph�i t�ng nhanh nh�n, n�i c�ng t�ng c�ng h�n 330 �i�m ho�c t�ng nhanh nh�n, g�n c�t t�ng c�ng h�n 320 �i�m");
end;

function nothing()

end;