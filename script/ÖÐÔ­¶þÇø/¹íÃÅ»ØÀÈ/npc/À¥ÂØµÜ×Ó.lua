-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 鬼门回廊NPC受伤的昆仑弟子Script
-- By StarryNight
-- 2007/08/07 PM 09:58

-- 贩卖你的感情吧，但它一文不值。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- 西北区24分支2_1鬼门冤魂----------------------------------
	
	--与鬼门回廊中受伤的昆仑弟子对话
	if nStep_XBTask_02 == 1 then
		task_024_02_0();
		return
	end
	
	--尚未将锁魂樽送返昆仑与受伤昆仑弟子对话
	if nStep_XBTask_02 == 2 then
		task_024_02_1();
		return
	end
	
	--将仙丹交给受伤的昆仑弟子
	if nStep_XBTask_02 == 3 then
		task_024_04_0();
		return
	end
	
	--未消灭怨魂之王与受伤的弟子对话
	if nStep_XBTask_02 == 4 then
		task_024_04_1();
		return
	end
	
	--消灭怨魂之王和受伤的昆仑弟子对话
	if nStep_XBTask_02 == 5 then
		task_024_05_0();
		return
	end
	
	--还未告诉叶子秋怨魂之王一事
		if nStep_XBTask_02 == 6 then
		task_024_05_1();
		return
	end
	
	
	--一般情况下的对话
	local strTalk = {
		"u qu竳~!? (*^_^*) hihi?..",
		}
	
	TalkEx("",strTalk);
	return
	
end;
