-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 西北区任务物品”六扇门烟火“Script
-- By StarryNight
-- 2007/06/12 AM 10:43

-- 世界变化的太快，珍惜只是无稽之谈。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");

function OnUse()

local nMapDataID = 0;
local nMapName = "";
local nMapID,nXworldpos,nYworldpos,nXpos,nYpos = 0,0,0,0,0;
local mapID,xPos,yPos = GetWorldPos();
local nNpcIndex = 0;
local strTalk = {};

	--判断任务步骤
	if GetTask(TASK_XB_ID) == 19 then
	
		nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
		nMapName = Map_Data[nMapDataID][1];
		nMapID = Map_Data[nMapDataID][2];
		nXworldpos = Map_Data[nMapDataID][3];
		nYworldpos = Map_Data[nMapDataID][4];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];
		
		--判断目标地点是否正确
		if nMapID == mapID and ((nXworldpos - 50) <= xPos ) and (xPos <=(nXworldpos + 50)) and ((nYworldpos - 50) <= yPos ) and (yPos<=(nYworldpos + 50)) then
			DelItem(2,0,692,1);
			DoFireworks(808,1);--烟花效果
			nNpcIndex = CreateNpc("Vi猲 Phi V﹏ ","Danh b? Vi猲 Phi V﹏ ",nMapID,nXworldpos,nYworldpos);
			SetNpcLifeTime(nNpcIndex,1200);
			SetNpcScript(nNpcIndex,"\\script\\西北区\\凤翔府\\npc\\袁飞云.lua");
			SetTask(YUANFEIYUN_NPCINDEX,nNpcIndex);--记录袁飞云NpcIndex
		else			
			strTalk = {
			"Theo nh? l阨 B竎h Hi觰 Sinh ti襫 b鑙, Vi猲 b? u hi謓 產ng ? g莕 "..nMapName.."("..nXpos..", "..nYpos.."), s? d鬾g Ph竜 hi謚 L鬰 Phi課 m玭 l? c? th? g苝 nhau r錳.",
				}
			TalkEx("",strTalk);
		end
	
	
	else
		strTalk = {
			"Ph竜 hi謚 n祔 dng nh? ch糿g c? t竎 d鬾g g?, n猲 v鴗 甶   chi誱 ch?.",
				}
		TalkEx("",strTalk);
		DelItem(2,0,692,1);
	end		

end
