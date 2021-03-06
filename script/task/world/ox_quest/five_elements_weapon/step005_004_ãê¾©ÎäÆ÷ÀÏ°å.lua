-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 4, 14, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");
Include("\\script\\中原一区\\汴京\\npc\\武器店老板.lua");

quest_giver = cf_ox_SetColor("Ch? Ti謒 v? kh?", "green")..":"
quest_title = cf_ox_SetColor("Thu閏 t輓h v? kh?", "yellow").."\n"
quest_detail = cf_ox_SetColor("B筺 nh薾 頲 v? kh? tng kh綾 v韎 qu竔 thu閏 t輓h ﹎.", "gray").."\n\n"
quest_description_1 = quest_giver.."ng l? nh鱪g nguy猲 li謚 n祔, ta s? gi髉 ngi ch? t筼."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_004()
	local ws = random(1,5)
	if (GetItemCount(2, 2, 1) >= 20) and (GetItemCount(2, 2, 9) >= 10) and (GetItemCount(2, 0, 12) >= 1) then
		-- 以下是触发控制部分
		RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
		SetTask(101, 18)

	
		-- 以下是任务奖励部分
		DelItem(2, 2, 1, 20)					-- 删除玩家任务道具
		DelItem(2, 2, 9, 10)					-- 删除玩家任务道具
		DelItem(2, 0, 12, 1)					-- 删除玩家任务道具
		ModifyExp(200)							-- 给予玩家经验奖励
		if (GetPlayerRoute() == 2) then
			AddItem(0,5,31,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 3) then			
			AddItem(0,8,88,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 4) then
			AddItem(0,0,5,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 6) then
			AddItem(0,1,44,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 8) then
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 9) then
			AddItem(0,10,66,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 11) then
			AddItem(0,0,5,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 12) then
			AddItem(0,5,31,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 14) then
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		elseif (GetPlayerRoute() == 15) then
			AddItem(0,9,77,1,1,0,16383,0,16383,0,16383,ws)
		else
			AddItem(0,2,18,1,1,0,16383,0,16383,0,16383,ws)
		end

--玩家路线映射表
--0	无路线
--1	少林无路线
--2	少林俗家
--3	少林禅僧
--4	少林武僧
--5	唐门无路线
--6	唐门普通
--7	峨嵋无路线
--8	峨嵋出家
--9	峨嵋俗家
--10	丐帮无路线
--11	丐帮净衣
--12	丐帮污衣
--13	武当无路线
--14	武当道家
--15	武当俗家
	
		-- 以下是文字显示部分
		TaskTip("B筺 nh薾 頲 v? kh? tng kh綾 v韎 qu竔 thu閏 t輓h ﹎.")
		Say(quest_title..quest_detail..quest_description_1, 0)
	else
		main()
	end
end