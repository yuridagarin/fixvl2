--Create Date:2006�����һ��
--Describe:�����괺��ѩ��Mission��ʱ���ű�
--Author:yanjun
Include("\\script\\online\\���ڻ\\snowwar\\snowwar_head.lua");
function OnTimer()
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_READY then
		--SW_ProcessReadyTimer();	--û��
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_FIGHT then
		SW_ProcessFightTimer();
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_COMPLETE then
		SW_ProcessWaitOutTimer();
	end;
end;

