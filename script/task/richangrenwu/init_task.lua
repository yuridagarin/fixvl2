--=============================================
--create by baiyun 2009.12.14
--describe:越南版武林使者日常任务 初始化任务文件
--=============================================
--注意此文件中的定义如果有修改，一定要同时修改\服务端配置文件\Relay\RelaySetting\Task\daliytask.lua下相同的定义

Include("\\script\\lib\\globalfunctions.lua");

DAILY_TASK_0912_SWITCH = 1; --日常活动开关，0关闭，1打开

DAILY_TASK_0912_PERSONAL_TASK = 1027;--服务器全局变量，表示今天是哪个个人任务
DAILY_TASK_0912_TEAM_TASK = 1028;--服务器全局变量，表示今天是哪个团队任务


--个人日常任务列表
DALIY_TASK_0912_PERSONAL_TASK_LIST = {
    {"Thu ph鬰  Phng Ho祅g t筰 Th竔 H? 秓 c秐h", 10, {"Kinh nghi謒 Ph鬾g ho祅g", "Luy謓 Ph鬾g Ho祅g", "Trang b? Ph鬾g ho祅g"}},
    {"Thu ph鬰 Th鵦 Nh﹏ Th秓 t筰 Th竔 H? 秓 c秐h", 20, {"Kinh nghi謒 Th鵦 nh﹏ th秓", "Luy謓 Th鵦 Nh﹏ Hoa",  "Trang b? Th鵦 nh﹏ th秓"}},
    {"Thu ph鬰 Th? t筰 Th竔 H? 秓 c秐h", 20, {"Kinh nghi謒 Th?", "Luy謓 Th? t?", "Trang b? Th?"}},
    {"Thu ph鬰 H醓 K? L﹏ t筰 Th竔 H? 秓 c秐h", 10, {"Kinh nghi謒 H醓 K? L﹏", "Luy謓 H醓 K? L﹏", "Trang b? H醓 K? L﹏"}},
    {"Thu ph鬰 B? T﹜ T筺g t筰 Th竔 H? 秓 c秐h", 20, {"Kinh nghi謒 B? T﹜ T筺g", "Luy謓 Mao Ng璾", "Trang b? B? T﹜ T筺g"}},
    {"Thu ph鬰 C莔 Ti猲 T? t筰 Th竔 H? 秓 c秐h", 20, {"Kinh nghi謒 C莔 Ti猲 T?", "Luy謓 C莔 Ti猲 T?", "Trang b? C莔 Ti猲 T?"}},
}

--团队日常任务列表
DALIY_TASK_0912_TEAM_TASK_LIST = {
    {"Truy t譵 B綾 L鬰 L﹎ L謓h", 10, "B綾 L鬰 L﹎ l謓h"},
    {"Truy t譵 Tr鬰 秐h thng", 20, "Tr鬰 秐h Thng"},
    {"Truy t譵 Tuy謙 T譶h Th筩h", 20, "Tuy謙 T譶h Th筩h"},
    {"Truy t譵 L謓h B礽 T鎛g Qu秐 ngo筰 vi謓", 5, "L謓h b礽 t鎛g qu秐 ngo筰 vi謓"},
    {"Truy t譵 L謓h B礽 T鎛g qu秐 n閕 vi謓", 5, "L謓h b礽 t鎛g qu秐 n閕 vi謓"},
    {"Truy t譵 Vi謙 N? Ki誱", 5, "Vi謙 N? ki誱"},
    {"Truy t譵 Trang Ch? Kim 蕁", 15, "Trang ch? kim 蕁"},
    {"Truy t譵 Trng L穙 ch? ho祅", 20, "Trng L穙 Ch? Ho祅"},
}

--function main()
--    if DAILY_TASK_0912_SWITCH == 1 then
--        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, gf_GetRandItemByTable(DALIY_TASK_0912_PERSONAL_TASK_LIST, 100, 2));
--        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, gf_GetRandItemByTable(DALIY_TASK_0912_TEAM_TASK_LIST, 100, 2));
--    end
--end


