--create date:07-04-13
--author:yanjun
--describe:�����������������ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--�����׶β�����
		return 0;
	end;
	SetMissionV(MV_FLAG_OWN_COUNT,GetMissionV(MV_FLAG_OWN_COUNT)+1);
	if GCZ_CheckWinCondition() == 1 then
		return 1;
	end;
	local nMusicState = GCZ_SetMusicState();
	GCZ_PlayBackGroundMusic(nMusicState);
	local nFlagID = GCZ_GetNormalFlagIndex(nNpcIdx);
	if nFlagID == 0 then
		WriteLog("[C�ng th�nh C�ng th�nh chi�n b� l�i]: flag_normal_death.lua trong script GCZ_GetNormalFlagIndexh�m s� tr� gi� tr� v� b� l�i");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[1][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[1][2]);
	SetMissionV(MV_DESTROY_FLAG1+nFlagID-1,1);
	SetMissionV(MV_NORMAL_FLAG1_OWNER+nFlagID-1,GONG_ID);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	GCZ_Msg2Camp("Phe ta �� chi�m l�nh "..tNormalFlagPos[nFlagID][3]..", ch� � ph�ng ��ch nh�n ph�n k�ch! Hi�n t�i ti�n �� c�ng th�nh phe ta l� "..nFlagCount.."Th�nh",nPlayerCamp);
	GCZ_Msg2Camp("Phe ��ch �� chi�m l�nh "..tNormalFlagPos[nFlagID][3]..", n�u kh�ng l�p t�c h�nh ��ng t�n th�t s� ng�y m�t l�n. Hi�n t�i ti�n �� c�ng th�nh phe ��ch l� "..nFlagCount.."Th�nh",nEnemyCamp)
	if nFlagID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C2,GONG_ID,TRUE);	--����1���ݻٺ󣬹�������Ĺ��C2
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_22,SHOU_ID,FALSE);	--�ط�������Ĺ��22
		GCZ_Msg2Camp("��i k� � ��ng th�nh b� ph� h�y, �i�m t�p k�t trong th�nh m�n ph�a ��ng �� m�",GONG_ID);
		GCZ_Msg2Camp("��i k� � ��ng th�nh nguy c�p, �i�m t�p k�t trung b� ��ng th�nh �� m�",SHOU_ID);
	elseif nFlagID == 2 then
		Msg2MSAll(MISSION_ID,"��i k� � Trung khu b� ph� h�y, ");
	elseif nFlagID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C1,GONG_ID,TRUE);	--����3���ݻٺ󣬹�������Ĺ��C1
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_21,SHOU_ID,FALSE);	--�ط�������Ĺ��21		
		GCZ_Msg2Camp("��i k� � T�y th�nh b� ph� h�y, �i�m t�p k�t trong th�nh m�n ph�a T�y �� m�",GONG_ID);
		GCZ_Msg2Camp("��i k� � T�y th�nh b� nguy c�p, �i�m t�p k�t trung b� T�y th�nh �� ��ng",SHOU_ID);
	end;
	--SetNpcLifeTime(nNpcIdx,0);
end;