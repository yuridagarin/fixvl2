Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");

function OnTimer()
	local nRoomIndex = BT_GetTempData(PTT_ROOMINDEX);
	local nState = BT_GetTempData(PTT_FIGHT_STATE);
	local nCamp = BT_GetCamp();
	local nCampPlace = nCamp;
	if nState == ROOM_STATE_IDLE then
	elseif nState == ROOM_STATE_READY then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_FIGHT);
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_FIGHT);
		SetFightState(1);
		Msg2Player("Tr�n ��u b�t ��u! Th�i gian l� 2 ph�t! H�y tranh th� th�i gian");
		Talk(1,"","��n ��u b�t ��u! Th�i gian kho�ng <color=yellow>2 ph�t<color>, ��i b�n h�y chu�n b�.");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),120);
	elseif nState == ROOM_STATE_FIGHT then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_END);	
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_END);
		Msg2Player("Tr�n ��u k�t th�c! Hai b�n b�t ph�n th�ng b�i, 5 gi�y sau s� r�i kh�i chi�n tr��ng......");
		SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),5);
		SetFightState(0);
		Say("Tr�n ��u k�t th�c! Hai b�n b�t ph�n th�ng b�i, 5 gi�y sau s� r�i kh�i chi�n tr��ng......",0)
		local nOffset = (nRoomIndex-1)*2+nCamp-1;
		SetMissionV(MV_FIGHTER_GROUP1_1+nOffset,0);
		Restore();
		RestoreNeili();
	elseif nState == ROOM_STATE_END then
		SetMissionV(MV_FIGHTING_ROOM1+nRoomIndex-1,ROOM_STATE_IDLE);
		Msg2Player("T� chi�n tr��ng ��n ��u quay v� h�u doanh!");
		BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);
		BT_SetTempData(PTT_LOCK,0);	--����
		BT_SetTempData(PTT_ROOMINDEX,0);
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetPos(ENTRANCE_POINT[nCampPlace][2],ENTRANCE_POINT[nCampPlace][3]);	
	end;
end;