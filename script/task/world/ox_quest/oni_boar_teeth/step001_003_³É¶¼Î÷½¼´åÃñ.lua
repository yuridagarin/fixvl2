-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 52, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th玭 d﹏", "green")..":"
quest_title = cf_ox_SetColor("Di謙 Heo r鮪g", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gi髉 d﹏ l祅g di謙 20 Heo r鮪g", "gray").."\n\n"
quest_description_1 = quest_giver.."V飊g n祔 Heo r鮪g nhi襲 qu?. \nЧi hi謕 c? c竎h n祇 ti猽 tr? ch髇g kh玭g?"
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_003()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(0, 52, 61)
	SetTask(111, 4)

	-- 以下是任务奖励部分
	DelItem(2, 0, 13, 1)						-- 删除玩家任务道具 丢失的包裹
	ModifyExp(200)							-- 获得任务经验奖励
	
	-- 以下是文字显示部分
	TaskTip("Gi髉 d﹏ l祅g di謙 20 Heo r鮪g")
	Say(quest_title..quest_detail..quest_description_1, 0)
end