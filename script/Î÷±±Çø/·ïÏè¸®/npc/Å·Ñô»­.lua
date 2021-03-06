-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC欧阳画Script
-- By StarryNight
-- 2007/06/06 PM 4:47

-- 感谢主啊，可以让我放屁

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);
local strTalk = {};

	---------------------------------- 西北任务01西夏暗涌----------------------------------
	
	--与百晓生对话后未与欧阳画对话
	if nStep_XBTask == 2 and XBTaskSwitch == 1 then
		task_001_03_0();
		return
	end
	
	--带回或未带回女式装束
	if nStep_XBTask == 3 then
		task_001_04_0();
		return
	end
	
	--带回或未带回一品堂令牌
	if nStep_XBTask == 4 then
		task_001_05_0();
		return
	end
	
	---------------------------------- 西北任务02情困客栈----------------------------------

	--孙二琏尚未清醒对话
	if nStep_XBTask >= 5 and nStep_XBTask <= 9 then
		task_001_05_1();
		return
	end
	
	---------------------------------- 西北任务03春十三娘----------------------------------
	
	--询问如何治愈孙二琏的相思病
	if nStep_XBTask == 10 then
		task_003_01_0();
		return
	end
	
	--孙二琏未清醒前对话
	if nStep_XBTask >= 11 and nStep_XBTask <= 12 then
		task_003_01_1();
		return
	end
	
	---------------------------------- 西北任务04招兵买马----------------------------------
	--孙二琏酒醒期间对话
	if nStep_XBTask >= 13 and nStep_XBTask <= 14 then
		task_001_05_1();
		return
	end
	
	--取得一品堂邀请函后对话
	if nStep_XBTask == 15 then
		task_004_03_0();
		return
	end
	
	--还没与车轮霸王对话申请加入一品堂
	if nStep_XBTask == 16 then
		task_004_03_1();
		return
	end
	
	--与欧阳画对话询问监牢位置
	if nStep_XBTask == 17 then
		task_005_02_0();
		return
	end
	
	--未与百晓生对话请求关于劫囚的帮助
	if nStep_XBTask == 18 then
		task_005_02_1();
		return
	end
	
	--过度对话，为加入一品堂需小心的内容
	if nStep_XBTask >= 19 and nStep_XBTask <= 39 then
		strTalk = {
			"<sex> gia nh藀 Nh蕋 Ph萴 阯g m鋓 vi謈 u ph秈 th薾 tr鋘g.",
			}
		TalkEx("",strTalk)
		return
	end
	
	--补发支线欧阳画触发器
	if nStep_XBTask >= 39 and nStep_XBTask_02 == 0 and GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
	end
	
	---------------------------------- 西北区11分支1_3帝王之墓----------------------------------
	--与欧阳画对话，没取得金丝面罩之前，前往截杀一品堂暗杀使
	if nStep_XBTask_01 == 9 then
		task_011_03_0();
		return
	end
	
	--还未成功前往截杀一品堂暗杀使and补发触发器
	if nStep_XBTask_01 == 10 then
		task_011_03_1();
		return
	end
	
	--已经杀死一品堂暗杀使
	if nStep_XBTask_01 == 11 then
		task_011_04_0();
		return
	end
	
	--还没取得10个金丝面罩与欧阳画对话and补发触发器
	if nStep_XBTask_01 == 12 then
		task_011_04_1();
		return
	end
	
	---------------------------------- 西北区13分支1_5音绝古墓----------------------------------
	--询问欧阳画入墓情况
	if nStep_XBTask_01 == 17 then
		task_013_03_0();
		return
	end
	
	--未询问柳纵云入墓情况
	if nStep_XBTask_01 == 18 then
		task_013_03_1();
		return
	end
	
	---------------------------------- 西北区13分支1_7药人惊现----------------------------------
	--与欧阳画汇报关于药人一事
	if nStep_XBTask_01 == 31 then
		task_016_03_0();
		return
	end
	
	--还未杀死30药人
	if nStep_XBTask_01 == 32 then
		task_016_03_1();
		return
	end
	
	--消灭30药人后向欧阳画汇报情况
	if nStep_XBTask_01 == 33 then
		task_016_04_0();
		return
	end
	
	--还未向刘三询问药人洞内情况
	if nStep_XBTask_01 == 34 then
		task_016_04_1();
		return
	end

	---------------------------------- 西北区18分支1_9芷寒烈阳----------------------------------
	--告诉欧阳画药人草难以消灭一事
	if nStep_XBTask_01 == 37 then
		task_018_01_0();
		return
	end
	
	--还没找到孙方仁请教药人草一事
	if nStep_XBTask_01 == 38 then
		task_018_01_1();
		return
	end
	
	---------------------------------- 西北区19分支1_10付诸东流----------------------------------
	--成功消灭五株药人草，回去与欧阳对话
	if nStep_XBTask_01 == 42 then
		task_019_01_0();
		return
	end
	
	--尚未与刘三对话
	if nStep_XBTask_01 == 43 then
		task_019_01_1();
		return
	end
	
	--向欧阳画描述药王衣着容貌
	if nStep_XBTask_01 == 44 then
		task_019_03_0();
		return
	end
	
	--未与唐芊芊对话请求制作易容装
	if nStep_XBTask_01 == 45 then
		task_019_03_1();
		return
	end
	
	--已经杀死药王回来
	if nStep_XBTask_01 == 48 then
		task_019_07_0();
		return
	end
	
	
	--还未与孙方仁对话
	if nStep_XBTask_01 == 49 then
		task_019_07_1();
		return
	end
	
	--汇报欧阳画沙漠幻象一事
	if nStep_XBTask_01 == 61 then
		task_022_02_0();
		return
	end

	--还未询问叶子秋关于沙漠幻象一事
	if nStep_XBTask_01 == 62 then
		task_022_02_1();
		return
	end
	
	---------------------------------- 西北区23分支1_14黄沙落幕----------------------------------
	--将事情告知欧阳画
	if nStep_XBTask_01 == 67 then
		task_023_05_0();
		return
	end
	
	---------------------------------- 西北区29枭雄之宴------------------------------------------

	--在欧阳画处领取枭雄之宴任务
	if nStep_XBTask_01 == 68 then
		task_029_01_0();
		return
	end
	
	--尚未与寇准对话
	if nStep_XBTask_01 == 69 then
		task_029_01_1();
		return
	end

	--一般情况下的对话
	strTalk = {
		{"B鴆 tranh c馻 ngi h鋋 s? ph秈 c? ? v? m韎 l? tranh hi誱."},
		{"Tranh v? m? nh﹏ qu? l? tuy謙 t竎."},
		{"Tuy ta c? bu玭 b竛 ? Ph鬾g Tng nh璶g kh玭g b竛 tranh, n誹 ngi bi誸 thng th鴆 th? ta t苙g ngi c? sao u."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
