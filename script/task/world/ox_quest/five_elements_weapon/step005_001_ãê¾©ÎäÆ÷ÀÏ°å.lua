-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 12, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Ch? Ti謒 v? kh?", "green")..":"
quest_title = cf_ox_SetColor("Thu閏 t輓h v? kh?", "yellow").."\n"
quest_detail = cf_ox_SetColor("цi tho筰 v韎 th? r蘮 Bi謓 Kinh.", "gray").."\n\n"
quest_description_1 = quest_giver.."L骳 ta c遪 nh? trong th玭 c騨g x秠 ra m閠 l莕 kinh ho祅g, Ph輆 sau n骾, n琲 th玭 c蕋 nh鱪g thi th? b鏽g nhi猲 m鋍 l猲 nh鱪g lo礽 c﹜ l? r錳 n? hoa r蕋 p. M閠 ng祔 sau  nh鱪g a hoa n祔 t祅 甶 v? thi c鑤 b総 u xu蕋 hi謓 t竎 lo筺 kh緋 n琲. Cha ta c? n Thi誹 L﹎ T? c莡 c鴘 頲 c竎 v? s? t╪g ch? gi竜 d飊g Kim Cang H? Nha kh秏 n筸 v祇 v? kh? c? th? tr? 頲 b鋘 y猽 qu竔 kia."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_001()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 13, 51)					-- 创建下一个触发器
	SetTask(101, 15)
	
	-- 以下是任务奖励部分
	ModifyExp(200)							-- 给予玩家经验奖励
		
	-- 以下是文字显示部分
	TaskTip("цi tho筰 v韎 th? r蘮 Bi謓 Kinh.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end