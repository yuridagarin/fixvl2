-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 光明顶NPC殷铭Script
-- By StarryNight
-- 2007/06/26 PM 5:51

-- 给你的生命留下多一点的尊严吧，在这个苍白无力的城市。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")

function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 1 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 2);
		Talk(1,"","Sa Trung Kim t鴆 v祅g trong c竧, h穣 n M? Cung Sa M筩 t譵 B筩h Thi猲 Th祅h (194/166)");
		TaskTip("Sa Trung Kim t鴆 v祅g trong c竧, h穣 n M? Cung Sa M筩 t譵 B筩h Thi猲 Th祅h (194/166)");
		return 
	end

	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- 西北任务分支1——09光明左使----------------------------------
	
	--受拓拔弘所托打探光明顶事情
	if nStep_XBTask_01 == 1 then
		task_009_02_0();
		return
	end
	
	--还没和波斯商人对话
	if nStep_XBTask_01 == 2 then
		task_009_02_1();
		return
	end
	
	---------------------------------- 西北区10分支1_2未雨绸缪----------------------------------
	
	--取得或未取得葡萄酒
	if nStep_XBTask_01 == 3 then
		task_010_01_0();
		return
	end
	
	--取得或未取得蚩火教令牌
	if nStep_XBTask_01 == 4 then
		task_010_02_0();
		return
	end
	
	--还没杀死30叛徒and补发触发器
	if nStep_XBTask_01 == 5 then
		task_010_02_1();
		return
	end
	
	--已经杀死30叛徒
	if nStep_XBTask_01 == 6 then
		task_010_03_0();
		return
	end
	
	--尚未与拓拔弘回话
	if nStep_XBTask_01 == 7 then
		task_010_03_1();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"G莕 y c? nhi襲 ngi l衝 l髏 l猲 Quang Minh nh, sao gi蕌 頲 ta?"},
		{"? t Ph鬾g Tng n祔, n誹 l蕐 m? t鰑 trung nguy猲 v韎 Ru Nho Ba T? th? qu? l? thua xa."},
		{" Kh竔 琻g d? khang, 璾 t? nan vong, h? d? gi秈 璾, duy h鱱  khang. Thi猲 h? anh h飊g h祇 kh?, th飝 d? c閚g 萴 ng xng?"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
