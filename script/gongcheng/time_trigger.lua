--create date:07-04-16
--author:yanjun
--describe:����ʱ�䴥����
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnTimer()
	local nState = GetTaskTemp(TEMP_FIGHT_STATE);
	local nCamp = GCZ_GetPlayerCamp();
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nState == ROOM_STATE_IDLE then
	elseif nState == ROOM_STATE_READY then
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_FIGHT);
		SetFightState(1);
		Msg2Player("B�t ��u ��u ��n! Th�i gian thi ��u kho�ng 7 ph�t, hai b�n h�y tranh th� th�i gian");
		Talk(1,"","B�y gi� b�t ��u ��u ��n! Th�i gian ��u l� <color=yellow>7 n�n nhang (kho�ng 7 pt�t)<color>, hai b�n h�y tranh th� th�i gian.");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--һ����ʱ��
		SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,1);
	elseif nState == ROOM_STATE_FIGHT then
		local nLoop = GetTaskTemp(TEMP_FIGHT_TIMER_LOOP);
		if nLoop <= 6 then
			SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),70);	--һ����ʱ��
			SetTaskTemp(TEMP_FIGHT_TIMER_LOOP,nLoop+1);
			Msg2Player("Th�i gian ��n ��u c�n: "..(7-nLoop).." n�n nhang");
			return 0;
		end;
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--��ǰ����ս��
			local nEnemyCamp = GCZ_GetEnemyCamp();
			local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1);
			Msg2MSAll(MISSION_ID,"��i hi�p"..GetName().."c�ng v�i "..GetName(nEnemyIdx).."��i chi�n 300 hi�p b�t ph�n th�ng b�i, quy�t ��nh ch�n ng�y t�i chi�n");
		end;
		SetFightState(0);
		PlaySound("\\sound\\����ƽ��.wav");
		Say("Tr�n ��u k�t th�c! Hai b�n b�t ph�n th�ng b�i, 5 gi�y sau s� r�i kh�i chi�n tr��ng......",0);
		Restore();
		RestoreNeili();
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),5);
		if nCamp == SHOU_ID then	--ֻ�����ط���Ա
			if GetTaskTemp(TEMP_CHALLENGER) ~= 1 then	--���������ս�ߣ���ƽ�ִ����ͼ�1
				SetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1,GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1)+1);
			end;
			if GetMissionV(MV_EAST_DOOR_DRAW+nDoorIdx-1) == 3 then	--��������ƽ��				
				SetTaskTemp(TEMP_GURAD_ID,0);
				SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1),0);	--�������¼���������
				SetMissionV(MV_SPIDX_EAST_DOOR+2*(nDoorIdx-1),0);
				SetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1,1);	--���ű��ݻ�
				if nDoorIdx == 1 then	--����Ƕ���
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);	--�Թ�������Ĺ��B2
					Msg2MSAll(MISSION_ID,"��n ��u di�n ra k�ch li�t, Th�nh m�n kh�ng th� ch�u n�i, �� s�n ��, Th�nh m�n ph�a ��ng �� m�. �i�m t�p k�t ngo�i ��ng m�n �� m�");
				elseif nDoorIdx == 2 then 	--���������
					Msg2MSAll(MISSION_ID,"��n ��u di�n ra k�ch li�t, Th�nh m�n kh�ng th� ch�u n�i, �� s�n ��, Th�nh m�n Trung khu �� m�. ");
				elseif nDoorIdx == 3 then	--���������
					GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);	--�Թ�������Ĺ��B1
					Msg2MSAll(MISSION_ID,"��n ��u di�n ra k�ch li�t, Th�nh m�n kh�ng th� ch�u n�i, �� s�n ��, Th�nh m�n ph�a T�y �� m�. �i�m t�p k�t ngo�i T�y m�n �� m�");
				end;
				--SetNpcLifeTime(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),0);
				AddUnitStates(GetMissionV(MV_EAST_JIGUAN_INDEX+nDoorIdx-1),1,-100000000);	--�����Ż��ص�������Ϊ0
			end;
		end;
	elseif nState == ROOM_STATE_END then
		Msg2Player("T� chi�n tr��ng ��n ��u quay v� h�u doanh!");
		if GetTaskTemp(TEMP_CHALLENGER) == 1 then	--��ǰ����ս��
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,0);	--�����ս�ߵ�������¼
			SetTaskTemp(TEMP_GURAD_ID,0);
		end;
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_END);
		SetTaskTemp(TEMP_CHALLENGER,0);
		SetPos(tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);	
	end;
end;