--脚本功能：海上龙舟战字符串集合
--功能设计：大熊、小宇宙
--功能开发：波波、村长
--功能测试：小熊、饭姐
--开发时间：2011-8-23
--修改记录：
sNpcNameEntrance="<color=green>Ti誴 D蒼 S?<color>:"
sNpcNameNeeder="<color=green>Qu﹏ Nhu Quan<color>:"
sNpcNamePilot="<color=green>Hng d蒼 vi猲<color>: "
tSTRING_NPC_SAY = {
	--接引NPC对话
	[1] = {
		[1] = {
			sNpcNameEntrance.."L穙 phu  thi誸 k? m閠 v? i t? v? tr猲 bi觧, kh玭g bi誸 c竎 h? c? nh? ? tham gia hay kh玭g?",
			{
				"B竜 danh H秈 Chi課 Long Ch﹗ (Ph? b竜 danh 6 v祅g)/join_mission",
				"Nh薾 ph莕 thng H秈 Chi課 Long Ch﹗ tr薾 trc/get_award_infor",				
				"Gi韎 thi謚 H秈 Chi課 Long Ch﹗/mision_info",
				"Kh玭g c? g?!/nothing",
			},
		},
		[2] = {
			sNpcNameEntrance.."L穙 phu r蕋 t﹎ huy誸 tr薾 H秈 Chi課 Long Ch﹗ n祔, hy v鋘g c竎 v? i hi謕 c? th? thi tri觧 t礽 ngh? si猽 vi謙 c馻 m譶h",
			{
				"襲 ki謓 tham gia/mission_condition",
				"Th阨 gian m?/mission_open_time",
				"Quy t綾 H秈 Chi課 Long Ch﹗/mission_rule",
				"Ph莕 thng H秈 Chi課 Long Ch﹗/mission_prize",
				"Tr? l筰/main",
				"R阨 kh醝/nothing",
			},
		},
		
	},

}
--============介绍信息
tSTRING_INTRODUCE = {
	[1] = "Thi誹 hi謕 c? th? c? nh﹏ b竜 danh tham gia, ph? b竜 danh l? 3 v祅g",
	[2] = "Th阨 gian m?: 10:00 - 11:00, 16:00 - 17:00,  22:00 - 23:00",
	[3] = "\n\t<color=green>1.<color> Thi誹 hi謕 s? 頲 chuy觧 ng蓇 nhi猲 n phe qu﹏ T鑞g ho芻 Li猽. Khi 2 b猲  8 ngi, cu閏 chi課 s? b総 u; \n\t<color=green>2.<color> M鏸 b猲 u c? 100 甶觤 chi課 u, 甶觤 s? s? 頲 gi秏 d莕 theo di詎 ti課 tr薾 chi課, b猲 c? 甶觤 s? b? tr? v? 0 trc s? b? x? thua, phe i phng chi課 th緉g; \n\t<color=green>3.<color> Th阨 gian tr薾 chi課 k衞 d礽 40 ph髏, h誸 gi? h? th鑞g t? ng k誸 th骳 tr薾 u, phe c? 甶觤 s? cao h琻 s? gi祅h chi課 th緉g; \n\t<color=green>4.<color> N誹 nh? 甶觤 s? 2 b猲 b籲g nhau, b猲 n祇 c? Th鑞g L躰h b? ti猽 di謙 s? b? x? thua. n誹 th鑞g l躰h 2 b猲 kh玭g b? nh b筰 tr薾 chi課 x? h遖.\n",
	[4] = "\n\t<color=green>1.<color> B猲 chi課 th緉g s? nh薾 頲 200 v筺 甶觤 kinh nghi謒, b猲 thua cu閏 100 v筺 kinh nghi謒; \n\t<color=green>2.<color> M鏸 ng祔 m鏸 nh﹏ v藅 nh薾 頲 nhi襲 nh蕋 600 v筺 kinh nghi謒.",
}
--====TALK对话
tSTRING_NPC_TALK = {
	[1] = "Long Ch﹗ chi課 v蒼 trong th阨 gian chu萵 b?, thi誹 hi謕 h穣 quay l筰 v祇 l骳 10:00-11:00, 16:00-17:00, ho芻 22:00-23:00.",
	[2] = "H秈 Chi課 Long Ch﹗ v? c飊g nguy hi觤, thi誹 hi謕 t  %d c蕄 h穣 quay l筰 tham gia!",
	[3] = "Thi誹 hi謕 v蒼 ch璦 gia nh藀 m玭 ph竔!",
	[4] = "Thi誹 hi謕 c莕 trang b? cho m譶h k? n╪g m玭 ph竔 c蕄 55 h穣 quay l筰 tham gia!",
	[5] = "Thi誹 hi謕 v蒼 ch璦 nh薾 ph莕 thng H秈 Chi課 Long Ch﹗ l莕 trc, h穣 nh薾 thng trc 甶!",
	[6] = "Thi誹 hi謕 v蒼 ? trong t? i, h穣 r阨 i trc khi b竜 danh tham gia c? nh﹏.",
	[7] = "Thi誹 hi謕 ch璦 t鮪g tham gia H秈 Chi課 Long Ch﹗ sao, h穣 nhanh ch鉵g 甶 b竜 danh 甶!",
	[8] = "M鏸 ng祔 ch? nh薾 頲 nhi襲 nh蕋 600 v筺 kinh nghi謒, thi誹 hi謕 kh玭g th? nh薾 ti誴.",
	[9] = "Tr薾 H秈 Chi課 Long Ch﹗  gi祅h th緉g l頸, thi誹 hi謕 nh薾 頲 ph莕 thng %d kinh nghi謒! ",
	[10] = "Tr薾 H秈 Chi課 Long Ch﹗ trc  th蕋 b筰, thi誹 hi謕 ch? c? th? nh薾 頲 %d kinh nghi謒!",
	[11] = "T蕋 c? c竎 b秐   y, h穣 quay l筰 sau.",
	[12] = "Gi韎 h筺 nh薾 甶觤 kinh nghi謒 ng祔 h玬 nay  y",
	[13] = "Tr薾 H秈 Chi課 Long Ch﹗ trc  h遖 nhau, thi誹 hi謕 c? th? nh薾 頲 ph莕 thng %d kinh nghi謒!",
	[14] = "C竎 h? mang kh玭g  3 v祅g, kh玭g th? tham gia H秈 Chi課 Long Ch﹗.",
}
--===系统消息
tSRING_SYS_MSG = {
	[1] = "%s  gia nh藀 H秈 Chi課 Long Ch﹗!",
	[2] = "Thi誹 hi謕 h穣 t譵 Qu﹏ Nhu Quan nh薾 thuy襫 r錸g, tr薾 h秈 chi課 s緋 b総 u r錳.",
	[3] = "Thi誹 hi謕  l躰h h閕 頲 3 <K? n╪g Long Ch﹗ chuy猲 d飊g>, xem trang danh s竎h k? n╪g v? thi誸 l藀 ph輒 t総.",
	[4] = "Giai 畂筺 %s: \n%s\n qu﹏ s?: \nT鑞g %d vs Li猽 %d\n 觤 chi課 u: \nT鑞g %d vs Li猽 %d",
}

--====军需官对话
tSTRING_NEEDER_DLG = {
	[1] = "Gi韎 thi謚 c竎h ch琲 Long Ch﹗ Chi課/introduce",
	[2] = "Gi韎 thi謚 c 甶觤 Long Ch﹗/drag_specialty",
	[3] = "Nh薾 thuy襫 r錸g/get_drag",
	[4] = "R阨 kh醝 chi課 trng/exit_battle",
	[5] = "Ta ch? n xem th?/do_nothing",
}
--======龙舟种类
tSTRING_DRAG_KIND = {
	[1] = "Thuy襫 Thanh Long (t鑓  trung, gi竝 trung, s竧 thng trung)/qing_long",
	[2] = "Thuy襫 Huy襫 V? (t鑓  th蕄, gi竝 cao, s竧 thng th蕄)/xuan_wu",
	[3] = "Thuy襫 B筩h H? (T鑓  cao, gi竝 th蕄, s竧 thng trung)/bai_hu",
	[4] = "THuy襫 Chu Tc (t鑓  th蕄, gi竝 th蕄, s竧 thng cao)/zhu_que",
	[5] = "Tr? l筰/main",
}

--=======领取龙舟NPC对话
tSTRING_DRAG_NPC = {
	[1] = "Thi誹 hi謕  nh薾 Thuy襫 R錸g r錳",
	[2] = "Чi qu﹏ s緋 h? th駓, thi誹 hi謕 h穣 nhanh ch鉵g chu萵 b? h祅h trang, chi課 u cho qu鑓 gia n祇!",
	[3] = "Thi誹 hi謕 c? th? d鵤 tr猲 s? th輈h c馻 m譶h  ch鋘 thuy襫 r錸g!",
	[4] = "Thi誹 hi謕 mu鑞 bi誸 th猰 g? kh玭g?",
	[5] = "Thi誹 hi謕 x竎 nh mu鑞 r阨 kh醝 chi課 trng?",
	[6] = "R阨 kh醝 chi課 trng/exit_ensure",
	[7] = "C? vi謈 g? kh玭g?",
	[8] = "Hi謓 t筰 v蒼 ch璦 khai chi課, thi誹 hi謕 kh玭g th? v祇.",
	[9] = "Thi誹 hi謕 c莕 ci tr猲 Thuy襫 R玭g m韎 c? th? v祇 chi課 trng.",
	[10] = "Thi誹 hi謕 c莕 h? v? kh? m韎 c? th? ti課 v祇 chi課 trng",
	[11] = "Kh玭g gian h祅h trang thi誹 hi謕 kh玭g ",
	[12] = "Thi誹 hi謕 c莕 t譵 Qu﹏ Nhu Quan  nh薾 Thuy襫 R錸g",
	[13] = "Thi誹 hi謕 c莕 g? b? th? ci tr猲 ngi trc khi ti課 v祇 chi課 trng",
}
--========战场规则
tSTRING_BATTLE_RULE = {
	[1] = "Quy t綾 chi課 u/fight_rule",
	[2] = "Quy t綾 h醓 thuy襫/firedrag_rule",
	[3] = "Quy t綾 chi課 th緉g/sf_rule",
	[4] = "Tr? l筰/main",
}
--=====规则
tSTRING_RULE_DETAIL = {
	[1] = "Nh籱 nh b筰 k? th?, c莕 s? h? tr? nhi謙 t譶h t? c竎 v? qu﹏ s? tham gia, thi誹 hi謕 h穣 t譵 n Qu﹏ Nhu Quan ch鋘 v? ti誴 nh薾 c竎 lo筰 thuy襫 r錸g 頲 chu萵 b? s絥  c玭g ph? k? th?.",
	[2] = "Tr薾 chi課 di詎 ra n kho秐 th阨 gian gian nh蕋 nh, Ch? huy qu﹏ s? ph竔 h醓 thuy襫 ra c玭g ph? k? th?, v? h醓 thuy襫 mang y h醓 dc, n猲 c莕 c竎 v? hi謕 s? h? t鑞g n doanh tr筰 c馻 ch. Khi h醓 thuy襫 頲 chuy觧 n doanh tr筰 k? ch th祅h c玭g s? g﹜ s竧 thng l韓 khi課 k? th? nhanh ch鉵g m蕋 甶觤.",
	[3] = "C竎 v? hi謕 s? c? th? nh b筰 thuy襫 r錸g c馻 k? ch ho芻 h? t鑞g H醓 Thuy襫 n doanh tr筰 ch l祄 gi秏 甶觤 chi課 u c馻 k? th?, khi 甶觤 chi課 u c馻 k? th? gi秏 v? 0 th? phe ta gi祅h 頲 chi課 th緉g, n誹 nh? phe ta gi秏 v? 0 trc s? b? x? thua.",
}
--======龙舟特点
tSTRING_DRAG_SPECAIL = {
	[1] = "<color=green>Thuy襫 Thanh Long:<color>T鑓  trung b譶h, gi竝 trung, c玭g k輈h trung, li猲 k輈h nhanh, c? k? n╪g xung k輈h, kh玭g th? t? h駓 khi b? nh b筰.",
	[2] = "<color=green>Thuy襫 Huy襫 V?:<color>T鑓  th蕄, gi竝 cao, c玭g k輈h th蕄, c玭g k輈h kh鑞g ch?, k? n╪g g﹜ h玭 m?, c? th? h錳 ph鬰 sinh l鵦 ng i.",
	[3] = "<color=green>Thuy襫 B筩h H?:<color>T鑓  cao, gi竝 th蕄, c玭g k輈h trung, c玭g k輈h 阯g th糿g, k? n╪g y lui k? th?, t╪g t鑓  ng i.",
	[4] = "<color=green>Thuy襫 Chu Tc:<color>T鑓  th蕄, gi竝 th蕄, c玭g k輈h cao, c玭g k輈h t藀 th?, c? th? kh竛g s竧 thng ch? m筺g, c遪 c? th? nh藀 tr筺g th竔 cu錸g b筼.",
}
--=======计时器脚本内的字符串
tSTRING_MISSION = {
	[1] = "H秈 Chi課 Long Ch﹗ 2 b猲 kh玭g  %d chi課 binh, kh玭g th? khai chi課.",
	[2] = "H秈 Chi課 Long Ch﹗ s? b総 u trong %d ph髏, H醓 Thuy襫 ch輓h l? 甶觤 m蕌 ch鑤  gi祅h chi課 th緉g, c竎 v? anh h飊g h穣 chu萵 b? s絥 s祅g.",
	[3] = "%s v? %s H秈 Chi課 Long Ch﹗ trong %d ph髏 b蕋 ph﹏ th緉g b筰.",
	[4] = "Th駓 цc Qu﹏: cu閏 chi課 u b総 u r錳, m鋓 ngi h穣 nhanh ch鉵g v祇 chi課 trng n祇.",
	[5] = "%s  gi祅h chi課 th緉g tr薾 H秈 Chi課 l莕 n祔.",
	[6] = "S? ngi 2 b猲 hi謓 t筰 l?: %s[%d]: [%d]%s",
	[7] = "Dng Th蕋 T?: H?, l莕 sau b鎛 c? nng s? khi課 c竎 ngi th蕋 b筰 th秏 h筰.",
	[8] = "Ti猽 T莕: ai da, ta s? run ngi y n祔, l穙 y s絥 s祅g ch? c竎 ngi v竎 x竎 n y.",
	[9] = "H秈 Chi課 Long Ch﹗  k誸 th骳, %s  gi祅h chi課 th緉g. Ch? v? anh h飊g u bi觰 hi謓 r蕋 xu蕋 s綾, c? th? n t譵 <color=yellow>H秈 Chi課 Ti誴 D蒼 S?<color> nh薾 ph莕 thng.",
	[10] = "H秈 Chi課 Long Ch﹗  k誸 th骳, %s  gi祅h chi課 th緉g. Ch? v? anh h飊g u bi觰 hi謓 r蕋 xu蕋 s綾, c? th? n t譵 <color=yellow>H秈 Chi課 Ti誴 D蒼 S?<color> nh薾 ph莕 thng.",
	[11] = "H秈 Chi課 Long Ch﹗  k誸 th骳, qu﹏ ch v? ta b蕋 ph﹏ th緉g b筰. Ch? v? anh h飊g u bi觰 hi謓 r蕋 xu蕋 s綾, c? th? n t譵 <color=yellow>H秈 Chi課 Ti誴 D蒼 S?<color> nh薾 ph莕 thng.",
	[12] = "K? th? trc m苩 v藋 m? d竚 ng? g藅, ngi u l玦 ra cho ta!",
	[13] = "Dng Th蕋 T?: Ti猽 T莕, h穣 mau ra y 鴑g chi課.",
	[14] = "Dng Th蕋 T?: ti觰 t?,  s? ta ch璦, b秐 c? nng c? ph秈 d? hi誴 p.",
	[15] = "Ti猽 T莕: hahaha, ti觰 nha u nh v韎 ta, c遪 s韒 v礽 n╩, h穣 v? luy謓 th猰 甶.",
	[16] = "Ti猽 T莕: haha, h玬 nay i th緉g, quay v? ╪ m鮪g n祇!",
	[17] = "Li猽 qu﹏  ph竔 H醓 Thuy襫 ra tr薾",
	[18] = "Ti猽 T莕: ti觰 nha u, h穣 xem s? l頸 h筰 c馻 ta, t ch竬 ch髇g!",
	[19] = "T鑞g qu﹏  ph竔 H醓 Thuy襫 xu蕋 tr薾",
	[20] = "Dng Th蕋 T?: ti觰 t? h穣 xem ta t s筩h doanh tr筰 c馻 ngi y.",
	[21] = "Rng h? tr?  xu蕋 hi謓",
	[22] = "H醓 thuy襫 phe T鑞g  th祅h c玭g t nh藀 doanh trai Li猽, 甶觤 chi課 u c馻 Li猽 qu﹏ gi秏 m筺h.",
	[23] = "H醓 thuy襫 phe Li猽  th祅h c玭g t nh藀 doanh trai T鑞g, 甶觤 chi課 u c馻 T鑞g qu﹏ gi秏 m筺h.",
	[24] = "H醓 thuy襫 phe T鑞g  b? ph? h駓, 甶觤 chi課 u c馻 T鑞g qu﹏ b? gi秏 thi觰",
	[25] = "H醓 thuy襫 phe Li猽  b? ph? h駓, 甶觤 chi課 u c馻 Li猽 qu﹏ b? gi秏 thi觰",
	[26] = "Dng Th蕋 T?  b? nh b筰, 甶觤 chi課 u T鑞g qu﹏ gi秏 15",
	[27] = "Ti猽 T莕  b? nh b筰, 甶觤 chi課 u Li猽 qu﹏ gi秏 15",
}
--=========异常字符串
tSTRING_MISSION_LOG = {
	[1] = "[H秈 Chi課 Long Ch﹗]: b総 u l鏸 kh玭g x竎 nh",
	[2] = "[H秈 Chi課 Long Ch﹗]: FreeDynamicMap l鏸, nRetCode:",
	[3] = "[H秈 Chi課 Long Ch﹗]: LZZ_GetMSPlayerIndex h祄 s? g苝 s? c? s? ngi trong tr薾 doanh so v韎 getn(tIndex) s? lng kh玭g gi鑞g nhau. S? ngi trong tr薾 doanh l?:",
	[4] = "[H秈 Chi課 Long Ch﹗]: LZZ_OperateAllPlayer(), ti誴 d蒼 c馻 ngi ch琲 trong IDTab nh? h琻 ho芻 b籲g 0",
	[5] = "[H秈 Chi課 Long Ch﹗]: kh雐 ng ng nh藀 th蕋 b筰",
	[6] = "[H秈 Chi課 Long Ch﹗]: k? n╪g ID: %d x鉧 th蕋 b筰",
	[7] = "[H秈 Chi課 Long Ch﹗]: x鉧 thuy襫 r錸g th蕋 b筰",
}
--============领航员相关
tSTRING_PILOT_NPC = {
	[1] = "Ta mu鑞 v祇 chi課 trng/begin_fight",
	[2] = "Ta ch? ti謓 阯g gh? ngang/do_nothing",
}

--==========漂流箱相关
tSTRING_FLOAT_BOX = {
	[1] = "Nh薾 頲 hi謚 鴑g: t╪g s竧 thng, duy tr? trong 30 gi﹜, hi謚 qu? kh玭g c閚g d錸.",
	[2] = "Nh薾 頲 hi謚 鴑g: t╪g ph遪g ng?,  duy tr? 30 gi﹜, hi謚 qu? kh玭g c玭g d錸",
	[3] = "Nh薾 頲 hi謚 鴑g: t╪g t鑓  di chuy觧, duy tr? 30 gi﹜, hi謚 qu? kh玭g c玭g d錸.",
	[4] = "Nh薾 頲 hi謚 鴑g: tr筺g th竔 萵 th﹏, duy tr? 30 gi﹜, n誹 chuy觧 sang chi課 u tr筺g th竔 萵 th﹏ s? bi課 m蕋, hi謚 qu? kh玭g c玭g d錸.",
}