--�ű����ܣ�����2Խ��-2011����������Ƭ-�ϳɵ��ߵ���ͳһ����
--������ƣ�����
--���ܿ������峤
--���ܲ��ԣ�С��
--����ʱ�䣺2011-5-5
--�޸ļ�¼��
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
nTaskTempId_Item_HashCode = 249
SClew = "<color=green>Th�ng b�o<color>:"
tEquipSeriesName = {
	"Tinh Kh�c","Thi�n Ngh�a","C�u Ch�u","H�o Nguy�t","Di�u D��ng"
}
tEquipPosName = {
	"��u","Th��ng y","H� y","V� kh�","Trang s�c"
}
--===װ�����Ž�ֹ��
tReleaseForbiddenList = {
	tMetiral = {
		["H�o Nguy�t Huy�n Kim"] = 1,
		["Ng� H�nh Huy�n Kim"] = 1,
		["Di�u D��ng C�u Huy�n"] = 1,
	},
	tEquip = {
		--��£�ȫ����
		[4] ={1,2,3,4,5},
		--ҫ����ȫ����
		[5] = {1,2,3,4,5},
	},
}
tMetiralInfo = {
	["M�nh Tinh Ng�n"] = {
		{2,1,30299},
		"Tham gia di�n v� Thi�n M�n Tr�n c� th� nh�n ���c ",
	},
	["Ng� H�nh Huy�n Th�ch"] = {
		{2,1,30302},
		"Tham gia v��t �i L��ng S�n nh�n ���c ",
	},
	["Thi�nNgh�a TinhThi�t"] = {
		{2,1,30300},
		"N�ng c�p t�  M�nh Tinh Ng�n ",
	},
	["Ng� H�nh Huy�n Thi�t"] = {
		{2,1,30303},
		"N�ng c�p t� Ng� H�nh Huy�n Th�ch",
	},
	["Thi�n Cang L�nh"] = {
		{2,95,204},
		"Ngu�n xu�t hi�n t� v��t �i L��ng S�n ",
	},
	["H�o Nguy�t Huy�n Kim"] = {
		{2,1,30301},
		"N�ng c�p t� Thi�n Ngh�a Tinh Thi�t ",
	},
	["Ng� H�nh Huy�n Kim"] = {
		{2,1,30304},
		"N�ng c�p t� Ng� H�nh Huy�n Thi�t ",
	},
	["Di�u D��ng C�u Huy�n"] = {
		{2,1,30298},
		"Gh�p t� Thi�n Cang L�nh (v��t �i L��ng S�n), H�o Nguy�t Huy�n Kim, v� Ng� h�nh Huy�n Kim ",
	},
}
tItemSynthInfo = {
	["Thi�nNgh�a TinhThi�t"] = {
		{
			{"M�nh Tinh Ng�n",2},
			{" Kim ",2},
		},
		2
	},
	["Ng� H�nh Huy�n Thi�t"] = {
		{
			{"Ng� H�nh Huy�n Th�ch",2},
			{" Kim ",2},
		},
		2
	},
	["H�o Nguy�t Huy�n Kim"] = {
		{
			{"Thi�nNgh�a TinhThi�t",3},
			{" Kim ",6},
		},
		6
	},
	["Ng� H�nh Huy�n Kim"] = {
		{
			{"Ng� H�nh Huy�n Thi�t",3},
			{" Kim ",6},
		},
		6
	},
	["Di�u D��ng C�u Huy�n"] = {
		{
			{"Thi�n Cang L�nh",3},
			{"Ng� H�nh Huy�n Kim",99},
			{"H�o Nguy�t Huy�n Kim",99},
		},
		2
	},

}
tArmIdInfo = {
	[1] = {
		[1] = {
			{
				{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3033},{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3036},
			},{
				{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3039},{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3042},
			},{
				{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3045},{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3048},
			},{
				{"Tinh Kh�c-C�u D��ng Nh�t Qu�n",0,103,3051},{"Tinh Kh�c-C�u �m Nguy�t Qu�n",0,103,3054},
			},
		},
		[2] = {
			{
				{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3034},{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3037}
			},{
				{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3040},{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3043}
			},{
				{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3046},{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3049}
			},{
				{"Thi�n Ngh�a-C�u D��ng Nh�t Qu�n",0,103,3052},{"Thi�n Ngh�a-C�u �m Nguy�t Qu�n",0,103,3055}
			},
		},
		[3] = {
			{
				{"Long ��ng T� H�i Qu�n",0,103,3056},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3060}
			},{
				{"Long ��ng T� H�i Qu�n",0,103,3057},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3061}
			},{
				{"Long ��ng T� H�i Qu�n",0,103,3058},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3062}
			},{
				{"Long ��ng T� H�i Qu�n",0,103,3059},{"Ph�ng V� C�u Thi�n Qu�n",0,103,3063}
			},
		},
		[4] = {
			[2] = 	{{"H�o Nguy�t-�� N�n T�n Gi� M�o",0,103,3064},	{"H�o Nguy�t-�� N�n T�n Gi� M�o",0,103,3065}},
			[3] = 	{{"H�o Nguy�t-�� �ch T�n Gi� M�o",0,103,3068},	{"H�o Nguy�t-�� �ch T�n Gi� M�o",0,103,3069}},
			[4] = 	{{"H�o Nguy�t-�� Ki�p T�n Gi� M�o",0,103,3066},	{"H�o Nguy�t-�� Ki�p T�n Gi� M�o",0,103,3067}},
			[6] = 	{{"H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n",0,103,3070},	{"H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n",0,103,3071},{"H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n",0,103,3072},{"H�o Nguy�t-V�n Ki�p Th�nh Th� Qu�n",0,103,3073}},
			[8] = 	{nil,								nil,							{"H�o Nguy�t-Ph�t V�n Th�nh C� Tr�m",0,103,3074},{"H�o Nguy�t-Ph�t V�n Th�nh C� Tr�m",0,103,3075}},
			[9] = 	{nil,								nil,							{"H�o Nguy�t-Ph�t Tr�n Th�nh C� Tr�m",0,103,3076},{"H�o Nguy�t-Ph�t Tr�n Th�nh C� Tr�m",0,103,3077}},
			[11] = 	{{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n",0,103,3078},	{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n",0,103,3079},{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n",0,103,3080},{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i C�n",0,103,3081}},
			[12] = 	{{"H�o Nguy�t-Du Long ��a Kh�t C�n",0,103,3082},	{"H�o Nguy�t-Du Long ��a Kh�t C�n",0,103,3083},{"H�o Nguy�t-Du Long ��a Kh�t C�n",0,103,3084},{"H�o Nguy�t-Du Long ��a Kh�t C�n",0,103,3085}},
			[14] = 	{{"H�o Nguy�t-V� C�c Thi�n T�n Qu�n",0,103,3086},	{"H�o Nguy�t-V� C�c Thi�n T�n Qu�n",0,103,3087},{"H�o Nguy�t-V� C�c Thi�n T�n Qu�n",0,103,3088},{"H�o Nguy�t-V� C�c Thi�n T�n Qu�n",0,103,3089}},
			[15] = 	{{"H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n",0,103,3090},	{"H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n",0,103,3091},{"H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n",0,103,3092},{"H�o Nguy�t-B�ch L�c Thi�n T�n Qu�n",0,103,3093}},
			[17] = 	{{"H�o Nguy�t-C�m Thi�n ��u H�n Kh�i",0,103,3094},	{"H�o Nguy�t-C�m Thi�n ��u H�n Kh�i",0,103,3095},{"H�o Nguy�t-C�m Thi�n ��u H�n Kh�i",0,103,3096},{"H�o Nguy�t-C�m Thi�n ��u H�n Kh�i",0,103,3097}},
			[18] = 	{{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i",0,103,3098},	{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i",0,103,3099},{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i",0,103,3100},{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Kh�i",0,103,3101}},
			[20] = 	{{"H�o Nguy�t-Qu� X�c T� Th�n C�n",0,103,3102},	{"H�o Nguy�t-Qu� X�c T� Th�n C�n",0,103,3103},{"H�o Nguy�t-Qu� X�c T� Th�n C�n",0,103,3104},{"H�o Nguy�t-Qu� X�c T� Th�n C�n",0,103,3105}},
			[21] = 	{{"H�o Nguy�t-Vu C�t ��c V��ng C�n",0,103,3106},	{"H�o Nguy�t-Vu C�t ��c V��ng C�n",0,103,3107},{"H�o Nguy�t-Vu C�t ��c V��ng C�n",0,103,3108},{"H�o Nguy�t-Vu C�t ��c V��ng C�n",0,103,3109}},
			[23] =  {{"H�o Nguy�t-B�t ��ng Ch�n Ti�n Qu�n",0,103,3110}, {"H�o Nguy�t-B�t ��ng Ch�n Ti�n Qu�n",0,103,3111},nil,nil},
			[29] =  {nil,nil,{"H�o Nguy�t-T� V�n Ti�n T� Tr�m",0,103,3124},{"H�o Nguy�t-T� V�n Ti�n T� Tr�m",	0,103,3125}},
			[30] =  {nil,nil,{"H�o Nguy�t-Phi H� Ti�n T� Tr�m",0,103,3126},{"H�o Nguy�t-Phi H� Ti�n T� Tr�m",	0,103,3127}},
		},
		[5] = {
			[2] = 	{{"Di�u D��ng-�� N�n T�n Gi� M�o",0,103,3128},	{"Di�u D��ng-�� N�n T�n Gi� M�o",0,103,3129}},
			[3] = 	{{"Di�u D��ng-�� �ch T�n Gi� M�o",0,103,3132},	{"Di�u D��ng-�� �ch T�n Gi� M�o",0,103,3133}},
			[4] = 	{{"Di�u D��ng-�� Ki�p T�n Gi� M�o",0,103,3130},	{"Di�u D��ng-�� Ki�p T�n Gi� M�o",0,103,3131}},
			[6] = 	{{"Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n",0,103,3134},	{"Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n",0,103,3135},{"Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n",0,103,3136},{"Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n",0,103,3137}},
			[8] = 	{nil,								nil,							{"Di�u D��ng-Ph�t V�n Th�nh C� Tr�m",0,103,3138},{"Di�u D��ng-Ph�t V�n Th�nh C� Tr�m",0,103,3139}},
			[9] = 	{nil,								nil,							{"Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m",0,103,3140},{"Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m",0,103,3141}},
			[11] = 	{{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n",0,103,3142},	{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n",0,103,3143},{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n",0,103,3144},{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n",0,103,3145}},
			[12] = 	{{"Di�u D��ng-Du Long ��a Kh�t C�n",0,103,3146},	{"Di�u D��ng-Du Long ��a Kh�t C�n",0,103,3147},{"Di�u D��ng-Du Long ��a Kh�t C�n",0,103,3148},{"Di�u D��ng-Du Long ��a Kh�t C�n",0,103,3149}},
			[14] = 	{{"Di�u D��ng-V� C�c Thi�n T�n Qu�n",0,103,3150},	{"Di�u D��ng-V� C�c Thi�n T�n Qu�n",0,103,3151},{"Di�u D��ng-V� C�c Thi�n T�n Qu�n",0,103,3152},{"Di�u D��ng-V� C�c Thi�n T�n Qu�n",0,103,3153}},
			[15] = 	{{"Di�u D��ng-B�ch L�c Thi�n T�n Qu�n",0,103,3154},	{"Di�u D��ng-B�ch L�c Thi�n T�n Qu�n",0,103,3155},{"Di�u D��ng-B�ch L�c Thi�n T�n Qu�n",0,103,3156},{"Di�u D��ng-B�ch L�c Thi�n T�n Qu�n",0,103,3157}},
			[17] = 	{{"Di�u D��ng-C�m Thi�n ��u H�n Kh�i",0,103,3158},	{"Di�u D��ng-C�m Thi�n ��u H�n Kh�i",0,103,3159},{"Di�u D��ng-C�m Thi�n ��u H�n Kh�i",0,103,3160},{"Di�u D��ng-C�m Thi�n ��u H�n Kh�i",0,103,3161}},
			[18] = 	{{"Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i",0,103,3162},	{"Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i",0,103,3163},{"Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i",0,103,3164},{"Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i",0,103,3165}},
			[20] = 	{{"Di�u D��ng-Qu� X�c T� Th�n C�n",0,103,3166},	{"Di�u D��ng-Qu� X�c T� Th�n C�n",0,103,3167},{"Di�u D��ng-Qu� X�c T� Th�n C�n",0,103,3168},{"Di�u D��ng-Qu� X�c T� Th�n C�n",0,103,3169}},
			[21] = 	{{"Di�u D��ng-Vu C�t ��c V��ng C�n",0,103,3170},	{"Di�u D��ng-Vu C�t ��c V��ng C�n",0,103,3171},{"Di�u D��ng-Vu C�t ��c V��ng C�n",0,103,3172},{"Di�u D��ng-Vu C�t ��c V��ng C�n",0,103,3173}},
			[23] =  {{"Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n",0,103,3174}, {"Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n",0,103,3175},nil,nil},
			[29] =  {nil,nil,{"Di�u D��ng-T� V�n Ti�n T� Tr�m",0,103,3188},{"Di�u D��ng-T� V�n Ti�n T� Tr�m",	0,103,3189}},
			[30] =  {nil,nil,{"Di�u D��ng-Phi H� Ti�n T� Tr�m",0,103,3190},{"Di�u D��ng-Phi H� Ti�n T� Tr�m",	0,103,3191}},
		},
	},
	[2] ={
		[1] = {
			{
				{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3033},{"Tinh Kh�c-C�u �m Th�y Y",0,100,3036}
			},{
				{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3039},{"Tinh Kh�c-C�u �m Th�y Y",0,100,3042}
			},{
				{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3045},{"Tinh Kh�c-C�u �m Th�y Y",0,100,3048}
			},{
				{"Tinh Kh�c-C�u D��ng H�a Y",0,100,3051},{"Tinh Kh�c-C�u �m Th�y Y",0,100,3054}
			},
		},
		[2] = {
			{
				{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3034},{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3037}
			},{
				{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3040},{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3043}
			},{
				{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3046},{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3049}
			},{
				{"Thi�n Ngh�a-C�u D��ng H�a Y",0,100,3052},{"Thi�n Ngh�a-C�u �m Th�y Y",0,100,3055}
			},
		},
		[3] = {
			{
				{"Long ��ng T� H�i Y",0,100,3056},{"Ph�ng V� C�u Thi�n Y",0,100,3060},
			},{
				{"Long ��ng T� H�i Y",0,100,3057},{"Ph�ng V� C�u Thi�n Y",0,100,3061},
			},{
				{"Long ��ng T� H�i Y",0,100,3058},{"Ph�ng V� C�u Thi�n Y",0,100,3062},
			},{
				{"Long ��ng T� H�i Y",0,100,3059},{"Ph�ng V� C�u Thi�n Y",0,100,3063},
			},
		},
		[4] = {
			[2] = 	{{"H�o Nguy�t-�� N�n T�n Gi� B�o",0,100,3064},	{"H�o Nguy�t-�� N�n T�n Gi� B�o",0,100,3065}},
			[3] = 	{{"H�o Nguy�t-�� �ch T�n Gi� B�o",0,100,3068},	{"H�o Nguy�t-�� �ch T�n Gi� B�o",0,100,3069}},
			[4] = 	{{"H�o Nguy�t-�� Ki�p T�n Gi� B�o",0,100,3066},	{"H�o Nguy�t-�� Ki�p T�n Gi� B�o",0,100,3067}},
			[6] = 	{{"H�o Nguy�t-V�n Ki�p Th�nh Th� Y",0,100,3070},	{"H�o Nguy�t-V�n Ki�p Th�nh Th� Y",0,100,3071},{"H�o Nguy�t-V�n Ki�p Th�nh Th� Y",0,100,3072},{"H�o Nguy�t-V�n Ki�p Th�nh Th� Y",0,100,3073}},
			[8] = 	{nil,								nil,							{"H�o Nguy�t-Ph�t V�n Th�nh C� Y",0,100,3074},{"H�o Nguy�t-Ph�t V�n Th�nh C� Y",0,100,3075}},
			[9] = 	{nil,								nil,							{"H�o Nguy�t-Ph�t Tr�n Th�nh C� Y",0,100,3076},{"H�o Nguy�t-Ph�t Tr�n Th�nh C� Y",0,100,3077}},
			[11] = 	{{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y",0,100,3078},	{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y",0,100,3079},{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y",0,100,3080},{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Y",0,100,3081}},
			[12] = 	{{"H�o Nguy�t-Du Long ��a Kh�t Y",0,100,3082},	{"H�o Nguy�t-Du Long ��a Kh�t Y",0,100,3083},{"H�o Nguy�t-Du Long ��a Kh�t Y",0,100,3084},{"H�o Nguy�t-Du Long ��a Kh�t Y",0,100,3085}},
			[14] = 	{{"H�o Nguy�t-V� C�c Thi�n T�n B�o",0,100,3086},	{"H�o Nguy�t-V� C�c Thi�n T�n B�o",0,100,3087},{"H�o Nguy�t-V� C�c Thi�n T�n B�o",0,100,3088},{"H�o Nguy�t-V� C�c Thi�n T�n B�o",0,100,3089}},
			[15] = 	{{"H�o Nguy�t-B�ch L�c Thi�n T�n B�o",0,100,3090},	{"H�o Nguy�t-B�ch L�c Thi�n T�n B�o",0,100,3091},{"H�o Nguy�t-B�ch L�c Thi�n T�n B�o",0,100,3092},{"H�o Nguy�t-B�ch L�c Thi�n T�n B�o",0,100,3093}},
			[17] = 	{{"H�o Nguy�t-C�m Thi�n ��u H�n Gi�p",0,100,3094},	{"H�o Nguy�t-C�m Thi�n ��u H�n Gi�p",0,100,3095},{"H�o Nguy�t-C�m Thi�n ��u H�n Gi�p",0,100,3096},{"H�o Nguy�t-C�m Thi�n ��u H�n Gi�p",0,100,3097}},
			[18] = 	{{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p",0,100,3098},	{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p",0,100,3099},{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p",0,100,3100},{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Gi�p",0,100,3101}},
			[20] = 	{{"H�o Nguy�t-Qu� X�c T� Th�n Y",0,100,3102},	{"H�o Nguy�t-Qu� X�c T� Th�n Y",0,100,3103},{"H�o Nguy�t-Qu� X�c T� Th�n Y",0,100,3104},{"H�o Nguy�t-Qu� X�c T� Th�n Y",0,100,3105}},
			[21] = 	{{"H�o Nguy�t-Vu C�t ��c V��ng Y",0,100,3106},	{"H�o Nguy�t-Vu C�t ��c V��ng Y",0,100,3107},{"H�o Nguy�t-Vu C�t ��c V��ng Y",0,100,3108},{"H�o Nguy�t-Vu C�t ��c V��ng Y",0,100,3109}},
			[23] =  {{"H�o Nguy�t-B�t ��ng Ch�n Ti�n B�o",0,100,3110}, {"H�o Nguy�t-B�t ��ng Ch�n Ti�n B�o",0,100,3111},nil,nil},
			[29] =  {nil,nil,{"H�o Nguy�t-T� V�n Ti�n T� Y",0,100,3124},{"H�o Nguy�t-T� V�n Ti�n T� Y",	0,100,3125}},
			[30] =  {nil,nil,{"H�o Nguy�t-Phi H� Ti�n T� Y",0,100,3126},{"H�o Nguy�t-Phi H� Ti�n T� Y",	0,100,3127}},
		},
		[5] = {
			[2] = 	{{"Di�u D��ng-�� N�n T�n Gi� B�o",0,100,3128},	{"Di�u D��ng-�� N�n T�n Gi� B�o",0,100,3129}},
			[3] = 	{{"Di�u D��ng-�� �ch T�n Gi� B�o",0,100,3132},	{"Di�u D��ng-�� �ch T�n Gi� B�o",0,100,3133}},
			[4] = 	{{"Di�u D��ng-�� Ki�p T�n Gi� B�o",0,100,3130},	{"Di�u D��ng-�� Ki�p T�n Gi� B�o",0,100,3131}},
			[6] = 	{{"Di�u D��ng-V�n Ki�p Th�nh Th� Y",0,100,3134},	{"Di�u D��ng-V�n Ki�p Th�nh Th� Y",0,100,3135},{"Di�u D��ng-V�n Ki�p Th�nh Th� Y",0,100,3136},{"Di�u D��ng-V�n Ki�p Th�nh Th� Y",0,100,3137}},
			[8] = 	{nil,								nil,							{"Di�u D��ng-Ph�t V�n Th�nh C� Y",0,100,3138},{"Di�u D��ng-Ph�t V�n Th�nh C� Y",0,100,3139}},
			[9] = 	{nil,								nil,							{"Di�u D��ng-Ph�t Tr�n Th�nh C� Y",0,100,3140},{"Di�u D��ng-Ph�t Tr�n Th�nh C� Y",0,100,3141}},
			[11] = 	{{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y",0,100,3142},	{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y",0,100,3143},{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y",0,100,3144},{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y",0,100,3145}},
			[12] = 	{{"Di�u D��ng-Du Long ��a Kh�t Y",0,100,3146},	{"Di�u D��ng-Du Long ��a Kh�t Y",0,100,3147},{"Di�u D��ng-Du Long ��a Kh�t Y",0,100,3148},{"Di�u D��ng-Du Long ��a Kh�t Y",0,100,3149}},
			[14] = 	{{"Di�u D��ng-V� C�c Thi�n T�n B�o",0,100,3150},	{"Di�u D��ng-V� C�c Thi�n T�n B�o",0,100,3151},{"Di�u D��ng-V� C�c Thi�n T�n B�o",0,100,3152},{"Di�u D��ng-V� C�c Thi�n T�n B�o",0,100,3153}},
			[15] = 	{{"Di�u D��ng-B�ch L�c Thi�n T�n B�o",0,100,3154},	{"Di�u D��ng-B�ch L�c Thi�n T�n B�o",0,100,3155},{"Di�u D��ng-B�ch L�c Thi�n T�n B�o",0,100,3156},{"Di�u D��ng-B�ch L�c Thi�n T�n B�o",0,100,3157}},
			[17] = 	{{"Di�u D��ng-C�m Thi�n ��u H�n Gi�p",0,100,3158},	{"Di�u D��ng-C�m Thi�n ��u H�n Gi�p",0,100,3159},{"Di�u D��ng-C�m Thi�n ��u H�n Gi�p",0,100,3160},{"Di�u D��ng-C�m Thi�n ��u H�n Gi�p",0,100,3161}},
			[18] = 	{{"Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p",0,100,3162},	{"Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p",0,100,3163},{"Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p",0,100,3164},{"Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p",0,100,3165}},
			[20] = 	{{"Di�u D��ng-Qu� X�c T� Th�n Y",0,100,3166},	{"Di�u D��ng-Qu� X�c T� Th�n Y",0,100,3167},{"Di�u D��ng-Qu� X�c T� Th�n Y",0,100,3168},{"Di�u D��ng-Qu� X�c T� Th�n Y",0,100,3169}},
			[21] = 	{{"Di�u D��ng-Vu C�t ��c V��ng Y",0,100,3170},	{"Di�u D��ng-Vu C�t ��c V��ng Y",0,100,3171},{"Di�u D��ng-Vu C�t ��c V��ng Y",0,100,3172},{"Di�u D��ng-Vu C�t ��c V��ng Y",0,100,3173}},
			[23] =  {{"Di�u D��ng-B�t ��ng Ch�n Ti�n B�o",0,100,3174}, {"Di�u D��ng-B�t ��ng Ch�n Ti�n B�o",0,100,3175},nil,nil},
			[29] =  {nil,nil,{"Di�u D��ng-T� V�n Ti�n T� Y",0,100,3188},{"Di�u D��ng-T� V�n Ti�n T� Y",	0,100,3189}},
			[30] =  {nil,nil,{"Di�u D��ng-Phi H� Ti�n T� Y",0,100,3190},{"Di�u D��ng-Phi H� Ti�n T� Y",	0,100,3191}},
		},
	},
	[3] ={
		[1] = {
			{
				{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3033},{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3036},
			},{
				{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3039},{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3042},
			},{
				{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3045},{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3048},
			},{
				{"Tinh Kh�c-C�u D��ng Long Trang",0,101,3051},{"Tinh Kh�c-C�u �m Ph�ng Trang",0,101,3054}
			},
		},
		[2] = {
			{
				{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3034},{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3037},
			},{
				{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3040},{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3043},
			},{
				{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3046},{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3049},
			},{
				{"Thi�n Ngh�a-C�u D��ng Long Trang",0,101,3052},{"Thi�n Ngh�a-C�u �m Ph�ng Trang",0,101,3055},
			},
		},
		[3] = {
			{
				{"Long ��ng T� H�i Trang",0,101,3056},{"Ph�ng V� C�u Thi�n Trang",0,101,3060},
			},{
				{"Long ��ng T� H�i Trang",0,101,3057},{"Ph�ng V� C�u Thi�n Trang",0,101,3061},
			},{
				{"Long ��ng T� H�i Trang",0,101,3058},{"Ph�ng V� C�u Thi�n Trang",0,101,3062},
			},{
				{"Long ��ng T� H�i Trang",0,101,3059},{"Ph�ng V� C�u Thi�n Trang",0,101,3063},
			},
		},
		[4] = {
			[2] = 	{{"H�o Nguy�t-�� N�n T�n Gi� Trang",0,101,3064},	{"H�o Nguy�t-�� N�n T�n Gi� Trang",0,101,3065}},
			[3] = 	{{"H�o Nguy�t-�� �ch T�n Gi� Trang",0,101,3068},	{"H�o Nguy�t-�� �ch T�n Gi� Trang",0,101,3069}},
			[4] = 	{{"H�o Nguy�t-�� Ki�p T�n Gi� Trang",0,101,3066},	{"H�o Nguy�t-�� Ki�p T�n Gi� Trang",0,101,3067}},
			[6] = 	{{"H�o Nguy�t-V�n Ki�p Th�nh Th� Trang",0,101,3070},	{"H�o Nguy�t-V�n Ki�p Th�nh Th� Trang",0,101,3071},{"H�o Nguy�t-V�n Ki�p Th�nh Th� Trang",0,101,3072},{"H�o Nguy�t-V�n Ki�p Th�nh Th� Trang",0,101,3073}},
			[8] = 	{nil,								nil,							{"H�o Nguy�t-Ph�t V�n Th�nh C� Qu�n",0,101,3074},{"H�o Nguy�t-Ph�t V�n Th�nh C� Qu�n",0,101,3075}},
			[9] = 	{nil,								nil,							{"H�o Nguy�t-Ph�t Tr�n Th�nh C� Qu�n",0,101,3076},{"H�o Nguy�t-Ph�t Tr�n Th�nh C� Qu�n",0,101,3077}},
			[11] = 	{{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang",0,101,3078},	{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang",0,101,3079},{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang",0,101,3080},{"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Trang",0,101,3081}},
			[12] = 	{{"H�o Nguy�t-Du Long ��a Kh�t Trang",0,101,3082},	{"H�o Nguy�t-Du Long ��a Kh�t Trang",0,101,3083},{"H�o Nguy�t-Du Long ��a Kh�t Trang",0,101,3084},{"H�o Nguy�t-Du Long ��a Kh�t Trang",0,101,3085}},
			[14] = 	{{"H�o Nguy�t-V� C�c Thi�n T�n Trang",0,101,3086},	{"H�o Nguy�t-V� C�c Thi�n T�n Trang",0,101,3087},{"H�o Nguy�t-V� C�c Thi�n T�n Trang",0,101,3088},{"H�o Nguy�t-V� C�c Thi�n T�n Trang",0,101,3089}},
			[15] = 	{{"H�o Nguy�t-B�ch L�c Thi�n T�n Trang",0,101,3090},	{"H�o Nguy�t-B�ch L�c Thi�n T�n Trang",0,101,3091},{"H�o Nguy�t-B�ch L�c Thi�n T�n Trang",0,101,3092},{"H�o Nguy�t-B�ch L�c Thi�n T�n Trang",0,101,3093}},
			[17] = 	{{"H�o Nguy�t-C�m Thi�n ��u H�n Trang",0,101,3094},	{"H�o Nguy�t-C�m Thi�n ��u H�n Trang",0,101,3095},{"H�o Nguy�t-C�m Thi�n ��u H�n Trang",0,101,3096},{"H�o Nguy�t-C�m Thi�n ��u H�n Trang",0,101,3097}},
			[18] = 	{{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang",0,101,3098},	{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang",0,101,3099},{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang",0,101,3100},{"H�o Nguy�t-��nh Thi�n Th�n Ngh� Trang",0,101,3101}},
			[20] = 	{{"H�o Nguy�t-Qu� X�c T� Th�n Trang",0,101,3102},	{"H�o Nguy�t-Qu� X�c T� Th�n Trang",0,101,3103},{"H�o Nguy�t-Qu� X�c T� Th�n Trang",0,101,3104},{"H�o Nguy�t-Qu� X�c T� Th�n Trang",0,101,3105}},
			[21] = 	{{"H�o Nguy�t-Vu C�t ��c V��ng Trang",0,101,3106},	{"H�o Nguy�t-Vu C�t ��c V��ng Trang",0,101,3107},{"H�o Nguy�t-Vu C�t ��c V��ng Trang",0,101,3108},{"H�o Nguy�t-Vu C�t ��c V��ng Trang",0,101,3109}},
			[23] =  {{"H�o Nguy�t-B�t ��ng Ch�n Ti�n Trang",0,101,3110}, {"H�o Nguy�t-B�t ��ng Ch�n Ti�n Trang",0,101,3111},nil,nil},
			[29] =  {nil,nil,{"H�o Nguy�t-T� V�n Ti�n T� Qu�n",0,101,3124},{"H�o Nguy�t-T� V�n Ti�n T� Qu�n",	0,101,3125}},
			[30] =  {nil,nil,{"H�o Nguy�t-Phi H� Ti�n T� ",0,101,3126},{"H�o Nguy�t-Phi H� Ti�n T� ",	0,101,3127}},
		},
		[5] = {
			[2] = 	{{"Di�u D��ng-�� N�n T�n Gi� Trang",0,101,3128},	{"Di�u D��ng-�� N�n T�n Gi� Trang",0,101,3129}},
			[3] = 	{{"Di�u D��ng-�� �ch T�n Gi� Trang",0,101,3132},	{"Di�u D��ng-�� �ch T�n Gi� Trang",0,101,3133}},
			[4] = 	{{"Di�u D��ng-�� Ki�p T�n Gi� Trang",0,101,3130},	{"Di�u D��ng-�� Ki�p T�n Gi� Trang",0,101,3131}},
			[6] = 	{{"Di�u D��ng-V�n Ki�p Th�nh Th� Trang",0,101,3134},	{"Di�u D��ng-V�n Ki�p Th�nh Th� Trang",0,101,3135},{"Di�u D��ng-V�n Ki�p Th�nh Th� Trang",0,101,3136},{"Di�u D��ng-V�n Ki�p Th�nh Th� Trang",0,101,3137}},
			[8] = 	{nil,								nil,							{"Di�u D��ng-Ph�t V�n Th�nh C� Qu�n",0,101,3138},{"Di�u D��ng-Ph�t V�n Th�nh C� Qu�n",0,101,3139}},
			[9] = 	{nil,								nil,							{"Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n",0,101,3140},{"Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n",0,101,3141}},
			[11] = 	{{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang",0,101,3142},	{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang",0,101,3143},{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang",0,101,3144},{"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang",0,101,3145}},
			[12] = 	{{"Di�u D��ng-Du Long ��a Kh�t Trang",0,101,3146},	{"Di�u D��ng-Du Long ��a Kh�t Trang",0,101,3147},{"Di�u D��ng-Du Long ��a Kh�t Trang",0,101,3148},{"Di�u D��ng-Du Long ��a Kh�t Trang",0,101,3149}},
			[14] = 	{{"Di�u D��ng-V� C�c Thi�n T�n Trang",0,101,3150},	{"Di�u D��ng-V� C�c Thi�n T�n Trang",0,101,3151},{"Di�u D��ng-V� C�c Thi�n T�n Trang",0,101,3152},{"Di�u D��ng-V� C�c Thi�n T�n Trang",0,101,3153}},
			[15] = 	{{"Di�u D��ng-B�ch L�c Thi�n T�n Trang",0,101,3154},	{"Di�u D��ng-B�ch L�c Thi�n T�n Trang",0,101,3155},{"Di�u D��ng-B�ch L�c Thi�n T�n Trang",0,101,3156},{"Di�u D��ng-B�ch L�c Thi�n T�n Trang",0,101,3157}},
			[17] = 	{{"Di�u D��ng-C�m Thi�n ��u H�n Trang",0,101,3158},	{"Di�u D��ng-C�m Thi�n ��u H�n Trang",0,101,3159},{"Di�u D��ng-C�m Thi�n ��u H�n Trang",0,101,3160},{"Di�u D��ng-C�m Thi�n ��u H�n Trang",0,101,3161}},
			[18] = 	{{"Di�u D��ng-��nh Thi�n Th�n Ngh� Trang",0,101,3162},	{"Di�u D��ng-��nh Thi�n Th�n Ngh� Trang",0,101,3163},{"Di�u D��ng-��nh Thi�n Th�n Ngh� Trang",0,101,3164},{"Di�u D��ng-��nh Thi�n Th�n Ngh� Trang",0,101,3165}},
			[20] = 	{{"Di�u D��ng-Qu� X�c T� Th�n Trang",0,101,3166},	{"Di�u D��ng-Qu� X�c T� Th�n Trang",0,101,3167},{"Di�u D��ng-Qu� X�c T� Th�n Trang",0,101,3168},{"Di�u D��ng-Qu� X�c T� Th�n Trang",0,101,3169}},
			[21] = 	{{"Di�u D��ng-Vu C�t ��c V��ng Trang",0,101,3170},	{"Di�u D��ng-Vu C�t ��c V��ng Trang",0,101,3171},{"Di�u D��ng-Vu C�t ��c V��ng Trang",0,101,3172},{"Di�u D��ng-Vu C�t ��c V��ng Trang",0,101,3173}},
			[23] =  {{"Di�u D��ng-B�t ��ng Ch�n Ti�n Trang",0,101,3174}, {"Di�u D��ng-B�t ��ng Ch�n Ti�n Trang",0,101,3175},nil,nil},
			[29] =  {nil,nil,{"Di�u D��ng-T� V�n Ti�n T� Qu�n",0,101,3188},{"Di�u D��ng-T� V�n Ti�n T� Qu�n",	0,101,3189}},
			[30] =  {nil,nil,{"Di�u D��ng-Phi H� Ti�n T�",0,101,3190},{"Di�u D��ng-Phi H� Ti�n T�",	0,101,3191}},
		},
	},
}
tRingIdInfo = {
	[1] = {
		{"Tinh Kh�c-Huy�n Th�ch Kim Ng�c (trang s�c s�c m�nh)",0,102,3121},
		{"Tinh Kh�c-Ph� Th�y M�c ��i (trang s�c th�n ph�p)",0,102,3124},
		{"Tinh Kh�c-Nguy�t Hoa Th�y B�i (trang s�c n�i c�ng)",0,102,3127},
		{"Tinh Kh�c-C�u �m H�a Gi�i (trang s�c linh ho�t)",0,102,3130},
		{"Tinh Kh�c-Ng�ng Ng�c Th� Ho�n (trang s�c g�n c�t)",0,102,3133},
	},
	[2] = {
		{"Thi�n Ngh�a-Huy�n Th�ch Kim Ng�c (trang s�c s�c m�nh)",0,102,3122},
		{"Thi�n Ngh�a- Ph� Th�y M�c ��i (trang s�c th�n ph�p)",0,102,3125},
		{"Thi�n Ngh�a- Nguy�t Hoa Th�y B�i (trang s�c n�i c�ng)",0,102,3128},
		{"Thi�n Ngh�a- C�u �m H�a Gi�i (trang s�c linh ho�t)",0,102,3131},
		{"Thi�n Ngh�a- Ng�ng Ng�c Th� Ho�n (trang s�c g�n c�t)",0,102,3134},
	},
	[3] = {
		[2] = {
			{"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3135},
			{"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3136},
		},
		[3] = {
			{"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3137},
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3138},
		},
		[4] = {
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3139},
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3140},
		},
		[6] = {
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3141},
			{"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3142},
		},
		[8] = {
			{"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3143},
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3144},
		},
		[9] = {
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3145},
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3146},
		},
		[11] = {
			{"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3147},
			{"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3148},
		},
		[12] = {
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3149},
			{"C�u Ch�u-C�u �u H�a Gi�i",0,102,3150},
		},
		[14] = {
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3151},
			{"C�u Ch�u-C�u �u H�a Gi�i",0,102,3152},
		},
		[15] = {
			{"C�u Ch�u-C�u �u H�a Gi�i",0,102,3153},
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3154},
		},
		[17] = {
			{"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3155},
			{"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3156},
		},
		[18] = {
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3157},
			{"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3158},
		},
		[20] = {
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3159},
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3160},
		},
		[21] = {
			{"C�u Ch�u-C�u �u H�a Gi�i",0,102,3161},
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3162},
		},
		[23] = {
			{"C�u Ch�u-Nguy�t Hoa Th�y B�i",0,102,3163},
			{"C�u Ch�u-C�u �u H�a Gi�i",0,102,3164},
		},
		[29] = {
			{"C�u Ch�u-Ph� Th�y M�c ��i",0,102,3171},
			{"C�u Ch�u-Huy�n Th�ch Kim Ng�c",0,102,3172},
		},
		[30] = {
			{"C�u Ch�u-Ng�ng Ng�c Th� Ho�n",0,102,3173},
			{"C�u Ch�u-C�u �u H�a Gi�i",0,102,3174},
		},
	},
	[4] = {
		{"H�o Nguy�t-� L�n B�o Gi�i (trang s�c s�c m�nh)",0,102,3175},
		{"H�o Nguy�t-T� Giao Ng�c B�i (trang s�c th�n ph�p)",0,102,3177},
		{"H�o Nguy�t-V�n H� L�nh B�i (trang s�c n�i c�ng)",0,102,3179},
		{"H�o Nguy�t-X�ch T��c Ch� Ho�n (trang s�c linh ho�t)",0,102,3181},
		{"H�o Nguy�t-B�ch Quy H�ng Li�n (trang s�c g�n c�t)",0,102,3183},
	},
	[5] = {
		{"Di�u D��ng- � L�n B�o Gi�i (trang s�c s�c m�nh)",0,102,3176},
		{"Di�u D��ng- T� Giao Ng�c B�i (trang s�c th�n ph�p)",0,102,3178},
		{"Di�u D��ng- V�n H� L�nh B�i (trang s�c n�i c�ng)",0,102,3180},
		{"Di�u D��ng- X�ch T��c Ch� Ho�n (trang s�c linh ho�t)",0,102,3182},
		{"Di�u D��ng- B�ch Quy H�ng Li�n (trang s�c g�n c�t)",0,102,3184},
	},
}
tWeaponIdInfo = {
	[1] = {
		[2]={"Tinh Kh�c-L�u Ly Gi�i �ao",0,3,8892},
		[3]={"Tinh Kh�c-Kinh L�i Thi�n Tr��ng",0,8,8909},
		[4]={"Tinh Kh�c-L�i �m Nang Th�",0,0,8874},
		[6]={"Tinh Kh�c-�m D��ng Xuy�n �nh",0,1,8879},
		[8]={"Tinh Kh�c-T� H�n �m Ki�m",0,2,8884},
		[9]={"Tinh Kh�c-C�u Ho�n B�i C�m",0,10,8918},
		[11]={"Tinh Kh�c-Quy L�n H� Th�",0,0,8875},
		[12]={"Tinh Kh�c-Tr�n Ng�o C�n",0,5,8900},
		[14]={"Tinh Kh�c-Thu�n Phong Ki�m",0,2,8885},
		[15]={"Tinh Kh�c-Tinh ��u Chuy�n B�t",0,9,8913},
		[17]={"Tinh Kh�c-Ph� Qu�n Tr�n Th��ng",0,6,8903},
		[18]={"Tinh Kh�c-Truy M�nh Cung",0,4,8897},
		[20]={"Tinh Kh�c-Thi�p C�t Huy�t �ao",0,7,8906},
		[21]={"Tinh Kh�c-Luy�n H�n Huy�t Tr�o",0,11,8922},
		[23]={"Tinh Kh�c-Ng� Thi�n Phong Ki�m",	0,	2,	8886},
		[29]={"Tinh Kh�c-Linh Lung Chi",	0,	13,	8930},
		[30]={"Tinh Kh�c-C�u Ti�u S�o",	0,	12,	8927},
	},
	[2] = {
		[2]={"Thi�n Ngh�a-L�u Ly Gi�i �ao",0,3,8894},
		[3]={"Thi�n Ngh�a-Kinh L�i Thi�n Tr��ng",0,8,8910},
		[4]={"Thi�n Ngh�a-L�i �m Nang Th�",0,0,8876},
		[6]={"Thi�n Ngh�a-�m D��ng Xuy�n �nh",0,1,8880},
		[8]={"Thi�n Ngh�a-T� H�n �m Ki�m",0,2,8887},
		[9]={"Thi�n Ngh�a-C�u Ho�n B�i C�m",0,10,8919},
		[11]={"Thi�n Ngh�a-Quy L�n H� Th�",0,0,8877},
		[12]={"Thi�n Ngh�a-Tr�n Ng�o C�n",0,5,8901},
		[14]={"Thi�n Ngh�a-Thu�n Phong Ki�m",0,2,8888},
		[15]={"Thi�n Ngh�a-Tinh ��u Chuy�n B�t",0,9,8915},
		[17]={"Thi�n Ngh�a-Ph� Qu�n Tr�n Th��ng",0,6,8904},
		[18]={"Thi�n Ngh�a-Truy M�nh Cung",0,4,8898},
		[20]={"Thi�n Ngh�a-Thi�p C�t Huy�t �ao",0,7,8907},
		[21]={"Thi�n Ngh�a-Luy�n H�n Huy�t Tr�o",0,11,8924},
		[23]={"Thi�n Ngh�a-Ng� Thi�n Phong Ki�m",	0,	2,	8889},
		[29]={"Thi�n Ngh�a-Linh Lung Chi",	0,	13,	8931},
		[30]={"Thi�n Ngh�a-C�u Ti�u S�o",	0,	12,	8928},
	},
	[3] = {
		[2]={"C�u Ch�u-L�u Ly Gi�i �ao",0,3,8932},
		[3]={"C�u Ch�u-Kinh L�i Thi�n Tr��ng",0,8,8934},
		[4]={"C�u Ch�u-L�i �m Nang Th�",0,0,8933},
		[6]={"C�u Ch�u-�m D��ng Xuy�n �nh",0,1,8935},
		[8]={"C�u Ch�u-T� H�n �m Ki�m",0,2,8936},
		[9]={"C�u Ch�u-C�u Ho�n B�i C�m",0,10,8937},
		[11]={"C�u Ch�u-Quy L�n H� Th�",0,0,8938},
		[12]={"C�u Ch�u-Tr�n Ng�o C�n",0,5,8939},
		[14]={"C�u Ch�u-Thu�n Phong Ki�m",0,2,8940},
		[15]={"C�u Ch�u-Tinh ��u Chuy�n B�t",0,9,8941},
		[17]={"C�u Ch�u-Ph� Qu�n Tr�n Th��ng",0,6,8942},
		[18]={"C�u Ch�u-Truy M�nh Cung",0,4,8943},
		[20]={"C�u Ch�u-Thi�p C�t Huy�t �ao",0,7,8944},
		[21]={"C�u Ch�u-Luy�n H�n Huy�t Tr�o",0,11,8945},
		[23]={"C�u Ch�u-Ng� Thi�n Phong Ki�m",	0,	2,	8946},
		[29]={"C�u Ch�u-Linh Lung Chi",	0,	13,	8950},
		[30]={"C�u Ch�u-C�u Ti�u S�o",	0,	12,	8951},
	},
	[4] = {
		[2]={"H�o Nguy�t-�� N�n T�n Gi� Ph�t �ao",0,3,8972,1},
		[3]={"H�o Nguy�t-�� Ki�p T�n Gi� Ph�t Th�",0,0,8973,1},
		[4]={"H�o Nguy�t-�� �ch T�n Gi� Ph�t Tr��ng",0,8,8974,1},
		[6]={"H�o Nguy�t-V�n Ki�p Th�nh Th� Tr�m",0,1,8975,1},
		[8]={"H�o Nguy�t-Ph�t V�n Th�nh C� Li�n Ki�m",0,2,8976,1},
		[9]={"H�o Nguy�t-Ph�t Tr�n Th�nh C� C�m",0,10,8977,1},
		[11]={"H�o Nguy�t-Tr�c Ph�ng Thi�n C�i Th�",0,0,8978,1},
		[12]={"H�o Nguy�t-Du Long ��a Kh�t C�n",0,5,8979,1},
		[14]={"H�o Nguy�t-V� C�c Thi�n T�n T�c Ki�m",0,2,8980,1},
		[15]={"H�o Nguy�t-B�ch L�c Thi�n T�n B�t",0,9,8981,1},
		[17]={"H�o Nguy�t-C�m Thi�n ��u H�n Th��ng",0,6,8982,1},
		[18]={"H�o Nguy�t-��nh Thi�n Th�n Ngh� Cung",0,4,8983,1},
		[20]={"H�o Nguy�t-Qu� X�c T� Th�n �ao",0,7,8984,1},
		[21]={"H�o Nguy�t-Vu C�t ��c V��ng Tr�o",0,11,8985,1},
		[23]={"H�o Nguy�t-B�t ��ng Ch�n Ti�n Ki�m",	0,	2,	8986},
		[29]={"H�o Nguy�t-T� V�n Ti�n T� Phi�n",	0,	13,	8990},
		[30]={"H�o Nguy�t-Phi H� Ti�n T� �u Lan Ti�u",	0,	12,	8991},
	},
	[5] = {
		[2]={"Di�u D��ng-�� N�n T�n Gi� Ph�t �ao",0,3,8992},
		[3]={"Di�u D��ng-�� Ki�p T�n Gi� Ph�t Th�",0,0,8993},
		[4]={"Di�u D��ng-�� �ch T�n Gi� Ph�t Tr��ng",0,8,8994},
		[6]={"Di�u D��ng-V�n Ki�p Th�nh Th� Tr�m",0,1,8995},
		[8]={"Di�u D��ng-Ph�t V�n Th�nh C� Li�n Ki�m",0,2,8996},
		[9]={"Di�u D��ng-Ph�t Tr�n Th�nh C� C�m",0,10,8997},
		[11]={"Di�u D��ng-Tr�c Ph�ng Thi�n C�i Th�",0,0,8998},
		[12]={"Di�u D��ng-Du Long ��a Kh�t C�n",0,5,8999},
		[14]={"Di�u D��ng-V� C�c Thi�n T�n T�c Ki�m",0,2,9000},
		[15]={"Di�u D��ng-B�ch L�c Thi�n T�n B�t",0,9,9001},
		[17]={"Di�u D��ng-C�m Thi�n ��u H�n Th��ng",0,6,9002},
		[18]={"Di�u D��ng-��nh Thi�n Th�n Ngh� Cung",0,4,9003},
		[20]={"Di�u D��ng-Qu� X�c T� Th�n �ao",0,7,9004},
		[21]={"Di�u D��ng-Vu C�t ��c V��ng Tr�o",0,11,9005},
		[23]={"Di�u D��ng-B�t ��ng Ch�n Ti�n Ki�m",	0,	2,	9006},
		[29]={"Di�u D��ng-T� V�n Ti�n T� Phi�n",	0,	13,	9010},
		[30]={"Di�u D��ng-Phi H� Ti�n T� �u Lan Ti�u",	0,	12,	9011},
	},
}
--װ���ܱ�
tQuipMainInfo = {
	tArmIdInfo[1],tArmIdInfo[2],tArmIdInfo[3],tWeaponIdInfo,tRingIdInfo
}
--�һ�װ�������
tEquipSynthInfo = {
	[1] = {		--�ǿ�
		--ͷ
		[1] = {
			--װ����
			tEquipInfo = tArmIdInfo[1][1],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"M�nh Tinh Ng�n",300},
				{" Kim ",300},
			}
		},
		--�·�
		[2] = {
			--װ����
			tEquipInfo = tArmIdInfo[2][1],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"M�nh Tinh Ng�n",360},
				{" Kim ",200},
			}
		},
		--��װ
		[3] = {
			--װ����
			tEquipInfo = tArmIdInfo[3][1],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"M�nh Tinh Ng�n",180},
				{" Kim ",100},
			}
		},
		--����
		[4] = {
			--װ����
			tEquipInfo = tWeaponIdInfo[1],
			tTableStructure = {"Route"},
			--���ı�
			tEquipConsum = {
				{"M�nh Tinh Ng�n",420},
				{"Ng� H�nh Huy�n Th�ch",420},
				{" Kim ",400},
			}
		},
		--����
		[5] = {
			--װ����
			tEquipInfo = tRingIdInfo[1],
			--���ı�
			tEquipConsum = {
				{"Ng� H�nh Huy�n Th�ch",420},
				{" Kim ",200},
			}
		},
	},
	[2] = {		--����
		--ͷ
		[1] = {
			--װ����
			tEquipInfo = tArmIdInfo[1][2],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"Thi�nNgh�a TinhThi�t",480},
				{" Kim ",300},
			}
		},
		--�·�
		[2] = {
			--װ����
			tEquipInfo = tArmIdInfo[2][2],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"Thi�nNgh�a TinhThi�t",360},
				{" Kim ",200},
			}
		},
		--��װ
		[3] = {
			--װ����
			tEquipInfo = tArmIdInfo[3][2],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"Thi�nNgh�a TinhThi�t",180},
				{" Kim ",100},
			}
		},
		--����
		[4] = {
			--װ����
			tEquipInfo = tWeaponIdInfo[2],
			tTableStructure = {"Route"},
			--���ı�
			tEquipConsum = {
				{"Ng� H�nh Huy�n Thi�t",420},
				{"Thi�nNgh�a TinhThi�t",420},
				{" Kim ",400},
			}
		},
		--����
		[5] = {
			--װ����
			tEquipInfo = tRingIdInfo[2],
			--���ı�
			tEquipConsum = {
				{"Ng� H�nh Huy�n Thi�t",420},
				{" Kim ",200},
			}
		},
	},
	[3] = {		--����
		--ͷ
		[1] = {
			--װ����
			tEquipInfo = tArmIdInfo[1][4],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"Thi�n Cang L�nh",4},
				{" Kim ",200},
			},
		},
		--�·�
		[2] = {
			--װ����
			tEquipInfo = tArmIdInfo[2][4],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"Thi�n Cang L�nh",3},
				{" Kim ",150},
			},
		},
		--��װ
		[3] = {
			--װ����
			tEquipInfo = tArmIdInfo[3][4],
			--��ṹ
			tTableStructure = {"Body"},
			--���ı�
			tEquipConsum = {
				{"Thi�n Cang L�nh",2},
				{" Kim ",100},
			},
		},
		--����
		[4] = {
			--װ����
			tEquipInfo = tWeaponIdInfo[4],
			tTableStructure = {"Route"},
			--���ı�
			tEquipConsum = {
				{"Thi�n Cang L�nh",6},
				{" Kim ",300},
			},
		},
		--����
		[5] = {
			--װ����
			tEquipInfo = tRingIdInfo[4],
			--��ṹ
			tTableStructure = {"Route"},
			--���ı�
			tEquipConsum = {
				{"Thi�n Cang L�nh",3},
				{" Kim ",150},
			},
		},
	},
	[4] = {		--���
		--ͷ
		[1] = {
			--װ����
			tEquipInfo = tArmIdInfo[1][3],
			--��ṹ
			tTableStructure = {"Route","Body"},
			--���ı�
			tEquipConsum = {
				{"H�o Nguy�t Huy�n Kim",480},
				{" Kim ",300},
			},
		},
		--�·�
		[2] = {
			--װ����
			tEquipInfo = tArmIdInfo[2][3],
			--��ṹ
			tTableStructure = {"Route","Body"},
			--���ı�
			tEquipConsum = {
				{"H�o Nguy�t Huy�n Kim",360},
				{" Kim ",200},
			},
		},
		--��װ
		[3] = {
			--װ����
			tEquipInfo = tArmIdInfo[3][3],
			--��ṹ
			tTableStructure = {"Route","Body"},
			--���ı�
			tEquipConsum = {
				{"H�o Nguy�t Huy�n Kim",180},
				{" Kim ",100},
			},
		},
		--����
		[4] = {
			--װ����
			tEquipInfo = tWeaponIdInfo[3],
			tTableStructure = {"Route"},
			--���ı�
			tEquipConsum = {
				{"H�o Nguy�t Huy�n Kim",420},
				{"Ng� H�nh Huy�n Kim",420},
				{" Kim ",400},
			},
		},
		--����
		[5] = {
			--װ����
			tEquipInfo = tRingIdInfo[3],
			--���ı�
			tEquipConsum = {
				{"Ng� H�nh Huy�n Kim",420},
				{" Kim ",200},
			},
		},
	},
	[5] = {		--ҫ��
		--ͷ
		[1] = {
			--װ����
			tEquipInfo = tArmIdInfo[1][5],
			--��ṹ
			tTableStructure = {"Route","Body"},
			--���ı�
			tEquipConsum = {
				{"Di�u D��ng C�u Huy�n",4},
				{" Kim ",400},
			},
		},
		--�·�
		[2] = {
			--װ����
			tEquipInfo = tArmIdInfo[2][5],
			--��ṹ
			tTableStructure = {"Route","Body"},
			--���ı�
			tEquipConsum = {
				{"Di�u D��ng C�u Huy�n",3},
				{" Kim ",300},
			},
		},
		--��װ
		[3] = {
			--װ����
			tEquipInfo = tArmIdInfo[3][5],
			--��ṹ
			tTableStructure = {"Route","Body"},
			--���ı�
			tEquipConsum = {
				{"Di�u D��ng C�u Huy�n",2},
				{" Kim ",200},
			},
		},
		--����
		[4] = {
			--װ����
			tEquipInfo = tWeaponIdInfo[5],
			tTableStructure = {"Route"},
			--���ı�
			tEquipConsum = {
				{"Di�u D��ng C�u Huy�n",6},
				{" Kim ",600},
			},
		},
		--����
		[5] = {
			--װ����
			tEquipInfo = tRingIdInfo[5],
			--���ı�
			tEquipConsum = {
				{"Di�u D��ng C�u Huy�n",3},
				{" Kim ",300},
			},
		},
	},
}
--=============����װ�����Ž׶����õĲ��Ϻ�װ�����α�
function release_fobidden()
	--װ������
	for nEquipSeq,tEquipPosSeq in tReleaseForbiddenList["tEquip"] do
		tremove(tEquipSeriesName,nEquipSeq)
		tremove(tEquipSynthInfo,nEquipSeq)
		for _,nEquipPosSeq in tEquipPosSeq do
			tremove(tQuipMainInfo[nEquipSeq],nEquipPosSeq)
		end
	end
	--��������

end
release_fobidden()
--=================
function OnUse(nItemIndex)
	local sItemName= get_item_info(nItemIndex)
	Say(SClew.."<color=green>"..sItemName.."<color>"..tMetiralInfo[sItemName][2]..format(",��i hi�p mu�n d�ng <color=green>%s<color> cho m�c ��ch g�?",sItemName),
		5,
		"Ta mu�n gh�p trang b� /#equip_chg_main("..nItemIndex..")",
		"Ta mu�n xem ph�i ph��ng gh�p trang b� /equip_chg_rule",
		"Ta mu�n n�ng c�p ��o c� /#dia_metiral_chg_main("..nItemIndex..")",
		"Ta mu�n xem ph�i ph��ng n�ng c�p /metiral_chg_rule",
		"Tho�t/nothing"
	)
end
--װ���һ��ܱ�
function equip_chg_main(nItemIndex)
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",SClew.."Ng��i ch�a gia nh�p m�n ph�i kh�ng th� ��i ��o c�!")
		return
	end
	local tSay = {SClew.."H�y ch�n h� trang b� c�c h�n mu�n ��i ."}
	--ֱ���г���
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
					tinsert(tSay,"Ta mu�n ��i "..tEquipInfo[1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..")")
				else
					for i = 1,getn(tEquipInfo) do
						tinsert(tSay,"Ta mu�n ��i "..tEquipInfo[i][1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..","..i..")")
					end
				end
			end
		end
	end
	if getn(tSay) == 1 then
		tSay = {SClew.."Nguy�n li�u ho�c ti�n v�ng kh�ng ��! "}
		tinsert(tSay,"Ta mu�n xem ph�i ph��ng gh�p trang b� /equip_chg_rule")
	end
	tinsert(tSay,"Tho�t/nothing")
	SelectSay(tSay)
end
function equip_chg_dtm(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	local tSay = {}
	tSay[1] = SClew..format("��i <color=green>%s<color> c�n nguy�n li�u sao:",tEquipInfo[1])
	--�����ж�
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	if nChkFlag ~= 1 then
		equip_chg_view(sItemName)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n X�c ��nh mu�n ��i?"
		if  arg[3] then
			tinsert(tSay,"X�c ��nh /#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..","..nDetailSeq..")")
		else
			tinsert(tSay,"X�c ��nh /#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..")")
		end
		tinsert(tSay,"Tho�t/nothing")
		SelectSay(tSay)
	end
end
--װ���һ�ת��
function equip_chg_deal(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	item_chg_main(tEquipInfo[1],tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum,{tEquipInfo[2],tEquipInfo[3],tEquipInfo[4]})
end
--�鿴װ���ϳ��䷽
function equip_chg_rule(...)
	local tSay = {SClew.."H�y ch�n h� trang b� c�n xem ."}
	for i = 1,getn(tEquipSeriesName) do
		tinsert(tSay,format("Ta mu�n xem h� %s /#equip_series_sel(%d)",tEquipSeriesName[i],i))
	end
	tinsert(tSay,"Tho�t/nothing")
	SelectSay(tSay)
end
--�����鿴�ϳ��䷽
function equip_series_sel(nEuiqpSerial)
	local tSay = {SClew..format("H�y ch�n m�n trang b� c�a h� %s.",tEquipSeriesName[nEuiqpSerial])}
	for i = 1,getn(tEquipPosName) do
		tinsert(tSay,format("Ta mu�n xem %s trang b� %s/#equip_chg_view(%d,%d)",tEquipSeriesName[nEuiqpSerial],tEquipPosName[i],nEuiqpSerial,i))
	end
	tinsert(tSay,"Tho�t/nothing")
	SelectSay(tSay)
end
function equip_chg_view(nEuiqpSerial,nEuipPos)
	tSay = {SClew..format("Ta mu�n xem %s trang b� %s c�n nguy�n li�u sau:",tEquipSeriesName[nEuiqpSerial],tEquipPosName[nEuipPos])}
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
	end
	tinsert(tSay,"Tho�t/nothing")
	SelectSay(tSay)
end
--��ȡװ������
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
--===================������������
--������������
function dia_metiral_chg_main(nItemIndex)
	--�����ռ��ж�
	if gf_Judge_Room_Weight(3, 1) ~= 1 then
		return 0;
	end
	local tSay = {SClew.."H�y ch�n ��o c� c�n n�ng c�p ."}
	local sMetrialName= get_item_info(nItemIndex)
	for sItemName,tIntemInfo in tItemSynthInfo do
		for i = 1,getn(tIntemInfo[1]) do
			if sMetrialName == tIntemInfo[1][i][1] and (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 )then
				tinsert(tSay,format("Ta c�n n�ng c�p %s/#say_metiral_chg_sel(\"%s\")",sItemName,sItemName))
			end
		end
	end
	if sMetrialName == "M�nh Tinh Ng�n" then
		tinsert(tSay,"Ta c�n n�ng c�p H�o Nguy�t Huy�n Kim/haonguyethk")
	elseif sMetrialName == "Ng� H�nh Huy�n Th�ch" then
		tinsert(tSay,"Ta c�n n�ng c�p Ng� H�nh Huy�n Kim/nguhanhhk")
	end
	
	if getn(tSay) == 1 then
		Talk(1,"",SClew.."<color=green>"..sMetrialName.."<color> t�m th�i kh�ng th� n�ng c�p!")
		return
	else
		tinsert(tSay,"Tho�t/nothing")
		SelectSay(tSay)
	end
end
function say_metiral_chg_sel(sItemName)
	--�����ж�
	local nChgNum = metiral_chg_num(sItemName)
	if nChgNum == 1 then
		metiral_chg_dtm(sItemName,nChgNum)
	elseif nChgNum > 1 then
		SetTaskTemp(nTaskTempId_Item_HashCode,Hash(sItemName))
		AskClientForNumber("metiral_chg_num_enter",1,nChgNum,format("��i %s s� l��ng",sItemName))
	else
		metiral_chg_view(sItemName)
	end
end
--������������
function metiral_chg_num_enter(nChgNum)
	if nChgNum <= 0 then return end
	local sItemName = get_hash_itemname(tItemSynthInfo)
	if sItemName == nil then
		return
	else
		metiral_chg_dtm(sItemName,nChgNum)
	end
end
--��������ȷ��չ��
function metiral_chg_dtm(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local tSay = {}
	if nChgNum == 1 then
		tSay[1] = SClew..format("N�ng c�p <color=green>%s<color> c�n nguy�n li�u sau:",sItemName)
	else
		tSay[1] = SClew..format("N�ng c�p <color=green>%s<color>x<color=green>%d<color> c�n nguy�n li�u sau:",sItemName,nChgNum)
	end
	--�����ж�
	local nChgNumChk = metiral_chg_num(sItemName)
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChgNum > nChgNumChk or nChkFlag ~= 1 then
		metiral_chg_view(sItemName,nChgNum)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n X�c ��nh mu�n ��i?"
		tinsert(tSay,"X�c ��nh /#metiral_chg_main(\""..sItemName.."\","..nChgNum..")")
		tinsert(tSay,"Tho�t/nothing")
		SelectSay(tSay)
	end
end
--���϶һ�ת��
function metiral_chg_main(sItemName,nChgNum)
	item_chg_main(sItemName,tItemSynthInfo[sItemName][1],tMetiralInfo[sItemName][1],nChgNum)
end
--�һ�ȷ�ϴ���
function item_chg_main(sItemName,tConsumInfo,tPrizeInfo,nChgNum)
	nChgNum = nChgNum or 1
	local nChkFlag,tChkResult = metiral_take_chk(tConsumInfo,nChgNum)
	if nChkFlag ~= 1 then
		return
	else
		--�����ռ��ж�
		if gf_Judge_Room_Weight(3, 1) ~= 1 then
			return 0;
		end
		--��Ʒɾ���ж�
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
		--��Ʒ���Ӵ���
		if tPrizeInfo[1] == 2 then
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum)
		else
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum,1,-1,-1,-1,-1,-1,-1)
		end
	end
end
--===������������
function metiral_chg_rule()
	local tSay = {SClew.."H�y ch�n ��o c� c�n xem ."}
	for sItemName,tIntemInfo in tItemSynthInfo do
		if (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 ) then
			tinsert(tSay,format("Ta mu�n xem nguy�n li�u n�ng c�p %s /#metiral_chg_view(\"%s\")",sItemName,sItemName))
		end
	end
	tinsert(tSay,"Tho�t/nothing")
	SelectSay(tSay)
end
--�������������鿴
function metiral_chg_view(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local sItemStory = SClew.."<color=green>"..sItemName.."<color>"
	if tMetiralInfo[sItemName][2] ~= nil and tMetiralInfo[sItemName][2] ~= "" then
		sItemStory = sItemStory..tMetiralInfo[sItemName][2]..","
	end
	local tSay = {sItemStory.."M�i nguy�n li�u n�ng c�p c�n nh� sau:"}
	--���ϼ��
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChkFlag == 1 then
		tinsert(tSay,"\n Ta mu�n n�ng c�p "..sItemName.."/#say_metiral_chg_sel(\""..sItemName.."\")")
	end
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		if tItemSynthInfo[sItemName][1][i][1] ~= nil and tItemSynthInfo[tItemSynthInfo[sItemName][1][i][1]] ~= nil then
			tinsert(tSay,"Ta mu�n xem "..tItemSynthInfo[sItemName][1][i][1].."Ph��ng ph�p n�ng c�p /#metiral_chg_view(\""..tItemSynthInfo[sItemName][1][i][1].."\")")
		end
	end
	tinsert(tSay,"tr� l�i/metiral_chg_rule")
	tinsert(tSay,"Tho�t/nothing")
	SelectSay(tSay)
end
--�����㹻���
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
--���Ͽɶһ��������
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
--��ȡhash���Ӧ����Ʒ��
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

-- ��i H�o Nguy�t Huy�n Kim
function haonguyethk()
		AskClientForNumber("ConfirmNumHNHK", 1, 100, "H�o Nguy�t")
end

function ConfirmNumHNHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30300) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i "..nCount.." H�o Nguy�t Huy�n Kim");
        return 0;
   elseif  DelItem(2,1,30300, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30301, nCount}, "H�o Nguy�t Huy�n Kim", "NANG CAP ITEM", "��i h�o nguy�t huy�n kim th�nh c�ng", 0, 1)
    end
end

-- ��i Ng� H�nh Huy�n Kim
function nguhanhhk()
		AskClientForNumber("ConfirmNumNHHK", 1, 100, "Ng� H�nh")
end

function ConfirmNumNHHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30303) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "B�n kh�ng �� �i�u ki�n ��i "..nCount.." Ng� H�nh Huy�n Kim");
        return 0;
   elseif  DelItem(2,1,30303, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30304, nCount}, "Ng� H�nh Huy�n Kim", "NANG CAP ITEM", "��i ng� h�nh huy�n kim th�nh c�ng", 0, 1)
    end
    
end