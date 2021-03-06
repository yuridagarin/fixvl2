--create date:07-04-13
--author:yanjun
--describe:不可重生旗子死亡脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");

function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--结束阶段不处理
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
		WriteLog("[C玭g th祅h C玭g th祅h chi課 b? l鏸]: flag_normal_death.lua trong script GCZ_GetNormalFlagIndexh祄 s? tr? gi? tr? v? b? l鏸");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GCZ_GetEnemyCamp();
	GCZ_PlaySound(nPlayerCamp,tWavFileName[1][1]);
	GCZ_PlaySound(nEnemyCamp,tWavFileName[1][2]);
	SetMissionV(MV_DESTROY_FLAG1+nFlagID-1,1);
	SetMissionV(MV_NORMAL_FLAG1_OWNER+nFlagID-1,GONG_ID);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	GCZ_Msg2Camp("Phe ta  chi誱 l躰h "..tNormalFlagPos[nFlagID][3]..", ch? ? ph遪g ch nh﹏ ph秐 k輈h! Hi謓 t筰 ti課  c玭g th祅h phe ta l? "..nFlagCount.."Th祅h",nPlayerCamp);
	GCZ_Msg2Camp("Phe ch  chi誱 l躰h "..tNormalFlagPos[nFlagID][3]..", n誹 kh玭g l藀 t鴆 h祅h ng t鎛 th蕋 s? ng祔 m閠 l韓. Hi謓 t筰 ti課  c玭g th祅h phe ch l? "..nFlagCount.."Th祅h",nEnemyCamp)
	if nFlagID == 1 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C2,GONG_ID,TRUE);	--旗子1被摧毁后，攻方可用墓地C2
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_22,SHOU_ID,FALSE);	--守方不可用墓地22
		GCZ_Msg2Camp("Чi k? ? Йng th祅h b? ph? h駓, 甶觤 t藀 k誸 trong th祅h m玭 ph輆 Йng  m?",GONG_ID);
		GCZ_Msg2Camp("Чi k? ? Йng th祅h nguy c蕄, 甶觤 t藀 k誸 trung b? Йng th祅h  m?",SHOU_ID);
	elseif nFlagID == 2 then
		Msg2MSAll(MISSION_ID,"Чi k? ? Trung khu b? ph? h駓, ");
	elseif nFlagID == 3 then
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_C1,GONG_ID,TRUE);	--旗子3被摧毁后，攻方可用墓地C1
		GCZ_SetGraveyardStatus(MV_GRAVEYARD_21,SHOU_ID,FALSE);	--守方不可用墓地21		
		GCZ_Msg2Camp("Чi k? ? T﹜ th祅h b? ph? h駓, 甶觤 t藀 k誸 trong th祅h m玭 ph輆 T﹜  m?",GONG_ID);
		GCZ_Msg2Camp("Чi k? ? T﹜ th祅h b? nguy c蕄, 甶觤 t藀 k誸 trung b? T﹜ th祅h  ng",SHOU_ID);
	end;
	--SetNpcLifeTime(nNpcIdx,0);
end;