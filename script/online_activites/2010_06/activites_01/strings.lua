--=============================================
--create by zhoulimei 2010.5.11
--describe:越南版2010年6月活动1 字符串文件
--=============================================

VET_201006_01_STR_LOG_TITLE = "Ho箃 ng 06/2010";--本次活动日志标题
VET_201006_01_STR_NPC_NAME = "<color=green>".."Con trai th? r蘮 L璾: ".."<color>";
VET_201006_01_TB_LOG_ACTION = {
      [1] = "Ch? bi課 tr竔 c﹜ th祅h c s秐",
      [2] = "Nh薾 thng khi  t s? l莕 s? d鬾g c S秐 t鑙 產",
      [3] = "X鉧 m﹎ tr竔 c﹜ th蕋 b筰",
      [4] = "X鉧 c萴 nang ch? bi課 th蕋 b筰",
      [5] = "T苙g c s秐 tr竔 c﹜ cho con th? r蘮 l璾, nh薾 ph莕 thng",
      [6] = "S? d鬾g c s秐 tr竔 c﹜ nh薾 ph莕 thng",
      [7] = "S? d鬾g %d l莕 c s秐 tr竔 c﹜ nh薾 ph莕 thng",
      
};

VET_201006_01_TB_STRING = {
    [1] = "S? ki謓 m颽 h? n╩ nay di詎 t? ng祔 <color=yellow>28-05-2010<color> n 24 gi? ng祔 <color=yellow>04-07-2010<color>. Th玭g tin chi ti誸, ng o c? th? xem th猰 t筰 trang ch? <color=green>http://volam2.zing.vn<color>",
    [2] = "\nCh? bi課 tr竔 c﹜ th祅h c s秐 (c莕 6 M﹎ Tr竔 C﹜ + 1 C萴 Nang Ch? Bi課)",
    [3] = "Nh薾 thng khi  t s? l莕 s? d鬾g c S秐 t鑙 產",
    [4] = "T苙g c s秐 cho Con Trai Th? R蘮 L璾",
    [5] = "K誸 th骳 i tho筰",
    [6] = "B? mu鑞 ╪ b竛h tr竔 c﹜ (c莕 10 c竔)",
    [7] = "B? mu鑞 ╪ kem tr竔 c﹜ (c莕 10 c竔)",
    [8] = "B? mu鑞 ╪ m鴗 tr竔 c﹜ (c莕 10 c竔)",
    [9] = "B? mu鑞 u鑞g nc tr竔 c﹜ (c莕 10 ly)",
    [10] = "H譶h nh? ta qu猲 mang theo c s秐",
    [11] = "Чi hi謕 mang kh玭g  nguy猲 li謚 ?.",
    [12] = "Kh玭g  y猽 c莡 nh薾 thng. S? l莕 s? d鬾g c s秐: <color=yellow>[%d/1500]<color>",
    [13] = "C竎 h?  nh薾 thng r錳, trong th阨 gian ho箃 ng ch? nh薾 頲 1 l莕.",
    [14] = {"Ch祇 s? huynh", "Ch祇 s? t?"},
    [15] = {"Sao  kh玭g nh譶 th蕐 g? h誸 v藋! Huynh ng l鮝 g箃  m? ? hu hu.", "Sao  kh玭g nh譶 th蕐 g? h誸 v藋! T? ng l鮝 g箃  m? ? hu hu."},
    [16] = "芻 芻 ? Xin l鏸 , ta qu猲 mang theo.",
    [17] = "H玬 nay ti觰   no r錳, ng祔 mai l筰 ti誴 t鬰 nh?! Hihi",
    [18] = "уng ?, ng祔 mai ta ti誴 t鬰. ",
    [19] = {"S? huynh t譵 ta c? vi謈 g??", "S? t? t譵 ta c? vi謈 g??"},
    [20] = "Ph秈 c蕄 10 tr? l猲 m韎 t苙g 頲!",
    [21] = "V藅 ph萴 n祔  qu?  h筺 s? d鬾g",
    [22] = "Ngi  s? d鬾g c s秐 1500 l莕 r錳, kh玭g th? s? d鬾g th猰 n鱝!",
    [23] = "Ph秈 c蕄 10 tr? l猲 m韎 c? th? s? d鬾g! Чi hi謕 h穣 c? l猲 nh?!",
    [24] = "H玬 nay  s? d鬾g 8 v? l﹎ m藅 蕁 r錳 (b蕋 k? lo筰 n祇), kh玭g th? s? d鬾g th猰",
    
};
--合成各种特产获得 基数 100  背包 1， 负重 0
VET_201006_01_TECHAN_HECHEN = {
    {1, 25, "B竛h tr竔 c﹜", {2,1,30194,1}, 0},
    {1, 25, "Kem tr竔 c﹜", {2,1,30195,1}, 0},
    {1, 25, "M鴗 tr竔 c﹜", {2,1,30196,1}, 0},
    {1, 25, "Nc tr竔 c﹜", {2,1,30197,1}, 0},
    
 };

--每次使用特产奖励表 基数1000   背包 1 ， 负重  1
VET_201006_01_USETECHAN_AWARD_LIST = {
    {1, 200, "L? th駓", {2, 0, 351, 1}, 0},
    {1, 80, "Thi猲 th筩h", {2, 2, 8, 1}, 0},
    {1, 60, "M秐h Thi猲 th筩h", {2, 2, 7, 1}, 0},
    {1, 20, "Tu Ch﹏ Y誹 Quy誸", {2, 0, 554, 1}, 15*24*60*60},
    {1, 20, "B竧 Nh? Ch鴑g Th?", {2, 1, 30114, 1}, 15*24*60*60},
    {1, 5, "T? H? M藅 t辌h", {0, 107, 65, 1}, 0},
    {1, 5, "Thi猲 H? M藅 t辌h", {0, 107, 64, 1}, 0},
    {1, 5, "Chi猰 Y Ph?", {0, 107, 66, 1}, 0},
    {1, 5, "C﹜ B竧 Nh? nh?", {2, 0, 504, 1}, 15*24*60*60},
    {1, 5, "C﹜ B竧 Nh?", {2, 0, 398, 1}, 15*24*60*60},
    {3, 200, 40000, 1},
    {2, 100, 1, 1},
    {4, 100, 4, 1},
    {5, 100, 4, 1},
    {14, 40, 60, 1},
    {11, 40, 60, 1},
    {7, 15, 60, 1},
};


--每次50次使用特产奖励表 基数10000  背包1 ， 负重 2
VET_201006_01_USETECHAN_AWARD_LIST_50 = {
    {1, 2000, "Th竔 H?  M藅 Qu? ", {2, 1, 387, 1}, 15*24*60*60},
    {1, 2000, "T祅g ki誱 anh h飊g thi誴", {2, 0, 31, 1}, 15*24*60*60},
    {1, 1000, "M╪g c魌", {2, 1, 30168, 1}, 0},
    {1, 1000, "Bi", {2, 1, 30169, 1}, 0},
    {1, 1000, "D﹗", {2, 1, 30170, 1}, 0},
    {1, 1000, "Chu鑙", {2, 1, 30171, 1}, 0},
    {1, 775, "u h錸", {2, 1, 1157, 1}, 15*24*60*60},
    {1, 400, "Rng B? K輕", {2, 1, 30093, 1}, 15*24*60*60},
    {1, 400, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
    {1, 200, "Rng Tr蕁 Ph竔", {2, 1, 30113, 1}, 15*24*60*60},
    {1, 100, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 15*24*60*60},
    {1, 50, "Rng Y誹 Quy誸_Cao C蕄", {2, 1, 30112, 1}, 15*24*60*60},
    {1, 25, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 15*24*60*60},
    {1, 25, "Phi Y猲 Th筩h", {2, 1, 30130, 1}, 0},
    {1, 25, "T? Quang Th莕 Th筩h", {2, 1, 30131, 1}, 0},
};

--特产使用上限奖励表 基数10000  背包 1 ， 负重 1
VET_201006_01_USETECHAN_AWARD_LIST_UP  = {
    {1, 2225, "Nh﹏ S﹎ V筺 N╩", {2, 1, 30071, 1}, 0},
    {1, 1000, "D鮝", {2, 1, 30167, 4}, 0},
    {1, 100, "Ho祅g Kim Чi H錸g Bao (tr鑞g)", {2, 1, 538, 1}, 15*24*60*60},
    {1, 100, "T? Kim H錸g Bao (tr鑞g)", {2, 1, 536, 1}, 15*24*60*60},
    {1, 25, "Thi猲 Th筩h linh th筩h", {2, 1, 1068, 1}, 15*24*60*60},
    {1, 25, "мnh H錸 Thi猲 Th筩h Th莕 Th筩h", {2, 1, 1067, 1}, 15*24*60*60},
    {1, 25, "L╪g Ba Vi B?", {0, 112, 78, 1}, 0},
    {3, 5000, 1000000, 1},
    {3, 1000, 10000000, 1},
    {3, 500, 20000000, 1},
};

--赠送给刘铁匠儿子 奖励 基数100  背包1， 负重 1
VET_201006_01_GIVETOSON_AWARD  = {
    {3, 50, 300000, 1},
    {2, 25, 1, 1},
    {1, 25, "D鮝", {2, 1, 30167, 2}, 0},
};

VET_201006_01_ITEM_LOGIN_GIVE = {"C萴 Nang Чi S? Ki謓", {2, 1, 30045}};

VET_201006_01_SHUIGUOPAN = {"M﹎ tr竔 c﹜", {2,1,30192}};
VET_201006_01_ZHIZUOJINGNANG = {"C萴 nang ch? bi課", {2,1,30193}};
VET_201006_01_NPCINDEX = {"уng t?1", "Con trai th? r蘮 L璾", 350, 1417, 2932};