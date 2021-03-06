-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC高升泉Script
-- By StarryNight
-- 2005/12/30 PM 15:26

--乙酉年 戊子月 戊子日 
--宜: 合帐 裁衣 教牛马 馀事勿取 
--忌: 入宅 动土 破土 嫁娶 作灶 造船 
--吉神宜趋: 官日 敬安 金匮  
--凶神宜忌: 月建 小时 土府 月厌 地火  
--五行: 霹雳火  建执位  
--彭祖百忌: 戊不受田田主不祥 子不问卜自惹祸殃 

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nLevel = GetLevel();
local nTask_DL_State_10 = GetTask(TASK_DL_LV10_ID);
local nTask_DL_State_20 = GetTask(TASK_DL_LV20_ID);
local nTask_DL_State_30 = GetTask(TASK_DL_LV30_ID);
local nTask_DL_State_35 = GetTask(TASK_DL_LV35_ID);
local nTask_DL_State_35_01 = GetTask(TASK_DL_LV35_01_ID);
local nTask_DL_State_35_zx = GetTask(TASK_DL_LV35_ID_ZX);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
local nTask_DL_State_55 = GetTask(TASK_DL_LV55_ID);
local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID);
local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID);
local nTask_DL_State_70 = GetTask(TASK_DL_LV70_ID);
	
	--领取大理国公任务
	if nLevel >= 20 and nTask_DL_State_10 >= 4 and nTask_DL_State_20 == 0 then
		task_000_00();
		return
	end
	
	if nTask_DL_State_20 == 1 then
		local strTalk = {
			"<sex> c? c玭g 甶 ti猽 di謙 20 con r誸 c tr? h筰 cho l? kh竎h!"
		}
		TalkEx("task_001_00",strTalk);
		return
	end;
	
	if nTask_DL_State_20 == 2 then
		task_002_00();
		return
	end;
	
	if nTask_DL_State_20 == 3 then
		task_003_00();
		return
	end;
		
	if nTask_DL_State_20 == 4 then
		task_004_00();
		return
	end;
	
	if nTask_DL_State_20 == 5 then
		task_005_00();
		return
	end;
	
	if nTask_DL_State_30 >= 1 and nTask_DL_State_30 <= 4 then
		task_006_00();
		return
	end;
	
	if nTask_DL_State_30 == 5 then
		task_007_00();
		return
	end;
	
	if nTask_DL_State_30 == 6 then
		task_008_00();
		return
	end;
	
	--已领取武陵山任务,未完成
	if nTask_DL_State_35 == 1 or nTask_DL_State_35_zx == 1 then
		if nTask_DL_State_35_01 == 1 or nTask_DL_State_35_01 == 10 then
			task_010_00();
			return
		end;
		if nTask_DL_State_35_01 == 2 then
			task_010_10();
			return
		end;
		return
	end;
	
	--已完成打倒蚩火教徒任务
	if nTask_DL_State_35 == 2 then
		task_011_00();
		return
	end
	
	--已结束武陵山任务
	if nTask_DL_State_35 == 3 then
		task_012_00();
		return
	end
	
	--未触发55级凤凰翎任务
	if nTask_DL_State_50 == 7 then
		task_013_00();
		return
	end
	
	--已经触发55级凤凰翎任务
	if nTask_DL_State_55 == 1 then
		task_014_00();
		return
	end
	
	--未去找莫三对话，未打倒凤凰
	if nTask_DL_State_55 >= 2 and nTask_DL_State_55 <= 3 then
		task_015_00();
		return
	end
	
	--打倒凤凰后
	if nTask_DL_State_55 == 4 then
		task_016_00();
		return
	end
	
		--完成凤凰任务后
	if nTask_DL_State_55 == 5 then
		task_017_00();
		return
	end
	
	--完成郑贯之的货款任务后领取70级任务蚩火教的挑战书
	if nTask_DL_State_60_1 == 6 and nTask_DL_State_60_2 == 5 and nTask_DL_State_70 == 0 then
		task_018_00()
		return
	end
	
	--未打败阿修罗之前/打败阿修罗未打开信件阅读
	if nTask_DL_State_70 >= 1 and nTask_DL_State_70 <= 2 then
		task_019_00()
		return
	end
	
	--打败阿修罗且已经打开信件阅读
	if nTask_DL_State_70 == 3 then
		task_020_00()
		return
	end
	
	--完成蚩火教的挑战书任务后
	if nTask_DL_State_70 >= 4 then
		local strTalk = {
			"Th﹏ l? Qu鑓 c玭g Чi L? ph秈 ch辵 tr鋘g tr竎h n苙g n?....."
			}	
		TalkEx("",strTalk);
		return
	end
	
	local strTalk = {
		"Th﹏ l? Qu鑓 c玭g Чi L? ph秈 ch辵 tr鋘g tr竎h n苙g n?....."
	}	
	TalkEx("",strTalk);
	return
end
