-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- ID : 0, 2, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_003_001a()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	SetTask(101, GetTask(101)+1)			-- 任务流程标记为 当前+1 ，两个杀怪目标都完成后则值应该为 11

	if (GetTask(101) == 11) then				-- Task(101) == 5 则表示完成了杀怪任务
		CreateTrigger(4, 7, 51)
		AddItem(2, 0, 11, 1)				-- 得到 丐帮密函
		TaskTip("Nhi謒 v? ho祅 th祅h quay v? Th祅h Й g苝 B? u.")
	end
	
	-- 以下是任务奖励部分
	
	-- 以下是文字显示部分
	TaskTip("Gi誸 30 t猲 l璾 manh, nhi謒 v? ho祅 th祅h.")
end