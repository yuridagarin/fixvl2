Include("\\settings\\static_script\\kf_newbattles\\villagebattle\\villagebattle_head.lua");
function main()
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","T�ng-Li�u giao tranh, �au kh� v�n l� b� t�nh v� t�i!");
		return 0;
	end;
	local npcIndex = GetTargetNpc();
	if npcIndex <= 0 then
		return 0;
	end;
	local _,nNpcX,nNpcY = GetNpcWorldPos(npcIndex);
	if BT_GetDistance(nNpcX,nNpcY) >= 5 then
		Msg2Player("B�n c�ch th� l�nh th� d�n qu� xa.");
		return 0;
	end;
	local nCamp = BT_GetCamp();
	if GetMissionV(MV_SONG_TASKSTEP-1+nCamp) >= MAX_TASK_STEP then
		SetNpcLifeTime(npcIndex,0);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_WINNER,nCamp);
		ClearMapNpc(MAPID);
		BT_AddPersonalPoint(30);
		BT_SetData(PT_FIND_HEADER,BT_GetData(PT_FIND_HEADER)+1);
		if nCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"T�ng_ "..GetName().." t�m ���c Th� l�nh s�m nh�t, phe T�ng th�ng l�i. 30 gi�y sau s� r�i kh�i chi�n tr��ng");
		else
			Msg2MSAll(MISSION_ID,"Li�u_ "..GetName().."  t�m ���c Th� l�nh s�m nh�t, phe Li�u gi�nh th�ng l�i. 30 gi�y sau s� r�i kh�i chi�n tr��ng");
		end;
		BT_OperateAllPlayer(change_state_peace,{},ALL_ID);	--������ұ��ƽ״̬
		Talk(1,"","Bao gi� chi�n tranh m�i k�t th�c ��y!?");
	else
		Talk(1,"","Ng��i l� ai? Sao ta kh�ng bi�t.");
	end;
end;

function change_state_peace(tArg)
	Say(tBattleName[BATTLE_TYPE].."�� k�t th�c, s� n� l�c c�a c�c v� s� ���c ban th��ng x�ng ��ng.",0);
	SetFightState(0);
end;