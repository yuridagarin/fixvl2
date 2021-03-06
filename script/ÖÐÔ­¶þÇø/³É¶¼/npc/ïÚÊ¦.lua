
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 镖师脚本
-- Edited by joker
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua")
Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
File_name = "\\script\\中原二区\\成都\\npc\\镖师.lua"
Tasktemp_task_return = 199
CONFTASKBOSSCREATE_RATE = 20

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00()
		return
	else
		if GetTask(956) == 0 then
			Zgc_conf_task_main_dialog()
		else							--非第一次对话
			Zgc_conf_task_dialog_2()
		end
	end
	
end
---------------------------------------------公共变量定义区-----------------------------------------
Zgc_conf_task_goos_num = {						--任务收集等级为9级
	{2000,1},{4000,2},{8000,4},{12000,7},{16000,10},{20000,15},{24000,16},{28000,17},{32000,18}
}
Zgc_conf_task_boss_jies = {
	"10 n╩ trc giang h? xu蕋 hi謓 m閠 cao th? B? Phi Y猲 x璶g l? Th髖 Y猲 Ti猲 T?, ngi n祔 v? ngh? cao cng, th﹏ ph竝 uy觧 chuy觧. Sau l莕 th輈h s竧 chinh nam tng qu﹏ Li猽 qu鑓 kh玭g th祅h b鏽g nhi猲 bi謙 v? ﹎ t輓, nh璶g g莕 y nghe n鉯  xu蕋 hi謓 l筰 l? m閠 ngi ho祅 to祅 kh竎 kh玭g ai c? th? nh薾 ra, 甶襲 n祔 c騨g h琲 k? l?. \n Ng祔 m鮪g i th? th蕋 th藀 c馻 th竔 h藆 u v? kinh th祅h n閜 Sinh Th莕 Cng, c竎 ti猽 s? nh﹏ c? h閕 n祔 d? h緉 c飊g ng b鋘. ",
	"10 n╩ trc l? m閠 產o kh竎h tung ho祅h ngang d鋍, sau l筰 u Li猽 l祄 tng l躰h cho Li猽",
	"Ti觰 nh﹏ ch? bi誸 ngi n祔 l? m穘h tng c馻 Li猽 qu鑓, ngo礽 ra kh玭g bi誸 g? n鱝.",
	"Thu閏 h? B? Phi y猲",
	"Thu閏 h? B? Phi y猲",
	"Thu閏 h? B? Phi y猲",
	"Thu閏 h? B? Phi y猲",
	
}
Zgc_conf_task_coll_goods = {					--收集品ID，收集品名称，收集品分数比例，收集品选中标志，收集品选中数量
	{"玦 th?",2,0.2},
	{"R╪g s鉯",3,0.2},
	{"Th? Nhi Qu?",4,0.2},
	{"L玭g s鉯",5,0.2},
	{"No穘 tr飊g",6,0.2},
	{"Nanh heo r鮪g",7,0.2},
	{"L玭g s鉯 thng ng",8,1},
	{"V蕁 L? th筩h",9,0.2},
	{"Thi誸 Ban Ch?",10,0.2},
	{"T? hoa h礽",11,0.2},
	{"Thi猽 t鰑",12,0.2},
	{"T? ong",13,0.2},
	{"Nanh heo thng h筺g",14,1},
	{"G蕀 lam",15,0.2},
	{"H莡 Nhi Qu?",16,0.2},
	{"Thanh Kim",17,0.2},
	{"C竛h d琲",18,0.2},
	{"H? v?",19,0.2},
	{"Thi誸 Thng u",20,0.2},
	{"Bao 產o",21,0.2},
	{"Tuy誸 Tinh",22,0.2},
	{"Th鑙 C鑤",23,0.2},
	{"S璾 Th莕 K?",24,0.2},
	{"Gi竝 M閏 B礽",25,0.2},
	{"竚 Y猲",26,0.2},
	{" Ph竎h",27,0.2},
	{"Tr鴑g chim",28,0.2},
	{"B秓 B譶h",29,0.2},
	{"уng ki誱",30,0.2},
	{"M閏 Th?",31,0.2},
	{"H錸g Tinh",32,0.2},
	{"蕋 M閏 B礽",33,0.2},
	{"Quan ph鬰",34,0.2},
	{"B竛h nng",35,0.2},
	{"Gia Ph竝 b鎛g",36,0.2},
	{"Lang H錸",37,0.2},
	{"H祅g h鉧",38,0.2},
	{"D? Minh Ch﹗",39,0.2},
	{"Thng g穣",40,0.3},
	{"Kim Thoa",41,0.3},
	{"Mi課g ng",42,0.3},
	{"Th秓 h礽",43,0.3},
	{"T鰑 B玦",44,0.3},
	{"Tuy誸 Ph竎h",45,0.3},
	{"B輓h M閏 B礽",46,0.3},
	{"Thi誸 Xoa",47,0.3},
	{"玦 H? v祅g",48,1},
	{"Th莕 Ma ch?",49,0.3},
	{"Th? C鑤",50,0.3},
	{"U H錸",51,0.3},
	{"Tr穖 T鰑",52,0.3},
	{"Di T綾 Chung",53,0.3},
	{"G蕀 v祅g",54,0.3},
	{"B譶h tr?",55,0.3},
	{"C玭g V╪",56,0.3},
	{"H閜 trang s鴆",57,0.3},
	{"C竛h d琲",58,0.3},
	{"nh M閏 B礽",59,0.3},
	{"B莡 ru da d?",60,0.3},
	{"D﹜ x輈h",61,0.3},
	{"L鬰 Ph竎h",62,0.3},
	{"M鉩 C﹗",63,0.3},
	{"M藆 M閏 B礽",64,0.3},
	{"B莡 ru da d?",65,0.3},
	{"K? M閏 B礽",66,0.3},
	{"Чi T鑞g a ch?",67,0.3},
	{"Ch﹎ c鴘 ng nh﹏",68,0.3},
	{"Ho祅g Kim Ban Ch?",69,0.3},
	{"Canh M閏 B礽",70,0.3},
	{"Thi誸 B竧 Qu竔",71,0.3},
	{"蕁 Th筩h",72,0.3},
	{"nh Ba",73,0.3},
	{"Bao tay Da hu",74,0.3},
	{"M鬰 L玦 V╪ o",75,0.5},
	{"M蓇 Кn",76,0.5},
	{"T﹏ M閏 B礽",77,0.5},
	{"H飊g V╪",78,0.5},
	{"Kim X鴑g X?",79,0.5},
	{"Ki誱 H錸",80,0.5},
	{"B筩h V﹏ b玦",81,0.5},
	{"Quy Hoa K輓h",82,0.5},
	{"Nh﹎ M閏 B礽",83,0.5},
	{"H? Ph竎h",84,0.5},
	{"Qu? M閏 B礽",85,0.5},
	{"Kim Cang",86,0.5},
	{"Ng鋍 Nh? ?",87,0.5},
	{"B譶h Ng鋍",88,0.5},
	{"T? Ng璾 Cung",89,0.6},
	{"Nh蒼 H? Ph藅",90,0.6},
	{"L鬰 Tr?",91,0.7},
	{"Qu? H錸",92,1},
	{"V遪g B筩h Ng鋍",93,0.6},
	{"T? Ph藅 Ban Ch?",94,0.5},
	{"Tuy誸 Hoa Gi韎 C?",95,1},
	{"Ch? Nam Ng?",96,0.8},
	{"Thng H祅 lu薾",97,1},
	{"Kh? S琻 ch?",98,1},
	{"Huy詎 Quang",99,1},
	{"Йng L╪g",100,1},
	{"M苩 n? Thi猲 Vng",101,1},
	{"Nh﹏ у Ph?",102,1},
	{"B譶h  d辌h",103,1},
	{"H? ph?",104,1},
	{"V? Kinh T鎛g Y誹",105,1},
	{"V秠 K? L﹏",106,1},
	{"Ho祅g д N閕 Kinh",107,1},
	{"Ng鋍 Kh?",154,0.3},
	{"L玭g c竜",155,0.3},
	{"Tr鴑g B筩h 猽",156,0.3},
	{"Cung",157,0.3},
	{"M秐h b秐  Thi猲  gi竜",158,0.3},
	{"Thi猲  M藅 T輓",159,0.3},
	{"Qu竔 d? th筩h",160,0.3},
	{"Ng筩 v? c鑤",161,0.3},
	{"D穒 c鉩",162,0.3},
	{"H箃 Ch﹎",163,0.3},
	{"D? T閏 Qu秈 Li猲",164,0.5},
	{"D? T閏 b? ngoa",165,0.5},
	{"da Thng Vi猲",166,0.5},
	{"Ng﹏ H? n",167,0.5},
	{"Ng﹏ thng h醤g",168,0.5},
	{"Xi H醓 c玭",169,0.5},
	{"B筩h Ng? L﹏",170,0.5},
	{"H錸g ng? l﹏",171,0.5},
	{"D? o",172,1},
	{"V? s? 產o",173,1},
	{"V? s? y猽 i",174,1},
	{"M苩 n? V? s?",175,1},
	{"чc Phong th輈h",176,1},
	{"Gi竝 x竎 phi課",177,1},
	{"H醓 秐h Th莕 產o",178,1},
	{"Qu? u Trng",179,1},
	{"Ng筩 Ng? Nh穘 C莡",180,1},
	{"Th莕 b? ph?",181,1},
	{"Ki誱 th莕 b?",182,1},
	{"Linh Ti猽",183,1},
	{"Linh Qu?",184,1},
	{"Linh T秐",185,1},
	{"Linh C莔",186,1},
	{"Linh мch",187,1},
	{"N鋍 ong c",271,0.2},
	{"X竎 gi竝 tr飊g",272,0.2},
	{"Ch﹏ r誸",273,0.2},
	{"C竛h mu鏸",274,0.2},
	{"D辌h nh謓 c",275,0.2},
	{"M莔 Th鵦 nh﹏ th秓",276,0.2},
	{"玦 чc t輈h",277,0.3},
	{"Ch譨 kh鉧 ng",278,0.3},
	{"Ch譨 kh鉧 s総",279,0.3},
	{"Ch譨 kh鉧 b筩",280,0.3},
	{"D﹜ tua",281,0.3},
	{"Xi H醓 M藅 T輓",282,0.5},
	{"H? Ph竝 L謓h B礽",284,0.5},
	{"Huy誸 Nha v?",285,1},
	{"Huy誸 bao",286,0.5},
	{"Mao Ng璾 b?",287,0.4},
	{"Trng 產o",288,0.5},
	{"Kh╪ tay",289,0.5},
	{"Tranh ch?",290,0.5},
	{"V? nhung",291,0.6},
	{"Da h?",292,0.6},
	{"To竔 c鑤",293,0.8},
	{" dng k輓h",294,1},
	{"Чi Cang 產o",295,1},
	{"R╪g Tinh Tinh",296,1},
	{"Da voi",297,1},
	{"Thu鑓 n?",298,1},
	{"T祅 ki誱",299,1},
	{"T? n",300,1},
	{"T祅 thng",301,1},
	{"Ph? 蕁",302,1},
	{"G╪g tay",303,1},
	{"Ph藅 Kinh",304,1},
	{"У La trng",305,1},
	{"H閜 trang 甶觤",306,1},
	{"Huy誸 L﹏",307,1},
	{"H? C鑤",308,1},
	{"Ti觰 чc Nang",309,1},
	{"Hoa Ban H? 謕",310,1},
	{"Minh H醓 Ph?",311,1},
	{"Чi Thi誸 Ba",312,1},
	{"Xi H醓 蕁",313,1},
	{"B筩h L﹏",314,1},
	{"Lng kh?",315,1},
	{"To竔 th筩h",316,1},
	{"Th? b? Trng B祇",317,1},
	{"C錸",318,1},
	{"C竛h Ph鬾g Ho祅g",319,1},
	{"Xi H醓 Trng 蕁",320,1},
	{"Xi H醓 Th竛h 蕁",321,1},
	{"C竛h A Tu La",322,1},
	{"u l﹗ Ma H? La Ca",323,5},
	{"祅 Th鮝  th? th?",324,5},
	{"Nh蕋 Dng Ch? T祅 chng 1",325,5},
	{"B輈h Ng鋍 gi韎 ch?",326,5},
	{"D﹜ th衟",327,1},
	{"Tr祅g h箃",328,1},
	{"u l﹗ Kh萵 Na La",329,5},
	{"Чi Tu Vi猲 K輓h",330,1},
	{"Nh蕋 Dng Ch? T祅 chng 2",331,5},
	{"T? c鑤",1089,1},
	{"Di謓 Sa",1400,1},
	{"Ru T﹜ Ph鬾g",1401,1},
	{"Phng t醓",1402,1},
	{"Л阯g tam th竔",1403,1},
	{"Da H醓 H?",1404,1},
	{"Ng﹏ ch﹎",1405,1},
	{"Kh鉯 m?",1406,1},
	{"Thanh Long V╪ K輓h",1407,1},
	{"B筩h H? v╪ k輓h",1408,1},
	{"Lng kh?",1409,1},
	{"Ma ph? t竛",1410,1},
	{"Nh藅 qu?",1411,1},
	{"Li謙 n? ca",1412,1},
	{"Y猲 thng",1413,1},
	{"Ru h? l?",1414,1},
	{"Ng? th筩h t竛",1415,1},
	{"Ly Tr飊g L﹏ Phi課",1416,1},
	{"X骳 x綾",1417,1},
	{"C﹜ n課",1418,1},
	{"Huy襫 V? v╪ k輓h",1419,1},
	{"Chu Tc v╪ k輓h",1420,1},
	{"L謓h b礽 d騨g s?",1421,1},
	{"R? c﹜ ng祅 n╩",1422,1},
	{"Nghi猲 m鵦",1423,1},
	{"B筩h c鑤 phi課",1177,1},
	{"u C? L﹗",1178,1},
}
Zgc_conf_task_goods_need = {50,90,140,200,400}
-------------------------------------------------功能函数区----------------------------------------------
--***********************帮会任务NPC对话主函数***********************
function Zgc_conf_task_main_dialog()				
	Say("10 n╩ trc giang h? xu蕋 hi謓 m閠 cao th? B? Phi Y猲 x璶g l? Th髖 Y猲 Ti猲 T?, ngi n祔 v? ngh? cao cng, th﹏ ph竝 uy觧 chuy觧. Sau l莕 th輈h s竧 chinh nam tng qu﹏ Li猽 qu鑓 kh玭g th祅h b鏽g nhi猲 bi謙 v? ﹎ t輓, nh璶g g莕 y nghe n鉯  xu蕋 hi謓 l筰 l? m閠 ngi ho祅 to祅 kh竎 kh玭g ai c? th? nh薾 ra, 甶襲 n祔 c騨g h琲 k? l?. Qu? bang v? V? L﹎ c? th? t譵 ra 頲 nguy猲 nh﹏ th? n祇.",
		2,
		"Nh璶g ta ch璦 t鮪g nghe qua ngi n祔, ph秈 l祄 th? n祇 y?/Zgc_conf_task_dialog_1",
		"Ta c騨g kh玭g c? h鴑g th? v韎 con ngi n祔, th玦 b? 甶!/Zgc_end_dialog"
	)
	if GetTask(956) == 0 then
		SetTask(956,1)
	end
end
--*************************
function Zgc_conf_task_dialog_1()
	Say("Theo ta 頲 bi誸, l? m鮪g i th? th蕋 th藀 c馻 th竔 h藆 c竎 qu薾, ch﹗ u ph秈 mang Sinh Th莕 Cng v? kinh th祅h, 琻g nhi猲 l? B? Phi Y猲 s? kh玭g b? l? c? h閕 n祔. Ta mu鑞 l祄 gi? Sinh Th莕 Cng  d? h緉 v? ng b鋘 c馻 h緉. Ngi mau thu x誴 nh?!",
		1,	
		"Ta bi誸 r錳/Zgc_end_dialog"
	)
end
--***************************非第一次对话函数************************
function Zgc_conf_task_dialog_2()
	Say("B? l? khinh doanh th? th薽 khan, phi ti猲 c ki課 d? h穘 nham. Y猲 vi v? nhi評 th﹏ b蕋 hi謓, hoa l筩 ng璶g huy誸 th? Phi Y猲. B礽 th? n祔 10 n╩ trc do B? Phi Y猲 vi誸, n誹 kh玭g nhanh ch鉵g ti猽 tr? e r籲g thi猲 h? s? i lo筺!",
		7,
		"Ta mu鑞 t譵 hi觰 nhi謒 v? n祔/Zgc_conf_task_content",
		"Ta mu鑞 t譵 hi觰 con ngi B? Phi Y猲/Zgc_conf_task_boss_con",
		"Ta mu鑞 xem ti課  c馻 bang h閕/Zgc_conf_task_step_inq",
		"Ta mu鑞 n閜 v藅 ph萴/Zgc_conf_taskgoods_turnin",
		--"我想了解其他帮派的动静/Zgc_conf_task_fini_list",
		"Bang ph竔 c馻 ta mu鑞 nh薾 nhi謒 v? n祔 (bang ch?, ph? bang ch?, trng l穙 u c? th? ti誴 nh薾)/Zgc_conf_task_get",
		"Bang ph竔 c馻 ta mu鑞 nh薾 ph莕 thng nhi謒 v? (bang ch? nh薾)/Zgc_conf_task_pay",
		"Ta c? vi謈 r錳/Zgc_end_dialog"
	)
end
--***************************任务介绍********************************
function Zgc_conf_task_content()
	Talk(2, "", 
		"Nhi謒 v? n祔 2 ng祔 1 l莕, do bang ch?, ph? bang ch? ho芻 trng l穙 n Th祅h Й g苝 ti猽 s?  nh薾 nhi謒 v? bang h閕 <color=red>(Nhi謒 v? ph﹏ th祅h 9 c蕄, c蕄 c祅g cao s? nh薾 頲 c祅g nhi襲 Sinh Th莕 Cang, 琻g nhi猲 v藅 ph萴 thu th藀 c騨g ph秈 c祅g nhi襲)<color>, sau  bang ch髇g n g苝 Ti猽 s? ? Th祅h Й  nh薾 v藅 ph萴.",
		"<color=red>Bang ch髇g c蕄 50 tr? l猲 gi韎 h筺 giao 400 l莕 cho m鏸 v遪g (di c蕄 50 s? l莕 s? gi秏 d莕) <color>. Bang ch?, Ph? bang ch? ho芻 Trng l穙 c? th? n nh薾 Sinh Th莕 Cang  d? B? Phi Y猲 v? ng b鋘 c馻 h緉. N閕 trong 2 ng祔 t蕋 c? bang ph竔 kh玭g n閜  v藅 ph萴 thu th藀 nhi謒 v? l藀 t鴆 ph秈 d鮪g l筰 v? l祄 l筰 t? u."
	)
end
--***************************人物介绍*********************************
function Zgc_conf_task_boss_con()
	Say("B? Phi Y猲 con ngi n祔 ta c騨g ch? bi誸 c? v藋, c竎 ngi t譵 hi觰 th猰.",
		8,
		"Ta mu鑞 t譵 hi觰: B? Phi Y猲/#Zgc_conf_task_boss(1)",
		"Ta mu鑞 t譵 hi觰: H? C秐h Th緉g/#Zgc_conf_task_boss(2)",
		"Ta mu鑞 t譵 hi觰: Nhi誴 Чi Ch飝/#Zgc_conf_task_boss(3)",
		"Ta mu鑞 t譵 hi觰: C玭 Lu﹏ N?/#Zgc_conf_task_boss(4)",
		"Ta mu鑞 t譵 hi觰: Linh H祅g/#Zgc_conf_task_boss(5)",
		"Ta mu鑞 t譵 hi觰: Li評 Ngh?/#Zgc_conf_task_boss(6)",
		"Ta mu鑞 t譵 hi觰: H錸g Tuy課/#Zgc_conf_task_boss(7)",
		"Ta bi誸 r錳/Zgc_end_dialog"
	)	
end
function Zgc_conf_task_boss(boss_seq)
	Say("<color=green>Ti猽 S?<color>:"..Zgc_conf_task_boss_jies[boss_seq],
		3,
		" Thao t竎 kh竎/Zgc_conf_task_dialog_2",
		"T譵 hi觰 tin t鴆 BOSS kh竎/Zgc_conf_task_boss_con",
		"Ta bi誸 r錳/Zgc_end_dialog"
	)
end
--****************************排行榜**********************************
function Zgc_conf_task_fini_list()
	
end
--***************************帮会任务进度查询*************************
function Zgc_conf_task_step_inq()
	if IsTongMember() == 0 then
		Say("Ngi v蒼 ch璦 gia nh藀 bang h閕 ??",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
		return
	end
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackStepInq")
end
--**************************帮会任务进度查询回调**********************
function CallBackStepInq(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
	if tong_level_max == nil or tong_level_max <= 0 then
		ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
		return
	end
	--结束--
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	local dialog_date_now = ""					--本轮任务结束时间
	local dialog_date_next =""					--下轮任务开始时间
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date_now = "24h t鑙 nay "
		dialog_date_next = "24h t鑙 mai "
	else
		dialog_date_now = "24h t鑙 mai "
		dialog_date_next = "24h t鑙 m鑤 "
	end
	if tong_state == 1 then
		Say("Qu? bang v蒼 ch璦 nh薾 chu鏸 nhi謒 v? n祔, chu鏸 nhi謒 v? n祔 n <color=yellow>"..dialog_date_now.."<color> k誸 th骳.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)		
	elseif tong_state == 2 then
		Say("Qu? bang  nh薾 nhi謒 v?, t譶h h譶h thu th藀 v? giao n閜 v藅 ph萴 l?:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..", chu鏸 nhi謒 v? n祔 n"..dialog_date_now.."k誸 th骳",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	elseif tong_state == 3 then
		Say("Nhi謒 v? l莕 n祔 c馻 qu? bang  ho祅 th祅h, bang ch? c? th? n nh薾 ph莕 thng.",
			2,
			"Ta mu鑞 nh薾 ph莕 thng/Zgc_conf_task_pay",
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("Nhi謒 v?  ho祅 th祅h v? ph莕 thng c騨g  nh薾. Xin h穣 l祄 chu鏸 nhi謒 v? ti誴 theo, chu鏸 nhi謒 v? ti誴 theo n <color=yellow>"..dialog_date_now.."<color> b総 u.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	end
end
--*************************帮会任务接受函数***************************
function Zgc_conf_task_get()
	if IsTongMember() == 0 then 																--判断是否入帮
		Say("B? Phi Y猲 kh玭g ph秈 l? ngi b譶h thng. Ngi mau gia nh藀 bang h閕, b秓 bang ch? n g苝 ta ngh? c竎h i ph? v韎 B? Phi Y猲!",
			1,
			"Gia nh藀 bang h閕 r錳 sau h穣 n鉯/Zgc_end_dialog"
		)
	elseif IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() ==3 then				--判断帮会职务
		ApplyRelayShareData(GetTongName(),0,0,File_name,"ConfTaskGetCallBack")
	else
		Say("Chuy謓 n祔 kh? quan tr鋘g! H穣 g鋓 bang ch?, ph? bang ch? ho芻 trng l穙 n nh薾 nhi謒 v?.",
			1,
			"Ta s? quay l筰 sau!/Zgc_end_dialog"
		)		
	end
end
--*****************************任务接受数据存储回调************************
function ConfTaskGetCallBack(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--结束--
	local tong_ID_save = Zgc_conf_task_time_return()
	if tong_ID == tong_ID_save then
		Say("Qu? bang  nh薾 m閠 ph莕 chu鏸 nhi謒 v?, xin ki觤 tra l筰 ti課  ho祅 th祅h.",
			2,
			"Ta mu鑞 xem ti課  c馻 bang h閕/Zgc_conf_task_step_inq",
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	elseif tong_ID ~= tong_ID_save and tong_state == 3 then
		Say("Qu? bang  ho祅 th祅h nhi謒 v? nh璶g ch璦 nh薾 ph莕 thng, xin h穣 nh薾 ph莕 thng!",
			2,
			"Ta mu鑞 nh薾 Sinh Th莕 Cang/Zgc_conf_task_pay",
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	else
		if tong_state == 2 and tong_num < Zgc_conf_task_goos_num[tong_level][1] then
			if tong_level_max > 1 then
				tong_level_max = tong_level_max - 1
				SendTongMessage("Do ch璦 ho祅 th祅h nhi謒 v? B? Phi Y猲 l莕 trc n猲 ng c蕄 nhi謒 v? s? b? gi秏 1 c蕄")
			end
		end
		if tong_level_max == nil or tong_level_max <= 0 then
			tong_level_max = 1
		end
		local dialog = {}
		for i = 1, tong_level_max do
			dialog[i] = "th?"..i.." c蕄, c莕 "..Zgc_conf_task_goos_num[i][1].." thu th藀 v藅 ph萴, c? th? i "..Zgc_conf_task_goos_num[i][2].." ph莕 thng/#Zgc_conf_task_accept("..i..","..tong_level_max..")"
		end
			dialog[tong_level_max + 1] = "Ta v蒼 ch璦 hi觰/Zgc_end_dialog"
		Say("Xin ch鋘 ng c蕄 nhi謒 v? mu鑞 ti誴 nh薾!:",
			getn(dialog),dialog
		)		
	end
end
--******************************任务接受****************************
function Zgc_conf_task_accept(task_level,level_max)
	local tong_ID = Zgc_conf_task_time_return()
	local tong_level = task_level
	local tong_num = 0											--新接任务，交纳收集品为0
	local tong_state = 2
	local tong_level_max = level_max
	if tong_level_max > getn(Zgc_conf_task_goos_num) then
		tong_level_max = getn(Zgc_conf_task_goos_num)
	end	
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Msg2Player("Bang h閕 c馻 ngi  nh薾 nhi謒 v? c蕄"..task_level.."!")
	SendTongMessage(GetName().."Х nh薾 "..task_level.." (c蕄) nhi謒 v?, th祅h vi猲 trong bang c? th? n ti猽 s?  giao v藅 ph萴")
	WriteLogEx(strLogCaption, "nh薾 nhi謒 v? Bang h閕", "", "", "", GetTongName())
end
--*************************帮会任务物品收集函数***********************
function Zgc_conf_taskgoods_turnin()
	local cent_num_save = Zgc_conf_task_cent_date(0,956)
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	if GetLevel() < 77 then
		Say("Ngi ch璦  n╪g l鵦, c? g緉g luy謓 th猰 n鱝 nh?!",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	return
	end
	if IsTongMember() == 0 then
		Say("B? Phi Y猲 kh玭g ph秈 l? ngi b譶h thng. Ngi mau gia nh藀 bang h閕, b秓 bang ch? n g苝 ta ngh? c竎h i ph? v韎 B? Phi Y猲!",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
		return
	elseif task_id_save == Zgc_conf_task_time_return() and (Zgc_conf_task_num_max() - cent_num_save)<=0 then
			local dialog = ""
			if Zgc_conf_task_dist_date() == 1 then
				dialog = "Ng祔 mai"
			else
				dialog = "Ng祔 m鑤"
			end
			Say("觤 c鑞g hi課 c馻 ngi hi謓 l?:"..Zgc_conf_task_num_max()..","..dialog.."Th? n鱝 甶!",
				1,
				"Ta bi誸 r錳/Zgc_end_dialog"
			)
			return
	else
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGoodsin")
	end
end
function CallBackGoodsin(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--结束--
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	if tong_state == 2 then																--该帮派已经领取任务，但是收集物品数量不足
		local cent_remain = 0
		if task_id_save ~= Zgc_conf_task_time_return() then								--先判断个人的收集品缴纳情况
			cent_remain = Zgc_conf_task_num_max()
		else
			cent_remain = Zgc_conf_task_num_max() - goods_num_save
		end
		Say("Qu? bang  nh薾 nhi謒 v?, 甶觤 t輈h l騳 hi謓 l?:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..". Ъng c蕄 hi謓 t筰 c? th? thu th藀 v藅 ph萴 c鑞g hi課 cho bang h閕."..Zgc_conf_task_num_max().."甶觤 t輈h l騳, tr? 甶觤 t輈h l騳 h玬 nay:"..cent_remain..". \n <color=red>Ta c騨g kh玭g th? qu秐 頲 h祅h trang c馻 ngi, v藅 ph萴 n祇 d飊g 頲 ngi t? c蕋 v祇 rng nh?!<color>",
				2,
				"Ta c莕 giao v藅 ph萴/Zgc_task_goods_inconf",
				"Quay l筰 sau nh?/Zgc_end_dialog"
			)
	elseif tong_state == 3 then
		Say("Nhi謒 v? n祔  ho祅 th祅h. Bang ch?, ph? bang ch?, trng l穙 u c? th? n nh薾 ph莕 thng.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("Qu? bang  ho祅 th祅h nhi謒 v? v? nh薾 ph莕 thng, xin i v遪g nhi謒 v? sau.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	else
		Say("Qu? bang v蒼 ch璦 nh薾 nhi謒 v? l莕 n祔.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)			
	end
end
--*****************************物品收集确认***************************
function Zgc_task_goods_inconf()
	Say("Trong h祅h trang c馻 ngi kh玭g c? v藅 ph萴 n祇 quan trong  ch?!",
		2,
		"Ta mu鑞 giao v藅 ph萴/Zgc_task_goods_change",
		"в ta s緋 x誴 l筰 h祅h trang/Zgc_end_dialog"
	)
end
--*****************************收集处理函数***************************
function Zgc_task_goods_change()															--收集品的计算和扣除
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 200 then
		Say("H祅h trang kh玭g  ? tr鑞g ho芻  n苙g, h穣 s緋 x誴 l筰.",0)
		return
	end
	local cent_count = 0
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	local cent_remain = 0
	if task_id_save ~= Zgc_conf_task_time_return() then								--先判断个人的收集品缴纳情况
		cent_remain = Zgc_conf_task_num_max()
	else
		cent_remain = Zgc_conf_task_num_max() - goods_num_save
	end
	for i = 1,getn(Zgc_conf_task_coll_goods) do
		if cent_remain > 0 then
			local goods_num = GetItemCount(2,1,Zgc_conf_task_coll_goods[i][2])						--物品数量
			local goods_cent = floor(goods_num * Zgc_conf_task_coll_goods[i][3])					--物品可兑换积分
			if  goods_num > 0 and goods_cent > 0 then										
				if goods_cent >= cent_remain then													--物品收集是否到达400上限
					local needs_num = floor(goods_num *cent_remain/goods_cent)
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],needs_num)		--删除收集品
					if remove_flag == 0 then														
						break																		--删除失败退出
					else
						cent_count = cent_count + cent_remain
						local nRnd = random(1,100)
						if nRnd <= CONFTASKBOSSCREATE_RATE and IsTongMember() >= 1 and IsTongMember() <= 5 and GetLevel() >= 50 then
							local add_flag = AddItem(2,0,545,1)
							if add_flag ~= 0 then
								Msg2Player("B筺 nh薾 頲 1 Sinh Th莕 Cang.")
								SendTongMessage(GetName().."Nh薾 ph莕 thng nhi謒 v? B? Phi Y猲: 1 c竔 Sinh Th莕 Cang")
								WriteLogEx(strLogCaption, " nh薾 1 Sinh Th莕 Cang", "", GetTongName())
							end
						end												
					end
					local dialog_date = ""
					if Zgc_conf_task_dist_date() ==  1 then
						dialog_date = "Ng祔 mai"
					else
						dialog_date = "Ng祔 m鑤"
					end
					Say("Chu鏸 nhi謒 v? n祔 ngi  giao  v藅 ph萴,"..dialog_date.."Th? n鱝 甶!",
						1,
						"Ta bi誸 r錳/Zgc_end_dialog"
					)
					break
				else
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],goods_num)		--删除收集品
					if remove_flag == 0 then
						break
					else
						cent_count = cent_count + goods_cent
						cent_remain = cent_remain - goods_cent										--将可提交的收集品积分减少
					end
				end
			end
		end
	end																								--删除玩家收集品结束
	if cent_count == 0 then
		Say("Ngay c? v藅 ph萴 nhi謒 v? m? ngi c騨g kh玭g c?, th藅 m蕋 th阨 gian c馻 ta!",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	else
		Msg2Player("V藅 ph萴 c馻 ngi  c鑞g hi課 cho bang h閕"..cent_count.."甶觤 t輈h l騳!")
		SetTaskTemp(157,cent_count)																	--本次上交的信息放入临时变量
		local goods_cent_total = 0
		if Zgc_conf_task_cent_date(1,956) == Zgc_conf_task_time_return() then						--本轮已经提交过的处理
			goods_cent_total = Zgc_conf_task_cent_date(0,956) + cent_count
			goods_cent_total = (goods_cent_total * 10000) + Zgc_conf_task_time_return()
		else																						--将近三轮的信息依次压入
			SetTask(958,GetTask(957))
			SetTask(957,GetTask(956))
			goods_cent_total = (cent_count * 10000) + Zgc_conf_task_time_return()
		end
		SetTask(956,goods_cent_total)
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackConfDeal")
	end
end
--*************************玩家提交收集品的帮会处理********************
function CallBackConfDeal(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	local player_goods_num = GetTaskTemp(157)
	local dialog_date = ""
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date = "24h t鑙 nay "
	else
		dialog_date = "24h t鑙 mai "
	end
	local need_num = ""
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) then
		need_num ="  ho祅 th祅h."
	else
		need_num = "C遪 thi誹 "..(Zgc_conf_task_goos_num[tong_level][1] - tong_num - player_goods_num).."甶觤 t輈h l騳."	
	end
	local money_prize = task_money_prize(player_goods_num)
	if money_prize ~= 0 then				---金钱增加
		Earn(money_prize)
		WriteLogEx(strLogCaption, "nh薾", money_prize, "ti襫 v祅g", "", GetTongName())
	end
	SendTongMessage(GetName().."Ho祅 th祅h nhi謒 v? B? Phi Y猲"..player_goods_num.."甶觤 t輈h l騳!")
	SendTongMessage("Chu鏸 nhi謒 v? n祔 n:"..dialog_date.." k誸 th骳, qu? bang hi謓  ho祅 th祅h "..need_num)
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) and tong_state == 2 then
		SendTongMessage("Qu? bang  ho祅 th祅h thu薾 l頸 nhi謒 v? S? m? ho芻 c馻 B? Phi Y猲, bang ch? n g苝 Ti猽 s? ? Th祅h Й nh薾 thng!")
		if tong_level_max < getn(Zgc_conf_task_goos_num) then
			tong_level_max = tong_level_max + 1
			SendTongMessage("Qu? bang  ho祅 th祅h nh謒 v? B? Phi Y猲, c? th? nh薾"..tong_level_max.."!!")
		end
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],3,tong_level_max)
	else
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	end
	SetTaskTemp(157,0)
	SaveNow()
end
--**************************帮会任务数据转移************************
function CallBackDataRepair(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,GetTongName())
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if tong_level_max == nil or tong_level_max <= 0 then
		tong_ID = 0
		tong_level = 0
		tong_num = 0
		tong_state = 0
		tong_level_max = 6
	end
	if tong_level_max >= 3 then
		WriteLog("Ph鬰 h錳 s? l莕 nhi謒 v? bang h閕 th祅h c玭g, t猲 nh﹏ v藅:["..GetName().."] T猲 bang h閕: ["..GetTongName().."]")
	end
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Say("Ngi t譵 ta c? vi謈 g? kh玭g?",
		7,
		"Ta mu鑞 t譵 hi觰 nhi謒 v? n祔/Zgc_conf_task_content",
		"Ta mu鑞 t譵 hi觰 con ngi B? Phi Y猲/Zgc_conf_task_boss_con",
		"Ta mu鑞 xem ti課  c馻 bang h閕/Zgc_conf_task_step_inq",
		"Ta mu鑞 n閜 v藅 ph萴/Zgc_conf_taskgoods_turnin",
		--"我想了解其他帮派的动静/Zgc_conf_task_fini_list",
		"Bang ph竔 c馻 ta mu鑞 nh薾 nhi謒 v? n祔 (bang ch?, ph? bang ch?, trng l穙 u c? th? ti誴 nh薾)/Zgc_conf_task_get",
		"Bang ph竔 c馻 ta mu鑞 nh薾 ph莕 thng nhi謒 v? (bang ch? nh薾)/Zgc_conf_task_pay",
		"Ta c? vi謈 r錳/Zgc_end_dialog"
	)
end
--*****************************金钱计算***************************
function task_money_prize(cent)
	local money_prize = {2000,4000,7500,12000}
	local player_level = GetLevel()
	local money_num = 0
	if player_level <= 30 then
		money_num = floor(sqrt(player_level) * money_prize[1] * cent/400)
	elseif player_level <= 50 then
		money_num = floor(sqrt(player_level) * money_prize[2] * cent/400)
	elseif player_level <= 70 then
		money_num = floor(sqrt(player_level) * money_prize[3] * cent/400)
	else
		money_num = floor(sqrt(player_level) * money_prize[4] * cent/400)
	end
	return money_num
end
--*************************帮会奖励给予函数****************************
function Zgc_conf_task_pay()
	--0为从未领取任务，1为领取过任务，2领取了任务尚未完成，3为领取任务且已经完成但是没有领取奖励，4为完成且已经领取奖励。
	if IsTongMember() == 0 then
		Say("Ngi mu鑞 gia nh藀 m玭 ph竔.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
		return
	elseif IsTongMember() ~= 1 then
		Say("Ngi kh玭g c? quy襫 nh薾 ph莕 thng c馻 bang h閕!",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog")
	else
		SetTaskTemp(Tasktemp_task_return,Zgc_conf_task_time_return())
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackPrizeGet")
	end
end
--****************************帮会奖励给予调用函数*********************
function CallBackPrizeGet(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--数据整理判断--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--结束--
	if tong_state == 2 then																--该帮派已经领取任务，但是收集物品数量不足
		if tong_ID == Zgc_conf_task_time_return() then
			Say("Qu? bang  nh薾 nhi謒 v? nh璶g ch璦 ho祅 th祅h kh玭g th? nh薾 ph莕 thng. Xin ki觤 tra l筰 ti課  ho祅 th祅h",
				2,
				"Ta mu鑞 xem ti課  c馻 bang h閕/Zgc_conf_task_step_inq",
				"Ta bi誸 r錳/Zgc_end_dialog"
			)
		else
			Say("Qu? bang ch璦 nh薾 nhi謒 v? sao l筰 l躰h thng?",
				1,
				"Ta bi誸 r錳/Zgc_end_dialog"
			)
		end
	elseif tong_state == 1 or tong_state == 0 or tong_state == nil then
		Say("Qu? bang v蒼 ch璦 nh薾 nhi謒 v? l莕 n祔.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)			
	elseif tong_state == 3 then
		local box_num = Zgc_conf_task_goos_num[tong_level][2]
		if GetFreeItemRoom() < (floor(box_num/10) + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < box_num then									--=========================在此加入负重和空格数的判断
			Say ("Huynh  n祔, s緋 x誴 l筰 h祅h l? r錳 h穣 quay l筰 nh?!",
				1,
				"Ta bi誸 r錳!/Zgc_dialog_end"
			)
		else
			if GetTaskTemp(Tasktemp_task_return) ~= Zgc_conf_task_time_return() then
				return
			else
				SetTaskTemp(Tasktemp_task_return,(GetTask(Tasktemp_task_return)-1))
				local add_flag = AddItem(2,0,545,box_num)				--test
				if add_flag ~= 0 then
					Msg2Player("Nhi謒 v? l莕 n祔 b筺 nh薾"..box_num..", Sinh Th莕 Cang.")
					SendTongMessage(GetName().."Nh薾 ph莕 thng nhi謒 v? B? Phi Y猲: Sinh Th莕 Cang"..box_num.."c竔")
				WriteLogEx(strLogCaption, "nh薾", box_num, "Sinh Th莕 Cang", "", GetTongName())
				else
				WriteLogEx(strLogCaption, "", "", "", "", GetTongName(), "i ph莕 thng: Sinh Th莕 Cang th蕋 b筰! Tr? ph秐 h錳:"..add_flag)
				end
				AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],4,tong_level_max)
			end
		end
	elseif tong_state == 4 then
		Say("Qu? bang  ho祅 th祅h nhi謒 v? v? nh薾 ph莕 thng, xin i v遪g nhi謒 v? sau.",
			1,
			"Ta bi誸 r錳/Zgc_end_dialog"
		)
	end
end
--***************************对话结束（为空）**************************
function Zgc_end_dialog()
	
end
--***************************回调（为空）**************************
function cb()

end
--**************************轮次计算函数*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 61200)/(172800))
	return time_return
end
--**************************数量和日期分装函数*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************下一轮时间计算*****************************
function Zgc_conf_task_dist_date()
	local date_tomorrow = floor((GetTime() + 25200)/(172800))
	if Zgc_conf_task_time_return() == date_tomorrow then
		return 2
	else
		return 1
	end
end
--*************************可收取收集品上限计算函数**********************
function Zgc_conf_task_num_max()
	local ruturn_num = 0
	if GetLevel() > 50 then
		ruturn_num = 400
	else
		local num_seq = floor(GetLevel()/10)
		ruturn_num = Zgc_conf_task_goods_need[num_seq]
	end
	return ruturn_num
end
