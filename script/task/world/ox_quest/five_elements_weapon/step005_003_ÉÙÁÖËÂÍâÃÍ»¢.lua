-- 世界任务
-- 成都-峨嵋 主线任务
-- 任务起始

-- wq : World Quest
-- Index : 28

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_005_003()
	if (random(1,100) <= 5) then
		-- 以下是触发控制部分
		RemoveTrigger(GetRunningTrigger())		-- 删除当前触发器
		SetTask(101, 17)
	
		-- 以下是任务奖励部分
		AddItem(2, 0, 12, 1)					-- 给予玩家任务道具·金刚虎牙
		
		-- 以下是文字显示部分
		TaskTip("B筺 nh薾 頲 Kim Cang H? Nha.")
	else
		Msg2Player("B筺  h? s竧 頲 1 m穘h h?, nh璶g ch璦 l蕐 頲 Kim Cang H? Nha.")
	end
end