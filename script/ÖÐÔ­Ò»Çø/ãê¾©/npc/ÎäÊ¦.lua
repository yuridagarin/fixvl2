
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 武师脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");


function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, kh玭g th? h鋍 v? c玭g n鱝, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==9) then
		task_009_00();
		return
		
	elseif (nState>9) then
	
		if GetSkillLevel(20) ==0 then
		
			Say("Ta y l? t鎛g gi竜 u c馻 80 v筺 c蕀 qu﹏, giang h? nh nh i danh v? s? c馻 T﹏ th?. Ch? c莕 c? 5 lng b筩, ta s? d箉 ngi thu藅 khinh c玭g. Ch糿g hay ngi c? h鴑g th? kh玭g?",
				2,
				"Ta mu鑞 h鋍 khinh c玭g./yes_skill",
				"Ta kh玭g c? h鴑g th?!/no_skill");
				return
				
		
		else
		
			Talk(1,"","K? n b竔 s? h鋍 ngh? kh? nhi襲, giang h? ng祔 sau s? r蕋 n竜 nhi謙!");
			return
			
		end;
	
	elseif (nState<9) then
	
		Talk(1,"","K? n b竔 s? h鋍 ngh? kh? nhi襲, giang h? ng祔 sau s? r蕋 n竜 nhi謙!");
		return		
		
	end;

end


function yes_skill()

	if GetCash()<500 then 
		Talk(1,"","Ngi kh玭g c?  ng﹏ lng! Hay l?  qu猲 trong rng ch鴄  r錳?");
		return
	else
		Pay(500);
		Talk(1,"","C? ti襫 m鋓 vi謈 u d? gi秈 quy誸!");
		LearnSkill(20);
		TaskTip("B筺 h鋍 頲 k? n╪g Khinh c玭g!");
		return
	end;
	
end;

function no_skill()

end;
