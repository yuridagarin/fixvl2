Include("\\script\\gongcheng\\gongcheng_function.lua");
Include("\\script\\lib\\writelog.lua");

--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local szCityName,nCityMapID,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	local szGongName,szShouName = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	SetMissionS(MS_GONG_TONG_NAME,szGongName);
	SetMissionS(MS_SHOU_TONG_NAME,szShouName);
	SetMissionS(MS_CITY_NAME,szCityName);
	local nMSUID = MS_CreateMSUID(nCityIdx);	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	GCZ_InitGraveyard();
	GCZ_CreateTrap(nBattleMapID);
	GCZ_InitTrap();	--��������˫������ͨ��ֱ��ĳһ������פ�غ�
	GCZ_CreateNpc(nBattleMapID);
	WriteLog("[C�ng th�nh chi�n] C�ng th�nh : 1 tr�n Mission �� b�t ��u, MSUID l�: "..nMSUID..". Phe c�ng: "..szGongName.."; Phe th�: "..szShouName);
end;
--Mission��ʼ
function MS_StartMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_GONGMEN);	--����Mission��״̬Ϊ��ʼ״̬
	SetMissionV(MV_TIMER_LOOP,GONGMEN_TIMER_COUNT);	--���ÿ�ʼ״̬�ĳ���ʱ��
	StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
	StartMissionTimer(MISSION_ID,TIMER_ID,GONGMEN_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	mf_Talk2Camp(MISSION_ID,ALL_ID,"��i qu�n �� ��n, tr�ng tr�n �� vang...C�ng th�nh chi�n b�t ��u!!!!!");
	Msg2MSAll(MISSION_ID,"��i qu�n �� ��n, tr�ng tr�n �� vang...C�ng th�nh chi�n b�t ��u!!!!!");
	GCZ_PlaySound(ALL_ID,"ս����ʼ.wav");
	SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_WEIJI);	--��������ı�������
	SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_YOUSHI);
	GCZ_PlayBackGroundMusic(ALL_ID);
	SetMissionV(MV_DESTROY_EAST_DOOR,0);	--������ָ������ʱʹ��RunMission
	SetMissionV(MV_DESTROY_SOUTH_DOOR,0);
	SetMissionV(MV_DESTROY_WEST_DOOR,0);
end;
--Mission����
function MS_EndMission()
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL)
	local nMSUID = GetMissionV(MV_MISSION_UID);
	--	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	mf_DelAllMSPlayer(MISSION_ID,ALL_ID);	--��Mission����ɾ�����е����
	mf_ClearMissionData();
	ClearMapNpc(nBattleMapID);
	ClearMapTrap(nBattleMapID);
	WriteLog("[C�ng th�nh C�ng th�nh chi�n]:1 tr�n Mission �� k�t th�c, MSUID l�: "..nMSUID);
end;
--�뿪Mission
function MS_LeaveMission()
	local nGuardID = GetTaskTemp(TEMP_GURAD_ID);
	local nCamp = GCZ_GetPlayerCamp();
	local nOldPlayerIdx = PlayerIndex;
	if nGuardID ~= 0 then	--����������뿪
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nCamp-1,0);	--��Ӧ�ļ�¼����������MissionV��0
		if nCamp == GONG_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,SHOU_ID);
		elseif nCamp == SHOU_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,ALL_ID);
		end;
	end;
	local bFighting = GetTaskTemp(TEMP_ARENA_FIGHTING);
	if bFighting ~= 0 then	--������ڵ���
		local nEnemyCamp = GCZ_GetEnemyCamp();
		local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,0);	--��ȡ�������ֵ�����
		if nEnemyIdx > 0 then
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,nEnemyIdx);	--�����µ�����
		end;
		PlayerIndex = nEnemyIdx;
		SetMissionV(MV_EAST_DOOR_DRAW+nGuardID-1,0);
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetFightState(0);
		Restore();
		RestoreNeili();
		SetPos(tEntrancePos[nEnemyCamp][1],tEntrancePos[nEnemyCamp][2]);
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		Say("��i th� r�i m�ng, b�n gi�nh ���c th�ng l�i khi�u chi�n ��n ��u",0);
		Msg2Player("T� chi�n tr��ng ��n ��u quay v� h�u doanh!");
		PlaySound("\\sound\\����ʤ��.wav");
		SetTaskTemp(TEMP_CHALLENGER,0);	--Ӯ�˵ľͲ�����ս����
		Msg2MSAll(MISSION_ID,GetName(nEnemyIdx).."("..tCampNameZ[nEnemyCamp]..") khi�u chi�n ��n ��u �� th�ng "..GetName(nOldPlayerIdx).."("..tCampNameZ[nCamp].."), tr� th�nh t�n Th� v� c�a "..tDoorName[nGuardID]..".");
		PlayerIndex = nOldPlayerIdx;
	end;
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_RestorePlayerState();	--���Ҫ��NewWorld֮ǰ����Ȼ�л�����PK״̬
	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."-"..GetName().." �� r�i kh�i chi�n tr��ng");
end;
--����Mission
function MS_JoinMission(nCamp)
	SetTaskTemp(TEMP_CAMP,nCamp);
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local _,_,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	SetTaskTemp(TEMP_CITY_INDEX,nCityIdx);
	NewWorld(nBattleMapID,tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);
	if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
		AddMSPlayer(MISSION_ID,nCamp+2);
		SetTaskTemp(TEMP_REINFORCEMENT,nCamp);
	else
		AddMSPlayer(MISSION_ID,nCamp);
	end;
	Msg2MSAll(MISSION_ID,"��i hi�p"..GetName().." �� gia nh�p "..tCampNameZ[nCamp]);
	MS_SetPlayerState();
	if nCamp == GONG_ID then
		Say("Phe c�ng: ph� h�y v� chi�m l�nh <color=yellow>8<color>k� ph��n ho�c khi C�ng th�nh chi�n k�t th�c ph� h�y v� chi�m l�nh <color=yellow>6<color>k� ph��n l� gi�nh th�ng l�i. C� quan th�nh m�n ch�a b� ph� h�y ho�c tr��c khi chi�m l�nh kh�ng th� ti�n v�o th�nh.",0);
	elseif nCamp == SHOU_ID then
		Say("phe th�: C�ng th�nh chi�n k�t th�c, n�u b�o v� ���c <color=yellow>5<color>k� ph��n t�c gi�nh chi�n th�ng. Ch� �: N�u phe c�ng ph� h�y v� chi�m l�nh ���c <color=yellow>8<color> k� ph��n th� C�ng th�nh chi�n l�p t�c k�t th�c, th� th�nh th�t b�i. Phe ta khi tr�n th� th�nh, ��ch ph��ng s� kh�ng th� v�o ���c th�nh.",0);
	end;
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,GetMissionS(MS_CITY_NAME).." chi�n s� c�n "..(nLoop*READY_TIMER_INTERVAL).." ph�t n�a s� b�t ��u ");
	end;
end;
--���Ž׶μ�ʱ��
function MS_ProcessGongMenTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		GCZ_ComeToGongmeng();
		for i=1,getn(tChengMenJiGuanPos) do
			local nJiGuanIdx = GetMissionV(MV_EAST_JIGUAN_INDEX+i-1);
			if nJiGuanIdx ~= 0 then
				--SetNpcLifeTime(nJiGuanIdx,0);	--��û��ʧ�ĳ��Ż�����ʧ
				AddUnitStates(nJiGuanIdx,1,-100000000);	--�����Ż��ص�������Ϊ0
				SetMissionV(MV_DESTROY_EAST_DOOR+i-1,1);	--����Ϊ���ô�״̬
				SetMissionV(MV_EAST_JIGUAN_INDEX+i-1,0);
			end;
		end;
		GCZ_Msg2Camp("C�ng th�nh ��i ph�o ���c khai h�a, th�nh m�n b� ph� h�y ho�n to�n",ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C�ch th�i gian C�ng th�nh ��i ph�o c�n "..(nLoop*GONGMEN_TIMER_INTERVAL).." ph�t ");
	end;
end;
--���ǽ׶μ�ʱ��
function MS_ProcessGongChengTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		local nCurFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		local szResult = "";
		local nBattleMapID = SubWorldIdx2ID(SubWorld);
		local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
		if nCurFlagCount >= FLAG_COUNT_END_WIN then	--���Ƿ�Ӯ��
			SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
			szResult = "C�ng th�nh chi�n �� k�t th�c, cu�i c�ng bang h�i <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color> chi�m l�nh th�nh c�ng (do bang h�i <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> th� v�) <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(GONG_ID,"����սʤ��.wav");
			GCZ_PlaySound(SHOU_ID,"����սʧ��.wav");
			SetMissionV(MV_WAR_RESULT,GONG_ID);	--���ý��
		else	--�سǷ�Ӯ��
			SetCityWarWinner(nCityMapID,GetMissionS(MS_SHOU_TONG_NAME));
			szResult = "C�ng th�nh chi�n �� k�t th�c, cu�i c�ng bang h�i <color=yellow>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> tr�n �p th�nh c�ng bang h�i <color=red>"..GetMissionS(MS_GONG_TONG_NAME).."<color>, gi� v�ng ���c <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(SHOU_ID,"����սʤ��.wav");
			GCZ_PlaySound(GONG_ID,"����սʧ��.wav");
			SetMissionV(MV_WAR_RESULT,SHOU_ID);	--���ý��
		end;
		local lfFunc = function(tArg)
			Say(%szResult,0);
			SetFightState(0);
			if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
				SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			else
				SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			end;
		end;
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
		AddGlobalCountNews(szResult,1);
		Msg2Global(sf_RemoveTag(szResult,"<",">"));
		PlayMusic("\\music\\themusicisnotexist.mp3",1);
		Msg2MSAll(MISSION_ID,"C�ng th�nh chi�n �� k�t th�c, m�i ng��i r�i kh�i chi�n tr��ng th�i");
		WriteLog("[c�ng th�nh C�ng th�nh chi�n]:"..sf_RemoveTag(szResult,"<",">").."MSUID l� "..GetMissionV(MV_MISSION_UID));
		WriteLogEx("Cong Thanh Chien",szResult)
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Th�i gian c�ng th�nh c�n "..(nLoop*GONGMEN_TIMER_INTERVAL).." ph�t ");
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then		
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C�ng th�nh chi�n tr��ng s�p k�t th�c, ch� c�n"..(nLoop*ENDING_TIMER_INTERVAL).." ph�t ");
	end;
end;
--��½����������
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[c�ng th�nh C�ng th�nh chi�n]: Hi�p kh�ch  "..GetName().." R�i Mission kh�ng b�nh th��ng, �ang trong qu� tr�nh x� l� ��ng nh�p.");
end;
--=====================================================================================
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID(nCityIdx)
	local nMSUID = tonumber(date("%y%m%d"))*10+nCityIdx+random(1,1000);	--����ļ���������������Ե�
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()
	SetTask(TNC_MUID,GetMissionV(MV_MISSION_UID));
	local nCamp = GCZ_GetPlayerCamp();
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	SetTask(TNC_CAMP,nCamp);
	SetCampToPlayer(tCampNameP[nCamp]);
	EnterChannel(tCityChannel[nCity][1]);
	EnterChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	LeaveTeam();
	SetLogoutRV(1);	--���õ�½��Ϊ����������
	SetDeathPunish(0);	--�������ͷ�
	InteractiveEnable(0);	--�رս���	������NewWorld֮��ִ�в���Ч
	StallEnable(0);	--��ֹ��̯(���ߺ�ᱻ���)
	UseScrollEnable(0);	--��ֹʹ�ûسǷ�
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--��ֹ�ı�PK״̬
	SetFightState(0);
	KillFollower();	--ɾ������
	ClearStolenSkill();	--�����͵ȡ�ļ��ܣ���Թ���
	SetDeathScript("\\script\\gongcheng\\player_death.lua");
	local nCurMapID = tCityInfo[nCity][3];
	SetTempRevPos(nCurMapID,tEntrancePos[nCamp][1]*32,tEntrancePos[nCamp][2]*32);	--����������
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	PlayMusic("\\music\\"..tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG+nCamp-1)],1);	--���ű�������
end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	local nCamp = GCZ_GetPlayerCamp();
	SetLogoutRV(0)
	SetDeathPunish(1);
	InteractiveEnable(1)
	StallEnable(1)
	UseScrollEnable(1);
	ForbidChangePK(0);
	SetPKFlag(0,0);
	LeaveTeam();
	SetFightState(0)
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	SetCampToPlayer("");
	--��������ָ����Ҫ����Ե��������
	DesaltPlayer(0);
	UseSkillEnable(1);--  (1����ʹ���书��0��ֹʹ���书)
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_ClearTempTaskValue();
	if nCity > 0 then	--�����OnLogin�����ģ�nCity����0,���ǲ��ô�����
		LeaveChannel(tCityChannel[nCity][1]);
		LeaveChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	end;
end;
--������е�ս����ʱ����
function MS_ClearTempTaskValue()
	for i=TEMP_BEGIN,TEMP_END do
		SetTaskTemp(i,0);
	end;
end;