-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC董迦罗Script
-- By StarryNight
-- 2006/01/04 PM 16:26

--乙酉年 戊子月 癸已日 
--宜: 祭祀 塑绘 开光 裁衣 冠笄 嫁娶 纳采 拆卸 修造 动土 竖柱 上梁 安床 移徙 入宅 安香 结网 捕捉 畋猎 伐木 进人口 放水 
--忌: 出行 安葬 修坟 开市 
--吉神宜趋: 五富 益後  
--凶神宜忌: 劫煞 小耗 复日 重日 元武  
--每日胎神占方: 占房床房内北 
--五行: 长流水 执执位 
--冲: 冲猪(丁亥)煞东 
--彭祖百忌: 癸不词讼理弱敌强 已不远行财物伏藏 

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\大理\\lv58\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_58 = GetTask(TASK_DL_LV55_ID);
local nTask_DL_State_60 = GetTask(TASK_DL_LV60_ID);
local nTask_DL_State_70	= GetTask(TASK_DL_LV70_ID);
local nTask_DL_State_80	= GetTask(TASK_DL_LV80_ID);

	--领取大宋名菜任务
	if nTask_DL_State_58 == 5 then
		task_000_00();
		return
	end
	--未与佘太君对话
	if nTask_DL_State_58 == 6 then
		task_001_00();
		return
	end
	
	--带孩子到达目的地
	if nTask_DL_State_58 == 7 then
		task_002_00();
		return
	end
	
	--完成大宋名菜任务后
	if nTask_DL_State_58 == 8 then
		task_003_00();
		return
	end
	
	--领取了杀20毒蝠后
	if nTask_DL_State_60 == 1 then
		task_009_00();
		return
	end
	
	--已经杀20毒蝠
	if nTask_DL_State_60 == 2 then
		task_010_00();
		return
	end
	
	--未杀死蚩火僧恶对话
	if nTask_DL_State_60 == 3 then
		task_011_00();
		return
	end
	
	--已经杀死蚩火僧恶
	if nTask_DL_State_60 == 4 then
		task_112_00();
		return
	end
	
	--领取白水洞任务
	if nTask_DL_State_60 == 5 then
		task_013_00();
		return
	end
	
	--已经领取了白水洞任务
	if nTask_DL_State_60 == 6 then
		task_014_00();
		return
	end
	
	--已经杀死夜叉
	if nTask_DL_State_60 == 7 then
		task_015_00();
		return
	end
	
	--已经完成白水洞任务
	if nTask_DL_State_60 == 8 then
		task_016_00();
		return
	end
	
	--已经完成蚩火教的挑战书任务
	if nTask_DL_State_70 == 4 then
		task_017_00();
		return
	end
	
	--未打倒段承恩之前对话
	if nTask_DL_State_80 >= 1 and nTask_DL_State_80 <= 2 then
		task_018_00();
		return
	end
	
	--与二皇子对话后与董迦罗对话
	if nTask_DL_State_80 == 3 then
		task_019_00();
		return
	end
	
	--未打倒乾达婆前与董迦罗对话
	if nTask_DL_State_80 == 4 and GetTask(TASK_DL_LV80_TIME_ID) == 1 then
		task_020_00();
		return
	end
	
	--等待20分钟后与董迦罗对话
	if nTask_DL_State_80 == 4 then
		task_019_01();
		return
	end
	
	--打倒乾达婆后与董迦罗对话
	if nTask_DL_State_80 == 5 then
		task_021_00();
		return
	end
	
	--未打倒紧那罗前与董迦罗对话
	if nTask_DL_State_80 == 6 then
		task_022_00();
		return
	end
	
	--打倒紧那罗后与董迦罗对话
	if nTask_DL_State_80 == 7 then
		task_023_00();
		return
	end
		
	--未打倒三皇子前与董迦罗对话（补领召唤三皇子物品）
	if nTask_DL_State_80 == 8 then
		task_024_00();
		return
	end
	
	--打倒三皇子后与董迦罗对话
	if nTask_DL_State_80 == 9 then
		task_025_00();
		return
	end
	
	--结束三皇子任务后对话
	if nTask_DL_State_80 >= 10 then
		local strTalk = {
			" t? <sex>  l祄 nhi襲 vi謈 cho Чi L?!",
			}
		TalkEx("",strTalk);
		return
	end
	
	--一般状态下对话
	local strTalk = {
		"Xin <sex> h穣 ngh? ng琲 m閠 th阨 gian!",
	}
	
	TalkEx("",strTalk);
	return
end
