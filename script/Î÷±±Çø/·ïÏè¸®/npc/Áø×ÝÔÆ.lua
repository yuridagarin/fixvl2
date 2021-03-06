-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 凤翔府NPC柳纵云Script
-- By StarryNight
-- 2007/08/25 PM 3:13

-- 无欲则刚。

-- ======================================================

-- 引用剧情任务头文件
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- 西北区13分支1_5音绝古墓----------------------------------
	--求教柳纵云入墓情况
	if nStep_XBTask_01 == 18 then
		task_013_04_0();
		return
	end
	
	--尚未打败统领取得摸金符
	if nStep_XBTask_01 == 19 then
		task_013_04_1();
		return
	end
	
	--打败统领取得摸金符
	if nStep_XBTask_01 == 20 then
		task_014_01_0();
		return
	end
	
	---------------------------------- 西北区14分支1_6入墓之争----------------------------------
	
	--取得或未取得断水杵和罗庚
	if nStep_XBTask_01 == 21 then
		task_014_02_0();
		return
	end
	
	--未与拓拔弘对话（补发断水杵和罗庚）
	if nStep_XBTask_01 >= 22 and nStep_XBTask_01 <= 24 then
		task_014_02_1();
		return
	end
	
	--赠送皇陵秘道门票
	if GetBit(GetTask(GIVE_TICKET_STATE),2) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--一般情况下的对话
	strTalk = {
		{"C竎 h? c? bi誸 T祇 Th竜? T? ti猲 ta ch輓h l? ngi 頲 T祇 Th竜 phong ch鴆 Hi謚 髖."},
		{"N誹 M? Kim Ph? n i ta b? th蕋 truy襫 th? th藅 c? l鏸 v韎 t? ti猲."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--赠送门票脚本
function give_ticket_01()

local strTalk = {
	"Li評 Tung V﹏: <sex> c? chuy謓 g? n鱝 ?? L莕 trc ngi  t譵 M? Kim ph? cho ta, ta ch璦 th? c秏 琻 ngi, th藅 l? x蕌 h?. <sex> h譶h nh?  n T莕 L╪g, cho n猲 ta c? m閠 s? chuy謓 mu鑞 th豱h gi竜.",
	"Ngi ch琲: Ti猲 sinh kh玭g c莕 kh竎h kh?, n誹 l? chuy謓 c? li猲 quan n l╪g m?, nh蕋 nh ta bi誸 g? s? n鉯.",
	"Li評 Tung V﹏: Kh玭g gi蕌 g? <sex>, ta v鑞 cho r籲g ngi gi髉 ta 畂箃 l筰 M? Kim ph? gia truy襫, nh璶g sau n祔 ta ph竧 hi謓  th藅 s? kh玭g ph秈 l? M? Kim ph? c馻 nh? ta. Chuy謓 n祔 khi課 ta th藅 kinh ng筩. Л琻g nhi猲 <sex> gi髉 ta 畂箃 l筰 M? Kim ph?, ta  r蕋 c秏 k輈h, c? ph秈 gia truy襫 hay kh玭g kh玭g c遪 quan tr鋘g n鱝. Chuy謓 ta ng筩 nhi猲 l? c遪 c? M? Kim ph? c馻 ngi kh竎 r琲 trong m?, ngi 甶 theo ch誸 trong m? kh玭g 輙. C遪 c? chuy謓 khi課 ta ng筩 nhi猲 n鱝 l?, h譶h dang m? kim ph? <sex> 畂箃 v? gi鑞g v韎 c馻 ta, nh璶g th阨 gian  qu? l﹗ r錳, h譶h nh? 產ng 萵 gi蕌 m閠 v礽 b? m藅.",
	"Ngi ch琲: C? chuy謓 n祔 sao? Nh璶g ph? n祔 ng l? ta 畂箃 l筰 t? vi謈 nh b筰 th鑞g l躰h Binh m? d騨g m?.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Li評 Tung V﹏: E r籲g M? Kim ph? <sex> 畂箃 l筰 l? ph? m? th鑞g l躰h cp t? ngi cp m? kh竎. Cho n猲 ta mu鑞 h醝 <sex>, trong m? tr? Binh m? d騨g ra, c遪 c? Tr蕁 m? linh v藅 v? v藅 g鋓 l? Qu? Tng Qu﹏ kh玭g?",
	"Ngi ch琲: Kh玭g sai, t莕g 2 trong l╪g m? th藅 s? c? Qu? Tng Qu﹏, r蕋 kh? i ph?, ti猲 sinh ch璦 v祇 t莕g 2, sao bi誸 chuy謓 n祔?",
	"Li評 Tung V﹏: Qu? nhi猲 l? nh? v藋, v藅 gi? m? c? th? ho箃 ng t? nhi猲, t竎 d鬾g c馻 b秐  S琻 H? X? T綾 ho祅 to祅 kh玭g ng tin. Ngi nh譶 M? Kim ph? n祔 c? kh綾 m蕐 ch? {Ngang nhi猲 x﹎ ph筸, ch誸 di tay Qu? Tng Qu﹏}, h譶h nh? l? trc khi ch誸 ngi cp m?  l筰. Nh? ta d? 畂竛, ti猲 n? n祔 c? th? l? ngi cp m?, c? ta  ph竧 hi謓 b秓 v藅 ? T莕 Ho祅g, t譵 n ch? Qu? tng qu﹏, Qu? Tng Qu﹏ l? linh v藅 h? b秓, khi ti猲 n? n祔 畂箃 b秓 v藅, T莕 Ho祅g v? h? b秓 m? nh藀 h錸 v祇 Qu? Tng Qu﹏. C? m閠 ngi cp m? c飊g v祇 l╪g m?  nh譶 th蕐 c秐h n祔, ch? l? h緉 kh玭g may b? Tr蕁 M? Linh Th? cp m蕋 m筺g. E r籲g v藅 gi? m? v蒼 l? k? s竎h xua 畊鎖 c馻 h錸 T莕 Ho祅g.",
	"Ngi ch琲? Sao? L? n? ?? N? v祇 T莕 L╪g t譵 b秓 v藅 sao? Vi謈 n祔厖",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Li評 Tung V﹏: <sex> mu鑞 bi誸 ?? Nh璶g c? m閠 s? chuy謓 kh玭g th? n鉯 ra. <sex> c? th? nh譶 th蕐 Tr蕁 M? Linh Th? sao? N誹 mu鑞 t譵 hi觰 chuy謓 n祔, e r籲g ph秈 甶 l╪g m? m閠 chuy課.",
	"Ngi ch琲: Tr蕁 M? Linh Th? n祔 l? Tr蕁 m? th? canh gi? m藅 o t莕g 1, 2. Цng ti誧 ta  n m藅 o 1 l莕, trong m? c? c? quan, m藅 o h譶h nh?  b? phong t醓, v祇 kh玭g 頲 n鱝.",
	"Li評 Tung V﹏: Th藅 s? v祇 l筰 m藅 o c騨g l? chuy謓 kh?. Ta c? nghi猲 c鴘 i v韎 c? quan trong l╪g m?, m藅 th蕋 th玭g thng trong l╪g m? n誹 b? c? quan phong t醓, c? th? d飊g {H錳 Long S竎h}  m?, nh? v藋 c? th? v祇 頲 m藅 o m閠 l莕 n鱝. N誹 <sex> c? c竎h, th? ph秈 n l╪g m? m閠 chuy課, {H錳 Long S竎h} n祔 c? th? gi髉 頲 ngi.",
	"Ngi ch琲: Ki課 th鴆 c馻 Ti猲 sinh i v韎 C? M芻 ng l? ng n?. T筰 h? mu鑞 n m藅 o l╪g m?  x竎 nh薾 m閠 chuy謓, 產 t? H錳 Long S竎h c馻 ti猲 sinh.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1032,1,1);--得到回龙索
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),2,1));
	
end