--filename:timer.lua
--create date:2006-06-19
--describe:��̨����ս��������ʱ���ű�
Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");
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
			--AddGlobalNews("�����̨ս���Ѿ�����,���ѱ�����Ӣ��Ѹ�ٸ���ս����δ������Ӣ��������ԭ�������������");
			--Msg2Global("�����̨ս���Ѿ�����,���ѱ�����Ӣ��Ѹ�ٸ���ս����δ������Ӣ��������ԭ�������������");
		end;
	else
		if mod(nLoop,10) == 0 then
			AddGlobalNews("Ph�o ��i Chi�n Li�n Server khai chi�n c�n "..(floor(nLoop/10)*5).." ph�t, m�i c�c v� anh h�ng nhanh ch�ng b�o danh tham gia!");
			Msg2Global("Ph�o ��i Chi�n Li�n Server khai chi�n c�n "..(floor(nLoop/10)*5).." ph�t, m�i c�c v� anh h�ng nhanh ch�ng b�o danh tham gia!");
		end;
		Msg2MSAll(MISSION_ID," c�n "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s�p b�t ��u. S� ng��i T�ng-Li�u hi�n l�: T�ng ["..nPlayerSong.."]:["..nPlayerLiao.."] Li�u");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nOccupyTime = 0;
	if nLoop == 0 then
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--���Ŀǰ��ռ������̨
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			SetMissionV(MV_OCCUPY_TIME_SONG,GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_SONG,0);		
			SetMissionV(MV_OCCUPY_TIME_SONG, GetMissionV(MV_OCCUPY_TIME_SONG) + 100);
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			SetMissionV(MV_OCCUPY_TIME_LIAO,GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_LIAO,0);			
			SetMissionV(MV_OCCUPY_TIME_LIAO, GetMissionV(MV_OCCUPY_TIME_LIAO) + 100);
		end;
		local nTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		local sResult = "";
		if nTimeSong > nTimeLiao then
			SetMissionV(MV_WINNER,SONG_ID);--��Ӯ
		elseif nTimeSong == nTimeLiao then
			SetMissionV(MV_WINNER,ALL_ID);--��ƽ
		else
			SetMissionV(MV_WINNER,LIAO_ID);--��Ӯ
		end;
		if nTimeSong > nTimeLiao then
			sResult = "Nh�n M�n Quan-Ph�o ��i chi�n k�t th�c, phe T�ng gi�nh th�ng l�i chung cu�c!";
		elseif nTimeLiao > nTimeSong then
			sResult = "Nh�n M�n Quan-Ph�o ��i chi�n k�t th�c, phe Li�u gi�nh th�ng l�i chung cu�c!";
		else
			sResult = "Nh�n M�n Quan-Ph�o ��i chi�n k�t th�c, hai b�n h�a nhau!";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." �� k�t th�c.");
		Msg2MSAll(MISSION_ID,"Th�i gian chi�m l�nh ph�o ��i gi�a T�ng-Li�u l�: T�ng ["..nTimeSong.." gi�y], Li�u ["..nTimeLiao.." gi�y]."..sResult);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		local nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--���Ŀǰ��ռ������̨
			nOccupyTimeSong = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTimeSong;
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTimeLiao = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTimeLiao;	
		end;
		Msg2MSAll(MISSION_ID,"Ti�n �� th�i gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		local nScaleSong = floor(100*(nOccupyTimeSong/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		local nScaleLiao = floor(100*(nOccupyTimeLiao/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		Msg2MSAll(MISSION_ID,"Th�i gian chi�m l�nh ph�o ��i hi�n t�i gi�a T�ng-Li�u l�: T�ng ["..nScaleSong.."]:["..nScaleLiao.."] Li�u");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--һ���ӱ�һ��˫������
			Msg2MSAll(MISSION_ID,"S� ng��i T�ng-Li�u trong chi�n tr��ng hi�n l�: T�ng ["..nPlayerSong.."]:["..nPlayerLiao.."] Li�u");
		end;
		if mod(nLoop,5*3) == 0 then	--�����ˢһ��NPC
			Create_Npc("Th� d�n",GetMissionV(MV_KILL_NATIVE_COUNT));
			SetMissionV(MV_KILL_NATIVE_COUNT,0);
			Create_Npc("V� binh Ph�o ��i",GetMissionV(MV_KILL_GUARD_COUNT));
			SetMissionV(MV_KILL_GUARD_COUNT,0);		
		end;
		if mod(nLoop,4) == 0 then
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
		end;
		if (nLoop == 105 or nLoop == 75 or nLoop == 45 or nLoop == 15) and 0 ~= Create_LengXiangLing_Boss() then
			Msg2MSAll(MISSION_ID, format("BOSS%s �� ��i m�i", "L�nh H��ng L�ng"));
		end
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

function tell_end(tArg)
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	Say(tBattleName[BATTLE_TYPE].."�� k�t th�c, s� n� l�c c�a c�c v� s� ���c ban th��ng x�ng ��ng.",0);
	SetFightState(0);
end;