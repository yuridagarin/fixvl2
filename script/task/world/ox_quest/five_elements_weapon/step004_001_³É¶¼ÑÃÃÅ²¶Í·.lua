-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 8, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("B? u", "green")..":"
quest_title = cf_ox_SetColor("Th玭g b竜 tin t鴆", "yellow").."\n"
quest_detail = cf_ox_SetColor("дn Giang T﹏ th玭 i tho筰 v韎 trng v? binh", "gray").."\n\n"
quest_description_1 = quest_giver.."чc kh? ? Giang T﹏ th玭 ng祔 c祅g n錸g n芻, kh玭g ai c? th? ch辵 ng n鎖. \n Nh? b籲g h鱱 n sai nha b萴 b竜, ta ngh? chuy謓 n祔 c? li猲 quan n m蕐 t猲 L璾 manh ."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_001()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 9, 51)					-- 创建下一个触发器
	SetTask(101, 13)
	
	-- 以下是任务奖励部分
	AddItem(2, 0, 17, 1)					-- 捕头令牌
	
	-- 以下是文字显示部分
	TaskTip("дn Giang T﹏ th玭 i tho筰 v韎 trng v? binh")
	Say(quest_title..quest_detail..quest_description_1, 0)
end