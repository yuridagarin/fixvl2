--File name:match_timer.lua
--Describe:�������̼�ʱ���ű�
--Create Date:2006-4-20
--Author:yanjun
Include("\\script\\online\\dragonboat06\\dragonboat_head.lua");
Include("\\script\\online\\dragonboat06\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) >= LEASTPLAYER then
		local timeleft = GetMissionV(MV_TIMELEFT);
		local RankTab = {};
		if timeleft == 0 then
			StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
			Msg2MSAll(MISSION_ID,"Do trong th�i gian quy ��nh kh�ng c� ng��i ch�i n�o v� ��n ��ch, v� th� tr�n ��u k�t th�c.");
			StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--�ȴ���������볡
			SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);
		else
			StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
			StartMissionTimer(MISSION_ID,MATCH_TIMER_ID,MATCH_TIME);
			SetMissionV(MV_TIMELEFT,timeleft-1);
			if mod(timeleft,2) == 0 then
				Msg2MSAll(MISSION_ID,"Th�i gian thi ��u c�n"..(timeleft/2).." ph�t ");
			else
				Msg2MSAll(MISSION_ID,"Th�i gian thi ��u c�n"..floor(timeleft/2).." ph�t 30 gi�y.");
			end;
		end;
		RankTab = Get_Rank();
		if GetMSPlayerCount(MISSION_ID,CAMP_PLAYER) ~= getn(RankTab) then
			Write_Log("Ho�t ��ng �oan Ng� sai s�t","do khi th�ng b�o th� h�ng, s� l��ng tuy�n th� thi ��u trong mission kh�ng gi�ng v�i s� l��ng m� RankTab nh�n ���c.");
		end;
		Msg2MSAll(MISSION_ID,"Hi�n t�i x�p h�ng:");
		for i=1,getn(RankTab) do
			PlayerIndex = RankTab[i];
			if PlayerIndex > 0 then
				Msg2MSAll(MISSION_ID,"th�"..NumTab[i]..":"..GetName());
			end;
		end;
	else
		Msg2MSAll(MISSION_ID,"Do s� ng��i tham gia �t h�n 2, v� th� tr�n ��u kh�ng th� ti�n h�nh. Sau 30 gi�y s� ��a b�n ra kh�i b�n �� thi ��u.");
		StopMissionTimer(MISSION_ID,MATCH_TIMER_ID);
		StartMissionTimer(MISSION_ID,WAITOUT_TIMER_ID,WAITOUT_TIME);	--�ȴ���������볡
		SetMissionV(MV_ROOMSTATE,MS_STATE_WAITOUT);	
	end;
end;
