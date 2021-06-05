--����

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

function main()
	if GetMissionV(MV_TMZ_STATE) ~= MS_STATE_FIGHT then
		Talk(1,"","<color=green>Li�u �<color>: g�n ��y, trong thi�n m�n tr�n kh�ng bi�t t� ��u ��n v� s� k� �c nh�n, �o�t l�y bi�t bao Tinh Tr�n H�n c�a ta! Nh�ng Tinh Tr�n H�n n�y ��u l� t�m huy�t bao l�u nay c�a ta, c�u xin thi�u hi�p h�y gi�p ta gi�i quy�t n�n n�y.");
		return 0;
	end;
	if GetItemCount(2,0,795) < 1 then
		Talk(1,"","<color=green>Li�u �<color>: g�n ��y, trong thi�n m�n tr�n kh�ng bi�t t� ��u ��n v� s� k� �c nh�n, �o�t l�y bi�t bao Tinh Tr�n H�n c�a ta! Nh�ng Tinh Tr�n H�n n�y ��u l� t�m huy�t bao l�u nay c�a ta, c�u xin thi�u hi�p h�y gi�p ta gi�i quy�t n�n n�y.");
	else
		local nPlayerCamp = TMZ_GetCamp();
		local nMVPoint = MV_TMZ_CAMPONE_POINT-1+nPlayerCamp;	
		if DelItem(2,0,795,1) == 1 then
			Talk(1,"","<color=green>Li�u �<color>: c�m t� thi�u hi�p! Tuy ta kh�ng th�t s� n�m r� huy�n c� c�a tr�n ph�p n�y, nh�ng c�ng bi�t v�i b� m�t, thi�u hi�p ch� c�n nh� thՅ n�y nh� th� n�y� l� ���c.");
			SetMissionV(nMVPoint,GetMissionV(nMVPoint)+10); --+10��
			TMZ_Set_ShowData_Msg();				
			Msg2MSAll(MISSION_ID,"Do "..GetName().."���c cao nh�n t��ng tr�, n�m ���c huy�n c� ph� Thi�n M�n Tr�n "..tCampName[nPlayerCamp].."�u th� chi�n tr�n �� ���c n�ng cao!")
			if GetMissionV(nMVPoint) >= OVER_GAME_POINT then
				StopMissionTimer(MISSION_ID,TIMER_ID);
				StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
				SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
				SetMissionV(MV_TMZ_STATE,MS_STATE_COMPLETE);
				SetMissionV(MV_TMZ_WINNER_CAMP,nPlayerCamp);
				Msg2MSAll(MISSION_ID,format("Phe %s chi�m tr�n ��t t� s� %d, �� gi�nh chi�n th�ng.",tCampName[nPlayerCamp],OVER_GAME_POINT));			
				TMZ_OperateAllPlayer(tmz_tell_end,{},ALL_ID);
			end			
		end
	end
end