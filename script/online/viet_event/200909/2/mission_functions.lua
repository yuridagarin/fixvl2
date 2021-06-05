--=============================================
--create by baiyun 2009.8.31
--describe:Խ�ϰ�9�·������߾�����mission����
--=============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_head.lua");
Include("\\script\\lib\\globalfunctions.lua");

t_denglong_sets20101201 = {
	[0] = {"Thi�u L�m", {204, 1526, 3269}},--������
	[1] = {"Nga My", {303, 1552, 3232}},--����һ
	[2] = {"���ng M�n", {305, 1530, 2921}},--���ڶ�
	[3] = {"C�i Bang", {209, 1515, 3265}},--������
	[4] = {"V� �ang", {312, 1707, 3477}},--������
	[5] = {"Ng� ��c", {407, 1555, 3286}},--������
	[6] = {"D��ng M�n", {219, 1655, 3301}},--������
};


--Mission����==============================================================================
--��ʼ��Mission
function MS_InitMission()
	MS_ChangeMSState(MS_STATE_STARTED);
	local nMSUID = MS_CreateMSUID();	--����һ��MissionΨһID
	SetMissionV(MV_MISSION_UID,nMSUID);
	gf_WriteLog(LOG_HEAD,"Mission �� b�t ��u, MSUID:"..nMSUID);
end;
--Mission��ʼ
function MS_StartMission()
	MS_ChangeMSState(MS_STATE_STARTED);
end;
--Mission����
function MS_EndMission()
	MS_ChangeMSState(MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--��Mission����ɾ�����е����
	mf_ClearMissionData();
	gf_WriteLog(LOG_HEAD,"Mission �� k�t th�c, MSUID:"..nMSUID);
end;
--�뿪Mission
function MS_LeaveMission()	
	NewWorld();
	MS_RestorePlayerState();
end;
--����Mission
function MS_JoinMission(nCamp)
	CleanInteractive();
	AddMSPlayer(MISSION_ID,nCamp)
	MS_SetPlayerState();
end;
--����׼���׶εļ�ʱ������
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--����Mission��ʼ��ļ�ʱ������
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		MS_ChangeMSState(MS_STATE_ENDING);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		local nMapId = GetGlbValue(1015);
		local nMapX = GetGlbValue(1016);
		local nMapY = GetGlbValue(1017);
		local nDengLongIndex = GetGlbValue(1014);
		
		--local tBossParam = {
        --   	[1] = {"Th� M�p", 70, "Th� M�p", "\\script\\online\\viet_event\\200909\\2\\death_pangtuzi.lua", 10, 600},
        --    	[2] = {"chicken_viet", 10, "G� M�p", "\\script\\online\\viet_event\\200909\\2\\death_ji.lua", 10, 600},
        --    	[3] = {"dark_viet",  10, "V�t M�p", "\\script\\online\\viet_event\\200909\\2\\death_ya.lua", 10, 600},
        --    	[4] = {"ship_viet", 10, "D� M�p", "\\script\\online\\viet_event\\200909\\2\\death_yang.lua", 10, 600},
            	--[5] = {"��i Ni�n Th�", 10, "��i Ni�n Th�", "\\script\\online\\viet_event\\200909\\2\\death_niansou.lua", 10, 3600},                	            	        	
        --	};
		
		-- tham s� 5: s� l��ng boss,
		-- tham s� 6: �i�m HP
		local tBossParam = {
			    [1] = {"Th� M�p", 25, "Th� M�p", "\\script\\online\\viet_event\\200909\\2\\death_pangtuzi.lua", 10, 600},   --24
            	[2] = {"chicken_viet", 25, "G� M�p", "\\script\\online\\viet_event\\200909\\2\\death_ji.lua", 10, 600},  --24
            	[3] = {"dark_viet",  25, "V�t M�p", "\\script\\online\\viet_event\\200909\\2\\death_ya.lua", 10, 600},  --24
            	[4] = {"ship_viet", 25, "D� M�p", "\\script\\online\\viet_event\\200909\\2\\death_yang.lua", 10, 600},  --24
            	
            	-- [5] = {"��i Ni�n Th�", 96, "��i Ni�n Th�", "\\script\\online\\viet_event\\200909\\2\\death_niansou.lua", 1, 30 * 60}   	 -- 4
		}		
        
        local tGoldBossParam = {        	
        		[2] = {"Ti�u k�", "G� M�p Ho�ng Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 600},
        		[3] = {"Ti�u �p", "V�t M�p Ho�ng Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 600},
        		[4] = {"Ti�u d��ng", "D� M�p Ho�ng Kim", "\\script\\online\\viet_event\\200909\\2\\death_goldboss.lua", 1, 600},
        	}
        	
       	local nBossRand = gf_GetRandItemByTable(tBossParam,100,1)        	
        local nDay = tonumber (date("%w"))
        
        	
		--���ﴴ��������
		-- xu�t hi�n 10 con boss con
		for i = 1, tBossParam[nBossRand][5] do
			local nNpcIndex = CreateNpc(tBossParam[nBossRand][1], tBossParam[nBossRand][3], nMapId, nMapX, nMapY);
			SetNpcLifeTime(nNpcIndex, tBossParam[nBossRand][6]);   					--- thiet lap th�i gian t�n t�i
			SetNpcDeathScript(nNpcIndex, tBossParam[nBossRand][4]);
			
		end
		
		-- boss h�ang kim
		if nBossRand >=  2 and nBossRand <= 4 then
			for i = 1, tGoldBossParam[nBossRand][4] do
				local nNpcIndex = CreateNpc(tGoldBossParam[nBossRand][1], tGoldBossParam[nBossRand][2], nMapId, nMapX, nMapY);
				SetNpcLifeTime(nNpcIndex, tGoldBossParam[nBossRand][5]);
				SetNpcDeathScript(nNpcIndex, tGoldBossParam[nBossRand][3]);
			end
		end
		local nState = GetUnitCurStates(nDengLongIndex, 4)
		AddUnitStates(nDengLongIndex, 4, (0 - nState));--�Ѵ�״̬��0
	end;
end;
--����ȴ������ļ�ʱ������
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;
--��½����������
function OnLogin()

end;
--=====================================================================================
--ת��Mission��ǰ״̬
function MS_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_READY then
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--����Mission��״̬Ϊ׼��״̬
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--���ü�ʱ���ܼ�ʱ����
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ����ʱ��	
	elseif nState == MS_STATE_STARTED then
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--����Mission��״̬Ϊ��ʼ״̬
		SetMissionV(MV_TIMER_LOOP,floor(GetGlbValue(1018)/STARTED_TIMER_INTERVAL)-1);	--���ÿ�ʼ״̬�ĳ���ʱ��
		StopMissionTimer(MISSION_ID,TIMER_ID);	--����ǰһ����ʱ��
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--��ʼһ���µļ�ʱ��
	elseif nState == MS_STATE_ENDING then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--����һ��MSUID����ǰMissionΨһ��ʶ��
function MS_CreateMSUID()
	local nMSUID = 0;
	return nMSUID;
end;
--���볡��ʱͳһ���еĲ���
function MS_SetPlayerState()

end;
--�뿪����ʱͳһ���еĲ���
function MS_RestorePlayerState()

end;
