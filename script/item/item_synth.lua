--脚本功能：剑网2越南-2011年六月资料片-合成道具调用统一界面
--功能设计：大熊
--功能开发：村长
--功能测试：小熊
--开发时间：2011-5-5
--修改记录：
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
nTaskTempId_Item_HashCode = 249
SClew = "<color=green>Th玭g b竜<color>:"
tEquipSeriesName = {
	"Tinh Kh綾","Thi猲 Ngh躠","C鰑 Ch﹗","H筼 Nguy謙","Di謚 Dng"
}
tEquipPosName = {
	"u","Thng y","H? y","V? kh?","Trang s鴆"
}
--===装备发放禁止表
tReleaseForbiddenList = {
	tMetiral = {
		["H筼 Nguy謙 Huy襫 Kim"] = 1,
		["Ng? H祅h Huy襫 Kim"] = 1,
		["Di謚 Dng C鰑 Huy襫"] = 1,
	},
	tEquip = {
		--皓月：全屏蔽
		[4] ={1,2,3,4,5},
		--耀阳：全屏蔽
		[5] = {1,2,3,4,5},
	},
}
tMetiralInfo = {
	["M秐h Tinh Ng蕁"] = {
		{2,1,30299},
		"Tham gia di詎 v? Thi猲 M玭 Tr薾 c? th? nh薾 頲 ",
	},
	["Ng? H祅h Huy襫 Th筩h"] = {
		{2,1,30302},
		"Tham gia vt 秈 Lng S琻 nh薾 頲 ",
	},
	["Thi猲Ngh躠 TinhThi誸"] = {
		{2,1,30300},
		"N﹏g c蕄 t?  M秐h Tinh Ng﹏ ",
	},
	["Ng? H祅h Huy襫 Thi誸"] = {
		{2,1,30303},
		"N﹏g c蕄 t? Ng? H祅h Huy襫 Th筩h",
	},
	["Thi猲 Cang L謓h"] = {
		{2,95,204},
		"Ngu錸 xu蕋 hi謓 t? vt 秈 Lng S琻 ",
	},
	["H筼 Nguy謙 Huy襫 Kim"] = {
		{2,1,30301},
		"N﹏g c蕄 t? Thi猲 Ngh躠 Tinh Thi誸 ",
	},
	["Ng? H祅h Huy襫 Kim"] = {
		{2,1,30304},
		"N﹏g c蕄 t? Ng? H祅h Huy襫 Thi誸 ",
	},
	["Di謚 Dng C鰑 Huy襫"] = {
		{2,1,30298},
		"Gh衟 t? Thi猲 Cang L謓h (vt 秈 Lng S琻), H筼 Nguy謙 Huy襫 Kim, v? Ng? h祅h Huy襫 Kim ",
	},
}
tItemSynthInfo = {
	["Thi猲Ngh躠 TinhThi誸"] = {
		{
			{"M秐h Tinh Ng蕁",2},
			{" Kim ",2},
		},
		2
	},
	["Ng? H祅h Huy襫 Thi誸"] = {
		{
			{"Ng? H祅h Huy襫 Th筩h",2},
			{" Kim ",2},
		},
		2
	},
	["H筼 Nguy謙 Huy襫 Kim"] = {
		{
			{"Thi猲Ngh躠 TinhThi誸",3},
			{" Kim ",6},
		},
		6
	},
	["Ng? H祅h Huy襫 Kim"] = {
		{
			{"Ng? H祅h Huy襫 Thi誸",3},
			{" Kim ",6},
		},
		6
	},
	["Di謚 Dng C鰑 Huy襫"] = {
		{
			{"Thi猲 Cang L謓h",3},
			{"Ng? H祅h Huy襫 Kim",99},
			{"H筼 Nguy謙 Huy襫 Kim",99},
		},
		2
	},

}
tArmIdInfo = {
	[1] = {
		[1] = {
			{
				{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3033},{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3036},
			},{
				{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3039},{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3042},
			},{
				{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3045},{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3048},
			},{
				{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3051},{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3054},
			},
		},
		[2] = {
			{
				{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3034},{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3037}
			},{
				{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3040},{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3043}
			},{
				{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3046},{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3049}
			},{
				{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3052},{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3055}
			},
		},
		[3] = {
			{
				{"Long Щng T? H秈 Qu竛",0,103,3056},{"Ph鬾g V? C鰑 Thi猲 Qu竛",0,103,3060}
			},{
				{"Long Щng T? H秈 Qu竛",0,103,3057},{"Ph鬾g V? C鰑 Thi猲 Qu竛",0,103,3061}
			},{
				{"Long Щng T? H秈 Qu竛",0,103,3058},{"Ph鬾g V? C鰑 Thi猲 Qu竛",0,103,3062}
			},{
				{"Long Щng T? H秈 Qu竛",0,103,3059},{"Ph鬾g V? C鰑 Thi猲 Qu竛",0,103,3063}
			},
		},
		[4] = {
			[2] = 	{{"H筼 Nguy謙-ч N筺 T玭 Gi? M穙",0,103,3064},	{"H筼 Nguy謙-ч N筺 T玭 Gi? M穙",0,103,3065}},
			[3] = 	{{"H筼 Nguy謙-ч 竎h T玭 Gi? M穙",0,103,3068},	{"H筼 Nguy謙-ч 竎h T玭 Gi? M穙",0,103,3069}},
			[4] = 	{{"H筼 Nguy謙-ч Ki誴 T玭 Gi? M穙",0,103,3066},	{"H筼 Nguy謙-ч Ki誴 T玭 Gi? M穙",0,103,3067}},
			[6] = 	{{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3070},	{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3071},{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3072},{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3073}},
			[8] = 	{nil,								nil,							{"H筼 Nguy謙-Ph藅 V﹏ Th竛h C? Tr﹎",0,103,3074},{"H筼 Nguy謙-Ph藅 V﹏ Th竛h C? Tr﹎",0,103,3075}},
			[9] = 	{nil,								nil,							{"H筼 Nguy謙-Ph藅 Tr莕 Th竛h C? Tr﹎",0,103,3076},{"H筼 Nguy謙-Ph藅 Tr莕 Th竛h C? Tr﹎",0,103,3077}},
			[11] = 	{{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3078},	{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3079},{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3080},{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3081}},
			[12] = 	{{"H筼 Nguy謙-Du Long мa Kh蕋 C﹏",0,103,3082},	{"H筼 Nguy謙-Du Long мa Kh蕋 C﹏",0,103,3083},{"H筼 Nguy謙-Du Long мa Kh蕋 C﹏",0,103,3084},{"H筼 Nguy謙-Du Long мa Kh蕋 C﹏",0,103,3085}},
			[14] = 	{{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Qu竛",0,103,3086},	{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Qu竛",0,103,3087},{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Qu竛",0,103,3088},{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Qu竛",0,103,3089}},
			[15] = 	{{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3090},	{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3091},{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3092},{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3093}},
			[17] = 	{{"H筼 Nguy謙-C秏 Thi猲 u H錸 Kh玦",0,103,3094},	{"H筼 Nguy謙-C秏 Thi猲 u H錸 Kh玦",0,103,3095},{"H筼 Nguy謙-C秏 Thi猲 u H錸 Kh玦",0,103,3096},{"H筼 Nguy謙-C秏 Thi猲 u H錸 Kh玦",0,103,3097}},
			[18] = 	{{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3098},	{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3099},{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3100},{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3101}},
			[20] = 	{{"H筼 Nguy謙-Qu? X骳 T? Th莕 C﹏",0,103,3102},	{"H筼 Nguy謙-Qu? X骳 T? Th莕 C﹏",0,103,3103},{"H筼 Nguy謙-Qu? X骳 T? Th莕 C﹏",0,103,3104},{"H筼 Nguy謙-Qu? X骳 T? Th莕 C﹏",0,103,3105}},
			[21] = 	{{"H筼 Nguy謙-Vu C鑤 чc Vng C﹏",0,103,3106},	{"H筼 Nguy謙-Vu C鑤 чc Vng C﹏",0,103,3107},{"H筼 Nguy謙-Vu C鑤 чc Vng C﹏",0,103,3108},{"H筼 Nguy謙-Vu C鑤 чc Vng C﹏",0,103,3109}},
			[23] =  {{"H筼 Nguy謙-B蕋 чng Ch﹏ Ti猲 Qu竛",0,103,3110}, {"H筼 Nguy謙-B蕋 чng Ch﹏ Ti猲 Qu竛",0,103,3111},nil,nil},
			[29] =  {nil,nil,{"H筼 Nguy謙-T? V﹏ Ti猲 T? Tr﹎",0,103,3124},{"H筼 Nguy謙-T? V﹏ Ti猲 T? Tr﹎",	0,103,3125}},
			[30] =  {nil,nil,{"H筼 Nguy謙-Phi H? Ti猲 T? Tr﹎",0,103,3126},{"H筼 Nguy謙-Phi H? Ti猲 T? Tr﹎",	0,103,3127}},
		},
		[5] = {
			[2] = 	{{"Di謚 Dng-ч N筺 T玭 Gi? M穙",0,103,3128},	{"Di謚 Dng-ч N筺 T玭 Gi? M穙",0,103,3129}},
			[3] = 	{{"Di謚 Dng-ч 竎h T玭 Gi? M穙",0,103,3132},	{"Di謚 Dng-ч 竎h T玭 Gi? M穙",0,103,3133}},
			[4] = 	{{"Di謚 Dng-ч Ki誴 T玭 Gi? M穙",0,103,3130},	{"Di謚 Dng-ч Ki誴 T玭 Gi? M穙",0,103,3131}},
			[6] = 	{{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3134},	{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3135},{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3136},{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Qu竛",0,103,3137}},
			[8] = 	{nil,								nil,							{"Di謚 Dng-Ph藅 V﹏ Th竛h C? Tr﹎",0,103,3138},{"Di謚 Dng-Ph藅 V﹏ Th竛h C? Tr﹎",0,103,3139}},
			[9] = 	{nil,								nil,							{"Di謚 Dng-Ph藅 Tr莕 Th竛h C? Tr﹎",0,103,3140},{"Di謚 Dng-Ph藅 Tr莕 Th竛h C? Tr﹎",0,103,3141}},
			[11] = 	{{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3142},	{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3143},{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3144},{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 C﹏",0,103,3145}},
			[12] = 	{{"Di謚 Dng-Du Long мa Kh蕋 C﹏",0,103,3146},	{"Di謚 Dng-Du Long мa Kh蕋 C﹏",0,103,3147},{"Di謚 Dng-Du Long мa Kh蕋 C﹏",0,103,3148},{"Di謚 Dng-Du Long мa Kh蕋 C﹏",0,103,3149}},
			[14] = 	{{"Di謚 Dng-V? C鵦 Thi猲 T玭 Qu竛",0,103,3150},	{"Di謚 Dng-V? C鵦 Thi猲 T玭 Qu竛",0,103,3151},{"Di謚 Dng-V? C鵦 Thi猲 T玭 Qu竛",0,103,3152},{"Di謚 Dng-V? C鵦 Thi猲 T玭 Qu竛",0,103,3153}},
			[15] = 	{{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3154},	{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3155},{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3156},{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Qu竛",0,103,3157}},
			[17] = 	{{"Di謚 Dng-C秏 Thi猲 u H錸 Kh玦",0,103,3158},	{"Di謚 Dng-C秏 Thi猲 u H錸 Kh玦",0,103,3159},{"Di謚 Dng-C秏 Thi猲 u H錸 Kh玦",0,103,3160},{"Di謚 Dng-C秏 Thi猲 u H錸 Kh玦",0,103,3161}},
			[18] = 	{{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3162},	{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3163},{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3164},{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Kh玦",0,103,3165}},
			[20] = 	{{"Di謚 Dng-Qu? X骳 T? Th莕 C﹏",0,103,3166},	{"Di謚 Dng-Qu? X骳 T? Th莕 C﹏",0,103,3167},{"Di謚 Dng-Qu? X骳 T? Th莕 C﹏",0,103,3168},{"Di謚 Dng-Qu? X骳 T? Th莕 C﹏",0,103,3169}},
			[21] = 	{{"Di謚 Dng-Vu C鑤 чc Vng C﹏",0,103,3170},	{"Di謚 Dng-Vu C鑤 чc Vng C﹏",0,103,3171},{"Di謚 Dng-Vu C鑤 чc Vng C﹏",0,103,3172},{"Di謚 Dng-Vu C鑤 чc Vng C﹏",0,103,3173}},
			[23] =  {{"Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Qu竛",0,103,3174}, {"Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Qu竛",0,103,3175},nil,nil},
			[29] =  {nil,nil,{"Di謚 Dng-T? V﹏ Ti猲 T? Tr﹎",0,103,3188},{"Di謚 Dng-T? V﹏ Ti猲 T? Tr﹎",	0,103,3189}},
			[30] =  {nil,nil,{"Di謚 Dng-Phi H? Ti猲 T? Tr﹎",0,103,3190},{"Di謚 Dng-Phi H? Ti猲 T? Tr﹎",	0,103,3191}},
		},
	},
	[2] ={
		[1] = {
			{
				{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3033},{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3036}
			},{
				{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3039},{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3042}
			},{
				{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3045},{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3048}
			},{
				{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3051},{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3054}
			},
		},
		[2] = {
			{
				{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3034},{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3037}
			},{
				{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3040},{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3043}
			},{
				{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3046},{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3049}
			},{
				{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3052},{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3055}
			},
		},
		[3] = {
			{
				{"Long Щng T? H秈 Y",0,100,3056},{"Ph鬾g V? C鰑 Thi猲 Y",0,100,3060},
			},{
				{"Long Щng T? H秈 Y",0,100,3057},{"Ph鬾g V? C鰑 Thi猲 Y",0,100,3061},
			},{
				{"Long Щng T? H秈 Y",0,100,3058},{"Ph鬾g V? C鰑 Thi猲 Y",0,100,3062},
			},{
				{"Long Щng T? H秈 Y",0,100,3059},{"Ph鬾g V? C鰑 Thi猲 Y",0,100,3063},
			},
		},
		[4] = {
			[2] = 	{{"H筼 Nguy謙-ч N筺 T玭 Gi? B祇",0,100,3064},	{"H筼 Nguy謙-ч N筺 T玭 Gi? B祇",0,100,3065}},
			[3] = 	{{"H筼 Nguy謙-ч 竎h T玭 Gi? B祇",0,100,3068},	{"H筼 Nguy謙-ч 竎h T玭 Gi? B祇",0,100,3069}},
			[4] = 	{{"H筼 Nguy謙-ч Ki誴 T玭 Gi? B祇",0,100,3066},	{"H筼 Nguy謙-ч Ki誴 T玭 Gi? B祇",0,100,3067}},
			[6] = 	{{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Y",0,100,3070},	{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Y",0,100,3071},{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Y",0,100,3072},{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Y",0,100,3073}},
			[8] = 	{nil,								nil,							{"H筼 Nguy謙-Ph藅 V﹏ Th竛h C? Y",0,100,3074},{"H筼 Nguy謙-Ph藅 V﹏ Th竛h C? Y",0,100,3075}},
			[9] = 	{nil,								nil,							{"H筼 Nguy謙-Ph藅 Tr莕 Th竛h C? Y",0,100,3076},{"H筼 Nguy謙-Ph藅 Tr莕 Th竛h C? Y",0,100,3077}},
			[11] = 	{{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3078},	{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3079},{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3080},{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3081}},
			[12] = 	{{"H筼 Nguy謙-Du Long мa Kh蕋 Y",0,100,3082},	{"H筼 Nguy謙-Du Long мa Kh蕋 Y",0,100,3083},{"H筼 Nguy謙-Du Long мa Kh蕋 Y",0,100,3084},{"H筼 Nguy謙-Du Long мa Kh蕋 Y",0,100,3085}},
			[14] = 	{{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 B祇",0,100,3086},	{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 B祇",0,100,3087},{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 B祇",0,100,3088},{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 B祇",0,100,3089}},
			[15] = 	{{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 B祇",0,100,3090},	{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 B祇",0,100,3091},{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 B祇",0,100,3092},{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 B祇",0,100,3093}},
			[17] = 	{{"H筼 Nguy謙-C秏 Thi猲 u H錸 Gi竝",0,100,3094},	{"H筼 Nguy謙-C秏 Thi猲 u H錸 Gi竝",0,100,3095},{"H筼 Nguy謙-C秏 Thi猲 u H錸 Gi竝",0,100,3096},{"H筼 Nguy謙-C秏 Thi猲 u H錸 Gi竝",0,100,3097}},
			[18] = 	{{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3098},	{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3099},{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3100},{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3101}},
			[20] = 	{{"H筼 Nguy謙-Qu? X骳 T? Th莕 Y",0,100,3102},	{"H筼 Nguy謙-Qu? X骳 T? Th莕 Y",0,100,3103},{"H筼 Nguy謙-Qu? X骳 T? Th莕 Y",0,100,3104},{"H筼 Nguy謙-Qu? X骳 T? Th莕 Y",0,100,3105}},
			[21] = 	{{"H筼 Nguy謙-Vu C鑤 чc Vng Y",0,100,3106},	{"H筼 Nguy謙-Vu C鑤 чc Vng Y",0,100,3107},{"H筼 Nguy謙-Vu C鑤 чc Vng Y",0,100,3108},{"H筼 Nguy謙-Vu C鑤 чc Vng Y",0,100,3109}},
			[23] =  {{"H筼 Nguy謙-B蕋 чng Ch﹏ Ti猲 B祇",0,100,3110}, {"H筼 Nguy謙-B蕋 чng Ch﹏ Ti猲 B祇",0,100,3111},nil,nil},
			[29] =  {nil,nil,{"H筼 Nguy謙-T? V﹏ Ti猲 T? Y",0,100,3124},{"H筼 Nguy謙-T? V﹏ Ti猲 T? Y",	0,100,3125}},
			[30] =  {nil,nil,{"H筼 Nguy謙-Phi H? Ti猲 T? Y",0,100,3126},{"H筼 Nguy謙-Phi H? Ti猲 T? Y",	0,100,3127}},
		},
		[5] = {
			[2] = 	{{"Di謚 Dng-ч N筺 T玭 Gi? B祇",0,100,3128},	{"Di謚 Dng-ч N筺 T玭 Gi? B祇",0,100,3129}},
			[3] = 	{{"Di謚 Dng-ч 竎h T玭 Gi? B祇",0,100,3132},	{"Di謚 Dng-ч 竎h T玭 Gi? B祇",0,100,3133}},
			[4] = 	{{"Di謚 Dng-ч Ki誴 T玭 Gi? B祇",0,100,3130},	{"Di謚 Dng-ч Ki誴 T玭 Gi? B祇",0,100,3131}},
			[6] = 	{{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Y",0,100,3134},	{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Y",0,100,3135},{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Y",0,100,3136},{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Y",0,100,3137}},
			[8] = 	{nil,								nil,							{"Di謚 Dng-Ph藅 V﹏ Th竛h C? Y",0,100,3138},{"Di謚 Dng-Ph藅 V﹏ Th竛h C? Y",0,100,3139}},
			[9] = 	{nil,								nil,							{"Di謚 Dng-Ph藅 Tr莕 Th竛h C? Y",0,100,3140},{"Di謚 Dng-Ph藅 Tr莕 Th竛h C? Y",0,100,3141}},
			[11] = 	{{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3142},	{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3143},{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3144},{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Y",0,100,3145}},
			[12] = 	{{"Di謚 Dng-Du Long мa Kh蕋 Y",0,100,3146},	{"Di謚 Dng-Du Long мa Kh蕋 Y",0,100,3147},{"Di謚 Dng-Du Long мa Kh蕋 Y",0,100,3148},{"Di謚 Dng-Du Long мa Kh蕋 Y",0,100,3149}},
			[14] = 	{{"Di謚 Dng-V? C鵦 Thi猲 T玭 B祇",0,100,3150},	{"Di謚 Dng-V? C鵦 Thi猲 T玭 B祇",0,100,3151},{"Di謚 Dng-V? C鵦 Thi猲 T玭 B祇",0,100,3152},{"Di謚 Dng-V? C鵦 Thi猲 T玭 B祇",0,100,3153}},
			[15] = 	{{"Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇",0,100,3154},	{"Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇",0,100,3155},{"Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇",0,100,3156},{"Di謚 Dng-B輈h L筩 Thi猲 T玭 B祇",0,100,3157}},
			[17] = 	{{"Di謚 Dng-C秏 Thi猲 u H錸 Gi竝",0,100,3158},	{"Di謚 Dng-C秏 Thi猲 u H錸 Gi竝",0,100,3159},{"Di謚 Dng-C秏 Thi猲 u H錸 Gi竝",0,100,3160},{"Di謚 Dng-C秏 Thi猲 u H錸 Gi竝",0,100,3161}},
			[18] = 	{{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3162},	{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3163},{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3164},{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Gi竝",0,100,3165}},
			[20] = 	{{"Di謚 Dng-Qu? X骳 T? Th莕 Y",0,100,3166},	{"Di謚 Dng-Qu? X骳 T? Th莕 Y",0,100,3167},{"Di謚 Dng-Qu? X骳 T? Th莕 Y",0,100,3168},{"Di謚 Dng-Qu? X骳 T? Th莕 Y",0,100,3169}},
			[21] = 	{{"Di謚 Dng-Vu C鑤 чc Vng Y",0,100,3170},	{"Di謚 Dng-Vu C鑤 чc Vng Y",0,100,3171},{"Di謚 Dng-Vu C鑤 чc Vng Y",0,100,3172},{"Di謚 Dng-Vu C鑤 чc Vng Y",0,100,3173}},
			[23] =  {{"Di謚 Dng-B蕋 чng Ch﹏ Ti猲 B祇",0,100,3174}, {"Di謚 Dng-B蕋 чng Ch﹏ Ti猲 B祇",0,100,3175},nil,nil},
			[29] =  {nil,nil,{"Di謚 Dng-T? V﹏ Ti猲 T? Y",0,100,3188},{"Di謚 Dng-T? V﹏ Ti猲 T? Y",	0,100,3189}},
			[30] =  {nil,nil,{"Di謚 Dng-Phi H? Ti猲 T? Y",0,100,3190},{"Di謚 Dng-Phi H? Ti猲 T? Y",	0,100,3191}},
		},
	},
	[3] ={
		[1] = {
			{
				{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3033},{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3036},
			},{
				{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3039},{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3042},
			},{
				{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3045},{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3048},
			},{
				{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3051},{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3054}
			},
		},
		[2] = {
			{
				{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3034},{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3037},
			},{
				{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3040},{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3043},
			},{
				{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3046},{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3049},
			},{
				{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3052},{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3055},
			},
		},
		[3] = {
			{
				{"Long Щng T? H秈 Trang",0,101,3056},{"Ph鬾g V? C鰑 Thi猲 Trang",0,101,3060},
			},{
				{"Long Щng T? H秈 Trang",0,101,3057},{"Ph鬾g V? C鰑 Thi猲 Trang",0,101,3061},
			},{
				{"Long Щng T? H秈 Trang",0,101,3058},{"Ph鬾g V? C鰑 Thi猲 Trang",0,101,3062},
			},{
				{"Long Щng T? H秈 Trang",0,101,3059},{"Ph鬾g V? C鰑 Thi猲 Trang",0,101,3063},
			},
		},
		[4] = {
			[2] = 	{{"H筼 Nguy謙-ч N筺 T玭 Gi? Trang",0,101,3064},	{"H筼 Nguy謙-ч N筺 T玭 Gi? Trang",0,101,3065}},
			[3] = 	{{"H筼 Nguy謙-ч 竎h T玭 Gi? Trang",0,101,3068},	{"H筼 Nguy謙-ч 竎h T玭 Gi? Trang",0,101,3069}},
			[4] = 	{{"H筼 Nguy謙-ч Ki誴 T玭 Gi? Trang",0,101,3066},	{"H筼 Nguy謙-ч Ki誴 T玭 Gi? Trang",0,101,3067}},
			[6] = 	{{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Trang",0,101,3070},	{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Trang",0,101,3071},{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Trang",0,101,3072},{"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Trang",0,101,3073}},
			[8] = 	{nil,								nil,							{"H筼 Nguy謙-Ph藅 V﹏ Th竛h C? Qu莕",0,101,3074},{"H筼 Nguy謙-Ph藅 V﹏ Th竛h C? Qu莕",0,101,3075}},
			[9] = 	{nil,								nil,							{"H筼 Nguy謙-Ph藅 Tr莕 Th竛h C? Qu莕",0,101,3076},{"H筼 Nguy謙-Ph藅 Tr莕 Th竛h C? Qu莕",0,101,3077}},
			[11] = 	{{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3078},	{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3079},{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3080},{"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3081}},
			[12] = 	{{"H筼 Nguy謙-Du Long мa Kh蕋 Trang",0,101,3082},	{"H筼 Nguy謙-Du Long мa Kh蕋 Trang",0,101,3083},{"H筼 Nguy謙-Du Long мa Kh蕋 Trang",0,101,3084},{"H筼 Nguy謙-Du Long мa Kh蕋 Trang",0,101,3085}},
			[14] = 	{{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Trang",0,101,3086},	{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Trang",0,101,3087},{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Trang",0,101,3088},{"H筼 Nguy謙-V? C鵦 Thi猲 T玭 Trang",0,101,3089}},
			[15] = 	{{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Trang",0,101,3090},	{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Trang",0,101,3091},{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Trang",0,101,3092},{"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 Trang",0,101,3093}},
			[17] = 	{{"H筼 Nguy謙-C秏 Thi猲 u H錸 Trang",0,101,3094},	{"H筼 Nguy謙-C秏 Thi猲 u H錸 Trang",0,101,3095},{"H筼 Nguy謙-C秏 Thi猲 u H錸 Trang",0,101,3096},{"H筼 Nguy謙-C秏 Thi猲 u H錸 Trang",0,101,3097}},
			[18] = 	{{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Trang",0,101,3098},	{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Trang",0,101,3099},{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Trang",0,101,3100},{"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Trang",0,101,3101}},
			[20] = 	{{"H筼 Nguy謙-Qu? X骳 T? Th莕 Trang",0,101,3102},	{"H筼 Nguy謙-Qu? X骳 T? Th莕 Trang",0,101,3103},{"H筼 Nguy謙-Qu? X骳 T? Th莕 Trang",0,101,3104},{"H筼 Nguy謙-Qu? X骳 T? Th莕 Trang",0,101,3105}},
			[21] = 	{{"H筼 Nguy謙-Vu C鑤 чc Vng Trang",0,101,3106},	{"H筼 Nguy謙-Vu C鑤 чc Vng Trang",0,101,3107},{"H筼 Nguy謙-Vu C鑤 чc Vng Trang",0,101,3108},{"H筼 Nguy謙-Vu C鑤 чc Vng Trang",0,101,3109}},
			[23] =  {{"H筼 Nguy謙-B蕋 чng Ch﹏ Ti猲 Trang",0,101,3110}, {"H筼 Nguy謙-B蕋 чng Ch﹏ Ti猲 Trang",0,101,3111},nil,nil},
			[29] =  {nil,nil,{"H筼 Nguy謙-T? V﹏ Ti猲 T? Qu莕",0,101,3124},{"H筼 Nguy謙-T? V﹏ Ti猲 T? Qu莕",	0,101,3125}},
			[30] =  {nil,nil,{"H筼 Nguy謙-Phi H? Ti猲 T? ",0,101,3126},{"H筼 Nguy謙-Phi H? Ti猲 T? ",	0,101,3127}},
		},
		[5] = {
			[2] = 	{{"Di謚 Dng-ч N筺 T玭 Gi? Trang",0,101,3128},	{"Di謚 Dng-ч N筺 T玭 Gi? Trang",0,101,3129}},
			[3] = 	{{"Di謚 Dng-ч 竎h T玭 Gi? Trang",0,101,3132},	{"Di謚 Dng-ч 竎h T玭 Gi? Trang",0,101,3133}},
			[4] = 	{{"Di謚 Dng-ч Ki誴 T玭 Gi? Trang",0,101,3130},	{"Di謚 Dng-ч Ki誴 T玭 Gi? Trang",0,101,3131}},
			[6] = 	{{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Trang",0,101,3134},	{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Trang",0,101,3135},{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Trang",0,101,3136},{"Di謚 Dng-V筺 Ki誴 Th竛h Th? Trang",0,101,3137}},
			[8] = 	{nil,								nil,							{"Di謚 Dng-Ph藅 V﹏ Th竛h C? Qu莕",0,101,3138},{"Di謚 Dng-Ph藅 V﹏ Th竛h C? Qu莕",0,101,3139}},
			[9] = 	{nil,								nil,							{"Di謚 Dng-Ph藅 Tr莕 Th竛h C? Qu莕",0,101,3140},{"Di謚 Dng-Ph藅 Tr莕 Th竛h C? Qu莕",0,101,3141}},
			[11] = 	{{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3142},	{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3143},{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3144},{"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Trang",0,101,3145}},
			[12] = 	{{"Di謚 Dng-Du Long мa Kh蕋 Trang",0,101,3146},	{"Di謚 Dng-Du Long мa Kh蕋 Trang",0,101,3147},{"Di謚 Dng-Du Long мa Kh蕋 Trang",0,101,3148},{"Di謚 Dng-Du Long мa Kh蕋 Trang",0,101,3149}},
			[14] = 	{{"Di謚 Dng-V? C鵦 Thi猲 T玭 Trang",0,101,3150},	{"Di謚 Dng-V? C鵦 Thi猲 T玭 Trang",0,101,3151},{"Di謚 Dng-V? C鵦 Thi猲 T玭 Trang",0,101,3152},{"Di謚 Dng-V? C鵦 Thi猲 T玭 Trang",0,101,3153}},
			[15] = 	{{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang",0,101,3154},	{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang",0,101,3155},{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang",0,101,3156},{"Di謚 Dng-B輈h L筩 Thi猲 T玭 Trang",0,101,3157}},
			[17] = 	{{"Di謚 Dng-C秏 Thi猲 u H錸 Trang",0,101,3158},	{"Di謚 Dng-C秏 Thi猲 u H錸 Trang",0,101,3159},{"Di謚 Dng-C秏 Thi猲 u H錸 Trang",0,101,3160},{"Di謚 Dng-C秏 Thi猲 u H錸 Trang",0,101,3161}},
			[18] = 	{{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Trang",0,101,3162},	{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Trang",0,101,3163},{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Trang",0,101,3164},{"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Trang",0,101,3165}},
			[20] = 	{{"Di謚 Dng-Qu? X骳 T? Th莕 Trang",0,101,3166},	{"Di謚 Dng-Qu? X骳 T? Th莕 Trang",0,101,3167},{"Di謚 Dng-Qu? X骳 T? Th莕 Trang",0,101,3168},{"Di謚 Dng-Qu? X骳 T? Th莕 Trang",0,101,3169}},
			[21] = 	{{"Di謚 Dng-Vu C鑤 чc Vng Trang",0,101,3170},	{"Di謚 Dng-Vu C鑤 чc Vng Trang",0,101,3171},{"Di謚 Dng-Vu C鑤 чc Vng Trang",0,101,3172},{"Di謚 Dng-Vu C鑤 чc Vng Trang",0,101,3173}},
			[23] =  {{"Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Trang",0,101,3174}, {"Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Trang",0,101,3175},nil,nil},
			[29] =  {nil,nil,{"Di謚 Dng-T? V﹏ Ti猲 T? Qu莕",0,101,3188},{"Di謚 Dng-T? V﹏ Ti猲 T? Qu莕",	0,101,3189}},
			[30] =  {nil,nil,{"Di謚 Dng-Phi H? Ti猲 T?",0,101,3190},{"Di謚 Dng-Phi H? Ti猲 T?",	0,101,3191}},
		},
	},
}
tRingIdInfo = {
	[1] = {
		{"Tinh Kh綾-Huy襫 Th筩h Kim Ng鋍 (trang s鴆 s鴆 m筺h)",0,102,3121},
		{"Tinh Kh綾-Ph? Th髖 M閏 ыi (trang s鴆 th﹏ ph竝)",0,102,3124},
		{"Tinh Kh綾-Nguy謙 Hoa Th駓 B閕 (trang s鴆 n閕 c玭g)",0,102,3127},
		{"Tinh Kh綾-C鰑  H醓 Gi韎 (trang s鴆 linh ho箃)",0,102,3130},
		{"Tinh Kh綾-Ng璶g Ng鋍 Th? Ho祅 (trang s鴆 g﹏ c鑤)",0,102,3133},
	},
	[2] = {
		{"Thi猲 Ngh躠-Huy襫 Th筩h Kim Ng鋍 (trang s鴆 s鴆 m筺h)",0,102,3122},
		{"Thi猲 Ngh躠- Ph? Th髖 M閏 ыi (trang s鴆 th﹏ ph竝)",0,102,3125},
		{"Thi猲 Ngh躠- Nguy謙 Hoa Th駓 B閕 (trang s鴆 n閕 c玭g)",0,102,3128},
		{"Thi猲 Ngh躠- C鰑  H醓 Gi韎 (trang s鴆 linh ho箃)",0,102,3131},
		{"Thi猲 Ngh躠- Ng璶g Ng鋍 Th? Ho祅 (trang s鴆 g﹏ c鑤)",0,102,3134},
	},
	[3] = {
		[2] = {
			{"C鰑 Ch﹗-Ng璶g Ng鋍 Th? Ho祅",0,102,3135},
			{"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3136},
		},
		[3] = {
			{"C鰑 Ch﹗-Ng璶g Ng鋍 Th? Ho祅",0,102,3137},
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3138},
		},
		[4] = {
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3139},
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3140},
		},
		[6] = {
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3141},
			{"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3142},
		},
		[8] = {
			{"C鰑 Ch﹗-Ng璶g Ng鋍 Th? Ho祅",0,102,3143},
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3144},
		},
		[9] = {
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3145},
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3146},
		},
		[11] = {
			{"C鰑 Ch﹗-Ng璶g Ng鋍 Th? Ho祅",0,102,3147},
			{"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3148},
		},
		[12] = {
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3149},
			{"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3150},
		},
		[14] = {
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3151},
			{"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3152},
		},
		[15] = {
			{"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3153},
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3154},
		},
		[17] = {
			{"C鰑 Ch﹗-Ng璶g Ng鋍 Th? Ho祅",0,102,3155},
			{"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3156},
		},
		[18] = {
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3157},
			{"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3158},
		},
		[20] = {
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3159},
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3160},
		},
		[21] = {
			{"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3161},
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3162},
		},
		[23] = {
			{"C鰑 Ch﹗-Nguy謙 Hoa Th駓 B閕",0,102,3163},
			{"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3164},
		},
		[29] = {
			{"C鰑 Ch﹗-Ph? Th髖 M閏 ыi",0,102,3171},
			{"C鰑 Ch﹗-Huy襫 Th筩h Kim Ng鋍",0,102,3172},
		},
		[30] = {
			{"C鰑 Ch﹗-Ng璶g Ng鋍 Th? Ho祅",0,102,3173},
			{"C鰑 Ch﹗-C鰑  H醓 Gi韎",0,102,3174},
		},
	},
	[4] = {
		{"H筼 Nguy謙-? L﹏ B秓 Gi韎 (trang s鴆 s鴆 m筺h)",0,102,3175},
		{"H筼 Nguy謙-T? Giao Ng鋍 B閕 (trang s鴆 th﹏ ph竝)",0,102,3177},
		{"H筼 Nguy謙-V﹏ H? L謓h B礽 (trang s鴆 n閕 c玭g)",0,102,3179},
		{"H筼 Nguy謙-X輈h Tc Ch? Ho祅 (trang s鴆 linh ho箃)",0,102,3181},
		{"H筼 Nguy謙-B輈h Quy H筺g Li猲 (trang s鴆 g﹏ c鑤)",0,102,3183},
	},
	[5] = {
		{"Di謚 Dng- ? L﹏ B秓 Gi韎 (trang s鴆 s鴆 m筺h)",0,102,3176},
		{"Di謚 Dng- T? Giao Ng鋍 B閕 (trang s鴆 th﹏ ph竝)",0,102,3178},
		{"Di謚 Dng- V﹏ H? L謓h B礽 (trang s鴆 n閕 c玭g)",0,102,3180},
		{"Di謚 Dng- X輈h Tc Ch? Ho祅 (trang s鴆 linh ho箃)",0,102,3182},
		{"Di謚 Dng- B輈h Quy H筺g Li猲 (trang s鴆 g﹏ c鑤)",0,102,3184},
	},
}
tWeaponIdInfo = {
	[1] = {
		[2]={"Tinh Kh綾-L璾 Ly Gi韎 o",0,3,8892},
		[3]={"Tinh Kh綾-Kinh L玦 Thi襫 Trng",0,8,8909},
		[4]={"Tinh Kh綾-L玦  Nang Th?",0,0,8874},
		[6]={"Tinh Kh綾- Dng Xuy猲 秐h",0,1,8879},
		[8]={"Tinh Kh綾-T? H祅  Ki誱",0,2,8884},
		[9]={"Tinh Kh綾-C鰑 Ho祅 B鑙 C莔",0,10,8918},
		[11]={"Tinh Kh綾-Quy L﹏ H? Th?",0,0,8875},
		[12]={"Tinh Kh綾-Tr蕁 Ng筼 C玭",0,5,8900},
		[14]={"Tinh Kh綾-Thu莕 Phong Ki誱",0,2,8885},
		[15]={"Tinh Kh綾-Tinh u Chuy觧 B髏",0,9,8913},
		[17]={"Tinh Kh綾-Ph? Qu﹏ Tr薾 Thng",0,6,8903},
		[18]={"Tinh Kh綾-Truy M謓h Cung",0,4,8897},
		[20]={"Tinh Kh綾-Thi謕 C鑤 Huy誸 o",0,7,8906},
		[21]={"Tinh Kh綾-Luy謓 H錸 Huy誸 Tr秓",0,11,8922},
		[23]={"Tinh Kh綾-Ng? Thi猲 Phong Ki誱",	0,	2,	8886},
		[29]={"Tinh Kh綾-Linh Lung Chi",	0,	13,	8930},
		[30]={"Tinh Kh綾-C鰑 Ti猽 S竜",	0,	12,	8927},
	},
	[2] = {
		[2]={"Thi猲 Ngh躠-L璾 Ly Gi韎 o",0,3,8894},
		[3]={"Thi猲 Ngh躠-Kinh L玦 Thi襫 Trng",0,8,8910},
		[4]={"Thi猲 Ngh躠-L玦  Nang Th?",0,0,8876},
		[6]={"Thi猲 Ngh躠- Dng Xuy猲 秐h",0,1,8880},
		[8]={"Thi猲 Ngh躠-T? H祅  Ki誱",0,2,8887},
		[9]={"Thi猲 Ngh躠-C鰑 Ho祅 B鑙 C莔",0,10,8919},
		[11]={"Thi猲 Ngh躠-Quy L﹏ H? Th?",0,0,8877},
		[12]={"Thi猲 Ngh躠-Tr蕁 Ng筼 C玭",0,5,8901},
		[14]={"Thi猲 Ngh躠-Thu莕 Phong Ki誱",0,2,8888},
		[15]={"Thi猲 Ngh躠-Tinh u Chuy觧 B髏",0,9,8915},
		[17]={"Thi猲 Ngh躠-Ph? Qu﹏ Tr薾 Thng",0,6,8904},
		[18]={"Thi猲 Ngh躠-Truy M謓h Cung",0,4,8898},
		[20]={"Thi猲 Ngh躠-Thi謕 C鑤 Huy誸 o",0,7,8907},
		[21]={"Thi猲 Ngh躠-Luy謓 H錸 Huy誸 Tr秓",0,11,8924},
		[23]={"Thi猲 Ngh躠-Ng? Thi猲 Phong Ki誱",	0,	2,	8889},
		[29]={"Thi猲 Ngh躠-Linh Lung Chi",	0,	13,	8931},
		[30]={"Thi猲 Ngh躠-C鰑 Ti猽 S竜",	0,	12,	8928},
	},
	[3] = {
		[2]={"C鰑 Ch﹗-L璾 Ly Gi韎 o",0,3,8932},
		[3]={"C鰑 Ch﹗-Kinh L玦 Thi襫 Trng",0,8,8934},
		[4]={"C鰑 Ch﹗-L玦  Nang Th?",0,0,8933},
		[6]={"C鰑 Ch﹗- Dng Xuy猲 秐h",0,1,8935},
		[8]={"C鰑 Ch﹗-T? H祅  Ki誱",0,2,8936},
		[9]={"C鰑 Ch﹗-C鰑 Ho祅 B鑙 C莔",0,10,8937},
		[11]={"C鰑 Ch﹗-Quy L﹏ H? Th?",0,0,8938},
		[12]={"C鰑 Ch﹗-Tr蕁 Ng筼 C玭",0,5,8939},
		[14]={"C鰑 Ch﹗-Thu莕 Phong Ki誱",0,2,8940},
		[15]={"C鰑 Ch﹗-Tinh u Chuy觧 B髏",0,9,8941},
		[17]={"C鰑 Ch﹗-Ph? Qu﹏ Tr薾 Thng",0,6,8942},
		[18]={"C鰑 Ch﹗-Truy M謓h Cung",0,4,8943},
		[20]={"C鰑 Ch﹗-Thi謕 C鑤 Huy誸 o",0,7,8944},
		[21]={"C鰑 Ch﹗-Luy謓 H錸 Huy誸 Tr秓",0,11,8945},
		[23]={"C鰑 Ch﹗-Ng? Thi猲 Phong Ki誱",	0,	2,	8946},
		[29]={"C鰑 Ch﹗-Linh Lung Chi",	0,	13,	8950},
		[30]={"C鰑 Ch﹗-C鰑 Ti猽 S竜",	0,	12,	8951},
	},
	[4] = {
		[2]={"H筼 Nguy謙-ч N筺 T玭 Gi? Ph藅 o",0,3,8972,1},
		[3]={"H筼 Nguy謙-ч Ki誴 T玭 Gi? Ph藅 Th?",0,0,8973,1},
		[4]={"H筼 Nguy謙-ч 竎h T玭 Gi? Ph藅 Trng",0,8,8974,1},
		[6]={"H筼 Nguy謙-V筺 Ki誴 Th竛h Th? Tr﹎",0,1,8975,1},
		[8]={"H筼 Nguy謙-Ph藅 V﹏ Th竛h C? Li猲 Ki誱",0,2,8976,1},
		[9]={"H筼 Nguy謙-Ph藅 Tr莕 Th竛h C? C莔",0,10,8977,1},
		[11]={"H筼 Nguy謙-Tr鬰 Ph鬾g Thi猲 C竔 Th?",0,0,8978,1},
		[12]={"H筼 Nguy謙-Du Long мa Kh蕋 C玭",0,5,8979,1},
		[14]={"H筼 Nguy謙-V? C鵦 Thi猲 T玭 T骳 Ki誱",0,2,8980,1},
		[15]={"H筼 Nguy謙-B輈h L筩 Thi猲 T玭 B髏",0,9,8981,1},
		[17]={"H筼 Nguy謙-C秏 Thi猲 u H錸 Thng",0,6,8982,1},
		[18]={"H筼 Nguy謙-мnh Thi猲 Th莕 Ngh? Cung",0,4,8983,1},
		[20]={"H筼 Nguy謙-Qu? X骳 T? Th莕 o",0,7,8984,1},
		[21]={"H筼 Nguy謙-Vu C鑤 чc Vng Tr秓",0,11,8985,1},
		[23]={"H筼 Nguy謙-B蕋 чng Ch﹏ Ti猲 Ki誱",	0,	2,	8986},
		[29]={"H筼 Nguy謙-T? V﹏ Ti猲 T? Phi課",	0,	13,	8990},
		[30]={"H筼 Nguy謙-Phi H? Ti猲 T?  Lan Ti猽",	0,	12,	8991},
	},
	[5] = {
		[2]={"Di謚 Dng-ч N筺 T玭 Gi? Ph藅 o",0,3,8992},
		[3]={"Di謚 Dng-ч Ki誴 T玭 Gi? Ph藅 Th?",0,0,8993},
		[4]={"Di謚 Dng-ч 竎h T玭 Gi? Ph藅 Trng",0,8,8994},
		[6]={"Di謚 Dng-V筺 Ki誴 Th竛h Th? Tr﹎",0,1,8995},
		[8]={"Di謚 Dng-Ph藅 V﹏ Th竛h C? Li猲 Ki誱",0,2,8996},
		[9]={"Di謚 Dng-Ph藅 Tr莕 Th竛h C? C莔",0,10,8997},
		[11]={"Di謚 Dng-Tr鬰 Ph鬾g Thi猲 C竔 Th?",0,0,8998},
		[12]={"Di謚 Dng-Du Long мa Kh蕋 C玭",0,5,8999},
		[14]={"Di謚 Dng-V? C鵦 Thi猲 T玭 T骳 Ki誱",0,2,9000},
		[15]={"Di謚 Dng-B輈h L筩 Thi猲 T玭 B髏",0,9,9001},
		[17]={"Di謚 Dng-C秏 Thi猲 u H錸 Thng",0,6,9002},
		[18]={"Di謚 Dng-мnh Thi猲 Th莕 Ngh? Cung",0,4,9003},
		[20]={"Di謚 Dng-Qu? X骳 T? Th莕 o",0,7,9004},
		[21]={"Di謚 Dng-Vu C鑤 чc Vng Tr秓",0,11,9005},
		[23]={"Di謚 Dng-B蕋 чng Ch﹏ Ti猲 Ki誱",	0,	2,	9006},
		[29]={"Di謚 Dng-T? V﹏ Ti猲 T? Phi課",	0,	13,	9010},
		[30]={"Di謚 Dng-Phi H? Ti猲 T?  Lan Ti猽",	0,	12,	9011},
	},
}
--装备总表
tQuipMainInfo = {
	tArmIdInfo[1],tArmIdInfo[2],tArmIdInfo[3],tWeaponIdInfo,tRingIdInfo
}
--兑换装备规则表
tEquipSynthInfo = {
	[1] = {		--星刻
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][1],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"M秐h Tinh Ng蕁",300},
				{" Kim ",300},
			}
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][1],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"M秐h Tinh Ng蕁",360},
				{" Kim ",200},
			}
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][1],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"M秐h Tinh Ng蕁",180},
				{" Kim ",100},
			}
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[1],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"M秐h Tinh Ng蕁",420},
				{"Ng? H祅h Huy襫 Th筩h",420},
				{" Kim ",400},
			}
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[1],
			--消耗表
			tEquipConsum = {
				{"Ng? H祅h Huy襫 Th筩h",420},
				{" Kim ",200},
			}
		},
	},
	[2] = {		--天仪
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][2],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"Thi猲Ngh躠 TinhThi誸",480},
				{" Kim ",300},
			}
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][2],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"Thi猲Ngh躠 TinhThi誸",360},
				{" Kim ",200},
			}
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][2],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"Thi猲Ngh躠 TinhThi誸",180},
				{" Kim ",100},
			}
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[2],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"Ng? H祅h Huy襫 Thi誸",420},
				{"Thi猲Ngh躠 TinhThi誸",420},
				{" Kim ",400},
			}
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[2],
			--消耗表
			tEquipConsum = {
				{"Ng? H祅h Huy襫 Thi誸",420},
				{" Kim ",200},
			}
		},
	},
	[3] = {		--九州
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][4],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"Thi猲 Cang L謓h",4},
				{" Kim ",200},
			},
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][4],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"Thi猲 Cang L謓h",3},
				{" Kim ",150},
			},
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][4],
			--表结构
			tTableStructure = {"Body"},
			--消耗表
			tEquipConsum = {
				{"Thi猲 Cang L謓h",2},
				{" Kim ",100},
			},
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[4],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"Thi猲 Cang L謓h",6},
				{" Kim ",300},
			},
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[4],
			--表结构
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"Thi猲 Cang L謓h",3},
				{" Kim ",150},
			},
		},
	},
	[4] = {		--皓月
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][3],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"H筼 Nguy謙 Huy襫 Kim",480},
				{" Kim ",300},
			},
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][3],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"H筼 Nguy謙 Huy襫 Kim",360},
				{" Kim ",200},
			},
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][3],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"H筼 Nguy謙 Huy襫 Kim",180},
				{" Kim ",100},
			},
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[3],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"H筼 Nguy謙 Huy襫 Kim",420},
				{"Ng? H祅h Huy襫 Kim",420},
				{" Kim ",400},
			},
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[3],
			--消耗表
			tEquipConsum = {
				{"Ng? H祅h Huy襫 Kim",420},
				{" Kim ",200},
			},
		},
	},
	[5] = {		--耀阳
		--头
		[1] = {
			--装备表
			tEquipInfo = tArmIdInfo[1][5],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"Di謚 Dng C鰑 Huy襫",4},
				{" Kim ",400},
			},
		},
		--衣服
		[2] = {
			--装备表
			tEquipInfo = tArmIdInfo[2][5],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"Di謚 Dng C鰑 Huy襫",3},
				{" Kim ",300},
			},
		},
		--下装
		[3] = {
			--装备表
			tEquipInfo = tArmIdInfo[3][5],
			--表结构
			tTableStructure = {"Route","Body"},
			--消耗表
			tEquipConsum = {
				{"Di謚 Dng C鰑 Huy襫",2},
				{" Kim ",200},
			},
		},
		--武器
		[4] = {
			--装备表
			tEquipInfo = tWeaponIdInfo[5],
			tTableStructure = {"Route"},
			--消耗表
			tEquipConsum = {
				{"Di謚 Dng C鰑 Huy襫",6},
				{" Kim ",600},
			},
		},
		--首饰
		[5] = {
			--装备表
			tEquipInfo = tRingIdInfo[5],
			--消耗表
			tEquipConsum = {
				{"Di謚 Dng C鰑 Huy襫",3},
				{" Kim ",300},
			},
		},
	},
}
--=============根据装备发放阶段配置的材料和装备屏蔽表
function release_fobidden()
	--装备屏蔽
	for nEquipSeq,tEquipPosSeq in tReleaseForbiddenList["tEquip"] do
		tremove(tEquipSeriesName,nEquipSeq)
		tremove(tEquipSynthInfo,nEquipSeq)
		for _,nEquipPosSeq in tEquipPosSeq do
			tremove(tQuipMainInfo[nEquipSeq],nEquipPosSeq)
		end
	end
	--道具屏蔽

end
release_fobidden()
--=================
function OnUse(nItemIndex)
	local sItemName= get_item_info(nItemIndex)
	Say(SClew.."<color=green>"..sItemName.."<color>"..tMetiralInfo[sItemName][2]..format(",Чi hi謕 mu鑞 d飊g <color=green>%s<color> cho m鬰 ch g??",sItemName),
		5,
		"Ta mu鑞 gh衟 trang b? /#equip_chg_main("..nItemIndex..")",
		"Ta mu鑞 xem ph鑙 phng gh衟 trang b? /equip_chg_rule",
		"Ta mu鑞 n﹏g c蕄 o c? /#dia_metiral_chg_main("..nItemIndex..")",
		"Ta mu鑞 xem ph鑙 phng n﹏g c蕄 /metiral_chg_rule",
		"Tho竧/nothing"
	)
end
--装备兑换总表
function equip_chg_main(nItemIndex)
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",SClew.."Ngi ch璦 gia nh藀 m玭 ph竔 kh玭g th? i o c?!")
		return
	end
	local tSay = {SClew.."H穣 ch鋘 h? trang b? c竎 h筺 mu鑞 i ."}
	--直接列出来
	for nEuiqpSerial = 1,getn(tEquipSynthInfo) do
		for nEuipPos = 1,getn(tEquipSynthInfo[nEuiqpSerial]) do
			local bChkFlag = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
			local bChkDetailFlag = 0
			for i = 1,getn(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum) do
				local sItemName= get_item_info(nItemIndex)
				if sItemName == tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum[i][1] then
					bChkDetailFlag = 1
					break
				end
			end
			if bChkFlag == 1 and bChkDetailFlag == 1 then
				local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
				if type(tEquipInfo[1]) =="string" then
					tinsert(tSay,"Ta mu鑞 i "..tEquipInfo[1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..")")
				else
					for i = 1,getn(tEquipInfo) do
						tinsert(tSay,"Ta mu鑞 i "..tEquipInfo[i][1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..","..i..")")
					end
				end
			end
		end
	end
	if getn(tSay) == 1 then
		tSay = {SClew.."Nguy猲 li謚 ho芻 ti襫 v祅g kh玭g ! "}
		tinsert(tSay,"Ta mu鑞 xem ph鑙 phng gh衟 trang b? /equip_chg_rule")
	end
	tinsert(tSay,"Tho竧/nothing")
	SelectSay(tSay)
end
function equip_chg_dtm(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	local tSay = {}
	tSay[1] = SClew..format("фi <color=green>%s<color> c莕 nguy猲 li謚 sao:",tEquipInfo[1])
	--材料判断
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	if nChkFlag ~= 1 then
		equip_chg_view(sItemName)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n X竎 nh mu鑞 i?"
		if  arg[3] then
			tinsert(tSay,"X竎 nh /#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..","..nDetailSeq..")")
		else
			tinsert(tSay,"X竎 nh /#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..")")
		end
		tinsert(tSay,"Tho竧/nothing")
		SelectSay(tSay)
	end
end
--装备兑换转换
function equip_chg_deal(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	item_chg_main(tEquipInfo[1],tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum,{tEquipInfo[2],tEquipInfo[3],tEquipInfo[4]})
end
--查看装备合成配方
function equip_chg_rule(...)
	local tSay = {SClew.."H穣 ch鋘 h? trang b? c莕 xem ."}
	for i = 1,getn(tEquipSeriesName) do
		tinsert(tSay,format("Ta mu鑞 xem h? %s /#equip_series_sel(%d)",tEquipSeriesName[i],i))
	end
	tinsert(tSay,"Tho竧/nothing")
	SelectSay(tSay)
end
--继续查看合成配方
function equip_series_sel(nEuiqpSerial)
	local tSay = {SClew..format("H穣 ch鋘 m鉵 trang b? c馻 h? %s.",tEquipSeriesName[nEuiqpSerial])}
	for i = 1,getn(tEquipPosName) do
		tinsert(tSay,format("Ta mu鑞 xem %s trang b? %s/#equip_chg_view(%d,%d)",tEquipSeriesName[nEuiqpSerial],tEquipPosName[i],nEuiqpSerial,i))
	end
	tinsert(tSay,"Tho竧/nothing")
	SelectSay(tSay)
end
function equip_chg_view(nEuiqpSerial,nEuipPos)
	tSay = {SClew..format("Ta mu鑞 xem %s trang b? %s c莕 nguy猲 li謚 sau:",tEquipSeriesName[nEuiqpSerial],tEquipPosName[nEuipPos])}
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
	end
	tinsert(tSay,"Tho竧/nothing")
	SelectSay(tSay)
end
--获取装备名称
function get_equip_info(tEquipInfo,tTableStructure,nStructureSeq)
	if tTableStructure == nil then
		return tEquipInfo
	end
	nStructureSeq = nStructureSeq or 1
	local sStructure = tTableStructure[nStructureSeq]
	if sStructure == "Route" then
		sStructure = GetPlayerRoute()
	elseif sStructure == "Sex" then
		sStructure = GetSex()
	elseif sStructure == "Body" then
		sStructure = GetBody()
	end
	if nStructureSeq == getn(tTableStructure) then
		return tEquipInfo[sStructure]
	else
		return get_equip_info(tEquipInfo[sStructure],tTableStructure,(nStructureSeq + 1))
	end
end
--===================道具升级处理
--道具升级处理
function dia_metiral_chg_main(nItemIndex)
	--背包空间判断
	if gf_Judge_Room_Weight(3, 1) ~= 1 then
		return 0;
	end
	local tSay = {SClew.."H穣 ch鋘 o c? c莕 n﹏g c蕄 ."}
	local sMetrialName= get_item_info(nItemIndex)
	for sItemName,tIntemInfo in tItemSynthInfo do
		for i = 1,getn(tIntemInfo[1]) do
			if sMetrialName == tIntemInfo[1][i][1] and (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 )then
				tinsert(tSay,format("Ta c莕 n﹏g c蕄 %s/#say_metiral_chg_sel(\"%s\")",sItemName,sItemName))
			end
		end
	end
	if sMetrialName == "M秐h Tinh Ng蕁" then
		tinsert(tSay,"Ta c莕 n﹏g c蕄 H筼 Nguy謙 Huy襫 Kim/haonguyethk")
	elseif sMetrialName == "Ng? H祅h Huy襫 Th筩h" then
		tinsert(tSay,"Ta c莕 n﹏g c蕄 Ng? H祅h Huy襫 Kim/nguhanhhk")
	end
	
	if getn(tSay) == 1 then
		Talk(1,"",SClew.."<color=green>"..sMetrialName.."<color> t筸 th阨 kh玭g th? n﹏g c蕄!")
		return
	else
		tinsert(tSay,"Tho竧/nothing")
		SelectSay(tSay)
	end
end
function say_metiral_chg_sel(sItemName)
	--材料判断
	local nChgNum = metiral_chg_num(sItemName)
	if nChgNum == 1 then
		metiral_chg_dtm(sItemName,nChgNum)
	elseif nChgNum > 1 then
		SetTaskTemp(nTaskTempId_Item_HashCode,Hash(sItemName))
		AskClientForNumber("metiral_chg_num_enter",1,nChgNum,format("фi %s s? lng",sItemName))
	else
		metiral_chg_view(sItemName)
	end
end
--材料数量输入
function metiral_chg_num_enter(nChgNum)
	if nChgNum <= 0 then return end
	local sItemName = get_hash_itemname(tItemSynthInfo)
	if sItemName == nil then
		return
	else
		metiral_chg_dtm(sItemName,nChgNum)
	end
end
--材料升级确认展开
function metiral_chg_dtm(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local tSay = {}
	if nChgNum == 1 then
		tSay[1] = SClew..format("N﹏g c蕄 <color=green>%s<color> c莕 nguy猲 li謚 sau:",sItemName)
	else
		tSay[1] = SClew..format("N﹏g c蕄 <color=green>%s<color>x<color=green>%d<color> c莕 nguy猲 li謚 sau:",sItemName,nChgNum)
	end
	--材料判断
	local nChgNumChk = metiral_chg_num(sItemName)
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChgNum > nChgNumChk or nChkFlag ~= 1 then
		metiral_chg_view(sItemName,nChgNum)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n X竎 nh mu鑞 i?"
		tinsert(tSay,"X竎 nh /#metiral_chg_main(\""..sItemName.."\","..nChgNum..")")
		tinsert(tSay,"Tho竧/nothing")
		SelectSay(tSay)
	end
end
--材料兑换转换
function metiral_chg_main(sItemName,nChgNum)
	item_chg_main(sItemName,tItemSynthInfo[sItemName][1],tMetiralInfo[sItemName][1],nChgNum)
end
--兑换确认处理
function item_chg_main(sItemName,tConsumInfo,tPrizeInfo,nChgNum)
	nChgNum = nChgNum or 1
	local nChkFlag,tChkResult = metiral_take_chk(tConsumInfo,nChgNum)
	if nChkFlag ~= 1 then
		return
	else
		--背包空间判断
		if gf_Judge_Room_Weight(3, 1) ~= 1 then
			return 0;
		end
		--物品删除判断
		for i = 1,getn(tConsumInfo) do
			if tConsumInfo[i][1] == " Kim " then
				if Pay(tConsumInfo[i][2]*10000*nChgNum) ~= 1 then
					return
				end
			else
				if DelItem(tMetiralInfo[tConsumInfo[i][1]][1][1],tMetiralInfo[tConsumInfo[i][1]][1][2],tMetiralInfo[tConsumInfo[i][1]][1][3],(tConsumInfo[i][2]*nChgNum)) ~= 1 then
					return
				end
			end
		end
		--物品增加处理
		if tPrizeInfo[1] == 2 then
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum)
		else
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum,1,-1,-1,-1,-1,-1,-1)
		end
	end
end
--===道具升级规则
function metiral_chg_rule()
	local tSay = {SClew.."H穣 ch鋘 o c? c莕 xem ."}
	for sItemName,tIntemInfo in tItemSynthInfo do
		if (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 ) then
			tinsert(tSay,format("Ta mu鑞 xem nguy猲 li謚 n﹏g c蕄 %s /#metiral_chg_view(\"%s\")",sItemName,sItemName))
		end
	end
	tinsert(tSay,"Tho竧/nothing")
	SelectSay(tSay)
end
--道具升级方法查看
function metiral_chg_view(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local sItemStory = SClew.."<color=green>"..sItemName.."<color>"
	if tMetiralInfo[sItemName][2] ~= nil and tMetiralInfo[sItemName][2] ~= "" then
		sItemStory = sItemStory..tMetiralInfo[sItemName][2]..","
	end
	local tSay = {sItemStory.."M鏸 nguy猲 li謚 n﹏g c蕄 c莕 nh? sau:"}
	--材料检测
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChkFlag == 1 then
		tinsert(tSay,"\n Ta mu鑞 n﹏g c蕄 "..sItemName.."/#say_metiral_chg_sel(\""..sItemName.."\")")
	end
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		if tItemSynthInfo[sItemName][1][i][1] ~= nil and tItemSynthInfo[tItemSynthInfo[sItemName][1][i][1]] ~= nil then
			tinsert(tSay,"Ta mu鑞 xem "..tItemSynthInfo[sItemName][1][i][1].."Phng ph竝 n﹏g c蕄 /#metiral_chg_view(\""..tItemSynthInfo[sItemName][1][i][1].."\")")
		end
	end
	tinsert(tSay,"tr? l筰/metiral_chg_rule")
	tinsert(tSay,"Tho竧/nothing")
	SelectSay(tSay)
end
--材料足够检测
function metiral_take_chk(tConsumInfo,nChgNum)
	nChgNum = nChgNum or 1
	local nChkFlag = 1
	local tChkResult = {}
	for i = 1,getn(tConsumInfo) do
		local sMertiralName = tConsumInfo[i][1]
		if sMertiralName == " Kim " then
			if floor(GetCash()/10000) < (tConsumInfo[i][2] * nChgNum) then
				nChkFlag = 0
				tinsert(tChkResult,{0,"<color=red>"..(tConsumInfo[i][2]*nChgNum)..sMertiralName.."<color>"})
			else
				tinsert(tChkResult,{1,"<color=green>"..(tConsumInfo[i][2]*nChgNum)..sMertiralName.."<color>"})
			end
		else
			if GetItemCount(tMetiralInfo[sMertiralName][1][1],tMetiralInfo[sMertiralName][1][2],tMetiralInfo[sMertiralName][1][3]) < (tConsumInfo[i][2] * nChgNum) then
				nChkFlag = 0
				tinsert(tChkResult,{0,"<color=red>"..sMertiralName.."x"..(tConsumInfo[i][2] * nChgNum).."<color>"})
			else
				tinsert(tChkResult,{1,"<color=green>"..sMertiralName.."x"..(tConsumInfo[i][2] * nChgNum).."<color>"})
			end
		end
	end
	return nChkFlag,tChkResult
end
--材料可兑换数量检测
function metiral_chg_num(sItemName)
	local nChgNum = 999999
	for i = 1,getn(tItemSynthInfo[sItemName][1]) do
		local sMertiralName = tItemSynthInfo[sItemName][1][i][1]
		if sMertiralName == " Kim " then
			nChgNum = min(nChgNum,floor((GetCash()/10000)/tItemSynthInfo[sItemName][1][i][2]))
		else
			nChgNum = min(nChgNum,floor(GetItemCount(tMetiralInfo[sMertiralName][1][1],tMetiralInfo[sMertiralName][1][2],tMetiralInfo[sMertiralName][1][3]) /tItemSynthInfo[sItemName][1][i][2]))
		end
		if nChgNum == 0 then
			break
		end
	end
	return nChgNum
end
--获取hash码对应的物品名
function get_hash_itemname(tItemInfo)
	local nHashCode = GetTaskTemp(nTaskTempId_Item_HashCode)
	if nHashCode == 0 then
		return
	else
		for sItemName,_ in tItemInfo do
			if Hash(sItemName) == nHashCode then
				return sItemName
			end
		end
		return
	end
end
function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end
function nothing()
end

-- фi H筼 Nguy謙 Huy襫 Kim
function haonguyethk()
		AskClientForNumber("ConfirmNumHNHK", 1, 100, "H筼 Nguy謙")
end

function ConfirmNumHNHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30300) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "B筺 kh玭g  甶襲 ki謓 i "..nCount.." H筼 Nguy謙 Huy襫 Kim");
        return 0;
   elseif  DelItem(2,1,30300, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30301, nCount}, "H筼 Nguy謙 Huy襫 Kim", "NANG CAP ITEM", "i h筼 nguy謙 huy襫 kim th祅h c玭g", 0, 1)
    end
end

-- фi Ng? H祅h Huy襫 Kim
function nguhanhhk()
		AskClientForNumber("ConfirmNumNHHK", 1, 100, "Ng? H祅h")
end

function ConfirmNumNHHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30303) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "B筺 kh玭g  甶襲 ki謓 i "..nCount.." Ng? H祅h Huy襫 Kim");
        return 0;
   elseif  DelItem(2,1,30303, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30304, nCount}, "Ng? H祅h Huy襫 Kim", "NANG CAP ITEM", "i ng? h祅h huy襫 kim th祅h c玭g", 0, 1)
    end
    
end