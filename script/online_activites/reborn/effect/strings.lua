----------------[话说代码应该是一种艺术]----------------
--------------------------------------------------------
--脚本名称:全局字符串脚本                              |
--脚本功能:全局字符串声明                              |
--功能开发人:刘宇斌                                    |
--功能开发时间:2009-12-28                              |
--主要修改记录:                                        |
--------------------------------------------------------

VIE_201005_REBORN_STR_NpcName = "<color=green>Long Quang Ch﹏ Nh﹏<color>: ";

--npc的对话字符串集合
VIE_201005_REBORN_STR_NpcDialog = {
    --主对话部分
    [0] = {
        [1] = "H玬 nay kh? tng c? v? b蕋 thng, sa m筩 t﹜ b綾 li猲 t鬰 xu蕋 hi謓 y猽 kh? t? ma. Th﹏ l?  t? c馻 c玭 l玭 ta kh玭g th? n祇  tr竎h nhi謒 di謙 tr? ta ma cho k? kh竎 頲. G莕 y b莕 o nghi猲 c鴘 ra c竎h ch? t筼 ra c竎h l祄 cho ngo筰 trang c? u萵 linh, ph鑙 h頿 th猰 g鋓 h錸 cho v? kh?, i hi謕 c? h鴑g th? xem kh玭g?",
        [2] = "Ta mu鑞 xem v? kh? c hi謚",
        [3] = "Ta mu鑞 xem ngo筰 trang u萵 linh",
        [4] = "Ta ch? n h醝 th╩ s鴆 kh醗 c馻 o trng",
    },
    --[1]武器特效部分
    [1] = {
        [1]  = "B莕 o ch? thi tri觧 ph竝 thu藅 v韎 nh鱪g h祇 ki謙 <color=yellow> gia nh藀 m玭 ph竔<color>.",
        [2]  = "Xin h穣 mang 蕁 trng c馻 m玭 h閕 n y, ch? c? gia nh藀 m玭 h閕 m韎 c? th? n y u萵 linh.",
        [3]  = "Цnh th鴆 linh ph竎h c馻 v? kh?",
        [4]  = "H駓 linh ph竎h c馻 binh kh?",
        [5]  = "Cho ta xem m閠 輙 d? li謚 li猲 quan n linh n╪g v? linh ph竎h",
        [6]  = "Ta ch? n h醝 th╩ s鴆 kh醗 c馻 o trng",
        [7]  = "C玭 L玭 c? m閠 lo筰 o thu藅 c? th? c╪ c? t? ch蕋 c馻 h祇 ki謙 thi猲 h? nh th鴆 <color=yellow>linh ph竎h<color>?l祄 cho v? kh? ph竧 sang ng th阨 t╪g th猰 uy l鵦. V? i hi謕 n祔 c? th? t? ch蕋 c馻 m譶h n u kh玭g?",
        [8]  = "Trc ti猲 i hi謕 ph秈 t譵 m閠 v? kh? v鮝 tay r錳 m韎 t譵 ta nh?!",
        [9]  = "<color=yellow>%s<color>  h誸  b襫 r錳, kh玭g th? th鴆 t豱h <color=yellow>linh ph竎h<color> 頲.",
        [10] = "<color=yellow>%s<color>  t錸 t筰 linh ph竎h <color=yellow>%s<color>, trc ti猲 h穣 b? v? thay th? <color=yellow>linh ph竎h<color> m韎 nh?!",
        [11] = "C? t? ch蕋 tng 鴑g c? th? th鴆 t豱h <color=yellow>linh ph竎h<color> tng 鴑g. L骳 b莕 o thi ph竝 gi髉 ngi th鴆 t豱h <color=yellow>linh ph竎h<color> xong, i hi謕 ch? c莕 b蕀 v祇 bi觰 tng <color=yellow>ho竛 linh<color> tr猲 v? kh? th? c? th? nh th鴆 linh ph竎h c馻 v? kh? . Sau khi ho竛 linh xong xin h穣 gi? g譶 b秓 v藅 c馻 ch輓h m譶h,  b猲 c馻 v? kh? h? xu鑞g <color=red>0<color> th? linh ph竎h c騨g s? bi課 m蕋",
        [12] = "Ta mu鑞 nh th鴆 linh ph竎h %s",
        [13] = "Trang k?",
        [14] = "Trang trc",
        [15] = "Чi hi謕 c? th? nh th鴆 linh ph竎h nh? b猲 di:",
        [16] = "Чi hi謕 c莕 r蘮 luy謓 th猰 n鱝, t? ch蕋 hi謓 t筰 c馻 c竎 h? v蒼 ch璦  g鋓 t豱h m閠 lo筰 linh ph竎h n祇. B蕀 v祇 hng d蒼 v? t? ch蕋  bi誸 r? h琻.",
        [17] = "Ta mu鑞 nh th鴆 lo筰 linh ph竎h n祔",
        [18] = "в ta suy ngh? l筰",
        [19] = "C竎 h? mu鑞 th鴆 t豱h linh ph竎h: <color=yellow>%s<color>; c莕 ti猽 hao: %s. Th阨 gian t錸 t筰 c馻 linh ph竎h: <color=yellow>%d<color> ng祔. C竎 h? c? th? b蕀 bi觰 tng <color=yellow>ho竛 linh<color> tr猲 v? kh?  nh th鴆 linh ph竎h. Ch? ?: N誹 nh? t? ch蕋 ch璦   g鋓 h錸 th? ng g鋓 h錸. Ngo礽 ra h穣 gi? g譶 c萵 th薾 th莕 binh. M閠 khi  b襫 xu鑞g 0, linh ph竎h s? t? ng bi課 m蕋. L骳  ph秈 g苝 ta  l祄 l筰. X竎 nh薾 mu鑞 g鋓 t豱h linh ph竎h n祔 kh玭g?",
        [20] = "Ch骳 m鮪g c竎 h?  th祅h c玭g th猰 c hi謚 cho v? kh? <color=yellow>%s<color>!T筰 <color=yellow>h譶h l韓 v? kh? b猲 g鉩 di tr竔<color>, b蕀 v祇 n髏 m祏   hoan linh, c? th? nh th鴆 <color=yellow>linh ph竎h<color>. N髏 t総  g鋓 t豱h <color=yellow>linh ph竎h<color>: <color=red>F<color> !",
        [21] = "Giang h? n r籲g, %s d飊g t? ch蕋 thi猲 b萴 g鋓 t豱h linh ph竎h c馻 v? kh?: %s, th藅 kh玭g h? danh v╪ v? song to祅!",
        [22] = "ng a v韎 b莕 o, ta kh玭g th? th蕐 頲 <color=yellow>Linh ph竎h<color> tr猲 v? kh? c馻 ngi.",
        [23] = "<color=yellow>V? kh?<color> c馻 b筺  b? kh鉧, m? kh鉧 trc r錳 m韎 n b莕 o thng lng x鉧 b? Linh ph竎h!",
        [24] = "Ta suy ngh? r錳",
        [25] = "C竎 h? x竎 nh薾 mu鑞 b? linh kh? <color=yellow>%s<color> c馻 v? kh? 產ng c莔?  Ti猽 h駓 c? ngh躠 l? h駓 b? linh kh? v? c竎 tr筺g th竔 h? tr? u b? m蕋! H穣 suy ngh? trc khi l祄 nh?!",
        [26] = "H? h?, i hi謕 tr竜 i v? kh? nhanh th藅 y, nh璶g kh玭g qua n鏸 m総 l穙 phu u! Th﹏ l? i hi謕 quang minh l蓎 l筩 th? ng n猲 l祄 nh鱪g vi謈 nh? v藋 nh?.",
        [27] = "<color=yellow>%d<color> v祅g;",
        [28] = "<color=yellow>%d<color> <color=yellow>%s<color>;",
        [29] = "Kh玭g  <color=yellow>%d<color> v祅g, hay l?  qu猲 ? rng ch鴄  r錳?",
        [30] = "C竎 h? mang <color=yellow>%s<color> kh玭g  <color=yellow>%d<color>, hay l? qu猲 ? rng ch鴄  r錳?",
    },
    --[2]指导信息
    [2] = {
        [1] = "L祄 th? n祇  th鴆 t豱h linh ph竎h",
        [2] = "C蕄 b薱 linh ph竎h, m祏 s綾",
        [3] = "襲 ki謓 th鴆 t豱h linh ph竎h",
        [4] = "L祄 th? n祇  th鴆 t豱h linh n╪g",
        [5] = "T竎 d鬾g c馻 linh n╪g",
        [6] = "Ta  hi觰 r? r錳",
        [7] = "V? v蕁  linh ph竎h v? linh n╪g c? th? h醝 ta, ngi mu鑞 t譵 hi觰 v蕁  g??",
        [8] = "<color=yellow>Linh ph竎h<color> l? 1 lo筰 v? kh? ph竧 s竛g, n誹 nh? ch? nh﹏ c? t? ch蕋 t n m閠 甶襲 ki謓 nh蕋 nh c? th? th鴆 t豱h n?. N誹 nh? th鴆 t豱h xong m? t? ch蕋 kh玭g  y猽 c莡 c馻 <color=yellow>linh ph竎h<color>, th? s? kh玭g th? th鴆 t豱h 頲, ch? c? t? ch蕋  y猽 c莡 <color=yellow>linh ph竎h<color> m韎 c? th? th鴆 t豱h 頲. <color=yellow>Linh n╪g <color>v? <color=yellow>linh ph竎h<color> tng sinh, m鏸 <color=yellow>linh ph竎h<color> s? c? <color=yellow>linh n╪g<color> kh玭g gi鑞g nhau. Ch? c? <color=yellow> linh ph竎h <color> th鴆 t豱h xong th? <color=yellow>linh n╪g<color> m韎 c? th? ph竧 huy t竎 d鬾g. M鏸 <color=yellow>linh ph竎h<color> nhi襲 nh蕋 ch? duy tr? 頲 <color=red>30<color> ng祔,n誹 nh? <color=yellow>linh ph竎h <color>bi課 m蕋, th? <color=yellow>linh n╪g <color> c騨g bi課 m蕋 theo. L骳  n t譵 b莕 o  th鴆 t豱h l筰 linh ph竎h  m蕋. Ngo礽 ra,  b襫 c馻 v? kh? b籲g <color=red>0<color> th? linh ph竎h c騨g bi課 m蕋 theo",
        [9] = "M鏸 lo筰 <color=yellow>linh ph竎h<color> c? c竎 c蕄 v? m祏 s綾 nh? b猲 di:",
        [10]= "\n<color=yellow>linh ph竎h-<color>%s, c? h筺 d飊g %d ng祔;",
        [11]= "M鏸 lo筰 <color=yellow>linh ph竎h<color> c莕 t? ch蕋 v? nguy猲 li謚:",
        [12]= "\n<color=yellow>%s<color>: 甶襲 ki謓 t? ch蕋: %s, c莕 nguy猲 li謚: %s",
        [13]= "<color=yellow>linh ph竎h<color> th鴆 t豱h xong, linh n╪g s? ph竧 huy t竎 d鬾g ngay. Ngc l筰 <color=yellow>linh ph竎h <color>bi課 m蕋 th? <color=yellow>linh n╪g<color> c騨g bi課 m蕋 theo. L骳  th? h穣 t譵 n b莕 o  th鴆 t豱h l筰 nh?",
        [14]= "T竎 d鬾g c馻 <color=yellow>linh n╪g<color> l? th猰 thu閏 t輓h, bao g錷 t╪g lng m竨 cao nh蕋 v? kh竛g t蕋 c?. C? th? <color=yellow>linh ph竎h<color> tng 鴑g c? <color=yellow>linh n╪g<color> t╪g th猰:",
        [15]= "\n<color=yellow>%s<color> linh n╪g tng 鴑g: t╪g lng m竨 cao nh蕋 %d, t╪g kh竛g t蕋 c? %d;",
    },
    --[3]蕴灵外装部分
    [3] = {
        [1] = "<color=red>Ta c? th? g緉 u萵 linh cho ngo筰 trang g錷: T? nh?, T? 竜, trang ph鬰 Nguy猲 Цn, trang ph鬰 B竧 B竧, trang ph鬰 chuy觧 sinh <color>nh? kh玭g 頲  m芻 sai y. Ta c? th? gi髉 g? 頲?",
        [2] = "Ta mu鑞 giao ngo筰 trang u萵 linh.",
        [3] = "Ta mu鑞 nh薾 ngo筰 trang u萵 linh",
        [4] = "Ta mu鑞 xem th玭g tin c馻 ngo筰 trang u萵 linh",
        [5] = "Ngi mu鑞 giao lo筰 ngo筰 trang u萵 linh n祇? Ch? ? m鏸 lo筰 ngo筰 trang ch? 頲 1 u萵 linh 1 lo筰 thu閏 t輓h, thu閏 t輓h m韎 s? thay th? thu閏 t輓h c?, sau khi u萵 linh v祇 ngo筰 trang th? ch? t錸 t筰 30 ng祔. <color=red>Ngo筰 trang c? u萵 linh th? s? kh玭g 頲 giao d辌h<color>.",
        [6] = "N鉵",
        [7] = "A?",
        [8] = "Qu莕",
        [9] = "Ngi v蒼 ch璦 mang tr猲 ngi [<color=yellow>%s<color>], h穣 kho竎 l猲 ngi r錳 quay l筰 t譵 ta!",
        [10]= "<color=yellow>%s<color>  kh鉧, h穣 m? kh鉧 r錳 ti課 h祅h u萵 linh!",
        [11]= "ч b襫 trang b? c馻 ngi l? <color=red>0<color>, kh玭g th? g緉 linh t輓h!",
        [12]= "<color=red>Ta c? th? g緉 u萵 linh cho ngo筰 trang g錷: T? nh?, T? 竜, trang ph鬰 Nguy猲 Цn, trang ph鬰 B竧 B竧, trang ph鬰 chuy觧 sinh <color> N誹 kh玭g c? th? h穣 t譵 xem ? Ng? C竎.",
        [13]= "Ngi mu鑞 [<color=yellow>%s<color>] c? thu閏 t輓h u萵 linh c蕄 m蕐?",
        [14]= "Ngi v蒼 ch璦 gia nh藀 m玭 h閕, <color=yellow>%s<color> s? t╪g th猰 hi謚 鴑g <color=yellow>%s<color>",
        [15]= "Ngi  gia nh藀 m玭 h閕 [<color=yellow>%s<color>], <color=yellow>%s<color> s? t╪g th猰 hi謚 鴑g <color=yellow>%s<color>",
        [16]= "<color=yellow>%s<color>  c? u萵 linh r錳, x竎 nh薾 mu鑞 thay i thu閏 t輓h u萵 linh m韎?",
        [17]= "Ta ng ? g緉 linh t輓h ch錸g",
        [18]= "Ngo筰 trang c蕄 %d thu閏 t輓h (%s)",
        [19]= "Kh玭g  <color=yellow>%d<color> v祅g, hay l?  qu猲 ? rng ch鴄  r錳?",
        [20]= "C莕: <color=yellow> %d <color> v祅g;",
        [21]= "X竎 nh薾 mu鑞 d飊g thu閏 t輓h ngo筰 trang u萵 linh <color=yellow>%s<color> c蕄 <color=yellow>%d<color>? C莕 ti猽 hao: %s\n ",
        [22]= "Ngi v蒼 ch璦 m芻 <color=yellow>%s<color> l猲 ngi! H穣 mang l猲 ngi r錳 n t譵 ta nh?!",
        [23]= "Ch骳 m鮪g i hi謕  u萵 linh th祅h c玭g [<color=yellow>%s<color>]!",
        [24]= "Чi hi謕 %s ? %s u萵 linh c蕄 %d %s, th藅 l? ng n? ph鬰!",
        [25]= "Чi hi謕 mu鑞 h駓 b? thu閏 t輓h 頲 衟 [<color=yellow>%s<color>? Thu閏 t輓h c馻 ngo筰 trang  h駓 b? th? kh玭g th? kh玦 ph鬰 l筰, ch? c? th? n ch? ta l祄 l筰 thu閏 t輓h u萵 linh m韎 頲. Чi hi謕 n猲 suy ngh? c萵 th薾 nha!",
        [26]= "Ta ch? n h醝 th╩ s鴆 kh醗 c馻 o trng",
        [27]= "в ta suy ngh? l筰",
        [28]= "X竎 nh薾, ta  suy x衪 k? r錳",
        [29]= "Ngi v蒼 ch璦 chuy觧 sinh, ngi ch琲  chuy觧 sinh s絥 c? nh鱪g linh kh? c馻 tr阨 t m筺h h琻 b譶h thng, v? v藋 m韎 c? th? ch? t筼 nh鱪g ngo筰 trang c? thu閏 t輓h 頲. Ta c? th? gi髉 ngi l祄 ra nh鱪g ngo筰 trang c? lo筰 thu閏 t輓h nh? sau:",
        [30]= "Ngi v蒼 ch璦 gia nh藀 m玭 h閕, ki課 ngh? h穣 gia nh藀 m玭 h閕 trc , m鏸 m閠 lo筰 m玭 h閕 s? c? nh鱪g lo筰 thu閏 t輓h nh蕋 nh. Ta c? th? gi髉 ngi l祄 ra nh鱪g ngo筰 trang c? lo筰 thu閏 t輓h nh? sau: ",
        [31]= "Ngi  gia nh藀 m玭 h閕 [<color=yellow>%s<color>], ta c? th? gi髉 ngi l祄 ngo筰 trang c? nh鱪g lo筰 thu閏 t輓h sau:",
        [32]= "Ngo筰 trang ph? th玭g c? thu閏 t輓h",
        [33]= "Ngo筰 trang m玭 h閕 c? thu閏 t輓h",
        [34]= "C竎 h? mang <color=yellow>%s<color> kh玭g  <color=yellow>%d<color>, hay l? qu猲 ? rng ch鴄  r錳?",
        [35]= "<color=yellow>%d<color> <color=yellow>%s<color>;",
        [36]= "Ngi mu鑞 h駓 thu閏 t輓h c馻 ngo筰 trang n祇? H駓 thu閏 t輓h c馻 ngo筰 trang kh玭g th? ph鬰 h錳 l筰 頲, mu鑞 ph鬰 h錳 ch? c? c竎h n ta u萵 linh l筰 m韎 頲. Чi hi謕 n猲 suy ngh? k??",
        [37]= "Ngo筰 trang ph? th玭g c? thu閏 t輓h ch? 頲 ch鋘 1 trong s? <color=yellow>s鴆 m筺h, n閕 c玭g, g﹏ c鑤, th﹏ ph竝, linh ho箃<color>, ngi mu鑞 [%s] u萵 linh lo筰 thu閏 t輓h n祇?",
        [38]= "Ngi mu鑞 [%s] u萵 linh  thu閏 t輓h c蕄 m蕐 <color=yellow>%s<color>?"
    },
    --guide部分对话
    [4] = {
        [1]= "Linh t輓h ",
        [2]= "C莕 nh鱪g nguy猲 li謚 n祇",
        [3]= "Ngi mu鑞 t譵 hi觰 phng di謓 n祇 c馻 ngo筰 trang u萵 linh?",
        [4]= "Ai c? th? ti課 h祅h u萵 linh ngo筰 trang",
        [5]= "T蕋 c? ngi ch琲 u c? th? u萵 linh ngo筰 trang. <color=yellow>Ngi ch琲  chuy觧 sinh v?  gia nh藀 m玭 h閕 <color>th? c? th? u萵 linh c蕄 cao h琻, m鏸 m玭 h閕 u c? m閠 lo筰 thu閏 t輓h c th?",
        [6]= "Nguy猲 li謚 c馻 u萵 linh u c莕 ph秈 th玭g qua th竚 hi觤 t﹜ v鵦 m韎 c? 頲, m鏸 c蕄 s? y猽 c莡 lo筰 nguy猲 li謚 kh玭g gi鑞g nhau: \n",
        [7]= "C蕄 <color=red>%d<color> c莕:",
        [8]= "<color=yellow>%d v祅g<color>;",
        [9]= "Lo筰 u萵 linh 頲 ph﹏ lo筰: <color=yellow>thu閏 t輓h ngo筰 trang ph? th玭g<color> v?<color=yellow> thu閏 t輓h ngo筰 trang m玭 h閕<color>. Thu閏 t輓h ngo筰 trang m玭 h閕 y猽 c莡 ngi ch琲 ph秈 chuy觧 sinh v?  gia nh藀 m玭 h閕. Chi ti誸 xin h穣 tham kh秓 th玭g tin tr猲 trang ch? v? l﹎ truy襫 k? 2.",
        [10]= "<color=yellow>%d<color> <color=yellow>%s<color>;",
        [11]= "Ta  hi觰 r? r錳",
    },
};

VIE_201005_REBORN_STR_LogTitle = {
    --武器蕴灵
    [1] = {
        [1] = "[hi謚 qu? c bi謙 v? kh? chuy觧 sinh:]",
    },
    --外装蕴灵
    [2] = {
        [1] = "[Hi謚 qu? c bi謙 c馻 ngo筰 trang chuy觧 sinh:]",
    },
};

VIE_201005_REBORN_STR_LogAction = {
    --公共部分
    [0] = {
        [1] = " th祅h c玭g ",
        [2] = "Th蕋 b筰",
    },
    --武器蕴灵
    [1] = {
        [1] = "Ch? t筼 hi謚 鴑g c bi謙 %s",
        [2] = "T╪g th猰%d c蕄 c馻 lo筰 %d linh n╪g",
        [3] = "X鉧 linh n╪g,ID l?: %d",
    },
    --外装蕴灵
    [2] = {
        [1] = "K蘭 theo thu閏 t輓h ma ph竝 c蕄 %d",
    },
};

--//VIE_201005_REBORN_TB_WeaponEffectInfo
VIE_201005_REBORN_TB_WeaponEffectInfo_STR_1 = {
    [1] = "Thi誸 C鑤",
    [2] = "L筩 H?",
    [3] = "B竎h Chi課",
    [4] = "Chc Nh藅",
    [5] = "Tu蕁 D藅",
    [6] = "Уo L?",
    [7] = "Danh T骳",
    [8] = "L╪g Ti猽",
    [9] = "Ph莕 V﹏",
    [10]= "筺 Giao",
    [11]= "Tinh Di",
    [12]= "Ph? Qu﹏",
    [13]= "H祇 m玭",
};

VIE_201005_REBORN_TB_WeaponEffectInfo_STR_2 = {
    [1] = "Thi誸 c鑤, h祇 quang xanh nh箃 (linh ph竎h c蕄 1)",
    [2] = "L筩 H?, sng m? m祏 t輒 v? qu莕g s竛g m祏 xanh (linh ph竎h c蕄 2)",
    [3] = "B竎h chi課, sng m? m祏  (linh ph竎h c蕄 2)",
    [4] = "Chc nh藅, sng m? m祏 v祅g (linh ph竎h c蕄 2)",
    [5] = "Tu蕁 d藅, sng m? m祏 xanh (linh ph竎h c蕄 2)",
    [6] = "Уo l?, sng m? m祏 xanh l鬰 (linh ph竎h c蕄 2)",
    [7] = "Danh t骳, Sng m? m祏 n﹗ (linh ph竎h c蕄 2)",
    [8] = "L╪g ti猽, sng m? m祏 t輒 v? tia ch韕 xanh l鬰 (linh ph竎h c蕄 3)",
    [9] = "Ph莕 v﹏, sng m? m祏 t輒 v? tia ch韕 m祏 v祅g (linh ph竎h c蕄 3)",
    [10]= "筺 giao, 竛h quang m祏  r阨 r筩 (linh ph竎h c蕄 3)",
    [11]= "Tinh d辌h, 竛h quang m祏 t輒 r阨 r筩 (linh ph竎h c蕄 3)",
    [12]= "Ph? qu﹏, 竛h quang t? m祏 t輒 (Linh ph竎h c蕄 4)",
    [13]= "H祇 m玭, 竛h quang t? m祏 v祅g (Linh ph竎h c蕄 4)"
};

VIE_201005_REBORN_TB_WeaponEffectInfo_STR_3 = {
    [1] = "ng c莔 v? kh? cng h鉧 t? <color=yellow>8<color> n <color=yellow>10<color>",
    [2] = "B秐g x誴 h筺g m玭 ph竔 th? <color=yellow>1<color>",
    [3] = "觤 PK t n (qu?) <color=yellow>10<color>",
    [4] = "ng c莔 v? kh? c? cng h鉧 t? <color=yellow>11<color> n <color=yellow>12<color>",
    [5] = "Danh v鋘g ho芻 c鑞g hi課 s? m玭 t n (qu?) <color=yellow>15000<color>",
    [6] = "ng c莔 v? kh? cng h鉧 n <color=yellow>13<color>",
    [7] = "<color=yellow>Ti猲 phong<color> 琻g tri襲",
    [8] = "<color=yellow>Tng qu﹏<color> 琻g tri襲",
    [9] = "ng c莔 v? kh? cng h鉧 n <color=yellow>14<color>",
    [10]= "<color=yellow>Nguy猲 so竔<color> 琻g tri襲",
    [11]= "<color=yellow>Th祅h ch?<color> 琻g tri襲",
    [12]= "ng c莔 v? kh? cng h鉧 n <color=yellow>15<color>",
    [13]= "K輈h ho箃 1 trong <color=yellow>4 蕁<color>(Long Ph鬾g H? g)",
};

--head文件中VIE_201005_REBORN_TB_MaterialInfo表第4列信息
VIE_201005_REBORN_STR_MaterialInfo = {
    [1] = "Nh蕋 Thi觤 Y猽 Ho祅g",
    [2] = "Tam Di謚 Long Hi",
    [3] = "ч Nguy謙 Th莕 Sa",
    [4] = "Ph莕 Quang Th莕 Sa",
    [5] = "Tr秏 Tinh Th莕 Sa",
    [6] = " Ng? Th竔 Lung T髖",
    [7] = "Th蕋 Huy襫 T? V╪",
    [8] = "Gi竚 nh ph? c蕄 7",
    [9] = "B祅 Long b輈h",
};

VIE_201005_REBORN_TB_RebornStamper_STR = {
    [1] = "Long t? 蕁",
    [2] = "H? t? 蕁",
    [3] = "g t? 蕁",
    [4] = "Ph鬾g t? 蕁",
};

VIE_201005_REBORN_TB_RebornSchool_STR = {
    [1] = "Long T? H閕",
    [2] = "H? T? H閕",
    [3] = "g T? H閕",
    [4] = "Ph鬾g  T? H閕",
};

VIE_201005_REBORN_TB_ClothEffectAttr_STR = {
    [1] = "T蕋 c? thu閏 t輓h t╪g",
    [2] = "S竧 thng n閕 ngo筰 c玭g ph莕 tr╩ t╪g ",
    [3] = "S竧 thng c玭g k輈h t╪g ",
    [4] = "ч ch輓h x竎 s竧 thng t╪g ",
    [5] = "X竎 su蕋 xu蕋 chi猽 t╪g ",
    [6] = "Th阨 gian h? tr? c玭g k輈h ph莕 tr╩ t╪g ",
    [7] = "T? l? ch辵 n gi秏 n鯽",
    [8] = "Th阨 gian h? tr? ph遪g ng? ph莕 tr╩ t╪g ",
    [9] = "Ph遪g ng? n閕 ngo筰 c玭g t╪g ",
    [10]= "Sinh l鵦 t╪g t鑙 產 ",
    [11]= "N閕 l鵦 t╪g t鑙 產 ",
    [12]= "C玭g k輈h k蘭 s竧 thng c ",
    [13]= "X竎 su蕋 c玭g k輈h b? qua ph遪g ng? i phng ",
    [14]= "S鴆 m筺h t╪g ",
    [15]= "N閕 c玭g t╪g ",
    [16]= "G﹏ c鑤 t╪g ",
    [17]= "Th﹏ ph竝 t╪g ",
    [18]= "Linh ho箃 t╪g ",
};
