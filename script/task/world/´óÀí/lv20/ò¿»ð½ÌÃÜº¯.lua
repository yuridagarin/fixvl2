-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务蚩火教密函Script
-- By StarryNight
-- 2005/12/31 PM 14:30

--乙酉年  戊子月 己丑日

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local strTalk = {
	"Trong th� vi誸 g� v藋?",
	"{Nh� Ho祅g T鰙 產ng � {T﹜ Song B秐 N筽}? Ph秈 l藀 t鴆 b竜 ngay cho {Cao Qu鑓 C玭g} th玦.",
	}
	TalkEx("",strTalk);
	if GetTask(TASK_DL_LV70_ID) == 2 then
		SetTask(TASK_DL_LV70_ID,3);--已经阅读了信件
		Msg2Player("дn Чi L� th玭g b竜 cho Cao Qu鑓 C玭g v� n閕 dung trong th�.");
		TaskTip("дn Чi L� th玭g b竜 cho Cao Qu鑓 C玭g v� n閕 dung trong th�.");
	end
	return
end
