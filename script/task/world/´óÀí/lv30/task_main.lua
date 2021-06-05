-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理30,62任务过程处理文件
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
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--与白莹莹对话领取剧毒食人草任务
function task_001_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --五毒弟子专有对话
		strTalk = {
			"Gi竜 ch�, thu閏 h� v� r錳.",
			"C� thu th藀 頲 tin t鴆 g� kh玭g?",
			"Thu閏 h� 頲 bi誸 th� l鵦 c馻 Xi H醓 gi竜 hi謓 nay r蕋 m筺h, Cao Th╪g Tuy襫 c遪 nghi ng� Ng� чc gi竜 v� Xi H醓 c� li猲 quan v韎 nhau.",
			"Cao Th╪g Tuy襫 nghi ta c� li猲 quan n Xi H醓 gi竜, c遪 ngi?",
			"Thu閏 h� kh玭g d竚, Ch� mu鑞 g苝 gi竜 ch� t譵 hi觰 v� t譶h h譶h c馻 Xi H醓 gi竜 th玦.",
			"Л頲 th玦! Nh璶g trc ti猲 h穣 n t莕g 2 M� Cung thu th藀 20 h箃 чc ch駈g, ta 產ng c莕 g蕄  luy謓 c dc.",
			"Tu﹏ l謓h!"
			}
	else
		strTalk = {
			"Ti襫 b鑙 c� ph秈 l� gi竜 ch� Ng� чc gi竜?",
			"ng g鋓 ta l� ti襫 b鑙 l穙 b鑙 nghe gi� l緈. <sex> n t譵 ta c� vi謈 g� kh玭g? Hay l� mu鑞 gia nh藀 gi竜 ph竔?",
			"T筰 h� 頲 Cao Qu鑓 C玭g {Cao Th╪g Tuy襫} ph竔 n g苝 gi竜 ch�  h醝 th╩ v� {Xi H醓 Gi竜}.",
			"H醝 ta v� t譶h h譶h c馻 Xi H醓 Gi竜? Cao Th╪g Tuy襫 v蒼 c遪 nghi ng� ta? g ta 阯g 阯g l� Qu鑓 c玭g c馻 Чi L� ch糿g l� vi謈 c醤 con n祔 c騨g qu秐 kh玭g n鎖?",
			"Xin h醝 gi竜 ch�, nh鱪g vi謈 x秠 ra v韎 Xi H醓 gi竜 ph秈 ch╪g c� li猲 quan n ho祅g t閏?",
			"Bi誸 n鉯 th� n祇, v莥 甶. Ta 產ng c莕 20 h箃 Th鵦 Nh﹏ Th秓  tinh luy謓 c dc, ngi c� th� n t莕g 2 M� cung c馻 b鎛 gi竜 甧m v� y 頲 kh玭g?",
			"Л頲! Xong vi謈 n祔 hy v鋘g gi竜 ch� s� n鉯 cho t筰 h� bi誸.",
			"Nh蕋 nh r錳."
			}
	end;
	
	TalkEx("",strTalk);
	CreateTrigger(0,252,KILL_DL_ANPLANT);
	SetTask(TASK_DL_LV30_ID,2);
	TaskTip("дn t莕g 2 M� cung l蕐 20 h箃 Th鵦 Nh﹏ Th秓");
	Msg2Player("дn t莕g 2 M� cung l蕐 20 h箃 Th鵦 Nh﹏ Th秓");

end;

--领取毒种任务后，或补发剧毒食人草触发器，或进行下一步
function task_002_00()

local nItemNum = GetItemCount(2,0,364);
local strTalk = {
	"Gi髉 ta n t莕g 2 M� cung l蕐 20 h箃 Th鵦 Nh﹏ Th秓.",
}

	if nItemNum >= 20 then --已经收集完20个毒种
		if GetPlayerFaction() == 7 then --五毒弟子专有对话
			strTalk = {
				"Gi竜 ch�, v藅 ph萴 ngi c莕  t譵 .",
				"Th藅 t鑤 qu�!",
				"V藋 ngi n鉯 cho t筰 h� nghe v� Xi H醓 gi竜?",
				"Ta s� n鉯! Nh璶g c� vi謈 n祔 c遪 g蕄 h琻! Ng� чc  C�  n t莕g 2 M� Cung ng thu th藀 c v藅, h緉 c遪 b総 m閠 s� d﹏ l祅g n  luy謓 c. Ngi h穣 甶 ti猽 tr� t猲 n祔 gi髉 ta.",
				"Tu﹏ l謓h!"
				}
		else
			strTalk = {
				"Gi竜 ch�, v藅 ph萴 ngi c莕  t譵 .",
				"Th藅 t鑤 qu�!",
				"V藋 Xi H醓 gi竜 c� li猲 quan g� v韎 Ng� чc gi竜 kh玭g?",
				"G莕 y Ng� чc  C� n t莕g hai c馻 M� Cung ng thu th藀 c v藅, c遪 b総 m閠 s� d﹏ l祅g n  luy謓 c. <sex> h穣 甶 ti猽 tr� t猲 n祔 gi髉 ta!",
				"厖厖",
				"ng l祄 m蕋 th阨 gian. <sex> mau 甶 甶. Ho祅 th祅h nhi謒 v� ta s� n鉯 cho ngi nghe.",
				"T筰 h� 甶 ngay!"
				}
		end;
		
		DelItem(2,0,364,20);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV30_ID,3);
		RemoveTrigger(GetTrigger(KILL_DL_ANPLANT))
		TaskTip("дn M� cung t莕g 2 ti猽 tr� Ng� чc  C�.");
		Msg2Player("дn M� cung t莕g 2 ti猽 tr� Ng� чc  C�.");
		GivePlayerAward("Level_30","xn_step_1");
		GivePlayerExp(SkeyDali,"peiyao")
		return
	--补发剧毒食人草触发器	
	elseif GetTrigger(KILL_DL_ANPLANT) == 0 then
		CreateTrigger(0,252,KILL_DL_ANPLANT);
		TaskTip("дn t莕g 2 M� cung l蕐 20 h箃 Th鵦 Nh﹏ Th秓");
		Msg2Player("дn t莕g 2 M� cung l蕐 20 h箃 Th鵦 Nh﹏ Th秓");
		return
	end;
	
	TalkEx("",strTalk);

end;

--领取驭毒阴姬任务后未杀死驭毒阴姬之前
function task_003_00()

local strTalk = {
	"Mu鑞 di謙 Ng� чc  C� ph秈 n t莕g 2 M� cung. <sex> mau 甶 甶.",
}
		TalkEx("",strTalk);
end;


--杀死驭毒阴姬后1
function task_004_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --五毒弟子专有对话
		strTalk = {
			"Gi竜 ch�, t筰 h�  ti猽 tr� {Ng� чc  C瑌.",
			"L莕 n祔 ngi v蕋 v� qu�!",
			" t� gi竜 ch� qu� khen.",
			"Ha! Ha! V鮝 r錳 ta sai ngi 甶 di謙 Ng� чc  C� ch輓h l� ngi c馻 Xi H醓 gi竜, n誹 ta v� Xi H醓 gi竜 c� li猲 quan n nhau l� n祇 ta l筰 甶 gi誸 h� �?",
			"N鉯 v藋 l� gi鱝 ti襫 b鑙 v� Xi H醓 gi竜 kh玭g li猲 quan g� n nhau?",
			"Л琻g nhi猲 r錳! Xi H醓 gi竜 sao s竛h b籲g Ng� чc gi竜 c馻 ta!",
			"Ti襫 b鑙 c� th� n鉯 r� h琻 頲 kh玭g?",
			"Xi H醓 gi竜 ph秐 lo筺 l� v� kh玭g mu鑞 t﹏ ho祅g  k� v�.",
			"T筰 h� c� nghe qua, Xi H醓 gi竜 t竎 lo筺 c騨g v� chuy謓 n祔."
			}
		TalkEx("task_004_01",strTalk);
		return
	else
		strTalk = {
			"T筰 h�  di謙 頲 {Ng� чc  C瑌, gi竜 ch� n鉯 cho t筰 h� nghe 頲 r錳 ch�?",
			"<sex> tu鎖 tr� t礽 cao, l遪g y nhi謙 huy誸! Giang h� l筰 c� th猰 m閠 nh﹏ t礽!",
			"厖厖",
			"L骳 n穣 sai ngi 甶 gi誸 чc  C� ch輓h l� ngi c馻 Xi H醓 gi竜. N誹 ta v� Xi H醓 gi竜 c� li猲 quan n nhau, l� n祇 ta l筰 sai ngi 甶 gi誸 h緉?",
			"N鉯 v藋 l� gi鱝 ti襫 b鑙 v� Xi H醓 gi竜 kh玭g li猲 quan g� n nhau?",
			"Л琻g nhi猲 r錳! Xi H醓 gi竜 sao s竛h b籲g Ng� чc gi竜 c馻 ta!",
			"Ti襫 b鑙 c� th� n鉯 r� h琻 頲 kh玭g?",
			"Xi H醓 gi竜 ph秐 lo筺 l� v� mu鑞 ho竛 v� Ho祅g ",
			"T筰 h� c� nghe qua, Xi H醓 gi竜 t竎 lo筺 c騨g v� chuy謓 n祔."
			}
		TalkEx("task_004_02",strTalk);
		return
	end;
end;

--杀死驭毒阴姬后2(五毒弟子)
function task_004_01()

local strTalk = {
	"Чi L� c� n {L鬰 i gia t閏}? Chuy謓 n祔 ngi c騨g bi誸 sao?",
	"T筰 h� kh玭g bi誸, mong gi竜 ch� n鉯 r� h琻.",
	"L鬰 i gia t閏 � Чi L� trong  c� Cao gia, Cao Th╪g Tuy襫 l� t閏 trng. T鑤 nh蕋 ngi n g苝 Cao Th╪g Tuy襫  h醝 r� h琻 nh�!",
	"T筰 h� hi觰 r錳.",
	"C遪 vi謈 n祔 n鱝, phng ph竝 ph鑙 ch� c dc c馻 Kh玦 L鏸 чc Nh﹏  b� Xi H醓 gi竜 nh c緋, ngi b竜 l筰 v韎 Cao Th╪g Tuy襫 v藋 nh�!",
	"T筰 h� bi誸 r錳."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,5);
	TaskTip("Quay l筰 Чi L� g苝 Cao Th╪g Tuy襫!");
	Msg2Player("Quay l筰 Чi L� g苝 Cao Th╪g Tuy襫!");
	GivePlayerAward("Level_30","xn_step_2","weapon","Level_34");
	GivePlayerExp(SkeyDali,"yuduyinji")
end

--杀死驭毒阴姬后2
function task_004_02()

local strTalk = {
	"Sao? Cao Th╪g Tuy襫 kh玭g th鮝 nh薾 �?",
	"T筰 h� ch璦 t鮪g nghe qua, mong gi竜 ch� n鉯 r�.",
	"T鑤 nh蕋 ngi n猲 n g苝 Cao Th╪g Tuy襫  h醝. N鉯 v韎 玭g 蕐 l� ta c遪 r蕋 nhi襲 vi謈 kh玭g th� n Чi L� 頲.",
	"T筰 h� 甶 ngay!",
	"C遪 vi謈 n祔 n鱝, phng ph竝 ph鑙 ch� c dc c馻 Kh玦 L鏸 чc Nh﹏  b� Xi H醓 gi竜 nh c緋, ngi b竜 l筰 v韎 Cao Th╪g Tuy襫 v藋 nh�!",
	"T筰 h� bi誸 r錳."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,5);
	TaskTip("Quay l筰 Чi L� g苝 Cao Th╪g Tuy襫!");
	Msg2Player("Quay l筰 Чi L� g苝 Cao Th╪g Tuy襫!");
	GivePlayerAward("Level_30","xn_step_2","weapon","Level_34");
	GivePlayerExp(SkeyDali,"yuduyinji")
end

--杀死驭毒阴姬见高升泉之前
function task_005_00()

local strTalk = {
	"H穣 quay v� g苝 Cao Th╪g Tuy襫 甶!",
}
		TalkEx("",strTalk);
		
end;

--领取62级任务五毒教的怒火
function task_006_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --五毒弟子专有对话
		strTalk = {
			"Gi竜 ch� cho g鋓 t筰 h� c� vi謈 g� kh玭g?",
			"Ngi c� bi誸 Kh玦 L鏸 чc Nh﹏ � Long Nh穘 ng kh玭g?",
			"T筰 h� bi誸,  t鮪g 甶 qua n琲 .",
			"Kh玦 L鏸 чc Nh﹏  b� ngi c馻 Xi H醓 gi竜 衟 bu閏 ti誸 l� phng ph竝 ph鑙 ch� c dc.Hi謓 nay ngi c� th� theo phng ph竝 n祔 ch� t筼 ra c dc l� Чi Trng l穙 Xi H醓 gi竜, ngi mau gi髉 ta ti猽 di謙 t猲 n祔  b秓 to祅 b� m藅.",
			"Ngi n祔 hi謓 產ng � u?",
			"H緉 � t莕g 1 Long Nh穘 ng. M閠 m譶h ngi kh玭g th� i ph� v韎 h緉, n猲 c� ng i h� tr�.",
			}
	else
		strTalk = {
			"{B筩h gi竜 ch駗 cho t譵 thu閏 h�?",
			"<sex>Chuy謓 c� li猲 quan n Kh玦 L鏸 чc Nh﹏ � Long Nh穘 ng, ngi bi誸 r錳 ch�?",
			"Thu閏 h� v鮝 甶 qua n琲 .",
			"Kh玦 L鏸 чc Nh﹏  b� ngi c馻 Xi H醓 gi竜 衟 bu閏 ti誸 l� phng ph竝 ph鑙 ch� c dc.Hi謓 nay ngi c� th� theo phng ph竝 n祔 ch� t筼 ra c dc l� Чi Trng l穙 Xi H醓 gi竜. <sex> c� th� gi髉 ta ti猽 tr� h緉 kh玭g?",
			"T猲 n祔 th藅 ng ch誸! Nh璶g sao {gi竜 ch駗 kh玭g ng th�?",
			"Ta 產ng c� vi謈 kh玭g th� ra ngo礽 頲. <sex> l莕 trc nh� ta cung c蕄 m閠 s� tin t鴆 cho <sex> r錳 l� n祇 l莕 n祔 ngi kh玭g gi髉 ta 頲 �?",
			"Л頲! T猲 {Trng l穙} n祔 hi謓 產ng � u?",
			"H緉 產ng � t莕g 1 Long Nh穘 ng. <sex>m閠 m譶h ngi kh� th緉g n鎖 h緉, n猲 c� ng i h� tr�.",
			}
	end
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,6);
	SetTask(TASK_DL_LV75_ID,1);
	GivePlayerExp(SkeyDali,"zaishangwudu")
	Msg2Player("дn t莕g 1 Long Nh穘 ng di謙 Xi H醓 i Trng l穙.");
	TaskTip("дn t莕g 1 Long Nh穘 ng di謙 Xi H醓 i Trng l穙.");
	return
end

--未打败蚩火大教主
function task_007_00()

local strTalk = {
	"Xi H醓 i trng l穙 � t莕g 1 Long Nh穘 ng.",
	}
	
	TalkEx("",strTalk);
	return
end

--已经打败蚩火大教主1
function task_008_00()

local strTalk = {};
	
	if GetPlayerFaction() == 7 then --五毒弟子专有对话
		strTalk = {
			"V� r錳 �? S� vi猚 th� n祇?",
			"Thu閏 h�  ti猽 tr� 頲 h緉.",
			"L祄 t鑤 l緈, kh玭g h� danh l�  t� ru閠 c馻 ta.",
			" t� gi竜 ch� qu� khen.",
			"C遪 vi謈 n祔 mu鑞 h醝 ngi, sao ngi bi誸 Kh玦 L鏸 чc Nh﹏ � Long Nh穘 ng?",
			"L� {Tr辬h Qu竛 Chi} sai thu閏 h� n th╩ d� {Long Nh穘 ng} n猲 m韎 ph竧 hi謓 ra.",
			"C� ta sai ngi n Long Nh穘 ng l祄 g�?",
			"C� ta nghe n鉯 {Xi H醓 trng l穙} � Long Nh穘 ng n猲 ph竔 {誱 H醓 K諁 n  nh璶g 甶 r錳 kh玭g th蕐 v� m韎 sai thu閏 h� th╩ d� xem sao.",
			"C� ta ch� l� ngi bu玭 b竛 sao l筰 quan t﹏ n Xi H醓 gi竜 n v藋? Ngi c� th蕐 k� l� kh玭g?",
			}		
	else
		strTalk = {
			"<sex>Th蕐 ngi vui v� nh� v藋 l� bi誸 th祅h c玭g r錳.",
			"ng v藋, t鑞 kh玭g 輙 s鴆.",
			"<sex>  ra tay l� ph秈 th緉g.",
			"{B筩h gi竜 ch駗 qu� khen.",
			"Sao ngi bi誸 Kh玦 L鏸 чc Nh﹏ � Long Nh穘 ng?",
			"L� {Tr辬h Qu竛 Chi} sai thu閏 h� n th╩ d� {Long Nh穘 ng} n猲 m韎 ph竧 hi謓 ra.",
			"C� ta sai ngi n Long Nh穘 ng l祄 g�?",
			"C� ta nghe n鉯 {Xi H醓 trng l穙} � Long Nh穘 ng n猲 ph竔 {誱 H醓 K諁 n  nh璶g 甶 r錳 kh玭g th蕐 v� m韎 sai thu閏 h� th╩ d� xem sao.",
			"C� ta ch� l� ngi bu玭 b竛 sao l筰 quan t﹏ n Xi H醓 gi竜 n v藋? <sex> c� th蕐 k� l� kh玭g?",
			}
	end
	TalkEx("task_008_01",strTalk);		
end			

--已经打败蚩火大教主2
function task_008_01()

local strTalk = {};
	
	if GetPlayerFaction() == 7 then --五毒弟子专有对话			
		strTalk = {	
			"C� ta v鮝 n {Чi L齷 l祄 ╪  b� {Xi H醓 gi竜} l祄 kh� d�, v� v藋 m� g﹜ n猲 o竛 th�.",
			"L� do n祔 kh玭g th醓 ng. N誹 b� Xi H醓 gi竜 g﹜ kh� d� c� ta c� th� chuy觧 n n琲 kh竎  l祄 ╪. Ngc l筰 c� ta c遪 � l筰 Чi L� li猲 t鬰 nh� ngi d� la tin t鴆 c馻 Xi H醓 gi竜. Ngi kh玭g th蕐 甶襲 n祔 l� kh竎 thng sao?",
			"厖厖",
			"T譶h h譶h � Чi L� ta c騨g kh玭g n緈 r�, ngi t譵 B竎h Hi觰 Sinh h醝 nh�!",
			" t� gi竜 ch�.",
			}	
	else					
		strTalk = {
			"C� ta v鮝 n {Чi L齷 l祄 ╪  b� {Xi H醓 gi竜} l祄 kh� d�, v� v藋 m� g﹜ n猲 o竛 th�.",
			"L� do n祔 kh玭g th醓 ng. N誹 b� Xi H醓 gi竜 g﹜ kh� d� c� ta c� th� chuy觧 n n琲 kh竎  l祄 ╪. Ngc l筰 c� ta c遪 � l筰 Чi L� li猲 t鬰 nh� b籲g h鱱 d� la tin t鴆 c馻 Xi H醓 gi竜. <sex> kh玭g th蕐 kh竎 thng sao?",
			"厖厖",
			"N誹 <sex> kh玭g tin nh鱪g l阨 ta n鉯. <sex> c� th� 甶 h醝 ngi kh竎 v藋.",
			"Thu閏 h� tin r錳! C秏 琻 {gi竜 ch駗.",
			"{C� l� n {B竎h Hi觰 Sinh} h醝 xem, may ra bi誸 th猰 頲 g�.}",
			}
	end            
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,3);
	CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
	Msg2Player("дn t譵 B竎h Hi觰 Sinh.");
	TaskTip("дn t譵 B竎h Hi觰 Sinh.");
	GivePlayerAward("Level_65","xn_step_1","head","Level_65");
	GivePlayerExp(SkeyDali,"fangongcihuo")
	return
end

--未去找百晓生打听消息(补领对话触发器)
function task_009_00()

local strTalk = {
	"Х g苝 B竎h Hi觰 Sinh ch璦? Ngi n祔 hi觰 bi誸 r閚g, may ra c� th� gi髉 頲 b籲g h鱱!"
	}
	
	if GetTrigger(TALK_DL_BAIXIAOSHENG) == 0 then
		CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
		Msg2Player("дn t譵 B竎h Hi觰 Sinh.");
		TaskTip("дn t譵 B竎h Hi觰 Sinh.");
	end;
	TalkEx("",strTalk);
end