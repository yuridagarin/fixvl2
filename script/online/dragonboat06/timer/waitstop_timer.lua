--File name:waitstop_timer.lua
--Describe:������һ���󵹼�ʱ�ű����ھ�����һ����ͬʱ���������ʱ��
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		if timeleft == 0 then
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			Msg2MSAll(MISSION_ID,"Thi ��u k�t th�c, c�n v�i ng��i ch�i v�n ch�a v� ��ch. C�ng b� th� h�ng hi�n t�i, sau 30 gi�y s� t� ��ng tho�t ra kh�i b�n ��.");
			StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
			Report_Result(Get_Rank());
			Give_Award();
		else
			StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
			StartMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID,WAITSTOP_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			timeleft = timeleft*WAITSTOP_TIME/18;
			Msg2MSAll(MISSION_ID," c�n "..timeleft.." gi�y tr�n ��u k�t th�c.");		
		end;
	else
		StopMissionTimer(MISSION_ID,WAITSTOP_TIMER_ID);
		Msg2MSAll(MISSION_ID,"Do s� ng��i tham gia d��i"..LEASTPLAYER.." ng��i, cu�c �ua kh�ng th� ti�n h�nh! Sau 30 gi�y s� t� ��ng tho�t ra kh�i b�n ��.");
		StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--�ȴ���������볡
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
		Report_Result(Get_Rank());
		Give_Award();
	end;
end;
