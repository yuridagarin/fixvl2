-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理20,35,55任务过程处理文件
-- By StarryNight
-- 2005/12/30 PM 13:54

--乙酉年 戊子月 戊子日 
--宜: 合帐 裁衣 教牛马 馀事勿取 
--忌: 入宅 动土 破土 嫁娶 作灶 造船 
--吉神宜趋: 官日 敬安 金匮  
--凶神宜忌: 月建 小时 土府 月厌 地火  
--五行: 霹雳火  建执位  
--彭祖百忌: 戊不受田田主不祥 子不问卜自惹祸殃 

-- ======================================================

-- 引用剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--领取大理国公高升泉任务1
function task_000_00()
	
local strTalk = {
	"C? ph秈 Cao qu鑓 c玭g {Cao Th╪g Tuy襫}?",
	"Ch輓h l? ta. <sex> c? c莕 ta gi髉 g? kh玭g?",
	"M蕐 h玬 trc nh譶 th蕐 thng nh﹏ b? gi竜  c馻 Xi H醓 gi竜 t蕁 c玭g, ta mu鑞 bi誸 v? {Xi H醓 gi竜}.",
	"Xi H醓 gi竜 v鑞 l? m閠 gi竜 ph竔 nh? ? Чi L? sau  ng祔 c祅g l韓 m筺h, g莕 y l筰 ngang nhi猲 t竎 lo筺.",
	"Trc khi {Xi H醓 gi竜} t竎 lo筺 c? ph竧 sinh i s? g? kh玭g?",
	"Chuy謓 l? khi ho祅g  l猲 k? v? 頲 m蕐 ng祔 th? Xi H醓 gi竜 b総 u n竜 lo筺 c? Чi L?.",
	}
	TalkEx("task_000_01",strTalk);
	return

end;

--领取大理国公高升泉任务2
function task_000_01()

local strTalk = {
	"C? ph秈 li猲 quan n v? Ho祅g  m韎 n祔?",
	"C騨g c? th?! Чi L? c? m閠 s? th祅h ph莕 ph秐 lo筺  c蕌 k誸 v韎 Xi H醓 gi竜 nh璶g r蕋 c? th? l? Ng? чc gi竜, b雐 gi竜 ph竔 n祔 c竎h Чi L? kh玭g xa, gi竜  c馻 h? l筰 tinh th玭g c thu藅.",
	"N誹 v藋 th? ta s? n {Ng? чc} xem t譶h h譶h ?  th? n祇.",
	"<sex> nh﹏ ti謓 tr? lu玭 20 con r誸 c nh?!",
	"е t? tu﹏ l謓h!"
	}
	TalkEx("",strTalk);
	CreateTrigger(0,251,KILL_DL_POINSONSCO);
	TaskTip("V祇 Ng? чc gi竜 gi誸 20 r誸 c");
	Msg2Player("V祇 Ng? чc gi竜 gi誸 20 r誸 c");
	SetTask(TASK_DL_LV10_ID,5);
	SetTask(TASK_DL_LV20_ID,1);
end

--还没完成高升泉任务
function task_001_00()
	
	--补发触发器
	if GetTrigger(KILL_DL_POINSONSCO) == 0 then
		CreateTrigger(0,251,KILL_DL_POINSONSCO);
		TaskTip("Gi髉 Tr辬h Qu竛 Chi t譵 dc li謚.");
		Msg2Player("Gi髉 Tr辬h Qu竛 Chi t譵 dc li謚.");
		return
	end;
	return
end;

--已经消灭20个毒蜈蚣
function task_002_00()

local strTalk = {
			"<sex> v? r錳 ?? C? ph竧 hi謓 g? kh玭g?",
			"?  c tr飊g r蕋 nhi襲, nh璶g kh玭g th? d鵤 v祇  cho r籲g {Xi H醓 gi竜} v? {Ng? чc gi竜} c? li猲 quan v韎 nhau.",
			"G莕 Ng? чc gi竜 g莕 y xu蕋 hi謓 Huy誸 L﹏ чc M穘g, qu竔 v藅 n祔  l祄 t鎛 h筰 bi誸 bao nhi猽 ngi. <sex> h穣 mang theo Dc Huy誸 n祔 n   ti猽 tr? n?!",
			"Ta s? c? g緉g."
		}
	TalkEx("",strTalk);
	AddItem(2,0,365,1,1);--任务道具药血
	TaskTip("дn Ng? чc gi竜 d飊g dc huy誸  di謙 Huy誸 L﹏ чc M穘g.");
	Msg2Player("дn Ng? чc gi竜 d飊g dc huy誸  di謙 Huy誸 L﹏ чc M穘g.");
	SetTask(TASK_DL_LV20_ID,3);--已经触发杀毒蟒的任务
	GivePlayerAward("Level_20","xn_step_1");
	GivePlayerExp(SkeyDali,"tanchawudujiao")
	return
end


--已经领取了杀毒蟒任务
function task_003_00()

local strTalk = {
	"V蕋 v? cho <sex> r錳."
	}
	
	--任务道具药血丢失补发
	if BigGetItemCount(2,0,365) <= 0 then
		if GetFreeItemRoom() >= 1 and GetMaxItemWeight() - GetCurItemWeight() > 1 then
			AddItem(2,0,365,1,1);--任务道具药血
			TalkEx("",strTalk);
			TaskTip("дn Ng? чc gi竜 d飊g dc huy誸  di謙 Huy誸 L﹏ чc M穘g.");
			Msg2Player("дn Ng? чc gi竜 d飊g dc huy誸  di謙 Huy誸 L﹏ чc M穘g.");	
		else
			strTalk = {
				"Xin ki觤 tra l筰 h祅h trang trc khi nh薾 Dc Huy誸",
					}
			TalkEx("",strTalk)
		end
	else
		TalkEx("",strTalk);
	end
end;
		

--已经杀死毒蟒，找高升泉对话
function task_004_00()

local strTalk = {
	"<sex> v蕋 v? qu?! Ch髏 th祅h ? xin <sex> nh薾 cho!",
	"Nh璶g v蒼 ch璦 bi誸 頲 Xi H醓 gi竜 v? Ng? чc gi竜 c? li猲 quan v韎 nhau hay kh玭g!",
	"в ta nh? l筰 xem?"
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV20_ID,5);--已经交了杀毒蟒任务
	GivePlayerAward("Level_20", "xn_step_2", "weapon", "Level_22");
	GivePlayerExp(SkeyDali,"xuelingdumang")
	return
end


--已经交了杀毒蟒任务
function task_005_00()

local strTalk = {};

	--大于50级方可继续接下来的任务
	if GetLevel() < 50 then
		local strTalk = {
			"C? vi謈 ta s? l筰 nh? n ngi!"
			}
		TalkEx("",strTalk);
		return
	elseif GetPlayerFaction() == 7 then --五毒弟子专有对话
		strTalk = {
			"Cao Qu鑓 c玭g c? k? s竎h g? ch璦?",
			"Ng? чc gi竜 l? m玭 ph竔 th莕 b? nh璶g  c? ti課g trong gi韎 v? l﹎, ta ngh? gi竜 ph竔 n祔 kh玭g li猲 quan n vi謈 ch輓h s? ? Чi L?. Nh璶g c騨g Phi襫 b籲g h鱱 n Ng? чc gi竜 g苝 B筩h Doanh Doanh h醝 cho r? r祅g vi謈 n祔",
			"Ta l藀 t鴆 甶 ngay!",
			" t? <sex>"
			}
	else
		strTalk = {
			"Cao Qu鑓 c玭g c? k? s竎h g? ch璦?",
			"Ng? чc gi竜 tuy thu閏 t? ph竔 nh璶g x璦 nay c? ti課g trong gi韎 V? L﹎, ta ngh? vi謈 n祔 kh玭g li猲 quan n h?. <sex> th? n h醝 B筩h Doanh Doanh xem sao?",
			"Ta l藀 t鴆 甶 ngay!",
			" t? <sex>"
			}
	end
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV20_ID,6);
	SetTask(TASK_DL_LV30_ID,1);
	TaskTip("дn Ng? чc gi竜 tham ki課 B筩h Doanh Doanh!");
	Msg2Player("дn Ng? чc gi竜 tham ki課 B筩h Doanh Doanh!");
	return	
end

--尚未与白莹莹对话
function task_006_00()

local strTalk = {
	" t? <sex>"
	}
	TalkEx("",strTalk);
	return
end;

--完成五毒教任务后对话
function task_007_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --五毒弟子专有对话
		strTalk = {
			"T譶h h譶h th? n祇?",
			"T筰 h?  h醝 gi竜 ch?, hai gi竜 ph竔 n祔 ch糿g c? quan h? g? ngc l筰 h? c遪 l? i th?. {Xi H醓 gi竜} c遪 tr閙 c竎h luy謓 c c馻 Ng? чc gi竜.",
			"Kh玭g c? li猲 quan g? v韎 nhau th? t鑤 r錳. Ta  cho ngi 甶 th╩ d? t譶h h譶h c馻 Xi H醓 gi竜, ch綾 c騨g s緋 v? r錳."
			}
	else
		strTalk = {
			"<sex> h醝 th╩ 頲 tin t鴆 g? r錳?",
			"Ta  h醝 gi竜 ch?, hai gi竜 ph竔 n祔 ch糿g c? quan h? g? ngc l筰 h? c遪 l? i th?. Xi H醓 gi竜 c遪 tr閙 c竎h luy謓 c c馻 Ng? чc gi竜.",
			"Kh玭g c? li猲 quan g? v韎 nhau th? t鑤 r錳. Ta  cho ngi 甶 th╩ d? t譶h h譶h c馻 Xi H醓 gi竜, ch綾 c騨g s緋 v? r錳."
			}
	end;
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,6);
	GivePlayerAward("Level_30", "xn_step_3");
	GivePlayerExp(SkeyDali,"cihuojiao")
	return
end


function task_008_00()
	
	--大于51级方可继续下面任务
	if GetLevel() > 51 then
		local strTalk = {
				"C? chuy謓 g蕄 l筰 nh? n <sex> y! G莕 y Xi H醓 gi竜 l筰 ho箃 ng ? V? L╪g s琻, ch髇g s竧 h筰 v? s? th秓 d﹏. Nh璶g V? L╪g s琻 kh玭g thu閏 Чi L? m? thu閏 qu鑓 th? c馻 Чi T鑞g, n誹 tri襲 nh bi誸 頲 e r籲g s? kh玭g hay, chi b籲g <sex> n  nh 畊鎖 b鋘 ch髇g 甶!",
				"Л頲! V藋 ch髇g 產ng ? u?",
			}
		TalkEx("task_008_01",strTalk);		
	else
		local strTalk = {
			"V蒼 ch璦 c? tin t鴆 g?.",
			}
		TalkEx("",strTalk);
		return
	end
end

--分支:选择1去武陵山脚2武陵山
function task_008_01()

local strTalk = {
		"L莕 n祔 Xi H醓 gi竜  l筰 chia th祅h 2 n琲  ho箃 ng, m閠 ? tr猲 n骾 v? m閠 ? ch﹏ n骾. Di ch﹏ n骾 c? B筩h Gi竜 у v? H綾 Gi竜 у. Tr猲 n骾 c? X輈h Gi竜 у v? Xi H醓 o kh竎h. <sex> th阨 gian kh玭g nhi襲, xin ch鋘 m閠 n琲, c遪 nh鱪g n琲 kh竎 ta s? ph竔 ngi n sau."
		}
	TalkEx("task_008_02",strTalk)
end;

function task_008_02()
local strSelect = {
	"<sex> n誹 n ch﹏ V? L╪g s琻 th? nh 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 Xi H醓 H綾 Gi竜 у. дn V? L╪g s琻 th? nh 15 t猲 Xi H醓 X輈h Gi竜 у l? 頲!",
	"дn ch﹏ n骾 V? L╪g S琻/task_009_00",
	"дn V? L╪g s琻/task_009_10",
	"в ta ngh? l筰/nothing"
	}
	SelectSay(strSelect); 
end


--领取任务前往武陵山脚打倒10个蚩火黑/白教徒
function task_009_00()

local strTalk = {
	"Цnh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у."
	}
	TalkEx("",strTalk);
	CreateTrigger(0,253,KILL_DL_CHIHUO_WHITE);
	CreateTrigger(0,254,KILL_DL_CHIHUO_BLACK);
	SetTask(TASK_DL_LV30_ID,7);
	SetTask(TASK_DL_LV35_ID,1);
	SetTask(TASK_DL_LV35_01_ID,1);
	TaskTip("дn ch﹏ n骾 V? L╪g s琻 nh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у.");
	Msg2Player("дn ch﹏ n骾 V? L╪g s琻 nh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у.");
	
end;
	
--领取任务前往武陵山脚打倒15个蚩火赤教徒
function task_009_10()

local strTalk = {
	"Цnh b筰 15 t猲 Xi H醓 X輈h Gi竜 у."
	}
	
	TalkEx("",strTalk);
	CreateTrigger(0,255,KILL_DL_CHIHUO_RED);
	SetTask(TASK_DL_LV30_ID,7);
	--SetTask(TASK_DL_LV35_ID,1);
	SetTask(TASK_DL_LV35_01_ID,2);
	SetTask(TASK_DL_LV35_ID_ZX,1);
	TaskTip("дn V? L╪g s琻 nh b筰 15 t猲 Xi H醓 X輈h Gi竜 у.");
	Msg2Player("дn V? L╪g s琻 nh b筰 15 t猲 Xi H醓 X輈h Gi竜 у.");

end


--未打倒10个蚩火黑/白教徒对话
function task_010_00()

local strTalk = {
	"Цnh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у."
	}
	TalkEx("",strTalk);
	if GetTrigger(KILL_DL_CHIHUO_WHITE) == 0 then
		CreateTrigger(0,253,KILL_DL_CHIHUO_WHITE);
		TaskTip("дn ch﹏ n骾 V? L╪g s琻 nh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у.");
		Msg2Player("дn ch﹏ n骾 V? L╪g s琻 nh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у.");
	end;
	if GetTrigger(KILL_DL_CHIHUO_BLACK) == 0 then
		CreateTrigger(0,254,KILL_DL_CHIHUO_BLACK);
		TaskTip("дn ch﹏ n骾 V? L╪g s琻 nh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у.");
		Msg2Player("дn ch﹏ n骾 V? L╪g s琻 nh b筰 10 t猲 Xi H醓 B筩h Gi竜 у v? 10 t猲 Xi H醓 H綾 Gi竜 у.");
	end;
end

--未打倒15个蚩火赤教徒对话
function task_010_10()

local strTalk = {
	"дn V? L╪g s琻 nh b筰 15 t猲 X輈h Gi竜 у."
	}
	TalkEx("",strTalk);
	if GetTrigger(KILL_DL_CHIHUO_RED) == 0 then
		CreateTrigger(0,255,KILL_DL_CHIHUO_RED);
		TaskTip("дn V? L╪g s琻 nh b筰 15 t猲 Xi H醓 X輈h Gi竜 у.");
		Msg2Player("дn V? L╪g s琻 nh b筰 15 t猲 Xi H醓 X輈h Gi竜 у.");
	end;
end

--完成武陵山任务后与高升泉对话
function task_011_00()

local strTalk = {
	"Cao Qu鑓 C玭g! T筰 h?  nh b筰 ch髇g r錳!",
	" t? <sex>",
	"L莕 n祔 Xi H醓 gi竜 t竎 lo筺 ph秈 ch╪g c? li猲 quan n v? ho祅g  m韎 k? t鬰?",
	"Ta c騨g kh玭g r? l緈!",
	"Ta nghe n鉯 Чi L? c? n l鬰 i gia t閏, c? th? nh? th? n祇?",
	"Vi謈 n祔 c? th? li猲 quan n Xi H醓 gi竜 nh璶g ta c騨g kh玭g r? l緈! <sex> th? t譵 hi觰 xem.",
	"Xem ra ph秈 h醝 {B竎h Hi觰 Sinh} r錳.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV35_ID,3);
	SetTask(TASK_DL_LV35_ID_ZX,3);
	RemoveTrigger(KILL_DL_CHIHUO_WHITE)
	RemoveTrigger(KILL_DL_CHIHUO_BLACK)
	RemoveTrigger(KILL_DL_CHIHUO_RED)
	Msg2Player("дn Bi謓 Kinh t譵 B竎h Hi觰 Sinh.");
	TaskTip("дn Bi謓 Kinh t譵 B竎h Hi觰 Sinh.");
	GivePlayerAward("Level_35", "xn_step_1", "weapon", "Level_40");
	GivePlayerExp(SkeyDali,"wulingshanjiao")
end

--结束武陵山任务后与高升泉对话
function task_012_00()

local strTalk = {
	"V蕋 v? cho <sex> r錳!",
	}
	TalkEx("",strTalk);
end


--触发55级凤凰翎任务1
function task_013_00()

	if GetLevel()>= 54 and GetTask(TASK_DL_LV50_ID) == 7 then
		local strTalk = {
			"Cao Qu鑓 C玭g, t筰 h? c? m閠 ch髏 manh m鑙 v? {Xi H醓 gi竜} y.",
			" t? <sex> v? b? t竛h c馻 Чi L? m? v蕋 v? qu?. Xin h醝 <sex>  thu th藀 頲 nh鱪g g??",
			"L骳 u t筰 h? ngh? {Xi H醓 gi竜} v? ﹏ o竛 gi鱝 ? Man v? B筩h T閏 n猲 m韎 t竎 lo筺. Nh璶g kh玭g ph秈 v藋, h? v? mu鑞 gi髉 qu鑓 vng. Cao Qu鑓 C玭g, chuy謓 n祔 l? th? n祇?",
			"Ch髇g ch? n鉯 h?  th玦. Th竛h thng d﹏ ch髇g tin y猽, u c莕 n s? tng tr? c馻 t? gi竜? N誹 ch髇g c? h秓 ? th? kh玭g n猲 t竎 lo筺 nh? v藋.",
			"T﹏ ho祅g  c? th藅 頲 d﹏ ch髇g tin y猽? N誹 d﹏ ch髇g tin y猽 sao l骳 ng quang g苝 nhi襲 tr綾 tr? n v藋?",
			"?",
			"V? Ho祅g  trc  e r籲g kh玭g ph秈 t? Ho祅g t? k? v??"
			}
		TalkEx("task_013_01",strTalk);
		GivePlayerExp(SkeyDali,"zhaogaoguogong")
		return
	else
		local strTalk = {
			"<sex> l﹗ qu? kh玭g g苝, v? c玭g  c? ti課 b? g? ch璦?"
		}
		TalkEx("",strTalk);
	end;
end

--触发55级凤凰翎任务2
function task_013_01()
local strTalk = {
			"Xem ra <sex>  bi誸 h誸 c? r錳. L骳 m韎 ng quang c? Чi L?  x秠 ra m閠 tr薾 h鏽 lo筺. C? 3 v? Ho祅g t? ch糿g ai nhng ai, cu鑙 c飊g Tam Ho祅g T?  l猲 ng玦, nh璶g Xi H醓 gi竜 mu鑞 i ng玦 v? l筰 cho Nh? Ho祅g T?.",
			"Vi謈 n祔 trc y ch璦 t鮪g nghe Qu鑓 C玭g nh綾 t韎.",
			"Зy ch? l? chuy謓 trong nh?, ta c騨g v鮝 th╩ d? m鑙 quan h? gi鱝 Nh? Ho祅g T? v? Xi H醓 gi竜.",
			"V藋 Qu鑓 s? quy誸 nh th? n祇?",
			"Mu鑞 th秓 ph箃 Xi H醓 gi竜 v? Nh? Ho祅g T? c騨g c莕 x﹜ d鵱g m閠 th? l鵦 v鱪g ch綾 . C? m閠 v礽 vi謈 ph秈 nh? <sex> gi髉 r錳!"
			}
	TalkEx("task_013_02",strTalk);
	return
end

--触发55级凤凰翎任务3
function task_013_02()

local strTalk = {	
			"Chuy謓 i s? t筰 h? kh玭g d竚 can thi謕, nh璶g c莕 t筰 h? gi髉 g? xin Qu鑓 s? c? g鋓.",
			" t? <sex>. Ph鬾g Ho祅g_bi觰 tng c馻 Xi H醓 gi竜  xu蕋 hi謓 t筰 Ph鬾g Nh穘 ng. Kh玭g  cho th? l鵦 c馻 gi竜 ph竔 n祔 b祅h trng! <sex> mau n  ti猽 tr? ch髇g!",
			"V藋 ph秈 l祄 sao?",
			"<sex> n Ph鬾g Nh穘 ng thu th藀 10 nanh D? H? v? 10 l玭g B筩h u 猽.",
			"е t? tu﹏ l謓h!",
			}
		
	TalkEx("",strTalk);
	CreateTrigger(0,258,KILL_DL_MIDNIGHT_TIGER);
	CreateTrigger(0,259,KILL_DL_BALD_EAGLE);
	SetTask(TASK_DL_LV50_ID,8);
	SetTask(TASK_DL_LV55_ID,1);
	GivePlayerExp(SkeyDali,"weiyibanfa")
	Msg2Player("дn Ph鬾g Nh穘 ng thu th藀 10 nanh D? H? v? 10 l玭g B筩h u 猽.");
	TaskTip("дn Ph鬾g Nh穘 ng thu th藀 10 nanh D? H? v? 10 l玭g B筩h u 猽.");
end

--触发55级凤凰翎任务后
function task_014_00()
	--完成收集虎牙和雕羽任务
	if GetItemCount(2,0,371) >= 10 and GetItemCount(2,0,372) >= 10 then
		local strTalk = {
			"V藅 ph萴 thu th藀  .",
			"Phi襫 <sex> 甧m v藅 ph萴 n祔 n Tng Dng t譵 M筩 Tam  nh? ch? t筼 Ph鬾g Ho祅g Linh.",
			"{Ph鬾g Ho祅g Linh} c? t竎 d鬾g g??",
			"<sex> d飊g Ph鬾g Ho祅g Linh  g鋓 Ph鬾g Ho祅g",
			"Th? ra l? v藋! Ta n ch? {M筩 Tam} y.",
			"Ngi n猲 d飊g b? c﹗ a th? th玭g b竜 cho 玭g 蕐 trc.",
			"Л頲! T筰 h? l藀 t鴆 l祄 ngay!"
			}
		
		TalkEx("",strTalk);
		DelItem(2,0,371,10);
		DelItem(2,0,372,10);
		RemoveTrigger(GetTrigger(KILL_DL_MIDNIGHT_TIGER));
		RemoveTrigger(GetTrigger(KILL_DL_BALD_EAGLE));
		CreateTrigger(4,201,TALK_DL_MOSAN);
		SetTask(TASK_DL_LV55_ID,2);
		Msg2Player("дn Tng Dng t譵 M筩 Tam ch? t筼 Ph鬾g Ho祅g Linh .");
		TaskTip("дn Tng Dng t譵 M筩 Tam ch? t筼 Ph鬾g Ho祅g Linh .");
		GivePlayerAward("Level_55", "xn_step_1");
		GivePlayerExp(SkeyDali,"jialouluo")
		return
	end
	--补发子夜虎和白头雕死亡触发器
	if GetTrigger(KILL_DL_MIDNIGHT_TIGER) == 0 or GetTrigger(KILL_DL_BALD_EAGLE) == 0 then
		if GetTrigger(KILL_DL_MIDNIGHT_TIGER) == 0 then
			CreateTrigger(0,258,KILL_DL_MIDNIGHT_TIGER);
		end
		if GetTrigger(KILL_DL_BALD_EAGLE) == 0 then
			CreateTrigger(0,259,KILL_DL_BALD_EAGLE);
		end
		Msg2Player("дn Ph鬾g Nh穘 ng thu th藀 10 nanh D? H? v? 10 l玭g B筩h u 猽.");
		TaskTip("дn Ph鬾g Nh穘 ng thu th藀 10 nanh D? H? v? 10 l玭g B筩h u 猽.");
	end
	--未完成任务
	local strTalk = {
		"Phi襫 b籲g h鱱 n Ph鬾g Nh穘 ng thu th藀 10 nanh D? H? v? 10 l玭g B筩h u 猽.",
		}
	TalkEx("",strTalk)
end

--未与莫三对话
function task_015_00()

local strTalk = {
	"M筩 Tam m? ti謒 th? r蘮 ? Tng Dng, r蕋 d? t譵.",
	}

	if GetTrigger(TALK_DL_MOSAN) == 0 then
		CreateTrigger(4,201,TALK_DL_MOSAN);
		Msg2Player("дn Tng Dng t譵 M筩 Tam ch? t筼 Ph鬾g Ho祅g Linh .");
		TaskTip("дn Tng Dng t譵 M筩 Tam ch? t筼 Ph鬾g Ho祅g Linh .");
	end;
	
	TalkEx("",strTalk);
	
end;

--打倒凤凰后
function task_016_00()

local strTalk = {
	"<sex> qu? l? tu鎖 tr? t礽 cao, l筰 th猰 m閠 nh﹏ t礽 n鱝.",
	" t? qu? khen!",
	"Qu鑓 s? фng Gi? La ? Чi L? l筰 g苝 chuy謓. <sex> mau n  甶!",
	"T筰 h? 甶 ngay!",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV55_ID,5);
	GivePlayerAward("Level_55", "xn_step_2");
	GivePlayerEquipment("head", "Level_55",1);
	GivePlayerExp(SkeyDali,"jibaojialouluo")
end

--完成55级凤凰任务后
function task_017_00()

local strTalk = {
	"фng Gi? La hi謓 ? ph輆 b綾 th祅h Чi L?, phi襫 <sex> n  m閠 chuy課.",
	}

	TalkEx("",strTalk);
	
end


--完成郑贯之的货款任务后领取70级任务蚩火教的挑战书
function task_018_00()

local strTalk = {
	"Qu鑓 C玭g cho g鋓 t筰 h? c? vi謈 g? kh玭g?",
	"<sex> h穣 n t莕g 2 Long Nh穘 ng t? v? v韎 A Tu La (Xi H醓 gi竜)",
	"L莕 n祔 xem nh? b鋘 ch髇g ch? ng, 頲 ta 甶 ngay y.",
	"<sex> d蒼 theo bao nhi猽 ng i u 頲 nh璶g <sex> nh蕋 c? nh蕋 ng ph秈 th薾 tr鋘g!",
	"Ta bi誸 r錳!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_0_ID,3);--删去头上的任务书
	SetTask(TASK_DL_LV70_ID,1);
	GivePlayerExp(SkeyDali,"tiaozhanshu")
	Msg2Player("дn t莕g 2 Long Nh穘 ng di謙 A Tu La");
	TaskTip("дn t莕g 2 Long Nh穘 ng di謙 A Tu La");
	return
end


--未打败阿修罗
function task_019_00()

local strTalk = {
	"A Tu La t筰 t莕g 2 Long Nh穘 ng.",
	}
	TalkEx("",strTalk);
	return
end

--打败阿修罗并且阅读信件内容
function task_020_00()

local strTalk = {
	"<sex>  chi課 th緉g tr? v?!",
	"T筰 h? ph竧 hi謓 m閠 vi謈 r蕋 quan tr鋘g, Qu鑓 c玭g xem th? n祔 甶.",
	"?",
	"Nh? Ho祅g T? hi謓 產ng 萵 n竨 ? T﹜ Song B秐 N筽, l筰 c蕌 k誸 v韎 Xi H醓 gi竜. Chuy謓 n祔 kh玭g n gi秐. <sex> mau n ch? фng Qu鑓 S? c莡 ki課.",
	"е t? tu﹏ l謓h!",
	}
	DelItem(2,0,380,1);--删去蚩火教的密函
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV70_ID,4);
	GivePlayerAward("Level_70", "xn_step_1",nil ,nil,"YunTie",1);
	GivePlayerWeapon("Level_70",1);
	GivePlayerExp(SkeyDali,"datanxiangqing")
	return
end

function nothing()

end