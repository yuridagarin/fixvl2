--脚本名称：2007端午活动NPC脚本
--脚本功能：活动NPC脚本
--活动策划人：小天天
--代码开发人：村长
--代码开发时间：2007-05-24
--代码修改记录：
--=====================================全局变量定义区============================
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\dragon_boat_07\\dragon_boat_08_head.lua")

	flower_goods_id = 1140
	frag_sao_goods_id = 1139
	keepsake_num_TaskID = 1227
	zong_zi_date_seq = 1228
	zong_zi_num_restrict_TaskID = 1230
	zong_zi_start_TaskID = 1231
	chg_mertiral_TaskTempID = 168
	keepsake_date_TaskID = 1241
	dragon_boat_07_join_TaskID = 1242
	Tb_keepsake_chg_way = {
		{"L? g鉯 b竛h",800,1130},
		{"T骳 M?",320,1129},
		{"Tr骳 ng",320,1131},
		{"H祄 Th駓",200,1132},
		{"輈h Tr? Nh﹏",160,1133},
		{"u ",96,1134},
		{"g筼 tr緉g",64,1135},
		{"Ng穒 di謕",32,1136},
		{"эi nng",16,1137},
		{"T骳 t?",8,1138},
	}
	Tb_zong_zi_info = {}
	Tb_zong_zi_info[1118] = {{"уng t鑞g","Nguy猲 li謚 h頿 th祅h c? b秐 v? hi謚","",70,1000,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"T骳 M?",1129,1,1},{"Tr骳 ng",1131,1,2}}
	Tb_zong_zi_info[1119] = {{"B祅h 輙 H祄 Th駓","Nguy猲 li謚 h頿 th祅h c? b秐 v? hi謚","",70,1000,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"H祄 Th駓",1132,1,3},{"уng t鑞g",1118,1}}
	Tb_zong_zi_info[1120] = {{"輈h Tr? T鑞g","Lo筰 b竛h n祔 kh玭g c? g? c bi謙","",70,1500,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"輈h Tr? Nh﹏",1133,1,4},{"B祅h 輙 H祄 Th駓",1119,1}}
	Tb_zong_zi_info[1121] = {{"B竛h 輙 u ","Lo筰 b竛h n祔 kh玭g c? g? c bi謙","",60,2000,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"u ",1134,1,5},{"輈h Tr? T鑞g",1120,1}}
	Tb_zong_zi_info[1122] = {{"b竛h 輙 g筼 tr緉g","Lo筰 b竛h n祔 kh玭g c? g? c bi謙","",50,4000,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"g筼 tr緉g",1135,1,6},{"B竛h 輙 u ",1121,1}}
	Tb_zong_zi_info[1123] = {{"B竛h 輙 Ng穒 hng","Sau khi s? d鬾g c? th? i <color=yellow>50 v筺*ng c蕄*ng c蕄/6400<color> 甶觤 s鴆 kh醗 th祅h kinh nghi謒","returngolden_exp_chg(500000)",50,6000,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"Ng穒 di謕",1136,1,7},{"b竛h 輙 g筼 tr緉g",1122,1}}
	Tb_zong_zi_info[1124] = {{"b竛h 輙 ch﹏ g?","N閕 <color=yellow>10<color> ph髏 sau khi s? d鬾g, Sinh l鵦 t╪g th猰 <color=yellow>30##<color>","returnlife_improve()",50,10000,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"эi nng",1137,1,8},{"B竛h 輙 Ng穒 hng",1123,1}}
	Tb_zong_zi_info[1125] = {{"b竛h 輙 B竎 B秓","N閕 <color=yellow>3<color> ph髏 sau khi s? d鬾g, to祅 b? n╪g l鵦 t╪g th猰 <color=yellow>60<color> 甶觤","returnability_improve()",33,40000,"delete_all","to祅 b? nguy猲 li謚 s? bi課 m蕋"},{"L? g鉯 b竛h",1130,1,0},{"T骳 t?",1138,1,9},{"b竛h 輙 ch﹏ g?",1124,1}}
	Tb_zong_zi_info[1126] = {{"b竛h 輙 vui v?","C? th? i 1 quy觧 <color=yellow>S? M玭 l謓h th?<color> ? y ho芻 nh薾 <color=yellow>100-200<color> 甶觤 danh v鋘g ng蓇 nhi猲","returnbook_renation_add()",33,80000,"1125","T鎛 th蕋 1 c竔 B竛h 輙 b竧 b秓"},{"b竛h 輙 B竎 B秓",1125,3}}
	Tb_zong_zi_info[1127] = {{"b竛h 輙 may m緉","C? th? n g苝 ta  i 1 quy觧 <color=yellow>M藅 T辌h S? m玭<color>","returniron_stone_add()",33,100000,"1126"," s? t鎛 th蕋 1 B竛h 輙 Vui v?"},{"b竛h 輙 vui v?",1126,3}}
	Tb_zong_zi_info[1128] = {{"b竛h 輙 th筩h anh","C? th? i 1 quy觧 m藅 t辌h <color=red>L╪g Ba Vi B?<color>","returnsecret_book_add()",20,400000,"1127"," s? t鎛 th蕋 1 B竛h 輙 May m緉"},{"b竛h 輙 may m緉",1127,3}}
	Tb_zong_zi_num_restrict = {}
	Tb_zong_zi_num_restrict[1126] = {1,3,5,7}
	Tb_zong_zi_num_restrict[1127] = {2,3,6,7}
	Tb_zong_zi_num_restrict[1128] = {4,5,6,7}
	Tb_zong_zi_chg_dia = {}
	Tb_zong_zi_chg_dia[1126]= 	{"Ta mu鑞 i 1 quy觧 S? M玭 l謓h th?/#prize_get(1126,1,1016)",
								"Ta mu鑞 t╪g danh v鋘g/#repute_add(1126,100,200)",
								"Ta tng tng xem n祇!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1126].say = "<color=green>Truy襫 nh﹏ nc S?<color>: Qu? nhi猲 l? lo筰 <color=yellow>B竛h 輙 vui v?<color> hi誱 th蕐, ? y c? quy觧 <color=yellow>S? m玭 l謓h th?<color> c? th? gi髉 甶觤 c鑞g hi課 s? m玭 trong ng祔 c馻 ngi nh﹏ i, hay ngi mu鑞 danh v鋘g giang h? t╪g <color=yellow>100-200 甶觤<color>, suy ngh? k? r錳 h穣 b竔 t??"
	Tb_zong_zi_chg_dia[1127]= 	{"Ta x竎 nh薾 t? b竔!/tech_book_add",
								"Ta tng tng xem n祇!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1127].say = "Th? ra l? <color=yellow>B竛h 輙 May m緉<color>, l穙 phu ta c? c竎 <color=yellow>B? ki誴<color> m藅 truy襫 c馻 c竎 m玭 ph竔. N誹 ngi gia nh藀 m玭 ph竔 ta s? t苙g ngi 1 quy觧. N誹 ch璦 gia nh藀 th? c遪 ph秈 xem v薾 kh? c馻 ngi . Mu鑞 b竔 t? kh玭g?"
	Tb_zongzi_teach_book = {}
	Tb_zongzi_teach_book[21]={"Kim Cang Ph鬰 Ma kinh",0,107,1}
	Tb_zongzi_teach_book[22]={"Kim Cang Ph鬰 Ma T﹎ Ph竝",0,107,2}
	Tb_zongzi_teach_book[41]={"Ti襪 Long M藅 t辌h",0,107,3}
	Tb_zongzi_teach_book[42]={"Ti襪 Long T﹎ Ph竝",0,107,4}
	Tb_zongzi_teach_book[31]={"V? Tr莕 M藅 t辌h",0,107,5}
	Tb_zongzi_teach_book[32]={"V? Tr莕 T﹎ Ph竝",0,107,6}
	Tb_zongzi_teach_book[61]={"Thi猲 La M藅 T辌h",0,107,7}
	Tb_zongzi_teach_book[62]={"Thi猲 La T﹎ Ph竝",0,107,8}
	Tb_zongzi_teach_book[81]={"Nh? ? M藅 T辌h",0,107,9}
	Tb_zongzi_teach_book[82]={"Nh? ? T﹎ Ph竝",0,107,10}
	Tb_zongzi_teach_book[91]={"B輈h H秈 Ph?",0,107,11}
	Tb_zongzi_teach_book[92]={"B輈h H秈 T﹎ Ph竝",0,107,12}
	Tb_zongzi_teach_book[111]={"H鏽 чn M藅 t辌h",0,107,13}
	Tb_zongzi_teach_book[112]={"H鏽 чn T﹎ Ph竝",0,107,14}
	Tb_zongzi_teach_book[121]={"Qu? Thi猲 M藅 t辌h",0,107,15}
	Tb_zongzi_teach_book[122]={"Qu? Thi猲 T﹎ Ph竝",0,107,16}
	Tb_zongzi_teach_book[141]={"Huy襫 秐h M藅 t辌h",0,107,17}
	Tb_zongzi_teach_book[142]={"Huy襫 秐h T﹎ Ph竝",0,107,18}
	Tb_zongzi_teach_book[151]={"Qu﹏ T? M藅 t辌h",0,107,19}
	Tb_zongzi_teach_book[152]={"Qu﹏ T? T﹎ Ph竝",0,107,20}
	Tb_zongzi_teach_book[171]={"Tr蕁 Qu﹏ M藅 t辌h",0,107,21}
	Tb_zongzi_teach_book[172]={"Tr蕁 Qu﹏ T﹎ Ph竝",0,107,22}
	Tb_zongzi_teach_book[181]={"Xuy猲 V﹏ M藅 t辌h",0,107,23}
	Tb_zongzi_teach_book[182]={"Xuy猲 V﹏ T﹎ Ph竝",0,107,24}
	Tb_zongzi_teach_book[201]={"U Minh Qu? L鬰",0,107,25}
	Tb_zongzi_teach_book[202]={"U Minh T﹎ Ph竝",0,107,26}
	Tb_zongzi_teach_book[211]={"Linh C? M藅 t辌h",0,107,27}
	Tb_zongzi_teach_book[212]={"Linh C? T﹎ Ph竝",0,107,28}
	Tb_player_route = {2,3,4,6,8,9,11,12,14,15,17,18,20,21}
	Tb_zong_zi_chg_dia[1128] = {"Ta x竎 nh薾 t? b竔!/#prize_get(1128,112,78)",
								"Ta tng tng xem n祇!/end_dialog",
								}
	Tb_zong_zi_chg_dia[1128].say= "Th? ra l? <color=yellow>B竛h 輙 Th駓 tinh<color>収﹜ l? B? ki誴 <color=yellow>'L╪g Ba Vi B?'<color>. Xem ra ngi c鉷 duy猲 v韎 n?...Mu鑞 b竔 t? kh玭g?"
--linshi
--2008端午
Tb_dialog_main = {
	"Ta mu鑞 l祄 b竛h 輙 n b竔 Khu蕋 Nguy猲 i phu/zongzi_cook",
	"Ta c莕 d飊g lo筰 b竛h 輙 hi誱 th蕐  c髇g t? Khu蕋 Nguy猲 i phu/zongzi_chg",
	"Ta mu鑞 t譵 hi觰 c竎h l祄 b竛h 輙/zongzi_info",
	"Ta ch? n xem th?/end_dialog"
}
--======================================函数主逻辑区=============================
function main()
	if GetLevel() < 10 then
		Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> n╪g l鵦 c遪 y誹, hay l? quay l筰 sau v藋!")
		return
	end
	if dragon_boat_08_time_chk() == 0 then
		Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> ng n鉵g v閕, i n trc m an Ng? (<color=yellow>m飊g 5 th竛g 5<color>) ch髇g ta s? m? ho箃 ng an Ng? ho祅 to祅 m韎, m鋓 ngi c飊g nhau c髇g t? Khu蕋 Nguy猲 i phu.")
		return
	else
		Say("<color=green>Truy襫 nh﹏ nc S?<color>: ?, l筰 s緋 n <color=yellow>T誸 an Ng?<color> r錳, m鏸 n╩ c? n ng祔 n祔 Truy襫 nh﹏ nc S? c馻 ch髇g ta r蕋 thng t﹎. T蕋 c? con ch竨 c馻 i nh﹏ Khu蕋 Nguy猲 v?  tng nh? n 玭g  t筼 m閠 c竔 l襲 l祄 b竛h 輙,  ph鬰 v? g鉯 b竛h cho m鋓 ngi, ch? c莕 b筺 mang nguy猲 li謚 n l? 頲.",
		getn(Tb_dialog_main),
		Tb_dialog_main
		)
	end
end
--粽子制作主函数
function zongzi_cook()
	 --粽子制作对话
	local Tb_dialog_zongzi_cook ={}
	local zongzi_able_cook_num = 0
	if dragon_boat_08_time_chk() == 1 then
		zongzi_able_cook_num = getn(Tb_zongzi_08)
	else
		zongzi_able_cook_num = (getn(Tb_zongzi_08) - 4)
	end
	--对话合成
	for i = 1 ,zongzi_able_cook_num do
		tinsert(Tb_dialog_zongzi_cook,Tb_zongzi_08[i][1]..", c玭g d鬾g: "..Tb_zongzi_08[i][6].."; t? l? th祅h c玭g: "..Tb_zongzi_08[i][3].."%/#zongzi_cook_chk("..i..")")
	end
	tinsert(Tb_dialog_zongzi_cook,"M謙 qu? 甶! Ta kh玭g l祄 n鱝!/end_dialog")
	--对话展开
	Say("<color=green>Truy襫 nh﹏ nc S?<color>: Mu鑞 l祄 m閠 c竔 b竛h ngon kh玭g ph秈 l? vi謈 d?, c莕 ph秈  nguy猲 li謚. Ngi mu鑞 l祄 m閠 c竔 b竛h nh? th? n祇?",
	getn(Tb_dialog_zongzi_cook),
	Tb_dialog_zongzi_cook
	)
end
--制作粽子确认对话
function zongzi_cook_chk(zongzi_diff)
	Say("<color=green>Di t閏 S? qu鑓<color>: <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color>, c玭g d鬾g: <color=yellow>"..Tb_zongzi_08[zongzi_diff][6].."<color>; nguy猲 li謚: <color=yellow>"..Tb_zongzi_08[zongzi_diff][5][1][3].."("..Tb_zongzi_08[zongzi_diff][5][1][2].."),"..Tb_zongzi_08[zongzi_diff][5][2][3].."("..Tb_zongzi_08[zongzi_diff][5][2][2].."),"..Tb_zongzi_08[zongzi_diff][5][3][3].."("..Tb_zongzi_08[zongzi_diff][5][3][2]..")<color>, t? l? th祅h c玭g: <color=yellow>"..Tb_zongzi_08[zongzi_diff][3].."%<color>. Ngi x竎 nh薾 mu鑞 l祄 ch??",
	2,
	"Ta x竎 nh薾/#zongzi_cook_dtm("..zongzi_diff..")",
	"в ta suy ngh? l筰/zongzi_cook"
	)	
end
--确认制作粽子
function zongzi_cook_dtm(zongzi_diff)
	local zongzi_num_min = min(floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][1][1])/Tb_zongzi_08[zongzi_diff][5][1][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][2][1])/Tb_zongzi_08[zongzi_diff][5][2][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][3][1])/Tb_zongzi_08[zongzi_diff][5][3][2]))
	if zongzi_num_min == 0 then
		Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color> nguy猲 li謚 g錷 <color=yellow>"..Tb_zongzi_08[zongzi_diff][5][1][3].."("..Tb_zongzi_08[zongzi_diff][5][1][2].."),"..Tb_zongzi_08[zongzi_diff][5][2][3].."("..Tb_zongzi_08[zongzi_diff][5][2][2].."),"..Tb_zongzi_08[zongzi_diff][5][3][3].."("..Tb_zongzi_08[zongzi_diff][5][3][2]..")<color>, c? th? <color=yellow>"..Zgc_pub_sex_name().."<color> ngay c? nguy猲 li謚 l祄 1 c竔 <color=yellow>"..Tb_zongzi_08[zongzi_diff][1].."<color> c騨g kh玭g , c? ph秈  qu猲 trong rng kh玭g?")
		return
	end
	SetTaskTemp(chg_mertiral_TaskTempID,zongzi_diff)
	AskClientForNumber("zongzi_get",1,zongzi_num_min,"Xi nh藀 s? lng b筺 mu鑞 l祄 "..Tb_zongzi_08[zongzi_diff][1].."!")
end
--开始制作粽子
function zongzi_get(zongzi_num)
	local zongzi_diff = GetTaskTemp(chg_mertiral_TaskTempID)
	--输入数量为0时不处理
	if zongzi_num == 0 then
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(4,(50 + zongzi_num)) ~= 1 then
		return
	end
	--材料携带检测
	if mertiral_chk(1,zongzi_diff,zongzi_num) ~= 1 then
		Talk(1,"","<color=green>Truy襫 nh﹏ nc S?<color>: Nguy猲 li謚 ngi 甧m kh玭g , c? ph秈  qu猲 trong rng kh玭g?")
		return
	end
	--材料删除检测
	if mertiral_chk(2,zongzi_diff,zongzi_num) ~= 1 then
		Talk(1,"","<color=green>Truy襫 nh﹏ nc S?<color>: Nguy猲 li謚 ngi 甧m kh玭g , c? ph秈  qu猲 trong rng kh玭g?")
		return
	end
	--制作概率计算
	if Tb_zongzi_08[zongzi_diff][3] ~= 100 then
		local ran_num = 0
		for i = 1,zongzi_num do
			ran_num = random(1,100)
			if ran_num > Tb_zongzi_08[zongzi_diff][3]  then
				zongzi_num = zongzi_num - 1
			end
		end
	end
	if zongzi_num == 0 then
		Talk(1,"","<color=green>Truy襫 nh﹏ nc S?<color>: Th藅 ng ti誧, "..Tb_zongzi_08[zongzi_diff][1].."Th蕋 b筰 r錳!")
		return
	end
	--粽子增加
	local add_flag = AddItem(2,1,Tb_zongzi_08[zongzi_diff][2],zongzi_num)
	if add_flag == 1 then
		Msg2Player("Ch骳 m鮪g b筺  ch? t筼 th祅h c玭g"..zongzi_num.."c竔"..Tb_zongzi_08[zongzi_diff][1].."!")
	else
		WriteLog("[T誸 an Ng? 08] ngi ch琲	"..GetName().."	T╪g"..zongzi_num.."c竔"..Tb_zongzi_08[zongzi_diff][1].." th蕋 b筰, k? hi謚:"..add_flag)
	end
	--其它奖励增加
	--外装和外装增加
	if dragon_boat_08_time_chk() == 1 then
		for i = 1,zongzi_num do
			suit_add(zongzi_diff)
			exp_add()
		end
	end
end
--材料检测,处理标志：1：材料携带检测，2：材料删除
function mertiral_chk(deal_flag,zongzi_diff,zongzi_num)
	if deal_flag == 1 then
		if zongzi_num > min(floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][1][1])/Tb_zongzi_08[zongzi_diff][5][1][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][2][1])/Tb_zongzi_08[zongzi_diff][5][2][2]),floor(GetItemCount(2,1,Tb_zongzi_08[zongzi_diff][5][3][1])/Tb_zongzi_08[zongzi_diff][5][3][2])) then
			return 0
		else
			return 1
		end
	else
		if DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][1][1],(Tb_zongzi_08[zongzi_diff][5][1][2] * zongzi_num)) == 1 and 
		DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][2][1],(Tb_zongzi_08[zongzi_diff][5][2][2] * zongzi_num)) == 1 and 
		DelItem(2,1,Tb_zongzi_08[zongzi_diff][5][3][1],(Tb_zongzi_08[zongzi_diff][5][3][2] * zongzi_num)) == 1 then
			return 1
		else
			return 0
		end
	end
end
--外装增加
function suit_add(zongzi_diff)
	--如果已经领了一套，则返回
	local suit_got = GetTask(TaskID_suit_prize)
	if strlen(tostring(suit_got)) >= 3 then
		return
	end
	local ran_num = random(1,1000)
	if ran_num > Tb_zongzi_08[zongzi_diff][4] then
		return
	else
		local player_body = GetBody()
		local ran_seq_num = random(1,3) --顺序打乱中间数
		for i = 1,3 do
			local add_seq = (mod((i +ran_seq_num),3) +1)
			if strfind(tostring(suit_got),tostring(add_seq))  == nil then
				local add_flag = AddItem(Tb_suit_prize[add_seq][player_body][2],Tb_suit_prize[add_seq][player_body][3],Tb_suit_prize[add_seq][player_body][4],1)
				if add_flag == 1 then
					Msg2Player("Ch鴆 m鮪g! B筺 nh薾 頲 1 "..Tb_suit_prize[add_seq][player_body][1].."!")
				else
					WriteLog("[T誸 an Ng? 08] ngi ch琲	"..GetName().."	T╪g"..Tb_suit_prize[add_seq][player_body][1].." th蕋 b筰, k? hi謚:"..add_flag)
				end
				--记录数据
				SetTask(TaskID_suit_prize,(suit_got * 10 + add_seq))
				suit_got = GetTask(TaskID_suit_prize)
				--是否是增加一套的处理
				if Tb_zongzi_08[zongzi_diff][4] < 50 then
					break
				end
			end
		end
	end
end
--经验增加
function exp_add()
	local date_seq_save = GetTask(TaskID_exp_get_date_seq)
	local chg_num_save = GetTask(TaskID_exp_get_times)
	local date_seq_now = zgc_pub_day_turn(1)
	if date_seq_save < date_seq_now then
		SetTask(TaskID_exp_get_date_seq,date_seq_now)
		SetTask(TaskID_exp_get_times,1)
		chg_num_save = 0
	elseif date_seq_save == date_seq_now then
		SetTask(TaskID_exp_get_times,(chg_num_save + 1))
	else
		return
	end
	--10次以上不予运算
	if chg_num_save > 20 then
		return
	end
	if 	 GetLevel() == 99 then
		laborday08_baoshi_prob()
	else
		local player_level = GetLevel()
		local exp_add_num = floor(player_level*player_level*player_level*player_level * cifang_caculate(0.5 , chg_num_save)/6)
		if Sever_diff == 2 then
			exp_add_num = floor(exp_add_num * 0.75)
		end
		if exp_add_num > 0 then
			ModifyExp(exp_add_num)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..exp_add_num.." 甶觤 kinh nghi謒!")
		end	
	end
end
--次方运算
function cifang_caculate(a,b)
	local num_rtn = 1
	if b == 0 then
		return 1
	else
		for i = 1 , b do
			num_rtn = (num_rtn * a)
		end
		return num_rtn
	end
end
--粽子兑换奖励
function zongzi_chg()
	Say("Truy襫 nh﹏ nc S?: Ngi mu鑞 d飊g b竛h 輙 g? b竔 t? Khu蕋 Nguy猲 i phu, n誹 lo筰 th玭g thng th? kh玭g c莕, b鋘 ta c? nhi襲 r錳.",
		6,
		"Ngi xem th? B竛h 輙 B筩h Ng鋍 th? nh? th? n祇?/zongzi_baiyu",
		"Ngi xem th? B竛h 輙 Ng? Ph萴 th? nh? th? n祇?/zongzi_yupin",
		"H穣 xem th? B竛h 輙 Vui v? th? n祇?/#zong_zi_up(1126)",
		"H穣 xem th? B竛h 輙 May m緉 th? n祇?/#zong_zi_up(1127)",
		"H穣 xem th? B竛h 輙 Th駓 tinh th? n祇?/#zong_zi_up(1128)",
		"Ta ? y ch? c? b竛h 輙 thng,  ta th? l祄 l筰 xem "
	)
end
--新增粽子处理
--白玉粽子
function zongzi_baiyu()
	if zongzi_chg_astrict(1,1) ~= 1 then
		return
	end
	Say("<color=green>Truy襫 nh﹏ nc S?<color>: Qu? nhi猲 l? <color=yellow>B竛h 輙 B筩h Ng鋍<color>, l穙 phu c? m閠 輙 trang b? kh玭g t錳, t苙g ngi 1 m鉵, ngi x竎 nh薾 mu鑞 t? b竔 r錳 ch??",
	3,
	"g c? nh鱪g trang b? n祇/baiyu_prize_info",
	"Ta x竎 nh薾 t? b竔!/baiyu_use_dtm",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--白玉粽子奖励介绍
function baiyu_prize_info()
	Talk(1,"zongzi_baiyu","<color=green>Truy襫 nh﹏ nc S?<color>: <color=red>Linh th筩h c蕄 7 (2 vi猲), T祅g Ki誱 T? Kim M穙, T祅g Ki誱 Kim L? Thng, T祅g Ki誱 ? Kim Trang, T祅g Ki誱 B秓 Ch﹗, T祅g Ki誱 K? Th筩h, T祅g Ki誱 Kim 蕁<color>, u l? nh鱪g v藅 qu? c?.")
end
--白玉粽子确认使用
function baiyu_use_dtm()
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,100	) ~= 1 then
		return
	end
	--携带删除监测
	for i = 1,2 do
		if zongzi_use_dtm(i,7) ~= 1 then
			return
		end
	end
	--奖励增加
	local ran_num = random(1,100)
	if ran_num <= Tb_baiyu_prize[getn(Tb_baiyu_prize)][1] then	--增加藏剑装备
		local add_flag = 0
		for i = 1,getn(Tb_baiyu_prize) do
			if ran_num <= Tb_baiyu_prize[i][1] then
				if type(Tb_baiyu_prize[i][2][1]) == "table" then
					local player_body = GetBody()
					add_flag = AddItem(Tb_baiyu_prize[i][2][player_body][1],Tb_baiyu_prize[i][2][player_body][2],Tb_baiyu_prize[i][2][player_body][3],1,1,-1,-1,-1,-1,-1,-1)
				else
					add_flag = AddItem(Tb_baiyu_prize[i][2][1],Tb_baiyu_prize[i][2][2],Tb_baiyu_prize[i][2][3],1,1,-1,-1,-1,-1,-1,-1)
				end
				if add_flag == 1 then
					Msg2Player("Ch髇g m鮪g b筺  d飊g 'B竛h 輙 B筩h Ng鋍' i 頲 1 '"..Tb_baiyu_prize[i][3].."!")
					Msg2SubWorld("Ngi ch琲:"..GetName().." d飊g B竛h 輙 B筩h Ng鋍' i th祅h c玭g 1 '"..Tb_baiyu_prize[i][3].."!")
				else
					WriteLog("[T誸 an Ng? 08] ngi ch琲	"..GetName().."	T╪g"..Tb_baiyu_prize[i][3].." th蕋 b筰, k? hi謚:"..add_flag)
				end
				break
			end
		end
	else	--增加灵石
		lspf_AddLingShiInBottle(7,2)
		Msg2Player("B筺 nh薾 頲 2 vi猲 Linh th筩h c蕄 7,  cho v祇 T? Linh nh!")
	end
	zongzi_chg_astrict(1,2)
end
--御品粽子
Tb_dialog_yupin = {
	"Ta c莕 Vi猰 Ho祅g Thi誸 H錸/#yupin_use_dtm(1)",
	"Ta c莕 12 vi猲 Linh th筩h c蕄 7/#yupin_use_dtm(4)",
}
if Sever_diff == 2 then
	tinsert(Tb_dialog_yupin,"Ta c莕 Phi猲 V?/#yupin_use_dtm(2)")
	tinsert(Tb_dialog_yupin,"Ta c莕 Si猽 Quang/#yupin_use_dtm(3)")
end
tinsert(Tb_dialog_yupin,"в ta suy ngh? l筰/end_dialog")
function zongzi_yupin()
	if zongzi_chg_astrict(2,1) ~= 1 then
		return
	end
	Say("<color=green>Truy襫 nh﹏ nc S?<color>: Qu? nhi猲 l? <color=red>B竛h 輙 Ng? Ph萴<color>, l穙 phu kh玭g gi蕌 g? ngi, ch th鵦 t? ti猲 nh? ta l? th? v? c馻 nc S?, y l? <color=red>Vi猰 Ho祅g Thi誸 H錸<color> do t? ti猲 truy襫 l筰, d飊g  t筼 binh kh? th莕 th玭g, ho芻 <color=red>12 vi猲 Linh th筩h c蕄 7<color>, ho芻 <color=red>B竎h T鑓 Th莕 C﹗ (th? ci v躰h vi詎)<color>, ngi ch鋘 1 th? 甶, ngi  suy ngh? k? mu鑞 b竔 t? r錳 ch??",
	getn(Tb_dialog_yupin),
	Tb_dialog_yupin
	)
end
--粽子使用确认信息
function yupin_use_dtm(prize_diff)
	Say("<color=green>Truy襫 nh﹏ nc S?<color>: Ta c騨g bi誸 <color=red>B竛h 輙 Ng? Ph萴<color>"..Zgc_pub_sex_name().."Kh玭g d? c?, x竎 nh薾 d飊g v藅 n祔 i <color=red>"..Tb_yupin_prize[prize_diff][getn(Tb_yupin_prize[prize_diff])].."<color>!",
	2,
	"Ta x竎 nh薾 i /#yupin_chg("..prize_diff..")",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--御品奖励兑换
function yupin_chg(prize_diff)
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--携带删除监测
	for i = 1,2 do
		if zongzi_use_dtm(i,9) ~= 1 then
			return
		end
	end
	--奖励增加
	local add_flag = 0
	if prize_diff == 1 then
		add_flag = AddItem(Tb_yupin_prize[prize_diff][1],Tb_yupin_prize[prize_diff][2],Tb_yupin_prize[prize_diff][3],1)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1"..Tb_yupin_prize[prize_diff][4].."!")
		Msg2Player("Ngi ch琲 '"..GetName().." t筰 Truy襫 nh﹏ nc S?' d飊g 1 B竛h 輙 Ng? Ph萴 i 1 "..Tb_yupin_prize[prize_diff][4].."!")
	elseif prize_diff == 2 or prize_diff == 3 then
		add_flag = AddItem(Tb_yupin_prize[prize_diff][1],Tb_yupin_prize[prize_diff][2],Tb_yupin_prize[prize_diff][3],1,1,-1,-1,-1,-1,-1,-1)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 "..Tb_yupin_prize[prize_diff][4].."!")
		Msg2Player("Ngi ch琲 '"..GetName().." t筰 Truy襫 nh﹏ nc S?' d飊g 1 B竛h 輙 Ng? Ph萴 i 1 "..Tb_yupin_prize[prize_diff][4].."!")
	else
		lspf_AddLingShiInBottle(7,12)
		Msg2Player("Ngi ch琲 '"..GetName().." t筰 Truy襫 nh﹏ nc S?' d飊g 1 B竛h 輙 Ng? Ph萴 i "..Tb_yupin_prize[prize_diff][1].."!")
		add_flag = 1
	end
	if add_flag ~= 1 then
		WriteLog("[T誸 an Ng? 08] ngi ch琲	"..GetName().."	T╪g"..Tb_yupin_prize[prize_diff][4].." th蕋 b筰, k? hi謚:"..add_flag)
	end
	zongzi_chg_astrict(2,2)
end
--粽子兑换次数统一处理
function zongzi_chg_astrict(zongzi_diff,deal_diff)
	if deal_diff == 1 then
		if GetTask(Tb_zongzi_use_num[zongzi_diff][2]) >= Tb_zongzi_use_num[zongzi_diff][3] then
			Talk(1,"","<color=green>Truy襫 nh﹏ nc S?<color>: Ph莕 thng c馻 l穙 phu c? h筺, m鏸 ngi ch琲 ch? c? th? i <color=yellow>"..Tb_zongzi_use_num[zongzi_diff][1]..Tb_zongzi_use_num[zongzi_diff][3].."<color> l莕!")
			return 0
		end
	else
		local zongzi_chg_times = GetTask(Tb_zongzi_use_num[zongzi_diff][2])
		SetTask(Tb_zongzi_use_num[zongzi_diff][2],(zongzi_chg_times+1))
		Talk(1,"","<color=green>Truy襫 nh﹏ nc S?<color>: Ngi  i <color=yellow>"..(zongzi_chg_times+1).."<color> l莕 <color=yellow>"..Tb_zongzi_use_num[zongzi_diff][1].."<color>, c遪 c? th? i <color=red>"..(Tb_zongzi_use_num[zongzi_diff][3] - (zongzi_chg_times+1)).."<color> l莕!")
	end
	return 1
end
--粽子携带\删除检测
function zongzi_use_dtm(chk_flag,goods_diff)
	if chk_flag == 1 then
		if GetItemCount(2,1,Tb_zongzi_08[goods_diff][2]) == 0 then
			Talk(1,"","<color=green>Nh綾 nh?<color>: Ngi kh玭g mang theo <color=yellow>"..Tb_zongzi_08[goods_diff][1].."<color>!")
			return 0
		end
	elseif chk_flag == 2 then
		if DelItem(2,1,Tb_zongzi_08[goods_diff][2],1) ~= 1 then
			Talk(1,"","<color=green>Nh綾 nh?<color>: Ngi kh玭g mang theo <color=yellow>"..Tb_zongzi_08[goods_diff][1].."<color>!")
			return 0
		end
	end
	return 1
end
--原有粽子处理
	--粽子祭奠确认对话
	function zong_zi_up(zong_zi_id)
		Say(Tb_zong_zi_chg_dia[zong_zi_id].say,
			getn(Tb_zong_zi_chg_dia[zong_zi_id]),
			Tb_zong_zi_chg_dia[zong_zi_id]
		)
	end
	--物品兑换
	function prize_get(zong_zi_id,prize_type,prize_id)
		--通用检测
		if zong_zi_cond_chk(zong_zi_id) ~= 1 then
			return
		end
		--prize增加
		if prize_type == 1 then
			if AddItem(2,1,prize_id,1) == 1 then
				Msg2Player("Ch骳 m鮪g b筺 s? d鬾g ' "..Tb_zong_zi_info[zong_zi_id][1][1].." i ph莕 thng th祅h c玭g")
			end
		else
			if AddItem(0,prize_type,prize_id,1) == 1 then
				Msg2Player("Ch骳 m鮪g b筺 s? d鬾g ' "..Tb_zong_zi_info[zong_zi_id][1][1].." i ph莕 thng th祅h c玭g")
			end
		end
		WriteLog("07 畂an ng?- "..GetName().."S? d鬾g "..Tb_zong_zi_info[zong_zi_id][1][1].." i ph莕 thng th祅h c玭g")
	end
	--快乐粽子相关
	function happy_zongzi_prize(prize_diff)
		--数量判断
		local date_save = GetTask(happy_zong_zi_date_TaskID)
		local num_save = GetTask(happy_zong_zi_num_TaskID)
		local date_now = zgc_pub_day_turn(1)
		if date_save >= date_now and num_save >= happy_zong_zi_restrict_num then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: <color=yellow>B竛h 輙 Vui v?<color m鏸 ng祔 n g苝 ta  i <color=red>"..happy_zong_zi_restrict_num.."<color> l莕!")
			return
		end
		--开始对话
		local prize_dia = "<color=green>Di t閏 S? qu鑓<color>: <color=yellow>B竛h 輙 Vui v?<color> i <color=yellow>"..Tb_happy_zong_zi_prize_name[prize_diff].."<color> t? l? v? tr? s? nh? sau!"
		for i = 1,5 do		--五级奖励
			prize_dia = prize_dia.."\n T? l?: <color=yellow>"..Tb_happy_zong_zi_probility[1][i].."  <color> nh薾 頲 :"
			if prize_diff == 4 then
				prize_dia = prize_dia.."<color=yellow>"..Zgc_pub_money_name_change(Tb_happy_zong_zi_prize[4][i][1]).." n "..Zgc_pub_money_name_change(Tb_happy_zong_zi_prize[4][i][2]).."<color>"
			else
				prize_dia = prize_dia.."<color=yellow>"..Tb_happy_zong_zi_prize[prize_diff][i][1].." n "..Tb_happy_zong_zi_prize[prize_diff][i][2].."<color> 甶觤"
			end
		end
		Say(prize_dia,
			2,
			"Ta x竎 nh薾 i /#prize_get_dtm("..prize_diff..")",
			"в ta suy ngh? l筰/end_dialog"
			)
	end
	--快乐粽子奖励给于
	function prize_get_dtm(prize_diff)
		if GetPlayerFaction() == 0 and prize_diff == 3 then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: <color=yellow>"..Zgc_pub_sex_name().."<color> n誹 mu鑞 t╪g  c鑞g hi課 S? m玭, t鑤 nh蕋 n猲 gia nh藀 m玭 ph竔 r錳 quay l筰 y!")
			return
		end
		if GetItemCount(2,1,1126) == 0 then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: Ngi mang n c竔 qu竔 g? th?! Mu鑞 a v韎 ta ??")
			return
		end
		if DelItem(2,1,1126,1) ~= 1 then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: Ngi mang n c竔 qu竔 g? th?! Mu鑞 a v韎 ta ??")
			return
		end
		local prize_step = random(1,1000)
		for i = 1, getn(Tb_happy_zong_zi_probility[2]) do
			if prize_step <= Tb_happy_zong_zi_probility[2][i] then
				prize_step = i
				break
			end
		end
		local prize_num = random(Tb_happy_zong_zi_prize[prize_diff][prize_step][1],Tb_happy_zong_zi_prize[prize_diff][prize_step][2])
		if prize_diff == 1 then
			ModifyExp(prize_num)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..prize_num.." 甶觤 kinh nghi謒!")
		elseif prize_diff == 2 then
			ModifyReputation(prize_num,0)
		elseif prize_diff == 3 then
			SetTask(336,(GetTask(336) + prize_num))
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..prize_num.."甶觤 c鑞g hi課 s? m玭!")
		else
			Earn(prize_num)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..Zgc_pub_money_name_change(prize_num).."!")
		end
		--快乐粽子次数更新
		local date_save = GetTask(happy_zong_zi_date_TaskID)
		local num_save = GetTask(happy_zong_zi_num_TaskID)
		local date_now = zgc_pub_day_turn(1)
		if date_save < date_now then
			SetTask(happy_zong_zi_date_TaskID,zgc_pub_day_turn(1))
			SetTask(happy_zong_zi_num_TaskID,1)
			SetTask(aixiang_eat_num_TaskID,0)
			num_save = 0
		else
			SetTask(happy_zong_zi_num_TaskID,(num_save + 1))
		end
		Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: <color=yellow>B竛h 輙 Vui v?<color> m鏸 ng祔 ch? c? th? i <color=yellow>"..happy_zong_zi_restrict_num.."<color> l莕, y l? l莕 i th? <color=yellow>"..(num_save+1).."<color> trong h玬 nay!")
		WriteLog("Ho箃 ng an Ng?: Ngi ch琲 s? d鬾g 'B竛h 輙 Vui v?' i "..Tb_happy_zong_zi_prize_name[prize_diff].."("..prize_num..")")
	end
	--声望兑换
	function repute_add(zong_zi_id,add_num_min,add_num_max)
		--通用检测
		if zong_zi_cond_chk(zong_zi_id) ~= 1 then
			return
		end
		local ran_num = random(add_num_min,add_num_max)
		ModifyReputation(ran_num,0)
	end
	--免费区的幸运粽子
	function tech_book_add()
		--粽子携带检测
		if GetItemCount(2,1,1127) == 0 then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: Ngi mang n c竔 qu竔 g? th?! Mu鑞 a v韎 ta ??")
			return 0
		end
		--空间负重检测
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return 0
		end
		--粽子删除检测
		if DelItem(2,1,1127,1) ~= 1 then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: Ngi mang n c竔 qu竔 g? th?! Mu鑞 a v韎 ta ??")
			return 0
		end
		--秘籍增加
		local player_route = GetPlayerRoute() 
		local ran_num = random(1,2)
		if player_route ~= 0 then
			ran_num = (player_route * 10) + ran_num
		else
			ran_num = (Tb_player_route[random(1,getn(Tb_player_route))] *10) + ran_num
		end
		if AddItem(Tb_zongzi_teach_book[ran_num][2],Tb_zongzi_teach_book[ran_num][3],Tb_zongzi_teach_book[ran_num][4],1) == 1 then
			Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧 ' "..Tb_zongzi_teach_book[ran_num][1].."!")
		end
	end
	--粽子检测通用函数
	function zong_zi_cond_chk(zong_zi_id)
			--物品携带检测
		if GetItemCount(2,1,zong_zi_id) == 0 then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: Ngi mang n c竔 qu竔 g? th?! Mu鑞 a v韎 ta ??")
			return 0
		end
		--空间负重检测
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return 0
		end
		--物品删除检测
		if DelItem(2,1,zong_zi_id,1) ~= 1 then
			Talk(1,"","<color=green>Di t閏 S? qu鑓<color>: Ngi mang n c竔 qu竔 g? th?! Mu鑞 a v韎 ta ??")
			return 0
		end
		return 1
	end
--粽子制作说明
function zongzi_info()
	Say("<color=green>Truy襫 nh﹏ nc S?<color>: Kh玭g bi誸 ngi mu鑞 h醝 c竔 n祇?",
		4,
		"Ta ph秈 l祄 sao m韎 c? th? b竔 t? c飊g c竎 ngi/how_2_cook",
		"Ta c? th? d飊g b竛h 輙 g?  b竔 t?/which_2_use",
		"Ta mu鑞 t譵 hi觰 c竎h l祄 b竛h 輙/cook_info",
		"Ta  hi觰/end_dialog"
	)
end
--如何祭拜
function how_2_cook()
	Talk(1,"zongzi_info","<color=green>Truy襫 nh﹏ nc S?<color>: T譵 <color=green>ch? t鰑 l莡<color>, ch? 玭g ta c? nguy猲 li謚 b竛h 輙, gi? c? r蕋 h頿 l?; 甧m nguy猲 li謚 v? y, th? l祄 b竛h ? y s? gi髉 ngi l祄 <color=yellow>mi詎 ph?<color>.")
end
--用什么祭拜
function which_2_use()
	Talk(3,"zongzi_info","<color=green>Truy襫 nh﹏ nc S?<color>: N誹 l? b竛h 輙 thng th? kh玭g c莕, nh鱪g c竔 b竛h hi誱 ngi c騨g c? th? t? d飊g. N誹 ngi 甧m nh鱪g c竔 b竛h qu? di y n b竔 t?, b鋘 ta s? kh玭g b筩 i ngi u, cho ngi m閠 s? v藅 qu? hi誱.",
					"<color=green>Truy襫 nh﹏ nc S?<color>: Sau khi b竔 t? <color=yellow>B竛h 輙 B筩h Ng鋍<color> c? th? ng蓇 nhi猲 nh薾 頲 m閠 trong nh鱪g th? sau <color=red>2 vi猲 Linh th筩h c蕄 7, T祅g Ki誱 T? Kim M穙, T祅g Ki誱 Kim L? Thng, T祅g Ki誱 ? Kim Trang, T祅g Ki誱 B秓 Ch﹗, T祅g Ki誱 K? Th筩h, T祅g Ki誱 Kim 蕁<color>.",
					"<color=green>Truy襫 nh﹏ nc S?<color>: <color=yellow>B竛h 輙 Ng? Ph萴<color> sau khi b竔 t? c? th? ch鋘 <color=red>"..Tb_zongzi_08_yupin[Sever_diff].."<color> ."
			)
end
--操作说明
function cook_info()
	Talk(2,"zongzi_info","<color=green>Truy襫 nh﹏ nc S?<color>: T誸 an Ng?<color=yellow>[5/6 n 9/6]<color> c? th? h頿 <color=yellow>B竛h 輙 g筼 th琺, B竛h 輙 ng秈 hng, B竛h 輙 h箃 d?, B竛h 輙 ng? hng, B竛h 輙 Ph? Th髖, B竛h 輙 B筩h Ng鋍, B竛h 輙 Ng? Ph萴<color>. Trong th阨 gian ho箃 ng ngi ch琲 c蕄 <color=yellow>10-98<color> h頿 b竛h th? s? c? 甶觤 kinh nghi謒 d鵤 theo ng c蕄, t飝 theo s? l莕 m? 甶觤 kinh nghi謒 s? gi秏 d莕, cho n khi 甶觤 kinh nghi謒 th蕄 h琻 10 th? s? kh玭g c遪 nh薾 頲 n鱝; ngi ch琲 c蕄 <color=yellow>99<color> m鏸 l莕 h頿 s? nh薾 頲 1 vi猲 Linh th筩h ng蓇 nhi猲 t? c蕄 1-7, m鏸 ng祔 nhi襲 nh蕋 c? th? nh薾 頲 <color=yellow>20<color> vi猲. M鏸 l莕 h頿 1 c竔 b竛h u c? c? h閕 nh薾 頲 <color=yellow>Trang ph鬰 B竧 B竧<color>, m鏸 ngi nhi襲 nh蕋 c? th? nh薾 頲 1 b?. C? th? i ph莕 thng nhi襲 nh蕋 l? <color=yellow>15 l莕 B竛h 輙 B筩h Ng鋍, 5 l莕 B竛h 輙 Ng? Ph萴<color>. (<color=red>B竛h 輙 B筩h Ng鋍 v? B竛h 輙 Ng? Ph萴 ch? l祄 trong th阨 gian n祔<color>)",
		" <color=green>Truy襫 nh﹏ nc S?<color>: Sau T誸 an Ng?, c? th? ti誴 t鬰 l祄 <color=yellow>B竛h 輙 g筼 th琺, B竛h 輙 ng秈 hng, B竛h 輙 h箃 d?, B竛h 輙 ng? hng, B竛h 輙 Ph? Th髖<color>.")
end