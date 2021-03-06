--聚灵鼎脚本
--by vivi
--09/14/2007

Include("\\script\\lib\\lingshi_info.lua")
Include("\\script\\lib\\lingshipeifang_info.lua")
Include("\\script\\class\\ktabfile.lua")

lingshi_pf = new(KTabFile,"\\settings\\item\\lingshipeifang.txt")
--临时变量
TT_LINGSHI_LV = 120; --记录玩家选择取出灵石的等级
TT_LINGSHI_PF_LV = 121; --记录玩家选择取出灵石配方的等级
TT_LINGSHI_CHANGE_LV = 123; --记录玩家选择兑换高级灵石时的消耗的灵石等级
TT_LSPF_CHANGE_LV = 124; --记录玩家选择兑换高级灵石配方时的消耗的灵石配方等级

--任务变量
TASK_LINGSHI_QINGLING = 2335; --对灵石负数清0处理，执行一次
TASK_PF_QINGLING = 2336; --对灵石配方负数清0处理，执行一次
--消耗随机次数权值表
tRandNum ={--属性名	id	位置	最低等级	是否随机	消耗随机次数	等级1-7权值
{"T? l? m礽 m遪 v? kh? gi秏",9,2,1,0,1,1,1,1,1,2,2,2},
{"S鴆 l鵦 t╪g",110,2,1,0,1,1,1,1,1,2,2,2},
{"S鴆 l鵦 t╪g",110,0,1,0,1,1,1,1,1,2,2,2},
{"S鴆 l鵦 t╪g",110,1,1,0,1,1,1,1,1,2,2,2},
{"S鴆 l鵦 t╪g",110,3,1,0,1,1,1,1,1,2,2,2},
{"Sinh l鵦 +",11,0,1,0,3,1,1,1,1,2,2,2},
{"Sinh l鵦 +",11,1,1,0,3,1,1,1,1,2,2,2},
{"Sinh l鵦 +",11,3,1,0,3,1,1,1,1,2,2,2},
{"H? g鬰 i phng sinh l鵦 h錳 ph鬰 " ,333,2,1,0,2,1,1,1,1,2,2,2},
{"600 gi﹜  b襫 v? kh? h錳 ph鬰",43,2,1,1,2,1,1,1,1,2,2,2},
{"600 gi﹜  b襫 thng y h錳 ph鬰 ",112,1,1,1,2,1,1,1,1,2,2,2},
{"600 gi﹜  b襫 n鉵 h錳 ph鬰 ",113,0,1,1,2,1,1,1,1,2,2,2},
{"600 gi﹜  b襫 h? y h錳 ph鬰 ",114,3,1,1,2,1,1,1,1,2,2,2},
{"y猽 c莡 ng c蕄 gi秏 ",334,0,6,1,3,1,1,1,1,2,2,2},
{"y猽 c莡 ng c蕄 gi秏 "	,334,1,6,1,3,1,1,1,1,2,2,2},
{"y猽 c莡 ng c蕄 gi秏 "	,334,3,6,1,3,1,1,1,1,2,2,2},
{"T? l? nh ph筸 vi",335,2,1,0,3,1,1,1,1,2,2,2},
{"V? kh? nh ngo筰 l韓 nh蕋 t╪g ",65,2,1,0,3,1,1,1,1,2,2,2},
{"V? kh? nh ngo筰 th蕄 nh蕋 t╪g "	,66,2,1,0,3,1,1,1,1,2,2,2},
{"V? kh? nh n閕 l韓 nh蕋 t╪g"	,67,2,1,0,3,1,1,1,1,2,2,2},
{"V? kh? nh n閕 th蕄 nh蕋 t╪g "	,68,2,1,0,3,1,1,1,1,2,2,2},
{"Dc hi謚 k衞 d礽",39,0,1,0,2,1,1,2,2,3,3,4},
{"Th? l鵦 t鑙 產 t╪g",336,1,1,0,4,1,1,2,2,3,3,4},
{"T蕁 c玭g t╪g ",77,2,1,1,3,1,1,2,2,3,3,4},
{"Ch輓h x竎 t╪g",337,2,1,0,4,1,1,2,2,3,3,4},
{"N? tr竛h t╪g",338,3,1,0,5,1,1,2,2,3,3,4},
{"Ph秐 n",339,1,1,0,5,1,1,2,2,3,3,4},
{"M鏸 10 gi﹜ n閕 l鵦 h錳 ph鬰",340,0,5,1,5,1,1,2,2,3,3,4},
{"M鏸 10 gi﹜ n閕 l鵦 h錳 ph鬰",340,1,5,1,5,1,1,2,2,3,3,4},
{"M鏸 10 gi﹜ n閕 l鵦 h錳 ph鬰",340,3,5,1,5,1,1,2,2,3,3,4},
{"M鏸 10 gi﹜ sinh l鵦 h錳 ph鬰",341,0,5,1,5,1,1,2,2,3,3,4},
{"M鏸 10 gi﹜ sinh l鵦 h錳 ph鬰",341,1,5,1,5,1,1,2,2,3,3,4},
{"M鏸 10 gi﹜ sinh l鵦 h錳 ph鬰",341,3,5,1,5,1,1,2,2,3,3,4},
{"Цnh t藀 trung t╪g",342,2,1,0,4,1,1,2,2,3,3,4},
{"N閕 ph遪g t╪g ",343,0,1,0,4,1,1,2,2,3,3,4},
{"N閕 ph遪g t╪g ",343,1,1,0,4,1,1,2,2,3,3,4},
{"N閕 ph遪g t╪g ",343,3,1,0,4,1,1,2,2,3,3,4},
{"Ph遪g th? ngo筰 c玭g t╪g",344,0,1,0,4,1,1,2,2,3,3,4},
{"Ph遪g th? ngo筰 c玭g t╪g",344,1,1,0,4,1,1,2,2,3,3,4},
{"Ph遪g th? ngo筰 c玭g t╪g",344,3,1,0,4,1,1,2,2,3,3,4},
{"V? c玭g hao n閕 gi秏",345,0,1,0,5,1,1,2,2,3,3,4},
{"Ph竧 huy c玭g k輈h l韓 nh蕋",346,2,1,0,5,1,1,2,2,3,3,4},
{"T? l? nh蕋 nh l祄 i phng kh? huy誸 hao t鎛",53,2,4,0,5,1,1,2,2,3,3,4},
{"T? l? nh蕋 nh l祄 i phng ch﹏ nguy猲 hao t鎛",54,2,4,0,5,1,1,2,2,3,3,4},
{"чc s竧 gi秏",347,0,1,0,4,1,1,2,2,3,3,4},
{"чc s竧 gi秏",347,1,1,0,4,1,1,2,2,3,3,4},
{"чc s竧 gi秏",347,3,1,0,4,1,1,2,2,3,3,4},
{"T蕁 c玭g l祄 s鴆 m筺h i phng gi秏",348,2,1,0,5,1,1,2,2,3,3,4},
{"T蕁 c玭g l祄 g﹏ c鑤 i phng gi秏",349,2,1,0,5,1,1,2,2,3,3,4},
{"T蕁 c玭g l祄 n閕 c玭g i phng gi秏",350,2,1,0,5,1,1,2,2,3,3,4},
{"Khi課 i phng gi秏 Linh ho箃 ",351,2,1,0,5,1,1,2,2,3,3,4},
{"T蕁 c玭g l祄 th﹏ ph竝 i phng gi秏",352,2,1,0,5,1,1,2,2,3,3,4},
{"T蕁 c玭g l祄 ph遪g ngo筰 i phng gi秏",353,2,1,0,5,1,1,2,2,3,3,4}, 
{"T蕁 c玭g l祄 gi秏 n閕 ph遪g i phng",354,2,1,0,5,1,1,2,2,3,3,4},
{"Gi秏 th阨 gian tr髇g thng	",355,1,1,0,5,1,1,2,2,3,3,4},
{"T? l? nh ch苙 xu蕋 chi猽 c馻 i phng	",356,1,3,0,6,1,1,2,2,3,3,4},
{"G﹏ c鑤 t╪g",357,2,1,0,5,1,1,2,2,3,3,4},
{"G﹏ c鑤 t╪g",357,0,1,0,5,1,1,2,2,3,3,4},
{"G﹏ c鑤 t╪g",357,1,1,0,5,1,1,2,2,3,3,4},
{"G﹏ c鑤 t╪g",357,3,1,0,5,1,1,2,2,3,3,4},
{"S鴆 m筺g t╪g",358,2,1,0,5,1,1,2,2,3,3,4},
{"S鴆 m筺g t╪g",358,0,1,0,5,1,1,2,2,3,3,4},
{"S鴆 m筺g t╪g",358,1,1,0,5,1,1,2,2,3,3,4},
{"S鴆 m筺g t╪g",358,3,1,0,5,1,1,2,2,3,3,4},
{"Th﹏ ph竝 t╪g",359,2,1,0,5,1,1,2,2,3,3,4},
{"Th﹏ ph竝 t╪g",359,0,1,0,5,1,1,2,2,3,3,4},
{"Th﹏ ph竝 t╪g",359,1,1,0,5,1,1,2,2,3,3,4},
{"Th﹏ ph竝 t╪g",359,3,1,0,5,1,1,2,2,3,3,4},
{"Linh ho箃 t╪g",360,2,1,0,5,1,1,2,2,3,3,4},
{"Linh ho箃 t╪g",360,0,1,0,5,1,1,2,2,3,3,4},
{"Linh ho箃 t╪g",360,1,1,0,5,1,1,2,2,3,3,4},
{"Linh ho箃 t╪g",360,3,1,0,5,1,1,2,2,3,3,4},
{"N閕 c玭g t╪g ",361,2,1,0,5,1,1,2,2,3,3,4},
{"N閕 c玭g t╪g ",361,0,1,0,5,1,1,2,2,3,3,4},
{"N閕 c玭g t╪g ",361,1,1,0,5,1,1,2,2,3,3,4},
{"N閕 c玭g t╪g ",361,3,1,0,5,1,1,2,2,3,3,4},
{"Kh竛g c",100,0,1,0,6,1,1,2,2,3,3,4},
{"Kh竛g c",100,1,1,0,6,1,1,2,2,3,3,4},
{"Kh竛g c",100,3,1,0,6,1,1,2,2,3,3,4},
{"Chuy觧 h鉧 s竧 thng th祅h n閕 l鵦",46,0,5,1,6,1,1,2,2,3,3,4},
{"Chuy觧 h鉧 s竧 thng th祅h n閕 l鵦",46,1,5,1,6,1,1,2,2,3,3,4},
{"T蕁 c玭g l祄 i phng hao t鎛 n閕 l鵦",49,2,5,0,6,1,2,2,3,3,4,5},
{"Ph? ph遪g th? i phng",362,2,5,0,7,1,2,2,3,3,4,5},
{"T蕁 c玭g k蘭 c s竧",363,2,1,0,7,1,2,2,3,3,4,5},
{"Sinh l鵦 t鑙 產 t╪g-%",79,2,1,0,7,1,2,2,3,3,4,5},
{"Sinh l鵦 t鑙 產 t╪g-%",79,0,1,0,7,1,2,2,3,3,4,5},
{"Sinh l鵦 t鑙 產 t╪g-%",79,1,1,0,7,1,2,2,3,3,4,5},
{"Sinh l鵦 t鑙 產 t╪g-%",79,3,1,0,7,1,2,2,3,3,4,5},
{"N閕 l鵦 t鑙 產 t╪g-%",80,2,1,0,6,1,2,2,3,3,4,5},
{"N閕 l鵦 t鑙 產 t╪g-%",80,0,1,0,6,1,2,2,3,3,4,5},
{"N閕 l鵦 t鑙 產 t╪g-%",80,1,1,0,6,1,2,2,3,3,4,5},
{"N閕 l鵦 t鑙 產 t╪g-%",80,3,1,0,6,1,2,2,3,3,4,5},
{"Kh綾 n?",364,1,3,0,6,1,2,2,3,3,4,5},
{"H? tr? t蕁 c玭g  duy tr? ",41,0,1,0,7,1,2,2,3,3,4,5},
{"H? tr? t蕁 c玭g  duy tr? ",41,2,1,0,7,1,2,2,3,3,4,5},
{"H? tr? t蕁 c玭g  duy tr? ",41,1,1,0,7,1,2,2,3,3,4,5},
{"H? tr? t蕁 c玭g  duy tr? ",41,3,1,0,7,1,2,2,3,3,4,5},
{"H? tr? ph遪g th? duy tr? ",42,0,1,0,7,1,2,2,3,3,4,5},
{"H? tr? ph遪g th? duy tr? ",42,2,1,0,7,1,2,2,3,3,4,5},
{"H? tr? ph遪g th? duy tr? ",42,1,1,0,7,1,2,2,3,3,4,5},
{"H? tr? ph遪g th? duy tr? ",42,3,1,0,7,1,2,2,3,3,4,5},
{"C玭g k輈h khi課 ngo筰 ph遪g c馻 i phng gi秏",382,2,1,0,7,1,2,2,3,3,4,5},
{"C玭g k輈h khi課 n閕 l鵦 c馻 i phng gi秏 ",383,2,1,0,7,1,2,2,3,3,4,5},
{"T? l? ch辵 n gi秏 n鯽	",365,0,5,0,7,1,2,2,3,3,4,5},
{"T? l? ch辵 n gi秏 n鯽	",365,1,5,0,7,1,2,2,3,3,4,5},
{"T? l? ch辵 n gi秏 n鯽	",365,3,5,0,7,1,2,2,3,3,4,5},
{"Kinh nghi謒 nh薾 頲 t╪g",366,2,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghi謒 nh薾 頲 t╪g",366,0,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghi謒 nh薾 頲 t╪g",366,1,5,1,5,2,2,3,3,3,4,5},
{"Kinh nghi謒 nh薾 頲 t╪g",366,3,5,1,5,2,2,3,3,3,4,5},
{"L祄 gi秏 n? tr竛h c馻 i phng",373,3,4,0,8,2,2,3,3,3,4,5},
{"L祄 ch薽 n? tr竛h c馻 i phng",374,3,4,0,8,2,2,3,3,3,4,5},
{"T? l? n? tr竛h nh lui",375,3,4,0,8,2,2,3,3,3,4,5},
{"T? l? n? tr竛h nh ng?",376,3,4,0,8,2,2,3,3,3,4,5},
{"B? qua n? tr竛h i phng",377,0,4,0,8,2,2,3,3,3,4,5},
{"G﹜ m?",378,0,4,0,8,2,2,3,3,3,4,5},
{"G﹜ cho竛g",379,0,4,0,8,2,2,3,3,3,4,5},
{"G﹜ h鏽 lo筺 n? tr竛h",380,1,4,0,8,2,2,3,3,3,4,5},
{"G﹜ ng? m? gi秏 n? tr竛h",381,1,4,0,8,2,2,3,3,3,4,5},
{"Ngo筰 ph遪g gi秏, ngo筰 k輈h t╪g",18,1,1,0,8,2,2,3,3,3,4,5},
{"N閕 ph遪g gi秏, N閕 c玭g t╪g",19,1,1,0,8,2,2,3,3,3,4,5},
{"S竧 thng t╪g ",372,2,3,0,7,2,2,3,3,3,4,5},
{"T蕋 c? thu閏 t輓h t╪g",367,2,3,0,8,2,2,3,3,3,4,5},
{"T蕋 c? thu閏 t輓h t╪g",367,0,3,0,8,2,2,3,3,3,4,5},
{"T蕋 c? thu閏 t輓h t╪g",367,1,3,0,8,2,2,3,3,3,4,5},
{"T蕋 c? thu閏 t輓h t╪g",367,3,3,0,8,2,2,3,3,3,4,5},
{"Ngo筰 k輈h + ",368,2,3,0,8,2,2,3,3,3,4,5},
{"N閕 k輈h t╪g ",369,2,3,0,8,2,2,3,3,3,4,5},
{"T? l? xu蕋 chi猽 t╪g",370,2,4,0,8,2,2,3,3,3,4,5},
{"T鑓  thi tri觧 v? c玭g t╪g",371,0,3,0,8,2,2,3,3,4,5,6}
}
function OnUse()
	local strtab = {
		"T玦 c? Linh th筩h n祇 /which_lingshi",
		"T玦 c? Linh th筩h ph鑙 phng n祇/which_lingshi_pf",
		"Ch鋘 Linh th筩h ph鑙 phng  i /zhiding_main",
		"C竎h i nh? th? n祇 /how_change",
		"Kh玭g c? g?/nothing"}
	Say("V藅 ti猲 c秐h n祔 h蕄 th? linh kh? tr阨 t, b筺 mu鑞 bi誸 甶襲 g?? ",
		getn(strtab),
		strtab)
end

function which_lingshi()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","M? kh鉧 rng trc.");
		return 0;
	end;
	local strtab = {};
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	if GetTask(TASK_LINGSHI_QINGLING) == 0 then
		for j=1,getn(tLingshiTask) do
			if GetTask(tLingshiTask[j]) < 0 then
				SetTask(tLingshiTask[j],0);
			end
		end
		SetTask(TASK_LINGSHI_QINGLING,1);
	end
	for i=1,getn(tLingshiTask) do
		if GetTask(tLingshiTask[i]) > 0 then
			tinsert(strtab,i.." (c蕄) Linh th筩h"..GetTask(tLingshiTask[i])..". /#quchu_lingshi("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","Hi謓 t筰 ngi kh玭g c? Linh th筩h  ? ch? ta. ");
	else
		tinsert(strtab,"tr? l筰/OnUse")
		Say("Xin ch鋘 lo筰 Linh th筩h b筺 mu鑞 t竎h ra",
			getn(strtab),
			strtab)
	end
end

function quchu_lingshi(nLv)	
	Say("B筺 ch蕄 nh薾 t竎h linh th筩h c蕄 "..nLv.." ??",
		2,
		"Ph秈, ta mu鑞 t竎h /#lingshi_num("..nLv..")",
		"Kh玭g, ta nh莔!/which_lingshi")
end

function lingshi_num(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	local nNum = GetTask(tLingshiTask[nLv]);
	SetTaskTemp(TT_LINGSHI_LV,nLv);
	AskClientForNumber("confirm_give_lingshi", 1, tonumber(nNum), "T竎h ra bao nhi猽 "..nLv.." Linh th筩h?");
end

function confirm_give_lingshi(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_LV);
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}	
	if nCount > GetTask(tLingshiTask[nLv]) then
		return
	else
		for i=1,nCount do
			ls_AddRandomLingShi(SYS_TB_LINGSHI_MINLEVEL,nLv,nLv);
		end
		Msg2Player("B筺 l蕐 ra "..nLv.." (c蕄) Linh Th筩h"..nCount.." ");
		if nLv >= 6 then
			WriteLog("Ngi ch琲"..GetName().."L蕐"..nLv.." (c蕄) Linh Th筩h"..nCount.." ");
		end
		SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_LV,0);
	end		
end

function which_lingshi_pf()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","M? kh鉧 rng trc.");
		return 0;
	end;
	local strtab = {};
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(TASK_PF_QINGLING) == 0 then
		for i=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[i]) == -1 then
				SetTask(tPeifangTask[i],1);
				WriteLog("T? Linh кnh b? l鏸: Ngi ch琲"..GetName().." -S? lng 1"..i.." (c蕄) Linh th筩h ph鑙 phng tr? th祅h s? lng 1")
			end
		end		
		for j=1,getn(tPeifangTask) do
			if GetTask(tPeifangTask[j]) < 0 then
				SetTask(tPeifangTask[j],0);
			end
		end
		SetTask(TASK_PF_QINGLING,1);
	end 
	for i=1,getn(tPeifangTask) do
		if GetTask(tPeifangTask[i]) > 0 then
			tinsert(strtab,i.."(c蕄) Linh th筩h ph鑙 phng"..GetTask(tPeifangTask[i]).." ./#quchu_peifang("..i..")");
		end
	end
	if getn(strtab) == 0 then
		Talk(1,"","<color=green>T? Linh жnh<color>: Hi謓 t筰 ngi kh玭g c? Linh th筩h  ? ch? ta. ");
	else
		tinsert(strtab,"tr? l筰/OnUse")
		Say("<color=green>T? Linh жnh<color>: Xin ch鋘 lo筰 Linh th筩h ph鑙 phng b筺 mu鑞 t竎h ra",
			getn(strtab),
			strtab)
	end
end

function quchu_peifang(nLv)
	Say("B筺 ch蕄 nh薾 t竎h linh th筩h c蕄 "..nLv.." (c蕄) Linh th筩h ph鑙 phng?",
		2,
		"Ph秈, ta mu鑞 t竎h /#peifang_num("..nLv..")",
		"Kh玭g, ta nh莔!/which_lingshi_pf")	
end

function peifang_num(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local nNum = GetTask(tPeifangTask[nLv]);
	SetTaskTemp(TT_LINGSHI_PF_LV,nLv);
	AskClientForNumber("confirm_give_peifang", 1, tonumber(nNum), "T竎h l蕐 bao nhi猽 "..nLv.." Linh th筩h ph鑙 phng?");												
end

function confirm_give_peifang(nCount)
	if Zgc_pub_goods_add_chk(nCount,nCount) ~= 1 then
		return
	end
	local nLv = GetTaskTemp(TT_LINGSHI_PF_LV);
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if nCount > GetTask(tPeifangTask[nLv]) then
		return
	else
		for i=1,nCount do
			lspf_AddRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,nLv,nLv);
		end
		Msg2Player("B筺 l蕐 ra "..nLv.." (c蕄)-linh th筩h ph鑙 phng."..nCount.."Trng");
		if nLv >= 6 then
			WriteLog("Ngi ch琲"..GetName().."L蕐"..nLv.." (c蕄)-linh th筩h ph鑙 phng."..nCount.." ");
		end		
		SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nCount);
		SetTaskTemp(TT_LINGSHI_PF_LV,0);															
	end
end
function zhiding_main()
	if IsBoxLocking() ~= 0 then
		Talk(1,"","M? kh鉧 rng trc.");
		return 0;
	end;
	local strtab = {
		"S? l莕 ng蓇 nhi猲 ta ph秈 ti猽 hao  nh薾 頲 Linh th筩h ch? nh/zhiding_lingshi",
		"S? l莕 ng蓇 nhi猲 ta ph秈 ti猽 hao  nh薾 頲 Linh th筩h ph鑙 phng ch? nh/zhiding_peifang",
		"S? l莕 ng蓇 nhi猲 ta ph秈 ti猽 hao  nh薾 頲 v藅 ph萴 qu? hi誱 (nh? Nguy謙 Hoa)/zhiding_yuehua",
		"Ta mu鑞 i s? l莕 ng蓇 nhi猲 c馻 ph鑙 phng v? linh th筩h c蕄 th蕄 th祅h c蕄 cao. /zhiding_gaoji",
		"tr? l筰/OnUse",
		"T筸 th阨 kh玭g th? i 頲./nothing"
		}
	Say("B筺 b? qua nhi襲 c? h閕 nh薾 linh th筩h  l蕐 Linh th筩h ch? nh v? Linh th筩h ph鑙 phng v韎 1 s? v藅 ph萴 qu? kh竎. ",
		getn(strtab),
		strtab)
end

function zhiding_lingshi()
	local strtab = {
		"Linh th筩h c蕄 1 mang thu閏 t輓h c bi謙/#lingshi_zhiding_lv(1)",
		"Linh th筩h c蕄 2 mang thu閏 t輓h c bi謙/#lingshi_zhiding_lv(2)",
		"Linh th筩h c蕄 3 mang thu閏 t輓h c bi謙/#lingshi_zhiding_lv(3)",
		"Linh th筩h c蕄 4 mang thu閏 t輓h c bi謙/#lingshi_zhiding_lv(4)",
		"Linh th筩h c蕄 5 mang thu閏 t輓h c bi謙/#lingshi_zhiding_lv(5)",
		"tr? l筰/zhiding_main"
		}
	Say("Xin ch鋘 ng c蕄 linh th筩h ch? nh",
		getn(strtab),
		strtab)	
end

function lingshi_zhiding_lv(nLv)
	local strtab = {
		"M穙/#lingshi_zhiding_wz("..nLv..",0,0)",
		"Y ph鬰/#lingshi_zhiding_wz("..nLv..",1,0)",
		"V? kh?/#lingshi_zhiding_wz("..nLv..",2,0)",
		"Qu莕 /#lingshi_zhiding_wz("..nLv..",3,0)",
		"tr? l筰/zhiding_lingshi",
		"T筸 th阨 kh玭g i. /nothing"
		}
	Say("Xin ch鋘 v? tr? kh秏 linh th筩h ch? nh. ",
		getn(strtab),
		strtab)
end

function lingshi_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --对应tRandNum表的索引
	for i = 1,getn(tRandNum) do
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lingshi_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"Trang trc/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang k?/#lingshi_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"tr? l筰/#lingshi_zhiding_lv("..nLv..")");
	tinsert(strtab,"T筸 th阨 kh玭g i. /nothing");
	Say("Xin ch鋘 thu閏 t輓h linh th筩h mu鑞 i. ",
		getn(strtab),
		strtab);	
end

function confirm_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"M穙","Y ph鬰","V? kh?","Qu莕 "};
	Say("S? l莕 b筺 ti猽 hao <color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color> l莕"..nLv.." (c蕄) Linh th筩h ng蓇 nhi猲  i thu閏 t輓h Linh th筩h l? <color=yellow>"..tRandNum[nIdx][1].."<color>, v? tr? kh秏 l? 1 <color=yellow> "..tWz[nWz+1].."<color> "..nLv.." (c蕄) Linh th筩h, ng ? ch??",
		2,
		"?, ta mu鑞 i./#give_lingshi_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"T筸 th阨 kh玭g i. /nothing")
end

function give_lingshi_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i l蕐 lo筰  b筺 c莕. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	AddLingShi(nId,nWz,nLv);
	Msg2Player("B筺 nh薾 頲 "..nLv.."(c蕄) Linh Th筩h!");
	if nLv >= 6 then
		WriteLog("Ngi ch琲"..GetName().."S? l莕 ng蓇 nhi猲 ti猽 hao "..nNum.." l莕 nh薾 頲 "..nLv.."(c蕄) Linh Th筩h!");
	end
end

function zhiding_peifang()
	local strtab = {
		"Linh th筩h ph鑙 phng mang thu閏 t輓h c bi謙 c蕄 1/#lspf_zhiding_lv(1)",
		"Linh th筩h ph鑙 phng mang thu閏 t輓h c bi謙 c蕄 2/#lspf_zhiding_lv(2)",
		"Linh th筩h ph鑙 phng mang thu閏 t輓h c bi謙 c蕄 3/#lspf_zhiding_lv(3)",
		"Linh th筩h ph鑙 phng mang thu閏 t輓h c bi謙 c蕄 4/#lspf_zhiding_lv(4)",
		"Linh th筩h ph鑙 phng mang thu閏 t輓h c bi謙 c蕄 4/#lspf_zhiding_lv(5)",
		"Linh th筩h ph鑙 phng mang thu閏 t輓h c bi謙 c蕄 6/#lspf_zhiding_lv(6)",
		"tr? l筰/zhiding_main"
		}
	Say("Xin ch鋘 c蕄 thu閏 t輓h Linh th筩h ph鑙 phng ch? nh. ",
		getn(strtab),
		strtab)		
end

function lspf_zhiding_lv(nLv)
	local strtab = {
		"M穙/#lspf_zhiding_wz("..nLv..",0,0)",
		"Y ph鬰/#lspf_zhiding_wz("..nLv..",1,0)",
		"V? kh?/#lspf_zhiding_wz("..nLv..",2,0)",
		"Qu莕 /#lspf_zhiding_wz("..nLv..",3,0)",
		"tr? l筰/zhiding_peifang",
		"T筸 th阨 kh玭g i. /nothing"
		}
	Say("Xin ch鋘 v? tr? kh秏 Linh th筩h ph鑙 phng ch? nh. ",
		getn(strtab),
		strtab)	
end

function lspf_zhiding_wz(nLv,nWz,nPage)
	local tAttri = {};
	local tIdx = {}; --对应tRandNum表的索引
	for i = 22,getn(tRandNum) do --注意这里！tRandNum表的前21项属性是没有配方的！
		if tRandNum[i][3] == nWz and tRandNum[i][4] <= nLv then
			tinsert(tAttri,tRandNum[i]);
			tinsert(tIdx,i)
		end
	end
	local strtab = {};
	local nPageNum = 6;
	local nRemaid = getn(tAttri)-nPageNum*nPage;
	local nDiaNum = 6;
	if nRemaid < nDiaNum then
		nDiaNum = nRemaid;
	end
	for i = 1,nDiaNum do
		tinsert(strtab,tAttri[nPage*nPageNum+i][1].."/#confirm_lspf_zhiding("..tAttri[nPage*nPageNum+i][2]..","..nLv..","..nWz..","..tIdx[nPage*nPageNum+i]..")");
	end
	if nPage > 0 then
		tinsert(strtab,"Trang trc/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage-1)..")");
	end
	if nRemaid > 6 then
		tinsert(strtab,"Trang k?/#lspf_zhiding_wz("..nLv..","..nWz..","..(nPage+1)..")");
	end
	tinsert(strtab,"tr? l筰/#lspf_zhiding_lv("..nLv..")");
	tinsert(strtab,"T筸 th阨 kh玭g i. /nothing");
	Say("Xin ch鋘 thu閏 t輓h Linh th筩h ph鑙 phng mu鑞 i. ",
		getn(strtab),
		strtab);	
end

function confirm_lspf_zhiding(nId,nLv,nWz,nIdx)
	local tWz = {"M穙","Y ph鬰","V? kh?","Qu莕 "};
	Say("S? l莕 b筺 ti猽 hao <color=yellow>"..nLv*tRandNum[nIdx][nLv+6].."<color> l莕"..nLv.." (c蕄) Linh th筩h ph鑙 phng ng蓇 nhi猲 i th祅h <color=yellow>1"..tRandNum[nIdx][1].."<color>, v? tr? kh秏 l? 1 <color=yellow> "..tWz[nWz+1].."<color> "..nLv.." (c蕄) Linh th筩h ph鑙 phng, b筺 ch蕄 nh薾?",
		2,
		"?, ta mu鑞 i./#give_lspf_zhiding("..nId..","..nLv..","..nWz..","..nIdx..")",
		"T筸 th阨 kh玭g i. /nothing")	
end

function give_lspf_zhiding(nId,nLv,nWz,nIdx)
	local nNum = nLv*tRandNum[nIdx][nLv+6];
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i th祅h th筩h ph鑙 phng. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	local nPfid1,nPfid2,nPfid3 = 0,0,0;		
	for i=2,lingshi_pf:getRow() do
		if tonumber(lingshi_pf:getCell(i,44)) == nId and tonumber(lingshi_pf:getCell(i,45)) == nWz and tonumber(lingshi_pf:getCell(i,46)) == nLv then
			if lingshi_pf:getCell(i,43) ~= "" then
				nPfid1 = tonumber(lingshi_pf:getCell(i,41));
				nPfid2 = tonumber(lingshi_pf:getCell(i,42));
				nPfid3 = tonumber(lingshi_pf:getCell(i,43));
				break
			end
		end
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	if AddItem(nPfid1,nPfid2,nPfid3,1) == 1 then
		Msg2Player("B筺 nh薾 頲 "..nLv.."(c蕄)thu閏 t輓h Linh th筩h ph鑙 phng");
		if nLv >= 6 then
			WriteLog("Ngi ch琲"..GetName().."ti猽 hao "..nNum.." l莕 ng蓇 nhi猲, nh薾 頲 1 "..nLv.." (c蕄)thu閏 t輓h Linh th筩h ph鑙 phng");
		end
	else
		WriteLog("Ngi ch琲"..GetName().."ti猽 hao "..nNum.." l莕 ng蓇 nhi猲, nh薾 頲 1 "..nLv.." (c蕄)thu閏 t輓h Linh th筩h ph鑙 phng  th蕋 b筰! ")
	end
end

function zhiding_gaoji()
	local strtab = {
		"Ta mu鑞 i Linh th筩h ng蓇 nhi猲 c蕄 th蕄 th祅h c蕄 cao. /zhiding_lingshi_gaoji",
		"Ta mu鑞 i Linh th筩h ph鑙 phng ng蓇 nhi猲 c蕄 th蕄 th祅h c蕄 cao. /zhiding_lspf_gaoji",
		"tr? l筰/zhiding_main",
		"T筸 th阨 kh玭g i. /nothing"
		}
	Say("Ngi mu鑞 i Linh th筩h hay Linh th筩h ph鑙 phng?",
		getn(strtab),
		strtab)	
end

function zhiding_lingshi_gaoji()
	local strtab = {
		"Ta mu鑞 ti猽 hao Linh th筩h ng蓇 nhi猲 c蕄 1 i th祅h linh th筩h c蕄 2/#ls_change_high(1)",
		"Ta mu鑞 ti猽 hao Linh th筩h ng蓇 nhi猲 c蕄 2 i l蕐 Linh th筩h c蕄 3/#ls_change_high(2)",
		"Ta mu鑞 ti猽 hao Linh th筩h ng蓇 nhi猲 c蕄 3 i l蕐 Linh th筩h c蕄 4/#ls_change_high(3)",
		"Ta mu鑞 ti猽 hao Linh th筩h ng蓇 nhi猲 c蕄 4 i l蕐 Linh th筩h c蕄 5/#ls_change_high(4)",
		"tr? l筰/zhiding_gaoji",
		"T筸 th阨 kh玭g i. /nothing"
		}
	Say("Xin ch鋘 c蕄 linh th筩h mu鑞 i. (s? lng i s? x竎 nh薾 ? bc sau)",
		getn(strtab),
		strtab)		
end

function ls_change_high(nLv)
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}
	local tNum = {3,3,5,5};
	if GetTask(tLingshiTask[nLv]) < tNum[nLv] then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i");
		return
	end	
	local nCount = floor(GetTask(tLingshiTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LINGSHI_CHANGE_LV,nLv);
	AskClientForNumber("confirm_ls_change_high", 1, tonumber(nCount), "B筺 mu鑞 i bao nhi猽 "..(nLv+1).." (c蕄) Linh th筩h?");
end

function confirm_ls_change_high(nCount)
	local nLv = GetTaskTemp(TT_LINGSHI_CHANGE_LV);
	local tNum = {3,3,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("B筺 ch蕄 nh薾 ti猽 hao "..nNum.." l莕"..nLv.." (c蕄) Linh th筩h ng蓇 nhi猲  i l蕐"..nCount.." "..(nLv+1).." (c蕄) Linh th筩h?",
		3,
		"уng ?/#give_ls_change_high("..nLv..","..nNum..","..nCount..")",
		"Ch鋘 sai. Tr? v?/zhiding_lingshi_gaoji",
		"T筸 th阨 kh玭g i. /nothing")
end

function give_ls_change_high(nLv,nNum,nCount)  --消耗的等级  消耗的等级次数 兑换的等级个数
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[nLv]) < nNum then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i l蕐 lo筰  b筺 c莕. ");
		return
	end
	SetTask(tLingshiTask[nLv],GetTask(tLingshiTask[nLv])-nNum);
	SetTask(tLingshiTask[nLv+1],GetTask(tLingshiTask[nLv+1])+nCount);
	Msg2Player("B筺 nh薾 頲 "..(nLv+1).." (c蕄) Linh Th筩h"..nCount.." , b筺 c? th? t竎h l蕐 n? t? T? Linh кnh. ");	
end

function zhiding_lspf_gaoji()
	local strtab = {
		"Ta mu鑞 ti猽 hao Linh th筩h ph鑙 phng c蕄 1 ng蓇 nhi猲 i l蕐 Linh th筩h ph鑙 phng c蕄 2. /#lspf_change_high(1)",
		"Ta mu鑞 ti猽 hao Linh th筩h ph鑙 phng c蕄 2 ng蓇 nhi猲 i l蕐 Linh th筩h ph鑙 phng c蕄 3./#lspf_change_high(2)",
		"Ta mu鑞 ti猽 hao Linh th筩h ph鑙 phng c蕄 3 ng蓇 nhi猲 i l蕐 Linh th筩h ph鑙 phng c蕄 4. /#lspf_change_high(3)",
		"Ta mu鑞 ti猽 hao Linh th筩h ph鑙 phng c蕄 4 ng蓇 nhi猲 i l蕐 Linh th筩h ph鑙 phng c蕄 5. /#lspf_change_high(4)",
		"Ta mu鑞 ti猽 hao Linh th筩h ph鑙 phng c蕄 5 ng蓇 nhi猲 i l蕐 Linh th筩h ph鑙 phng c蕄 6./#lspf_change_high(5)",
		"tr? l筰/zhiding_gaoji",
		"T筸 th阨 kh玭g i. /nothing"
		}
	Say("Xin ch鋘 ng c蕄 Linh th筩h ph鑙 phng mu鑞 i! (s? lng i s? x竎 nh薾 ? bc sau)",
		getn(strtab),
		strtab)		
end

function lspf_change_high(nLv)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}
	local tNum = {3,3,5,5,5};
	if GetTask(tPeifangTask[nLv]) < tNum[nLv] then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i l蕐 Linh th筩h ph鑙 phng.");
		return
	end
	local nCount = floor(GetTask(tPeifangTask[nLv])/tNum[nLv]);
	SetTaskTemp(TT_LSPF_CHANGE_LV,nLv);
	AskClientForNumber("confirm_lspf_change_high", 1, tonumber(nCount), "B筺 mu鑞 i bao nhi猽 "..(nLv+1).." (c蕄) Linh th筩h ph鑙 phng? ");
end

function confirm_lspf_change_high(nCount)
	local nLv = GetTaskTemp(TT_LSPF_CHANGE_LV);
	local tNum = {3,3,5,5,5};
	local nNum = tNum[nLv]*nCount;
	Say("B筺 ch蕄 nh薾 ti猽 hao "..nNum.." l莕"..nLv.." (c蕄) Linh th筩h ph鑙 phng ng蓇 nhi猲 i l蕐 "..nCount.."Trng"..(nLv+1).." (c蕄) Linh th筩h ph鑙 phng? ",
		3,
		"уng ?/#give_lspf_change_high("..nLv..","..nNum..","..nCount..")",
		"Ch鋘 sai. Tr? v?/zhiding_lspf_gaoji",
		"T筸 th阨 kh玭g i. /nothing")
end

function give_lspf_change_high(nLv,nNum,nCount)
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[nLv]) < nNum then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i l蕐 Linh th筩h ph鑙 phng.");
		return
	end
	SetTask(tPeifangTask[nLv],GetTask(tPeifangTask[nLv])-nNum);
	SetTask(tPeifangTask[nLv+1],GetTask(tPeifangTask[nLv+1])+nCount);
	Msg2Player("B筺 nh薾 頲 "..(nLv+1).." (c蕄)-linh th筩h ph鑙 phng."..nCount.." , b筺 c? th? t竎h n? t? T? Linh кnh. ");	
end

function zhiding_yuehua()
	local strtab = {
		"Ta ph秈 ti猽 hao 5 l莕 Linh th筩h c蕄 5 ng蓇 nhi猲 i l蕐 Nguy謙 Hoa. /lingshi_change_yuehua",
--		"我要消耗5次5级灵石配方随机次数兑换1个天地玄黄石/lspf_change_stone",
		"tr? l筰/zhiding_main",
		"T筸 th阨 kh玭g i. /nothing"
		}
	Say("Xin ch鋘 v藅 ph萴 b筺 mu鑞 i. ",
		getn(strtab),
		strtab)	
end

function lingshi_change_yuehua()
	Say("B筺 ch蕄 nh薾 ti猽 hao 5 l莕 Linh th筩h c蕄 5 ng蓇 nhi猲 i l蕐 Nguy謙 Hoa?",
		3,
		"уng ?/confirm_lingshi_yuehua",
		"tr? l筰/zhiding_yuehua",
		"T筸 th阨 kh玭g i. /nothing")
end

function confirm_lingshi_yuehua()
	local tLingshiTask = {SYS_TSK_LINGSHI_ONE,SYS_TSK_LINGSHI_TWO,SYS_TSK_LINGSHI_THREE,SYS_TSK_LINGSHI_FOUR,
												SYS_TSK_LINGSHI_FIVE,SYS_TSK_LINGSHI_SIX,SYS_TSK_LINGSHI_SEVEN}		
	if GetTask(tLingshiTask[5]) < 5 then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i l蕐 lo筰  b筺 c莕. ");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tLingshiTask[5],GetTask(tLingshiTask[5])-5);
	if AddItem(2,1,2002,1) == 1 then
		Msg2Player(" B筺 nh薾 頲 1 Nguy謙 Hoa ");
	end		
end

function lspf_change_stone()
	Say("B筺 ch蕄 nh薾 ti猽 hao 5 l莕 Linh th筩h ph鑙 phng c蕄 5 ng蓇 nhi猲 i l蕐 1 Huy襫 Ho祅g Th筩h? ",
		3,
		"уng ?/confirm_lspf_stone",
		"tr? l筰/zhiding_yuehua",
		"T筸 th阨 kh玭g i. /nothing")
end

function confirm_lspf_stone()
	local tPeifangTask = {SYS_TSK_PEIFANG_ONE,SYS_TSK_PEIFANG_TWO,SYS_TSK_PEIFANG_THREE,SYS_TSK_PEIFANG_FOUR,
												SYS_TSK_PEIFANG_FIVE,SYS_TSK_PEIFANG_SIX,SYS_TSK_PEIFANG_SEVEN}	
	if GetTask(tPeifangTask[5]) < 5 then
		Talk(1,"","B筺 kh玭g  s? l莕 ng蓇 nhi猲  i l蕐 Linh th筩h ph鑙 phng.");
		return
	end
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	SetTask(tPeifangTask[5],GetTask(tPeifangTask[5])-5);
	if AddItem(2,1,1151,1) == 1 then
		Msg2Player("B筺 nh薾 頲 1 Huy襫 Ho祅g Th筩h ");
	end		
end

function how_change()
	Talk(1,"how_change2","Linh th筩h trong T? Linh кnh  x竎 nh thu閏 t輓h hay ch璦, t竎h ra c? th? 頲 1 thu閏 t輓h ng蓇 nhi猲. B筺 c? th? th玭g qua s? lng linh th筩h c飊g c蕄  ti猽 hao trong T? Linh кnh  ch? nh nh薾 頲 1 thu閏 t輓h linh th筩h c飊g c蕄. Ph鑙 phng ch? nh c騨g l祄 nh? v藋.")
end

function how_change2()
	Talk(1,"how_change3","B筺 c? th? linh th筩h c蕄 th蕄 trong T? Linh кnh chuy觧 h鉧 th祅h Linh th筩h c蕄 cao. V? d? cho v祇 T? Linh кnh 10 Linh th筩h c蕄 4  chuy觧 h鉧 th祅h 2 Linh th筩h c蕄 5. S? lng linh th筩h kh玭g c飊g ng c蕄 c莕  chuy觧 h鉧 c騨g kh玭g gi鑞g nhau. ")
end

function how_change3()
	Talk(1,"OnUse","Linh th筩h v? Linh th筩h ph鑙 phng trong T? Linh кnh, ngo礽 vi謈 t竎h l蕐 v? chuy觧 h鉧 ra, c遪 c? th? chuy觧 h鉧 ch髇g th祅h Nguy謙 Hoa v? Huy襫 Ho祅g Th筩h c? hi謚 qu? c bi謙. ")
end

function nothing()

end

--函数名称：物品添加检查函数
--功        能：对当前玩家可否正常添加物品进行检测
--村长 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"","<color=red>kho秐g tr鑞g<color> trong h祅h trang kh玭g !")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--判断玩家负重和空间
			Talk (1,"","<color=red>S鴆 l鵦<color> c馻 b筺 kh玭g !")
			return 0
		else 
			return 1
		end
end