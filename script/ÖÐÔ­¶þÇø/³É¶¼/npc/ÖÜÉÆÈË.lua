--脚本名称：周善人.lua
--脚本功能：周善人对话脚本。以前包含赈灾任务的功能，现在加上帮会攻城战_推荐信任务的功能
--策划人：侯盾
--代码开发人：村长
--代码开发时间：2007年3月30号
--代码修改记录：

Include("\\script\\task\\faction\\faction_main_em.lua");
Include("\\script\\online\\abluemoon\\abluemoon_item2exp.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\lib\\writelog.lua");
temp_taskID_merterial_count = 166
temp_taskID_merterial_count_conf = 167
File_name = "\\script\\中原二区\\成都\\npc\\周善人.lua"

function main ()

local nTaskValue = FN_GetTaskState(FN_EM);

	if (nTaskValue==1) then

		task_003();
		return

	elseif (nTaskValue==2) then

		if (GetTask(EM_MANTALK_01)==1) and (GetTask(EM_MANTALK_02)==1) and (GetTask(EM_MANTALK_03)==1) and (GetTask(EM_MANTALK_04)==1) then
			task_008();
			return
		else
			Talk(1,"","Ta mu鑞 ph竧 ti襫  c鴘 t? nh璶g b鋘 gia nh﹏ th? b薾 gi髉 n蕌 ch竜. Phi襫 c? nng n th玭g b竜 cho N筺 d﹏ bi誸, b秓 h? n nh薾 c鴘 t?.");
			return
		end
	elseif (nTaskValue==4) then

		task_011();
		return

	end


	UWorld1506 = GetTask(1506)
	if ( UWorld1506 == 0 and  GetLevel() > 1 )  then
		Say("G莕 y Th祅h Й ph? sao l筰 c? nhi襲 n筺 d﹏, nh譶 h? th藅 ng thng! Ta quy誸 nh ph竧 ti襫 c鴘 t?, kh玭g bi誸 b籲g h鱱 c? th? gi髉 ?",2,"уng ?/yes1506","Ta c遪 ch髏 vi謈/no1506")
	elseif ( UWorld1506  == 5 )  then
		Talk(1,"","Nh? b籲g h鱱 chuy觧 tin g蕄, c鴘 ngi nh? c鴘 h醓.")
	elseif ( UWorld1506  == 9 )  then
		Talk(1,"","Ta thay m苩 n筺 d﹏ 產 t? b籲g h鱱! Зy l? m閠 ch髏 l? m鋘.")
		SetTask(1506,10)
		--AddItem(2,1,1,1)
		Earn(200)
		ModifyExp(150)
		ModifyReputation(3,0)
		--AddNote("帮周善人救济难民的任务完成")
		TaskTip("Ho祅 th祅h nhi謒 v? gi髉 Chu Thi謓 Nh﹏ c鴘 t? n筺 d﹏")
	else
--		Talk(1,"","<color=green>周善人<color>：毋以恶小而为之，毋以善小而不为。")
--		item_to_exp()  --用粮食换经验
		confwar_task_goods_main()		-- 大宋需要你
	end
end;

function yes1506()
	Talk(1,"","Ta mu鑞 ph竧 ti襫  c鴘 t? nh璶g b鋘 gia nh﹏ th? b薾 gi髉 n蕌 ch竜. Phi襫 b籲g h鱱 n th玭g b竜 cho N筺 d﹏ ? c鎛g th祅h bi誸, b秓 h? n nh薾 c鴘 t?.")
	Talk(1,"","T筰 h? ngh? n猲 g鉷 ch髏 s鴆 m鋘.")
	SetTask(1506,5)
	--AddNote("接到帮周善人赈济难民的任务。")
	TaskTip("Nh薾 nhi謒 v? gi髉 Chu Thi謓 Nh﹏ c鴘 t? n筺 d﹏")
end;
function no1506()
	Talk(1,"","N誹 b籲g h鱱  th蕐 kh? th? c騨g kh玭g n猲 l祄 kh? ngi kh竎! ")
--	item_to_exp()  --用粮食换经验
end;
--============================村长2007年3月30日加入帮会攻城战_推荐信任务相关=====================
tb_life_merterial = {}		--可以上交的材料列表
tb_life_merterial[1] = {
	{"X? hng",	1,	2,	4,	1.0},
	{"Xuy猲 s琻 gi竝",	1,	2,	11,	0.9},
	{"襫 th蕋",	1,	2,	10,	0.8},
	{"X竎 ve",	1,	2,	9,	0.8},
	{"Ho祅g li猲",	1,	2,	3,	0.5},
	{"C竧 C竛h",	1,	2,	2,	0.5},
	{"T祅g H錸g Hoa",	1,	2,	1,	0.5},
	{"Ba u",	1,	2,	8,	0.5}
}
tb_life_merterial[2] = {
	{"Du long t骳",	1,	3,	16,	1.5},
	{"Thu莕 h遖 m筩h",	1,	3,	15,	1.3},
	{"Di猲 Tinh m筩h",	1,	3,	14,	1.2},
	{"M輆",	1,	3,	13,	1.2},
	{"H? ti猽",	1,	3,	22,	0.8},
	{"Dung tr筩h c鑓",	1,	3,	12,	0.8},
	{"M╪g",	1,	3,	21,	0.8},
	{"Nhi評 minh u",	1,	3,	11,	0.8},
	{"Th筩h khu萵",	1,	3,	20,	0.8},
	{"Khuynh ly u",	1,	3,	10,	0.8},
	{"M閏 nh?",	1,	3,	19,	0.8},
	{"Quang Th玭g Ma",	1,	3,	9,	0.8}
}
tb_life_merterial[3] = {
	{"H綾 ? th筩h",	2,	2,	37,	1.3},
	{"Thi猲 thanh th筩h",	2,	2,	36,	1.3},
	{"Huy襫 thi誸",	2,	2,	6,	1.2},
	{"Th竔 b筩h tinh kim",2,	2,	5,	1},
	{"H祅 thi誸",	2,	2,	4,	1},
	{"? kim th筩h",	2,	8,	5,	1},
	{"B竎h Luy謓 Cng",	2,	2,	2,	1},
	{"Tinh Thi誸",	2,	2,	1,	1}
}
tb_life_merterial[4] = {
	{"Thi誸 Tuy課 M閏",	2,	2,	11,	1.3},
	{"Thi誸 Chng M閏",	2,	2,	10,	1.3},
	{"Tr飊g M閏",	2,	2,	9,	1.2},
	{"Ng? ng",	2,	2,	45,	1},
	{"Thi誸 M閏",	2,	2,	44,	1},
	{"Sam m閏",	2,	2,	43,	1},
	{"Dng M閏",	2,	2,	42,	1},
	{"T飊g M閏",	2,	2,	41,	1}
}
tb_life_merterial[5] = {
	{"Da S? t?",2,	2,	47,	1.3},
	{"Loan 甶觰 v?",2,	10,	7,	1.3},
	{"Da g蕌",	2,	2,	20,	1.2},
	{"Da h? tr緉g",2,	2,	46,	1},
	{"Da r緉",	2,	2,	18,	1},
	{"Da c竜",	2,	2,	17,	1},
	{"Da h?",	2,	2,	16,	1},
	{"Da s鉯",	2,	2,	15,	1}
}
tb_life_merterial[6] = {
	{"L穘h tr飊g t?",	2,	9,	4,	1.3},
	{"Kim t祄 t?",	2,	2,	55,	1.3},
	{"Linh Chu t?",	2,	2,	54,	1.2},
	{"H錸g t?",	2,	2,	53,	1},
	{"Lang chu t?",	2,	2,	52,	1},
	{"T? Ng? S綾",	2,	9,	3,	1},
	{"T祄 t?",	2,	9,	2,	1},
	{"L玭g th?",	2,	9,	1,	1}
}
tb_cent_and_letter = {
	{15000,1},
	{28000,2},
	{40000,3}
}
--********************对话主函数*******************************************************************
function confwar_task_goods_main()
	Say("",8,
	"Gi韎 thi謚 nhi謒 v?/task_intro",
	"Quy猲 g鉷 nguy猲 li謚/goods_hand_in_main",
	"Xem t譶h h譶h quy猲 g鉷 c馻 bang h閕 hi謓 t筰/goods_hand_in_inf",
	"Th? ti課 c?/commend_letter_main",
	"фi khi猽 chi課 l謓h/exchange_tiaozhanling",
	"фi 8 D騨g S? L謓h (c莕 1 Th? ti課 c?)/exchange_warriorling",
	"фi 6 C玭g th祅h Ti猲 Phong L謓h (c莕 1 Th? ti課 c?)/exchange_citywarling",
	"Tr? l筰/end_dialog"
)
end

function exchange_warriorling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"",Zgc_pub_sex_name().." h譶h nh? kh玭g mang Th? ti課 c? tr猲 ngi?")
		return
	end
	
	if GetFreeItemRoom() < 8 then
		Talk(1,"",Zgc_pub_sex_name().." kh玭g  8 ? tr鑞g trong h祅h trang.")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1201,8,1)
		Msg2Player("B筺 nh薾 頲 8 D騨g S? L謓h.")
		WriteLogEx("Cong Thanh Chien","nh薾",8,"D騨g S? L謓h","",GetTongName())
	end
end

function exchange_citywarling()
	if GetItemCount(2,1,1200) < 1 then
		Talk(1,"",Zgc_pub_sex_name().." h譶h nh? kh玭g mang Th? ti課 c? tr猲 ngi?")
		return
	end
	
	if GetFreeItemRoom() < 6 then
		Talk(1,"",Zgc_pub_sex_name().." kh玭g  6 ? tr鑞g trong h祅h trang.")
		return
	end
	
	if DelItem(2,1,1200,1) == 1 then
		AddItem(2,1,1203,6,1)
		Msg2Player("B筺 nh薾 頲 6 C玭g th祅h Ti猲 Phong L謓h.")
		WriteLogEx("Cong Thanh Chien","nh薾",6,"C玭g th祅h Ti猲 Phong L謓h","",GetTongName())
	end
end

--$$$$$$$$$$$$$$$$$$$$挑战令$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


--********************任务介绍****************************************************
function task_intro()
	Talk(2,"confwar_task_goods_main","Tri襲 nh v? gi芻 Li猽 t竎 chi課 nhi襲 n╩, qu鑓 kh?  h誸, kh? k衞 d礽 頲. Anh h飊g n? hi謕 v? nc v? d﹏, ta  ngh? ngi c? ti襫 g鉷 ti襫, ngi c? s鴆 g鉷 s鴆, c鑞g hi課 v? an nguy qu鑓 gia, Чi T鑞g ta m韎 thi猲 h? th竔 b譶h. V? th? b﹜ gi? ta kh玭g ch? quy猲 g鉷 cho v飊g b? n筺, m? c遪 quy猲 g鉷 <color=yellow>qu﹏ lng<color> cho Чi T鑞g. Hy v鋘g tri襲 nh s韒 thu h錳 t 產i b? m蕋, ch髇g ta s? 頲 an hng th竔 b譶h.",
		"Do s? nguy猲 li謚 l韓 n猲 ta s? d飊g bang h閕 c馻 <color=yellow>c竎 v?<color> l祄 n v? ghi ch衟, sau n祔 s? tuy猲 truy襫 甶觤 t鑤 c馻 c竎 v? n m鋓 ngi. <color=yellow>Gi? tr? qu﹏ lng <color>t?<color=yellow> 0.3 <color>n<color=yellow> 1.5 <color>kh玭g u, nguy猲 li謚 c? c蕄 c祅g cao th? gi? tr? c祅g cao. M鏸 tu莕 ta s? vi誸 1 l莕 <color=yellow>cho<color> qu? bang (nhi襲 nh蕋 <color=yellow>3<color> th? ti課 c?). Nh薾 th? ti課 c?, ghi ch衟 qu﹏ lng s? 頲 tr? tng 鴑g, ph莕 c遪 l筰 s? t輈h l騳 n tu莕 sau."
	)
end

--*********************捐赠*********************************************************
function goods_hand_in_main()
	if istongmember_chk() == 0 then
		return
	end
	local tb_hand_in_mert_diff_dia = {
	"Ta mu鑞 quy猲 g鉷 nguy猲 li謚 h竔 thu鑓/#goods_hand_in(1,1)",
	"Ta mu鑞 quy猲 g鉷 nguy猲 li謚 canh t竎/#goods_hand_in(2,1)",
	"Ta mu鑞 quy猲 g鉷 nguy猲 li謚 o kho竛g/#goods_hand_in(3,1)",
	"Ta mu鑞 quy猲 g鉷 nguy猲 li謚 n c﹜/#goods_hand_in(4,1)",
	"Ta mu鑞 quy猲 g鉷 nguy猲 li謚 thu閏 da/#goods_hand_in(5,1)",
	"Ta mu鑞 quy猲 g鉷 nguy猲 li謚 k衞 t?/#goods_hand_in(6,1)",
	"C? h醝/end_dialog"
	}
	Say("Ngi mu鑞 quy猲 g鉷 lo筰 nguy猲 li謚 n祇?",
	getn(tb_hand_in_mert_diff_dia),tb_hand_in_mert_diff_dia)
end
--*******************生活材料详细列表******************
function goods_hand_in(merterial_diff,page)
	local tb_hand_in_merterial_dia = {}
	local mertrial_num = 0
	for i = 1,8 do
		if tb_life_merterial[merterial_diff][i+((page-1)*8)] ~= nil then
			mertrial_num = mertrial_num + 1
			tb_hand_in_merterial_dia[i] = "Ta mu鑞 quy猲 g鉷 to祅 b?"..tb_life_merterial[merterial_diff][((page-1)*8+i)][1].."(m鏸 "..strsub(tostring(tb_life_merterial[merterial_diff][((page-1)*8+i)][5]),1,4).."甶觤 t輈h l騳)/#mert_han_in("..merterial_diff..","..((page-1)*8+i)..")"
		else
			break
		end
	end
	if getn(tb_life_merterial[merterial_diff]) > 8 and page == 1 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "Trang k?/#goods_hand_in("..merterial_diff..",2)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "Tho竧/end_dialog"
	elseif page == 2 then
		tb_hand_in_merterial_dia[mertrial_num+1] = "Trang trc/#goods_hand_in("..merterial_diff..",1)"
		tb_hand_in_merterial_dia[mertrial_num+2] = "Tho竧/end_dialog"
	else
		tb_hand_in_merterial_dia[mertrial_num+1] = "Tho竧/end_dialog"
	end
	Say("Ngi mu鑞 quy猲 g鉷 nguy猲 li謚 n祇?",
		getn(tb_hand_in_merterial_dia),
		tb_hand_in_merterial_dia
		)
end
--****************************材料捐献************************
function mert_han_in(merterial_diff,merterial_seq)
	local cent_count = 0
	local merterial_num = GetItemCount(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4])
	local cent_count = merterial_num * tb_life_merterial[merterial_diff][merterial_seq][5]

	if merterial_num == 0  then
		Say("?"..Zgc_pub_sex_name().."Trong h祅h trang kh玭g c? <color=yellow>"..tb_life_merterial[merterial_diff][merterial_seq][1].."<color>, qu猲 mang r錳 ph秈 kh玭g?",
		2,
		"Ta mu鑞 quy猲 g鉷 nguy猲 li謚 kh竎/goods_hand_in_main",
		"Ta v蒼 ch璦 chu萵 b?/end_dialog"
		)
		return
	elseif cent_count < 1 then
		Talk(1,"","N誹 "..Zgc_pub_sex_name().." c? ? mu鑞 quy猲 g鉷, mang 輙 nguy猲 li謚 v藋 c騨g keo qu? r錳, ta kh玭g r秐h  gi秈 quy誸 nh鱪g m鉵  n祔 c馻 ngi.")
		return
	end
	cent_count = floor(cent_count)
	if DelItem(tb_life_merterial[merterial_diff][merterial_seq][2],tb_life_merterial[merterial_diff][merterial_seq][3],tb_life_merterial[merterial_diff][merterial_seq][4],merterial_num) ~= 1 then
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,cent_count)
	Zgc_pub_getconftask(3,1)
end
--************************帮会积分数据取得回调*********************
function ConfDataGetReturn_1(cent_save)
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	SetTaskTemp(temp_taskID_merterial_count_conf,(cent_save+cent_the_turn))
	Zgc_pub_setconftask(3,(cent_save+cent_the_turn),1)
end
--**************************帮会积分存储回调***********************
function ConfDataSetReturn_1()
	local cent_the_turn = GetTaskTemp(temp_taskID_merterial_count)
	local cent_conf_save = GetTaskTemp(temp_taskID_merterial_count_conf)
	Talk(1,"","V? qu? bang  quy猲 g鉷 qu﹏ lng "..cent_the_turn.."甶觤 t輈h l騳!")
	SendTongMessage(GetName().."  quy猲 g鉷 cho Чi T鑞g "..cent_the_turn.."hi謓 nay qu? bang  t輈h l騳 "..cent_conf_save.." 甶觤 qu﹏ lng.")
end
--************************************查看***********************************
function goods_hand_in_inf()
	Zgc_pub_getconftask(3,2)
end
function ConfDataGetReturn_2(cent_save)
	Talk(1,"","Qu? bang  quy猲 g鉷 <color=yellow>"..cent_save.."<color> 甶觤 qu﹏ lng, hy v鋘g ti誴 t鬰!")
	return
end
--**********************************推荐信***********************************
function commend_letter_main()
	Say("G莕 y nghe n鉯 tri襲 nh tri謚 t藀 c竎 anh h飊g thi猲 h? tr蕁 gi? <color=yellow>Th祅h Й<color>, nh璶g ph秈 t? v? L玦 i nh薾 t? c竎h, c竎 bang ph竔 quy猲 g鉷 qu﹏ lng t輈h c鵦 nh? v藋 s? r蕋 ch閚 r閚, hay l? ta s? vi誸 1 b鴆 <color=yellow>th? ti課 c?<color> g雐 cho Чi s? c玭g th祅h <color=yellow>? Th祅h Й<color>, xem nh? l? gi韎 thi謚 cho qu? bang.\n Quy猲 g鉷 <color=yellow>"..tb_cent_and_letter[1][1].."<color> qu﹏ lng c? <color=yellow>"..tb_cent_and_letter[1][2].."<color> th? ti課 c鯸n Quy猲 g鉷 <color=yellow>"..tb_cent_and_letter[2][1].."<color> qu﹏ lng c? <color=yellow>"..tb_cent_and_letter[2][2].."<color> th? ti課 c鯸n Quy猲 g鉷 <color=yellow>"..tb_cent_and_letter[3][1].."<color> qu﹏ lng c? <color=yellow>"..tb_cent_and_letter[3][2].."<color> th? ti課 c?",
		2,
		"H穣 gi髉 ta vi誸 th? ti課 c?/commend_letter_prize",
		"C? h醝/end_dialog")
end
function commend_letter_prize()
	if IsTongMaster() ~= 1 then						--权限检测
		Talk(1,"","M阨 bang ch? <color=yellow>qu? bang<color> n nh薾 <color=yellow>th? ti課 c?<color>.")
		return
	end
	Zgc_pub_getconftask(4,3)						--获取上次领取周数
end
function ConfDataGetReturn_3(week_seq_save)			--周序数获得回调
	if week_seq_save >= zgc_pub_day_turn(7) then	--本周可以领取与否检测
		Talk(1,"","G莕 y ta r蕋 b薾, th? ti課 c? c馻 <color=yellow>m鏸 bang ph竔<color> ta ch? vi誸 <color=yellow>1 tu莕<color> m閠 l莕. "..Zgc_pub_sex_name().."Tu莕 sau n nh?!")
		return
	end
	Zgc_pub_getconftask(3,4)						--当前积分获取
end
function ConfDataGetReturn_4(cent_save)				--当前积分获取回调
	if cent_save < tb_cent_and_letter[1][1] then	--积分不足下限提示
		Talk(1,"","Nguy猲 li謚 qu? bang quy猲 g鉷 kh玭g  <color=yellow>15000<color> 甶觤, quy猲 g鉷  r錳 n nh薾 <color=yellow>th? ti課 c?<color>!")
		return
	end
	local letter_able_get = 0
	for i = 1, 3 do
		if cent_save >= tb_cent_and_letter[i][1] then
			letter_able_get = i
		else
			break
		end
	end
	if Zgc_pub_goods_add_chk(3,3) ~= 1 then		--空间和负重判断
		return
	end
	SetTaskTemp(temp_taskID_merterial_count,letter_able_get)
	Say("T鎛g nguy猲 li謚 hi謓 nay qu? bang  quy猲 g鉷 <color=yellow>"..cent_save.."<color> ta gi髉 ngi vi誸 <color=yellow>"..letter_able_get.."<color> th? ti課 c?.",
	2,
	"Ta mu鑞 nh薾 th? ti課 c? c馻 bang ta/#letter_get_dtm("..cent_save..","..letter_able_get..")",		--减少积分
	"в ta suy ngh? l筰/end_dialog")
end
--********************领取信件确认对话********************
function letter_get_dtm(cent_save,letter_num)
	local cent_remain = (cent_save-(tb_cent_and_letter[letter_num][1]))
	SetTaskTemp(temp_taskID_merterial_count_conf,cent_remain)
	Say("<color=red>Ch? ?<color>: M閠 tu莕 ch? c? th? nh薾 <color=red>1 l莕 <color>th? ti課 c?, ngi mu鑞 nh薾 b﹜ gi? kh玭g?",
	2,
	"Ta mu鑞 nh薾/#Zgc_pub_setconftask(3,"..cent_remain..",2)",		--减少积分
	"в ta suy ngh? l筰/end_dialog"
	)
end
function ConfDataSetReturn_2()					--积分减少回调（成功）
	local letter_num = GetTaskTemp(temp_taskID_merterial_count)
	local conf_cent_remain = GetTaskTemp(temp_taskID_merterial_count_conf)
	if AddItem(2,1,1200,letter_num) == 1 then
		Talk(1,"","C竎 h?  nh薾 th? ti課 c? tu莕 n祔 "..letter_num.." th?!")
		SendTongMessage(GetName().." Nh薾 th? ti課 c? "..letter_num.." th?, hi謓 nay qu? bang c遪 d? "..conf_cent_remain.." 甶觤 qu﹏ lng!")
		WriteLogEx("Cong Thanh Chien","nh薾",letter_num,"Th? ti課 c?","",GetTongName())
	end
	Zgc_pub_setconftask(4,zgc_pub_day_turn(7),3)--周序数存入
end
function ConfDataSetReturn_3()					--周序数存入回调
end
--*********************捐赠资格检测***********************************************
function istongmember_chk()
	if IsTongMember() == 0 then
		Talk(1,"","Ngi gia nh藀 bang ph竔 r錳 h穣 n y quy猲 g鉷.")
		return 0
	else
		return 1
	end
end


--兑换挑战令
function exchange_tiaozhanling()
	Say("<color=green>Ch﹗ Thi謓 Nh﹏<color>: Khi猽 chi課 l謓h d飊g  khi猽 chi課 bang h閕 th? th祅h. N閜 cho ch? l鏸 i c? th? thu 頲 t? c竎h tham chi課. Bang h閕 n閜 nhi襲 khi猽 chi課 l謓h nh蕋 s? c? t? c竎h c玭g thanh. Th玭g qua 甶觤 qu﹏ lng v? b筩  i l蕐 khi猽 chi課 l謓h.",
		2,
		"фi khi猽 chi課 l謓h (c莕 88 甶觤 qu﹏ lng v? 88 b筩)/confirm_exchange_tiaozhanling",
		"Xem th玭g tin kh竎/end_dialog"
	);
end

function confirm_exchange_tiaozhanling()
	-- 是否是帮主，副帮主或长老
	if IsTongMember() ~= 1 and IsTongMember() ~= 2 and IsTongMember() ~= 3 then
		Talk(1,"","<color=green>Chu Thi謓 Nh﹏<color>: Ch? c? bang ch?/ph? bang ch?/trng l穙 m韎 c? th? i khi猽 chi課 l謓h")
		return 0
	end
	
	-- 帮主必须在位7天以上
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","<color=green>Chu Thi謓 Nh﹏<color>: C竎 h? t筰 v? kh玭g  7 ng祔, kh玭g th? i khi猽 chi課 l謓h")
		return 0
	end
	
	-- 80级以上
	local nLevel = GetLevel();
	if nLevel < 80 then
		Talk(1,"","<color=green>Chu Thi謓 Nh﹏<color>: C蕄 b薱 c竎 h? kh玭g  80, kh玭g th? i khi猽 chi課 l謓h")
		return 0
	end
	
	--用帮会积分来换挑战令
	
	--先取得帮会现有的积分，看看
	---
	Zgc_pub_getconftask(3,5)
	
	--ApplyRelayShareData(GetTongName(),0,0,File_name,"call_back_tiaozhanling")
end

function ConfDataGetReturn_5(cent_save)
	local nCount = floor(cent_save / 88);
	Say("<color=green>Chu Thi謓 Nh﹏<color>: Чi hi謕 mu鑞 d飊g 88 甶觤 qu﹏ lng v? 88 b筩  i khi猽 chi課 l謓h?",
			2,
			"ng, ta mu鑞 i./#confirm_tiaozhanling("..cent_save..")",
			"в ta ngh? l筰/end_dialog"
	);
end

function confirm_tiaozhanling(nPoint)
	if Zgc_pub_goods_add_chk(2, 10) == 0 then
		return 0;
	end
	local nRemainPoint = nPoint - 88;
        if nRemainPoint < 0 then
            Say("<color=green>Chu Thi謓 Nh﹏<color>:  觤 t輈h l騳 bang h閕 c馻 i hi謕 kh玭g !", 0);
            return 0;
        end
	if Pay(88 * 100) == 0 then
		Say("<color=green>Chu Thi謓 Nh﹏<color>: H祅h trang kh玭g  ng﹏ lng!", 0);
		return 0;
	end
	Zgc_pub_setconftask(3, nRemainPoint, 5);
	local nCount = 0;
	local nRand = random(1, 1000);
	if nRand == 1 then
		nCount = 3;
	elseif nRand <= 10 then
		nCount = 2;
	else
		nCount = 1;
	end
	AddItem(2, 1, 30117, nCount);
	Talk(1, "exchange_tiaozhanling", "<color=green>Chu Thi謓 Nh﹏<color>: Чi hi謕 d飊g 甶觤 t輈h l騳 bang h閕 i "..nCount.." khi猽 chi課 l謓h.");
	WriteLog("[фi khi猽 chi課 l謓h]: "..GetName().." l? bang h閕 "..GetTongName().."i "..nCount.." khi猽 chi課 l謓h.");
end

function ConfDataSetReturn_5()
end
