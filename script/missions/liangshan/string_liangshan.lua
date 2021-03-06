--脚本功能：梁山关卡相关字符串的集合
--功能开发：VV
--功能移植：村长
--移植时间：2011-2-18
--修改记录：

N_JOIN_ENERGY_NEED = 20
N_JOIN_TIANJIAOLING_NEED = 99999999
N_CALL_BOSS_TIANJIAOLING_NEED = 99999999
T_TIANJIAOLING = {2, 97, 236, "Thi猲 Ki猽 L謓h"}

--npc模板名、显示名信息
NpcName={
	[1] = {"Th莕 H祅h Th竔 B秓 ыi T玭g","Th莕 H祅h Th竔 B秓 ыi T玭g"},
	--梁山BOSS-比较多-隔一下
	[2] = {"C藀 Th阨 V? T鑞g Giang","C藀 Th阨 V? T鑞g Giang"},
	[3] = {"Ti猽  H莡 L? Phng","Ti猽  H莡 L? Phng"},
	[4] = {"H祅 Nh﹏ Qu? Qu竎h Th辬h","H祅 Nh﹏ Qu? Qu竎h Th辬h"},
	[5] = {"Tri  Tinh Ng? D鬾g","Tri  Tinh Ng? D鬾g"},
	[6] = {"Mao Уu Tinh Kh鎛g Minh","Mao Уu Tinh Kh鎛g Minh"},
	[7] = {"чc H醓 TInh Kh鎛g Lng","чc H醓 TInh Kh鎛g Lng"},
	[8] = {"C鰑 V╪ Long S? Ti課","C鰑 V╪ Long S? Ti課"},
	[9] = {"X萿 Qu﹏ M? Tuy猲 T竛","X萿 Qu﹏ M? Tuy猲 T竛"},
	[10] = {"T躰h M閏 Cang X輈h T? V╪","T躰h M閏 Cang X輈h T? V╪"},
	[11] = {"Ti觰 Tuy襫 Phong S礽 Ti課","Ti觰 Tuy襫 Phong S礽 Ti課"},
	[12] = {"B謓h Чi Tr飊g B輈h V躰h","B謓h Чi Tr飊g B輈h V躰h"},
	[13] = {"Kim Nh穘 B璾 Thi ","Kim Nh穘 B璾 Thi "},
	[14] = {"Чi o Quan Th緉g","Чi o Quan Th緉g"},
	[15] = {"Th竛h Th駓 Tng n ёnh Qu?","Th竛h Th駓 Tng n ёnh Qu?"},
	[16] = {"Th莕 H醓 Tng Ng魕 мnh Qu鑓","Th莕 H醓 Tng Ng魕 мnh Qu鑓"},
	[17] = {"Nh藀 V﹏ Long C玭g T玭 Th緉g","Nh藀 V﹏ Long C玭g T玭 Th緉g"},
	[18] = {"Th莕 C? Qu﹏ S? Chu V?","Th莕 C? Qu﹏ S? Chu V?"},
	[19] = {"B謓h 髖 Tr? T玭 L藀","B謓h 髖 Tr? T玭 L藀"},
	[20] = {"B竜 T? u L﹎ Xung","B竜 T? u L﹎ Xung"},
	[21] = {"Ma V﹏ Kim S?  B籲g","Ma V﹏ Kim S?  B籲g"},
	[22] = {"H醓 Nh穘 Toan Ngh? Tr辬h Phi","H醓 Nh穘 Toan Ngh? Tr辬h Phi"},
	[23] = {"Hoa H遖 Thng L? Tr? Th﹎","Hoa H遖 Thng L? Tr? Th﹎"},
	[24] = {"Lng u X? Gi秈 Tr﹏","Lng u X? Gi秈 Tr﹏"},
	[25] = {"Song V? Khi誸 Gi秈 B秓","Song V? Khi誸 Gi秈 B秓"},
	[26] = {"H祅h Gi? V? T遪g","H祅h Gi? V? T遪g"},
	[27] = {"Lo筺 Th? Ma Vng Phi猲 an","Lo筺 Th? Ma Vng Phi猲 an"},
	[28] = {"Tang M玭 Th莕 Bao H骳","Tang M玭 Th莕 Bao H骳"},
	[29] = {"T髖 B竛 Ti猲 Phong Nh蕋 Ph祄","T髖 B竛 Ti猲 Phong Nh蕋 Ph祄"},
	[30] = {"L鬰 Nh﹏ Gi?","L鬰 Nh﹏ Gi?"},
	[31] = {"L鬰 Nh﹏ Ngh躠","L鬰 Nh﹏ Ngh躠"},
	[32] = {"B謓h Quan S竎 Dng H飊g","B謓h Quan S竎 Dng H飊g"},
	[33] = {"Ti觰 Gi? Lan M鬰 Xu﹏","Ti觰 Gi? Lan M鬰 Xu﹏"},
	[34] = {"Ф H? Tng L? Trung","Ф H? Tng L? Trung"},
	[35] = {"Phanh M謓h Tam Lang Th筩h T?","Phanh M謓h Tam Lang Th筩h T?"},
	[36] = {"чc Gi竎 Long Tr﹗ Nhu薾","чc Gi竎 Long Tr﹗ Nhu薾"},
	[37] = {"Hoa H筺g H? Cung Vng","Hoa H筺g H? Cung Vng"},
	[38] = {"Nh蕋 Trng Thanh H? Tam Nng","Nh蕋 Trng Thanh H? Tam Nng"},
	[39] = {"N魕 Cc H? Vng Anh","N魕 Cc H? Vng Anh"},
	[40] = {"Th莕 Y An Чo To祅","Th莕 Y An Чo To祅"},
	[41] = {"Song Thng Tng фng B譶h","Song Thng Tng фng B譶h"},
	[42] = {"Khi猽 Gi秐 H? Tr莕 Чt","Khi猽 Gi秐 H? Tr莕 Чt"},
	[43] = {"B竎h Hoa X? Dng Xu﹏","B竎h Hoa X? Dng Xu﹏"},
	[44] = {"Thanh Di謓 Th? Dng Tr?","Thanh Di謓 Th? Dng Tr?"},
	[45] = {"B竧 T? Na Tra H筺g Xung","B竧 T? Na Tra H筺g Xung"},
	[46] = {"Phi Thi猲 Чi Th竛h L? C鎛","Phi Thi猲 Чi Th竛h L? C鎛"},
	[47] = {"T輈h L辌h H醓 T莕 Minh","T輈h L辌h H醓 T莕 Minh"},
	[48] = {"C萴 B竜 T? Dng L﹎","C萴 B竜 T? Dng L﹎"},
	[49] = {"Ti觰 B? Vng Chu Th玭g","Ti觰 B? Vng Chu Th玭g"},
	[50] = {"Song Ti猲 H? Di猲 Chc","Song Ti猲 H? Di猲 Chc"},
	[51] = {"B竎h Th緉g Tng H祅 Thao","B竎h Th緉g Tng H祅 Thao"},
	[52] = {"Thi猲 M鬰 Tng B祅h Nh?","Thi猲 M鬰 Tng B祅h Nh?"},
	[53] = {"H綾 To祅 Phong L? Qu?","H綾 To祅 Phong L? Qu?"},
	[54] = {"M筩 Tr? Thi猲 х Thi猲","M筩 Tr? Thi猲 х Thi猲"},
	[55] = {"Xu蕋 L﹎ Long Tr﹗ Uy猲","Xu蕋 L﹎ Long Tr﹗ Uy猲"},
	--过关宝箱
	[56] = {"Rng ti襫","Lng S琻 b秓 rng"},
	[57] = {"IBbaoxiang","Rng H秓 H竛"},
	[58] = {"Rng ti襫","T? Ngh躠 B秓 Rng"},
	--Fish Npc信息
	[59] = {"Bang ch髇g Thanh Long Л阯g","Bang ch髇g Thanh Long Л阯g"},
	[60] = {"Bang ch髇g B筩h H? Л阯g","Bang ch髇g B筩h H? Л阯g"},
	[61] = {"Bang ch髇g Chu Tc Л阯g","Bang ch髇g Chu Tc Л阯g"},
	[62] = {"Bang ch髇g Huy襫 V? Л阯g","Bang ch髇g Huy襫 V? Л阯g"},
	--第一关NPC
	[63] = {"Rng c? th? m?","Rng v祅g"},
	[64] = {"Rng c? th? m?","Rng b筩"},
	[65] = {"Rng c? th? m?","Rng ng"},
	[66] = {"Rng c? th? m?","Rng thi誸"},
	[67] = {"Trng Thanh vn rau","Trng Thanh vn rau"},
	[68] = {"M蓇 D? Xoa T玭 Nh? Nng","M蓇 D? Xoa T玭 Nh? Nng"},
	--第二关NPC
	[69] = {"Bang ch髇g Thanh Long Л阯g","Bang ch髇g Thanh Long Л阯g"},
	[70] = {"Bang ch髇g B筩h H? Л阯g","Bang ch髇g B筩h H? Л阯g"},
	[71] = {"Bang ch髇g Chu Tc Л阯g","Bang ch髇g Chu Tc Л阯g"},
	[72] = {"Bang ch髇g Huy襫 V? Л阯g","Bang ch髇g Huy襫 V? Л阯g"},
	[73] = {"H? Vng","H? Vng"},
	[74] = {"Ti猲 N?","Ti猲 N?"},
	[75] = {"Thi Vng","Thi Vng"},
	[76] = {"Th筩h Ma","Th筩h Ma"},
	[77] = {"L? Tu莕 Ngh躠","L? Tu莕 Ngh躠"},
	--第三关NPC
	[78] = {"Ti觰 k?","G?"},
	[79] = {"Ti觰 竝","V辴"},
	[80] = {"Ti觰 nga","Ng鏽g"},
	[81] = {"Ti觰 dng","D?"},
	[82] = {"V? V? Ti詎 Trng Thanh", "V? V? Ti詎 Trng Thanh"},
	[83] = {"Ti觰 L? Qu秐g Hoa VInh", "Ti觰 L? Qu秐g Hoa VInh",},
	--第四关NPC
	[84] = {"Bang ch髇g Thanh Long Л阯g","Bang ch髇g Thanh Long Л阯g"},
	[85] = {"Bang ch髇g B筩h H? Л阯g","Bang ch髇g B筩h H? Л阯g"},
	[86] = {"Bang ch髇g Chu Tc Л阯g","Bang ch髇g Chu Tc Л阯g"},
	[87] = {"Bang ch髇g Huy襫 V? Л阯g","Bang ch髇g Huy襫 V? Л阯g"},
	[88] = {"Kim Ti襫 B竜 T? Thang Long","Kim Ti襫 B竜 T? Thang Long"},
	[89] = {"C玭g t綾 qu﹏ l玦","C玭g t綾 qu﹏ l玦"},
	[90] = {"C玭g t綾 qu﹏ l玦","C玭g t綾 di謒 dng"},
	[91] = {"C玭g t綾 qu﹏ l玦","C玭g t綾 l穘h sng"},
	[92] = {"C玭g t綾 qu﹏ l玦","C玭g t綾 t藅 phong"},
	[93] = {"Qu﹏ l玦","Qu﹏ l玦"},
	[94] = {"Di謒 dng","Di謒 dng"},
	[95] = {"L穘h sng","L穘h sng"},
	[96] = {"T藅 phong","T藅 phong"},
	--第五关NPC（无）
	--隐藏第一关NPC
	[97] = {"N筽 na","N筽 na"},
	--隐藏第二关NPC
	[98] = {"Dng Th玭g","Dng Th玭g",},
	[99] = {"Ng? Nh﹏ мch","Ng? Nh﹏ мch",},
	[100] = {"Vng Tr? Ti猽","Vng Tr? Ti猽"},
	[101] = {"L? T? Vy","L? T? Vy"},
}
--关卡名称
LSStageName = {
	[1] = "Th駓 B竎h ёnh",
	[2] = "Kho竔 Ho箃 L﹎",
	[3] = "Kho竔 M? Чo",
	[4] = "H綾 Phong Tr筰",
	[5] = "H綾 Phong Tr筰",
	[6] = "T? Ngh躠 Л阯g",
	[7] = "Gi秈 u o糿 t? t?",
	[8] = "Khi猽 chi課 c馻 hi謕 s?",
}
--任务信息
LSTaskInfo = {
	[1] = {
		[1] = "Khi猽 chi課 s? di詎",
		[2] = "M鏸 ng祔 ho祅 th祅h 1 l莕 nhi謒 v? khi猽 chi課 Lng S琻 Qu莕 H飊g H閕 秈 1-4 (nh b筰 Lng S琻 H秓 H竛 tr猲 H綾 Phong Tr筰), c? th? nh薾 頲 1 <color=yellow>Lng S琻 s? di詎 bao<color>, m? ra c? c? h閕 nh薾 頲 Th? Th﹏ Ph?, th竛h v藅 s? m玭 ho芻 Tu Th﹏ Ho祅",
	},
	[2] = {
		[1] = "Khi猽 chi課 trung d騨g",
		[2] = "M鏸 ng祔 ho祅 th祅h 1 l莕 th玭g quan Lng S琻 Qu莕 H飊g H閕 c? th? nh薾 頲 1 <color=yellow>Lng S琻 trung d騨g bao<color>, m? ra c? c? h閕 nh薾 v祅g ho芻 甶觤 tu luy謓.",
	},
	[3] = {
		[1] = "Khi猽 chi課 畂箃 qu﹏",
		[2] = "M鏸 ng祔 nh b筰 1 l莕 Lng S琻 H秓 H竛 頲 ch? nh (v? d?: T輈h L辌h H醓 T莕 Minh) c? th? nh薾 頲 1 <color=yellow>Lng S琻 畂箃 qu﹏ bao<color>, m? ra c? c? h閕 nh薾 頲 甶觤 kinh nghi謒 ho芻 甶觤 tu luy謓.",
		[3] = "M鏸 ng祔 nh b筰 1 l莕 ?<color=red>%s<color>?, c? th? nh薾 頲 1 <color=yellow>Lng S琻 畂箃 qu﹏ bao<color>, m? ra c? c? h閕 nh薾 頲 甶觤 kinh nghi謒 ho芻 甶觤 tu luy謓",
	},
}
--玩家个人消息
LSMsgToPlayer = {
	[1] = "Kh玭g bi誸 阯g 甶",
	[2] = "ng gi竚 nh thu閏 t輓h v藅 ph萴!",
	[3] = "Kh玭g gian h祅h trang kh玭g , kh玭g th? nh薾 v藅 ph萴",
	[4] = "Nh苩 頲 ",
	[5] = "Kh玭g c遪 v藅 ph萴 trong rng",
	[6] = "T蕋 c? ngi ch琲  b? cu閏",
	[7] = "Nh鱪g ngi ch琲 kh竎  vt qu? th阨 gian, xem nh? b? cu閏",
	[8] = "N衜 ra %d 甶觤",
	[9] = "Ph鉵g",
	[10] = "C莕",
	[11] = "Nh苩 頲 ",
	[12] = "Tham lam",
	[13] = "C竎 h? mang theo %s kh玭g ",
	[14] = "C竎 h?  ho祅 th祅h ?%s?, h穣 t譵 [%s] nh薾 thng.",
	[15] = "C竎 h?  nh薾 頲 %d 甶觤 tu luy謓",
	[16] = "Thu 頲 %d 甶觤 kinh nghi謒",
	[17] = "B筺  i th祅h c玭g %s",
	[18] = "H祅h trang kh玭g  ?, kh玭g th? nh薾 %s.",
	[19] = "H玬 nay c竎 h?  nh b筰 Lng S琻 H秓 H竛 nh薾 頲 ph莕 thng %d %s (gi韎 h筺 m鏸 ng祔 c? th? nh薾 %d)."
}
--队伍消息
LSMsgToTeam = {
	[1] = "Th玭g quan th祅h c玭g!!!",
	[2] = "ng v祇 秈 ti誴 theo",
	[3] = "%s kh玭g th? v祇 Qu莕 Anh H閕 (hi謓 產ng ngh? ng琲)",
	[4] = "%s kh玭g th? v祇 Qu莕 Anh H閕 (kh玭g c飊g th祅h th?)",
	[5] = "%s kh玭g th? v祇 Qu莕 Anh H閕 (ch璦 gia nh藀 m玭 ph竔)",
	[6] = "V祇 c鯽 秈 Lng S琻 Qu莕 Anh H閕 ",
	[7] = "ng i kh雐 ng c鯽 秈, ti課 ",
	[8] = "C鯽 秈 產ng ti課 h祅h, ti課 ",
	[9] = "C鯽 秈 產ng i k誸 th骳, ti課 ",
	[10] = "Х xu蕋 hi謓, khi猽 chi課 產ng b総 u!",
	[11] = "Vt 秈 th蕋 b筰, chu萵 b? r阨 kh醝 c鯽 秈",
	[12] = "Х b? nh b筰.",
	--闯关完成后的提示信息
	[13] = {
		[1] = "Ch骳 m鮪g c竎 v? anh h飊g thu薾 l頸 vt 秈 1, theo 阯g m遪 tr猲 vt qua c莡 s? g苝 頲 L? Tu蕁 Ngh躠, h穣 n t譵 hi觰 n鉯 chuy謓 v韎 anh ta xem.",
		[2] = "Th? luy謓 Kho竔 Ho箃 L﹎  k誸 th骳, d鋍 theo con 阯g ph輆 ng b綾 s? g苝 頲 Vinh H遖 Trng Thanh, i trng c? th? t譵 anh ta th竚 th輓h t譶h h譶h nh? th? n祇.",
		[3] = "Th? luy謓 Kho竔 M? Чo  k誸 th骳, d鋍 theo con 阯g ph輆 t﹜ b綾 s? g苝 頲 Kim Ti襫 B竜 T? Thang Long, i trng c? th? n t譵 anh ta th竚 th輓h t譶h h譶h nh? th? n祇.",
		[4] = "Th? luy謓 H綾 Phong Tr筰  k誸 th骳, d鋍 theo con 阯g ph輆 t﹜ ch輓h l? T? Ngh? Л阯g, ta s? i c竎 ngi tr猲 , chu萵 b? xong h穣 n t譵 ta.",
		[5] = "Th? luy謓 H綾 Phong Tr筰  k誸 th骳, d鋍 theo con 阯g ph輆 t﹜ ch輓h l? T? Ngh? Л阯g, ta s? i c竎 ngi tr猲 , chu萵 b? xong h穣 n t譵 ta.",
		[6] = "C鯽 秈 萵 揋i秈 u o糿 t? t讛  k誸 th骳",
		[7] = "C鯽 秈 萵 揔hi猽 chi課 hi謕 s軘  k誸 th骳",
	},
	--关卡进入时欢迎队伍消息
	[14] = {
		[1] = {
				"Uy觧 T? Th祅h h閕 h? b竜, M閏 Nhi Qu? t? giao long. Lng S琻 B筩 h閕 t? nh鱪 tinh anh trong v? l﹎, ai n蕐 u v? ngh? cao cng, th﹏ mang tuy謙 k?, c竎 v? h秓 h竛 tham gia qu莕 h飊g h閕  chu萵 b? s絥 sang ch璦?",
				"M蓇 D? Xoa T玭 Nh? Nng: th藅 l? xui x蝟, v鑞 nh t譵 nh鉳 ngi qua 阯g  h鑤 m閠 qu?, ai ng陞",
				"Trng Thanh: tuy n鉯 Phong Nh蕋 Ph祄, Vng Tr? Ti猽, L? T? Vy, Dng Th玭g, Ng玭 Nh﹏ мch u non tay xanh l?, ai ng? ch髇g l筰 v? ngh? cao cng nh? th?.",
				"M蓇 D? Xoa T玭 Nh? Nng: h?, m筺h c竔 g?, do l莕 trc l穙 nng ta khinh ch, ch? d飊g 7 ph莕 c玭g l鵦, n猲   b鋘 nh鉩  chi課 th緉g th玦?. Ph輆 trc nh? 產ng c? ng t躰h, con m錳 n r錳, ngay l骳 ta 產ng c莕 t譵 ngi tr髏 gi薾.",
				"Trng Thanh: l穙 nng hay c萵 th莕, ng xem thng nh鱪g ngi n祔.",
		},
		[2] = {
			NpcName[77][2]..": v筺 v藅 thi猲 a u c? linh t輓h, b蕋 k? chim bay tr猲 tr阨 ho芻  c? c﹜ c鑙 u c? linh kh?.",
			NpcName[77][2]..": n誹 nh? nh鱪g v筺 v藅 chi linh n祔 thu閏 v? ch髇g ta, c? th? tr? th祅h v? kh? thi猲 h? v? ch.",
		},
		[3] = {
			NpcName[82][2]..": ai c騨g n鉯 Hoa huynh ti詎 thu藅 h琻 L? Qu秐g, h玬 nay t筰 h? th藅 mu鑞 so t礽 v韎 Hoa huynh m閠 phen.",
			NpcName[83][2]..": Phi Th筩h, ti詎 thu藅 ai u c? th? m筺h ri猲g, anh em hai ta u c莕 ph秈 v? c竔 h? danh  m? tranh ch蕄.",
			NpcName[82][2]..": kh玭g u c騨g 頲, ch? e nh鱪g v? huynh  kh竎 nghe 頲 n鉯 Hoa huynh b蕋 t礽 s? thua, 秐h hng n uy danh c馻 huynh th玦.",
			NpcName[83][2]..": huynh  ch蕄 ? mu鑞 so t礽, th? th? xin Trng huynh ch? gi竜 v藋!",
		},
		[4] = {
			"Lng S琻 bang ch髇g A: y l? c竔 tr? qu? g? y? V藅 n祔 l? qu?.",
			"Lng S琻 bang ch髇g B: b猲 ta c騨g c? 1 c竔, tr猲  c? ghi, H醓匘ng, h醓 dng mang ? g??",
			"Lng S琻 bang ch髇g A:  ngu, y g鋓 l? Di謒 Dng, v? nh? h鋍 th猰 甶. H譶h nh? y l? 1 c玭g t綾.",
			"Lng S琻 bang ch髇g B: c竔 g? to祅 th﹏ gh? l? Kim Ti襫 Bao T? Thang Long nghi猲 c鴘 m鏸 ng祔 ra c竔 n祔 y sao.",
			"Lng S琻 bang ch髇g A: su⺶? nh? ti課g l筰, tr猲 ngi 玭g ta l? vi誸 thng b? b醤g, kh玭g ph秈 b? gh?.",
			"Lng S琻 bang ch髇g B: 馻, ph輆 tr猲 c? c竔 c玭g t綾. M? ra xem c? b秓 b鑙 g?.",
			"Lng S琻 bang ch髇g A: ng, ng ng v祇?",
			"B飉, 揂厰 m閠 ti課g k猽 th秏 thi誸 vang trong H綾 Phong Tr筰?.",
			"Kim Ti襫 Bao T? Thang Long: l? ng鑓, ch璦 c? s? cho ph衟 c馻 ta c? gan t駓 ti謓 m? c玭g t綾.",
		},
	},
	[15] = "Х ti課 v祇 ?%s?",
	[16] = "Х xu蕋 hi謓, khi猽 chi課 產ng b総 u!",
	[17] = "C竎 v? i hi謕 hi謓  s╪ 頲 %d con, %s v? %s c騨g  b総 頲 %d con.",
	[18] = "C竎 h? nh薾 頲 揔h? Ng璶g Th莕 C玭g? chu閠 ph秈 ch鋘 thanh ph輒 t総, nh蕁 ch鋘 揘g璶g Th莕 C玭g? t筰 d穣 k? n╪g v鮝 hi謓 ra, k? n╪g n祔 l藀 t鴆 c? th? s? d鬾g.",
	[19] = "Х b? tr鋘g thng.",
	[20] = "C? quan  頲 k輈h ho箃",
	[21] = "C? quan  kh雐 ng l筰",
	[22] = "揕ng S琻 h秓 h竛 tuy l頸 h筰, nh璶g ch? l? d騨g m穘h h琻 ngi, m璾 k誸 thi誹 s鉻. Ch髇g ta ch? c莕 d飊g 1 chi猽 揗inh tu s筺 o, 竚  tr莕 thng? l? c? th? chi課 th緉g?",
	[23] = "H穣 s? d鬾g %s khi猽 chi課 Lng S琻 H秓 H竛 nhanh ch鉵g nh苩 l蕐 b秓 rng",
	[24] = "Х b? nh b筰.",
	[25] = "Ch骳 m鮪g c竎 v? i hi謕  vt qua t蕋 c? c鯽 秈",
	[26] = "C竎 h?  v祇 c鯽 秈 蕁 ?%s?",
	[27] = {"B骯","K衞","B?"},
	--猜拳结果信息
	[28] = {"Bao","! Thi o糿 t? t? ch韎 ch? Na ta h?, v蒼 c遪 non l緈, v? luy謓 th猰 2 n╩ n鱝 甶.","! C竎 h? qu? l莕 th莕 c?, ti觰 n? xin ph鬰."},
	[29] = {"K誸 th骳 tr薾 u.","Chi課 th緉g!","B筰 tr薾!"},
	--隐藏关卡第二关
	[30] = "%s  b? tr鋘g thng.",
	
	[31] = "Nh薾 頲 tr筺g th竔 [%s], %d gi﹜%s"
}
--时间进度条
LSTimeGuageString = {
	[1] = "Th阨 gian s╪ b総",
	[2] = "C? quan l藀 l筰",
	[3] = "Th阨 gian h錳 sinh",
	[4] = "Th阨 gian v? ch",
	[5] = "Th琲 gian o糿 t? t?",
	[6] = "Th阨 gian sinh t錸",
}
--闯关条件对话展开
LSLoginQuanli = {
	"C莕 t? i",
	"輙 nh蕋 %d",
	"C蕄  u #%d",
	"уng th阨",
	"Do i trng <color>ng k?, m韎 c? th? tham gia Lng S琻 Qu莕 H飊g H閕. (Ch?  l? 甶襲 ki謓 i ng? ch璦 t 頲)",
}
--talk对话
LSSysTalk = {
	[1] = "H穣 nh苩 rng ph莕 thng trc khi m? c鯽 秈 ti誴 theo",
	[2] = "C竎 v? anh h飊g Lng S琻  xu蕋 chi課 r錳, h穣 quay l筰 sau",
	[3] = "Ngi ch璦 gia nh藀 m玭 ph竔 kh玭g th? nh薾 thng",
	[4] = "C竎 h? m筺g theo kh玭g  %s",
	[5] = {
		"Gia nh藀 giang h? trc sau gi c騨g ph秈 tr? !",
		"Li tr阨 l錸g l閚g, th璦 m? kh玭g l鋞",
		"Qu﹏ t? 竔 t礽 畂箃 chi h鱱 o",
		" h祅h b蕋 ngh躠 t蕋 t? b筰!",
		"ng v? ti觰 竎 m? l祄, ng v? ti觰 thi謓 m? b?",
	},
	[6] = "Tr筺g th竔 Boss: (M祏  =  ng , m祏 xanh = ch璦 ng )",
	[7] = ": vui l遪g i trong ch鑓 l竧...",
	[8] = "<color=green>th玭g b竜<color>: чi ng? c馻 c竎 h?  ph竧 ng khi猽 chi課 n %s v? %s <color=green>n誹 trong v遪g 3 ph髏 ti猽 di謙 頲 頲 v藅 s╪ b総 nhi襲 h琻 2 ngi h? b総 頲, th? i ng? c馻 c竎 h? s? gi祅h 頲 chi課 th緉g<color>. H?  b総 u ti課 h祅h s╪ b総 r錳. Cu閏 s╪ b総 u.",
	[9] = "Trong tr薾 chi課, t蕋 c? ngi ch琲 tham gia u nh薾 頲 tr筺g th竔 揟hi猲 Th莕 H? Ph祄?, tr筺g th竔 duy tr? n khi tr薾 chi課 k誸 th骳. M鏸 c竎h 30 gi﹜ h錳 sinh t蕋 c? ngi ch琲 trong khu v鵦, h錳 ph鬰 t蕋 c? tr筺g th竔, ng th阨 v? ch trong 10 gi﹜. Sau khi ti猽 di謙 t蕋 c? c竎 boss ngi ch琲 c? th? ti課 v祇 c鯽 秈 ti誴 theo (T? Ngh躠 Л阯g). \n hi謚 qu?<color=yellow>?%s?<color>: \n<color=green>%s<color>",
	[10] = "C竎 h? kh玭g mang theo [%s], kh玭g th? ti誴 t鬰 khi猽 chi課 c竎 v? anh h飊g Lng S琻 n鱝. [%s] c? th? th玭g qua <color=yellow>ng? c竎 <color> mua 頲",
	[11] = "H穣 nh苩 rng ph莕 thng trc khi r阨 kh醝 c鯽 秈",
	[12] = {"Ngi ch琲 %s  thua!","Ngi ch琲 %s  th緉g!","T鎛g 甶觤 hi謓 nay l? %d v韎 %d. C竎 v?  th緉g 頲 %d v竛"},
	--隐藏关卡第二关的相关结束信息
	[13] = {
		"Ch骳 m鮪g! Sau nh鱪g kh秓 nghi謒 giang kh? i ng? c馻 c竎 h? cu鑙 c飊g  gi祅h 頲 chi課 th緉g 揝? khi猽 chi課 c馻 h祇 ki謙?.",
		"C竎 h? c? th? ti課 v祇 khi猽 chi課 c鯽 秈 ti誴 theo.",
		"C竎 h? c飊g i ng?  b? nh b筰, vt 秈 th蕋 b筰.",
	},
	--梁山任务相关
	[14] = {
		"C竎 h?  nh薾 nhi謒 v?",
		"C竎 h?  ho祅 th祅h ?<color=green>%s<color>?, h穣 mau n nh薾 thng!",	
	},
	[15] = {
		[1] = "C竎 h? mang theo %s kh玭g  %d!",
		[2] = "C竎 h? mang theo kh玭g  %d v祅g",
		[3] = "Kh玭g gian h祅h trang kh玭g  1 ? tr鑞g, kh玭g th? i!",
		[4] = "Ch璦 gia nh藀 l璾 ph竔, kh玭g th? i!",
	},
}
--npc喊话信息
LSNpcChat = {
	--boss开始战斗时的喊话
	[1] = {
		[NpcName[2 ][2]] = {"Mu鑞 so t礽 v? ngh? v韎 T鑞g M蓇, v蒼 mong c竎 h? ch? gi竜 ch? gi竜.","o ki誱 kh玭g c? m総, mong c竎 h? c萵 th薾."},
		[NpcName[5 ][2]] = {"C竎 h?  ki猲g quy誸 mu鑞 t? v? v韎 ta, t筰 h? nh tr? t礽 m鋘 v藋!"},
		[NpcName[8 ][2]] = {"N鉯 nhi襲 v? 輈h, h穣 ph﹏ cao th蕄 tr猲 v? kh? th玦!!","V? kh? kh玭g c? m苩, mong c竎 h? c萵 th薾!"},
		[NpcName[11][2]] = {"Hahaha c竎 h? mu鑞 c飊g ta t? v?, th藅 vinh h筺h, vinh h筺h qu?","Tuy n鉯 r籲g  l﹗ kh玭g xu蕋 chi猽, nh璶g ta s? kh玭g l璾 t譶h u!"},
		[NpcName[14][2]] = {"Цnh nhau kh玭g ch? l? nh? th?, h穣  ta hng d蒼 c竎 ngi v礽 chi猽!"},
		[NpcName[17][2]] = {"o c馻 ta, c竎 h? v蒼 ch璦  n鎖, h穣 quay v? nh? 甶.","C竎 ngi khi猽 chi課 v韎 ta, hahaha ta c騨g mu鑞 ni誱 th? m飅 v? c馻 th蕋 b筰 l? nh? th? n祇.",},
		[NpcName[20][2]] = {"H穣 xem y!","C竎 ngi h穣 xem s? l頸 h筰 c馻 ta!"},
		[NpcName[23][2]] = {"C竎 ngi n khi猽 chi課 ta y sao? в xem c竎 ngi c? bao nhi猽 c﹏ lng!"},
		[NpcName[26][2]] = {"Зu ra m ti觰 mao t芻 n祔, c? gan l閚g ng玭 h鏽 xc th? n祔!","H穣 b竜 l猲 danh t輓h, l? khi b? ta nh ch誸 th? tr猲 bia m? c騨g c? c竔 t猲!"},
		[NpcName[29][2]] = {"N鉯 nhi襲 v? 輈h, h穣 so t礽 quy襫 cc.","Ti誴 chi猽, v? ch uy猲 ng cc!"},
		[NpcName[32][2]] = {"Mu鑞 khi猽 chi課 ta, v藋 th? ph秈 tr? m閠 c竔 gi? r蕋 l韓!","L穙 y kh玭g ph竧 uy m? ch髇g ngi tng ta l? con m蘯 b謓h sao!!"},
		[NpcName[35][2]] = {"ng c? a, mu鑞 nh v韎 ta th? ch? c? ch竛 s鑞g th玦!","C竎 ngi ╪ kh玭g n鎖, h穣 v竎 nhau m? v? 甶!"},
		[NpcName[38][2]] = {"Ti誴 chi猽, h穣 xem s? l頸 h筰 c馻 l穙 nng y!","Cho c竎 ngi bi誸 th? n祇 l? kh玭g n猲 ch鋍 gi薾 nh鱪g ngi p!"},
		[NpcName[41][2]] = {"Ngi kh玭g mu鑞 s鑞g n鱝 r錳 h?, c? gan n khi猽 chi課 v韎 ta.",	"Ta ch? c莕 m閠 tay th玦 c騨g   h? g鬰 ngi!"},
		[NpcName[44][2]] = {"Ta s? cho ngi bi誸 th? n祇 l? Lng S琻 h秓 h竛!","Ta kh玭g mu鑞 rat ay, c竎 ngi h穣 甶 甶."},
		[NpcName[47][2]] = {"Mu鑞 so t礽 v韎 ta, h穣 ╪ g藋 n祔 trc! !","Ai d竚 i chi課 300 hi謕 v韎 ta?"},
		[NpcName[50][2]] = {"Ngi th藅 to gan, c? gan khi猽 chi課 v韎 Lng S琻 B竎 ch髇g ta!","Xem chi猽, h穣 xem s? l頸 h筰 c馻 gia gia y!","H穣 mau v? v韎 m? 甶, kh玭g th? ng kh鉩 l鉩 van xin!"},
		[NpcName[53][2]] = {"C竎 ngi l? ai, b竜 danh l猲 甶, ta kh玭g gi誸 nh鱪g t猲 v? danh ti觰 b鑙!","C竎 ngi c? bi誸 s? l頸 h筰 c馻 s頸 roi ph竜 n祔?!"},
	},
	--boss战败时的喊话
	[2] =
	{
		[NpcName[2 ][2]] = {"C竎 h? v? ngh? cao cng, T鑞g m蓇 may m緉 頲 m? r閚g t莔 m総","B竔 ph鬰 b竔 ph鬰, c竎 h? sao kh玭g gia nh藀 Lng s琻 v韎 ch髇g t玦, c飊g nhau tr鮪g b筼 an lng, th? thi猲 h祅h o!"},
		[NpcName[5 ][2]] = {"Ta th藅 b蕋 t礽, c竎 h? qu? nhi猲 l頸 h筰!"},
		[NpcName[8 ][2]] = {"H秓 c玭g phu, b竔 ph鬰 b竔 ph鬰!"},
		[NpcName[11][2]] = {"Х l﹗ kh玭g g苝 nh鱪g v? h﹗ b鑙 xu蕋 s綾 nh? th? n祔, th藅 l? h藆 sinh kh? 髖!!"},
		[NpcName[14][2]] = {" tr猲 giang h? trc sau g? c騨g ph秈 tr秴?"},
		[NpcName[17][2]] = {"V? ngh? kh玭g t?, ti誧 l? ta ch? d飊g c? 7 th祅h c玭g l鵦","Quan m? ta h玬 nay  b筰 tr薾, th藅 th? v?!!!"},
		[NpcName[20][2]] = {"C竎 h? th﹏ th? b蕋 ph祄, C玭g T玭 m蓇 b竔 ph鬰."},
		[NpcName[23][2]] = {"L﹎ m蓇 tung ho祅h giang h? m蕐 mi n╩, g苝 頲 c竎 v? thi誹 ni猲 anh h飊g th藅 l? m閠 u may m緉!"},
		[NpcName[26][2]] = {"Kh玭g ng? l筰 thua cho nh鱪g t猲 ti襲 l﹗ la c竎 ngi th藅 s? ? qu?, s? ? qu?."},
		[NpcName[29][2]] = {"C竎 h? v? c玭g c竔 th?, V鈔g T遪g b竔 ph鬰."},
		[NpcName[32][2]] = {"Giang s琻 kh玭g i, l鬰 th駓 trng l璾. H穣 i y!"},
		[NpcName[35][2]] = {"C竎 ngi qu? nhi猲 c? ch髏 b秐 l躰h, h玬 nay t筸 tha c竎 ngi! L莕 sau ta s? kh玭g nng tay n鱝!","Tuy ngi  th緉g ta, nh璶g c竎 huynh  c馻 ta s? b竜 th? n祔!"},
		[NpcName[38][2]] = {"C竎 v? qu? th﹏ th? b蕋 ph祄, ti觰 nng ta xin b竔 ph鬰."},
		[NpcName[41][2]] = {"H玬 nay c? 頲 m閠 tr薾 chi課 th藅 s秐g kho竔, s秐g khoai!"},
		[NpcName[44][2]] = {"L頸 h筰, c竎 h? v? ngh? cao cng, c竔 th? tuy謙 lu﹏, h穣 l祄 v? anh h飊g th? 109 c馻 Lng S琻 n祔 nh?!"},
		[NpcName[47][2]] = {"T鴆 th藅, b筰 di tay nh鱪g t猲 tti觰 t? th鑙 n祔, th藅 kh玭g cam t﹎!"},
		[NpcName[50][2]] = {"Tuy l遪g kh玭g cam, nh鱪g v? c玭g c馻 nh鱪g v? hi謕 s? qu? th藅 t筰 h? b竔 ph鬰.",	},
		[NpcName[53][2]] = {"S秐g kho竔, th藅 s秐 kho竔,  l﹗ r錳 kh玭g c? m閠 tr薾 nh s秐 kho竔 nh? th? n祔 r錳!","H玬 nay l穙 t? u鑞g nhi襲 r錳, ch﹏ tay kh玭g linh ho箃, l莕 sau s? d箉 d? c竎 ngi."},
	}
}
--NPC-Say对话整理
NpcSayInfo = {
	[1] = {
		"<color=green>"..NpcName[1][2].."<color>: h祇 ki謙 h? c? 頲 Thi猲 Cang L謓h, u c? th? n t譵 ta i thng.",
		". Tr? l筰",
		". Tho竧",
		". %s (c莕 %d Thi猲 Cang L謓h)",		--test:物品名
		"Kh玭g th? giao d辌h",
	},
	[2] = {
		"<color=green>"..NpcName[1][2].."<color>: c竎 h? x竎 nh d飊g %d Thi猲 Cang L謓h i l蕐 %s kh玭g?",
		"уng ?",
		"H駓 b?",
	},
	[3] = {
		"Ph輆 T﹜ b綾 c? 1 tr? nh, i trng c? th? t譵 b? ch? T玭 Nh? Nng h醝 th╩ t譶h h譶h c馻 Lng S琻 Qu莕 H飊g H閕.",
		"K誸 th骳 i tho筰",
	},
	[4] = {
		"C鯽 秈 Lng S琻 qu莕 h飊g h閕  k誸 th骳.",
	},
	--闯关接引NPC对话选项
	[5] = {
		[1] = "Ti課 v祇 c鯽 秈 ti誴 theo",
		[2] = "Ki觤 tra t譶h tr筺g g苝 Boss",
		[3] = "K誸 th骳 i tho筰",
		[4] = ":Nh鱪g v? huynh  Lng S琻 ch髇g t玦, ai n蕐 u th﹏ mang tuy謙 k? v? ngh? cao cng. C竎 v? hi謕 s? n猲 d飊g to祅 l鵦 ra 鴑g ph?, ch? n猲 khinh ch m? m蕋 甶 sinh m筺g. ~",
	},
	--关卡第一关的相关对话
	[6] = {
		[1] = {
			"Ph輆 T﹜ b綾 c? 1 tr? nh, i trng c? th? t譵 b? ch? T玭 Nh? Nng h醝 th╩ t譶h h譶h c馻 Lng S琻 Qu莕 H飊g H閕.",
			{
				"K誸 th骳 i tho筰/nothing",
			},
		},
		[2] = {
			": c竎 v?  c? gan khi猽 chi課 Lng S琻 huynh  ch髇g t玦, ch綾 s? kh玭g ph秈 l? h筺g ti觰 b鑙 t莔 thng, c竎 v? huynh   chu萵 b? ch璦?",
			{
				"Ta ch蕄 nh薾 khi猽 chi課/start",
				"K誸 th骳 i tho筰/nothing",
			},
		},
		[3] = {
			": 阯g nh? ph輆 sau ta c? th? n tr鴆 ti誴 T? Ngh躠 Л阯g, chi課 th緉g h秓 h竛 trong t? ngh躠 阯g c? th? nh薾 頲 gi秈 thng c祅g nhi襲. nh璶g c竎 ngi n H綾 Phong Tr筰 ph秈 chi課 th緉g 4 Lng S琻 H秓 H竛 ch? i ? .",
			{
				--"我要沿小路上去/#tStage_1:skip()",
				"Ta ch? gh? qua th玦/nothing",
			},
		},
		[4] = {
			"D筺g Thi猲 Ki猽 c莕 <color=red>%d c竔 %s (C? th? mua trong Ng? C竎)<color> ng ? kh玭g?",
			{
				"уng ?/#tStage_1:skip(1)",
				"Ta ch? gh? qua th玦/nothing",
			},
		},
	},
	--关卡第二关的相关对话
	[7] = {
		[1] = {
			": c竎 v? n khi猽 chi課 v韎 ch? v? anh h飊g Lng S琻 ta sao? H? u mang tr猲 ngi v? ngh? cao cng, th﹏ mang tuy謙 k?, h穣 nh? ch? n猲 khinh ch. N誹 c秏 th蕐 qu? s鴆, i trng c? th? t譵 ta ch鋘 tr? th? th輈h h頿 .",
			{
				"Ta ch蕄 nh薾 khi猽 chi課/start",
				"K誸 th骳 i tho筰/nothing",
			}
		},
		[2] = {
			": c竎 v? n khi猽 chi課 v韎 ch? v? anh h飊g Lng S琻 ta sao? H? u mang tr猲 ngi v? ngh? cao cng, th﹏ mang tuy謙 k?, h穣 nh? ch? n猲 khinh ch. N誹 c秏 th蕐 qu? s鴆, i trng c? th? t譵 ta ch鋘 tr? th? th輈h h頿 .",
			{
				"Ta mu鑞 xin h? tr?/#tStage_2:getAid()",
				"K誸 th骳 i tho筰/nothing",
			}
		},
		[3] = {
			":Nh鱪g tr? th? sau u c? s? trng ri猲g, l頸 d鬾g c 甶觤 c馻 h? s? d? d祅g vt 秈.",
			{
				"H? vng: hi謚 qu? v遪g s竛g: trong ph筸 vi v遪g s竛g n閕 c玭g ngi ch琲 頲 t╪g cao/#tStage_2:createMyFish(1)",
				"Ti猲 n?: hi謚 qu? v遪g s竛g: trong ph筸 vi v遪g s竛g ngi ch琲 h錳 ph鬰 sinh m謓h/#tStage_2:createMyFish(2)",
				"Thi vng: hi謚 qu? v遪g s竛g: trong ph筸 vi v遪g s竛g qu竔 i ch gi秏 n閕 ngo筰 ph遪g/#tStage_2:createMyFish(3)",
				"Th筩h ma: hi謚 qu? v遪g s竛g: trong ph筸 vi v遪g s竛g qu竔 i ch t鑓 s? gi秏/#tStage_2:createMyFish(4)",
				"Ta suy ngh? l筰/nothing",
			}
		},
	},
	--关卡第三关的相关对话
	[8] = {
		--挑战前的对话
		[1] = {
			[1] = {
				": Hoa Vinh th藅 l? phi襫 h?, ta ch? mu鑞 so t礽 v韎 h緉 m閠 phen, th? u ra nhi襲 o l? th? n祔.",
				": m鋓 ngi c飊g l? huynh  Lng S琻, Trng huynh  ch蕄 ? mu鑞 so t礽 ti詎 thu藅 v韎 ta, th藅 l祄 kh? ta qu?.",
			},
			[2] = {
				"Thay b籲g ch髇g ta c飊g so t礽 /#tStage_3:startfish()",
				"tr? l筰 /nothing",
			},
		},
		--挑战成功的对话
		[2] = {
			[1] = {
				": kh玭g ng? thi誹 hi謕 tu鎖 tr? t礽 cao",
				": thi誹 hi謕 v? ngh? cao cng, Hoa Vinh b竔 ph鬰.",
			},
		},
		--挑战失败的对话
		[3] = {
			[1] = {
				": kh玭g t? kh玭g t?, c? v礽 阯g v? ngh? y! Nh璶g mu鑞 nh b筰 ta h穣 v? luy謓 th猰 v礽 n╩ 甶.",
				": c竎 h? v? ngh? kh玭g t?, ng ti誧 v蒼 ch璦  h醓 h莡. Sau n祔 c莕 ch╩ ch? luy謓 t藀 th猰.",
			},
			[2] = {
				"Ta mu鑞 khi猽 chi課 v? h秓 h竛 Lng S琻 ti誴 theo /#tStage_3:startboss()",
				"tr? l筰/nothing",
			},
		},
		--闯关结束时的对话
		[4] = {
			[1] = {
				"<color=green>Th玭g b竜<color>: th阨 gian s╪ b総  k誸 th骳. C竎 v? i hi謕 t鎛g c閚g  b総 頲 %d v藅 s╪, %s v? %s t鎛g c閚g b総 頲 %d v藅 s╪. \n<color=red>цi tho筰 v韎 h?<color>, c? th? khi猽 chi課 v? h秓 h竛 Lng S琻 ti誴 theo.",
				"\n C竎 h?  nh薾 頲 ?<color=yellow>Kh? Tuy襫 Th莕 C玭g<color>?, <color=green> c? th? ch鋘 d飊g trong bi觰 tng k? n╪g chu閠 ph秈?<color>.",
			},
			[2] = {
				"Ta bi誸 r錳/nothing",
			},
		},
	},
	--关卡第四关的相关兑换
	[9] = {
		[1] = {
			": nh鱪g c? quan b猲 trong u l? th祅h qu? nghi猲 c鴘 bao n╩ nay c馻 ta, nghe n鉯 ngi mu鑞 khi猽 chi課 nh鱪g v? huynh  tr猲 Lng S琻, ta ngh? r籲g nh鱪g b秓 b鑙 nghi猲 c鴘 c馻 ta c? th? s? gi髉 輈h 頲 c竎 v?. Ph輆 tr猲 khu vn ph輆 b綾 c? 1 <color=red>h? nc<color>, b猲 trong c? l緋 v礽 <color=red>c玭g t綾<color>, i trng c? th? d飊g  m? c? quan, gi髉 i ng? vt 秈 thu薾 l頸 h琻.",
			{
				"Ta ch蕄 nh薾 khi猽 chi課 /start",
				"tr? l筰/nothing"
			}
		},

	},
	--关卡第五关的相关对话
	[10] = {
		[1] = {
			": v祇 T? Ngh躠 Л阯g c莕 nh b筰 4 v? Lng S琻 h秓 h竛 tr蕁 th? t筰 產y, c竎 v?  chu萵 b? s絥 s祅g ch璦.",
			{
				"Ta  s絥 s祅g /start",
				"Ta c莕 chu萵 b? l筰./nothing",
			}
		},

	},
	--关卡第六关相关对话
	[11] = {
		[1] = {
			": th藅 kh玭g d? d祅g t? n祇, kh玭g ng? c竎 v? i hi謕 c? th? n 頲 T? Ngh躠 Л阯g, t筰 y t藀 h頿 nh鱪g tinh anh c馻 Lng S琻, c竎 v? s? kinh ng筩 trc phong th竔 c馻 Lng S琻 h秓 h竛.",
			{
				"Ta mu鑞 ti誴 nh薾 khi猽 chi課 ( ti猽 hao 1 Thi猲 Ki猽 L謓h)/preStart",
				"Ki觤 tra t譶h tr筺g g苝 Boss/#tMission:showBossState()",
				"Kh玭g ch琲 n鱝, ta mu鑞 v? nh?/preClose",
				"K誸 th骳 i tho筰/nothing",
			},
		},
		[2] = {
			": th藅 kh玭g d? ch髏 n祇, kh玭g ng? c竎 v? i hi謕 l筰 l頸 hai nh? th?",
			{
				"Ta  i th緉g /preClose",
				"K誸 th骳 i tho筰/nothing",
			},
		},
	},
	--隐藏第一关相关对话
	[12] = {
		[1] = {
			": ta l? cao th? o糿 t? t? , mu鑞 khi猽 chi課 h?, th? th? chu萵 b? thua 甶! \n   <color=yellow>N誹 th祅h vi猲 i ng? c? 3 - 4 ngi, ch? c莕 1 ngi chi課 th緉g th? chi課 th緉g chung cu閏 \n   N誹 i ng? c? 5- 8 th祅h vi猲 th? c莕 2 ngi chi課 th緉g s? gi祅h chi課 th緉g chung cu閏 <color>",
			{
				"Ta mu鑞 th竎h u o糿 t? t? /start",
				"tr? l筰/nothing",
			},
		},
		[2] = {
			": kh玭g ch琲 n鱝, kh玭g ch琲 n鱝 厖",
			{
				"tr? l筰 /nothing",
			},
		},
		[3] = {
			"Tr薾 u 3 v竛. 觤 hi謓 t筰 l?",
		},
		[4] = {
			{
				"A? 畂竛 gi鑞g nh? ta.",
				"Haha, ta th緉g r錳.",
				"T鴆 ch誸 頲,  qu麀",
			},
			{
				"tr? l筰 /start",
			},
		},
	},
	--隐藏第二关相关对话
	[13] = {
		[1] = {
			"C竎 h?  v祇 c鯽 秈 萵 揔hi猽 chi課 c馻 hi謕 s軘 Lng S琻 Qu莕 H飊g H閕. Trong 秈 n祔, trong v遪g 3 ph髏, th祅h vi猲 i ng? u s鑞g s鉻 th? chi課 th緉g c鯽 秈, c? th? nh薾 頲 ph莕 thng l韓. Khi k誸 th骳 khi猽 chi課 c遪 s鑞g tr猲 2 ngi i ng? c? th? nh薾 頲 1 rng ph莕 thng, n誹 th祅h vi猲 s鑞g s鉻 di 2 ngi, i ng? s? kh玭g nh薾 頲 ph莕 thng nh璶g to祅 i c? th? ti誴 t鬰 khi猲 chi課 c鯽 秈 ti誴 theo.",
			{
				"Ta hi觰 r錳!/nothing",
			},
		},
		[2] = {
			{
				--杨
				[NpcName[98][2]]   = "<color=green>"..NpcName[98][2].."<color>: C竎 ngi mu鑞 khi猽 chi課 Lng S琻 h秓 h竛 ch髇g ta y ?, h穣 vt qua 秈 n祔 r錳 n鉯 chuy謓!",
				--吴
				[NpcName[99][2]] = "<color=green>"..NpcName[99][2].."<color>: kh? 秈 v? bi猲, quay u l? b?. C竎 v? h穣 gi竎 ng? 甶, quay v? v蒼 c遪 k辮.",
				--王
				[NpcName[100][2]] = "<color=green>"..NpcName[100][2].."<color>: c竎 ngi c騨g tham gia Lng S琻 qu莕 h飊g h閕 sao? ",
				--黎
				[NpcName[101][2]] = "<color=green>"..NpcName[101][2].."<color>: c? ch髇g ta y, c竎 ngi ng h遪g g苝 頲 nh鱪g v? h秓 h竛 Lng S琻.",
			},
			{
				"Цnh th? nh, ta s? ngi sao /start",
				"tr? l筰 /nothing",
			},
		},
	},
	--梁山任务相关对话
	[14] = {
		[1] = ": lo筰 nhi謒 v? n祔 m鏸 ng祔 ch? 頲 nh薾 1 l莕.",
		[2] = ". Tr? l筰",
		[3] = ". Tho竧",
		[4] = "C竎 h?  nh薾 nhi謒 v? n祔 r錳!",
		[5] = "#Ki觤 tra nhi謒 v?",
		[6] = "Nhi謒 v? n祔  ho祅 th祅h!",
		[7] = "#Nh薾 thng",
		[8] = "Ph莕 thng n祔  頲 nh薾!",
		[9] = "#Nh薾 nhi謒 v? ",
		[10] = {
			[1] = "H穣 ch鋘 trang b? c莕 i",
			[2] = ". Ta c莕 i %s",
			[3] = {
				"Trang b? h? C鰑 Ch﹗",
				"Trang b? h? Hi猲 Vi猲",
			},
			[4] = "(c莕 %d Thi猲 Cang L謓h v? %d v祅g)",
			[5] = "X竎 nh s? d鬾g %d Thi猲 Cang L謓h v? %d v祅g i?",
			[6] = ".  Ta x竎 nh i%s",
			[7] = ".  Xem trang b? C鰑 Ch﹗",
		}
	},
}
--状态信息
LSBuffInfo = {
	[1] = {
		{
			"Duy tr? h錳 m竨",
			{
				{"state_life_per_per8f",  1000, 15*18, 1, 9922 }
			},
			"Xu﹏ phong h鉧 v?"
		},
		{
			"Duy tr? h錳 n閕 l鵦",
			{
				{"state_neili_per_per8f", 1000, 15*18, 1, 9923,}
			},
			"Thang kh? h錳 tng"
		},
		{
			"N﹏g cao n閕 ngo筰 ph遪g",
			{
				{"state_magic_parmor_per_add", 50, 15*18, 1, 9924, },
				{"state_physical_parmor_per_add", 50, 15*18, 1, 9925, },
			},
			"Linh h錸 h? th? ",
		},
		{
			"N﹏g cao n閕 ngo筰 c玭g",
			{
				{"state_m_attack_percent_add", 200, 15*18, 1, 9926, },
				{"state_p_attack_percent_add", 200, 15*18, 1, 9927, },
			},
			"N? ph竧 xung qu竛",
		},
	},
	--第五关的buff
	[2] = {
		[1] = {"Thi猲 th莕 h? ph祄", 60, "Duy tr? %d ph髏"},
		[2] = {
			[1] = {9908, "state_p_attack_percent_add",	700,	"Ngo筰 c玭g t╪g %d%%"},
			[2] = {9909, "state_m_attack_percent_add",	700,	"N閕 c玭g t╪g %d%%"},
			[3] = {9910, "state_life_max_percent_add",	300,	"Gi韎 h筺 m竨 t╪g %d%%"},
			[4] = {9911, "state_buff_resist",			14,		"Mi詎 d辌h tr筺g th竔 b? h筰 %d"},
		},
	},
}
--日志信息
SysLogInfo = {
	[1] = "Liangshan mission:	%s	add item fail, addflag:%d,itemname:	%s",
	

}
--“NpcName[1][2]”均表示传送NPC的名字
T = {}
T1 = {}
T2 = {}
T3 = {}
T3_1 = {}
T3_2 = {}
T3_3 = {}
T3_4 = {}
T3_5 = {}
T3_6 = {}

T.msg = "<color=green>"..NpcName[1][2].."<color>: T玦 c? th? gi髉 g? cho c竎 ?";
T.msg = format("%s\n s? l璾 ph竔 trong t? i c祅g nhi襲 gi秈 thng c祅g t鑤", T.msg)
T.msg = format("%s\nVt 秈 thng: M鏸 th祅h vi猲 c莕 ti猽 hao <color=yellow>%d 甶觤 tinh l鵦<color>\nVt 秈 Thi猲 Ki猽: чi trng c莕 ti猽 hao <color=yellow>%d c竔 %s<color>"
	, T.msg, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
T.sel =
{
	{". B鑙 c秐h Lng S琻 Qu莕 H飊g H閕", T1, },
	{". 襲 ki謓 tham gia", T2, },
	{". Gi韎 thi謚 vt 秈", T3, },
--	{". Vt 秈 thng", "entry_jingli", },
--	{". Vt 秈 Thi猲 Ki猽", "entry_tianjiaoling", },
--	{". Ta mu鑞 i thng", "exchange", },
--	{". Ta n nh薾 nhi謒 v? h籲g ng祔", "DailyTasksMenu", },
	{". Tho竧", "nothing", },
	};
T1.msg = "<color=green>"..NpcName[1][2].."<color>: c竎 v? anh h飊g h祇 ki謙 t? v? Lng S琻 gi祅h 頲 chi課 th緉gc? th? nh薾 頲 t輓 v藅棗Thi猲 Cang L謓h, d飊g Thi猲 Cang L謓h c? th? t譵 ta i l蕐 k? binh d? b秓 trong thi猲 h?.";
T1.sel =
{
	{". Tr? l筰", T, },
	{". Tho竧", "nothing", }, };
T2.msg = "<color=green>"..NpcName[1][2].."<color>: 輙 nh蕋 c莕 3 ngi ch琲 ng v蕄 >=80 t? i, v? do i trng d蒼, m韎 頲 tham gia Lng S琻 Qu莕 H飊g H閕. Gamer kh玭g gia nh藀 l璾 ph竔 s? kh玭g th? 甶 v祇.";
T2.msg = format("%s\nVt 秈 thng: M鏸 th祅h vi猲 c莕 ti猽 hao <color=yellow>%d 甶觤 tinh l鵦<color>\nVt 秈 Thi猲 Ki猽: чi trng c莕 ti猽 hao <color=yellow>%d c竔 %s<color>"
	, T2.msg, N_JOIN_ENERGY_NEED, N_JOIN_TIANJIAOLING_NEED, T_TIANJIAOLING[4])
T2.sel =
{
	{". Tr? l筰", T, },
	{". Tho竧", "nothing", }, };
T3.msg = "<color=green>"..NpcName[1][2].."<color>: Lng S琻 qu莕 h飊g h閕 t鎛g c閚g c? 5 秈, v? 8 nh鉳 h秓 h竛 Lng S琻 (ch鋘 ng蓇 nhi猲 trong danh s竎h 18 nh鉳). C馻 秈 1~4 m鏸 秈 khi猽 chi課 1 nh鉳, 秈 th? 5 khi猽 chi課 4 nh鉳 h秓 h竛 c遪 l筰.";
T3.sel =
{
	{". Th駓 B竎h ёnh", T3_1, },
	{". kho竔 Ho箃 L﹎", T3_2, },
	{". Phi M? Чo", T3_3, },
	{". H綾 Phong Tr筰", T3_4, },
	{". T? Ngh躠 Л阯g", T3_5, },
	{". 秈 b? m藅", T3_6, },
	{". Tr? l筰", T, },
	{". Tho竧", "nothing", }, };
T3_1.msg = "<color=green>"..NpcName[1][2].."<color>: xung quanh Th駓 B竎h ёnh t s絥 nhi襲 rng, ph? v? rng c? th? k輈h ho箃 nhi襲 hi謚 qu? kh竎 nhau, c? hi謚 qu? tr筺g th竔 t╪g h? tr? cho i ng?, bi誸 n緈 b総 v? s? d鬾g t鑤 hi謚 qu? mang l筰 c? th? gi髉 輈h cho i ng? vt 秈 d? d祅g h琻.";
T3_1.sel =
{
	{". Tr? l筰", T3, },
	{". Tho竧", "nothing", }, };
T3_2.msg = "<color=green>"..NpcName[1][2].."<color>: L? Tu蕁 trong Kho竔 Ho箃 L﹎ s? h? tr? h誸 m譶h cho i ng? trong vt 秈, ch? c莕 i tho筰 v韎 anh ta l? c? th? mn 頲 s鴆 m筺h h? tr?.";
T3_2.sel =
{
	{". Tr? l筰", T3, },
	{". Tho竧", "nothing", }, };
T3_3.msg = "<color=green>"..NpcName[1][2].."<color>: Hoa Vinh v? Trng Thanh x秠 ra tranh ch蕄 cao th蕄 trong Kho竔 M? Чo, c竎 h? c莕 ch鋘 m閠 trong 2  thi t礽, trong th阨 gian quy nh ti猽 di謙 頲 d? th? nhi襲 h琻 s? chi課 th緉g v? nh薾 頲 揔h? Nguy猲 Th莕 C玭g?";
T3_3.sel =
{
	{". Tr? l筰", T3, },
	{". Tho竧", "nothing", }, };
T3_4.msg = "<color=green>"..NpcName[1][2].."<color>: H綾 Phong Tr筰 c? d鵱g s絥 4 lo筰 c? quan, kh雐 ng nh鱪g c? quan kh竎 nhau c? th? gi秈 ph鉵g k? n╪g kh竎 nhau. M閠 l頸 th? d飊g  ch鑞g l筰 k? th? khi vt 秈.";
T3_4.sel =
{
	{". Tr? l筰", T3, },
	{". Tho竧", "nothing", }, };
T3_5.msg = "<color=green>"..NpcName[1][2].."<color>: n誹 th祅h c玭g 甶 qua H綾 Phong Tr筰, m閠 ngi trong t? i c竎 b筺 n閜 1 Thi猲 Ki猽 L謓h cho ыi T玭g m韎 頲 甶 v祇 T? Ngh躠 Л阯g khi猽 chi課 c竎 h秓 h竛 kh竎 ( Thi猲 Ki猽 L謓h c? th? mua t筰 Ng? C竎), sau khi khi猽 chi課, nh﹏ v藅 tng 鴑g trong t? ngh躠 阯g s? i th祅h nh﹏ v藅 chi課 u v? t? v? v韎 t? i ngi.";
T3_5.sel =
{
	{". Tr? l筰", T3, },
	{". Tho竧", "nothing", }, };
T3_6.msg = "<color=green>"..NpcName[1][2].."<color>: y l? m閠 b? m藅."
T3_6.sel =
{
	{". Tr? l筰", T3, },
	{". Tho竧", "nothing", }, 
}