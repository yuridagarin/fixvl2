--脚本名称：清明节活动指南使用脚本
--脚本功能：对清明节活动的介绍
--策划人：阿松
--代码编写人：村长
--代码编写时间：2007-03-14
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数

tomb_sweep_2007_date_seq = 852						--拜祭的时间
tomb_sweep_2007_times_count = 853					--拜祭的次数统计
tomb_sweep_2007_task_reel_diff = 857				--当前的任务种类

function OnUse()
	Say("? y ghi r? ho箃 ng <color=yellow>Ti誸 Thanh Minh<color>, b筺 mu鑞 t譵 hi觰 m鬰 n祇?",
	4,
	"Xem ti課 tri觧 ho箃 ng/player_step_inq",
	"Xem n閕 dung ho箃 ng./tomb_sweep_2007_inf",
	"Ti誸 Thanh Minh/tomb_sweep_story",
	"сng hng d蒼/end_dialog"
	)
end
--************************活动进展查询***************************
function player_step_inq()
	local kotowl_today_chk = "Ch璦 b竔 t?!"
	if GetTask(tomb_sweep_2007_date_seq) >= zgc_pub_day_turn(1) then
		kotowl_today_chk = "Х b竔 t?"
	end
	local totowl_times_count = GetTask(tomb_sweep_2007_times_count)
	if totowl_times_count == nil then
		totowl_times_count = 0
	end
	local task_inf = ""
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_diff ~= 0 and task_diff ~= nil then
		local task_reel_table = {
			--任务类型(（1、为杀怪；2为收集）-完成标志-怪物名称-触发器ID-奖励百分几率-奖励倍数-随机祭品数量--说明
			"    <color=yellow>Nhi謒 v?:<color>Ngo礽 th祅h c? nh鱪g t猲 <color=yellow>C玭 <color> l祄 h筰 b? t竛h,  甶 nh b筰 <color=yellow>30<color> t猲,  sau  n <color=yellow>Th? l╪g nh﹏<color> ph鬰 m謓h. \n    <color=yellow>Ph莕 thng: 95%<color> x竎 su蕋 <color=yellow>nh﹏ i<color> kinh nghi謒 ho芻 <color=yellow>5%<color> x竎 su蕋 g蕄 <color=yellow>11<color>l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			--任务类型-收集物品种类-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的物品名称-收集的物品大类-副类-小类-数量--说明<color>
			"    <color=yellow>N閕 dung nhi謒 v?: 玦 h?<color> l祄 thu鑓 c? th? 甶襲 tr? c竎 b謓h t藅,  thu th藀 <color=yellow>20<color> <color=yellow>畊玦 h?<color> sau  quay v? <color=yellow>H祅 gia nh﹏<color>ph鬰 m謓h. \n <color=yellow>Ph莕 thng: x竎 su蕋 90% nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>10%<color> x竎 su蕋 g蕄 <color=yellow>6<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>N閕 dung nhi謒 v?: Quan s?<color> ? <color=yellow>Dng Trung ng<color> h? hi誴 b? t竛h,  gi竜 hu蕁 <color=yellow>30<color> t猲 m閠 b礽 h鋍 sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: x竎 su蕋 84$ nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>16%<color> x竎 su蕋 g蕄 <color=yellow>4<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>Nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚,  甶 thu th藀 10 <color=yellow>Linh Chu t?<color>,  10 <color=yellow>Da g蕌<color> sau   quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 80% x竎 su蕋 nh﹏ i <color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>20%<color> x竎 su蕋 g蕄 <color=yellow>3.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>Nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚,  n <color=yellow>Ki誱 M玭 Quan<color> thu th藀 10 <color=yellow>b莡 ru da d?<color>,  n <color=yellow>Ki誱 C竎 th鬰 o<color> thu th藀 10 <color=yellow>Kim Thoa<color> sau  quay v? H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 70% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>30%<color> g蕄 <color=yellow>2.7<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>Nhi謒 v?<color>: T譵 1 <color=yellow>Thi猲 Lang y<color> v? 1 <color=yellow>Minh Quang gi竝<color> sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 60% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>40%<color> x竎 su蕋 g蕄 <color=yellow>2.25<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>Nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚,  甶 thu th藀 10 <color=yellow>Gi竝 x竎 phi課 ? Уo Hoa Фo<color>,  10 <color=yellow>b秐  r鮪g n骾 g鑓 ? Чi Th秓 Nguy猲<color> sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 50% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>50%<color> x竎 su蕋 g蕄 <color=yellow>1.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>N閕 dung nhi謒 v?: Xi H醓 trng l穙<color> ? <color=yellow>Long Nh穘 ng<color> m? ho芻 b? t竛h,  甶 nh b筰 <color=yellow>30<color> t猲 sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 35% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.75<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>Nhi謒 v?<color>: T譵 1 chu玦 <color=yellow>Huy襫 thi誸 tr鋘g ki誱<color> v? 1 chu玦 <color=yellow>Ph? Thi猲 k輈h<color> sau  quay v? H祅 gia nh﹏ ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 35% x竎 su蕋 nh﹏ i<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 ho芻 <color=yellow>65% x竎 su蕋<color> g蕄 <color=yellow>1.75<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. ",
			"    <color=yellow>N閕 dung nhi謒 v?: Ti猽 Ti猲 T?<color> ? <color=yellow>Thanh  ng<color> m? ho芻 kh玭g 輙 nh﹏ s? v? l﹎, 甶 nh b筰 m閠 trong <color=yellow>30<color> ngi sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 100%<color> g蕄 <color=yellow>1.5<color> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒."
			}
		Talk(1,"","Nhi謒 v? hi謓 t筰: \n H玬 nay b筺"..kotowl_today_chk.."Hi謕 Ch駈g. \nHi謓 b筺 nh薾 m藅  nhi謒 v? th? <color=yellow>"..task_diff.."<color>, tin t鴆: \n"..task_reel_table[task_diff])
	else
		Talk(1,"","Nhi謒 v? hi謓 t筰: \n H玬 nay b筺"..kotowl_today_chk.."Hi謕 Ch駈g. \nHi謓 b筺 ch璦 nh薾 m藅  nhi謒 v? Ti誸 Thanh Minh!")
	end
end
--***************************活动详情****************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"    Th阨 gian ho箃 ng: <color=yellow>30/3 - 8/4<color>. \n Trong Ti誸 Thanh Minh vi謈 t秓 m? l? ch? y誹, ta c莕 n c髇g b竔 <color=yellow>Chu i hi謕, H祅 i hi謕, Hi猲 Vi猲 i hi謕<color>.",
	"     Trong Ti誸 Thanh Minh m鏸 ng祔 n b蕋 k? m? ph莕 c髇g b竔 <color=yellow>1<color> l莕 b籲g c竎h <color=yellow>v竔 l箉<color>. Do"..Zgc_pub_sex_name().."th祅h t﹎ nh薾 頲 m藅  nhi謒 v? c馻 th? l╪g nh﹏."
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","    Ho祅 th祅h nhi謒 v? mang <color=yellow>m藅 <color> giao tr? <color=yellow>H祅 gia nh﹏<color> s? nh薾 頲 <color=yellow>ph莕 thng<color> nh蕋 nh.",
		"    Ho祅 th祅h 15 l莕 <color=yellow>m藅  Thanh Minh<color> nh薾 頲 ph莕 thng g蕄 <color=yellow>10<color> l莕."
)
end
--**************************清明节由来***************************
function tomb_sweep_story()
	Talk(2,"tomb_sweep_story_1",
	"    Tng truy襫 v祇 th阨 chi課 qu鑓 phi t? c馻 <color=green>T蕁 Hi課 C玭g<color> l? <color=green>Li C?<color> v? mu鑞 con m譶h <color=green>H? T?<color> k? v? n猲 ﹎ m璾 gi誸 h筰 th竔 t? <color=green>Th﹏ Sanh<color>, <color=green>Th﹏ Sanh<color> b? 衟 t? s竧. L骳 n祔   c馻 <color=green>Th﹏ Sanh<color> l? <color=green>Tr鋘g Nh?<color> nh籱 tr竛h s? truy gi誸 n猲  b? tr鑞, trong th阨 gian n祔 ch辵 m鋓 u u蕋, t飝 t飊g 甶 theo ch? c? m蕐 ngi, trong s?  c? ngi th﹏ t輓 t猲 <color=green>Gi韎 T? Th玦<color>. C? l莕 <color=green>Tr鋘g Nh?<color> ng蕋 x豼 v? i. <color=green>Gi韎 T? Th玦<color> m閠 l遪g c鴘 <color=green>ch?<color>  l衝 c総 mi課g th辴 c馻 m譶h, nng ch輓 d﹏g cho Tr鋘g Nh?. 19 n╩ sau <color=green>Tr鋘g Nh?<color> v? nc l祄 vua tr? th祅h 1 trong ng? b? th阨 Xu﹏ Thu hi謚 <color=green>T蕁 V╪ C玭g<color>.",
	"    <color=green>T蕁 V╪ C玭g<color> sau khi n緈 quy襫  ban thng h藆 h躰h cho nh鱪g ai  c飊g 玭g l璾 vong ch辵 kh? duy ch? c? <color=green>Gi韎 T? Th玦<color> l? kh玭g c?. V? r錳 c? ngi t蕌 v韎 <color=green>T蕁 V╪ C玭g<color> c﹗ chuy謓 trc kia m? <color=green>Gi韎 T? Th玦<color>  l祄. <color=green>T蕁 V╪ C玭g<color> ch筺h l遪g nh? l筰 chuy謓 c?, l藀 t鴆 cho ngi m阨 <color=green>Gi韎 T? Th玦<color> v? tri襲 th? phong. Цng ti誧 ngi c? 甶 m阨 m蕐 l莕 m? <color=green>Gi韎 T? Th玦<color> v蒼 t? ch鑙."
	)
end
function tomb_sweep_story_1()
	Talk(2,"tomb_sweep_story_2",
	"    <color=green>T蕁 V╪ C玭g<color> ch th﹏ 甶 m阨 cho b籲g 頲 nh璶g khi <color=green>T蕁 V╪ C玭g<color> n n琲 <color=green>Gi韎 T? Th玦<color> th? th蕐 c鯽 ng.  nh﹏ kh玭g l阨 t? bi謙 d蒼 m? tr鑞 v祇 <color=yellow>C萴 s琻<color>. <color=green>T蕁 V╪ C玭g<color> cho Ng? L﹎ qu﹏ t譵 kh緋 <color=yellow>C萴 s琻<color> v蒼 kh玭g th蕐, c? ngi a ra ch? ? t r鮪g,  l筰 m閠 阯g s鑞g, khi l鯽 l韓 <color=green>Gi韎 T? Th玦<color> 総 ph秈 ch箉 ra.",
	"    <color=green>T蕁 V╪ C玭g<color> h? l謓h t r鮪g, l鯽 ch竬 ba ng祔 ba m v蒼 kh玭g th蕐 <color=green>Gi韎 T? Th玦<color> xu蕋 hi謓. дn khi l鯽 t総 ph竧 hi謓 tr猲 n骾 x竎 ch誸 ch竬 c馻 hai m? con <color=green>Gi韎 T? Th玦<color> 產ng 玬 ch苩 g鑓 c﹜. <color=green>T蕁 V╪ C玭g<color> nh譶 thi th? <color=green>Gi韎 T? Th玦<color> b藅 kh鉩, sau  cho ngi an t竛g t? t?, nh鱪g ngi an t竛g thi th? <color=green>Gi韎 T? Th玦<color> ph竧 hi謓 m閠 c竔 hang b猲 trong c? r蕋 nhi襲 , trong  c? t? 竜 tr猲 ghi m蕐 d遪g huy誸 th?: "
	)
end
function tomb_sweep_story_2()
	Talk(2,"",
	"    C竧 nh鬰 ph鬾g qu﹏ t薾 產n t﹎, n nguy謓 ch? c玭g thng Thanh Minh. \n Li評 h? t竎 qu? chung b蕋 ki課, cng t? b筺 qu﹏ t竎 gi竛 th莕. \nThng nhc ch? c玭g t﹎ h鱱 ng?, 鴆 ng? chi th阨 thng t? t豱h. \n Th莕 t筰 c鰑 tuy襫 t﹎ v? qu?, c莕 ch輓h thanh minh ph鬰 thanh minh.",
	"    <color=green>T蕁 V╪ C玭g<color> cho ngi an t竛g hai m? con <color=green>Gi韎 T? Th玦<color> di g鑓 c﹜ li評. V?  tng nh? <color=green>﹏ nh﹏<color> b蘮 ra l謓h i <color=yellow>C萴 s琻<color> th祅h <color=yellow>Gi韎 s琻<color>, tr猲 n骾 x﹜ d鵱g am mi評 th? c髇g ng th阨 ng祔 t r鮪g 頲 xem l? T誸 H祅 Th鵦, ngi d﹏ trong ng祔 n祔 kh玭g 頲 t l鯽, ch? ╪  ngu閕. \n N╩ th? hai <color=green>T蕁 V╪ C玭g<color> c飊g m qu莕 th莕 l猲 n骾 c髇g b竔  t? l遪g bi誸 琻. Sau khi c髇g b竔 b蘮 nh ng祔 n祔 l? <color=yellow>Ti誸 Thanh Minh<color>."
	)
end
