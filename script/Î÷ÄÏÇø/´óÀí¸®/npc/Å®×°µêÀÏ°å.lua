
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 服装店老板脚本
-- Edited by Starry
-- 2006/04/12 PM 18:03

-- ======================================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

function main()

 ----------------------------------76级武器配方山狮精皮任务----------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI);
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Kh秏 n筸 linh th筩h d飊g  l祄 trang b? B竧 Qu竔  xu蕋 hi謓 tr猲 giang h?, ta s緋 c? m鑙 l祄 ╪ r錳 y!");
	end;			
		if nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79 then
			--与女装店老板对话
			if nTaskState_shanshi == 1 then
				weave_shanshi_003()
				return
			--上交衣服
			elseif nTaskState_shanshi == 2 then
				weave_shanshi_004()
				return
			--未回去回复锦娘
			elseif nTaskState_shanshi == 3 then
				weave_shanshi_006()
				return
			end 
		end
		
		Sale(34)
		
end;
