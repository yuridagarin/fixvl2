Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function main()
	local nPos = GetTask(POSITION);
	local MapID,MapX,MapY = GetWorldPos();
	if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED or GetMissionV(MV_ROOMSTATE) == MS_STATE_WAITCOMPLETE then
		if nPos == TRAPCOUNT-1 then
			SetTask(POSITION,TRAPCOUNT);
			clearflag();
			Msg2Player("B�n �� ho�n th�nh ���ng �ua, h�y v�o khu ngh� m�t �� ��i tr�n ��u k�t th�c.");
			if GetMissionV(MV_ROOMSTATE) == MS_STATE_STARTED then 
				StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
				StartMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID,WAITSTOP_TIME);
				SetMissionV(MV_TIMELEFT,WAITSTOP_TIMER_LOOP);
				SetMissionV(MV_ROOMSTATE,MS_STATE_WAITCOMPLETE);
				Msg2MSAll(MISSION_ID,GetName().." Ng��i v� ��ch tr��c ti�n c�n 1 ph�t n�a th�i gian thi ��u m�i k�t th�c.");
			end;
			SetMissionV(MV_COMPLETENUM,GetMissionV(MV_COMPLETENUM)+1);	
			SetTask(RANK,GetMissionV(MV_COMPLETENUM));
			SetTask(FINISHTIME,GetGameLoop()-GetMissionV(MV_GAMELOOP));
			if GetTask(BEST_TIME) == 0 then
				SetTask(BEST_TIME,GetTask(FINISHTIME));	--��¼��óɼ�����λΪ֡				
			elseif GetTask(BEST_TIME) > GetTask(FINISHTIME) then
				Msg2Player("Ch�c m�ng b�n �� ph� k� l�c v� ��ch s�m nh�t.");
				SetTask(BEST_TIME,GetTask(FINISHTIME));	--��¼��óɼ�����λΪ֡
			end;
			local FinishTime = GetTask(FINISHTIME);
			FinishTime = FinishTime/18;
			local nMin = floor(FinishTime/60);
			local nSec = format("%.2f",FinishTime - nMin*60);	--С�������λ�͹���
			local sResult = "T�ng th�i gian"..nMin.." ph�t "..nSec.." Gi�y "

			Msg2MSAll(MISSION_ID,GetName().."c�n ��ch."..sResult);
			if GetMissionV(MV_COMPLETENUM) == GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) then
				StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
				Msg2MSAll(MISSION_ID,"Tr�n ��u k�t th�c, h�y xem th� h�ng c�a m�nh.");
				StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);
				SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
				Report_Result(Get_Rank());
				Give_Award();
			end;
			ForbidChangePK(0);
			SetPKFlag(0,0);	--����Ϊ��ɱ״̬
			ForbidChangePK(1);	--��ֹ�ı�PK״̬
			NewWorld(MapID,2038,3268);
			InteractiveEnable(0);		
		else
			NewWorld(MapID,2019,3291);
			InteractiveEnable(0);
			Msg2Player("Kh�ng ���c �ua ng��c chi�u");
		end;
	end;
end;

function clearflag()
	for i=FLAG_BEGIN,FLAG_END do	--��������������ӵļ�¼
		SetTask(i,0);
	end;
end;