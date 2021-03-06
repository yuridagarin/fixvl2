--补偿修复玩家镇派技能等级异常问题
--转生设置角色等级小于85级 导致镇派秘籍不能起作用 导致角色镇派技能等级异常
--我方目前暂定的修改方案为：
--1.修复秘籍不起作用的情况下 镇派技能等级异常的问题
--2.增加一个Npc功能 通过npc对话 自动将已经异常的角色镇派技能等级设置为10级（要求玩家脱下镇派秘籍）
--自动设置的判断条件为：a.玩家已经是4转或4转以上
--b.玩家镇派技能不满10级
--该NPC功能时限设置为7天 7天之后该功能无效



Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
t_zhenpai_skill = --镇派技能
{
	[2] = 32, --少林俗家
	[3] = 57,--少林禅宗
	[4] = 44,--少林武宗
	[6] = 74,--唐门
	[8] = 89,--峨嵋佛家
	[9] = 102,--峨嵋俗家
	[11] = 113,--丐帮净衣
	[12] = 124,--丐帮污衣
	[14] = 146,--武当道家
	[15] = 159,--武当俗家
	[17] = 732,--杨门枪骑
	[18] = 745,--杨门弓骑
	[20] = 775,--五毒邪侠
	[21] = 774,--五毒蛊师
}

function OnNpcTalkRepairGreatSkill()
	local nDate = tonumber(date("%Y%m%d"))
	if not (nDate >= 20130418 and nDate <= 20130511) then--不在补偿期
		Talk (1,"",format("%s","T輓h n╪g kh玭g n籱 trong th阨 h筺 c? hi謚 l鵦"))
		return
	end
	
	local szTitle = format("襲 ki謓 s鯽 ch鱝 k? n╪g tr蕁 ph竔: chuy觧 sinh 4 tr? l猲, kh玭g c? ph? m藅 t辌h trang b?, k? n╪g tr蕁 ph竔 kh玭g  10 c蕄")
	local tbSay = {}
	tinsert(tbSay, format("%s/_On_Repair","Th醓  甶襲 ki謓  ph鬰 h錳 k? n╪g tr蕁 ph竔"))
	tinsert(tbSay, "T? b?/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _On_Repair()
	local nSkillId = t_zhenpai_skill[GetPlayerRoute()]
	if not nSkillId then--流派异常
		Talk (1,"",format("%s%s!","S鯽 ch鱝 k? n╪g tr蕁 ph竔","襲 ki謓 kh玭g ph? h頿 !"))
		return
	end
	if GetTranslifeCount() < 4 and GetPlayerRebornParam(0) < 1 then
		Talk (1,"",format("%s%s!","S鯽 ch鱝 k? n╪g tr蕁 ph竔","襲 ki謓 kh玭g ph? h頿 !!"))
		return
	end
	if GetPlayerEquipIndex(9) ~= 0 then--副秘籍位置有装备
		Talk (1,"",format("%s%s!","S鯽 ch鱝 k? n╪g tr蕁 ph竔","襲 ki謓 kh玭g ph? h頿 !!!"))
		return
	end
	
	if GetSkillLevel(nSkillId) >= 10 then--技能正常
		Talk (1,"",format("%s%s!","S鯽 ch鱝 k? n╪g tr蕁 ph竔","襲 ki謓 kh玭g ph? h頿 !!!!"))
		return
	end
	
	local nOldSkillLv = GetSkillLevel(nSkillId) or 0
	
	--执行修复操作
	if nOldSkillLv <= 0 then
		LearnSkill(nSkillId)
	end
	local nSkillNewLv = GetSkillLevel(nSkillId) or 0
	while nSkillNewLv < 10 do
		local nSkillLvBfUp = GetSkillLevel(nSkillId) or 0
		if LevelUpSkill(nSkillId) ~= 1 then
			Talk (1,"",format("%s%s!","S鯽 ch鱝 k? n╪g tr蕁 ph竔","Th蕋 b筰"))
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail", 1, "Fix fail");
			break
		end
		nSkillNewLv = GetSkillLevel(nSkillId) or 0
		if nSkillNewLv <= nSkillLvBfUp then
			Talk (1,"",format("%s%s!","S鯽 ch鱝 k? n╪g tr蕁 ph竔","Th蕋 b筰"))
			gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update skill fail2", 1, "Fix fail2");
			break
		end
	end
	
	Talk (1,"",format("%s%s!","S鯽 ch鱝 k? n╪g tr蕁 ph竔"," th祅h c玭g "))
	local szLog = format("Role[%s] Route[%d] update greate skill[%d] from[%d]-->[%d] ",GetName(), GetPlayerRoute(), nSkillId, nOldSkillLv, nSkillNewLv)
	gf_WriteLogEx("repair great skill", szLog, "", "", "")
	gf_WriteLogEx("REPAIR GREAT SKILL VNG", "update th祅h c玭g", 1, "Fix th祅h c玭g")

end

function no()
end

