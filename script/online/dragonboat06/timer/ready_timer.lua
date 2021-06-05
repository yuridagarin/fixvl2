--File name:ready_timer.lua
--Describe:�����׶μ�ʱ���ű�
--		�� ������ֹ��ִ������ű�
--Create Date:2006-4-19
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	local timeleft = GetMissionV(MV_TIMELEFT);
	if timeleft == 0 then
		if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) < LEASTPLAYER then
			Msg2MSAll(MISSION_ID,"Do s� ng��i tham gia d��i"..LEASTPLAYER.." ng��i, cu�c �ua kh�ng th� ti�n h�nh!");
			CloseMission(MISSION_ID);
			return 0;
		end;
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,WAITSTART_TIMER_ID,WAITSTART_TIME);
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITSTART);
		SetMissionV(MV_TIMELEFT,WAITSTART_TIMER_LOOP);	--��ʼ����ʱ����
		Msg2MSAll(MISSION_ID,"Th�i gian b�o danh �� k�t th�c, m�i c�c tuy�n th� chu�n b� l�n thuy�n, sau 30 gi�y cu�c �ua s� ch�nh th�c b�t ��u.");
	else
		StopMissionTimer(MISSION_ID,READY_TIMER_ID);
		StartMissionTimer(MISSION_ID,READY_TIMER_ID,READY_TIME);
		SetMissionV(MV_TIMELEFT,timeleft-1);
		timeleft = timeleft*READY_TIME/18;
		Msg2MSAll(MISSION_ID,"Tr�n ��u s� sau"..timeleft.." gi�y k�t th�c b�o danh");		
	end;
end;