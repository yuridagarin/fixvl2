-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC孙二琏Script
-- By StarryNight
-- 2007/06/07 PM 2:47

-- 想念是一刹那，思念是很多个一刹那

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);

	---------------------------------- 西北任务02情困客栈----------------------------------
	
	--开始任务
	if nStep_XBTask == 5 then
		task_002_01_0();
		return
	end
	
	--未与店小二取得醒酒药
	if nStep_XBTask >= 6 and nStep_XBTask <= 7 then
		task_002_01_1();
		return
	end
	
	--送服醒酒药后对话
	if nStep_XBTask == 8 then
		task_002_04_0();
		return
	end
	
	--未取得肚兜之前对话
	if nStep_XBTask >= 9 and nStep_XBTask <= 12 then
		task_002_04_1();
		return
	end
	
	---------------------------------- 西北任务04招兵买马----------------------------------
	--取得肚兜后将肚兜交与孙二琏
	if nStep_XBTask == 13 then
		task_004_01_0();
		return
	end
	
	--还没取得或取得一品堂邀请函
	if nStep_XBTask == 14 then
		task_004_02_0();
		return
	end
	
	--还没与欧阳画汇报情况
	if nStep_XBTask == 15 then
		task_004_02_1();
		return
	end
	
	--赠送五行阵门票
	if GetBit(GetTask(GIVE_TICKET_STATE),6) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"Th藀 Tam Nng? M? Ki襲 Nng?"},
		{"C遪 r蕋 nhi襲 tin t鴆 c莕 thu th藀, th鵦 ra tin t鴆 c騨g c? th? mua 頲 b籲g ti襫 v藋."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--赠送门票脚本
function give_ticket_01()

local strTalk = {
	"T玭 Nh? Li謒: <sex> ch髇g ta l筰 g苝 nhau r錳, v蒼 kh醗 ch?? Nghe  Dng ti猲 sinh n鉯 ngi  ph? 頲 ﹎ m璾 c馻 Nh蕋 Ph萴 Л阯g, vi謈 n祔 khi課 ta r蕋 kh﹎ ph鬰. Chuy謓 Nh蕋 Ph萴 Л阯g ng ra  n h錳 k誸 th骳, kh玭g ng? thi猲 tai l筰  xu鑞g, ngi c? th蕐 m m﹜ 甧n ng xa kh玭g? N?  t? ? y h琻 mi m蕐 ng祔 r錳 v蒼 ch璦 tan!",
	"Ngi ch琲: T玭 ti猲 sinh kh竎h s竜 qu?! T筰 h? khi v祇 Long M玭 tr蕁 th蕐 h譶h nh? n琲 y b? t祅 ph? r蕋 nhi襲, nhi襲 nh?  b? gi? c竧 v飅 l蕄, Long M玭 tr蕁  x秠 ra chuy謓 g?? Цm m﹜ 甧n n祔 d? b竜 甶襲 g??",
	"T玭 Nh? Li謒: ng nh? <sex>  th蕐, m蕐 ng祔 nay Long M玭 tr蕁 b? b穙 c竧 t祅 ph?, cu錸g phong tr玦 qua ch糿g ai gi薾 d? ch? c? v礽 h?  d鋘 甶 r錳, ch? c? qu竛 tr? Long M玭, d? ta c? khuy猲 Th藀 Tam Nng c竎h m蕐 b? ta c騨g kh玭g ch辵 d鋘 甶 n琲 kh竎, kh玭g bi誸 v? sao n鱝...ngi n鉯 xem, qu竛 tr? nh? n祔 l祄 sao ch鑞g  頲 n誹 b穙 c竧 l筰 xu蕋 hi謓?",
	"Ngi ch琲: Th? ra ti猲 sinh lo l緉g qu竛 tr? l? c馻 Th藀 Tam Nng? Theo l阨 ti猲 sinh n鉯 tr蕁 n祔 ch? c遪 duy nh蕋 qu竛 tr? n祔, b穙 c竧 r鑤 c鬰 l? chuy謓 g? v藋?",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"T玭 Nh? Li謒: Kh玭g sai! Ta l? ngi ? g莕 sa m筩 bi誸 chuy謓 b穙 c竧, c? l? 玭g tr阨 產ng n鎖 gi薾 v? mu鑞 tr鮪g ph箃 nh﹏ gian! b総 u t? t薾 c飊g sa m筩 b穙 c竧 bay ngang th? n c? c﹜ c騨g kh玭g s鑞g n鎖, c? l? 玭g tr阨 kh玭g mu鑞 gi? m秐h t n祔 n鱝. Qu竛 tr? c馻 Th藀 Tam Nng b? gi? c竧 che ph? b? ta m韎 an t﹎ sao?",
	"Ngi ch琲: T薾 c飊g sa m筩? B鉵g r﹎ c馻 m m蕐 甧n  c? th? l? m? cung sa m筩?",
	"T玭 Nh? Li謒: ng v藋! Ch輓h l? m? cung sa m筩. <sex> n m? cung sa m筩 ch璦? H譶h nh? n? c? m閠 n琲 g鋓 l? t薾 c飊g sa m筩, tng truy襫 thng c? nhi襲 甶襲 k? b?. b穙 c竧 t? t薾 c飊g sa m筩 th鎖 qua c? sa m筩, ch糿g l? ch髇g c? quan h? v韎 nh鱪g 甶襲 k? b? ? t薾 c飊g sa m筩?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Ngi ch琲: 秓 gi竎 sa m筩  b? ta d飊g C玭 L玭 ph竝 kh? phong 蕁, c? 甶襲 n? c? th? tr飊g sinh, Nh蕋 Ph萴 Л阯g t鮪g mu鑞 kh鑞g ch? 秓 gi竎  mn n?  ph鬰 v? cho chi課 tranh? B穙 c竧 qu? th藅 c? s鴆 m筺h v藋 sao? Xem ra ph秈 甶 t薾 c飊g sa m筩 m閠 chuy課, c? 甶襲 l莕 n祔 xem ra kh玭g d? d祅g g?.",
	"T玭 Nh? Li謒: Th? ra l? nguy猲 nh﹏ n祔, c? 甶襲 <sex> mu鑞 n t薾 c飊g sa m筩 th? ta kh玭g c? c竎h n祇 gi髉, phng hng sa m筩 r蕋 kh? 畂竛, ta t鮪g n sa m筩 t譵 t譶h b竜, d飊g {La B祅} c? th? d蒼 阯g n t薾 c飊g sa m筩, m? kh玭g s? l鋞 v祇 m? cung sa m筩, nh璶g khi n t薾 c飊g sa m筩 th? t? trng s? m蕋 甶 n誹 mu鑞 甶 ti誴 th? ph秈 t譵 th猰 1 {La B祅}. <sex> qu竛 tr? c馻 Th藀 Tam Nng c? th? gi? 頲 hay kh玭g u nh? v祇 ngi !",
	"Ngi ch琲: Ti猲 sinh qu? l阨 r錳, chuy謓 b穙 c竧 c? li猲 quan b? t竛h xung quanh sa m筩, l? n祇 kh玭g t薾 l鵦?",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1036,1,1);--得到磁沙罗盘
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),6,1));
	
end
