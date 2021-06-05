-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 105, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("a b� ng thng", "green")..":"
quest_title = cf_ox_SetColor("M竨 甧n", "yellow").."\n"
quest_detail = cf_ox_SetColor("дn ch� th� s╪ h醝 th╩ nguy猲 nh﹏ a b� kh鉩.", "gray").."\n\n"
quest_description_1 = quest_giver.."Hu hu hu� \n con kh玭g c� � m�. Hu hu gi髉 con v韎 頲 kh玭g卙u hu"
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_001()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 106, 72)
	SetTask(122, 2)

	-- 以下是任务奖励部分
	ModifyExp(200)							-- 经验奖励
	
	-- 以下是文字显示部分
	TaskTip("дn ch� th� s╪ h醝 th╩ nguy猲 nh﹏ a b� kh鉩.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end