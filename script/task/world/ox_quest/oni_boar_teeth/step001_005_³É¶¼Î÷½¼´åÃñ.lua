-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 53, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th玭 d﹏", "green")..":"
quest_title = cf_ox_SetColor("T﹎ b蕋 an", "yellow").."\n"
quest_detail = cf_ox_SetColor("Ti誴 t鬰 di謙 Heo r鮪g", "gray").."\n\n"
quest_description_1 = quest_giver.."Ta v蒼 c? c秏 gi竎 b蕋 an, dng nh? Heo r鮪g v蒼 c遪 quanh qu萵 u y."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_005()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(0, 53, 61)
	SetTask(111, 6)

	-- 以下是任务奖励部分
	ModifyExp(200)							-- 获得任务经验奖励
	
	-- 以下是文字显示部分
	TaskTip("Ti誴 t鬰 di謙 Heo r鮪g")
	Say(quest_title..quest_detail..quest_description_1, 0)
end