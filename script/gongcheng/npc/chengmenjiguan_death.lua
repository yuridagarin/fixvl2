--create date:07-04-13
--author:yanjun
--describe:���Ż��������ű�
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nJiGuanID = GCZ_GetChengMenJiGuanIndex(nNpcIdx);
	--SetNpcLifeTime(nNpcIdx,0);
	if nJiGuanID == 0 then
		WriteLog("[c�ng th�nh C�ng th�nh chi�n b� l�i]: chengmenjiguan_death.lua trong script GCZ_GetChengMenJiGuanIndex h�m s� tr� v� tr� s� b� l�i");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[3][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[3][2]);
	SetMissionV(MV_DESTROY_EAST_DOOR+nJiGuanID-1,1);
	SetMissionV(MV_EAST_JIGUAN_INDEX+nJiGuanID-1,0);
	if nJiGuanID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B2,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"Th�nh m�n ph�a ��ng nguy c�p, �i�m t�p k�t ngo�i th�nh �� m�");
	elseif nJiGuanID == 2 then
		Msg2MSAll(MISSION_ID,"Trung khu th�nh m�n nguy c�p");
	elseif nJiGuanID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_B1,GONG_ID,TRUE);
		Msg2MSAll(MISSION_ID,"Th�nh m�n ph�a T�y nguy c�p, T�y th�nh m�n�i�m t�p k�t ngo�i th�nh �� m�");
	end;
	Msg2MSAll(MISSION_ID,GetName().." �� ph� h�y "..tChengMenJiGuanPos[nJiGuanID][3])
	if GCZ_CheckAllDoor() == 1 then
		Msg2MSAll(MISSION_ID,"th�nh m�n �� ho�n to�n l�m nguy, C�ng th�nh ��i ph�o c�n c�ch ");
		GCZ_ComeToGongmeng();
	end;
end;
