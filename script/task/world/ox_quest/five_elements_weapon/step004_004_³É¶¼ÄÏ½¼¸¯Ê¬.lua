-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- id : 0, 5, 53

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_004_004()
	-- 以下是触发控制部分
	RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
	CreateTrigger(4, 11, 53)					-- 创建下一个触发器
	
	-- 以下是任务奖励部分
		
	-- 以下是文字显示部分
	TaskTip("Ho祅 th祅h nhi謓 v? quay v? Giang T﹏ th玭 g苝 v? binh.")
end