-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 4, 1, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("V? s?", "green")..":"
quest_title = cf_ox_SetColor("B竧 Qu竔 蕁_C祅", "yellow").."\n"
quest_detail = cf_ox_SetColor(" t譵 Ch? L玦 i ? Th祅h Й  h醝 th╩ v? m鉵 v藅 c? nh鱪g v誸 kh綾 th莕 b?", "gray").."\n\n"
quest_description_1 = quest_giver.."Kh玭g bi誸 bao gi? i ti觰 th? m韎 t譵 頲 m閠 anh h飊g c竔 th?  k誸 th﹏ y! Thi猲 h? sao b﹜ gi? ai c騨g v? c玭g k衜 th? kh玭g bi誸 \n ?!H玬 qua 玭g ch? h譶h nh? c? n鉯 l? nh苩 頲 v藅 g? c? kh綾 nh鱪g h譶h th? k? b?, nh璶g h醝 ra kh玭g ai nh薾"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_001_001()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 2, 51)					-- 创建下一个触发器
	SetTask(101, 2)
	
	-- 以下是任务奖励部分
	
	-- 以下是文字显示部分
	TaskTip(" t譵 Ch? L玦 i ? Th祅h Й  h醝 th╩ v? m鉵 v藅 c? nh鱪g v誸 kh綾 th莕 b?")
	Say(quest_title..quest_detail..quest_description_1, 0)
end