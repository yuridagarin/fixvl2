--create date:07-04-13
--author:yanjun
--describe:可重生旗子死亡脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnDeath(nNpcIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_ENDING then	--结束阶段不处理
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
		WriteLog("[C玭g th祅h C玭g th祅h chi課 b? l鏸]: flag_revivi_death.lua trong script GCZ_GetReviviFlagIndex h祄 s? tr? gi? tr? v? b? l鏸");
		return 0;
	end;
	SetMissionV(MV_REVIVI_FLAG1_OWNER+nFlagIdx-1,nPlayerCamp);
	local nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
	if nPlayerCamp == GONG_ID then
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount+1);
		if GCZ_CheckWinCondition() == 1 then
			return 1;	--如果攻方赢了就直接返回
		end;
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("Phe ta  chi誱 l躰h "..tReviviFlagPos[nFlagIdx][3]..", ch? ? ph遪g ch nh﹏ ph秐 k輈h! Hi謓 t筰 ti課  c玭g th祅h phe ta l? "..nFlagCount.."Th祅h",nPlayerCamp);
		GCZ_Msg2Camp("Phe ch  chi誱 l躰h "..tReviviFlagPos[nFlagIdx][3]..", n誹 kh玭g l藀 t鴆 h祅h ng t鎛 th蕋 s? ng祔 m閠 l韓. Hi謓 t筰 ti課  c玭g th祅h phe ch l? "..nFlagCount.."Th祅h",nEnemyCamp)
	else
		SetMissionV(MV_FLAG_OWN_COUNT,nFlagCount-1);
		nFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		GCZ_Msg2Camp("Phe ta  chi誱 l躰h "..tReviviFlagPos[nFlagIdx][3]..", ch? ? ph遪g ch nh﹏ ph秐 k輈h! Hi謓 t筰 ti課  c玭g th祅h phe ch l? "..nFlagCount.."Th祅h",nPlayerCamp);
		GCZ_Msg2Camp("Phe ch  chi誱 l躰h "..tReviviFlagPos[nFlagIdx][3]..", n誹 kh玭g l藀 t鴆 h祅h ng t鎛 th蕋 s? ng祔 m閠 l韓. Hi謓 t筰 ti課  c玭g th祅h phe ta l? "..nFlagCount.."Th祅h",nEnemyCamp)
	end;
	local nMusicState = GCZ_SetMusicState();
	GCZ_PlayBackGroundMusic(nMusicState);
	local nFlagNpcIdx = CreateNpc(tReviviFlagPos[nFlagIdx][3+nPlayerCamp],tReviviFlagPos[nFlagIdx][3].."("..tCampNameZ[nPlayerCamp]..")",nMapID,tReviviFlagPos[nFlagIdx][1],tReviviFlagPos[nFlagIdx][2]);
	SetNpcDeathScript(nFlagNpcIdx,"\\script\\gongcheng\\npc\\flag_revivi_death.lua");
	gf_SetUnitCurState(nFlagNpcIdx,0,nFlagIdx);	--用NPC的等级数据来记NPC的位置索引
	SetCampToNpc(nFlagNpcIdx,tCampNameP[nPlayerCamp]);
end;