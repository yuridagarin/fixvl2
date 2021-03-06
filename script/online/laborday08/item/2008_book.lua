--脚本名称：五一活动指南脚本
--脚本功能：五一活动指南对话脚本
--策划人：刘天
--代码开发人：村长
--代码开发时间：2007-04-20
--代码修改记录：2008-04-14 by 墨仙

IS_SHOUFEI = false --判断是收费还是免费
--****************************对话主函数************************
function OnUse()
	Say("<color=green>Hng d蒼<color>: L筰 n ho箃 ng 1-5, cu閏 thi tranh b? 1-5 l筰 頲 khai m筩, b筺 chu萵 b? ch璦?",
		6,
		"Ho箃 ng 1-5 bao g錷 n閕 dung n祇/context",
		"Nh薾 b礽 M箃 chc?/get",
		"B礽 M箃 chc c? th? i ph莕 thng /prize",
		"Ng? C竎 c? b竛 nh鱪g g??/buy",
		"T蕁 c玭g l韓 nh蕋 c馻 v? kh? Thi猲 мa Huy襫 Ho祅g/xuanhuang",
		"сng hng d蒼/nothing"
		)
end

function nothing()
	
end

function context()
	if IS_SHOUFEI == true then
		Say("<color=green>Hng d蒼<color>: Ho箃 ng 1-5 c? 2 n閕 dung\n  Th? 1 <color=yellow>M鮪g 1-5<color>, nh﹏ i 甶觤 kinh nghi謒. Trong th阨 gian ho箃 ng, t? <color=yellow>12:00-23:00<color> n g苝 B筩h Hoa s? gi?  nh薾 4 gi? nh﹏ i 甶觤 kinh nghi謒.\nTh? 2 <color=yellow>Cu閏 thi Th莕 b礽 tranh b?<color>, m鋓 ngi s? nh薾 頲 c竎 qu﹏ b礽 M箃 chc, gh衟 n? th祅h c竎 hoa kh竎 nhau  nh薾 c竎 ph莕 thng c bi謙.",1,"V? trang trc/OnUse")
	else
		Say("<color=green>Hng d蒼<color>: Ho箃 ng 1-5 c? 2 n閕 dung\n  Th? 1 <color=yellow>M鮪g 1-5<color> m鋓 ngi 頲 nh﹏ i 甶觤 kinh nghi謒. Trong th阨 gian ho箃 ng, t? <color=yellow>12:00-23:00<color> m鋓 ngi n g苝 B竎h Hoa s? gi?  nh薾 4 gi? nh﹏ i 甶觤 kinh nghi謒 v? nh﹏ i 甶觤 c鑞g hi課 s? m玭 trong ng祔 h玬 nay (kh玭g bao g錷 i s? ki謓 s? m玭).\n  Th? 2 <color=yellow>Cu閏 thi Th莕 b礽 tranh b?<color>, m鋓 ngi nh薾 頲 c竎 qu﹏ b礽 M箃 chc, gh衟 ch髇g th祅h hoa v╪ kh竎 nhau  i c竎 ph莕 thng c bi謙.",1,"V? trang trc/OnUse")
	end
end

function get()
	if IS_SHOUFEI == true then
		Say("<color=green>Hng d蒼<color>: Ho箃 ng 1-5, c竎 b筺 c? th? nh薾 頲 c竎 qu﹏ b礽 M箃 chc sau\n  <color=yellow>B筩h C﹗ Ho祅<color>: Khi s? d鬾g B筩h C﹗ Ho祅 treo m竬 c? t? l? r蕋 th蕄 nh薾 頲 M箃 chc\n  <color=yellow>T祅g Ki誱 s琻 trang<color>: Trong b秓 rng c馻 2 v? T鎛g qu秐, Чi ti觰 th?, Trang ch? v? Trng l穙 c? s? qu﹏ b礽 M箃 chc nh蕋 nh  gi髉 c竎 thi誹 hi謕 vt 秈 th祅h c玭g, n誹 nh b筰 5 v? n祔 c? th? nh薾 頲 t鎛g c閚g 14 qu﹏ b礽 M箃 chc, ch? ?, m鏸 boss m鏸 ng祔 ch? c? th? r琲 <color=red>1<color> l莕\n  ",1,"Trang k?/get_1")
	else
		Say("<color=green>Hng d蒼<color>: Ho箃 ng 1-5, c竎 b筺 c? th? nh薾 頲 c竎 qu﹏ b礽 M箃 chc sau\n  <color=yellow>B筩h C﹗ Ho祅<color> treo m竬: Khi s? d鬾g B筩h C﹗ Ho祅 treo m竬 c? t? l? r蕋 th蕄 nh薾 頲 M箃 chc, ch? ? B筩h C﹗ Ho祅 c祅g t鑤 t? l? nh薾 頲 qu﹏ b礽 c祅g cao\n  <color=yellow>T祅g Ki誱 s琻 trang<color>: Trong b秓 rng c馻 2 v? T鎛g qu秐, Чi ti觰 th?, Trang ch? v? Trng l穙 c? s? qu﹏ b礽 M箃 chc nh蕋 nh  gi髉 c竎 thi誹 hi謕 vt 秈 th祅h c玭g, n誹 nh b筰 5 v? n祔 c? th? nh薾 頲 t鎛g c閚g 14 qu﹏ b礽 M箃 chc, ch? ?, m鏸 boss m鏸 ng祔 ch? c? th? r琲 <color=red>1<color> l莕\n  ",1,"Trang k?/get_1")
	end
end

function get_1()
	if IS_SHOUFEI == true then
		Say("  <color=yellow>Th竔 H? Huy詎 C秐h<color>: Khi vt qua 8 秈 Th竔 H? c? th? nh薾 頲 5 qu﹏ b礽 M箃 chc, m鏸 ng祔 ch? c? th? nh薾 1 l莕\n  <color=yellow>Чi h閕 t? v?<color>: Tham gia Thi猲 h?  nh蕋 v? cu閏 thi T﹏ T?, sau m鏸 tr薾 so t礽 c? th? nh薾 頲 <color=red>1<color> qu﹏ b礽 M箃 chc, m鏸 ng祔 t鑙 產 <color=red>15<color> qu﹏ b礽. Ch? ?, h遖 kh玭g nh薾 頲\n  T蕋 c? M箃 chc nh薾 頲 u t? ng b? v祇 trong b秓 rng, b秓 rng c? th? nh薾 t筰 S? gi? ho箃 ng, ch? ? kh玭g 甧m b秓 rng b猲 m譶h qu﹏ b礽 v蒼 t? ng 頲 t v祇 trong b秓 rng, ch? c莕 l蕐 ra ho芻 nh薾 l筰 b秓 rng c? th? th蕐 頲 s? qu﹏ b礽 c馻 m譶h.",1,"tr? l筰/OnUse")
	else
		Say("  <color=yellow>Th竔 H? Huy詎 C秐h<color>: Khi vt qua 8 秈 Th竔 H? c? th? nh薾 頲 5 qu﹏ b礽 M箃 chc, m鏸 ng祔 ch? c? th? nh薾 1 l莕\n  <color=yellow>Чi h閕 t? v?<color>: Tham gia Thi猲 h?  nh蕋 v? cu閏 thi T﹏ T?, sau m鏸 tr薾 so t礽 c? th? nh薾 頲 <color=red>1<color> qu﹏ b礽 M箃 chc, m鏸 ng祔 t鑙 產 <color=red>15<color> qu﹏ b礽. Ch? ?, h遖 kh玭g nh薾 頲\n  T蕋 c? M箃 chc nh薾 頲 u t? ng b? v祇 trong b秓 rng, b秓 rng c? th? nh薾 t筰 S? gi? ho箃 ng, ch? ? kh玭g 甧m b秓 rng b猲 m譶h qu﹏ b礽 v蒼 t? ng 頲 t v祇 trong b秓 rng, ch? c莕 l蕐 ra ho芻 nh薾 l筰 b秓 rng c? th? th蕐 頲 s? qu﹏ b礽 c馻 m譶h.",1,"tr? l筰/OnUse")
	end
end

function prize()
	local tTemp = {"Кn Trng/prize_danzhang",
		"B譶h H?/prize_pihu",
		"Thanh Nh蕋 S綾 (уng)/prize_qingyise_tong",
		"Thanh Nh蕋 S綾 (襲)/prize_qingyise_tiao",
		"Thanh Nh蕋 S綾 (V筺)/prize_qingyise_wan",
		"Чi T? H?/prize_dasixi",
		"Th莕 b礽/prize_paishen",
		"Ta mu鑞 xem n閕 dung kh竎/goback_to_main"
		}
		Say("<color=green>Hng d蒼<color>: C╪ c? lo筰 b礽 b筺 nh c? th? nh薾 頲 c竎 lo筰 ph莕 thng kh竎 nhau. Sau y l? c竎 lo筰 b礽, nh蕁 v祇  xem thuy誸 minh",getn(tTemp),tTemp)
end

function goback_to_main()
	OnUse()
end

function goback_to_prize()
	prize()
end

function prize_danzhang()
	local tTemp = {"V? trang trc/goback_to_prize","R阨 kh醝/nothing"}
	Say("<color=green>Кn Trng<color>:\nNh蕁 ph秈 v祇 1 qu﹏ b礽 b蕋 k? l? c? th? nh薾, s? l莕 nh薾 t鑙 產 l? <color=red>1000<color>\n  Cho ng c蕄 b譶h phng*10 甶觤 kinh nghi謒, c? th? nh薾 頲 1 vi猲 Linh th筩h c蕄 1-7, t v祇 T? Linh nh. Ngi ch琲 c蕄 99 c? t? l? 100% nh薾 頲 1 vi猲 Linh th筩h c蕄 1-7, t v祇 T? Linh nh, t? l? gi鑞g t骾 b秓 th筩h.",getn(tTemp),tTemp)
end

function prize_pihu()
	local tTemp = {"V? trang trc/goback_to_prize","R阨 kh醝/nothing"}
	Say("<color=green>B譶h H?<color>:\n  G苝 S? gi? ho箃 ng nh薾 ng蓇 nhi猲 14 qu﹏ b礽 M箃 chc, s? l莕 nh薾 t鑙 產 l? <color=red>42<color> l莕\n Cho b譶h phng ng c蕄 *140 甶觤 kinh nghi謒, ng蓇 nhi猲 nh薾 頲 3 vi猲 Linh th筩h c蕄 1-7, t v祇 trong T? Linh nh. Ngi ch琲 c蕄 99 c? t? l? 100% nh薾 頲 15 vi猲 Linh th筩h c蕄 1-7, t v祇 trong T? Linh nh, t? l? c飊g v韎 t骾 b秓 th筩h.",getn(tTemp),tTemp)
end

function prize_qingyise_tong()
	local tTemp = {"V? trang trc/goback_to_prize","R阨 kh醝/nothing"}
	Say("<color=green>Thanh Nh蕋 S綾 (уng)<color>:\nT蕋 c? qu﹏ b礽 u c飊g 1 hoa v╪, 14 qu﹏ b礽 li猲 ti誴 t? 1-9, nh薾 ? ch? S? gi? ho箃 ng, s? l莕 nh薾 t鑙 產 l? <color=red>21<color> l莕\n  5 Nh蕋 Thi觤 Y猽 Ho祅g, 1 Linh th筩h c蕄 5, c? th? nh薾 頲 t骾 b? ki誴 s? m玭 l璾 ph竔 hi謓 t筰 v? Thi猲 мa Huy襫 Ho祅g Trang",getn(tTemp),tTemp)
end

function prize_qingyise_tiao()
	local tTemp = {"V? trang trc/goback_to_prize","R阨 kh醝/nothing"}
	Say("<color=green>Thanh Nh蕋 S綾 (襲)<color>:\n  T蕋 c? qu﹏ b礽 u c飊g 1 hoa v╪, 14 qu﹏ b礽 li猲 ti誴 t? 1-9, nh薾 ? ch? S? gi? ho箃 ng, s? l莕 nh薾 t鑙 產 l? <color=red>14<color> l莕\n  10 Nh蕋 Thi觤 Y猽 Ho祅g, 2 Linh th筩h c蕄 5, c? th? nh薾 Ng? H祅h m藅 t辌h, Thi猲 мa Huy襫 Ho祅g Trang, Thi猲 мa Huy襫 Ho祅g Gi竝",getn(tTemp),tTemp)
end

function prize_qingyise_wan()
	local tTemp = {"V? trang trc/goback_to_prize","R阨 kh醝/nothing"}
	Say("<color=green>Thanh Nh蕋 S綾 (V筺)<color>: \n  T蕋 c? qu﹏ b礽 u c飊g 1 hoa v╪, 14 qu﹏ b礽 li猲 ti誴 t? 1-9, nh薾 ? ch? S? gi? ho箃 ng, s? l莕 nh薾 t鑙 產 l? <color=red>7<color> l莕\n  5 Tam Di謚 Long Hi, 1 Linh th筩h c蕄 6, c? th? nh薾 頲 b? k輕 L╪g Ba Vi B?, Thi猲 мa Huy襫 Ho祅g Trang, Thi猲 мa Huy襫 Ho祅g Gi竝, Thi猲 мa Huy襫 Ho祅g Kh玦",getn(tTemp),tTemp)
end

function prize_dasixi()
	local tTemp = {"V? trang trc/goback_to_prize","R阨 kh醝/nothing"}
	Say("<color=green>Чi T? H?<color>:\n  Йng Phong, Nam Phong, T﹜ Phong, B綾 phong m鏸 lo筰 3 con, ch鋘 ng蓇 nhi猲 1 c苝 trong Trung Ph竧 B筩h t鎛g c閚g 14 con, nh薾 ? ch? S? gi? ho箃 ng, s? l莕 nh薾 t鑙 產 l? <color=red>2<color> l莕\n  15 Tam Di謚 Long Hi, 1 Linh th筩h c蕄, c? th? nh薾 頲 v? kh? Thi猲 мa Huy襫 Ho祅g, Thi猲 мa Huy襫 Ho祅g Trang, Thi猲 мa Huy襫 Ho祅g Gi竝, Thi猲 мa Huy襫 Ho祅g Kh玦.",getn(tTemp),tTemp)
end

function prize_paishen()
	local tTemp = {"V? trang trc/goback_to_prize","R阨 kh醝/nothing"}
	Say("<color=green>Th莕 b礽<color>:\n  Ng蓇 nhi猲 777 con b礽, nh薾 ? S? gi? ho箃 ng, kh玭g gi韎 h筺 s? l莕 nh薾\n  2 Linh th筩h c蕄 7, 1 Thanh уng жnh c蕄 1",getn(tTemp),tTemp)
end

function buy()
	Say("<color=green>Hng d蒼<color>: B筺 mua 1 qu﹏ b礽 M箃 chc trong Ng? C竎, nguy猲 b? c? 14 con, 1 уng, 1 襲, 1 T?, sau y l? thuy誸 minh c竎 v藅 ph萴 n祔.\n  <color=yellow>1 qu﹏ b礽 M箃 chc<color>, ng蓇 nhi猲 nh薾 頲 1 qu﹏ b礽 M箃 chc\n  <color=yellow>14 qu﹏ b礽 M箃 chc<color>, ng蓇 nhi猲 nh薾 頲 14 qu﹏ b礽\n  <color=yellow>1 уng<color>, ch? qu﹏ b礽 nh薾 頲 c? hoa v╪ l? уng\n",1,"Trang k?/buy_1")
end

function buy_1()
	Say("  <color=yellow>1 襲<color> ch? nh qu﹏ b礽 M箃 chc nh薾 頲 c? hoa v╪ l? 襲\n  <color=yellow>1 V筺<color> ch? qu﹏ b礽 M箃 chc nh薾 頲 c? hoa v╪ l? V筺\n  <color=yellow>1 T?<color> ch? nh nh薾 頲 1 qu﹏ b礽 ng蓇 nhi猲 trong 7 qu﹏ b礽 Йng Nam T﹜ B綾 Trung Ph竧 B筩h",1,"tr? l筰/OnUse")
end

function xuanhuang()
	Say("<color=green>Hng d蒼<color>: Sau y l? c竎 lo筰 v? kh? Thi猲 мa Huy襫 Ho祅g, m阨 c竎 v? i hi謕 xem qua\n  Thi猲 мa Huy襫 Ho祅g Th?, 畂秐 binh kh? h? th?, th輈h h頿 Thi誹 L﹎ v? t╪g, C竔 Bang t辬h y, c玭g k輈h ngo筰 c玭g 314-529, c玭g k輈h n閕 c玭g 273-454\n  Thi猲 мa Huy襫 Ho祅g Ki誱, 畂秐 ki誱, th輈h h頿 Nga My Ph藅 Gia, V? ng o gia, c玭g k輈h ngo筰 c玭g 184-357, c玭g k輈h n閕 c玭g 343-594\n  Thi猲 мa Huy襫 Ho祅g C玭, trng c玭, th輈h h頿 Thi誹 L﹎ t鬰 gia, C竔 Bang ? y, c玭g k輈h ngo筰 c玭g 251-416\n  Thi猲 мa Huy襫 Ho祅g Kh?, K? M玭 竚 kh?, th輈h h頿 Л阯g M玭, c玭g k輈h ngo筰 c玭g 194-307\n  Thi猲 мa Huy襫 Ho祅g o, 畂秐 產o, th輈h h頿 Thi誹 L﹎ t鬰 gia, c玭g k輈h ngo筰 c玭g 306-510\n",1,"Trang k?/xuanhuang_1")
end

function xuanhuang_1()
	Say("  Thi猲 мa Huy襫 Ho祅g C莔, K? M玭 C莔, th輈h h頿 Nga My t鬰 gia, c玭g k輈h ngo筰 c玭g 238-384, c玭g k輈h n閕 c玭g 275-446\n  Thi猲 мa Huy襫 Ho祅g B髏, K? M玭 B髏, th輈h h頿 V? ng t鬰 gia, c玭g k輈h ngo筰 c玭g 21-7-343\n  Thi猲 мa Huy襫 Ho祅g Trng, Thi襫 Trng, th輈h h頿 Thi誹 L﹎ thi襫 t╪g, c玭g k輈h ngo筰 c玭g 207-403, c玭g k輈h n閕 c玭g 316-515\n  Thi猲 мa Huy襫 Ho祅g Thng, Trng Thng, th輈h h頿 Dng M玭 thng k?, c玭g k輈h ngo筰 c玭g 182-406\n  Thi猲 мa Huy襫 Ho祅g Cung, K? M玭 Cung, th輈h h頿 Dng M玭 cung k?, c玭g k輈h ngo筰 c玭g 226-347\n  Thi猲 мa Huy襫 Ho祅g Tr秓, K? M玭 Tr秓, th輈h h頿 Ng? чc c? s?, c玭g k輈h ngo筰 c玭g 232-378, c玭g k輈h n閕 c玭g 263-454\n  Thi猲 мa Huy襫 Ho祅g Nh蒼, th輈h h頿 Ng? чc t? hi謕, c玭g k輈h ngo筰 c玭g 232-378, c玭g k輈h n閕 c玭g 314-529",1,"tr? l筰/OnUse")
end