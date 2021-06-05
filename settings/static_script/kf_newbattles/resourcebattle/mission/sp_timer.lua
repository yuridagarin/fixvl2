--describe:�����ʱ�������Ը��ݼ�ʱ����״̬��ѡ�񴥷�һЩ�¼�
--һ����˵����¼��ĳ���ʱ�䲻��
Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
function OnTimer()
	local nTimerState = GetMissionV(MV_SP_TIMER_STATE);
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		if nTimerState == TM_STATE_CATERAN_SONG or nTimerState == TM_STATE_CATERAN_LIAO then
			Process_Sp_Careran_Even(nTimerState);
		end;
	else
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nTimerState-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nTimerState-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	end;
end;
--ɽ����Ӫ�¼�,nCampָ����ɽ������Ӫ
function Process_Sp_Careran_Even(nCamp)
	local nLoop = GetMissionV(MV_SP_TIMER_LOOP);
	SetMissionV(MV_SP_TIMER_LOOP,nLoop-1)
	local nCateranCount = CountGroupUnit(CATERAN_GROUP_SONG+nCamp-1);
	local nEnemyCamp = 3 - nCamp;
	if nLoop == 0 then
		if nCateranCount > 0 then
			if nEnemyCamp == SONG_ID then
				Msg2MSAll(MISSION_ID,"S�n t�c h�u doanh phe T�ng d��ng nh� ch�y m�t d�ng");
			else
				Msg2MSAll(MISSION_ID,"S�n t�c h�u doanh phe Li�u d��ng nh� ch�y m�t d�ng");
			end;
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		SetGroupLifeTime(CATERAN_GROUP_SONG+nCamp-1,0);
		ClearGroup(CATERAN_GROUP_SONG+nCamp-1);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
	elseif nLoop <= 45 then	--15������Ч��
		if nCateranCount == 0 then
			if nLoop > 30 then
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"S�n t�c trong h�u doanh phe T�ng g�n nh� b� �u�i �i h�t");
				else
					Msg2MSAll(MISSION_ID,"S�n t�c trong h�u doanh phe Li�u g�n nh� b� �u�i �i h�t");
				end;
			else
				if nEnemyCamp == SONG_ID then
					Msg2MSAll(MISSION_ID,"S�n t�c trong h�u doanh phe T�ng g�n nh� b� �u�i �i h�t");
				else
					Msg2MSAll(MISSION_ID,"S�n t�c trong h�u doanh phe Li�u g�n nh� b� �u�i �i h�t");
				end;
			end;
			SetMissionV(MV_SP_TIMER_STATE,0);
			StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
			return 0;
		end;
		Add_Resource(nCamp,nCateranCount);	--nCamp����������
		Msg2MSGroup(MISSION_ID,"��nh s�n t�c: �o�t ���c"..nCateranCount.." bao l��ng th�o",nCamp);
		Dec_Resource(nEnemyCamp,nCateranCount);	--nEnemyCamp�����ݼ���
		Msg2MSGroup(MISSION_ID,"��nh s�n t�c:"..nCateranCount.." bao l��ng th�o c�a ta �� b� s�n t�c c��p �i",nEnemyCamp);
	elseif nCateranCount == 0 then	--15�������ɽ������Ϊ0
		if nEnemyCamp == SONG_ID then
			Msg2MSAll(MISSION_ID,"T��ng s�  phe T�ng k�p th�i �u�i s�n t�c �i");
		else
			Msg2MSAll(MISSION_ID,"T��ng s�  phe T�ng k�p th�i �u�i s�n t�c �i");
		end;
		SetMissionV(MV_SP_TIMER_STATE,0);
		StopMissionTimer(MISSION_ID,CATERAN_TIMER_ID);
		return 0;		
	end;
end;
