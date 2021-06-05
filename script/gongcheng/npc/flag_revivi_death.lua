--create date:07-04-13
--author:yanjun
--describe:���������������ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--�����׶β�����
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[2][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[2][2]);
	SetNpcLifeTime(nNpcIdx,0);
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	local nFlagIdx = GCZ_GetReviviFlagIndex(nNpcIdx)
	if nFlagIdx == 0 then
		WriteLog("[C�ng th�nh C�ng th�nh chi�n b� l�i]: flag_revivi_death.lua trong script GCZ_GetReviviFlagIndex h�m s� tr� gi� tr� v� b� l�i");
		return 0;
	end;
	SetMissionV(MV_REVIVI_FLAG1_OWNER+nFlagIdx-1,nPlayerCamp);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	if nPlayerCamp == GONG_ID then
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount+1);
		if GCZ_CheckWinCondition() == 1 then
			return 1;	--�������Ӯ�˾�ֱ�ӷ���
		end;
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("Phe ta �� chi�m l�nh "..tReviviFlagPos[nFlagIdx][3]..", ch� � ph�ng ��ch nh�n ph�n k�ch! Hi�n t�i ti�n �� c�ng th�nh phe ta l� "..nFlagCount.."Th�nh",nPlayerCamp);
		GCZ_Msg2Camp("Phe ��ch �� chi�m l�nh "..tReviviFlagPos[nFlagIdx][3]..", n�u kh�ng l�p t�c h�nh ��ng t�n th�t s� ng�y m�t l�n. Hi�n t�i ti�n �� c�ng th�nh phe ��ch l� "..nFlagCount.."Th�nh",nEnemyCamp)
	else
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount-1);
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("Phe ta �� chi�m l�nh "..tReviviFlagPos[nFlagIdx][3]..", ch� � ph�ng ��ch nh�n ph�n k�ch! Hi�n t�i ti�n �� c�ng th�nh phe ��ch l� "..nFlagCount.."Th�nh",nPlayerCamp);
		GCZ_Msg2Camp("Phe ��ch �� chi�m l�nh "..tReviviFlagPos[nFlagIdx][3]..", n�u kh�ng l�p t�c h�nh ��ng t�n th�t s� ng�y m�t l�n. Hi�n t�i ti�n �� c�ng th�nh phe ta l� "..nFlagCount.."Th�nh",nEnemyCamp)
	end;
	local nMusicState = GCZ_SetMusicState();
	GCZ_PlayBackGroundMusic(nMusicState);
	local nFlagNpcIdx = CreateNpc(tReviviFlagPos[nFlagIdx][3+nPlayerCamp],tReviviFlagPos[nFlagIdx][3].."("..tCampNameZ[nPlayerCamp]..")",nMapID,tReviviFlagPos[nFlagIdx][1],tReviviFlagPos[nFlagIdx][2]);
	SetNpcDeathScript(nFlagNpcIdx,"\\script\\gongcheng\\npc\\flag_revivi_death.lua");
	gf_SetUnitCurState(nFlagNpcIdx,0,nFlagIdx);	--��NPC�ĵȼ���������NPC��λ������
	SetCampToNpc(nFlagNpcIdx,tCampNameP[nPlayerCamp]);
end;