-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 五毒教NPC方猿Script
-- By StarryNight
-- 2006/02/09 PM 14:19

-- 当爱情遇上现实……

-- ======================================================

-- 入门门任务头文件
Include("\\script\\task\\faction\\faction_main_wp.lua"); 

function main()

local nTaskValue = GetTask(FN_WP);

	if nTaskValue == 2 then
		task_002();
		return
	end
	
	if nTaskValue == 3 then
		task_004();
		return
	end
	
	if nTaskValue == 4 then
		Say("Ngi h穣 甶 v? <color=yellow>ph輆 ng<color> ti觰 l? s? g苝 頲 <color=yellow>V璾 Dung<color>.",0);
		return
	end
	
	if GetPlayerFaction == 7 then
		Say("Nh譶 g? th?! Mau tr竛h ra!",0);
	else
		Say("Ch糿g bi誸 V璾 Dung 產ng lo l緉g chuy謓 g? n鱝, t鑤 nh蕋 ch? n猲 n l祄 phi襫!",0);
	end
end;
