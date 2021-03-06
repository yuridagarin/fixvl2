--=============================================
--create by zhangming 2010.7.28
--describe:越南版2010年挑战四灵 字符串文件
--=============================================

VET_201008_02_STR_LOG_TITLE = "Ho箃 ng khi猽 chi課 t? linh";--本次活动日志标题

VET_201008_02_TB_LOG_ACTION_LIST = {
    [1] = "N閜 n hng m閏  nh薾 thng",
    [2] = "Nh薾 n hng m閏",
    [3] = "Nh薾 ph莕 thng ti謈 m鮪g c玭g",
    [4] = "S? d鬾g t? linh l謓h nh薾 頲 ph莕 thng",
    [5] = "Цnh b筰 boss nh薾 頲 t? linh l謓h",
};

VET_201008_02_TB_ITEM_LIST = {
    [1] = {"Уn Hng M閏",2,1,30231},
    [2] = {"T? Linh L謓h",2,1,30232},
};


VET_201008_02_TB_NPC_LIST = {
    [1] = {"L? nng b竛h","T? Linh жnh","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_silingding.lua"},
    [2] = {"Rng ti襫","Уn Hng Rng","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_tanmuxiang.lua"},
    [3] = {"M﹎ c?","Ti謈 m鮪g c玭g c馻 %s","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_qinggongyan.lua"},
};

VET_201008_02_TB_BOSS_LIST = {
    [1] = {"Long T?","Long Th莕 H鉧 Th﹏","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [2] = {"Ph鬾g T?","Ph鬾g Th莕 H鉧 Th﹏","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [3] = {"H? T?","H? Th莕 H鉧 Th﹏","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [4] = {"g T?","g Th莕 H鉧 Th﹏","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
};



VET_201008_02_TB_STR_LIST = {
    [1] = "T? linh nh  xu蕋 hi謓 t筰 %s, ch? v? i hi謕 h穣 chu萵 b? khi猽 chi課 BOSS t? linh",
    [2] = "N閜 s? lng n hng m閏 kh玭g  200 c竔, v? v藋 kh玭g th? k輈h ho箃 頲 BOSS t? linh. Xin h穣 c? g緉g l莕 sau",
    [3] = "Cu鑙 c飊g c騨g n閜  200 n hng m閏, BOSS t? linh  b? k輈h ho箃. M鋓 ngi h穣 chu萵 b? ngh猲h chi課 nh?.",
    [4] = "Ta mu鑞 n閜 n hng m閏",
    [5] = "K誸 th骳 i tho筰",
    [6] = "Х n閜 <color=red>%d/200<color> n hng m閏.",
    [7] = "M鏸 ng祔 m鏸 ngi ch? c? th? n閜 80 n hng m閏. c竎 h?  n閜  80 c竔 r錳 v? v藋 kh玭g th? n閜 th猰 頲 n鱝.",
    [8] = "Х n閜  200 n hng m閏, kh玭g c莕 ph秈 n閜 th猰 n鱝. Xin h穣 i boss xu蕋 hi謓!!!",
    [9] = "Tr猲 h祅h trang c馻 c竎 h?  c? 1 n hng m閏 r錳, kh玭g th? mang th猰 n hng m閏 n鱝.",
    [10] = "C蕄 77 tr? l猲 v?  tham gia m玭 ph竔 m韎 c? th? m? rng n m閏",
    [11] = "%s  b筰 %s, nh薾 頲 t? linh l謓h.",
    [12] = "C蕄 77 tr? l猲 v?  tham gia m玭 ph竔 m韎 c? th? s? d鬾g ti謈 m鮪g c玭g",
    [13] = "H玬 nay c竎 h?  s? d鬾g 9 l莕 ti謈 m鮪g c玭g, v? v藋 kh玭g th? ti誴 t鬰 s? d鬾g.",
    [14] = "C莕 th猰 %d gi﹜ m韎 c? th? s? d鬾g ti誴 ti謈 m鮪g c玭g",
    [15] = "Trong t? linh l謓h 萵 ch璦 huy襫 c?, x竎 nh薾 mu鑞 s? d鬾g t? linh l謓h??",
    [16] = "ng v藋!",
    [17] = "H祅h trang kh玭g  n hng m閏",
    [18] = "C蕄 77 tr? l猲 v?  tham gia m玭 ph竔 m韎 c? th? s? d鬾g t? linh nh",
    [19] = "Rng n m閏 xu蕋 hi謓 r錳.",
    [20] = "T? linh nh c? ch鴄 %d n hng m閏",
    [21] = "Th莕 th? t? linh xu蕋 hi謓, xin h穣 nhanh ch鉵g b総 l蕐.",
    [22] = "Ch骳 m鮪g ch? v?   b筰 th莕 th? t? linh, xin h穣 nhanh ch鉵g chu萵 b?",
};

VET_201008_02_TB_GIVE_QINGGONGYAN_AWARD = {
    {1, 1514, "C琺 chi猲 tr鴑g", {1, 1, 14, 1}, 0},
    {1, 518, "Thi猲 th筩h", {2, 2, 8, 1}, 0},
    {1, 500, "M秐h Thi猲 th筩h", {2, 2, 7, 1}, 0},
    {1, 140, "B╪g th筩h", {2, 1, 149, 1}, 0},
    {1, 10, "T葃 T駓 linh n", {2, 0, 137, 1}, 15 * 24 * 3600},
    {1, 50, "Rng B? K輕", {2, 1, 30093, 1}, 30 * 24 * 3600},
    {1, 50, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
    {1, 200, "Ti猽 Ki誴 t竛", {2, 0, 141, 1}, 15 * 24 * 3600},
    {1, 6, "Rng Tr蕁 Ph竔", {2, 1, 30113, 1}, 30 * 24 * 3600},
    {1, 12, "T? Quang B礽", {2, 0, 762, 1}, 15 * 24 * 3600},
    {1, 1400, "B竛h B閠 v祅g", {1, 1, 15, 1}, 15 * 24 * 3600},
    {1, 1400, "M閏 Lan Xu﹏", {1, 1, 18, 1}, 0},
    {1, 1400, "T﹜ B綾 V鋘g", {1, 1, 19, 1}, 0},
    {1, 1400, "L筩 Mai", {1, 1, 16, 1}, 0},
    {1, 1400, "Minh Nguy謙 D?", {1, 1, 17, 1}, 0},
};

VET_201008_02_TB_GIVE_SILINGLING_AWARD = {
    {2, 73, 500000, 1},
    {1, 6, "T葃 T駓 n", {2, 0, 136, 1}, 15 * 24 * 3600},
    {1, 6, "Rng B? K輕", {2, 1, 30093, 1}, 30 * 24 * 3600},
    {1, 1, "Rng Y誹 Quy誸_Cao C蕄", {2, 1, 30112, 1}, 30 * 24 * 3600},
    {1, 6, "Rng Tr蕁 Ph竔", {2, 1, 30113, 1}, 30 * 24 * 3600},
    {1, 6, "Nguy謙 Hoa Chi Tinh", {2, 1, 3219, 1}, 0},
    {1, 1, "Thi猲 Th筩h linh th筩h", {2, 1, 1068, 1}, 15 * 24 * 3600},
    {3, 1, 10000000, 1},
};



--上交檀香木奖励
VET_201008_02_TB_GIVE_TANXIANGMU_AWARD = {
    {2, 70, 50000, 1},
    {5, 30, 5, 1},
};

VET_201008_02_STR_CITY_NAME = {
    [1] = "Long Tuy襫 Th玭",
    [2] = "V﹏ M閚g Tr筩h",
    [3] = "Йng Bi謓 Kinh",
    [4] = "T﹜ Tuy襫 Ch﹗",
    [5] = "B綾 Tuy襫 Ch﹗",
};



