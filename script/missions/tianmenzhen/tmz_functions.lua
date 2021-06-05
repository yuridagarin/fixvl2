
Include("\\script\\missions\\tianmenzhen\\tmz_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\function\\vip_card\\vc_head.lua")

g_FunctionFile = "\\script\\missions\\tianmenzhen\\tmz_functions.lua";

--��Ҫд�����ݿ�ı���
tRelayTask = {
	TASk_TMZ_TONG_TOTAL_NUM,
	TASK_TMZ_TONG_AWARD_WEEK,
	TASk_TMZ_TONG_WEEK_WIN,
	TASk_TMZ_TONG_WEEK_LOSE,
	TASKID_TMZ_BOSS,
};

--��ʦ�ı���
tGushiTask = {
	2204,2216,2207,2222,2219,2210,2228,2213,2225,2231
};

--��ö�̬���ص�ͼID����������ش�����û�ж����ͼʱ����0,0,0
function TMZ_FindIdleRoom()
	local nCount = 0;
	local nMaxRoomNum = 0;
	nCount = TMZ_GetDynamicMapCount();
	nMaxRoomNum = MAX_ROOM_COUNT;
	if nCount >= nMaxRoomNum then
		return 0,0,0;
	end;
	local nMapID,nMapIdx = DynamicLoadMap(MAP_ID);
	return nMapID,nMapIdx,nCount;
end;

--��ȡ��ǰ���õ�ͼ����
function TMZ_GetDynamicMapCount()
	local tbMapID = gf_GetDataTable(GetSameMaps(MAP_ID));
	local nCount = 0;
	local nMapID = 0;
	for i = 1,getn(tbMapID) do
		if tbMapID[i] == MAP_ID then
			tremove(tbMapID,i);
		end
	end
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if mf_GetMissionV(MISSION_ID,MV_TMZ_LOAD,nMapID) == 1 then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;

--��ȡ��ǰ�ѿ����ĵ�ͼ�����ʺϽ�ȥ��
--�ȿ�˫����࣬�ٱȽ�����������һ�������
--������Ҫ����ս�������������غ��ʵĵ�ͼid������0��ʾĿǰû�к��ʵģ���Ҫ�¿���
function TMZ_GetSuitMap(nPlayerNum,nWaiting)
	local tbMapID = gf_GetDataTable(GetSameMaps(MAP_ID));
	local i = 1;
	while i <= getn(tbMapID) do
		if tbMapID[i] == MAP_ID then
			tremove(tbMapID,i);
		elseif mf_GetPlayerCount(MISSION_ID,CampOne_ID,tbMapID[i]) + nPlayerNum > PLAYER_MAX_NUM
			and mf_GetPlayerCount(MISSION_ID,CampTwo_ID,tbMapID[i]) + nPlayerNum > PLAYER_MAX_NUM then
			tremove(tbMapID, i);
		elseif mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_COMPLETE then
			tremove(tbMapID, i);
		elseif mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_PEACE and tmz_get_deff_time(tbMapID[i]) == 1 then
			tremove(tbMapID, i);
		--������4�����ϲ�Ҫ��
		elseif mf_GetMissionV(MISSION_ID,MV_TMZ_ERROR_NUM,tbMapID[i]) >= 4 then
			tremove(tbMapID, i);
		elseif mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_FIGHT then
			if mf_GetMissionV(MISSION_ID,MV_TIMER_LOOP,tbMapID[i]) < 120 then
--��ս��10���ӵĲ�Ҫ��
				tremove(tbMapID,i);
			elseif nWaiting == 1 then --��װ״̬
				tremove(tbMapID,i);
			else
				i = i + 1;
			end
		else
			i = i+1;
		end
	end
	if getn(tbMapID) == 0 then
		return 0;
	end
	if getn(tbMapID) > 1 then
		local  _sort = function(nMapID1,nMapID2)
			local bFightState1 = mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,nMapID1);
			local bFightState2 = mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,nMapID2);
			if bFightState1 == MS_STATE_FIGHT and bFightState2 ~= MS_STATE_FIGHT then
				return 1;
			end
			if bFightState1 ~= MS_STATE_FIGHT and bFightState2 == MS_STATE_FIGHT then
				return nil;
			end
			local nTotalNumOne = mf_GetPlayerCount(MISSION_ID,CampOne_ID,nMapID1)+mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nMapID1);
			local nTotalNumTwo = mf_GetPlayerCount(MISSION_ID,CampOne_ID,nMapID2)+mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nMapID2);
			if nTotalNumOne > nTotalNumTwo then
				return 1;
			else
				return nil;
			end
		end
		sort(tbMapID,_sort);
	end
	return tbMapID[1] or 0;
end

--����սʱ����ҽ��еĲ���
function TMZ_SetPlayerState(nCamp)
	local nMapId = GetMissionV(MV_TMZ_MAP_ID);
	CreateTrigger(3,LOG_ID,LOG_TRIGGER_ID);
--	LeaveTeam();	--�뿪����
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetDeathPunish(0);	--�������ͷ�
--	SetCreateTeam(1);	--�ر��齨����(���ߺ�ᱻ���)
	ForbitTrade(1);	--��ֹ����
	InteractiveEnable(0);	--�رս���	������NewWorld֮��ִ�в���Ч
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	ForbidChangePK(0);	--����ı�PK״̬
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--��ֹ�ı�PK״̬
	SetFightState(0);
	KillFollower();	--ɾ������
	SetMomentumBoundSwitch(1);	--��������ɱ��ֵ
	--������˲μӴ���
	ResetToNpcDamage();
	ResetToPlayerDamage();
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TASKID_TMZ_PLAY_DATE) < nDate then
		SetTask(TASKID_TMZ_PLAY_DATE,nDate);
		SetTask(TASKID_TMZ_PLAY_NUM,0);
	end
	if tmz_double_time() == 1 then
		SetTask(TASKID_TMZ_DOUBLE_EXP,2);
	else
		SetTask(TASKID_TMZ_DOUBLE_EXP,1);
	end
	SetTask(705,6);--ս��������Ϊ��ʹ��ս��ҩ
	tmz_clear_task_id(); --�������
	SetTempRevPos(nMapId,tPositionCamp[nCamp][1][1]*32,tPositionCamp[nCamp][1][2]*32);	--����������
	SetDeathScript(DEATH_SCRIPT);
	if nCamp == CampOne_ID then
		SetCampToPlayer(CampOne_Type);
	elseif nCamp == CampTwo_ID then
		SetCampToPlayer(CampTwo_Type);
	end
end;

--�콱��������
function tmz_clear_task_id()
	for i = 371,380 do
		SetTask(i,0);
	end
end

--�������Mission����
function TMZ_ClearMissionData()
	for i=1,10 do
		SetMissionS(i,"");
	end;
	for i=1,100 do
		SetMissionV(i,0);
	end;
end;

--�뿪ս��ʱ�����Ĵ���
function TMZ_RestorePlayerState()
	RemoveTrigger(GetTrigger(LOG_TRIGGER_ID));
	SetLogoutRV(0);
	SetDeathPunish(1);
--	SetCreateTeam(0);	
	InteractiveEnable(1);	
	UseScrollEnable(1);
	ForbidChangePK(0);	--����ı�PK״̬	
	SetPKFlag(0,0);	
	if GLB_TMZ_RealmCheck() == 1 then	
		ForbidChangePK(1);		
	else
		ForbitTrade(0);
		StallEnable(1);	
	end
	SetFightState(0);
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	SetCampToPlayer("");
	KillFollower();	--ɾ������
	SetMomentumBoundSwitch(0);
	RemvoeTempEffect(); --���������ϵ�������ʱ״̬
	--��ѩ��״̬
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
--	LeaveTeam();	--�뿪����
	TMZ_DeleteAllBattleItem();
	SetTask(705,0);
end;

--ɾ������ս����ص���Ʒ�����ܴ���ս����ģ�
function TMZ_DeleteAllBattleItem()
	local nItemCount = 0;
	for i=204,206 do
		nItemCount = BigGetItemCount(1,0,i);
		if nItemCount > 0 then
			BigDelItem(1,0,i,nItemCount)
		end;
	end;
	for i=3849,3854 do
		nItemCount = BigGetItemCount(2,1,i);
		if nItemCount > 0 then
			BigDelItem(2,1,i,nItemCount)
		end;
	end;
	nItemCount = BigGetItemCount(2,0,795);
	if nItemCount > 0 then
		BigDelItem(2,0,795,nItemCount)
	end;
end;

--�õ�ս�������������Ϣ
function TMZ_GetPlayerCount(nCamp)
	local nOldSubWorld = SubWorld;
	local nPlayerCount = 0;
	local nMapID = MAP_ID;
	local nMissionID = MISSION_ID;
	SubWorld = SubWorldID2Idx(nMapID);
	nPlayerCount = GetMSPlayerCount(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
	return nPlayerCount;
end;

--�õ������ս���е���Ӫ��ս���ⲻ���ô˺���
function TMZ_GetCamp()
	local nSignUpInfo = GetTask(TASKID_TMZ_PLAY_CAMP);
	if nSignUpInfo == 0 then
		return 0;
	end;
	if nSignUpInfo == 1 then
		return CampOne_ID;
	else
		return CampTwo_ID;
	end;
end;

--��Ҽ���ս��
function TMZ_JoinBattle(nCamp)
	CleanInteractive();	--��NewWorldǰ��ɢ˫�˻�������
	local nCampPlace = nCamp;
	local nMapID = gf_GetCurMapID();
	if NewWorld(nMapID,tPositionCamp[nCampPlace][1][1],tPositionCamp[nCampPlace][1][2]) == 1 then
		Msg2MSAll(MISSION_ID,GetName().." �� gia nh�p "..tCampName[nCamp]);
		Msg2Player("C�c h� �� gia nh�p r�i"..tCampName[nCamp]);
		TMZ_SetPlayerState(nCamp);
		AddMSPlayer(MISSION_ID,nCamp);
		SetTask(TASKID_TMZ_PLAY_CAMP,nCamp);
		tmz_get_game_loop();
		if GetMissionV(MV_TMZ_STATE) == MS_STATE_FIGHT then	--�������ս����ʼ������
			SetTaskTemp(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
		end;
		EnterChannel("Thi�n M�n tr�n"..nMapID);
		if nCamp == 1 then
			EnterChannel("Phe T�ng"..nMapID);
		else
			EnterChannel("Phe Li�u"..nMapID);
		end
		return 1;
	else
		return 0;
	end;
end;

--����뿪ս��
--��Ҫ�ּ������
function TMZ_LeaveBattle()
	local nCamp = TMZ_GetCamp();
	local nShowIdx = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	local sName = GetName();
	TMZ_RestorePlayerState();
	TMZ_Set_TableData_Nil();
	local tOutPos = {
		[300] = {1855,3672},
		[400] = {1437,2869},
	};
	local nEnrollMapId = GetTask(TASKID_TMZ_ENROLL_MAPID)
	if not(tOutPos[nEnrollMapId]) then
		nEnrollMapId = 400
	end
	local nCurMapId = GetWorldPos();
	if NewWorld(nEnrollMapId,tOutPos[nEnrollMapId][1],tOutPos[nEnrollMapId][2]) == 1 then
		local nBattleState = mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,nCurMapId);
		if nBattleState == MS_STATE_READY or nBattleState == MS_STATE_FIGHT then
			Msg2MSAll(MISSION_ID,tCampName[nCamp].."-"..GetName().."R�i kh�i chi�n tr��ng Thi�n M�n Tr�n");
		end;
		LeaveChannel("Thi�n M�n tr�n"..nCurMapId);
		if nCamp == 1 then
			LeaveChannel("Phe T�ng"..nCurMapId);
		else
			LeaveChannel("Phe Li�u"..nCurMapId);
		end
		return 1;
	else
		return 0;
	end;
end;

--���ں�Ӫͣ����̫�õ����ǿ�ƴ��͵�ս��
function TMZ_DrivePlayerOutOfShelter()
	if DRIVE_PLAYER_OUTOF_SHELTER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			local nLeftLoop = GetTaskTemp(PTT_DIE_LOOP) - GetMissionV(MV_TIMER_LOOP);
			if nLeftLoop >= 6 then --1����30��
				DoScriptByName(GetName(),"\\script\\missions\\tianmenzhen\\tmz_trap.lua","main");
				Msg2Player("B�n kh�ng th� l�u l�i trong h�u doanh");
			else
				Msg2Player("Th�i gian chu�n b� t�i h�u doanh c�n"..Get_Time_String((6-nLeftLoop)*15))
			end;
		end;
	end;
	TMZ_OperateAllPlayer(Func,{},ALL_ID);
end;

--����ǰ�����������ǿ���߳�ս��
function TMZ_KickDeather()
	if IsPlayerDeath() == 1 and GetFightState() == 1 then
		local nLeftLoop = GetTaskTemp(PTT_DIE_LOOP) - GetMissionV(MV_TIMER_LOOP);
		local nCmap = TMZ_GetCamp();
		if nLeftLoop >= 4 then --60s
			SetTask(TASKID_TMZ_JOIN_TIME,GetTime()); --����״̬
			DelMSPlayer(MISSION_ID,nCmap);
			TMZ_Set_TableData_Nil();
			Msg2MSAll(MISSION_ID,GetName().."R�i kh�i chi�n tr��ng.");
		end
		return 1;
	end;
	return 0;
end;

--��˯��������߳�ȥ
function TMZ_KickSleep()
	local nCmap = TMZ_GetCamp();
	if IsSleeping() == 1 then
		Talk(1,"",g_NpcName.."K� th� tr��c m�t v�y m� d�m ng� g�t, ng��i ��u l�i ra cho ta!");
		SetTask(TASKID_TMZ_JOIN_TIME,GetTime()); --����״̬
		DelMSPlayer(MISSION_ID,nCmap);
		TMZ_Set_TableData_Nil();
		Msg2MSAll(MISSION_ID,GetName().."R�i kh�i chi�n tr��ng.");
		return 1;
	end;
	return 0;
end

--��ʼ��ʱҪ���õ�һЩ״̬
function TMZ_InitBattle()
	local nDate = tonumber(date("%m%d%H%M%S"));
	SetMissionV(MV_TMZ_LOG_TIME,nDate);
	WriteLog("[chi�n tr��ng Thi�n M�n Tr�n mission]: ("..nDate..") kh�i ��ng 1 tr�n Thi�n M�n Tr�n mission. ");
	SetMissionV(MV_TIMER_LOOP,PEACE_TIMER_LOOP);
	StartMissionTimer(MISSION_ID,TIMER_ID,PEACE_TIME);
	SetMissionV(MV_TMZ_STATE,MS_STATE_PEACE);
	SetMissionV(MV_TMZ_GAME_LOOP,GetGameLoop());
end;

--��ʽ����ʱҪ���õ�һЩ״̬
function TMZ_RunBattle()
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	SetMissionV(MV_TIMER_LOOP,FIGHT_TIMER_LOOP);
	SetMissionV(MV_TMZ_STATE,MS_STATE_FIGHT);
	local Func = function(tArg)
		SetTaskTemp(PTT_DIE_LOOP,FIGHT_TIMER_LOOP);
	end;
	TMZ_OperateAllPlayer(Func,{},ALL_ID);
end;

--������������������д��ͽ����Ĺ���
function TMZ_ProcessBattleOver()
	local OldPlayerIndex = PlayerIndex;
	local IDTab = TMZ_GetMSPlayerIndex(ALL_ID);
	local nPlayerCount = getn(IDTab);
	local nShowIdx = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	local nDate = tonumber(date("%Y%m%d"));
	for i = 1,nPlayerCount do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			local nCamp = TMZ_GetCamp();
			local sName = GetName();
			local nWhoWin = GetMissionV(MV_TMZ_WINNER_CAMP);
--			if nWhoWin == nCamp then
--				Talk(1,"","������ս���Ѿ���������ϲ����ʤ��������<color=yellow>�������ｫ��<color>����ȡ������");
--			elseif nWhoWin == ALL_ID then
--				Talk(1,"","������ս���Ѿ�������˫�����ƽ�֡�����<color=yellow>�������ｫ��<color>����ȡ������");
--			else
--				Talk(1,"","������ս���Ѿ���������Ȼ���ڱ���ս��������ˣ����ǲ�Ҫ���٣��ٽ�����������<color=yellow>�������ｫ��<color>����ȡ������");
--			end

			local tCampPoint = {GetMissionV(MV_TMZ_CAMPONE_POINT),GetMissionV(MV_TMZ_CAMPTWO_POINT)};
			SetTask(TASKID_TMZ_PLAY_POINT,tCampPoint[nCamp]); --д�����
			--Observer:onEvent(OE_TMZ_Victory, tCampPoint[nCamp])
			SetTask(TASKID_TMZ_GET_DAMAGE,GetToNpcDamage()+GetToPlayerDamage()); --��¼�˺������
--			SetTask(TASKID_TMZ_GET_CURE,GetHealingCount());											 --��¼��Ч������
			if GetTask(TASKID_TMZ_PLAY_DATE) < nDate then
				SetTask(TASKID_TMZ_PLAY_DATE,nDate);
				SetTask(TASKID_TMZ_PLAY_NUM,0);
			end
			SetTask(TASKID_TMZ_PLAY_NUM,GetTask(TASKID_TMZ_PLAY_NUM)+1);
			if (tCampPoint[nCamp] >= 1000) then
				SetTask(TASKID_TMZ_PLAY_RESULT,2);
				--����vip��
				_vc_TMZ_Win();
			else
				SetTask(TASKID_TMZ_PLAY_RESULT,1);
			end
			SetTask(705,0);
			--����vip��
			_vc_JoinOnceTMZ();
			DelMSPlayer(MISSION_ID,nCamp);
		end
	end
	PlayerIndex = OldPlayerIndex;
end

--��Mission��ĳһ��Ӫ��ҽ���ͳһ����
--ʹ�÷������ȶ���һ��ִ�к���������������������Ϊһtable��
--Ȼ������������Ϊ��һ�����������OP_AllMSPlayer������
--ͨ����table�ķ�ʽ���Դ����������ִ�к�����
function TMZ_OperateAllPlayer(func,tArg,nCamp)
	local OldPlayerIndex = PlayerIndex;
	local IDTab = TMZ_GetMSPlayerIndex(nCamp);
	local nPlayerCount = getn(IDTab);
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				func(tArg);
			else
				Write_Log("[chi�n tr��ng Thi�n M�n Tr�n]","TMZ_OperateAllPlayer(), ng��i ch�i trong IDTab nh� h�n ho�c b�ng 0");
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;

--�õ�ĳMissionĳ��Ӫ��������ҵ�����������һ�������������ķ���ֵ
function TMZ_GetMSPlayerIndex(nCamp)
	local tIndex = {};
	local nTotalPlayerNum = GetMSPlayerCount(MISSION_ID,nCamp);
	local msidx,sidx = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(MISSION_ID,msidx,nCamp);
			if sidx > 0 then
				tIndex[i] = sidx;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[chi�n tr��ng Thi�n M�n Tr�n]: trong h�m s� TMZ_GetMSPlayerIndex nh�n ���c s� ng��i trong phe n�o �� c�ng v�i getn(tIndex) kh�ng gi�ng nhau, s� ng��i trong tr�n doanh l�: "..nTotalPlayerNum..", getn(tIndex) ch�nh l�ch l�:"..getn(tIndex));
	end;
	return tIndex;
end;

--�������к�ƽ״̬�����
function TMZ_CureAllPlayer()
	if CURE_ALL_PLAYER == 0 then
		return 0;
	end;
	local Func = function(tArg)
		if GetFightState() == 0 then
			TMZ_RestoreAll();
		end;
	end;
	TMZ_OperateAllPlayer(Func,{},ALL_ID);
end;

--�ָ���������������
function TMZ_RestoreAll()
	Restore();
	RestoreNeili();
end;

--д����ʾ����ı���
--ShowIdxΪTMZ_ShowData�е�������nCampΪ���������nNum1��nNum2��nNum3�ֱ�Ϊɱ��������ɱ������ȡ������
function TMZ_Write_TableData(ShowIdx,nCamp,nNum1,nNum2,nNum3)
	SendScript2VM(TMZ_VM_SCRIPT,format("TMZ_Write_TableData_Script(%d,%d,%d,%d,%d)",ShowIdx,nCamp,nNum1,nNum2,nNum3));
end

function TMZ_Write_TableData_Script(ShowIdx,nCamp,nNum1,nNum2,nNum3)
	local sName = GetName();
	local nRoute = GetPlayerRoute();
	local nRouteName = gf_GetRouteName(nRoute);
	local tCampColor = {"<color=yellow>","<color=pink>"};
	if GLB_TMZ_RealmCheck() == 0 then
		TMZ_ShowData[ShowIdx].data[sName] = {sName,tCampName[nCamp],nRouteName,nNum1,nNum2,nNum3,PlayerIndex,tCampColor[nCamp]};
	else
		TMZ_ShowData[ShowIdx].data[sName] = {sName,"",nRouteName,nNum1,nNum2,nNum3,PlayerIndex,tCampColor[nCamp]};
	end
	TMZ_SaveData();
end

function TMZ_Set_TableData_Nil()
	SendScript2VM(TMZ_VM_SCRIPT,"TMZ_Set_TableData_Nil_Script()");
end

function TMZ_Set_TableData_Nil_Script()
	local nCamp = TMZ_GetCamp();
	local nShowIdx = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	local sName = GetName();
	TMZ_ShowData[nShowIdx].data[sName] = nil;
	TMZ_SaveData();
end

function TMZ_Set_ShowData_Nil()
	SendScript2VM(TMZ_VM_SCRIPT,"TMZ_Set_ShowData_Nil_Script()");
end

function TMZ_Set_ShowData_Nil_Script()
	local nShowIdx = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	TMZ_ShowData[nShowIdx] = nil;
	TMZ_SaveData();
end

function TMZ_Set_ShowData_Msg()
	SendScript2VM(TMZ_VM_SCRIPT,"TMZ_Set_ShowData_Msg_Script()");
end

function TMZ_Set_ShowData_Msg_Script()
	local nPointOne = GetMissionV(MV_TMZ_CAMPONE_POINT);
	local nPointTwo = GetMissionV(MV_TMZ_CAMPTWO_POINT);
	local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	TMZ_ShowData[nCurN].szMsg = format("<enter/>  �i�m chi�n tr�n l�: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],nPointOne,nPointTwo,tCampName[2]);
	TMZ_SaveData();
end

function TMZ_write_score_log()
	SendScript2VM(TMZ_VM_SCRIPT,"TMZ_write_score_log_Script()");
end

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	SCRIPT_SAVE_FILE = "script\\missions\\tianmenzhen\\save.lua";
else
	SCRIPT_SAVE_FILE = "script/missions/tianmenzhen/save.lua";
end
function TMZ_write_score_log_Script()
	local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	local filename = SCRIPT_SAVE_FILE..GetTime();
	local file = openfile(filename, "w");
	if not file then
		WriteLog(format("[ERROR] [TMZ_write_score_log_Script] [write save data error] [file=%s]", filename));
		return
	end
	write(file,format("TMZ_ShowData[%s] = %s\n", nCurN, Val2Str(TMZ_ShowData[nCurN])));
	closefile(file);
end

function TMZ_SaveData()
	local file = openfile(SCRIPT_SAVE_FILE, "w");
	if not file then
		WriteLog("[ERROR] [TMZ_SaveData] write save data error!");
		return
	end
	write(file,"TMZ_ShowData = "..Val2Str(TMZ_ShowData).."\n");
	closefile(file);
end
function TMZ_ClearData()
	if GLB_TMZ_RealmCheck() == 0 then
		TMZ_ShowData = {
			CurN = 0,
			name = "Thi�n M�n tr�n",
			title = {"T�n","Phe","L�u ph�i","Gi�t","Ch�t","Tr�n nh�n"},
			szFormat = "%-17s%-10s%-16s%-9s%-9s%-10s",
		};
	else
		TMZ_ShowData = {
			CurN = 0,
			name = "Thi�n M�n tr�n",
			title = {"T�n","","L�u ph�i","Gi�t","Ch�t","Tr�n nh�n"},
			szFormat = "%-17s%-s%-16s%-9s%-9s%-10s",
		};
	end	
	TMZ_SaveData();
end
function TMZ_LoadData()
	dofile(SCRIPT_SAVE_FILE);
	if not TMZ_ShowData then return end
	for i = 1, getn(TMZ_ShowData) do
		if TMZ_ShowData[i] then
			initTopScore(TMZ_ShowData[i]);
		end
	end
end

function tmz_tell_end()
	local nKillNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
	local nKillNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
	local nKillNum3 = GetTask(TASKID_TMZ_KILL_EYE);
	local nWhoWin = GetMissionV(MV_TMZ_WINNER_CAMP);
	if nWhoWin == 1 then
		szResult = tCampName[nWhoWin].."Gi�nh chi�n th�ng";
	elseif nWhoWin == 2 then
		szResult = tCampName[nWhoWin].."Gi�nh chi�n th�ng";
	else
		szResult = "hai phe h�a nhau";
	end;
	SetFightState(0);
	Say("Di�n v� tr��ng Thi�n M�n Tr�n �� k�t th�c, c�c h� �� ��nh b�i k� ��ch<color=yellow>"..nKillNum1.."<color> ng��i, t� tr�n <color=yellow>"..nKillNum2.."<color> l�n, �o�t tr�n nh�n<color=yellow>"..nKillNum3.."<color> l�n. Cu�i c�ng"..szResult.."<color>. Bi�u hi�n xu�t s�c c�a c�c v� c� th� ��n t�m <color=yellow>Qu�n B�ng phi�u k� t��ng qu�n<color> �� nh�n th��ng.",0);
end;

function tmz_double_time()
	local nDate = tonumber(date("%H%M"));
	if (nDate >= 1200 and nDate <= 1400) or (nDate >= 1800 and nDate <= 2000) then
		return 1;
	else
		return 0;
	end
end

--�ж�����������ʱ��
function tmz_get_deff_time(nMapID)
	local nYear = tonumber(date("%Y"));
	local nTimeNum = mf_GetMissionV(MISSION_ID,MV_TMZ_LOG_TIME,nMapID);
	local strTime = tostring(nTimeNum);
	if strlen(strTime) == 9 then
		strTime = "0"..strTime;
	end
	local nMonth,nDay,nHour,nMin,nSec = 0,0,0,0,0;
	nMonth = tonumber(strsub(strTime,1,2));
	nDay = tonumber(strsub(strTime,3,4));
	nHour = tonumber(strsub(strTime,5,6));
	nMin = tonumber(strsub(strTime,7,8));
	nSec = tonumber(strsub(strTime,9,10));
	local nOldTime = MkTime(nYear,nMonth,nDay,nHour,nMin,nSec);
	local nCurTime = GetTime();

	--������4�����ϲ�Ҫ��
	local nErrorNum = mf_GetMissionV(MISSION_ID,MV_TMZ_ERROR_NUM,nMapID);
	if nErrorNum >= 4 then
		return 1;
	end

	if nOldTime == nil or nOldTime < 0 then
		return 1;
	end
	if nCurTime - nOldTime > 15*60 then
		return 1;
	else
		return 0;
	end
end

function tmz_get_game_loop()
	local nState = GetMissionV(MV_TMZ_STATE)+1;
	local tTimeDiff = {PEACE_TIME,READY_TIME,FIGHT_TIME,WAITOUT_TIME};
	local tTimeLoop = {PEACE_TIMER_LOOP,READY_TIMER_LOOP,FIGHT_TIMER_LOOP,WAITOUT_TIMER_LOOP};
	if GetGameLoop() - GetMissionV(MV_TMZ_GAME_LOOP) > tTimeDiff[nState] then
		SetMissionV(MV_TIMER_LOOP,tTimeLoop[nState]);
		StartMissionTimer(MISSION_ID,TIMER_ID,tTimeDiff[nState]);
		SetMissionV(MV_TMZ_GAME_LOOP,GetGameLoop());
		SetMissionV(MV_TMZ_ERROR_NUM,GetMissionV(MV_TMZ_ERROR_NUM)+1);
		WriteLog("[chi�n tr��ng Thi�n M�n Tr�n]: "..GetMissionV(MV_TMZ_LOG_TIME).."Mission th�"..GetMissionV(MV_TMZ_ERROR_NUM).."T�o m�i th�i gian v� giai �o�n chi�n tr��ng: "..(nState-1));
	end
end

--��Ծ�ȼ���
function tmz_get_active_point()
	local nActivePoint = 0;
	local nActiveLevel = 1;
	local nPlayerKillCount = GetTask(TASKID_TMZ_KILL_PLAYER);
	local nDeathCount = GetTask(TASKID_TMZ_PLAYER_KILLED);
	local nTotalDamage = GetTask(TASKID_TMZ_GET_DAMAGE);
	local nTotalHeal = GetTask(TASKID_TMZ_GET_CURE);
	local nNpcKillCount = GetTask(TASKID_TMZ_KILL_NPC);
	local nEyeKillCount = GetTask(TASKID_TMZ_KILL_EYE);
	local nFlagKillCount = GetTask(TASKID_TMZ_KILL_FLAG);
	--������
	if nDeathCount >= TMZ_ACTIVE_PVP_DEATH_NUM then
		nActivePoint = nActivePoint + 1
	end
	--ɱ����
	if nPlayerKillCount >= TMZ_ACTIVE_PVP_LIMIT then
		nActivePoint = nActivePoint + 2
	end
	if (nTotalDamage >= TMZ_ACTIVE_DAMAGE_LIMIT or nTotalHeal >= TMZ_ACTIVE_HEAL_LIMIT) then
		nActivePoint = nActivePoint + 1;
	end
	
	if (nNpcKillCount >= TMZ_ACTIVE_PVE_LIMIT) then
		nActivePoint = nActivePoint + 1;
	end
	
	if (nEyeKillCount >= TMZ_ACTIVE_EYE_LIMIT) then
		nActivePoint = nActivePoint + 2;
	end
	
	if (nFlagKillCount >= TMZ_ACTIVE_FLAG_LIMIT) then
		nActivePoint = nActivePoint + 4;
	end
	
	if(nActivePoint >= 9) then
		nActiveLevel = 6;
	elseif(nActivePoint >= 7) then
		nActiveLevel = 5;
	elseif(nActivePoint >= 5) then
		nActiveLevel = 4;
	elseif(nActivePoint >= 3) then
		nActiveLevel = 3;
	elseif(nActivePoint >= 1) then
		nActiveLevel = 2;
	else
		nActiveLevel = 1;
	end
	
	return nActivePoint, nActiveLevel;
end

--�ж��Ƿ���Ч����
function tmz_Award_Arg_Two()
	local nArg = 0;
	if GetTask(TASKID_TMZ_KILL_PLAYER)*3+GetTask(TASKID_TMZ_PLAYER_KILLED) >= 40 then
		nArg = 1;
	elseif tmz_get_damage() == 1 then
		nArg = 1;
	elseif GetTask(TASKID_TMZ_GET_CURE) >= 100000 then
		nArg = 1;
	elseif GetTask(TASKID_TMZ_KILL_NPC) >= 10 then
		nArg = 1;
	elseif GetTask(TASKID_TMZ_KILL_EYE) >= 2 then
		nArg = 1;
	elseif GetTask(TASKID_TMZ_KILL_FLAG) >= 1 then
		nArg = 1;
	else
		nArg = 0;
	end
	return nArg;
end

function tmz_get_damage()
	local nRoute = GetPlayerRoute();
	local nDamage = GetTask(TASKID_TMZ_GET_DAMAGE);
	if nRoute == 8 then
		if nDamage >= 20000 then
			return 1;
		else
			return 0;
		end
	elseif nRoute == 9 or nRoute == 20 then	
		if nDamage >= 50000 then
			return 1;
		else
			return 0;
		end	
	else
		if nDamage >= 200000 then
			return 1;
		else
			return 0;
		end
	end
	return 0;
end
--================����Ϊ������==============
--�Ƿ����˿��������
function GLB_TMZ_BiWuCheck()
	return 0;
end

--�Ƿ��ڿ����
function GLB_TMZ_RealmCheck()
	--local nVersion,nCurGs = GetRealmType();
	--if nCurGs == 1 then
	--	return 1;
	--else
		return 0;
	--end
end

--��ȡ��ǰ�ѿ����ĵ�ͼ�����ʺϽ�ȥ��
--�ȿ�����Ƿ��������ж�������
--������Ҫ����ս�������������غ��ʵĵ�ͼid����Ӫ������0��ʾĿǰû�к��ʵģ���Ҫ�¿���
function GLB_TMZ_GetSuitMap(nPlayerNum)
	local strTongName = GLB_TMZ_GetTongName();
	local tbMapID = gf_GetDataTable(GetSameMaps(MAP_ID));
	for i=1,getn(tbMapID) do
		if mf_GetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPONE_NAME,tbMapID[i]) == strTongName then --����Ѿ�����tmz
			if mf_GetPlayerCount(MISSION_ID,CampOne_ID,tbMapID[i]) + nPlayerNum > mf_GetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_MAX,tbMapID[i]) then
				Talk(1,"","chi�n tr��ng Thi�n M�n Tr�n hi�n t�i kh�ng th� dung n�p th�m ng��i, qu� v� h�y ch� ��t k� ti�p.");
				return nil;
			end
			if mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_COMPLETE then
				Talk(1,"","tr�n chi�n thi�n m�n tr�n l�n n�y �� k�t th�c, h�y quay l�i v�o ��t ti�p theo. ");
				return nil;
			end
			return tbMapID[i],CampOne_ID;
		end
		if mf_GetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPTWO_NAME,tbMapID[i]) == strTongName then --����Ѿ�����tmz
			if mf_GetPlayerCount(MISSION_ID,CampTwo_ID,tbMapID[i]) + nPlayerNum > mf_GetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_MAX,tbMapID[i]) then
				Talk(1,"","chi�n tr��ng Thi�n M�n Tr�n hi�n t�i kh�ng th� dung n�p th�m ng��i, qu� v� h�y ch� ��t k� ti�p.");
				return nil;
			end
			if mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_COMPLETE then
				Talk(1,"","tr�n chi�n thi�n m�n tr�n l�n n�y �� k�t th�c, h�y quay l�i v�o ��t ti�p theo. ");
				return nil;
			end			
			return tbMapID[i],CampTwo_ID;
		end
	end	
	return 0;
end

--����ʱ����
function GLB_TMZ_BattleOver()
	local OldPlayerIndex = PlayerIndex;
	local IDTab = TMZ_GetMSPlayerIndex(ALL_ID);
	local nPlayerCount = getn(IDTab);
	local nDate = tonumber(date("%Y%m%d"));
	for i = 1,nPlayerCount do
		PlayerIndex = IDTab[i];
		if PlayerIndex > 0 then
			local nCamp = TMZ_GetCamp();
			local tCampPoint = {GetMissionV(MV_TMZ_CAMPONE_POINT),GetMissionV(MV_TMZ_CAMPTWO_POINT)};
			local tCampUseful = {MV_TMZ_TONG_CAMPONE_USEFUL,MV_TMZ_TONG_CAMPTWO_USEFUL};
			SetTask(TASKID_TMZ_PLAY_POINT,tCampPoint[nCamp]); --д�����
			SetTask(TASKID_TMZ_GET_DAMAGE,GetToNpcDamage()+GetToPlayerDamage()); --��¼�˺������
			if GetTask(TASKID_TMZ_PLAY_DATE) < nDate then
				SetTask(TASKID_TMZ_PLAY_DATE,nDate);
				SetTask(TASKID_TMZ_PLAY_NUM,0);
			end
			SetTask(TASKID_TMZ_PLAY_NUM,GetTask(TASKID_TMZ_PLAY_NUM)+1);
			if (tCampPoint[nCamp] >= 1000) then
				SetTask(TASKID_TMZ_PLAY_RESULT,2);
			else
				SetTask(TASKID_TMZ_PLAY_RESULT,1);
			end
			if tmz_Award_Arg_Two() == 1 then
				local nWeek = tf_GetWeekSequence(1,0); --��һ�賿
				if GetTask(TASK_TMZ_TONG_AWARD_WEEK) < nWeek then
					SetTask(TASK_TMZ_TONG_AWARD_WEEK,nWeek);  --��ʾ���ܲμ��˰��������
				end			
				if GetTask(TASKID_TMZ_PLAY_POINT) >= 1000 then --ʤ��
					SetTask(TASk_TMZ_TONG_WEEK_WIN,GetTask(TASk_TMZ_TONG_WEEK_WIN)+1);
				else
					SetTask(TASk_TMZ_TONG_WEEK_LOSE,GetTask(TASk_TMZ_TONG_WEEK_LOSE)+1);
				end
				SetTask(TASk_TMZ_TONG_TOTAL_NUM,GetTask(TASk_TMZ_TONG_TOTAL_NUM)+1);
				SetMissionV(tCampUseful[nCamp],GetMissionV(tCampUseful[nCamp])+1);
			end
			GLB_TMZ_SetTask(1,0,tRelayTask);
			local nRoute = GetPlayerRoute();
			if nRoute == 21 then --���ĵĹ�ʦ
				GLB_TMZ_SetTask(0,1,tGushiTask);
			end
			GLB_TMZ_SetTask(0,2);--ͬ����ң��
			GLB_TMZ_SetTask(0,3);--ͬ����ң��			
		end
	end
	if GetMissionV(MV_TMZ_TONG_CAMPONE_USEFUL) < floor(GetMissionV(MV_TMZ_TONG_CAMPONE_MAX)/2) then --��Ч����
		TMZ_OperateAllPlayer(GLB_TMZ_TellEnd_1,{},CampOne_ID);
	else
		local IDTabOne = TMZ_GetMSPlayerIndex(CampOne_ID);
		for i = 1,getn(IDTabOne) do	
			PlayerIndex = IDTabOne[i];
			if PlayerIndex > 0 and tmz_Award_Arg_Two() == 0 then	--�ѻ�Ծ�Ȳ�������Ҳ����
				local nWeek = tf_GetWeekSequence(1,0); --��һ�賿
				if GetTask(TASK_TMZ_TONG_AWARD_WEEK) < nWeek then
					SetTask(TASK_TMZ_TONG_AWARD_WEEK,nWeek);  --��ʾ���ܲμ��˰��������
				end			
				if GetTask(TASKID_TMZ_PLAY_POINT) >= 1000 then --ʤ��
					SetTask(TASk_TMZ_TONG_WEEK_WIN,GetTask(TASk_TMZ_TONG_WEEK_WIN)+1);
				else
					SetTask(TASk_TMZ_TONG_WEEK_LOSE,GetTask(TASk_TMZ_TONG_WEEK_LOSE)+1);
				end
				SetTask(TASk_TMZ_TONG_TOTAL_NUM,GetTask(TASk_TMZ_TONG_TOTAL_NUM)+1);
				GLB_TMZ_SetTask(1,0,tRelayTask);
			end	
		end
		PlayerIndex = OldPlayerIndex;
		for i = 1,getn(IDTabOne) do	
			PlayerIndex = IDTabOne[i];
			if PlayerIndex > 0 then
				local TmzSDB = SDB(TMZ_TONG_RELAY_KEY_3,0,0,3);
				TmzSDB:apply(g_FunctionFile,"GLB_TMZ_CallBack_1");
				PlayerIndex = OldPlayerIndex;
				break;
			end
		end			
	end
	if GetMissionV(MV_TMZ_TONG_CAMPTWO_USEFUL) < floor(GetMissionV(MV_TMZ_TONG_CAMPTWO_MAX)/2) then --��Ч����
		TMZ_OperateAllPlayer(GLB_TMZ_TellEnd_1,{},CampTwo_ID);
	else
		local IDTabTwo = TMZ_GetMSPlayerIndex(CampTwo_ID);
		for i = 1,getn(IDTabTwo) do	
			PlayerIndex = IDTabTwo[i];
			if PlayerIndex > 0 and tmz_Award_Arg_Two() == 0 then	--�ѻ�Ծ�Ȳ�������Ҳ����
				local nWeek = tf_GetWeekSequence(1,0); --��һ�賿
				if GetTask(TASK_TMZ_TONG_AWARD_WEEK) < nWeek then
					SetTask(TASK_TMZ_TONG_AWARD_WEEK,nWeek);  --��ʾ���ܲμ��˰��������
				end			
				if GetTask(TASKID_TMZ_PLAY_POINT) >= 1000 then --ʤ��
					SetTask(TASk_TMZ_TONG_WEEK_WIN,GetTask(TASk_TMZ_TONG_WEEK_WIN)+1);
				else
					SetTask(TASk_TMZ_TONG_WEEK_LOSE,GetTask(TASk_TMZ_TONG_WEEK_LOSE)+1);
				end
				SetTask(TASk_TMZ_TONG_TOTAL_NUM,GetTask(TASk_TMZ_TONG_TOTAL_NUM)+1);
				GLB_TMZ_SetTask(1,0,tRelayTask);
			end	
		end		
		for i = 1,getn(IDTabTwo) do	
			PlayerIndex = IDTabTwo[i];
			if PlayerIndex > 0 then		
				local TmzSDB = SDB(TMZ_TONG_RELAY_KEY_3,0,0,3);
				TmzSDB:apply(g_FunctionFile,"GLB_TMZ_CallBack_3");
				PlayerIndex = OldPlayerIndex;
				break;
			end
		end	
	end	
	PlayerIndex = OldPlayerIndex;	
end

function GLB_TMZ_TellEnd_1()
	Say("Do �� t�ch c�c c�a bang h�i l�n n�y qu� th�p, l�n ph�n ��nh c�a tr�n chi�n n�y l� v� hi�u l�c. H�y ��i h� th�ng chuy�n ra kh�i chi�n tr��ng.",0);	
end

function GLB_TMZ_TellEnd_2()
	Say("Ch� v� c� bi�u hi�n t�ch c�c trong tr�n chi�n, c�ng tr�ng �� ���c ghi nh�n, c�c v� c� th� ��n t�m Qu�n B�ng t��ng qu�n �� nh�n th��ng! ",0);
end

function GLB_TMZ_CallBack_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)	
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local TmzSDB = SDB(szkey, nkey1, nkey2,3);
	local strGbGroup,strTongName = GLB_TMZ_GetRealmName(GetMissionS(MV_TMZ_TONG_CAMPONE_NAME));
	local nWinCamp = GetMissionV(MV_TMZ_WINNER_CAMP);
	local nTongScore = GetMissionV(MV_TMZ_TONG_CAMPONE_SCORE);
	local nOldScore = GetMissionV(MV_TMZ_TONG_CAMPONE_SCORE);
	local nTmzSocre1,nTmzSocre2 = GetMissionV(MV_TMZ_CAMPONE_POINT),GetMissionV(MV_TMZ_CAMPTWO_POINT);
	local nAddScore = GLB_TMZ_CalculateScore(nTmzSocre1,nTmzSocre2);
	local tbTongData = TmzSDB[strTongName];
	local nBattleLv = tbTongData[2] or GetMissionV(MV_TMZ_TONG_CAMPONE_LV);
	local nWeekWin = tbTongData[3] or GetMissionV(MV_TMZ_TONG_CAMPONE_WEEK_WIN);
	local nWeekLose = tbTongData[4] or GetMissionV(MV_TMZ_TONG_CAMPONE_WEEK_LOSE);
	local nTotalWin = tbTongData[5] or GetMissionV(MV_TMZ_TONG_CAMPONE_TOTAL_WIN);
	local nTotalLose = tbTongData[6] or GetMissionV(MV_TMZ_TONG_CAMPONE_TOTAL_LOSE);
	local nLastWin = tbTongData[7] or GetMissionV(MV_TMZ_TONG_CAMPONE_LAST_WIN);
	local nHufu = tbTongData[8] or GetMissionV(MV_TMZ_TONG_CAMPONE_HUFU);	
	if nWinCamp == 1 then --��ʤ
		nTongScore = nTongScore + nAddScore;
		nWeekWin = nWeekWin+1;
		nTotalWin = nTotalWin+1;
		nLastWin = 1;
	elseif nWinCamp == 2 then --����
		nTongScore = nTongScore - nAddScore;
		nWeekLose = nWeekLose+1;
		nTotalLose = nTotalLose+1;
		nLastWin = 0;
	else --��ƽ���ӷ֣�����Ӯ�ĳ���
		nWeekWin = nWeekWin+1;
		nTotalWin = nTotalWin+1;
		nLastWin = 1;	
	end
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nBattleLv = tTongScoreLv[i][2];
			break;
		end
	end
 	TmzSDB[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
 	TMZ_OperateAllPlayer(GLB_TMZ_TellEnd_2,{},CampOne_ID);
  WriteLog(format("[t�ch �i�m bang h�i Thi�n M�n Tr�n][bang h�i: %s, t�ch �i�m: %d->%d]",strTongName,nOldScore,nTongScore));
  if nWeekWin + nWeekLose >= 3 then
 		local RankSDB = SDB(TMZ_TONG_RELAY_KEY_1,0,0); --������а�
 		RankSDB:apply(g_FunctionFile,"GLB_TMZ_CallBack_2");
 	end	
end

function GLB_TMZ_CallBack_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local RankSDB = SDB(TMZ_TONG_RELAY_KEY_1,0,0);
	RankSDB.sortType = 2; --����
	local strTongName = GetMissionS(MV_TMZ_TONG_CAMPONE_NAME);
	local nWinCamp = GetMissionV(MV_TMZ_WINNER_CAMP);
	local nTongScore = GetMissionV(MV_TMZ_TONG_CAMPONE_SCORE);
	local nTmzSocre1,nTmzSocre2 = GetMissionV(MV_TMZ_CAMPONE_POINT),GetMissionV(MV_TMZ_CAMPTWO_POINT);
	local nAddScore = GLB_TMZ_CalculateScore(nTmzSocre1,nTmzSocre2);
	if nWinCamp == 1 then --��ʤ
		nTongScore = nTongScore + nAddScore;
	elseif nWinCamp == 2 then --����
		nTongScore = nTongScore - nAddScore;
	end
	RankSDB[strTongName] = {"d",nTongScore};
end

function GLB_TMZ_CallBack_3(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)	
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local TmzSDB = SDB(szkey, nkey1, nkey2,3);
	local strGbGroup,strTongName = GLB_TMZ_GetRealmName(GetMissionS(MV_TMZ_TONG_CAMPTWO_NAME));
	local nWinCamp = GetMissionV(MV_TMZ_WINNER_CAMP);
	local nTongScore = GetMissionV(MV_TMZ_TONG_CAMPTWO_SCORE);
	local nOldScore = GetMissionV(MV_TMZ_TONG_CAMPTWO_SCORE);
	local nTmzSocre1,nTmzSocre2 = GetMissionV(MV_TMZ_CAMPONE_POINT),GetMissionV(MV_TMZ_CAMPTWO_POINT);
	local nAddScore = GLB_TMZ_CalculateScore(nTmzSocre1,nTmzSocre2);
	local tbTongData = TmzSDB[strTongName];
	local nBattleLv = tbTongData[2] or GetMissionV(MV_TMZ_TONG_CAMPTWO_LV);
	local nWeekWin = tbTongData[3] or GetMissionV(MV_TMZ_TONG_CAMPTWO_WEEK_WIN);
	local nWeekLose = tbTongData[4] or GetMissionV(MV_TMZ_TONG_CAMPTWO_WEEK_LOSE);
	local nTotalWin = tbTongData[5] or GetMissionV(MV_TMZ_TONG_CAMPTWO_TOTAL_WIN);
	local nTotalLose = tbTongData[6] or GetMissionV(MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE);
	local nLastWin = tbTongData[7] or GetMissionV(MV_TMZ_TONG_CAMPTWO_LAST_WIN);
	local nHufu = tbTongData[8] or GetMissionV(MV_TMZ_TONG_CAMPTWO_HUFU);	
	if nWinCamp == 2 then --��ʤ
		nTongScore = nTongScore + nAddScore;
		nWeekWin = nWeekWin+1;
		nTotalWin = nTotalWin+1;
		nLastWin = 1;
	elseif nWinCamp == 1 then --����
		nTongScore = nTongScore - nAddScore;
		nWeekLose = nWeekLose+1;
		nTotalLose = nTotalLose+1;
		nLastWin = 0;
	else --��ƽ���ӷ֣�����Ӯ�ĳ���
		nWeekWin = nWeekWin+1;
		nTotalWin = nTotalWin+1;
		nLastWin = 1;			
	end
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nBattleLv = tTongScoreLv[i][2];
			break;
		end
	end
 	TmzSDB[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
 	TMZ_OperateAllPlayer(GLB_TMZ_TellEnd_2,{},CampTwo_ID);
 	WriteLog(format("[t�ch �i�m bang h�i Thi�n M�n Tr�n][bang h�i: %s, t�ch �i�m: %d->%d]",strTongName,nOldScore,nTongScore));
  if nWeekWin + nWeekLose >= 3 then
 		local RankSDB = SDB(TMZ_TONG_RELAY_KEY_1,0,0); --������а�
 		RankSDB:apply(g_FunctionFile,"GLB_TMZ_CallBack_4");
 	end	 	
end

function GLB_TMZ_CallBack_4(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local RankSDB = SDB(TMZ_TONG_RELAY_KEY_1,0,0);
	RankSDB.sortType = 2; --����
	local strTongName = GetMissionS(MV_TMZ_TONG_CAMPTWO_NAME);
	local nWinCamp = GetMissionV(MV_TMZ_WINNER_CAMP);
	local nTongScore = GetMissionV(MV_TMZ_TONG_CAMPTWO_SCORE);
	local nTmzSocre1,nTmzSocre2 = GetMissionV(MV_TMZ_CAMPONE_POINT),GetMissionV(MV_TMZ_CAMPTWO_POINT);
	local nAddScore = GLB_TMZ_CalculateScore(nTmzSocre1,nTmzSocre2);
	if nWinCamp == 2 then --��ʤ
		nTongScore = nTongScore + nAddScore;
	elseif nWinCamp == 1 then --����
		nTongScore = nTongScore - nAddScore;
	end
	RankSDB[strTongName] = {"d",nTongScore};
end

function GLB_TMZ_CalculateScore(nScore1,nScore2)
	local nAbsScore = abs(nScore1-nScore2);
	local nReturnScore = 0;
	local tAddScore = {
		{200,10},
		{400,15},
		{9999,20},
		};
	for i = 1,getn(tAddScore) do
		if nAbsScore <= tAddScore[i][1] then
			nReturnScore = tAddScore[i][2];
			break;
		end
	end	
	return nReturnScore;
end

--û�п���
function GLB_TMZ_NoOpen()
	if GLB_TMZ_RealmCheck() == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);		
	else
		local OldPlayerIndex = PlayerIndex;
		local IDTabOne = TMZ_GetMSPlayerIndex(CampOne_ID);
		local nPlayerOne = getn(IDTabOne);
		if nPlayerOne >= 1 then
			for i = 1,nPlayerOne do	
				PlayerIndex = IDTabOne[i];
				if PlayerIndex > 0 then
					local TmzSDB = SDB(TMZ_TONG_RELAY_KEY_3,0,0,3);
					TmzSDB:apply(g_FunctionFile,"GLB_TMZ_CallBack_5");
					PlayerIndex = OldPlayerIndex;
					break;
				end
			end	
		end
		local IDTabTwo = TMZ_GetMSPlayerIndex(CampTwo_ID);
		local nPlayerTwo = getn(IDTabTwo);
		if nPlayerTwo >= 1 then
			for i = 1,nPlayerTwo do	
				PlayerIndex = IDTabTwo[i];
				if PlayerIndex > 0 then
					local TmzSDB = SDB(TMZ_TONG_RELAY_KEY_3,0,0,3);
					TmzSDB:apply(g_FunctionFile,"GLB_TMZ_CallBack_6");
					PlayerIndex = OldPlayerIndex;
					break;
				end
			end	
		end		
		PlayerIndex = OldPlayerIndex;
	end
end

function GLB_TMZ_CallBack_5(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)	
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local TmzSDB = SDB(szkey, nkey1, nkey2,3);
	local strGbGroup,strTongName = GLB_TMZ_GetRealmName(GetMissionS(MV_TMZ_TONG_CAMPONE_NAME));
	local tbTongData = TmzSDB[strTongName];
	local nTongScore = tbTongData[1] or GetMissionV(MV_TMZ_TONG_CAMPONE_SCORE);
	local nBattleLv = tbTongData[2] or GetMissionV(MV_TMZ_TONG_CAMPONE_LV);
	local nWeekWin = tbTongData[3] or GetMissionV(MV_TMZ_TONG_CAMPONE_WEEK_WIN);
	local nWeekLose = tbTongData[4] or GetMissionV(MV_TMZ_TONG_CAMPONE_WEEK_LOSE);
	local nTotalWin = tbTongData[5] or GetMissionV(MV_TMZ_TONG_CAMPONE_TOTAL_WIN);
	local nTotalLose = tbTongData[6] or GetMissionV(MV_TMZ_TONG_CAMPONE_TOTAL_LOSE);
	local nLastWin = tbTongData[7] or GetMissionV(MV_TMZ_TONG_CAMPONE_LAST_WIN);
	local nHufu = tbTongData[8] or GetMissionV(MV_TMZ_TONG_CAMPONE_HUFU);			
	if strTongName ~= "" then
		TmzSDB[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu+1};
	end
	StopMissionTimer(MISSION_ID,TIMER_ID);
	CloseMission(MISSION_ID);	
end

function GLB_TMZ_CallBack_6(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)	
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local TmzSDB = SDB(szkey, nkey1, nkey2,3);	
	local strGbGroup2,strTongName2 = GLB_TMZ_GetRealmName(GetMissionS(MV_TMZ_TONG_CAMPTWO_NAME));
	local tbTongData2 = TmzSDB[strTongName2];
	local nTongScore2 = tbTongData2[1] or GetMissionV(MV_TMZ_TONG_CAMPTWO_SCORE);
	local nBattleLv2 = tbTongData2[2] or GetMissionV(MV_TMZ_TONG_CAMPTWO_LV);
	local nWeekWin2 = tbTongData2[3] or GetMissionV(MV_TMZ_TONG_CAMPTWO_WEEK_WIN);
	local nWeekLose2 = tbTongData2[4] or GetMissionV(MV_TMZ_TONG_CAMPTWO_WEEK_LOSE);
	local nTotalWin2 = tbTongData2[5] or GetMissionV(MV_TMZ_TONG_CAMPTWO_TOTAL_WIN);
	local nTotalLose2 = tbTongData2[6] or GetMissionV(MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE);
	local nLastWin2 = tbTongData2[7] or GetMissionV(MV_TMZ_TONG_CAMPTWO_LAST_WIN);
	local nHufu2 = tbTongData2[8] or GetMissionV(MV_TMZ_TONG_CAMPTWO_HUFU);		
	if strTongName2 ~= "" then
		TmzSDB[strTongName2] = {"dddddddd",nTongScore2,nBattleLv2,nWeekWin2,nWeekLose2,nTotalWin2,nTotalLose2,nLastWin2,nHufu2+1};
	end
	StopMissionTimer(MISSION_ID,TIMER_ID);
	CloseMission(MISSION_ID);	
end

--ÿ������������
function tmz_clear_tong_data()
	local tbTmzSDB = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzSDB:reflash();
	tbTmzSDB:apply(g_FunctionFile,"tmz_clear_callback");
end

function tmz_clear_callback(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	if nCount == 0 then
		return 0;
	end
	local tbTmzSDB = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	local tbTemp = {};
	for i = 0, nCount - 1 do
		tbTemp[i] = tbTmzSDB[i];
	end
	for i = 0, nCount - 1 do
		local tbTongData = tbTemp[i];
		local strTongName = tbTongData[1];
		local nTongScore = tbTongData[2];
		local nOldScore = nTongScore;
		local nBattleLv = tbTongData[3];
		local nWeekWin = tbTongData[4];
		local nWeekLose = tbTongData[5];
		local nTotalWin = tbTongData[6];
		local nTotalLose = tbTongData[7];
		local nLastWin = tbTongData[8];
		local nHufu = tbTongData[9];	
		if nTongScore < 100 then
			nTongScore = 100;
		elseif nTongScore > 300 then
			nTongScore = 300 + floor((nTongScore - 300)/2);			
		end
		nWeekWin = 0;
		nWeekLose = 0;
		nHufu = MAX_HUFU;
		tbTmzSDB[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};		
		WriteLog("[t�ch �i�m bang h�i Thi�n M�n Tr�n] event=t�ch �i�m gi�m name="..strTongName.." "..nOldScore.." "..nTongScore);
	end
end

--�ѱ���ֵд�빲�����ݿ�
function GLB_TMZ_SetTask(nkey1,nkey2,tb)
	local strGbGroup,strName = GLB_TMZ_GetRealmName(GetName());
	strName = "Realm_"..strName;
	local TbList = {};
	local TbListTemp = {};
	local nNum = 16;
	local nItemKey = 0;
	local strItemKey = "";
	local strFormat = "";
	if nkey1 == 0 and nkey2 == 1 then --��ʦ	
		local tb_gushi = {};
		for k,v in tb do
			local nValue = GetTask(v);
			strFormat = strFormat.."d";
			tinsert(tb_gushi,nValue);
		end
		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_FunctionFile,"GLB_TMZ_ST_Nothing",0,"GS",strFormat,gf_UnPack(tb_gushi));
	elseif nkey1 == 1 and nkey2 == 0  then --������
		for i = 1,getn(tb) do		
			tinsert(TbList,tb[i]);
			tinsert(TbList,GetTask(tb[i]));
		end
		nItemKey = ceil(getn(TbList)/nNum);
		for i = 1,nItemKey do
			local strFormat = ""
			TbListTemp[i] = {};
			for j = (i-1)*nNum+1,min(getn(TbList),nNum*i) do
				strFormat = strFormat.."d";
				tinsert(TbListTemp[i],TbList[j]);
			end
			strItemKey = "TMZ"..tostring(i);
			AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_FunctionFile,"GLB_TMZ_ST_Nothing",0,strItemKey,strFormat,gf_UnPack(TbListTemp[i]));
		end
	--elseif nkey1 == 0 and nkey2 == 2  then --��ң�ҵ�����
	--	AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_FunctionFile,"GLB_TMZ_ST_Nothing",0,"XYB","d",GetTask(TASKID_XOYO_CONSUME));
	--elseif nkey1 == 0 and nkey2 == 3 then --��ң�������
	--	AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"XYY","d",GetTask(TASKID_XOYOYU_CONSUME));		
	end
end

function GLB_TMZ_ST_Nothing()

end

--��ȡ����������������
function GLB_TMZ_GetRealmName(strTongName)
	local aa,bb,strGbGroup,strGbName = strfind(strTongName,"(.-)*(.*)");
	return strGbGroup,strGbName;
end

--��ô������İ����
function GLB_TMZ_GetTongName()
	local strGbGroup,strName = GLB_TMZ_GetRealmName(GetName());
	local strTongName = "";
	local strCurTongName = GetTongName();
	if strCurTongName == "" then
		return strTongName;
	end
	strTongName = strGbGroup.."*"..strCurTongName;
	return strTongName;
end

--=================================================
TMZ_LoadData()
if TMZ_ShowData == nil then
	TMZ_ClearData()
end
