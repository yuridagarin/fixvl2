Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

function OnTimer()
	SetMissionV(MV_TMZ_GAME_LOOP,GetGameLoop());
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_PEACE then
		Process_Peace_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Peace_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);
	if nLoop == 0 then
		if nPlayerOne < PLAYER_NEED_NUM or nPlayerTwo < PLAYER_NEED_NUM then
			GLB_TMZ_NoOpen();
			_stat_on_misson_none_start()
		end 
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,3) == 0 then --15�벥��һ��
			Msg2MSAll(MISSION_ID,"Ti�n �� th�i gian: ["..(PEACE_TIMER_LOOP-nLoop+1)..":"..(PEACE_TIMER_LOOP+1).."]");
			Msg2MSAll(MISSION_ID,"T� l� s� ng��i 2 phe:"..CampOne_Name.."["..nPlayerOne.."]:["..nPlayerTwo.."]"..CameTwo_Name..". Khi c� 2 phe ��u ��t "..PLAYER_NEED_NUM.."Ng��i, chi�n tr��ng Thi�n M�n Tr�n s� b�t ��u");
		end
		if nPlayerOne >= PLAYER_NEED_NUM and nPlayerTwo >= PLAYER_NEED_NUM then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIME);
			SetMissionV(MV_TIMER_LOOP,READY_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_READY);
			Msg2MSAll(MISSION_ID,"Chi�n tr��ng Thi�n M�n Tr�n s� b�t ��u sau 1 ph�t, c�c anh h�ng h�y chu�n b�.");
		end
	end
end

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	if nLoop == 0 then
		--�ж�������
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		_stat_on_misson_start(MISSION_ID)
		WriteLog("[chi�n tr��ng Thi�n M�n Tr�n b�t ��u]: th�i gian l�"..GetMissionV(MV_TMZ_LOG_TIME).."Thi�n M�n Tr�n �� b�t ��u, s� ng��i tham gia l�: ["..nPlayerOne.."]:["..nPlayerTwo.."], t�ng s� ng��i l�: "..(nPlayerOne+nPlayerTwo));
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		if mod(nLoop,6) == 0 then	--30�벥��һ��
			Msg2MSAll(MISSION_ID," c�n "..Get_Time_String(READY_TIME/18*nLoop)..", chi�n tr��ng Thi�n M�n Tr�n ch�nh th�c b�t ��u, s� ng��i tham gia hi�n l�:"..CampOne_Name.."["..nPlayerOne.."]:["..nPlayerTwo.."]"..CameTwo_Name);
		end
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerOne = GetMSPlayerCount(MISSION_ID,CampOne_ID);
	local nPlayerTwo = GetMSPlayerCount(MISSION_ID,CampTwo_ID);	
	local nEyeOne = GetMissionV(MV_TMZ_CAMPONE_EYE);
	local nEyeTwo = GetMissionV(MV_TMZ_CAMPTWO_EYE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_TMZ_WINNER_CAMP,ALL_ID);
		Msg2MSAll(MISSION_ID,format("%s v� %s ��i chi�n 40 ph�t b�t ph�n th�ng b�i.",CampOne_Name,CameTwo_Name));
		TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
		
		_stat_on_misson_end(MISSION_ID, 0)
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		--ÿ��15��ͼ��˫��������
		SetMissionV(MV_TMZ_CAMPONE_POINT,GetMissionV(MV_TMZ_CAMPONE_POINT)+nEyeOne*5);
		SetMissionV(MV_TMZ_CAMPTWO_POINT,GetMissionV(MV_TMZ_CAMPTWO_POINT)+nEyeTwo*5);
		local nPointOne = GetMissionV(MV_TMZ_CAMPONE_POINT);
		local nPointTwo = GetMissionV(MV_TMZ_CAMPTWO_POINT);				
		TMZ_Set_ShowData_Msg();	
		--���ȷ�
		if nPointOne >= OVER_GAME_POINT and nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,ALL_ID);
			Msg2MSAll(MISSION_ID,format("%s v� %s �i�m s� 2 b�n chi�m tr�n ��t ��n %d, tr�n chi�n b�t ph�n th�ng b�i.",CampOne_Name,CameTwo_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			
			_stat_on_misson_end(MISSION_ID, 0)
			return 0;								
		end		
		if nPointOne >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,CampOne_ID);
			Msg2MSAll(MISSION_ID,format("Phe %s chi�m tr�n ��t t� s� %d, �� gi�nh chi�n th�ng.",CampOne_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			_stat_on_misson_end(MISSION_ID, 1)
			return 0;			
		end
		if nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSION_ID,TIMER_ID);
			StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
			SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
			SetMissionV(MV_TMZ_WINNER_CAMP,CampTwo_ID);
			Msg2MSAll(MISSION_ID,format("Phe %s chi�m tr�n ��t t� s� %d, �� gi�nh chi�n th�ng.",CameTwo_Name,OVER_GAME_POINT));
			TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			_stat_on_misson_end(MISSION_ID, 2)		
			return 0;
		end		
		if (nPointOne >= APPEAR_FLAG_POINT or nPointTwo >= APPEAR_FLAG_POINT) and GetMissionV(MV_TMZ_APPEAR_FLAG) == 0 then
			SetMissionV(MV_TMZ_APPEAR_FLAG,1);
			--����ս��
			local nMapId = gf_GetCurMapID();
			local nNpcIdx = CreateNpc(tPositionNpcFlag[1][1][1],tPositionNpcFlag[1][1][2],nMapId,tPositionNpcFlag[1][1][3],tPositionNpcFlag[1][1][4]);
			SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
			SetCampToNpc(nNpcIdx,CampOne_Type);
			nNpcIdx = CreateNpc(tPositionNpcFlag[2][1][1],tPositionNpcFlag[2][1][2],nMapId,tPositionNpcFlag[2][1][3],tPositionNpcFlag[2][1][4]);
			SetNpcDeathScript(nNpcIdx,NPC_DEATH_SCRIPT);
			SetCampToNpc(nNpcIdx,CampTwo_Type);
			Msg2MSAll(MISSION_ID,"C�c v� anh h�ng ch� �, Chi�n K� �� xu�t hi�n t�i h�u ph��ng tr�n doanh c�a �ich, ch� c�n nh� ���c Chi�n K� c�a phe ��i ��ch l� c� th� ��y nhanh ti�n tr�nh ph� tr�n."); 
		end
		if mod(nLoop,4) == 0 then
			Msg2MSAll(MISSION_ID,"Ti�n �� th�i gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
			Msg2MSAll(MISSION_ID,"�i�m s� 2 b�n hi�n t�i l�:"..CampOne_Name.."["..nPointOne.."]:["..nPointTwo.."]"..CameTwo_Name)
			TMZ_OperateAllPlayer(TMZ_KickSleep,{},ALL_ID); --˯�ߵ�ǿ���߳�ս��
		end		
		if mod(nLoop,10) == 0 then
			Msg2MSAll(MISSION_ID,format("S� ng��i 2 b�n hi�n t�i l�: %s[%d]: [%d]%s",CampOne_Name,nPlayerOne,nPlayerTwo,CameTwo_Name));
		end;
		TMZ_OperateAllPlayer(TMZ_KickDeather,{},ALL_ID); --������ǿ���߳�ս��
		TMZ_DrivePlayerOutOfShelter();	--��Ӫ��ǿ�д���ǰӪ
		TMZ_CureAllPlayer();						--�������к�ƽ״̬�����
	end;
end;

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)		
		if GLB_TMZ_RealmCheck() == 1 then --��������������
			GLB_TMZ_BattleOver();
		end 	
--		Msg2MSAll(MISSION_ID,"����"..(COMPLETE_TIME/18*nLoop).."���˳�����������ս��");
	end;
end;
