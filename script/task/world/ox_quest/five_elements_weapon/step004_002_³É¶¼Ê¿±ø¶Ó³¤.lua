-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 9, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("чi trng Binh s?", "green")..":"
quest_title = cf_ox_SetColor("Thu閏 t輓h v? kh?", "yellow").."\n"
quest_detail = cf_ox_SetColor("дn th? r蘮 Bi謓 Kinh h醝 th╩ v? c竎h gi誸 qu竔", "gray").."\n\n"
--quest_description_1 = quest_giver.."看来江津村里的邪气似乎已经感染到其他地方了，但是还不能确定那些流氓是否跟这些僵尸一样，已经是完全死去的人，要调动这么多看起来毫无意识的怪物，肯定有一个幕后的控制者，但是现在看起来似乎毫无头绪啊。\n由于那些瘴气，我们根本进不了江津村，而那些僵尸用通常的兵刃也很难杀死。现在看来需要找到能杀死这些怪物的方法才行，汴京城里有位经验丰富的铁匠，也经常为朝廷制作精兵利刃。"
quest_description_1 = quest_giver.."T? kh? ? Giang t﹏ th玭  lan sang c竎 v飊g kh竎, kh玭g bi誸 m蕐 t猲 L璾 manh  c? ch誸 gi鑞g nh? c竔 x竎 kia kh玭g. C莕 ph秈 c? m閠 ngi  kh鑞g ch? b鋘 y猽 qu竔 n祔. \n Nghe n鉯 th? r蘮 ? Bi謓 Kinh bao n╩  c luy謓 binh kh? cho binh l輓h c馻 Tri襲 nh, c? th? r蘮 ra m閠 lo筰 v? kh? tr? 頲 b鋘 y猽 ma. Ngo礽 ra c遪 ph秈 甶襲 tra xem ng sau b鋘 ch髇g c遪 萵 ch鴄 甶襲 g? n鱝."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_002()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 12, 51)					-- 创建下一个触发器
	SetTask(101, 14)
	
	-- 以下是任务奖励部分
	ModifyExp(200)							-- 给予玩家经验奖励
		
	-- 以下是文字显示部分
	TaskTip("дn th? r蘮 Bi謓 Kinh h醝 th╩ v? c竎h gi誸 qu竔")
	Say(quest_title..quest_detail..quest_description_1, 0)
end