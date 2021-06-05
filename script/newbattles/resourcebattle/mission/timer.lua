--filename:timer.lua
--create date:2006-06-16
--describe:��������ս��������ʱ���ű�
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
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
			AddGlobalNews("Thu Th�p L��ng Th�o, B�o V� Th�nh Tr�, Gi�i C�u N�ng Trang s�p khai cu�c, nh�ng ai �� b�o danh nhanh ch�ng v�o trong chu�n b�.");
			Msg2Global("Thu Th�p L��ng Th�o, B�o V� Th�nh Tr�, Gi�i C�u N�ng Trang s�p khai cu�c, nh�ng ai �� b�o danh nhanh ch�ng v�o trong chu�n b�.");
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
	local nResSong = Get_ResCount(SONG_ID);
	local nResLiao = Get_ResCount(LIAO_ID);
	local sResult = "";
	if nLoop == 0 then	
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." �� k�t th�c.");
		if nResSong > nResLiao then
			sResult = "Phe T�ng gi�nh th�ng l�i chung cu�c t�i chi�n d�ch Thu Th�p L��ng Th�o"
		elseif nResLiao > nResSong then
			sResult = "Phe Li�u gi�nh th�ng l�i chung cu�c t�i chi�n d�ch Thu Th�p L��ng Th�o"
		else
			sResult = "T�ng-Li�u ��i b�n b�t ph�n th�ng b�i t�i chi�n d�ch Thu Th�p L��ng Th�o"
		end;
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,"L��ng th�o hai b�n n�p cu�i c�ng l�: T�ng ["..nResSong.."], Li�u ["..nResLiao.."]."..sResult);
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"L��ng th�o T�ng-Li�u hi�n c�"..nResSong..":"..nResLiao..", ti�n �� th�i gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			Reflash_Res();	--40��ˢ��һ�����ݵ�
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--ÿһ���ӹ���һ�µ�ǰ˫������
			Msg2MSAll(MISSION_ID,"S� ng��i T�ng-Li�u hi�n t�i: T�ng ["..nPlayerSong.."]:["..nPlayerLiao.."] Li�u");
			Create_Res_Npc(ceil(GetMSPlayerCount(MISSION_ID,ALL_ID)/2));	--һ����ˢһ�θ߼����ݶ�
		end;
		if mod(nLoop,15) == 0 then	--ÿ����Ӵ���һ��ɽ����ٺ�Ӫ�¼�
			Create_Cateran_Even();
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

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."�� k�t th�c, s� n� l�c c�a c�c v� s� ���c ban th��ng x�ng ��ng.",0);
	SetFightState(0);
end;