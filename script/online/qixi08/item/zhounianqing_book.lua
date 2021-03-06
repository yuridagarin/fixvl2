--二十周年庆活动说明
--by vivi
--2008/11/06

IB_VERSION = 1		--1表示是免费区，0表示收费区

g_nHeadInfo = "<color=green>Hng d蒼 ho箃 ng 20 n╩<color>: "

function OnUse()
	local strtab = {
				"Th阨 gian ho箃 ng/know_time",
				"襲 ki謓 tham gia /know_condition",
				"Hng d蒼 quy t綾 ho箃 ng/know_rule",
				"Thuy誸 minh ph莕 thng/know_award",
--				"新物品说明/know_new",
				"Hng d蒼 ng/nothing"
				};
	Say(g_nHeadInfo.."Зy l? n琲 hng d蒼 ho箃 ng K? ni謒 20 n╩ th祅h l藀 Kingsoft, ngi mu鑞 t譵 hi觰 ph莕 n祇?",getn(strtab),strtab);
end

function know_time()
	Talk(1,"OnUse",g_nHeadInfo.."Th阨 gian m? ho箃 ng l莕 n祔 l? 13/11/2008 sau khi b秓 tr?, n 23h 7/1/2009.\n    Th阨 gian i ph莕 thng l? 13/11/2008 sau khi b秓 tr? n 23 gi? 14/1/2009.");
end

function know_condition()
	Talk(1,"OnUse",g_nHeadInfo.."Ch? c莕 b筺 h琻 c蕄 30 l? c? th? tham gia t蕋 c? ho箃 ng (kh玭g bao g錷 c蕄 30).");
end

function know_rule()
	Say(g_nHeadInfo.."Ho箃 ng c? hai ph莕, thi u v? thu th藀 v藅 ph萴, ngi mu鑞 xem hng d蒼 ph莕 n祇?",
			3,
			"Thi u/know_rule_1",
			"Thu th藀 v藅 ph萴/know_rule_2",
			"Xem hng d蒼 kh竎/OnUse");
end

function know_rule_1()
	Talk(3,"know_rule",g_nHeadInfo.."Thi u c? 3 ph莕: \n    竛 s?, sau khi tr? ch琲 b総 u h? th鑞g s? t? ng a ra ch? s? (ph筸 vi t? 0-100). S? c? khung nh藀 hi謓 ra, 甶襫 s? b筺  畂竛 v祇, sau khi x竎 nh薾, h? th鑞g s? th玭g b竜 cho b筺 bi誸 s? c馻 b筺 a ra c? kh韕 v韎 s? h? th鑞g kh玭g, n誹 畂竛 tr髇g trong v遪g 5 l莕, xem nh? th緉g.",g_nHeadInfo.."箃 B秓 K? Binh, sau khi tr? ch琲 b総 u, h? th鑞g s? refresh b秓 rng v? c? quan theo th阨 gian nh蕋 nh, nh蕁 v祇 c? quan c? th? g﹜ c秐 tr? cho i th? v? t╪g cng b秐 th﹏. Khi refresh b秓 rng, n誹 b筺 kh玭g l蕐 頲 b秓 rng, th? s? b? tho竧 ra, xem nh? th蕋 b筰, ngi c遪 l筰 sau c飊g s? l? ngi th緉g cu閏.",g_nHeadInfo.."觤 Жng H閕, sau khi tr? ch琲 b総 u, Th竛h H醓 Уi s? l莕 lt 頲 th緋 s竛g trong m閠 th阨 gian nh蕋 nh, 1 kho秐g th阨 gian sau s? t? ng t総, sau khi Th竛h H醓 Уi t総 , b筺 ch? c莕 nh鉳 l鯽 theo tr譶h t?,  n? s竛g tr? l筰, th? s? th緉g.");
end

function know_rule_2()
	Talk(1,"know_rule",g_nHeadInfo.."S? gi? V? L﹎ s? y猽 c莡 ngi thu th藀 m閠 s? v藅 ph萴 cho h?, t飝 v祇 s? lng v藅 ph萴 ngi thu th藀 頲 nhi襲 hay 輙 m? ngi c? th? i 頲 ph萵 thng, n誹 ngi mu鑞 c? 頲 nhi襲 ph莕 thng h琻 n鱝, th? ngi c? th? ti誴 t鬰 thu th藀  i. Ch? ?, c? h筺 ch? v? s? l莕 i ph莕 thng m鏸 tu莕.");
end

function know_award()
	if IB_VERSION == 1 then
		Talk(2,"OnUse",g_nHeadInfo.."N誹 tham gia tr? ch琲 thi u b筺 c? th? nh薾 頲 kinh nghi謒 v? r蕋 輙 甶觤, tham gia ho箃 ng thu th藀 nh薾 頲 tng i nhi襲 甶觤. D飊g 甶觤 c? th? i kinh nghi謒, Rng k? ni謒 20 n╩ v? M藅 t辌h h頿 th祅h. \n\nKhi m? Rng k? ni謒 20 n╩ c? th? nh薾 頲 nh鱪g v藅 ph萴 sau: \nNg鵤 120% di chuy觧,  b襫 200 甶觤 (Dng M玭 l? chi課 m? 35% di chuy觧,  b襫 1000 甶觤)\nM藅 t辌h cao c蕄 S? M玭 (ch璦 gia nh藀 l璾 ph竔 ng蓇 nhi猲 nh薾 頲 1 quy觧 m藅 t辌h c馻 b蕋 c? l璾 ph竔 n祇) \n 100 tri謚 kinh nghi謒 (l璾 ?, khi kinh nghi謒 c馻 b筺 t n 2 t?, th? ph莕 d? ra s? b? m蕋, m鏸 tu莕 ch? c? th? i th祅h c玭g 1 l莕)\nThi猲 Qu竔 Th筩h (d飊g th╪g c蕄 trang b? Vi猰 д, trang b? tng qu﹏, trang b? nguy猲 so竔 v? i trang b? Thi猲 мa Huy襫 Ho祅g th祅h trang b? Thi猲 Qu竔)",g_nHeadInfo.."\nмnh H錸 Thi猲 Th筩h Th莕 Th筩h (cng h鉧 v藅 ph萴, khi  cng h鉧 l? 7 th? kh玭g th? cng h鉧 n鱝)\nM秐h Thi猲 Th筩h (trang b? cng h鉧 c蕄 1-4 ti猽 hao v藅 ph萴)\nThi猲 Th筩h Tinh Th筩h (trang b? cng h鉧 c蕄 8-15 ti猽 hao v藅 ph萴)\nKinh nghi謒 l藀 phng ng c蕄\nHuy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓\n    Ph莕 thng ? tr猲, s? c╪ c? v祇 ch譨 kh鉧 d飊g  m? b秓 rng m? c? t? l? kh竎 nhau, t蕋 c? nh鱪g v藅 ph萴 ? tr猲, tr? <color=yellow>kinh nghi謒, Thi猲 Qu竔 Th筩h, Huy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓<color>, u c? th? giao d辌h 頲, ch骳 b筺 may m緉!");
	else
		Talk(2,"OnUse",g_nHeadInfo.."N誹 tham gia tr? ch琲 thi u b筺 c? th? nh薾 頲 kinh nghi謒 v? r蕋 輙 甶觤, tham gia ho箃 ng thu th藀 nh薾 頲 tng i nhi襲 甶觤. D飊g 甶觤 c? th? i kinh nghi謒, Rng k? ni謒 20 n╩ v? M藅 t辌h h頿 th祅h. \n\nKhi m? Rng k? ni謒 20 n╩ c? th? nh薾 頲 nh鱪g v藅 ph萴 sau: \nNg鵤 120% di chuy觧,  b襫 200 甶觤 (Dng M玭 l? chi課 m? 35% di chuy觧,  b襫 1000 甶觤)\nM藅 t辌h cao c蕄 S? M玭 (ch璦 gia nh藀 l璾 ph竔 ng蓇 nhi猲 nh薾 頲 1 quy觧 m藅 t辌h c馻 b蕋 c? l璾 ph竔 n祇) \n 100 tri謚 kinh nghi謒 (l璾 ?, khi kinh nghi謒 c馻 b筺 t n 2 t?, th? ph莕 d? ra s? b? m蕋, m鏸 tu莕 ch? c? th? i th祅h c玭g 1 l莕)\nThi猲 Qu竔 Th筩h (d飊g th╪g c蕄 trang b? Vi猰 д, trang b? tng qu﹏, trang b? nguy猲 so竔 v? i trang b? Thi猲 мa Huy襫 Ho祅g th祅h trang b? Thi猲 Qu竔)",g_nHeadInfo.."\nThi猲 Th筩h Linh Th筩h (cng h鉧 trang b? tr鵦 ti誴 t n c蕄 7)\nNguy謙 Hoa ho芻 N? Oa Tinh Th筩h\nKinh nghi謒 l藀 phng ng c蕄\nHuy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓\n    Ph莕 thng ? tr猲, s? c╪ c? v祇 ch譨 kh鉧 d飊g  m? b秓 rng m? c? t? l? kh竎 nhau, t蕋 c? nh鱪g v藅 ph萴 ? tr猲, tr? <color=yellow>kinh nghi謒, Thi猲 Qu竔 Th筩h, Huy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓<color>, u c? th? giao d辌h 頲, ch骳 b筺 may m緉!");
	end
end

function know_new()
	Talk(1,"OnUse",g_nHeadInfo.."Th猰 Thi猲 Qu竔 Th筩h, sau khi nh蕁 ph輒 ph秈 s? d鬾g, c? th? chuy觧 trang b? Thi猲 Чi Huy襫 Ho祅g nh qu? th祅h Thi猲 Qu竔.\n  Trang b? Thi猲 Qu竔 c? th? k輈h ho箃 c飊g v韎 trang b? b竧 qu竔 c馻 ho箃 ng K? ni謒 20 n╩ (trang b? b竧 qu竔 c? th? d飊g l﹗ d礽, sau ho箃 ng c? th? k輈h ho箃), ch? ?, thu閏 t輓h k輈h ho箃 trang b? b竧 qu竔 n祔 kh玭g c莕 ng c蕄 nh qu?, b蕋 k? trang b? b竧 qu竔 ng c蕄 n祇 u k輈h ho箃 thu閏 t輓h tng ng.");
end

function nothing()

end
