--filename:resource_npc.lua
--create date:2006-06-16
--describe:粮草脚本
Include("\\script\\newbattles\\resourcebattle\\resourcebattle_head.lua");
function main()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex == 0 then
		return 0;
	end;
	local bExist = GetUnitCurStates(nNpcIndex,0);	--使用等级属性作是否存在的标记
	if bExist == 0 then
		return 0;
	end;
	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_FIGHT then
		Msg2Player("Kh玭g th? thu th藀 lng th秓 n祔.");
		return 0;
	end;
	if IsHaveState(1) > 0 then	--是否骑马
		Msg2Player("Tr猲 ng鵤 kh玭g th? nh苩 lng th秓.");
		return 0;
	end;
	local _,nNpcPosX,nNpcPosY = GetNpcWorldPos(nNpcIndex);
	if BT_GetDistance(nNpcPosX,nNpcPosY) >= 15 then
		Msg2Player("B筺  xa khu v鵦 lng th秓!");
		return 0;
	end;
	if GetItemCount(tBattleItem[4][2],tBattleItem[4][3],tBattleItem[4][4]) <= 0 then
		Msg2Player("Kh玭g c? cu鑓 kh玭g th? thu th藀 lng th秓.");
		return 0;
	end;
--	local nMainType,nSubType1,nSubType2 = GetPlayerEquipInfo(2);
--	if nMainType ~= 0 or nSubType1 ~= 0 or nSubType2 ~= 0 then
--		Msg2Player("手里握着武器，采集粮草变得异常困难。");
--		return 0;
--	end;
	if DoFireworks(DIGGING_ACTION_ID,1) == 1 then
		Msg2Player("ng thu th藀 lng th秓厖......");
		CastState("state_fetter",1,5*18)
		ProgressSlot(5*18);	--5秒
		SetNpcLifeTime(nNpcIndex,0);
		AddUnitStates(nNpcIndex,0,-bExist);	--置0
		SetNpcScript(nNpcIndex,"");
	else
		Msg2Player("Kh玭g th? l祄 ng t竎 n祔 ? tr筺g th竔 ng錳")
	end;
end;


function OnProgressCallback()
	local nCamp = BT_GetCamp();
	if random(1,100) <= 50 then
		Msg2MSGroup(MISSION_ID,"Ngi ch琲"..GetName().."t筰 Nh筺 M玭 Quan-Th秓 c鑓 chi課 o b韎 b鮝 b穒 秐h hng n m玦 trng n猲 b? th? d﹏ truy 畊鎖, ch? ngi ch琲 n gi秈 c鴘",nCamp);
		local npcIndex = CreateNpc("Ho祅 trng Th? d﹏","Th? d﹏ gi薾 d?",GetWorldPos());
		SetNpcDeathScript(npcIndex,"\\script\\newbattles\\resourcebattle\\angryvillager_death.lua");	
	else
		AddItem(tBattleItem[3][2],tBattleItem[3][3],tBattleItem[3][4],3);
		Msg2Player("B筺 nh薾 頲 3 bao "..tBattleItem[3][1]);	
	end;
	BT_AddBattleActivity(BA_RESO_GOT_RES);
	Use_Hoe();
end;