-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒教NPC勾册Script
-- By StarryNight
-- 2006/02/09 PM 14:12

-- 爱情自由若可皆得甘就好了

-- ======================================================

-- 入门门任务头文件
Include("\\script\\task\\faction\\faction_main_wp.lua"); 
Include("\\script\\task\\faction_back_room\\npc_master.lua");
g_szThisFile = "\\script\\西南区\\五毒教\\npc\\勾册.lua";	--默认值
g_szInforHeader = "<color=green>C﹗ S竎h<color>:";	--默认值
g_nBackRoomEntryType = 1;	--入口类型，分两种。1表示从师傅处进入，2表示从道具处进入

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 1 then
		task_001();
		return
	end
	
	if nTaskValue == 2 then
		Say("<color=yellow>Phng Vi猲<color> ? <color=yellow>ph遪g b猲<color> !",0);
		return
	end
	
	if nTaskValue == 6 then
		task_010();
		return
	end
	
	if nTaskValue == 7 then
		Say("Ngi c? th? n g苝 <color=yellow>B筩h gi竜 ch?<color>.",0);
		return
	else
		backroom_main();
	end
end;
