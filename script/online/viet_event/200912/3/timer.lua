--=============================================
--create by baiyun 2009.11.25
--describe:Խ�ϰ�12�·�ʥ���ڻ������ʦ��ʱ�������ļ�
--=============================================
Include("\\script\\online\\viet_event\\200912\\3\\mission_functions.lua");
function OnTimer()
	for i=1,getn(TB_EVEN_PROC) do
		if GetMissionV(MV_MISSION_STATE) == TB_EVEN_PROC[i][1] then
			TB_EVEN_PROC[i][2]();
			return 1;
		end;
	end;
end;
--============================================================================
--������ͬ״̬��Ӧ�Ĵ�����
TB_EVEN_PROC = 
{
	[1] = {MS_STATE_IDEL,do_nothing},
	[2] = {MS_STATE_READY,MS_ProcessReadyTimer},
	[3] = {MS_STATE_STARTED,MS_ProcessStartedTimer},
	[4] = {MS_STATE_ENDING,MS_ProcessEndingTimer},
}
--һ��ʲô�������Ŀպ���
function do_nothing()
	return 1;
end;
