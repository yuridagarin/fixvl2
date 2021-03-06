Include("\\script\\newbattles\\functions.lua");

tBattleEquip = 
{
	[SONG_ID] = 
			{--装备信息,需要军衔
			[1] =   {{"T鑞g Й th鑞g chi課 kh玦",0,103,2231},3},
			[2] =   {{"T鑞g Й th鑞g chi課 b祇",0,100,2231},3},
			[3] =   {{"T鑞g Й th鑞g chi課 ph鬰",0,101,2231},3},
			[4] =   {{"T鑞g ti猲 phong hi謚 k?",0,102,2261},4},
			[5] =   {{"T鑞g ti猲 phong hi謚 ph?",0,102,2265},4},	
			[6] =   {{"T鑞g tng qu﹏ u kh玦",0,103,2241},5},
			[7] =   {{"T鑞g tng qu﹏ chi課 b祇",0,100,2241},5},
			[8] =   {{"T鑞g tng qu﹏ chi課 ph鬰",0,101,2241},5},
			[9] =   {{"T鑞g tng qu﹏ l謓h b礽",0,102,2281},5},
			[10] = {{"T鑞g tng qu﹏ c? l謓h",0,102,2285},5},
			[11] = {{"T鑞g l謓h ph?",0,102,2521},5},
			[12] = {{"Thi猲 Chi T鑞g Tng Qu﹏ Chi課 Kh玦",0,103,3016},5},
			[13] = {{"Thi猲 Chi T鑞g Tng Qu﹏ Chi課 B祇",0,100,3016},5},
			[14] = {{"Thi猲 Chi T鑞g Tng Qu﹏ Chi課 Trang",0,101,3016},5},
			[15] = {{"Thi猲 Chi T鑞g Tng Qu﹏ L謓h B礽",0,102,3032},5},
			[16] = {{"Thi猲 Chi T鑞g Tng Qu﹏ C? L謓h",0,102,3036},5},
			[17] = {{"Thi猲 Chi T鑞g Tng Qu﹏ L謓h Ph?",0,102,3040},5},	
			[18] = {{"T鑞g nguy猲 so竔 u kh玦",0,103,2251},6},
			[19] = {{"T鑞g nguy猲 so竔 chi課 b祇",0,100,2251},6},
			[20] = {{"T鑞g nguy猲 so竔 chi課 ph鬰",0,101,2251},6},
			[21] = {{"T鑞g nguy猲 so竔 h? ph?",0,102,2301},6},
			[22] = {{"T鑞g nguy猲 so竔 l謓h k?",0,102,2305},6},
			[23] = {{"T鑞g so竔 ph?",0,102,2501},6},
			[24] = {{"T鑞g so竔 k?",0,102,2505},6},
			[25] = {{"T鑞g qu﹏ ph鬰",0,109,992},3},
			[26] = {{"T鑞g-V躰h C鰑 Nguy猲 so竔 u kh玦",0,103,3000},6},
			[27] = {{"T鑞g -V躰h C鰑 Nguy猲 so竔 Chi課 Gi竝 ",0,100,3000},6},
			[28] = {{"T鑞g-V躰h C鰑 Nguy猲 so竔 Chi課 ph鬰",0,101,3000},6},
			[29] = {{"T鑞g-V躰h C鰑 Nguy猲 so竔 hi謚 k?",0,102,3012},6},
			[30] = {{"T鑞g-V躰h C鰑 Nguy猲 so竔 hi謚 ph?",0,102,3008},6},
			[31] = {{"T鑞g-V躰h C鰑 Nguy猲 so竔 l謓h k?",0,102,3004},6},
			[32] = {{"T鑞g-V躰h C鰑 Nguy猲 so竔 h? ph?",0,102,3000},6},
			[33] = {{"Ng? Long Nguy猲 So竔 Chi課 Gi竝",0,100,3008},6},
			[34] = {{"Чi T鑞g Nguy猲 So竔 Chi課 B祇",0,100,3024},6},
			[35] = {{"Чi T鑞g Nguy猲 So竔 H? Ph?",0,102,3056},6},
			[36] = {{"Чi T鑞g Nguy猲 So竔 L謓h K?",0,102,3060},6},
			[37] = {{"Чi T鑞g Nguy猲 So竔 Hi謚 Ph?",0,102,3064},6},
			[38] = {{"Чi T鑞g Nguy猲 So竔 Hi謚 K?",0,102,3068},6},
			[39] = {{"T鑞g Tng Qu﹏ Chi課 B祇",0,100,3016},5},
			[40] = {{"T鑞g Tng Qu﹏ Chi課 Trang",0,101,3016},5},
			[41] = {{"T鑞g Tng Qu﹏ Chi課 Kh玦",0,103,3016},5},
			[42] = {{"Thi猲 Chi T鑞g Tng Qu﹏ L謓h B礽",0,102,3032},5},
			[43] = {{"Thi猲 Chi T鑞g Tng Qu﹏ L謓h K?",0,102,3036},5},
			[44] = {{"Thi猲 Chi T鑞g Tng Qu﹏ L謓hPh?",0,102,3040},5},
			[45] = {{"Ng? Long Nguy猲 So竔 Chi課 Kh玦",0,103,3008},6},
			[46] = {{"Ng? Long Nguy猲 So竔 Chi課 Trang",0,101,3008},6},
			[47] = {{"Чi T鑞g Nguy猲 So竔 Chi課 Kh玦",0,103,3024},6},
			[48] = {{"Чi T鑞g Nguy猲 So竔 Chi課 Trang",0,101,3024},6},
			[49] = {{"Ng? Long Nguy猲 So竔 H? Ph?",0,102,3088},6},
			[50] = {{"Ng? Long Nguy猲 So竔 L謓h K?",0,102,3092},6},
			[51] = {{"Ng? Long Nguy猲 So竔 Hi謚 Ph?",0,102,3096},6},
			[52] = {{"Ng? Long Nguy猲 So竔 Hi謚 K?",0,102,3100},6},
			[53] = 	{{"T鑞g Ng? Long Tng Qu﹏ Kh玦 ",0,103,30017},5},
			[54] = 	{{"T鑞g Ng? Long Tng Qu﹏ Kh玦 ",0,103,30018},5},
			[55] = 	{{"T鑞g Ng? Long Tng Qu﹏ Kh玦 ",0,103,30019},5},
			[56] = 	{{"T鑞g Ng? Long Tng Qu﹏ Kh玦 ",0,103,30020},5},
			[57] = 	{{"T鑞g Ng? Long Tng Qu﹏ B祇 ",0,100,30017},5},
			[58] = 	{{"T鑞g Ng? Long Tng Qu﹏ B祇 ",0,100,30018},5},
			[59] = 	{{"T鑞g Ng? Long Tng Qu﹏ B祇 ",0,100,30019},5},
			[60] = 	{{"T鑞g Ng? Long Tng Qu﹏ B祇 ",0,100,30020},5},
			[61] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30013},5},
			[62] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30014},5},
			[63] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30015},5},
			[64] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30016},5},
			[65] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h K? ",0,102,30017},5},
			[66] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h K? ",0,102,30018},5},
			[67] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h K? ",0,102,30019},5},
			[68] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h K? ",0,102,30020},5},
			[69] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30021},5},
			[70] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30022},5},
			[71] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30023},5},
			[72] = 	{{"T鑞g Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30024},5},
			[73] = 	{{"T鑞g Ng? Long Tng Qu﹏ Trang",0,101,30017},5},
			[74] = 	{{"T鑞g Ng? Long Tng Qu﹏ Trang",0,101,30018},5},
			[75] = 	{{"T鑞g Ng? Long Tng Qu﹏ Trang",0,101,30019},5},
			[76] = 	{{"T鑞g Ng? Long Tng Qu﹏ Trang",0,101,30020},5},	
			[77] =   {{"T鑞g Thng g Й Th鑞g kh玦",0,103,30029},3},
            [78] =   {{"T鑞g Thng g Tng Qu﹏ kh玦",0,103,30033},5},
            [79] =   {{"T鑞g Thng g So竔 kh玦",0,103,30037},6},
            [80] =   {{"T鑞g Thng g Й Th鑞g b祇",0,100,30029},3},
            [81] =   {{"T鑞g Thng g Tng Qu﹏ b祇",0,100,30033},5},
            [82] =   {{"T鑞g Thng g So竔 b祇",0,100,30037},6},
            [83] =   {{"T鑞g Thng g Й Th鑞g trang ",0,101,30029},3},
            [84] =   {{"T鑞g Thng g Tng Qu﹏ trang",0,101,30033},5},
            [85] =   {{"T鑞g Thng g So竔 trang ",0,101,30037},6},
            [86] =   {{"T鑞g Thng g Ti猲 Phong k?",0,102,30044},4},
            [87] =   {{"T鑞g Thng g Ti猲 Phong ph?",0,102,30048},4},
            [88] =   {{"T鑞g Thng g Tng Qu﹏ l謓h",0,102,30052},5},
            [89] =   {{"T鑞g Thng g Tng Qu﹏ k?",0,102,30056},5},
            [90] =   {{"T鑞g Thng g Tng Qu﹏ ph?",0,102,30060},5},
            [91] =   {{"T鑞g Thng g So竔 H?",0,102,30064},6},
            [92] =   {{"T鑞g Thng g So竔 l謓h",0,102,30068},6},
            [93] =   {{"T鑞g Thng g So竔 ph?",0,102,30072},6},
            [94] =   {{"T鑞g Thng g So竔 k? ",0,102,30076},6},
            [95] =   {{"Huy Chng T鑞g Tng Qu﹏",0,153,10},5},
            [96] =   {{"竜 Cho祅g T鑞g Tng Qu﹏",0,152,10},5},
            [97] =   {{"Chi課 H礽 T鑞g Tng Qu﹏",0,154,10},5},
            [98] =   {{"Huy Chng T鑞g Nguy猲 So竔",0,153,14},6},
            [99] =   {{"竜 Cho祅g T鑞g Nguy猲 So竔",0,152,14},6},
            [100] =   {{"Chi課 H礽 T鑞g Nguy猲 So竔",0,154,14},6},
            
            [101] =   {{"T鑞g L玦 H? Tng Kh玦",0,103,30215},5},
            [102] =   {{"T鑞g L玦 H? Tng Kh玦",0,103,30216},5},
            [103] =   {{"T鑞g L玦 H? Tng Kh玦",0,103,30217},5},
            [104] =   {{"T鑞g L玦 H? Tng Kh玦",0,103,30218},5},
            [105] =   {{"T鑞g L玦 H? So竔 Kh玦",0,103,30219},6},
            [106] =   {{"T鑞g L玦 H? So竔 Kh玦",0,103,30220},6},
            [107] =   {{"T鑞g L玦 H? So竔 Kh玦",0,103,30221},6},
            [108] =   {{"T鑞g L玦 H? So竔 Kh玦",0,103,30222},6},
            [109] =   {{"T鑞g L玦 H? Tng B祇",0,100,30215},5},
            [110] =   {{"T鑞g L玦 H? Tng B祇",0,100,30216},5},
            [111] =   {{"T鑞g L玦 H? Tng B祇",0,100,30217},5},
            [112] =   {{"T鑞g L玦 H? Tng B祇",0,100,30218},5},
            [113] =   {{"T鑞g L玦 H? So竔 B祇",0,100,30219},6},
            [114] =   {{"T鑞g L玦 H? So竔 B祇",0,100,30220},6},
            [115] =   {{"T鑞g L玦 H? So竔 B祇",0,100,30221},6},
            [116] =   {{"T鑞g L玦 H? So竔 B祇",0,100,30222},6},
            [117] =   {{"T鑞g L玦 H? Tng Trang",0,101,30215},5},
            [118] =   {{"T鑞g L玦 H? Tng Trang",0,101,30216},5},
            [119] =   {{"T鑞g L玦 H? Tng Trang",0,101,30217},5},
            [120] =   {{"T鑞g L玦 H? Tng Trang",0,101,30218},5},
            [121] =   {{"T鑞g L玦 H? So竔 Trang",0,101,30219},6},
            [122] =   {{"T鑞g L玦 H? So竔 Trang",0,101,30220},6},
            [123] =   {{"T鑞g L玦 H? So竔 Trang",0,101,30221},6},
            [124] =   {{"T鑞g L玦 H? So竔 Trang",0,101,30222},6},
            [125] =   {{"T鑞g L玦 H? Tng B礽",0,102,30157},5},
            [126] =   {{"T鑞g L玦 H? Tng B礽",0,102,30158},5},
            [127] =   {{"T鑞g L玦 H? Tng B礽",0,102,30159},5},
            [128] =   {{"T鑞g L玦 H? Tng B礽",0,102,30160},5},
            [129] =   {{"T鑞g L玦 H? Tng K?",0,102,30161},5},
            [130] =   {{"T鑞g L玦 H? Tng K?",0,102,30162},5},
            [131] =   {{"T鑞g L玦 H? Tng K?",0,102,30163},5},
            [132] =   {{"T鑞g L玦 H? Tng K?",0,102,30164},5},
            [133] =   {{"T鑞g L玦 H? Tng Ph?",0,102,30165},5},
            [134] =   {{"T鑞g L玦 H? Tng Ph?",0,102,30166},5},
            [135] =   {{"T鑞g L玦 H? Tng Ph?",0,102,30167},5},
            [136] =   {{"T鑞g L玦 H? Tng Ph?",0,102,30168},5},
            [137] =   {{"T鑞g L玦 H? So竔 Ph?",0,102,30169},6},
            [138] =   {{"T鑞g L玦 H? So竔 Ph?",0,102,30170},6},
            [139] =   {{"T鑞g L玦 H? So竔 Ph?",0,102,30171},6},
            [140] =   {{"T鑞g L玦 H? So竔 Ph?",0,102,30172},6},
            [141] =   {{"T鑞g L玦 H? So竔 H? Ph?",0,102,30173},6},
            [142] =   {{"T鑞g L玦 H? So竔 H? Ph?",0,102,30174},6},
            [143] =   {{"T鑞g L玦 H? So竔 H? Ph?",0,102,30175},6},
            [144] =   {{"T鑞g L玦 H? So竔 H? Ph?",0,102,30176},6},
            [145] =   {{"T鑞g L玦 H? So竔 K?",0,102,30177},6},
            [146] =   {{"T鑞g L玦 H? So竔 K?",0,102,30178},6},
            [147] =   {{"T鑞g L玦 H? So竔 K?",0,102,30179},6},
            [148] =   {{"T鑞g L玦 H? So竔 K?",0,102,30180},6},
            [149] =   {{"T鑞g L玦 H? So竔 Hi謚 K?",0,102,30181},6},
            [150] =   {{"T鑞g L玦 H? So竔 Hi謚 K?",0,102,30182},6},
            [151] =   {{"T鑞g L玦 H? So竔 Hi謚 K?",0,102,30183},6},
            [152] =   {{"T鑞g L玦 H? So竔 Hi謚 K?",0,102,30184},6},
		},
	[LIAO_ID] = 
			{--装备信息,需要军衔
			[1] =   {{"Li猽 Й th鑞g chi課 kh玦",0,103,2235},3},
			[2] =   {{"Li猽 Й th鑞g chi課 b祇",0,100,2235},3},
			[3] =   {{"Li猽 Й th鑞g chi課 ph鬰",0,101,2235},3},
			[4] =   {{"Li猽 ti猲 phong hi謚 k?",0,102,2271},4},
			[5] =   {{"Li猽 ti猲 phong hi謚 ph?",0,102,2275},4},	
			[6] =   {{"Li猽 tng qu﹏ u kh玦",0,103,2245},5},
			[7] =   {{"Li猽 tng qu﹏ chi課 b祇",0,100,2245},5},
			[8] =   {{"Li猽 tng qu﹏ chi課 ph鬰",0,101,2245},5},
			[9] =   {{"Li猽 tng qu﹏ l謓h b礽",0,102,2291},5},
			[10] = {{"Li猽 tng qu﹏ c? l謓h",0,102,2295},5},
			[11] = {{"Li猽 l謓h ph?",0,102,2531},5},
			[12] = {{"Thi猲 Chi Li猽 Tng Qu﹏ Chi課 Kh玦",0,103,3020},5},
			[13] = {{"Thi猲 Chi Li猽 Tng Qu﹏ Chi課 B祇",0,100,3020},5},
			[14] = {{"Thi猲 Chi Li猽 Tng Qu﹏ Chi課 Trang",0,101,3020},5},
			[15] = {{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h B礽",0,102,3044},5},
			[16] = {{"Thi猲 Chi Li猽 Tng Qu﹏ C? L謓h",0,102,3048},5},
			[17] = {{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h Ph?",0,102,3052},5},
			[18] = {{"Li猽 nguy猲 so竔 u kh玦",0,103,2255},6},
			[19] = {{"Li猽 nguy猲 so竔 chi課 b祇",0,100,2255},6},
			[20] = {{"Li猽 nguy猲 so竔 chi課 ph鬰",0,101,2255},6},
			[21] = {{"Li猽 nguy猲 so竔 h? ph?",0,102,2311},6},
			[22] = {{"Li猽 nguy猲 so竔 l謓h k?",0,102,2315},6},
			[23] = {{"Li猽 so竔 ph?",0,102,2511},6},
			[24] = {{"Li猽 so竔 k?",0,102,2515},6},
			[25] = {{"Li猽 qu﹏ ph鬰",0,109,996},3},
			[26] = {{"Li猽-V躰h C鰑 nguy猲 so竔 u kh玦",0,103,3004},6},
			[27] = {{"Li猽-V躰h C鰑 nguy猲 so竔 Chi課 Gi竝 ",0,100,3004},6},
			[28] = {{"Li猽-V躰h C鰑 nguy猲 so竔 Chi課 ph鬰",0,101,3004},6},
			[29] = {{"Li猽-V躰h C鰑 Nguy猲 so竔 hi謚 k?",0,102,3028},6},
			[30] = {{"Li猽-V躰h C鰑 Nguy猲 so竔 hi謚 ph?",0,102,3024},6},
			[31] = {{"Li猽-V躰h C鰑 nguy猲 so竔 l謓h k?",0,102,3020},6},
			[32] = {{"Li猽-V躰h C鰑 nguy猲 so竔 h? ph?",0,102,3016},6},
			[33] = {{"Chi猽 Th竛h Nguy猲 So竔 Chi課 Gi竝",0,100,3012},6},
			[34] = {{"Чi Li猽 Nguy猲 So竔 Chi課 B祇",0,100,3028},6},
			[35] = {{"Чi Li猽 Nguy猲 So竔 H? Ph?",0,102,3072},6},
			[36] = {{"Чi Li猽 Nguy猲 So竔 L謓h K?",0,102,3076},6},
			[37] = {{"Чi Li猽 Nguy猲 So竔 Hi謚 Ph?",0,102,3080},6},
			[38] = {{"Чi Li猽 Nguy猲 So竔 Hi謚 K?",0,102,3084},6},
			[39] = {{"Li猽 Tng Qu﹏ Chi課 B祇",0,100,3020},5},
			[40] = {{"Li猽 Tng Qu﹏ Chi課 Trang",0,101,3020},5},
			[41] = {{"Li猽 Tng Qu﹏ Chi課 Kh玦",0,103,3020},5},
			[42] = {{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h B礽",0,102,3044},5},
			[43] = {{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h K?",0,102,3048},5},
			[44] = {{"Thi猲 Chi Li猽 Tng Qu﹏ L謓h Ph?",0,102,3052},5},
			[45] = {{"Chi猽 Th竛h Nguy猲 So竔 Kh玦",0,103,3012},6},
			[46] = {{"Chi猽 Th竛h Nguy猲 So竔 Chi課Trang",0,101,3012},6},
			[47] = {{"Чi Li猽 Nguy猲 So竔 Chi課 Kh玦",0,103,3028},6},
			[48] = {{"Чi Li猽 Nguy猲 So竔 Chi課 Trang",0,101,3028},6},
			[49] = {{"Chi猽 Th竛h Nguy猲 So竔 H? Ph?",0,102,3104},6},
			[50] = {{"Chi猽 Th竛h Nguy猲 So竔 L謓h K?",0,102,3108},6},
			[51] = {{"Chi猽 Th竛h Nguy猲 So竔 Hi謚 Ph?",0,102,3112},6},
			[52] = {{"Chi猽 Th竛h Nguy猲 So竔 Hi謚 K?",0,102,3116},6},
			[53] = 	{{"Li猽 Ng? Long Tng Qu﹏ Kh玦 ",0,103,30021},5},
			[54] = 	{{"Li猽 Ng? Long Tng Qu﹏ Kh玦 ",0,103,30022},5},
			[55] = 	{{"Li猽 Ng? Long Tng Qu﹏ Kh玦 ",0,103,30023},5},
			[56] = 	{{"Li猽 Ng? Long Tng Qu﹏ Kh玦 ",0,103,30024},5},
			[57] = 	{{"Li猽Ng? Long Tng Qu﹏ B祇 ",0,100,30021},5},
			[58] = 	{{"Li猽Ng? Long Tng Qu﹏ B祇 ",0,100,30022},5},
			[59] = 	{{"Li猽Ng? Long Tng Qu﹏ B祇 ",0,100,30023},5},
			[60] = 	{{"Li猽Ng? Long Tng Qu﹏ B祇 ",0,100,30024},5},
			[61] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30025},5},
			[62] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30026},5},
			[63] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30027},5},
			[64] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h B礽 ",0,102,30028},5},
			[65] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h K? ",0,102,30029},5},
			[66] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h K? ",0,102,30030},5},
			[67] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h K? ",0,102,30031},5},
			[68] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h K? ",0,102,30032},5},
			[69] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30033},5},
			[70] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30034},5},
			[71] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30035},5},
			[72] = 	{{"Li猽 Ng? Long Tng Qu﹏ L謓h Ph?",0,102,30036},5},
			[73] = 	{{"Li猽 Ng? Long Tng Qu﹏ Trang",0,101,30021},5},
			[74] = 	{{"Li猽 Ng? Long Tng Qu﹏ Trang",0,101,30022},5},
			[75] = 	{{"Li猽 Ng? Long Tng Qu﹏ Trang",0,101,30023},5},
			[76] = 	{{"Li猽 Ng? Long Tng Qu﹏ Trang",0,101,30024},5},
            [77] =   {{"Li猽 Thng g Й Th鑞g kh玦",0,103,30041},3},
            [78] =   {{"Li猽 Thng g Tng Qu﹏ kh玦",0,103,30045},5},
            [79] =   {{"Li猽 Thng g So竔 kh玦",0,103,30049},6},
            [80] =   {{"Li猽 Thng g Й Th鑞g b祇",0,100,30041},3},
            [81] =   {{"Li猽 Thng g Tng Qu﹏ b祇",0,100,30045},5},
            [82] =   {{"Li猽 Thng g So竔 b祇",0,100,30049},6},
            [83] =   {{"Li猽 Thng g Й Th鑞g trang",0,101,30041},3},
            [84] =   {{"Li猽 Thng g Tng Qu﹏ trang ",0,101,30045},5},
            [85] =   {{"Li猽 Thng g So竔 trang",0,101,30049},6},
            [86] =   {{"Li猽 Thng g Ti猲 Phong k?",0,102,30080},4},
            [87] =   {{"Li猽 Thng g Ti猲 Phong ph?",0,102,30084},4},
            [88] =   {{"Li猽 Thng g Tng Qu﹏ l謓h",0,102,30088},5},
            [89] =   {{"Li猽 Thng g Tng Qu﹏ k?",0,102,30092},5},
            [90] =   {{"Li猽 Thng g Tng Qu﹏ ph?",0,102,30096},5},
            [91] =   {{"Li猽 Thng g So竔 H?",0,102,30100},6},
            [92] =   {{"Li猽 Thng g So竔 l謓h",0,102,30104},6},
            [93] =   {{"Li猽 Thng g So竔 ph? ",0,102,30108},6},
            [94] =   {{"Li猽 Thng g So竔 k? ",0,102,30112},6},
            [95] =   {{"Huy Chng Li猽 Tng Qu﹏",0,153,18},5},
            [96] =   {{"竜 Cho祅g Li猽 Tng Qu﹏",0,152,18},5},
            [97] =   {{"Chi課 H礽 Li猽 Tng Qu﹏",0,154,18},5},
            [98] =   {{"Huy Chng Li猽 Nguy猲 So竔",0,153,22},6},
            [99] =   {{"竜 Cho祅g Li猽 Nguy猲 So竔",0,152,22},6},
            [100] =   {{"Chi課 H礽 Li猽 Nguy猲 So竔",0,154,22},6},
            
            [101] =   {{"Li猽 L玦 H? Tng Kh玦",0,103,30227},5},
            [102] =   {{"Li猽 L玦 H? Tng Kh玦",0,103,30228},5},
            [103] =   {{"Li猽 L玦 H? Tng Kh玦",0,103,30229},5},
            [104] =   {{"Li猽 L玦 H? Tng Kh玦",0,103,30230},5},
            [105] =   {{"Li猽 L玦 H? So竔 Kh玦",0,103,30231},6},
            [106] =   {{"Li猽 L玦 H? So竔 Kh玦",0,103,30232},6},
            [107] =   {{"Li猽 L玦 H? So竔 Kh玦",0,103,30233},6},
            [108] =   {{"Li猽 L玦 H? So竔 Kh玦",0,103,30234},6},
            [109] =   {{"Li猽 L玦 H? Tng B祇",0,100,30227},5},
            [110] =   {{"Li猽 L玦 H? Tng B祇",0,100,30228},5},
            [111] =   {{"Li猽 L玦 H? Tng B祇",0,100,30229},5},
            [112] =   {{"Li猽 L玦 H? Tng B祇",0,100,30230},5},
            [113] =   {{"Li猽 L玦 H? So竔 B祇",0,100,30231},6},
            [114] =   {{"Li猽 L玦 H? So竔 B祇",0,100,30232},6},
            [115] =   {{"Li猽 L玦 H? So竔 B祇",0,100,30233},6},
            [116] =   {{"Li猽 L玦 H? So竔 B祇",0,100,30234},6},
            [117] =   {{"Li猽 L玦 H? Tng Trang",0,101,30227},5},
            [118] =   {{"Li猽 L玦 H? Tng Trang",0,101,30228},5},
            [119] =   {{"Li猽 L玦 H? Tng Trang",0,101,30229},5},
            [120] =   {{"Li猽 L玦 H? Tng Trang",0,101,30230},5},
            [121] =   {{"Li猽 L玦 H? So竔 Trang",0,101,30231},6},
            [122] =   {{"Li猽 L玦 H? So竔 Trang",0,101,30232},6},
            [123] =   {{"Li猽 L玦 H? So竔 Trang",0,101,30233},6},
            [124] =   {{"Li猽 L玦 H? So竔 Trang",0,101,30234},6},
            [125] =   {{"Li猽 L玦 H? Tng B礽",0,102,30193},5},
            [126] =   {{"Li猽 L玦 H? Tng B礽",0,102,30194},5},
            [127] =   {{"Li猽 L玦 H? Tng B礽",0,102,30195},5},
            [128] =   {{"Li猽 L玦 H? Tng B礽",0,102,30196},5},
            [129] =   {{"Li猽 L玦 H? Tng K?",0,102,30197},5},
            [130] =   {{"Li猽 L玦 H? Tng K?",0,102,30198},5},
            [131] =   {{"Li猽 L玦 H? Tng K?",0,102,30199},5},
            [132] =   {{"Li猽 L玦 H? Tng K?",0,102,30200},5},
            [133] =   {{"Li猽 L玦 H? Tng Ph?",0,102,30201},5},
            [134] =   {{"Li猽 L玦 H? Tng Ph?",0,102,30202},5},
            [135] =   {{"Li猽 L玦 H? Tng Ph?",0,102,30203},5},
            [136] =   {{"Li猽 L玦 H? Tng Ph?",0,102,30204},5},
            [137] =   {{"Li猽 L玦 H? So竔 Ph?",0,102,30205},6},
            [138] =   {{"Li猽 L玦 H? So竔 Ph?",0,102,30206},6},
            [139] =   {{"Li猽 L玦 H? So竔 Ph?",0,102,30207},6},
            [140] =   {{"Li猽 L玦 H? So竔 Ph?",0,102,30208},6},
            [141] =   {{"Li猽 L玦 H? So竔 H? Ph?",0,102,30209},6},
            [142] =   {{"Li猽 L玦 H? So竔 H? Ph?",0,102,30210},6},
            [143] =   {{"Li猽 L玦 H? So竔 H? Ph?",0,102,30211},6},
            [144] =   {{"Li猽 L玦 H? So竔 H? Ph?",0,102,30212},6},
            [145] =   {{"Li猽 L玦 H? So竔 K?",0,102,30213},6},
            [146] =   {{"Li猽 L玦 H? So竔 K?",0,102,30214},6},
            [147] =   {{"Li猽 L玦 H? So竔 K?",0,102,30215},6},
            [148] =   {{"Li猽 L玦 H? So竔 K?",0,102,30216},6},
            [149] =   {{"Li猽 L玦 H? So竔 Hi謚 K?",0,102,30217},6},
            [150] =   {{"Li猽 L玦 H? So竔 Hi謚 K?",0,102,30218},6},
            [151] =   {{"Li猽 L玦 H? So竔 Hi謚 K?",0,102,30219},6},
            [152] =   {{"Li猽 L玦 H? So竔 Hi謚 K?",0,102,30220},6},
		},
}

function CanEquip(nItemIdx)
	if check_palyer_state(nItemIdx) == 0 then
		return 1;	--不能穿
	end;
	return 0;
end;

function OnUse(nItemIdx)
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end
--获得装备的阵营及在table中的索引
function get_equip_index(nItemIdx)
	local nGenre = GetItemGenre(nItemIdx);
	local nDetail = GetItemDetail(nItemIdx);
	local nParticular = GetItemParticular(nItemIdx);
	local nBody = GetBody();
	for i=1,getn(tBattleEquip) do 
		for j=1,getn(tBattleEquip[i]) do
			local tEquipInfo = tBattleEquip[i][j][1];
			if tEquipInfo[2] == nGenre and tEquipInfo[3] == nDetail and tEquipInfo[4]+nBody-1 == nParticular then
				return i,j;	--阵营，在table中的索引
			end;
		end;
	end;
	return 0,0;
end;

function check_palyer_state(nItemIdx)
	local nEquipCamp,nEquipIdx = get_equip_index(nItemIdx);
	if nEquipCamp == 0 then
		Msg2Player("Зy kh玭g ph秈 l? trang b? chi課 tr薾 ");
		return 0;
	end;
	local nCurRank = BT_GetData(PT_CURRANK);
	local nPlayerCamp = 0;
	local sEquipName = tBattleEquip[nEquipCamp][nEquipIdx][1][1];
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID;
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID;
	end;
	if nPlayerCamp == ALL_ID then
		Msg2Player("Qu﹏ h祄 c馻 b筺 hi謓 m韎 l? Binh s?, kh玭g th? nh薾 trang b?"..sEquipName)
		return 0;	
	end;
	local nNeedRank = tBattleEquip[nEquipCamp][nEquipIdx][2];
	if (nEquipCamp ~= nPlayerCamp) then
		if nPlayerCamp == SONG_ID then
			Msg2Player("Ngi l? phe T鑞g, kh玭g th? m芻 trang b? phe Li猽");
		else
			Msg2Player("Ngi l? phe Li猽, kh玭g th? m芻 trang b? phe T鑞g");
		end;
		return 0;
	end;
	nCurRank = abs(nCurRank);
	if nCurRank < nNeedRank then
		Msg2Player("Qu﹏ h祄 c馻 b筺 qu? th蕄, kh玭g th? trang b?"..sEquipName);
		return 0;
	end;
	return 1;
end;
