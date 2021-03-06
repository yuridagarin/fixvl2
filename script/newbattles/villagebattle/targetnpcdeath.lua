--filename:targetnpcdeath.lua
--create date:2006-06-02
--describe:目标NPC死亡脚本
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnDeath(npcIndex)
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		return 0;
	end;
	local nCamp = BT_GetCamp()
	local nEnemyCamp = 3 - nCamp;
	local sName = GetMissionS(MSTR_SONG_TARGETNAME-1+nCamp);
	local sNewTargetName = "";
	local nStep = 0;
	local nPoint = 0;
	local nEvenID = 0;
	local nNpcType = 0;
	SetNpcLifeTime(npcIndex,DEAD_BODY_TIME);
	SetNpcDeathScript(npcIndex,"");
	BT_EmperorAward(1);
	BT_AddBattleActivity(BA_VILL_TALK_TARGET);
	if tonumber(npcIndex) == GetMissionV(MV_TASK_NPCINDEX_SONG-1+nCamp) then	--杀死的是本方目标NPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			nStep = 1;
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = 2;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = 3;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		BT_AddBattleEvenPoint(nEvenID);
		if Modify_Task_Step(nCamp,nStep) == 1 then
			Reach_Final_Step(nCamp);
		else
			sNewTargetName = Go_To_Next_Step(nCamp);
			Talk(1,"","<color=green>"..sName.."<color>: C竎 ngi mu鑞 t譵 th? l躰h, ph秈 甶 h醝 <color=yellow>"..sNewTargetName.."<color>, h緉 ta thng ? trong th玭.")
			Msg2MSGroup(MISSION_ID,"Doanh tr筰 c蕄 b竜:"..sNewTargetName.."c? th? bi誸 tung t輈h th? l躰h, m阨 c竎 v? anh h飊g nhanh ch鉵g t譵 ra. Hi謓 phe ta nh薾 頲 s? t輓 nhi謒 c馻 th? d﹏ l?"..GetMissionV(MV_SONG_TASKSTEP+nCamp-1)..".",nCamp);
		end;
	else	--杀死的是敌方目标NPC
		nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nEnemyCamp-1);
		if nNpcType == SICK_NPC then
			nStep = -2;	--扣掉敌方步骤数
			nEvenID = BP_VILLAGE_KILL_SICK;
		elseif nNpcType == ANGRY_NPC then
			nStep = -3;
			nEvenID = BP_VILLAGE_KILL_ANGRY;
		else
			nStep = -5;
			nEvenID = BP_VILLAGE_KILL_RAGIN;
		end;
		Modify_Task_Step(nEnemyCamp,nStep);
		BT_AddBattleEvenPoint(nEvenID);
		sNewTargetName = Go_To_Next_Step(nEnemyCamp);
		BT_OperateAllPlayer(tell_fail,{sNewTargetName,nEnemyCamp},nEnemyCamp)
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "Цng ti誧! B竎h S? Th玭g  b? ch phng s竧 h筰. Nh璶g ta v鮝 nh薾 頲 tin t鴆: Th? d﹏ <color=yellow>"..sName.."<color> c? th? bi誸 tung t輈h c馻 th? l躰h, m阨 tng s? <color=yellow>";
	if GetMissionS(MSTR_SONG_ONE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_ONE+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_TWO+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_TWO+nCamp-1)..", ";
	end;
	if GetMissionS(MSTR_SONG_THREE+nCamp-1) ~= "" then
		sContent = sContent..GetMissionS(MSTR_SONG_THREE+nCamp-1)..", ";
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color> mau n  t譵 B竎h S? Th玭g c? li猲 quan  t譵 ra t玭g t輈h <color=yellow>"..sName.."<color>.";
	Say(sContent,0);
end;