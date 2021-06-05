--������ս�������ű�
--by vivi
--2009\07\18

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
--׷�ش���������ս
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

function OnDeath(Launcher)
	ClearColdDown();	--���ҩCD
	local nBattleState = GetMissionV(MV_TMZ_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	--�ǿ�ս״̬����
		return 0;
	end;	
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	local nDeathIndex = PlayerIndex;
	local nDeathName = GetName();
	local nDeathCamp = GetTask(TASKID_TMZ_PLAY_CAMP);
	local nKillerName = "";
	local nDeathKillNums = GetTask(TASKID_TMZ_KILL_NUMS);
	if nKillerIndex > 0 and nKillerIndex ~= nDeathIndex then
		PlayerIndex = nKillerIndex;
		nKillerName = GetName();
		local nSex = GetSex();
		local tSexName = {"Tha","Ng��i ch�i"};
		local nCamp = GetTask(TASKID_TMZ_PLAY_CAMP);
		SetTask(TASKID_TMZ_KILL_PLAYER,GetTask(TASKID_TMZ_KILL_PLAYER)+1);
		SetTask(TASKID_TMZ_KILL_NUMS,GetTask(TASKID_TMZ_KILL_NUMS)+1);
		Msg2Player(format("C�c h� �� ti�u di�t %s, s� ng��i hi�n t�i di�t ���c: %d, s� ng��i li�n ti�p ti�u di�t: %d",nDeathName,GetTask(TASKID_TMZ_KILL_PLAYER),GetTask(TASKID_TMZ_KILL_NUMS)));
		local nKillPlayers = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKillNums = GetTask(TASKID_TMZ_KILL_NUMS);
		
		_stat_when_kill_player()
		
		if nDeathKillNums >= 10 and nDeathKillNums <= 29 then
			Msg2MSAll(MISSION_ID,format("%s �� ��nh b�i %s! V� ��i h�? H�i qua ta ch�a!",nKillerName,nDeathName));
		elseif nDeathKillNums >= 30 then
			Msg2MSAll(MISSION_ID,format("%s �� ��nh b�i %s! ��ng v�y, ta ch�nh l� m�t v� anh h�ng!",nKillerName,nDeathName));
		end		
		
		if nKillNums == 4 then
			Msg2MSAll(MISSION_ID,format("%s, %s �� li�n t�c ��nh b�i %d ng��i, qu� th�t l� m�t cao th�!",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums == 5 then
			Msg2MSAll(MISSION_ID,format("%s, %s v� ngh� cao c��ng, �� li�n t�c ��nh b�i %d ng��i !",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 5 and nKillNums <= 7 then
			Msg2MSAll(MISSION_ID,format("%s, %s �� li�n t�c ��nh b�i %d ng��i, qu� l� v� ngh� si�u qu�n",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 7 and nKillNums <= 9 then
			Msg2MSAll(MISSION_ID,format("%s, %s li�n t�c ��nh b�i %d ng��i, s�c m�nh nh� m�t v� th�n!",tCampName[nCamp],nKillerName,nKillNums));
		elseif nKillNums > 9 and nKillNums <= 29 then
			Msg2MSAll(MISSION_ID,format("%s, %s li�n t�c ��nh b�i %d ng��i, ch�ng l� kh�ng ai c� th� ��nh b�i d��c %s sao?",tCampName[nCamp],nKillerName,nKillNums,tSexName[nSex]));
		elseif nKillNums >= 30 then
			Msg2MSAll(MISSION_ID,format("%s, %s �� li�n t�c ��nh b�i %d ng��i, ch� c� m�t v� th�n th� 2 m�i c� th� ��nh b�i ���c %s!",tCampName[nCamp],nKillerName,nKillNums,tSexName[nSex]));
		end
		
		if nKillPlayers == 20 then
			Msg2MSAll(MISSION_ID,format("%s, %s �� ti�u di�t h�t %d ng��i!",tCampName[nCamp],nKillerName,nKillPlayers));
		elseif nKillPlayers == 30 then
			Msg2MSAll(MISSION_ID,format("%s, %s �� ti�u di�t t�ng c�ng %d ng��i, th� kh�ng th� ��!",tCampName[nCamp],nKillerName,nKillPlayers));
		elseif nKillPlayers == 40 then
			Msg2MSAll(MISSION_ID,format("%s, %s �� ti�u di�t t�ng c�ng %d ng��i, c�i th� v� song!",tCampName[nCamp],nKillerName,nKillPlayers));
		end
		
		--д����ʾ����
		local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
		local nKillNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKillNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
		local nKillNum3 = GetTask(TASKID_TMZ_KILL_EYE);	
		TMZ_Write_TableData(nCurN,nCamp,nKillNum1,nKillNum2,nKillNum3);	
	end
	
	PlayerIndex = nDeathIndex;
	SetTaskTemp(PTT_DIE_LOOP,GetMissionV(MV_TIMER_LOOP));
	SetTaskTemp(TASK_TEMP_DIE_TIME,GetTime());
	SetTask(TASKID_TMZ_PLAYER_KILLED,GetTask(TASKID_TMZ_PLAYER_KILLED)+1);
	SetTask(TASKID_TMZ_KILL_NUMS,0);	
	Msg2Player("B�n b� "..nKillerName.."C�ng k�ch tr�ng th��ng");
	
	_stat_when_death()
	
	--д����ʾ����	
	local nCurN = GetMissionV(MV_TMZ_SHOWDATA_IDX);
	local nKilledNum1 = GetTask(TASKID_TMZ_KILL_PLAYER);
	local nKilledNum2 = GetTask(TASKID_TMZ_PLAYER_KILLED);
	local nKilledNum3 = GetTask(TASKID_TMZ_KILL_EYE);	
	TMZ_Write_TableData(nCurN,nDeathCamp,nKilledNum1,nKilledNum2,nKilledNum3);	
	--============����������==============================
	local nMapId = GetMissionV(MV_TMZ_MAP_ID);
	local nCampPlace = TMZ_GetCamp();
	SetTempRevPos(nMapId,tPositionCamp[nCampPlace][1][1]*32,tPositionCamp[nCampPlace][1][2]*32);	--����������	
	
	local oldPlayerIndex = PlayerIndex;
	if nKillerIndex > 0 and nKillerIndex ~= PlayerIndex then
		--׷�ش�����
		PlayerIndex = nKillerIndex;
		dzt_tmz_kill_player();
		PlayerIndex = oldPlayerIndex;
	end
end