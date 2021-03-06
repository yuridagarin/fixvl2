-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理40,50任务过程处理文件
-- By StarryNight
-- 2006/01/06 PM 17:37

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

--领取任务前往寨子附近打倒苗岭勇士
function task_000_00()
	
local strTalk = {
	"Ngi l? ai? T譵 ta c? vi謈 g??",
	"Cao Qu鑓 C玭g ph竔 thu閏 h? n h醝 th╩ v? t譶h h譶h c馻 {Xi H醓 gi竜}.",
	"Ta bi誸 r蕋 r? v? gi竜 ph竔 n祔! Nh璶g xem ngi c? b秐 l躰h g? ! N誹 th緉g 頲 Mi猽 L躰h  nh蕋 d騨g s? ? y ta s? n鉯 cho ngi nghe!",
	"T筰 h? 甶 ngay!",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,3);
	TaskTip("дn Mi猽 L躰h tr筰 nh b筰 Mi猽 L躰h D騨g s? (165.187)!");
	Msg2Player("дn Mi猽 L躰h tr筰 nh b筰 Mi猽 L躰h D騨g s? (165.187)!");
	GivePlayerExp(SkeyDali,"miaolingzuren")
	return
end

--未打倒苗岭勇士
function task_001_00()

local strTalk = {
	"Mi猽 L躰h D騨g S? ? g莕 Mi猽 L躰h tr筰.",
	}
	TalkEx("",strTalk);
	return
end

--已打倒苗岭勇士
function task_002_00()

local strTalk = {
	"Qu? l? c? b秐 l躰h. Ngi c莕 g?, n鉯 mau l猲!",
	"{Xi H醓 gi竜} r鑤 cu閏 l? gi竜 ph竔 n祇? T筰 sao l筰 ph秐 lo筺 nh? v藋?",
	"Ph秐 lo筺? Ta kh玭g ngh? v藋. Xi H醓 gi竜 t玭 th? i th莕 Xi V璾 n猲 con ch竨 Vi猰 _Ho祅g nh? c竎 ngi u kh玭g m蕐 thi謓 c秏, song nguy猲 t綾 c馻 Xi H醓 gi竜 c騨g r蕋 nghi猰 kh綾. L莕 n祔 Xi H醓 gi竜 ph秐 lo筺 l? mu鑞 l藅  ho祅g , l藀 l筰 m閠  ch?.",
	"厖厖",
	"Ngi c遪 g?  h醝 n鱝 kh玭g?",
	"(Hay l? quay l筰 t譵 {Tri謚 Di猲 Ni猲}) (Ngh? th莔)",
	}
	TalkEx("",strTalk);
	CreateTrigger(4,200,TALK_DL_ZHAOYANNIAN);--赵延年西南区任务对话触发器
	Msg2Player("Quay v? Bi謓 Kinh g苝 Tri謚 Di猲 Ni猲");
	TaskTip("Quay v? Bi謓 Kinh g苝 Tri謚 Di猲 Ni猲");
	SetTask(TASK_DL_LV40_ID,5);
	GivePlayerAward("Level_40","xn_step_3");
	GivePlayerExp(SkeyDali,"miaolingyongshi")
	return
end

--尚未向赵延年汇报
function task_003_00()

local strTalk = {
	"Ngi c遪 g?  h醝 n鱝 kh玭g?",
	"(Hay l? quay l筰 t譵 {Tri謚 Di猲 Ni猲}) (Ngh? th莔)"
	}
	TalkEx("",strTalk);
	if GetTrigger(Talk_DL_ZHAOYANNIAN) == 0 then
		CreateTrigger(4,200,TALK_DL_ZHAOYANNIAN);--赵延年西南区任务对话触发器
		Msg2Player("Quay v? Bi謓 Kinh g苝 Tri謚 Di猲 Ni猲");
		TaskTip("Quay v? Bi謓 Kinh g苝 Tri謚 Di猲 Ni猲");
	end;
	return
end


--和陈立衡对话后和苗岭族长对话
function task_004_00()

local strTalk = {
	"Ch糿g ph秈 l莕 trc ngi  nh b筰 Mi猽 L躰h D騨g S? r錳  sao, sao c遪 quay l筰?",
	"L莕 trc do v閕 qu? n猲 c? nhi襲 vi謈 ch璦 k辮 h醝 t閏 trng, l莕 n祔 quay l筰 mu鑞 nghe t閏 trng n鉯 r? h琻 v? t譶h h譶h c馻 {Xi H醓 gi竜}.",
	"L筰 h醝 v? Xi H醓 gi竜? Л頲 th玦, nh璶g trc ti猲 ngi ph秈 gi髉 ta v礽 vi謈 .",
	"Thu閏 h? s絥 s祅g!",
	"Trc y m蕐 ng祔 b鋘 Th? Ty n y l祄 lo筺, ch髇g  cp m蕋 Mi猽 L躰h l謓h b礽 c馻 ta. Ngi mau n Y課 T? ng t莕g 2 nh b筰 t猲 u l躰h 甧m l謓h b礽 v? y.",
	"Thu閏 h? 甶 ngay!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,4);
	Msg2Player("дn Y襫 T? ng t莕g 2 nh b礽 t猲 u l躰h l蕐 Mi猽 L躰h l謓h b礽");
	TaskTip("дn Y襫 T? ng t莕g 2 nh b礽 t猲 u l躰h l蕐 Mi猽 L躰h l謓h b礽");
	GivePlayerAward("Level_50","xn_step_2");
	GivePlayerExp(SkeyDali,"chihuojiao")
end

--未打倒苗岭首领和苗岭族长对话
function task_005_00()

local strTalk = {
	"дn Y課 T? ng t莕g 2 nh b筰 t猲 u l躰h l蕐 l謓h b礽.",
	}

	TalkEx("",strTalk);
	return
end

--打倒苗岭首领和苗岭族长对话1
function task_006_00()

local strTalk = {
	"Зy c? ph秈 l? {l謓h b礽}?",
	"Ngi qu? l? r蕋 c? b秐 l躰h, c? vi謈 g? mau h醝 甶!",
	"L莕 trc t閏 trng c? nh綾 n {Xi H醓 gi竜} mu鑞 l藅  {ho祅g }. C? ph秈 v? {Xi H醓 gi竜} l? {? Man} c遪 ho祅g  thu閏 {B筩h T閏} kh玭g?",
	"C? nh鱪g chuy謓 ngi kh玭g n猲 t譵 hi觰 k? l緈.",
	"B雐 thu閏 h? nghe n鉯 {? Man} v? {B筩h T閏} i l藀 nhau, m? ho祅g  l筰 thu閏 B筩h T閏.",
	"Чi L? do B筩h T閏 ki課 l藀 n猲, nh璶g 祅 T? B譶h v? ho祅g  khai qu鑓 l筰 mang d遪g m竨 c馻 c? hai b? t閏. V? v藋 Xi H醓 gi竜 kh玭g v? chuy謓 i l藀 n祔 m? t竎 lo筺 頲.",
	}
	TalkEx("task_006_01",strTalk);
end

--打倒苗岭首领和苗岭族长对话2
function task_006_01()

local strTalk = {	
	"C? chuy謓 n祔 ?? V藋 sao {Xi H醓 gi竜} c? mu鑞 l藅  ho祅g ?",
	"Kh玭g ph秈 l? l藅  m? ngc l筰 c遪 駈g h?.",
	"Chuy謓 n祔 l? sao?",
	"Ngi n Чi L? t譵 Cao qu秐 h醝 th? kh綾 bi誸.",
	" t? t閏 trng.",
	"(Ngh? th莔) (Xem ra l穙 c騨g ch糿g bi誸 th猰 g? n鱝 r錳, ph秈 v? h醝 {Tr辬h c? nng th玦}).",
	}
	TalkEx("",strTalk);
	DelItem(2,0,370,1);
	SetTask(TASK_DL_LV50_ID,6);
	Msg2Player("Quay v? Чi L? t譵 Tr辬h Qu竛 Chi.");
	TaskTip("Quay v? Чi L? t譵 Tr辬h Qu竛 Chi.");
	GivePlayerAward("Level_50","xn_step_3");
	GivePlayerExp(SkeyDali,"miaolinglingpai")
	return
end

--未与郑贯之对话
function task_007_00()

local strTalk = {
	"Ta ch? bi誸 c? b蕐 nhi猽  th玦, ngi 甶 t譵 ngi kh竎 h醝 甶.",
	}

	TalkEx("",strTalk);
	return
end

--分支任务：不祥人
function task_100_00()

local strSay = {
	"M閚g ca 琲 l? M閚g ca, sao huynh n? g箃 mu閕 nh? v藋. A Ch﹗ n祔 c? l祄 g? ng t閕 ch?.",
	"Chuy謓 g? x秠 ra v韎 c? nng v藋?/task_101_00",
	"Hic, hic? Ta sinh ra tr猲 i n祔  l祄 g? ch??/task_exit"
	}
	SelectSay(strSay);
end
	
--领取不祥人任务1
function task_101_00()

local strTalk = {
	"Ta v鑞 kh玭g ph秈 ngi v飊g n祔, do lo筺 l筩 n猲 m韎 l璾 l筩 n y. Kh玭g may l骳  trong l祅g c? tr薾 i d辌h, m鋓 ngi cho ta l? m莔 m鑞g g﹜ n猲 i h鋋?",
	"V藋 c遪 M閚g ca?",
	"Trong l祅g ai c騨g xa l竛h, ch? c? M閚g ca l? ngi hi觰 v? an 駃 ta. Th? r錳 gi鱝 ta v? huynh 蕐 n秠 sinh t譶h c秏, nh璶g th﹏ ph? huynh 蕐 ph秐 i k辌h li謙, kh玭g c遪 c竎h n祇 h琻, ta v? huynh ﹜ d? nh b? tr鑞.",
	"Sau  th? n祇?",
	"Trc  3 ng祔 huynh 蕐 h裯 ta di ch﹏ n骾 V? L╪g s琻  c飊g tr鑞 甶, nh璶g ta i m穒, i m穒? c騨g kh玭g th蕐 n. Ta ngh? huynh 蕐  thay i ch? ? r錳."
}
	TalkEx("task_101_01",strTalk);
end

--领取不祥人任务2
function task_101_01()

local strTalk = {
	"A Ch﹗ ta th藅 l? b蕋 h筺h?!",
	"C? nng ng qu? 產u l遪g,  ta n g苝 M閚g ca h醝 nguy猲 nh﹏ ra sao.",
	"M閚g ca ? ph? ng Чi L?, m蓇 th﹏ huynh 蕐 l? Tri謚 Nng.",
	"C? nng ng qu? 產u l遪g,  ta n Чi L? g苝 Tri謚 Nng h醝 xem."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,1);
	Msg2Player("дn Чi L? g苝 Tri謚 Nng.");
	TaskTip("дn Чi L? g苝 Tri謚 Nng.");
end	

--未与赵娘对话
function task_102_00()

local strTalk = {
	"M閚g ca ? ph? ng Чi L?, v? c飊g c秏 琻 <sex>."
}
	TalkEx("",strTalk);
end

--与赵娘对话询问蒙哥下落
function task_103_00()

local strTalk = {
	"C竔 ? a u   l祄 cho A M閚g nh? ta d? d? 甶猲 甶猲, hi謓 gi? n? ? u ta c騨g kh玭g bi誸 n鱝.",
	"C? ph秈 m蓇 th﹏ c馻 M閚g ca?",
	"<sex> c? tin t鴆 c馻 M閚g ca ??",
	"L? n祇 M閚g ca ch璦 v? nh??",
	"C? l? n?  甶 theo a u  r錳叜竛g thng cho M閚g ca?!",
	"(Ph秈 l藀 t鴆 quay l筰 b竜 cho A Ch﹗)"
}
  TalkEx("",strTalk);
  SetTask(TASK_DL_LV40_ZX_ID,2);
	Msg2Player("B竜 cho A Ch﹗ M閚g ca v蒼 ch璦 v? nh?.");
	TaskTip("B竜 cho A Ch﹗ M閚g ca v蒼 ch璦 v? nh?.");
end

--未回报阿朱时与赵娘对话
function task_104_00()

local strTalk = {
	"(Ph秈 l藀 t鴆 quay l筰 b竜 cho A Ch﹗)"
}
	TalkEx("",strTalk);
end

--与赵娘对话后回报阿朱
function task_105_00()

local strTalk = {
	"<sex> v? r錳 ?? Ta  quy誸 甶nh r阨 kh醝 n琲 n祔?",
	"Ta t? ch? Tri謚 Nng v? y, M閚g ca kh玭g th蕐 v? nh?.",
	"Sao? Huynh 蕐 v蒼 kh玭g v? nh?? Ta ph秈 l祄 sao y?",
	"C? nng ng qu? x骳 ng, h穣 k? l筰 bu鎖 h裯 h玬  ta s? c? c竎h gi髉 c? nng.",
	"Trc  3 ng祔, huynh 蕐 h裯 ta n ch﹏ n骾 V? L╪g i tr阨 t鑙 r錳 c飊g b? tr鑞.",
	"в ta n {ch﹏ n骾 V? L╪g} h醝 t譶h h譶h c馻 M閚g ca.",
	" t? <sex>, n誹 M閚g ca  thay i ? nh b? tr鑞 c騨g kh玭g sao, ta ch? mong cho huynh 蕐 b譶h an.",
	"C? nng y猲 t﹎, ta s? mau 甶 ch鉵g v?."
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,3);
	Msg2Player("дn ch﹏ n骾 V? L╪g h醝 th╩ tin t鴆 M閚g ca.");
	TaskTip("дn ch﹏ n骾 V? L╪g h醝 th╩ tin t鴆 M閚g ca.");
end

--未到武岭山脚查探蒙哥下落前
function task_106_00()

local strTalk = {
	"L? A Ch﹗ kh玭g t鑤卙u hu?"
}
	TalkEx("",strTalk);
end

--与武陵山脚采药人对话
function task_107_00()

local strTalk = {
	"B鋘 gi竜  c馻 xi H醓 gi竜 ng祔 c祅g t竎 lo筺, ngay c? n c﹜ c? c騨g ph秈 khi誴 s?.",
	",Чi th骳 cho h醝 3 ng祔 trc c? th蕐 ngi thi誹 ni猲 n祇 kho秐g 25, 26 tu鎖, d竛g cao qua y kh玭g?",
	"3 ng祔 trc? Kho秐g 25, 26 tu鎖?",
	"Trc y m蕐 ng祔 ta c? th蕐 m閠 ngi b? gi竜  c馻 Xi H醓 gi竜 b総 甶. B鋘 ch髇g qu? hung d? ta c騨g kh玭g d竚 nh譶 r? n鱝.",
	"V藋 hi謓 gi? b鋘 ch髇g ? u?",
	"B鋘 ch髇g ? tr猲 n骾, nh璶g n誹 kh玭g c? g? th? t鑤 nh蕋 ng va v祇 ch髇g.",
	" t? i th骳.",
	"ng kh竎h s竜!"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,4);
	Msg2Player("дn v? L╪g s琻 t譵 tung t輈h c馻 M閚g ca.");
	TaskTip("дn v? L╪g s琻 t譵 tung t輈h c馻 M閚g ca.");
end

--与武陵山蚩火教徒对话
function task_108_00()

local strTalk = {
	"L阨 c馻 ti觰 t? n祔 n鉯 kh玭g bi誸 c? ng tin kh玭g, h緉 n鉯 n y  i m閠 ngi.",
	"V藋 ??",
	"Ti觰 t? c? ph秈 ch髇g mu鑞 nh綾 n M閚g ca?",
	"Tr阨! L筰 th猰 m閠 t猲 n鱝 n! Ta ch誸 m蕋 th玦!!",
	"Huynh , x玭g l猲!"
	}
local nMapID,nXpos,nYpos = GetWorldPos();
	
	TalkEx("",strTalk);
	CreateNpc("Xi H醓 o Kh竎h","Xi H醓 o Kh竎h",nMapID,nXpos,nYpos,-1,30,2);
	CreateTrigger(0,265,KILL_DL_CHIHUO_DAOKE);
	Msg2Player("Цnh b筰 10 t猲 Xi H醓 產o kh竎h");
	TaskTip("Цnh b筰 10 t猲 Xi H醓 產o kh竎h");
end

--未打败10个蚩火刀客,补领蚩火刀客死亡触发器
function task_109_00()

local strTalk = {
	"T猲 kia l? ai?",
	"Huynh , x玭g l猲!"
	};

	if GetTrigger(KILL_DL_CHIHUO_DAOKE) == 0 then
		CreateTrigger(0,265,KILL_DL_CHIHUO_DAOKE);
		Msg2Player("Цnh b筰 10 t猲 Xi H醓 產o kh竎h");
		TaskTip("Цnh b筰 10 t猲 Xi H醓 產o kh竎h");
	else
		TalkEx("",strTalk);
	end
end	




function task_exit()

end	