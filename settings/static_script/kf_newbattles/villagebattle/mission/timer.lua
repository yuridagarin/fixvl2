--filename:timer.lua
--create date:2006-06-5
--describe:����ս��ʱ��
Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");
function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		if mod(nGlobalState,10) == 1 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--��Ϊxx2
			AddGlobalNews("Th�o c�c chi�n, Ph�o ��i chi�n, Th�n trang chi�n s�p khai cu�c, nh�ng ai �� b�o danh nhanh ch�ng v�o trong chu�n b�.");
			Msg2Global("Th�o c�c chi�n, Ph�o ��i chi�n, Th�n trang chi�n s�p khai cu�c, nh�ng ai �� b�o danh nhanh ch�ng v�o trong chu�n b�.");
		end;
	else
--		if mod(nLoop,10) == 0 then
--			AddGlobalNews("�����Źزݹȳ�����ս�����Ź���̨����ս�����Źش�������ս����ս�۴��컹��"..(floor(nLoop/10)*5).."���ӣ����·Ӣ�����ٱ�����ս������������");
--			Msg2Global("�����Źزݹȳ�����ս�����Ź���̨����ս�����Źش�������ս����ս�۴��컹��"..(floor(nLoop/10)*5).."���ӣ����·Ӣ�����ٱ�����ս������������");
--		end;
		Msg2MSAll(MISSION_ID," c�n "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s�p b�t ��u. S� ng��i T�ng-Li�u hi�n l�: T�ng ["..nPlayerSong.."]:["..nPlayerLiao.."] Li�u");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	--����Ŀ��ս��NPC�򶷳�ʱ
	process_fight_timeout(SONG_ID)
	process_fight_timeout(LIAO_ID)
	local nStepSong = GetMissionV(MV_SONG_TASKSTEP);
	local nStepLiao = GetMissionV(MV_LIAO_TASKSTEP);
	local sResult = "";
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_WINNER,ALL_ID);	--ʱ�����ʱ˫����û���ҵ����죬����EndMission������ʤ����ϵ
		if nStepSong > nStepLiao then
			sResult = "Phe T�ng gi�nh th�ng l�i chung cu�c t�i chi�n d�ch Th�n trang";
		elseif nStepLiao > nStepSong then
			sResult = "Phe Li�u gi�nh th�ng l�i chung cu�c t�i chi�n d�ch Th�n trang";
		else
			sResult = "T�ng-Li�u hai b�n b�t ph�n th�ng b�i t�i chi�n d�ch Th�n trang";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." �� k�t th�c, T�ng-Li�u hai b�n v�n ch�a t�m ra th� l�nh.");
		Msg2MSAll(MISSION_ID,"Nhi�m v� t�m th� l�nh th� d�n hai b�n l�: T�ng ["..nStepSong.."], Li�u ["..nStepLiao.."]."..sResult);
		Msg2MSAll(MISSION_ID,"");
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"Ti�n �� nhi�m v� c�a T�ng-Li�u hi�n l�: T�ng ["..nStepSong.."]:["..nStepLiao.."] Li�u, ti�n �� th�i gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"S� ng��i T�ng-Li�u hi�n t�i: T�ng ["..nPlayerSong.."]:["..nPlayerLiao.."] Li�u");
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID," c�n "..(COMPLETE_TIME/18*nLoop).." gi�y r�i kh�i chi�n tr��ng");
	end;
end;
--������Ŀ��NPCս����ʱ�����
function process_fight_timeout(nCamp)
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local sNewTargetName = "";
	local nTaskFailed = 0;
	if GetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1) == 1 then	--���Ŀǰ����NPCΪս��״̬
		local nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		local nBeginTime = GetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT1 then
				BT_ShowDebugInfor("Qu� gi� th� h�n NPC");
				Modify_Task_Step(nCamp,-2);
				nTaskFailed = 1;
			end;
		elseif nNpcType == ANGRY_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT2 then
				BT_ShowDebugInfor("Qu� gi� ph�n n� NPC");
				Modify_Task_Step(nCamp,-3);
				nTaskFailed = 1;
			end;		
		else
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT3 then
				BT_ShowDebugInfor("Qu� gi� cu�ng b�o NPC");
				Modify_Task_Step(nCamp,-5);
				nTaskFailed = 1;
			end;		
		end;
		if nTaskFailed == 1 then
			sNewTargetName = Go_To_Next_Step(nCamp);
			if sNewTargetName == "" then	--nCamp������Ϊ0
				return 0;
			end;
			BT_OperateAllPlayer(tell_fail,{sNewTargetName,nCamp},nCamp);
		end
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "��ng ti�c! Nhi�m v� �� th�t b�i. Nh�ng ta v�a nh�n ���c tin t�c: Th� d�n <color=yellow>"..sName.."<color> c� th� bi�t v� tr� c�a th� l�nh, m�i <color=yellow>"..GetMissionS(MSTR_SONG_ONE+nCamp-1)..","..GetMissionS(MSTR_SONG_TWO+nCamp-1)..","..GetMissionS(MSTR_SONG_THREE+nCamp-1).."<color> mau ��n �� t�m B�ch S� Th�ng c� li�n quan �� t�m ra t�ng t�ch <color=yellow>"..sName.."<color>.";
	Say(sContent,0);
end;

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."�� k�t th�c, s� n� l�c c�a c�c v� s� ���c ban th��ng x�ng ��ng.",0);
	SetFightState(0);
	--store_battle_infor();
end;

function store_battle_infor()
	local nSongStep = GetMissionV(MV_SONG_TASKSTEP);
	local nLiaoStep = GetMissionV(MV_LIAO_TASKSTEP);
	local tPointRank = BT_SortMSPlayerByTaskValue(PT_BATTLEPOINT,0)
	local tRankTable = {
					[1] = "",
					[2] = "",
					[3] = "",
					[4] = "",
					[5] = "",
					}
	for i=1,5 do
		if tPointRank[i] == nil then
			break;
		else
			tRankTable[i] = tPointRank[i];
		end;
	end;
	CustomDataSave(CD_BTS_VILLAGE,"ddsssss",nSongStep,nLiaoStep,tRankTable[1],tRankTable[2],tRankTable[3],tRankTable[4],tRankTable[5]);
end;