-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 4, 3, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("V? binh th祅h m玭", "green")..":"
quest_title = cf_ox_SetColor("B総 c鉩", "yellow").."\n"
quest_detail = cf_ox_SetColor("T譵 B? u ? Th祅h Й h醝 th╩ v? v? b総 c鉩.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ch﹗ i nh﹏ v鮝 tr譶h b竜, canh 3 m qua c? m閠 ngi b辴 m苩 t nh藀 b総 c鉩 ti觰 th?, h緉 c遪 l祄 r琲 m閠 mi課g ng鋍. N誹 th蕐 ai ng nghi ho芻 c? tin t鴆 g? mau n g苝 sai nha h錳 b竜."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_001()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 4, 51)					-- 创建下一个触发器
	SetTask(101, 5)
	
	-- 以下是任务奖励部分
	
	-- 以下是文字显示部分
	TaskTip("T譵 B? u ? Th祅h Й h醝 th╩ v? v? b総 c鉩.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end