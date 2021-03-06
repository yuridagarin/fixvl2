-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC拓拔弘Script
-- By StarryNight
-- 2007/06/26 PM 5:04

-- 微笑依然。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- 西北任务08棋逢敌手----------------------------------
	
	--受车轮霸王吩咐，像拓拔弘询问关于光明顶的情况
	if nStep_XBTask == 37 then
		if is_show_title_level() == 1 then --亮出一品堂刺客称号 
			task_008_02_0();
		else
			xb_title_tip(2,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--尚未把带伤药给司马鸣风
	if nStep_XBTask == 38 then
		task_008_02_1();
		return
	end
	
	---------------------------------- 西北区09分支1_1光明左使----------------------------------
	--把带伤药给司马鸣风后回报拓拔弘
	if nStep_XBTask == 39 then
		if is_show_title_level() == 1 then --亮出一品堂刺客称号 
			task_009_01_0();
		else
			xb_title_tip(2,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--打探光明顶消息中
	if nStep_XBTask_01 >= 1 and nStep_XBTask_01 <= 6 then
		task_009_01_1();
		return
	end
	
	---------------------------------- 西北区11分支1_3帝王之墓----------------------------------
	
	--打探完光明顶事情回来后
	if nStep_XBTask_01 == 7 then
		if is_show_title_level() == 1 then --亮出一品堂刺客称号 
			task_011_01_0();
		else
			xb_title_tip(2,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--还没见车轮霸王与拓拔弘对话
	 if nStep_XBTask_01 == 8 then
		task_011_01_1();
		return
	end
	
	---------------------------------- 西北区13分支1_5音绝古墓----------------------------------
	
	--与拓拔弘对话交给其金丝面罩
	if nStep_XBTask_01 == 15 then
		if is_show_title_level() == 1 then --亮出一品堂飞护称号 
			task_013_01_0();
		else
			xb_title_tip(3,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--还未将金丝面罩交给司马鸣风
	if nStep_XBTask_01 == 16 then
		task_013_01_1();
		return
	end
	
	---------------------------------- 西北区15分支1_6古墓风云----------------------------------
	
	--与拓拔弘对话得知爪王已经潜入陵墓（获得一品堂虎翼称号）
	if nStep_XBTask_01 == 22 then
		if is_show_title_level() == 1 then --亮出一品堂飞护称号 
			task_015_01_0();
		else
			xb_title_tip(3,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--尚未截杀爪王
	if nStep_XBTask_01 == 23 then
		task_015_01_1();
		return
	end
	
	---------------------------------- 西北区16分支1_7药人惊现----------------------------------
	
	--将墨斗和玉佩交给鸣风后与拓拔弘对话
	if nStep_XBTask_01 == 29 then
		if is_show_title_level() == 1 then --亮出一品堂虎翼称号 
			task_016_01_0();
		else
			xb_title_tip(4,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--未与车轮汇报关于陵墓的情况
	if nStep_XBTask_01 == 30 then
		task_016_01_1();
		return
	end
	
	---------------------------------- 西北区21分支1_12剑拔弩张----------------------------------
	--与拓拔弘对话
	if nStep_XBTask_01 == 57 then
		if is_show_title_level() == 1 then --亮出一品堂羽卫称号 
			task_021_02_0();
		else
			xb_title_tip(5,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--未杀死五行使对话
	if nStep_XBTask_01 == 58 then
		task_021_02_1();
		return
	end
	
	--杀死五行使对话
	if nStep_XBTask_01 == 59 then
		if is_show_title_level() == 1 then --亮出一品堂羽卫称号 
			task_021_04_0();
		else
			xb_title_tip(5,"Th竎 B箃 Ho籲g ");
		end
		return
	end
	
	--未杀死车轮霸王对话
	if nStep_XBTask_01 == 60 then
		task_021_04_1();
		return
	end
	
	--赠送五行阵门票
	if GetBit(GetTask(GIVE_TICKET_STATE),5) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"V? c玭g c竔 th? ng b轪 t, v? h鋍 sao c? k? m筺h nh蕋? V? t﹎ m韎 l? s? cao th蕄 c馻 v? ngh?."},
		{"Ki誱 v? t﹎ n誹 kh玭g h頿 nh蕋 th? chi b籲g t? nay ng d飊g ki誱."},
		{"Thi猲 h? tuy r閚g l韓 nh璶g ngi c? v? c玭g cao ch? xu蕋 hi謓 ? trung nguy猲."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--赠送门票脚本
function give_ticket_01()

local strTalk = {
	"Th竎 B箃 Ho籲g: H鉧 ra l? <sex>, ha ha ha, h譶h nh? ch髇g ta m鏸 l莕 g苝 m苩, ta u tr鋘g thng, u kh玭g th? ch╩ s鉩 ngi, th藅 h? th裯!",
	"Ngi ch琲: Ti襫 b鑙  xem ta l? h秓 h鱱, th? n鉯 chi nh鱪g l阨 kh竎h kh? th? ch?. V誸 thng c馻 ti襫 b鑙 c? n苙g kh玭g? Ng? H祅h S? r鑤 cu閏 x秠 ra chuy謓 g? th??",
	"Th竎 B箃 Ho籲g: Ha ha ha, h玬 trc T? M? Minh Phong m韎 t苙g m閠 輙 thu鑓 gia truy襫, ta   nhi襲 r錳. L莕 n祔 th藅 s? l? may m緉, c竚 琻 ngi l莕 trc n sa m筩 ph? Ng? H祅h Tr薾 m閠 l莕, khi課 cho nguy猲 kh? c馻 h? b? t鎛 thng. 5 ngi trong Ng? H祅h S? l? m閠, tuy謙 i s? kh玭g h祅h ng ri猲g l?, nh? h玬 nay ch? c? 3 ngi h祅h th輈h ta, ta 畂竛 c? 2 nguy猲 nh﹏. L? Nguy猲 Kh竛h nh蕋 nh  truy襫 {Thi誸 Chu L謓h}, hai l? 5 ngi trong Ng? H祅h S? t蕋 c? u ch璦 h錳 ph鬰 nguy猲 kh?, cho d? l? 3 ngi c騨g kh玭g th? kh玭g h祅h ng.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ngi ch琲: Ti襫 b鑙 kh玭g ng筰, ta c祅g an t﹎. Xem ra Nh蕋 Ph萴 阯g kh玭g d? d祅g t? b?. {Thi誸 Chu L謓h} m? ti襫 b鑙 n鉯 c? th? gi鑞g v韎 Truy S竧 l謓h kh玭g?",
	"Th竎 B箃 Ho籲g: Kh玭g sai, th藅 ra Ng? H祅h S? thu閏 nh鉳 竚 s竧 Nh蕋 Ph萴 阯g, y l? t? ch鴆 b? m藅 tr鵦 ti誴 nghe l謓h t? L? Nguy猲 Kh竛h, th玭g tin ta bi誸 kh? 輙. Nh璶g Thi誸 Chu L謓h c馻 L? Nguy猲 Kh竛h, l? Truy S竧 l謓h kh玭g ph﹏ bi謙 th阨 gian, kh玭g gian, a 甶觤, th? 畂筺, kh玭g t 頲 m鬰 ch s? kh玭g r髏 l謓h. Nh鉳 竚 s竧 n祔 s? ra tay gi鑞g nh? th? 畂筺 竚 s竧 c竎 Chng m玭 i m玭 ph竔 ? Trung Nguy猲. L蕐 nguy猲 nh﹏ l? Ng? H祅h S? tuy ch? c? 3 ngi, v蒼 ph秈 ch蕄 h祅h nhi謒 v?, 萵 t譶h ph輆 sau kh? m? 畂竛 頲. <sex> c? an t﹎, n誹 ta 畂竛 kh玭g sai, ngi c騨g l? m鬰 ti猽 c馻 ch髇g.",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Ngi ch琲, H鮩, Nh蕋 Ph萴 阯g ng l? xem thng ngi kh竎, xem ra ng祔 n祇 ch璦 gi誸 頲 Ng? H祅h S? th? kh? tr竛h kh醝 h藆 ho筺, D? cho c? xem ta l? m鬰 ti猽, Ng? H祅h S? v蒼 ch璦 h錳 ph鬰 nguy猲 kh?, chi b籲g ra tay trc. Nh璶g l莕 trc ta  th? qua uy l鵦 c馻 Ng? H祅h Tr薾 r錳, ch髇g th藅 s? r蕋 kh? i ph?.",
	"Th竎 B箃 Ho籲g: Ng? H祅h S? tng sinh tng kh綾, d飊g t礽 n╪g  c﹏ b籲g, tr? phi m閠 nh竧 ti猽 di謙 h誸 b鋘 ch髇g, n誹 kh玭g th? ai trong s? ch髇g c騨g kh玭g th? ch誸 頲. Nguy猲 kh? c馻 ch髇g ch璦 h錳 ph鬰, n誹 ra tay trc kh玭g ng鮪g 竝 ch? ch髇g, h? s? kh? m? th鵦 hi謓 nhi謒 v?,  c騨g l? c竎h t鑤. N誹 Ng? H祅h S? truy s竧 ngi t筼 ph秐, s?  l筰 {Ng? H祅h K? Phi猲}, m閠 l? cho th? nh﹏ bi誸  l? ngi do Ng? H祅h S? truy s竧, hai l? nh綾 nh? ai c? ? t筼 ph秐, d飊g {Ng? H祅h K? Phi猲} l? k? hi謚 c馻 Ng? H祅h S?. Mang v藅 n祔 n Ng? H祅h Tr薾, cho d? Ng? H祅h S? c? tr鋘g thng c騨g s? k誸 tr薾 ti誴 ngi, n誹 ngi l? ngi Thi誸 Chu L謓h truy s竧, ch髇g s? kh玭g d? g? b? qua. N誹 ch髇g b筰 tr薾, sau n祔 ngi c騨g c? th? d飊g v藅 n祔 ti誴 t鬰 竝 ch? Ng? H祅h Tr薾.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1035,1,1);--得到五行旗幡
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),5,1));
	
end