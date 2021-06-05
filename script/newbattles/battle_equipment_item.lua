Include("\\script\\newbattles\\functions.lua");

tBattleEquip = 
{
	[SONG_ID] = 
			{--װ����Ϣ,��Ҫ����
			[1] =   {{"T�ng �� th�ng chi�n kh�i",0,103,2231},3},
			[2] =   {{"T�ng �� th�ng chi�n b�o",0,100,2231},3},
			[3] =   {{"T�ng �� th�ng chi�n ph�c",0,101,2231},3},
			[4] =   {{"T�ng ti�n phong hi�u k�",0,102,2261},4},
			[5] =   {{"T�ng ti�n phong hi�u ph�",0,102,2265},4},	
			[6] =   {{"T�ng t��ng qu�n ��u kh�i",0,103,2241},5},
			[7] =   {{"T�ng t��ng qu�n chi�n b�o",0,100,2241},5},
			[8] =   {{"T�ng t��ng qu�n chi�n ph�c",0,101,2241},5},
			[9] =   {{"T�ng t��ng qu�n l�nh b�i",0,102,2281},5},
			[10] = {{"T�ng t��ng qu�n c� l�nh",0,102,2285},5},
			[11] = {{"T�ng l�nh ph�",0,102,2521},5},
			[12] = {{"Thi�n Chi T�ng T��ng Qu�n Chi�n Kh�i",0,103,3016},5},
			[13] = {{"Thi�n Chi T�ng T��ng Qu�n Chi�n B�o",0,100,3016},5},
			[14] = {{"Thi�n Chi T�ng T��ng Qu�n Chi�n Trang",0,101,3016},5},
			[15] = {{"Thi�n Chi T�ng T��ng Qu�n L�nh B�i",0,102,3032},5},
			[16] = {{"Thi�n Chi T�ng T��ng Qu�n C� L�nh",0,102,3036},5},
			[17] = {{"Thi�n Chi T�ng T��ng Qu�n L�nh Ph�",0,102,3040},5},	
			[18] = {{"T�ng nguy�n so�i ��u kh�i",0,103,2251},6},
			[19] = {{"T�ng nguy�n so�i chi�n b�o",0,100,2251},6},
			[20] = {{"T�ng nguy�n so�i chi�n ph�c",0,101,2251},6},
			[21] = {{"T�ng nguy�n so�i h� ph�",0,102,2301},6},
			[22] = {{"T�ng nguy�n so�i l�nh k�",0,102,2305},6},
			[23] = {{"T�ng so�i ph�",0,102,2501},6},
			[24] = {{"T�ng so�i k�",0,102,2505},6},
			[25] = {{"T�ng qu�n ph�c",0,109,992},3},
			[26] = {{"T�ng-V�nh C�u Nguy�n so�i ��u kh�i",0,103,3000},6},
			[27] = {{"T�ng -V�nh C�u Nguy�n so�i Chi�n Gi�p ",0,100,3000},6},
			[28] = {{"T�ng-V�nh C�u Nguy�n so�i Chi�n ph�c",0,101,3000},6},
			[29] = {{"T�ng-V�nh C�u Nguy�n so�i hi�u k�",0,102,3012},6},
			[30] = {{"T�ng-V�nh C�u Nguy�n so�i hi�u ph�",0,102,3008},6},
			[31] = {{"T�ng-V�nh C�u Nguy�n so�i l�nh k�",0,102,3004},6},
			[32] = {{"T�ng-V�nh C�u Nguy�n so�i h� ph�",0,102,3000},6},
			[33] = {{"Ng� Long Nguy�n So�i Chi�n Gi�p",0,100,3008},6},
			[34] = {{"��i T�ng Nguy�n So�i Chi�n B�o",0,100,3024},6},
			[35] = {{"��i T�ng Nguy�n So�i H� Ph�",0,102,3056},6},
			[36] = {{"��i T�ng Nguy�n So�i L�nh K�",0,102,3060},6},
			[37] = {{"��i T�ng Nguy�n So�i Hi�u Ph�",0,102,3064},6},
			[38] = {{"��i T�ng Nguy�n So�i Hi�u K�",0,102,3068},6},
			[39] = {{"T�ng T��ng Qu�n Chi�n B�o",0,100,3016},5},
			[40] = {{"T�ng T��ng Qu�n Chi�n Trang",0,101,3016},5},
			[41] = {{"T�ng T��ng Qu�n Chi�n Kh�i",0,103,3016},5},
			[42] = {{"Thi�n Chi T�ng T��ng Qu�n L�nh B�i",0,102,3032},5},
			[43] = {{"Thi�n Chi T�ng T��ng Qu�n L�nh K�",0,102,3036},5},
			[44] = {{"Thi�n Chi T�ng T��ng Qu�n L�nhPh�",0,102,3040},5},
			[45] = {{"Ng� Long Nguy�n So�i Chi�n Kh�i",0,103,3008},6},
			[46] = {{"Ng� Long Nguy�n So�i Chi�n Trang",0,101,3008},6},
			[47] = {{"��i T�ng Nguy�n So�i Chi�n Kh�i",0,103,3024},6},
			[48] = {{"��i T�ng Nguy�n So�i Chi�n Trang",0,101,3024},6},
			[49] = {{"Ng� Long Nguy�n So�i H� Ph�",0,102,3088},6},
			[50] = {{"Ng� Long Nguy�n So�i L�nh K�",0,102,3092},6},
			[51] = {{"Ng� Long Nguy�n So�i Hi�u Ph�",0,102,3096},6},
			[52] = {{"Ng� Long Nguy�n So�i Hi�u K�",0,102,3100},6},
			[53] = 	{{"T�ng Ng� Long T��ng Qu�n Kh�i ",0,103,30017},5},
			[54] = 	{{"T�ng Ng� Long T��ng Qu�n Kh�i ",0,103,30018},5},
			[55] = 	{{"T�ng Ng� Long T��ng Qu�n Kh�i ",0,103,30019},5},
			[56] = 	{{"T�ng Ng� Long T��ng Qu�n Kh�i ",0,103,30020},5},
			[57] = 	{{"T�ng Ng� Long T��ng Qu�n B�o ",0,100,30017},5},
			[58] = 	{{"T�ng Ng� Long T��ng Qu�n B�o ",0,100,30018},5},
			[59] = 	{{"T�ng Ng� Long T��ng Qu�n B�o ",0,100,30019},5},
			[60] = 	{{"T�ng Ng� Long T��ng Qu�n B�o ",0,100,30020},5},
			[61] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh B�i ",0,102,30013},5},
			[62] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh B�i ",0,102,30014},5},
			[63] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh B�i ",0,102,30015},5},
			[64] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh B�i ",0,102,30016},5},
			[65] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh K� ",0,102,30017},5},
			[66] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh K� ",0,102,30018},5},
			[67] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh K� ",0,102,30019},5},
			[68] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh K� ",0,102,30020},5},
			[69] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh Ph�",0,102,30021},5},
			[70] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh Ph�",0,102,30022},5},
			[71] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh Ph�",0,102,30023},5},
			[72] = 	{{"T�ng Ng� Long T��ng Qu�n L�nh Ph�",0,102,30024},5},
			[73] = 	{{"T�ng Ng� Long T��ng Qu�n Trang",0,101,30017},5},
			[74] = 	{{"T�ng Ng� Long T��ng Qu�n Trang",0,101,30018},5},
			[75] = 	{{"T�ng Ng� Long T��ng Qu�n Trang",0,101,30019},5},
			[76] = 	{{"T�ng Ng� Long T��ng Qu�n Trang",0,101,30020},5},	
			[77] =   {{"T�ng Th��ng �ng �� Th�ng kh�i",0,103,30029},3},
            [78] =   {{"T�ng Th��ng �ng T��ng Qu�n kh�i",0,103,30033},5},
            [79] =   {{"T�ng Th��ng �ng So�i kh�i",0,103,30037},6},
            [80] =   {{"T�ng Th��ng �ng �� Th�ng b�o",0,100,30029},3},
            [81] =   {{"T�ng Th��ng �ng T��ng Qu�n b�o",0,100,30033},5},
            [82] =   {{"T�ng Th��ng �ng So�i b�o",0,100,30037},6},
            [83] =   {{"T�ng Th��ng �ng �� Th�ng trang ",0,101,30029},3},
            [84] =   {{"T�ng Th��ng �ng T��ng Qu�n trang",0,101,30033},5},
            [85] =   {{"T�ng Th��ng �ng So�i trang ",0,101,30037},6},
            [86] =   {{"T�ng Th��ng �ng Ti�n Phong k�",0,102,30044},4},
            [87] =   {{"T�ng Th��ng �ng Ti�n Phong ph�",0,102,30048},4},
            [88] =   {{"T�ng Th��ng �ng T��ng Qu�n l�nh",0,102,30052},5},
            [89] =   {{"T�ng Th��ng �ng T��ng Qu�n k�",0,102,30056},5},
            [90] =   {{"T�ng Th��ng �ng T��ng Qu�n ph�",0,102,30060},5},
            [91] =   {{"T�ng Th��ng �ng So�i H�",0,102,30064},6},
            [92] =   {{"T�ng Th��ng �ng So�i l�nh",0,102,30068},6},
            [93] =   {{"T�ng Th��ng �ng So�i ph�",0,102,30072},6},
            [94] =   {{"T�ng Th��ng �ng So�i k� ",0,102,30076},6},
            [95] =   {{"Huy Ch��ng T�ng T��ng Qu�n",0,153,10},5},
            [96] =   {{"�o Cho�ng T�ng T��ng Qu�n",0,152,10},5},
            [97] =   {{"Chi�n H�i T�ng T��ng Qu�n",0,154,10},5},
            [98] =   {{"Huy Ch��ng T�ng Nguy�n So�i",0,153,14},6},
            [99] =   {{"�o Cho�ng T�ng Nguy�n So�i",0,152,14},6},
            [100] =   {{"Chi�n H�i T�ng Nguy�n So�i",0,154,14},6},
            
            [101] =   {{"T�ng L�i H� T��ng Kh�i",0,103,30215},5},
            [102] =   {{"T�ng L�i H� T��ng Kh�i",0,103,30216},5},
            [103] =   {{"T�ng L�i H� T��ng Kh�i",0,103,30217},5},
            [104] =   {{"T�ng L�i H� T��ng Kh�i",0,103,30218},5},
            [105] =   {{"T�ng L�i H� So�i Kh�i",0,103,30219},6},
            [106] =   {{"T�ng L�i H� So�i Kh�i",0,103,30220},6},
            [107] =   {{"T�ng L�i H� So�i Kh�i",0,103,30221},6},
            [108] =   {{"T�ng L�i H� So�i Kh�i",0,103,30222},6},
            [109] =   {{"T�ng L�i H� T��ng B�o",0,100,30215},5},
            [110] =   {{"T�ng L�i H� T��ng B�o",0,100,30216},5},
            [111] =   {{"T�ng L�i H� T��ng B�o",0,100,30217},5},
            [112] =   {{"T�ng L�i H� T��ng B�o",0,100,30218},5},
            [113] =   {{"T�ng L�i H� So�i B�o",0,100,30219},6},
            [114] =   {{"T�ng L�i H� So�i B�o",0,100,30220},6},
            [115] =   {{"T�ng L�i H� So�i B�o",0,100,30221},6},
            [116] =   {{"T�ng L�i H� So�i B�o",0,100,30222},6},
            [117] =   {{"T�ng L�i H� T��ng Trang",0,101,30215},5},
            [118] =   {{"T�ng L�i H� T��ng Trang",0,101,30216},5},
            [119] =   {{"T�ng L�i H� T��ng Trang",0,101,30217},5},
            [120] =   {{"T�ng L�i H� T��ng Trang",0,101,30218},5},
            [121] =   {{"T�ng L�i H� So�i Trang",0,101,30219},6},
            [122] =   {{"T�ng L�i H� So�i Trang",0,101,30220},6},
            [123] =   {{"T�ng L�i H� So�i Trang",0,101,30221},6},
            [124] =   {{"T�ng L�i H� So�i Trang",0,101,30222},6},
            [125] =   {{"T�ng L�i H� T��ng B�i",0,102,30157},5},
            [126] =   {{"T�ng L�i H� T��ng B�i",0,102,30158},5},
            [127] =   {{"T�ng L�i H� T��ng B�i",0,102,30159},5},
            [128] =   {{"T�ng L�i H� T��ng B�i",0,102,30160},5},
            [129] =   {{"T�ng L�i H� T��ng K�",0,102,30161},5},
            [130] =   {{"T�ng L�i H� T��ng K�",0,102,30162},5},
            [131] =   {{"T�ng L�i H� T��ng K�",0,102,30163},5},
            [132] =   {{"T�ng L�i H� T��ng K�",0,102,30164},5},
            [133] =   {{"T�ng L�i H� T��ng Ph�",0,102,30165},5},
            [134] =   {{"T�ng L�i H� T��ng Ph�",0,102,30166},5},
            [135] =   {{"T�ng L�i H� T��ng Ph�",0,102,30167},5},
            [136] =   {{"T�ng L�i H� T��ng Ph�",0,102,30168},5},
            [137] =   {{"T�ng L�i H� So�i Ph�",0,102,30169},6},
            [138] =   {{"T�ng L�i H� So�i Ph�",0,102,30170},6},
            [139] =   {{"T�ng L�i H� So�i Ph�",0,102,30171},6},
            [140] =   {{"T�ng L�i H� So�i Ph�",0,102,30172},6},
            [141] =   {{"T�ng L�i H� So�i H� Ph�",0,102,30173},6},
            [142] =   {{"T�ng L�i H� So�i H� Ph�",0,102,30174},6},
            [143] =   {{"T�ng L�i H� So�i H� Ph�",0,102,30175},6},
            [144] =   {{"T�ng L�i H� So�i H� Ph�",0,102,30176},6},
            [145] =   {{"T�ng L�i H� So�i K�",0,102,30177},6},
            [146] =   {{"T�ng L�i H� So�i K�",0,102,30178},6},
            [147] =   {{"T�ng L�i H� So�i K�",0,102,30179},6},
            [148] =   {{"T�ng L�i H� So�i K�",0,102,30180},6},
            [149] =   {{"T�ng L�i H� So�i Hi�u K�",0,102,30181},6},
            [150] =   {{"T�ng L�i H� So�i Hi�u K�",0,102,30182},6},
            [151] =   {{"T�ng L�i H� So�i Hi�u K�",0,102,30183},6},
            [152] =   {{"T�ng L�i H� So�i Hi�u K�",0,102,30184},6},
		},
	[LIAO_ID] = 
			{--װ����Ϣ,��Ҫ����
			[1] =   {{"Li�u �� th�ng chi�n kh�i",0,103,2235},3},
			[2] =   {{"Li�u �� th�ng chi�n b�o",0,100,2235},3},
			[3] =   {{"Li�u �� th�ng chi�n ph�c",0,101,2235},3},
			[4] =   {{"Li�u ti�n phong hi�u k�",0,102,2271},4},
			[5] =   {{"Li�u ti�n phong hi�u ph�",0,102,2275},4},	
			[6] =   {{"Li�u t��ng qu�n ��u kh�i",0,103,2245},5},
			[7] =   {{"Li�u t��ng qu�n chi�n b�o",0,100,2245},5},
			[8] =   {{"Li�u t��ng qu�n chi�n ph�c",0,101,2245},5},
			[9] =   {{"Li�u t��ng qu�n l�nh b�i",0,102,2291},5},
			[10] = {{"Li�u t��ng qu�n c� l�nh",0,102,2295},5},
			[11] = {{"Li�u l�nh ph�",0,102,2531},5},
			[12] = {{"Thi�n Chi Li�u T��ng Qu�n Chi�n Kh�i",0,103,3020},5},
			[13] = {{"Thi�n Chi Li�u T��ng Qu�n Chi�n B�o",0,100,3020},5},
			[14] = {{"Thi�n Chi Li�u T��ng Qu�n Chi�n Trang",0,101,3020},5},
			[15] = {{"Thi�n Chi Li�u T��ng Qu�n L�nh B�i",0,102,3044},5},
			[16] = {{"Thi�n Chi Li�u T��ng Qu�n C� L�nh",0,102,3048},5},
			[17] = {{"Thi�n Chi Li�u T��ng Qu�n L�nh Ph�",0,102,3052},5},
			[18] = {{"Li�u nguy�n so�i ��u kh�i",0,103,2255},6},
			[19] = {{"Li�u nguy�n so�i chi�n b�o",0,100,2255},6},
			[20] = {{"Li�u nguy�n so�i chi�n ph�c",0,101,2255},6},
			[21] = {{"Li�u nguy�n so�i h� ph�",0,102,2311},6},
			[22] = {{"Li�u nguy�n so�i l�nh k�",0,102,2315},6},
			[23] = {{"Li�u so�i ph�",0,102,2511},6},
			[24] = {{"Li�u so�i k�",0,102,2515},6},
			[25] = {{"Li�u qu�n ph�c",0,109,996},3},
			[26] = {{"Li�u-V�nh C�u nguy�n so�i ��u kh�i",0,103,3004},6},
			[27] = {{"Li�u-V�nh C�u nguy�n so�i Chi�n Gi�p ",0,100,3004},6},
			[28] = {{"Li�u-V�nh C�u nguy�n so�i Chi�n ph�c",0,101,3004},6},
			[29] = {{"Li�u-V�nh C�u Nguy�n so�i hi�u k�",0,102,3028},6},
			[30] = {{"Li�u-V�nh C�u Nguy�n so�i hi�u ph�",0,102,3024},6},
			[31] = {{"Li�u-V�nh C�u nguy�n so�i l�nh k�",0,102,3020},6},
			[32] = {{"Li�u-V�nh C�u nguy�n so�i h� ph�",0,102,3016},6},
			[33] = {{"Chi�u Th�nh Nguy�n So�i Chi�n Gi�p",0,100,3012},6},
			[34] = {{"��i Li�u Nguy�n So�i Chi�n B�o",0,100,3028},6},
			[35] = {{"��i Li�u Nguy�n So�i H� Ph�",0,102,3072},6},
			[36] = {{"��i Li�u Nguy�n So�i L�nh K�",0,102,3076},6},
			[37] = {{"��i Li�u Nguy�n So�i Hi�u Ph�",0,102,3080},6},
			[38] = {{"��i Li�u Nguy�n So�i Hi�u K�",0,102,3084},6},
			[39] = {{"Li�u T��ng Qu�n Chi�n B�o",0,100,3020},5},
			[40] = {{"Li�u T��ng Qu�n Chi�n Trang",0,101,3020},5},
			[41] = {{"Li�u T��ng Qu�n Chi�n Kh�i",0,103,3020},5},
			[42] = {{"Thi�n Chi Li�u T��ng Qu�n L�nh B�i",0,102,3044},5},
			[43] = {{"Thi�n Chi Li�u T��ng Qu�n L�nh K�",0,102,3048},5},
			[44] = {{"Thi�n Chi Li�u T��ng Qu�n L�nh Ph�",0,102,3052},5},
			[45] = {{"Chi�u Th�nh Nguy�n So�i Kh�i",0,103,3012},6},
			[46] = {{"Chi�u Th�nh Nguy�n So�i Chi�nTrang",0,101,3012},6},
			[47] = {{"��i Li�u Nguy�n So�i Chi�n Kh�i",0,103,3028},6},
			[48] = {{"��i Li�u Nguy�n So�i Chi�n Trang",0,101,3028},6},
			[49] = {{"Chi�u Th�nh Nguy�n So�i H� Ph�",0,102,3104},6},
			[50] = {{"Chi�u Th�nh Nguy�n So�i L�nh K�",0,102,3108},6},
			[51] = {{"Chi�u Th�nh Nguy�n So�i Hi�u Ph�",0,102,3112},6},
			[52] = {{"Chi�u Th�nh Nguy�n So�i Hi�u K�",0,102,3116},6},
			[53] = 	{{"Li�u Ng� Long T��ng Qu�n Kh�i ",0,103,30021},5},
			[54] = 	{{"Li�u Ng� Long T��ng Qu�n Kh�i ",0,103,30022},5},
			[55] = 	{{"Li�u Ng� Long T��ng Qu�n Kh�i ",0,103,30023},5},
			[56] = 	{{"Li�u Ng� Long T��ng Qu�n Kh�i ",0,103,30024},5},
			[57] = 	{{"Li�uNg� Long T��ng Qu�n B�o ",0,100,30021},5},
			[58] = 	{{"Li�uNg� Long T��ng Qu�n B�o ",0,100,30022},5},
			[59] = 	{{"Li�uNg� Long T��ng Qu�n B�o ",0,100,30023},5},
			[60] = 	{{"Li�uNg� Long T��ng Qu�n B�o ",0,100,30024},5},
			[61] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh B�i ",0,102,30025},5},
			[62] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh B�i ",0,102,30026},5},
			[63] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh B�i ",0,102,30027},5},
			[64] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh B�i ",0,102,30028},5},
			[65] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh K� ",0,102,30029},5},
			[66] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh K� ",0,102,30030},5},
			[67] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh K� ",0,102,30031},5},
			[68] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh K� ",0,102,30032},5},
			[69] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh Ph�",0,102,30033},5},
			[70] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh Ph�",0,102,30034},5},
			[71] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh Ph�",0,102,30035},5},
			[72] = 	{{"Li�u Ng� Long T��ng Qu�n L�nh Ph�",0,102,30036},5},
			[73] = 	{{"Li�u Ng� Long T��ng Qu�n Trang",0,101,30021},5},
			[74] = 	{{"Li�u Ng� Long T��ng Qu�n Trang",0,101,30022},5},
			[75] = 	{{"Li�u Ng� Long T��ng Qu�n Trang",0,101,30023},5},
			[76] = 	{{"Li�u Ng� Long T��ng Qu�n Trang",0,101,30024},5},
            [77] =   {{"Li�u Th��ng �ng �� Th�ng kh�i",0,103,30041},3},
            [78] =   {{"Li�u Th��ng �ng T��ng Qu�n kh�i",0,103,30045},5},
            [79] =   {{"Li�u Th��ng �ng So�i kh�i",0,103,30049},6},
            [80] =   {{"Li�u Th��ng �ng �� Th�ng b�o",0,100,30041},3},
            [81] =   {{"Li�u Th��ng �ng T��ng Qu�n b�o",0,100,30045},5},
            [82] =   {{"Li�u Th��ng �ng So�i b�o",0,100,30049},6},
            [83] =   {{"Li�u Th��ng �ng �� Th�ng trang",0,101,30041},3},
            [84] =   {{"Li�u Th��ng �ng T��ng Qu�n trang ",0,101,30045},5},
            [85] =   {{"Li�u Th��ng �ng So�i trang",0,101,30049},6},
            [86] =   {{"Li�u Th��ng �ng Ti�n Phong k�",0,102,30080},4},
            [87] =   {{"Li�u Th��ng �ng Ti�n Phong ph�",0,102,30084},4},
            [88] =   {{"Li�u Th��ng �ng T��ng Qu�n l�nh",0,102,30088},5},
            [89] =   {{"Li�u Th��ng �ng T��ng Qu�n k�",0,102,30092},5},
            [90] =   {{"Li�u Th��ng �ng T��ng Qu�n ph�",0,102,30096},5},
            [91] =   {{"Li�u Th��ng �ng So�i H�",0,102,30100},6},
            [92] =   {{"Li�u Th��ng �ng So�i l�nh",0,102,30104},6},
            [93] =   {{"Li�u Th��ng �ng So�i ph� ",0,102,30108},6},
            [94] =   {{"Li�u Th��ng �ng So�i k� ",0,102,30112},6},
            [95] =   {{"Huy Ch��ng Li�u T��ng Qu�n",0,153,18},5},
            [96] =   {{"�o Cho�ng Li�u T��ng Qu�n",0,152,18},5},
            [97] =   {{"Chi�n H�i Li�u T��ng Qu�n",0,154,18},5},
            [98] =   {{"Huy Ch��ng Li�u Nguy�n So�i",0,153,22},6},
            [99] =   {{"�o Cho�ng Li�u Nguy�n So�i",0,152,22},6},
            [100] =   {{"Chi�n H�i Li�u Nguy�n So�i",0,154,22},6},
            
            [101] =   {{"Li�u L�i H� T��ng Kh�i",0,103,30227},5},
            [102] =   {{"Li�u L�i H� T��ng Kh�i",0,103,30228},5},
            [103] =   {{"Li�u L�i H� T��ng Kh�i",0,103,30229},5},
            [104] =   {{"Li�u L�i H� T��ng Kh�i",0,103,30230},5},
            [105] =   {{"Li�u L�i H� So�i Kh�i",0,103,30231},6},
            [106] =   {{"Li�u L�i H� So�i Kh�i",0,103,30232},6},
            [107] =   {{"Li�u L�i H� So�i Kh�i",0,103,30233},6},
            [108] =   {{"Li�u L�i H� So�i Kh�i",0,103,30234},6},
            [109] =   {{"Li�u L�i H� T��ng B�o",0,100,30227},5},
            [110] =   {{"Li�u L�i H� T��ng B�o",0,100,30228},5},
            [111] =   {{"Li�u L�i H� T��ng B�o",0,100,30229},5},
            [112] =   {{"Li�u L�i H� T��ng B�o",0,100,30230},5},
            [113] =   {{"Li�u L�i H� So�i B�o",0,100,30231},6},
            [114] =   {{"Li�u L�i H� So�i B�o",0,100,30232},6},
            [115] =   {{"Li�u L�i H� So�i B�o",0,100,30233},6},
            [116] =   {{"Li�u L�i H� So�i B�o",0,100,30234},6},
            [117] =   {{"Li�u L�i H� T��ng Trang",0,101,30227},5},
            [118] =   {{"Li�u L�i H� T��ng Trang",0,101,30228},5},
            [119] =   {{"Li�u L�i H� T��ng Trang",0,101,30229},5},
            [120] =   {{"Li�u L�i H� T��ng Trang",0,101,30230},5},
            [121] =   {{"Li�u L�i H� So�i Trang",0,101,30231},6},
            [122] =   {{"Li�u L�i H� So�i Trang",0,101,30232},6},
            [123] =   {{"Li�u L�i H� So�i Trang",0,101,30233},6},
            [124] =   {{"Li�u L�i H� So�i Trang",0,101,30234},6},
            [125] =   {{"Li�u L�i H� T��ng B�i",0,102,30193},5},
            [126] =   {{"Li�u L�i H� T��ng B�i",0,102,30194},5},
            [127] =   {{"Li�u L�i H� T��ng B�i",0,102,30195},5},
            [128] =   {{"Li�u L�i H� T��ng B�i",0,102,30196},5},
            [129] =   {{"Li�u L�i H� T��ng K�",0,102,30197},5},
            [130] =   {{"Li�u L�i H� T��ng K�",0,102,30198},5},
            [131] =   {{"Li�u L�i H� T��ng K�",0,102,30199},5},
            [132] =   {{"Li�u L�i H� T��ng K�",0,102,30200},5},
            [133] =   {{"Li�u L�i H� T��ng Ph�",0,102,30201},5},
            [134] =   {{"Li�u L�i H� T��ng Ph�",0,102,30202},5},
            [135] =   {{"Li�u L�i H� T��ng Ph�",0,102,30203},5},
            [136] =   {{"Li�u L�i H� T��ng Ph�",0,102,30204},5},
            [137] =   {{"Li�u L�i H� So�i Ph�",0,102,30205},6},
            [138] =   {{"Li�u L�i H� So�i Ph�",0,102,30206},6},
            [139] =   {{"Li�u L�i H� So�i Ph�",0,102,30207},6},
            [140] =   {{"Li�u L�i H� So�i Ph�",0,102,30208},6},
            [141] =   {{"Li�u L�i H� So�i H� Ph�",0,102,30209},6},
            [142] =   {{"Li�u L�i H� So�i H� Ph�",0,102,30210},6},
            [143] =   {{"Li�u L�i H� So�i H� Ph�",0,102,30211},6},
            [144] =   {{"Li�u L�i H� So�i H� Ph�",0,102,30212},6},
            [145] =   {{"Li�u L�i H� So�i K�",0,102,30213},6},
            [146] =   {{"Li�u L�i H� So�i K�",0,102,30214},6},
            [147] =   {{"Li�u L�i H� So�i K�",0,102,30215},6},
            [148] =   {{"Li�u L�i H� So�i K�",0,102,30216},6},
            [149] =   {{"Li�u L�i H� So�i Hi�u K�",0,102,30217},6},
            [150] =   {{"Li�u L�i H� So�i Hi�u K�",0,102,30218},6},
            [151] =   {{"Li�u L�i H� So�i Hi�u K�",0,102,30219},6},
            [152] =   {{"Li�u L�i H� So�i Hi�u K�",0,102,30220},6},
		},
}

function CanEquip(nItemIdx)
	if check_palyer_state(nItemIdx) == 0 then
		return 1;	--���ܴ�
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
--���װ������Ӫ����table�е�����
function get_equip_index(nItemIdx)
	local nGenre = GetItemGenre(nItemIdx);
	local nDetail = GetItemDetail(nItemIdx);
	local nParticular = GetItemParticular(nItemIdx);
	local nBody = GetBody();
	for i=1,getn(tBattleEquip) do 
		for j=1,getn(tBattleEquip[i]) do
			local tEquipInfo = tBattleEquip[i][j][1];
			if tEquipInfo[2] == nGenre and tEquipInfo[3] == nDetail and tEquipInfo[4]+nBody-1 == nParticular then
				return i,j;	--��Ӫ����table�е�����
			end;
		end;
	end;
	return 0,0;
end;

function check_palyer_state(nItemIdx)
	local nEquipCamp,nEquipIdx = get_equip_index(nItemIdx);
	if nEquipCamp == 0 then
		Msg2Player("��y kh�ng ph�i l� trang b� chi�n tr�n ");
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
		Msg2Player("Qu�n h�m c�a b�n hi�n m�i l� Binh s�, kh�ng th� nh�n trang b�"..sEquipName)
		return 0;	
	end;
	local nNeedRank = tBattleEquip[nEquipCamp][nEquipIdx][2];
	if (nEquipCamp ~= nPlayerCamp) then
		if nPlayerCamp == SONG_ID then
			Msg2Player("Ng��i l� phe T�ng, kh�ng th� m�c trang b� phe Li�u");
		else
			Msg2Player("Ng��i l� phe Li�u, kh�ng th� m�c trang b� phe T�ng");
		end;
		return 0;
	end;
	nCurRank = abs(nCurRank);
	if nCurRank < nNeedRank then
		Msg2Player("Qu�n h�m c�a b�n qu� th�p, kh�ng th� trang b�"..sEquipName);
		return 0;
	end;
	return 1;
end;
