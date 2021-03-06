------------------------------------------------------------
-- 农桑辑要的脚本 shenghuojineng.lua
--
-- comment: 使用学习到一个采集技能
-- creator: Tony(Jizheng)
-- Date   : Feb 1st, 2007
--
-- Item ID:  2,1,1056
------------------------------------------------------------
DIG_SKILL_LEVEL = 70		-- 生活技能的等级

-- 使用物品的时候，默认的入口函数
function OnUse(nIdx)
	local nScrollIndex = tonumber(nIdx)		-- 被使用的生活手札的Index
	Say("B筺 mu鑞 d飊g <color=yellow>N玭g Tang ph?<color>? N? c? th? gi髉 b筺 h鋍 頲 1 trong c竎 k? n╪g thu th藀 n c蕄 <color=yellow>70<color>.",
		8,
		"K? n╪g n c﹜/#learn_dig_skill("..nScrollIndex..", 1)",
		"K? n╪g thu閏 da/#learn_dig_skill("..nScrollIndex..", 2)",
		"K? n╪g canh t竎/#learn_dig_skill("..nScrollIndex..", 3)",
		"K? n╪g h竔 thu鑓/#learn_dig_skill("..nScrollIndex..", 4)",
		"K? n╪g khai kho竛g/#learn_dig_skill("..nScrollIndex..", 5)",
		"K? n╪g k衞 t?/#learn_dig_skill("..nScrollIndex..", 6)",
		"T藀 linh/#learn_dig_skill("..nScrollIndex..", 7)",
		"T筸 th阨 ch璦 c莕!/cancel_dialog")
end;

function cancel_dialog()
end;

-- 学会制定的技能到制定级别
function learn_dig_skill(nScrollIndex, nSkillID)
	local nCurDigSkillLevel = GetLifeSkillLevel(0, nSkillID)
	if (nCurDigSkillLevel >= 70) then
		Say("B筺  h鋍 頲 k? n╪g thu th藀 n祔 v? vt qua c蕄 70, kh玭g c莕 s? d鬾g N玭g Tang ph?! ", 0)
		return
	end
	
	if (DelItemByIndex(nScrollIndex, 1) == 1) then
		LearnLifeSkill(0, nSkillID, 70, 79, 0)
		SetTask(1925, 15)
	end
	
	Say("B筺  h鋍 頲 k? n╪g thu th藀 n祔!", 0)
end;

