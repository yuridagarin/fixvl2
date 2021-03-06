-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理NPC郑贯之Script
-- By StarryNight
-- 2005/12/29 PM 16:05

--十一月廿九 丁亥土井闭日  
--宜：  裁衣、筑堤、修仓、修造、动土、上梁、补塞、作灶  
--忌：  理发、嫁娶  

-- 昨晚小偷进屋，室友稍有损失，年关难过啊……

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nLevel = GetLevel();
local nTask_DL_State_10 = GetTask(TASK_DL_LV10_ID);
local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);
local nTask_DL_State_45 = GetTask(TASK_DL_LV45_ID);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
local nTask_DL_State_60 = GetTask(TASK_DL_LV60_ID);
local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID);
local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID);
local nTask_DL_State_62 = GetTask(TASK_DL_LV62_ID);
local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);
	
	--领取女商人任务
	if nLevel >= 10 and nTask_DL_State_10 == 0 and XnTaskSwitch == 1 then
		task_000_00();
		return
	end
	
	if nTask_DL_State_10 == 1 then
		task_001_00();
		return
	end;
	
	if nTask_DL_State_10 == 2 then
		task_002_00();
		return
	end;
	
	if nTask_DL_State_10 == 3 then
		task_003_00();
		return
	end;
	
	if nTask_DL_State_10 == 4 then
		local strTalk = {
			"Ta l? ngi H竛, m韎 n Чi L? l祄 ╪ n猲 c騨g kh玭g hi觰 t譶h h譶h ? y l緈. Nh璶g nghe n鉯 n誹 c? g? li猲 quan n Xi H醓 gi竜 th? c? th? t譵 Qu鑓 c玭g Cao Th╪g Tuy襫  h醝.",
			"Л頲! в ta 甶 h醝 xem."
		}
		TalkEx("",strTalk);
		return
	end;
	
	--领取苗岭信使任务
	if nTask_DL_State_40 == 6 then
		task_004_00()
		return
	end
	
	--已经收集了10个麂皮
	if nTask_DL_State_45 == 1 then
		task_005_00()
		return
	end
	
	--已经领取了哨子
	if nTask_DL_State_45 == 2 then
		task_006_00()
		return
	end
	
	--已经打败力士取得信件
	if nTask_DL_State_45 == 3 then
		task_007_00()
		return
	end
	
	--已经将信件交与郑贯之
	if nTask_DL_State_45 == 4 then
		task_008_00()
		return
	end
	
	--已经领取50级任务
	if nTask_DL_State_50 == 1 then
		task_009_00()
		return
	end
	
	--已经打败苗岭首领并和苗岭族长对话后
	if nTask_DL_State_50 == 6 then
		task_010_00()
		return
	end
	
	--未与高升泉对话
	if nTask_DL_State_50 == 7 then
		task_011_00()
		return
	end
	
	--领取郑贯之债款任务
	if nTask_DL_State_60 == 8 then
		task_012_00()
		return
	end
	
	--完成两个舞娘任务前
	if nTask_DL_State_60_1 >= 1 and nTask_DL_State_60_1 <= 5 or nTask_DL_State_60_2 >= 1 and nTask_DL_State_60_2 <= 4 then
		task_013_00()
		return
	end
	
	--完成郑贯之的货款任务后领取62级任务傀儡毒人
	if nTask_DL_State_60_1 == 6 and nTask_DL_State_60_2 == 5 and nTask_DL_State_62 == 0 then
		task_016_00()
		return
	end
	
	--未前往龙眼洞查看
	if nTask_DL_State_62 == 1 then
		task_017_00()
		return
	end
	
	--前往龙眼洞查看后回来汇报
	if nTask_DL_State_62 == 2 then
		task_018_00()
		return
	end	

	--未杀死傀儡毒人和蚩火长老前
	if nTask_DL_State_62 == 3 then
		task_019_00()
		return
	end
	
	--已经杀死傀儡毒人和蚩火长老
	if nTask_DL_State_62 == 4 then
		task_020_00()
		return
	end
	
	--未去见五毒教教主
	if nTask_DL_State_62 == 5 then
		task_021_00()
		return
	end
	
	--完成收集大理旧志后找郑贯之对话
	if nTask_DL_State_75 == 6 then
		task_022_00()
		return
	end
	
	--未打败摩呼罗迦对话
	if nTask_DL_State_75 == 7 then
		task_023_00()
		return
	end
	
	--打败摩呼罗迦后对话
	if nTask_DL_State_75 == 8 then
		task_024_00()
		return
	end
	
	--完成摩呼罗迦任务后对话
	if nTask_DL_State_75 >= 9 then
		local strTalk = {
			"Ngi qu? l? h秓 h竛, c? Tr辬h t閏 ta mang 琻 <sex>.",
			}
		TalkEx("",strTalk);
		return
	end

	
	--一般情况下的对话
	local strTalk = {
		"M蕐 n╩ nay bu玭 b竛 kh? kh╪, n誹 kh玭g ta ch糿g ph秈 v蕋 v? t? Trung Nguy猲 l苙 l閕 n n琲 n祔 ki誱 s鑞g!",
		"чc g? gh? th?! Ch? ngh? th玦 c騨g  th蕐 s?, n誹 nh? tr髇g ph秈 ch綾 ti猽 m筺g!"	
		}
	
	TalkEx("",strTalk);
	return
	
end;
