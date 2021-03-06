-- 读入随机任务头文件
Include("\\script\\task\\random\\task_head.lua");

function OnUse()

local nState         = GetTask(TASKSTATE_ID);

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- 得到任务 NPC 所在地图ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- 得到任务 NPC 的名字
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- 得到任务 NPC 所在地图中文名


	if nState==1 then
		ShowTaskNpcByPack();
		return	
	elseif nState==2 then
		Say("H穣 ho祅 th祅h nhi謒 v? "..strNpcMap.."-"..strNpcName.." giao cho ngi!"..GetTaskClearInfo(),0);
		return
	else
		Say("S? ph? hi謓 ch璦 c? nhi謒 v? m韎 n祇 giao cho b筺.", 0);
		return
	end;

end;


-- 告诉玩家任务 NPC 的位置
function ShowTaskNpcByPack()

local nNpcID         = GetTask(TASKNPC_ID);
local nRow           = tabNpcName:selectRowNum("NpcID", nNpcID);

local nNpcMapID      = tonumber(tabNpcName:getCell(nRow, "MapID")); -- 得到任务 NPC 所在地图ID

local strNpcName     = tabNpcName:getCell(nRow, "NpcName"); -- 得到任务 NPC 的名字
local strNpcMap      = tabNpcName:getCell(nRow, "NpcMap");  -- 得到任务 NPC 所在地图中文名

local strBossName    = FactionBossName[GetPlayerFaction()];
local strBossTitle   = FactionBossTitle[GetPlayerFaction()];

	Say("B筺 nh薾 頲 b? c﹗ a th? c馻"..strBossTitle.."{b? c﹗ a th瓆"..strBossName.."nh? b筺 n <color=yellow>"..strNpcMap.."<color> t譵 <color=yellow>"..strNpcName.."<color>, ngi n祔 c莕 s? gi髉  c馻 b筺, ng th阨 d苙 b筺 d? th? n祇 c騨g ph秈 ho祅 th祅h nhi謒 v? 頲 giao!",
		2,
		"дn n琲 l祄 nhi謒 v?/#AcceptTask("..nNpcMapID..")",
		"сng/Main_Exit");
end;