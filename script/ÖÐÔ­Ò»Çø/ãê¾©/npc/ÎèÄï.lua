
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 成都舞娘脚本
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua");
-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID); 
	--print("nTask_DL_State_60_2:"..nTask_DL_State_60_2);
	
	if (nState==9) then
		task_009();
		return
	end
	
	--未领取收集血鸦羽任务
	if nTask_DL_State_60_2 == 1 then
		task_014_12();
		return
	end
	
	--已经领取收集血鸦羽任务
	if nTask_DL_State_60_2 == 2 then
		task_014_22();
		return
	end
	
	--已经完成汴京舞娘任务
	if nTask_DL_State_60_2 == 3 then
		task_014_32();
		return
	end	
	
	Talk(1,"","Nh譶 b籲g h鱱, bi誸 ngay l? ngi s鑞g c? ngh躠 c? t譶h!");
	
end;