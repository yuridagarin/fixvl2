--File name:boss_death.lua 
--Describe:三节连过，策划BOSS死亡脚本
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,20);
	SetNpcDeathScript(nNpcIndex,"");
	local sNpcName = GetNpcName(nNpcIndex);
	local sCuteBossName = "";
	local nNpcPosID = GetNpcWorldPos(nNpcIndex);
	local nBossID = 0;
	local nPosIndex = get_pos_index(nNpcPosID);
	for i=1,getn(tBossInfo) do 
		if sNpcName == tBossInfo[i][3] then
			nBossID = i;
			break;
		end;
	end;
	Msg2SubWorld(tBossPos[nPosIndex][1].." giang h? 竎 nh﹏ "..sNpcName.." b? m鋓 ngi h頿 s鴆 nh b筰!")
	AddGlobalNews(tBossPos[nPosIndex][1].." giang h? 竎 nh﹏ "..sNpcName.." b? m鋓 ngi h頿 s鴆 nh b筰!");
	if nBossID == 0 then
		WriteLog("[L鏸 Tam ti誸 li猲 th玭g]: Sau khi Boss ch誸 kh玭g t譵 th蕐 th玭g tin tng 鴑g c馻 Boss");
		nBossID = 9;	--容错处理
	end;
	local nCuteBossIndex = 0;
	for i=1,CUTE_BOSS_COUNT do
		nCuteBossIndex = CreateNpc(tBossInfo[nBossID][2],tBossInfo[nBossID][4],tBossPos[nPosIndex][2],tBossPos[nPosIndex][3],tBossPos[nPosIndex][4],6,1,1,1500);	--诞生点最好为地图中心
		SetNpcScript(nCuteBossIndex,"\\script\\online\\3festival\\cute_boss_npc.lua");
		SetNpcLifeTime(nCuteBossIndex,60*60);	--60分钟生存时间
	end;
	if random(1,100) == 11 then
		Talk(1,"","<color=green>"..sNpcName.."<color>: "..tRandString[random(1,getn(tRandString))]);
	end;
end;

tRandString = {
			" chao! Цnh ta 產u qu?!",
			"Ngi h穣 nh? k?",
			"L莕 sau nh ti誴.",
			"VLTK2 ch骳 b筺 n╩ m韎 vui v?!",
			"Qu鑓 Kh竛h vui v?!",
			"Trung Thu vui v?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			" chao! Цnh ta 產u qu?!",
			}
			
function get_pos_index(nMapID)
	for i=1,getn(tBossPos) do
		if nMapID == tBossPos[i][2] then
			return i
		end;
	end;
	return 0;
end;