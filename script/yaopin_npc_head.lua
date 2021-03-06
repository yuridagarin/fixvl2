-- =====================================================
-- File : 药品npc对话脚本的头文件
-- Desc : 一些通用的函数
-- Creator : Tony(Jizheng)
-- =====================================================

-- 传入3个参数，生活技能的大类，ID，还有生活技能的等级
-- 返回一个参数，1表示玩家有学这个生活技能，而且等级达到要求，0表示不达要求。
function check_dig_condition(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)

	strTab = {"цn c﹜", "L祄 da", "Canh t竎", "H竔 thu鑓", "Уo kho竛g", "K衞 t?", "T藀 linh"}
	
	local nRet = 0
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	
	if (nCurLifeSkillLevel == 0) then
		Say("H穣 甶 h鋍 k? n╪g "..strTab[nLifeSkillID].." r錳 quay l筰 nh?!", 0)
	elseif (nCurLifeSkillLevel < nLifeSkillLevel) then
		Say("Thi誹 hi謕_"..strTab[nLifeSkillID].." (K? n╪g) ch璦  c蕄 "..nLifeSkillLevel..", h穣 甶 t╪g c蕄 k? n╪g!", 0)
	else
		nRet = 1
	end
	
	return nRet
end;

-- 传入3个参数，生活技能的大类，ID，还有采集物品的最高等级
-- 返回一个参数，表示玩家采集了这个物品，能得到的经验倍数
function get_dig_multi_count(nLifeSkillType, nLifeSkillID, nLifeSkillLevel)
	local nRet = 1
	
	local nCurLifeSkillLevel = GetLifeSkillLevel(nLifeSkillType, nLifeSkillID)
	if (nCurLifeSkillLevel <= nLifeSkillLevel) then
		nRet = 8
	elseif (nCurLifeSkillLevel - nLifeSkillLevel <= 10) then
		nRet = 4
	end
	
	return nRet
end;

