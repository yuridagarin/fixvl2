--File name:waitout_timer.lua
--Describe:�����ɼ���ȴ��볡����ʱ�ű�
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	StopMissionTimer(MISSION_ID,WAITOUT_TIMER_ID);
	Msg2MSAll(MISSION_ID,"Thi ��u k�t th�c, h�y nhanh ch�ng r�i kh�i b�n ��.");
	CloseMission(MISSION_ID);
end;