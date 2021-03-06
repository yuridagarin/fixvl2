-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 4, 2, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch? l玦 i", "green")..":"
quest_title = cf_ox_SetColor("B竧 Qu竔 蕁_C祅", "yellow").."\n"
quest_detail = cf_ox_SetColor("Nh薾 頲 B竧 qu竔 蕁-C祅.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ngi n t譵 mi課g ng鋍 c? kh綾 ch? g? gi鑞g ch? c祅 ph秈 kh玭g? \nH?? C騨g kh玭g ph秈 c馻 ngi? Nh璶g th玦! C馻 ai c騨g 頲. T苙g cho ngi ! Ta kh玭g quan t﹎ n鱝!"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_001_002()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	SetTask(101, 3)							-- 任务流程标记为 2 ，表示在下一次登陆后由 playerloginin.lua 创建新的任务
	
	-- 以下是任务奖励部分
	AddItem(2, 0, 9, 1)						-- 给予玩家任务道具 八卦印·乾
	ModifyExp(300)							-- 给予玩家经验奖励
	
	-- 以下是文字显示部分
	TaskTip("Nh薾 頲 B竧 qu竔 蕁-C祅.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end