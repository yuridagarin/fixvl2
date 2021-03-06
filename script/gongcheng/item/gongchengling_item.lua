--create date:07-04-16
--author:yanjun
--describe:攻城先锋令物品脚本
Include("\\script\\gongcheng\\gongcheng_function.lua");
function OnUse(nItemIdx)
	if GCZ_InBattle() == 0 then
		Talk(1,"","Ch? ? trong khu v鵦 C玭g th祅h chi課 m韎 c? th? s? d鬾g C玭g th祅h Ti猲 phong l謓h.");
		return 0;
	end;
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","Ch? trong giai 畂筺 c玭g th祅h m玭 m韎 c? th? s? d鬾g C玭g th祅h Ti猲 phong l謓h");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","Th祅h m玭  b? s魀  ho祅 to祅, kh玭g th? ti誴 t鬰 s? d鬾g ");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nDoorIdx ~= 0 then
		Talk(1,"","B筺  l? Th? v? c馻 "..tDoorName[nDoorIdx].."!");
		return 0;
	end;
	local selTab = {
				format("Khi猽 chi課"..tDoorName[1].."Th? v?/#use(%d,%d)",nItemIdx,1),
				format("Khi猽 chi課"..tDoorName[2].."Th? v?/#use(%d,%d)",nItemIdx,2),
				format("Khi猽 chi課"..tDoorName[3].."Th? v?/#use(%d,%d)",nItemIdx,3),
				"H駓 b?/nothing",
				}
	local nEnemyCamp = GONGSHOU_ID - GCZ_GetPlayerCamp();
	local szGEGuardName,szGSGuardName,szGWGuardName = GCZ_GetGuardName(GONG_ID,0);
	local szSEGuardName,szSSGuardName,szSWGuardName = GCZ_GetGuardName(SHOU_ID,0);
	Say("             "..gf_FormatStringLength("Phe c玭g",20)..gf_FormatStringLength("Phe th馹",20).."<enter>"..gf_FormatStringLength(tDoorName[1],12,0)..":"..gf_FormatStringLength(szGEGuardName,20)..gf_FormatStringLength(szSEGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[2],12,0)..":"..gf_FormatStringLength(szGSGuardName,20)..gf_FormatStringLength(szSSGuardName,20).."<enter>"..gf_FormatStringLength(tDoorName[3],12,0)..":"..gf_FormatStringLength(szGWGuardName,20)..gf_FormatStringLength(szSWGuardName,20).."\n\nTr猲 y l? t譶h h譶h th? v? c竎 th祅h th?, c竎 h? mu鑞 khi猽 chi課 Th? v? th祅h m玭 n祇?",getn(selTab),selTab);
end;

function use(nItemIdx,nDoorIdx)
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_READY then
		Talk(1,"","Ch? trong giai 畂筺 c玭g th祅h m玭 m韎 c? th? s? d鬾g C玭g th祅h Ti猲 phong l謓h");
		return 0;
	end;
	if nState > MS_STATE_GONGMEN then
		Talk(1,"","Th祅h m玭  b? s魀  ho祅 to祅, kh玭g c莕 s? d鬾g n鱝");
		return 0;
	end;
	if GetMissionV(MV_DESTROY_EAST_DOOR+nDoorIdx-1) == 1  then
		Talk(1,"","Th祅h n祔  b? s魀 ");
		return 0;
	end;
	local nPlayerCamp = GCZ_GetPlayerCamp();
	local nEnemyCamp = GONGSHOU_ID - nPlayerCamp;
	local szFriendName = GCZ_GetGuardName(nPlayerCamp,nDoorIdx);	--本方守卫名字
	local szEnemyName = GCZ_GetGuardName(nEnemyCamp,nDoorIdx);		--敌方守卫名字
	if szFriendName ~= "Ch璦" and szEnemyName ~= "Ch璦" then	--双方都派人了
		Talk(1,"","Hi謓 Th? v? th祅h m玭 n祔 產ng khi猽 chi課 n u v韎 ngi kh竎 n猲 kh玭g th? khi猽 chi課 Th? v? th祅h m玭 n祔");
		return 0;
	end;	 
	if szFriendName ~= "Ch璦" and szEnemyName == "Ch璦" then	--目前城门被我方占领
		Talk(1,"","Phe ta  ph竔 ngi tr蕁 gi? th祅h m玭 n祔, kh玭g th? xin ph衟 khi猽 chi課");
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	local nEnemyIdx = GCZ_GetGuardPlayerIndex(nEnemyCamp,nDoorIdx);
	if nEnemyIdx > 0 then
		PlayerIndex = nEnemyIdx;
		if GetTaskTemp(TEMP_LOCK) ~= 0 then	--目标守卫被锁定
			Talk2SomeOne(nOldPlayerIdx,1,"","Phe ta  c? ngi g鰅 th? khi猽 chi課 n u v韎 Th? v? th祅h m玭 n祔");
			PlayerIndex = nOldPlayerIdx;
			return 0;
		end;
		PlayerIndex = nOldPlayerIdx;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		if szFriendName == "Ch璦" and szEnemyName == "Ch璦" then	--目前城门没人占领
			Talk(1,"","Hi謓 th祅h n祔 ch璦 c? th? v?, b筺 tr鵦 ti誴 tr? th祅h Th? v? c馻 th祅h m玭 n祔!");
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
			if nPlayerCamp == SHOU_ID then
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,SHOU_ID);
			else
				SetMissionV(MV_TRAP_EAST_DOOR+nDoorIdx-1,ALL_ID);
			end;
			SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
			Msg2MSAll(MISSION_ID,tDoorName[nDoorIdx].." kh玭g ngi tr蕁 th?, b? "..GetName().."("..tCampNameZ[nPlayerCamp]..") chi誱 l躰h d? d祅g");
			return 0;
		end
		if szFriendName == "Ch璦" and szEnemyName ~= "Ch璦" then	--目前城门被敌方占领
			PlayerIndex = nEnemyIdx;
			SetTaskTemp(TEMP_LOCK,1);	--锁定守卫
			Accept1v1(nOldPlayerIdx, GetName(nOldPlayerIdx).." khi猽 chi課 v韎 b筺. дm ngc c遪 %d gi﹜", 15, "\\script\\gongcheng\\item\\gongchengling_item.lua")
			PlayerIndex = nOldPlayerIdx; 
			Msg2Player("Xin ph衟 khi猽 chi課 n u  g鰅 甶. Xin ch? i h錳 ﹎");
		end;
	end;
end;

function OnAccept(nProposerIdx, nType)
	local nGuardIdx = PlayerIndex;
	SetTaskTemp(TEMP_LOCK,0);	--守卫解锁
	if nProposerIdx <= 0 then
		Talk(1,"","цi phng  r阨 kh醝 chi課 trng");
		Msg2Player("цi phng  r阨 kh醝 chi課 trng");
		return 0;
	end;
	local nDoorIdx = GetTaskTemp(TEMP_GURAD_ID);
	if nType == 0 then	--选择取消或操作超时
		PlayerIndex = nProposerIdx;
		local nPlayerCamp = GCZ_GetPlayerCamp();
		SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
		Talk(1,"","Th? v? th祅h m玭 n祔  b? tr鑞, b筺  tr? th祅h T﹏ th? v?. Xin h穣 c? g緉g gi? th祅h!");
		Msg2Player("Th? v? th祅h m玭 n祔  b? tr鑞, b筺  tr? th祅h T﹏ th? v?. Xin h穣 c? g緉g gi? th祅h!");
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nPlayerCamp-1,PlayerIndex);
		local nEnemyCamp = GCZ_GetEnemyCamp();
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nEnemyCamp-1,0);
		GCZ_Msg2Camp(GetName().."S? d鬾g C玭g th祅h Ti猲 phong l謓h tr? th祅h "..tDoorName[nDoorIdx].."Th? v?",nPlayerCamp);		
		PlayerIndex = nGuardIdx;
		nPlayerCamp = GCZ_GetPlayerCamp();
		Msg2Player("Th祅h m玭 do b筺 th? v?  b? ngi kh竎 chi誱");
		Talk(1,"","Th祅h m玭 do b筺 th? v?  b? ngi kh竎 chi誱")
		SetTaskTemp(TEMP_GURAD_ID,0);
		GCZ_Msg2Camp(tDoorName[nDoorIdx].."  b? ch chi誱",nPlayerCamp);
		return 0;
	end;
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nProposerIdx;
	SetTaskTemp(TEMP_CHALLENGER,1);	--设为挑战者
	set_fight_state(GCZ_GetPlayerCamp(),nDoorIdx);
	PlayerIndex = nGuardIdx;
	Msg2MSAll(MISSION_ID,"Чi hi謕"..GetName(nProposerIdx).." ph竧 khi猽 chi課 n u t韎 "..tDoorName[nDoorIdx].."Th? v?"..GetName(nGuardIdx)..".");
end;

function set_fight_state(nCamp,nDoorIdx)
	if IsPlayerDeath() ~= 0 then
		RevivePlayer(0);	--原地重生
	end;
	if GetTaskTemp(TEMP_AUDIENCE) ~= 0 then	--如果正在做观众
		DesaltPlayer(0);
		UseSkillEnable(1);--  (1可以使用武功，0禁止使用武功)
		SetTaskTemp(TEMP_AUDIENCE,0);
	end;	
	CreateTrigger(1,FIGHT_TIMER_ID,FIGHT_TRIGGER_ID);
	SetTimerTime(GetTrigger(FIGHT_TRIGGER_ID),15);
	ContinueTimer(GetTrigger(FIGHT_TRIGGER_ID));
	Restore();
	RestoreNeili();
	RemvoeTempEffect();	--清除所有临时状态
	ClearColdDown();	--清药CD
	CastState("imme_clear_skill_interval",-1,0);	--消除所有技能的冷却时间
	Say("Кn u sau <color=yellow>30 gi﹜<color> s? b総 u!",0);
	Msg2Player("Кn u sau 30 gi﹜ s? b総 u, i b猲 h穣 chu萵 b?!");
	SetTaskTemp(TEMP_GURAD_ID,nDoorIdx);
	SetTaskTemp(TEMP_ARENA_FIGHTING,nCamp);
	SetTaskTemp(TEMP_FIGHT_STATE,ROOM_STATE_READY);
	SetMissionV(MV_GPIDX_EAST_DOOR+2*(nDoorIdx-1)+nCamp-1,PlayerIndex);
	SetPos(tFightingPos[nDoorIdx][1],tFightingPos[nDoorIdx][2]);
end;