--File name:festival_book_item.lua 
--Describe:三节连过，活动指南
--Create Date:2006-8-31
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	local selTab = {
			"Nh薾 頲 b竛h Trung Thu M? V?/detail_1",
			"Nh薾 thng V? L﹎ Minh/detail_6",
--			"领取两周年奖励/detail_2",
			"B竛h Trung Thu, l蕐 o c? i ph莕 thng /detail_3",
			"L祄 c竎 lo筰 b竛h Trung Thu/detail_4",
			"фi th? k? ni謒 nh薾 ph莕 thng/detail_5",
			"[-сng hng d蒼-]/nothing",
			}
	Say("<color=green>Hng d蒼<color>: B筺 mu鑞 t譵 hi觰 phng di謓 n祇? в bi誸 t? m? c? c蕌 gi秈 thng m阨 n tra h醝 ngi qu秐 l? tng 鴑g.",getn(selTab),selTab);
end;

function detail_1()
	Talk(1,"OnUse","<color=green>Hng d蒼<color>: Nh薾 b竛h Trung Thu M? V?: <enter>Th阨 gian ho箃 ng, <color=yellow>11:30, 14:30, 21:00, 23:00 m鏸 ng祔<color>, ngi ch琲 n g苝 Ni猲 s? nh薾 b竛h Trung Thu, s? lu頽g c? h筺, ai n trc s? nh薾 trc, <color=yellow>m鏸 ng祔 ch? c? th? nh薾 1 l莕<color>, n誹 l? th阨 gian c? th? mua <color=yellow>Danh s竎h ngi ch琲 c?<color> ? Ng? C竎  nh薾 b? sung.");
end;

function detail_2()
	Talk(1,"OnUse","<color=green>Hng d蒼 <color>: Ch髇g t玦  chu萵 b? r蕋 nhi襲 ph莕 thng cho ngi ch琲 c?, b筺 n祇 tham gia V? L﹎ 2 v祇 3 th阨 甶觤 kh竎 nhau s? c? ph莕 thng tng 鴑g. \nQuy t綾 ph莕 thng: \n1, x﹜ d鵱g nh﹏ v藅 nhi襲 h琻 600 ng祔 頲 t苙g 20 rng s総 ho芻 5 rng ng ho芻 1 rng b筩\n2, x﹜ d鵱g nh﹏ v藅 tr猲 300 ng祔 頲 t苙g 10 rng s総 ho芻 2 rng ng \n3, x﹜ d鵱g nh﹏ v藅 輙 h琻 100 ng祔 頲 t苙g 5 rng s総 ho芻 1 rng ng.");
end;

function detail_3()
	Talk(1,"detail_3_ex","<color=green>Hng d蒼<color>: M鏸 ng祔 v祇 <color=yellow>16:30, 19:30, 21:45<color> c竎 Boss s? xu蕋 hi謓 b猲 ngo礽 <color=yellow>Ph鬾g Tng, Tuy襫 Ch﹗, Th祅h Й<color>, nh b筰 c竎 BOSS n祔 c? th? g鋓 ra Ti觰 qu竔, nh蕁 v祇 Ti觰 qu竔 nh薾 頲 c竎 B秓 h閜 (m鏸 ngi m鏸 gi? ch? c? th? nh蕁 1 l莕), m鋓 ngi ph秈 c? ch譨 kh鉧 tng 鴑g m? c竎 b秓 h閜  nh薾 ph莕 thng");
end;

function detail_3_ex()
	Talk(1,"OnUse","<color=green>Hng d蒼<color>: T誸 Trung Thu l筰 n, n╩ nay ngo礽 vi謈 l祄 c竎 b竛h trung thu  thng th鴆 c遪 c? th? n ch? ta фi c竎 lo筰 b秓 h閜 c馻 V? l﹎ minh ch? ph竧. Mu鑞 bi誸 b秓 h閜 c? c玭g d鬾g g? h穣 n g苝 <color=yellow>c s? V? L﹎<color>. Ngo礽 ra n誹 b筺 nh薾 頲 th? k? ni謒 JX2 tr遪 3 n╩ c? th? n g苝 Ni猲 s? i thng.");
end;

function detail_4()
	Talk(1,"detail_4_ex","<color=green>Hng d蒼<color>: <enter>C竎h l祄 b竛h trung thu: <enter>M鏸 ng祔 n g苝 Ni猲 s? nh薾 nguy猲 li謚 v? c玭g c? l祄 b竛h, ╪ c竎 b竛h trung thu s? nh薾 頲 c竎 hi謚 qu? c bi謙.<enter><color=yellow>1. Nh薾 nguy猲 li謚<color>: Trong th阨 gian ho箃 ng, m鏸 ng祔 online n g苝 Ni猲 s?  nh薾 nguy猲 li謚, ngo礽 ra c? th? mua th猰 c竎 nguy猲 li謚 l祄 b竛h t筰 y.<enter><color=yellow>2. N蕌 b竛h<color>: u ti猲, nh蕁 ch鋘 c玭g c?, sau  b? nguy猲 li謚 v祇 theo hng d蒼, c? th? ch鋘 b? 1 trong 3 nguy猲 li謚 ch輓h v祇, sau  ch鋘 than hay c駃  n蕌.");
end;

function detail_4_ex()
	Talk(1,"OnUse","<color=green>Hng d蒼<color>: Ch? ?: <enter>1)N誹 ch鋘 than g? th? nhi謙  ban u l? 600 , ch鋘 c駃 th? nhi謙  ban u l? 300 . <enter>2)Nhi謙  l? s? gi秏 kh玭g ng鮪g gi秏 xu鑞g. <enter>3)B蕋 c? l骳 n祇 c騨g c? th? th猰 nhi猲 li謚 v祇 l? nh璶g nhi謙  vt qu? 900  b竛h s? b? ch竬. <enter>4 Nhi謙  trong l? nng kh玭g th? bi誸 頲 n猲 sau khi b総 u nng b竛h 3 ph髏 s? c? 1 l莕 畂 nhi謙  hi謓 t筰, n誹 qu? 3 ph髏 sau s? kh玭g th? 畂 nhi謙 . <enter><color=yellow>3, l蕐 b竛h<color><enter>1) Th阨 gian nng b竛h l? 5 ph髏. 5 ph髏 sau nh蕁 chu閠 ph秈 v祇 l? nng b竛h  l蕐 b竛h. <enter>2) Sau khi nhi謙  l? nng b竛h c遪 0  kh玭g th? ti誴 t鬰 th猰 nhi猲 li謚 v祇.");
end;

function detail_5()
	Talk(2,"OnUse","<color=green>Ni猲 s?<color>: M? b秓 h閜 c? th? nh薾 頲 th? k? ni謒 JX2 tr遪 3 n╩\n  10 th? k? ni謒 i 頲 1 B錸g Lai ti猲 l閈n  20 th? k? ni謒 i 頲 ph莕 thng 甶觤 kinh nghi謒\n  40 th? k? ni謒 i 頲 ph莕 thng 甶觤 kinh nghi謒\n  100 k? ni謒 c? th? i 1 H閜 Ng﹏ B礽 Vinh D鵟n  500 th? k? ni謒 i 1 Ch譨 Kh鉧 B筩 Vinh D?","<color=green>Ni猲 s?<color>:\n1000 th? k? ni謒 i 1 H閜 Kim B礽 Vinh D鵟n2000 th? k? ni謒 i trang s鴆 Huy Ho祅g Chi Th駓\n3000 th? k? ni謒 i trang s鴆 Vinh D鵟n6000 th? k? ni謒 i 1 trong 3 trang b? Ho祅g д.");
end;

function detail_6()
	Talk(1,"OnUse","<color=green>Ni猲 s?<color>:\nTrong th阨 gian ho箃 ng, m鏸 ng祔 n g苝 V? l﹎ truy襫 nh﹏  nh薾 thng c馻 V? l﹎ minh ch?, ph莕 thng n祔 s? thay i t飝 theo v薾 may c馻 b筺. Mu鑞 bi誸 v薾 may h穣 n t譵 Th? Ti觰 Nha. N誹 l? th阨 gian c? th? mua <color=yellow>Danh s竎h ngi ch琲 c?<color> ? Ng? C竎  nh薾 b? sung.");
end;
