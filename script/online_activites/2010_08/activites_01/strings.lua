--=============================================
--create by zhangming 2010.7.15
--describe:越南版2010年8月活动1 字符串文件
--=============================================

VET_201008_01_STR_LOG_TITLE = "Hoat dong thang 8 nam 2010";--本次活动日志标题
szTmp = "Nh薾 頲 10 甶觤 T? Quang"

VET_201008_01_TB_LOG_ACTION_LIST = {
    [1] = "Жng nh藀 t苙g c萴 nang i s? ki謓",
    [2] = "Ph莕 thng khi s? d鬾g b竛h kem socola",
    [3] = "Ph莕 thng c bi謙 khi s? d鬾g b竛h kem socola",
    [4] = "Ph莕 thng khi s? d鬾g  2250 b竛h kem socola",
    [5] = "S? d鬾g b筩h kim h錸g bao tr鑞g t苙g b筩h kim i h錸g bao",
};

VET_201008_01_TB_STRING_LIST = {
    [1] = "S? ki謓 th竛g 8 di詎 ra t? ng祔 13/08/2010 n 24 gi? ng祔 12/09/2010. Chi ti誸 c竎 ho箃 ng, xin xem th猰 t筰 trang ch?: http://volam2.zing.vn",
    [2] = "\nTa mu鑞 l祄 1 c竔 B竛h Kem S玞玪a (c莕 5 Nguy猲 li謚 l祄 b竛h + 1 B? quy誸 l祄 b竛h)",
    [3] = "Ta mu鑞 nh薾 ph莕 thng s? d鬾g t鑙 產 B竛h Kem S玞玪a ",
    [4] = "Nguy猲 li謚 mang theo kh玭g , h穣 ki觤 tra l筰 h祅h trang.",
    [5] = "Hi謓 t筰 c竎 h? m韎 s? d鬾g 頲 <color=red><%d/2250><color>",
    [6] = "K誸 th骳 i tho筰",
    [7] = "B竛h kem socola  h誸 h筺 s? d鬾g.",
    [8] = "C竎 h?  ╪  2250 b竛h kem socola r錳, ╪ th猰 s? b? b衞 ? . C竎 h? c? th? nh薾 ph莕 thng n祔 t筰 c萴 nang i s? ki謓",
    [9] = "Ch? c? nh﹏ v藅 c蕄 10 tr? l猲 m韎 c? th? s? d鬾g b竛h kem socola.",
    [10] = "Ho箃 ng  k誸 th骳, v? v藋 c萴 nang i s? ki謓 c騨g h誸 hi謚 l鵦.",
    [11] = "M鏸 nh﹏ v藅 ch? c? th? nh薾 頲 1 l莕 ph莕 thng s? d鬾g b竛h kem n gi韎 h筺 t鑙 產. Ngi  nh薾 ph莕 thng n祔 r錳.",
    [12] = "C竎 h? kh玭g  ti襫  s? d鬾g b筩h kim h錸g bao.",
    [13] = "Ch? c? nh﹏ v藅 c蕄 10 tr? l猲 m韎 c? th? s? d鬾g 頲 b竛h kem socola.",
};

VET_201008_01_TB_ITEM_LIST = {
    [1] = {"Nguy猲 Li謚 L祄 B竛h", 2, 1, 30225},
    [2] = {"B竛h Kem S玞玪a", 2, 1, 30226},
    [3] = {"B? Quy誸 L祄 B竛h", 2, 1, 30227},
    [4] = {"B竎h Kim H錸g Bao (tr鑞g)", 2, 1, 30228},
    [5] = {"B筩h Kim H錸g Bao", 2, 1, 30229},
    [6] = {"Xu", 2, 1, 30230},
};

VET_201008_01_TB_ITEM_LOGINGIVE_LIST = {
    [1] = {"C萴 Nang Чi S? Ki謓", 2, 1, 30045},
};

VET_201008_01_QIAOKELIDANGAO_AWARD = {
    {1, 50, "M秐h Thi猲 th筩h", {2, 2, 7, 1}, 0},
    {1, 50, "Thi猲 th筩h", {2, 2, 8, 1}, 0},
    {4, 60, 10, 1},
    {5, 100, 10, 1},
    {1, 10, "B竧 Nh? Ch鴑g Th?", {2, 1, 30114, 1}, 15 * 24 * 3600},
    {1, 10, "C﹜ B竧 Nh? nh?", {2, 0, 504, 1}, 15 * 24 * 3600},
    {1, 5, "C﹜ B竧 Nh?", {2, 0, 398, 1}, 15 * 24 * 3600},
    {3, 300, 10000, 1},
    {31, 350, "SetTask(GLB_TASK_ZIGUANGGE,GetTask(GLB_TASK_ZIGUANGGE)+10); Msg2Player(szTmp)", 1},          --紫光点
    {1, 10, "T? Quang Kim Thi襫 Ti", {2,0,737,1}, 0},
    {1, 10, "T? Quang K? L﹏ V?", {2,0,736,1}, 0},
    {1, 10, "T? Quang Li謙 Di謒 C萴", {2,0,735,1}, 0},
    {1, 10, "Thng C? K? L﹏ Huy誸", {2,0,739,1}, 0},
    {1, 10, "M秐h Ti謙 Ho祅h Th?", {2,0,738,1}, 0},
    {1, 10, "ч Nguy謙 Th莕 Sa", {2,1,3332,1}, 0},
    {1, 5, "Rng b? k輕", {2,1,30093,1}, 15*24*3600},
};

VET_201008_01_QIAOKELIDANGAO_SPECIAL_AWARD = {
    {15, 350, 60, 1},
    {12, 350, 60, 1},
    {1, 100, "Rng tr蕁 ph竔", {2,1,30113,1}, 15 * 24 * 3600},
    {1, 100, "u h錸", {2, 1, 1157, 1}, 15 * 24 * 3600},
    {1, 40, "Th竔 H?  M藅 Qu? ", {2, 1, 387, 1}, 15 * 24 * 3600},
    {1, 1, "Qu﹏ C玭g Huy Ho祅g", {2, 1, 9977, 1}, 15 * 24 * 3600},
    {1, 4, "Qu﹏ C玭g Чi", {2, 1, 9998, 1}, 15 * 24 * 3600},
    {1, 5, "Qu﹏ C玭g Chng", {2, 1, 9999, 1}, 15 * 24 * 3600},
    {8, 50, 60, 1},
    
};

VET_201008_01_QIAOKELIDANGAO_LIMITED_AWARD = {	
    {1, 2415, "Kh鉳",  {2,1,30180,50}, 0},
    {1, 2415, "L?",  {2,1,30181,50}, 0},
    {1, 2415, "B遪 Bon",  {2,1,30182,50}, 0},
    {1, 2415, "Kh?",  {2,1,30183,50}, 0},
    {1, 10, "B筩h Kim H錸g Bao (tr鑞g)", {2,1,30228,1}, 30 * 24 * 3600},
    {1, 100, "Phi Y猲 Th筩h", {2, 1, 30130, 1}, 0},
    {1, 100, "Thi猲 Th筩h Tinh Th筩h", {2, 1, 1009, 1}, 0},
    {1, 100, "T? Quang Th莕 Th筩h", {2,1,30131,1}, 0},
    {1, 10, "Long T? B鑙", {2,1,30155,1}, 0},
    {1, 10, "Ph鬾g T? B鑙", {2,1,30156,1}, 0},
    {1, 10, "g T? B鑙", {2,1,30158,1}, 0},
};


