--date:2007-3-6
--author:yanjun
--describe:this script will be executed while player kill a npc monster!
Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");

BOX_LIFE_TIME = 2*60*60;	--箱子生存时间2小时

function OnDeath(npcIndex)
	if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
		return 0;
	end;
	SetNpcLifeTime(npcIndex,0);
	SetNpcScript(npcIndex,"");
	local sNpcName = GetNpcName(npcIndex);
	if sNpcName == tNpcInfo[NPC_TYPE_XIANGZHU][2] then
		process_boss_xiangzhu_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_FUTANGZHU][2] then
		process_boss_futangzhu_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_LIDAZUI][2] then
		process_boss_lidazui_death(npcIndex);
	elseif sNpcName == tNpcInfo[NPC_TYPE_KILLER][2] then
		process_killer_death(npcIndex);
	else
		WriteLog("[S竧 Th? Л阯g l莔 l鏸]: File g鑓 l璾 t猲 NPC t? vong b? sai, t猲 b? sai l?:"..tostring(sNpcName));
	end;
end;

function process_boss_xiangzhu_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
	local nBoxNpcIdx = CreateNpc("Rng ti襫","Hng ch? B秓 rng",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);	
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,XIANGZHU_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,XIANGZHU_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_boss_futangzhu_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
	local nBoxNpcIdx = CreateNpc("Rng ti襫","Ph? Л阯g Ch? B秓 Rng",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,FUTANGZHU_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,FUTANGZHU_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_boss_lidazui_death(nNpcIdx)
	local nMapID,nMapX,nMapY = GetNpcWorldPos(nNpcIdx)
	local nBoxNpcIdx = CreateNpc("Rng ti襫","L? Чi Ch駓 B秓 Rng",nMapID,nMapX,nMapY);
	SetNpcScript(nBoxNpcIdx,"\\script\\task\\killer_hall\\box_npc.lua");
	SetNpcLifeTime(nBoxNpcIdx,BOX_LIFE_TIME);
	local nKillerIdx = 0;
	local sKillerModel,sKillerName,nLifeTime = tNpcInfo[NPC_TYPE_KILLER][1],tNpcInfo[NPC_TYPE_KILLER][2],tNpcInfo[NPC_TYPE_KILLER][3];
	for i=1,LIDAZUI_KILLER_COUNT do
		nKillerIdx = CreateNpc(sKillerModel,sKillerName,nMapID,nMapX,nMapY,-1,1,1,LIDAZUI_KILLER_COUNT*10)
		SetNpcDeathScript(nKillerIdx,"\\script\\task\\killer_hall\\npc_death.lua")
		SetNpcLifeTime(nKillerIdx,nLifeTime);
	end
end;

function process_killer_death(nNpcIdx)
	local nRand = random(1,100);
	ModifyExp(10000);
	if nRand <= 5 then	--%5
		KH_Add_Random_Mystic_Thing(1);	--神秘物品
	end;
	nRand = random(1,100);
	if nRand <= 2 then	--%2
		nRand = random(1,100);
		if nRand <= 30 then
			if AddItem(tItemInfo[2][2],tItemInfo[2][3],tItemInfo[2][4],1) == 1 then--秘籍碎片
				Msg2Player("B筺 頲 1 "..tItemInfo[2][1]);
				WriteLog("[S竧 Th? Л阯g]:"..GetName().."Nh薾 頲"..tItemInfo[2][1]);
			end;
		end
	end;
end;