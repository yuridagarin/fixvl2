--脚本名称：灵魄和灵能附着公共脚本
--脚本功能：灵魄和灵能公共变量和函数集合
--策划人：王强
--代码开发人：村长
--代码开发时间：2008-1-12
--代码修改记录：
	--资质相关信息
	Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数

	Sever_diff = 2		--1为收费区，2为免费区
	Break_sky_get_sec_seq_TaskID = 1417
	Consume_get_sec_seq_TaskID = 1421
	Aptitue_cent_TasktempID = 196
	Aptitue_seq_save_1_TasktempID = 197
	Aptitue_seq_save_10_TasktempID = 198
	Weapon_index_save_TasktempID = 199
	--IB相关信息
	IB_cost_month_seq = 1418
	IB_cost_num = 1419
	Tb_aptitude_num = {{7},{250},{},{15000},{3},{15000},{0,79},{80,100},{},{10},{},{2000,200000},{101,150},}
	Tb_aptitude_info = {
		{"ч cng h鉧 v? kh? t "..Tb_aptitude_num[1][1],																"return weapon_level_chk()",		"Thi誸 C鑤, h祇 quang xanh nh箃 (Linh ph竎h c蕄 1)",	1,1,"ч cng h鉧 v? kh? t <color=yellow>"..Tb_aptitude_num[1][1].."<color>","Thi誸 C鑤",30},
		{"Чi h閕 t? v? H筺g 2-10 l璾 ph竔",																													"return bw_seq_chk(2)",				"B竎h chi課, sng m?  (Linh ph竎h c蕄 2)",6,2,"Чi h閕 t? v? H筺g <color=yellow>2-10<color>","B竎h Chi課",7},
		{"?! V? kh? Ho祅g Kim l蕄 l竛h!",																															"return golden_weapon_chk()",	"Chc Nh藅, sng m? v祅g (Linh ph竎h c蕄 2)",	2,2,"  trang b? <color=yellow>trang b? Ho祅g Kim<color>","Chc Nh藅",30},
		{"ч c鑞g hi課 t "..Tb_aptitude_num[4][1],													"return tech_offer_num_chk()",	"Tu蕁 D藅, sng m? lam (Linh ph竎h c蕄 2)",	2,2,"觤 c鑞g hi課 s? m玭 t n <color=yellow>"..Tb_aptitude_num[4][1].."<color>","Tu蕁 D藅",30},
		{"Ъng c蕄 s? c ta  t (vt) c蕄 "..Tb_aptitude_num[5][1]..",  ta d箉!",								"return teah_prentice_chk()",		"Уo L?, sng m? l鬰 (Linh ph竎h c蕄 2)",	2,2,"Ъng c蕄 s? c t c蕄 <color=yellow>"..Tb_aptitude_num[5][1].."<color>","Уo L?",30},
		{"Ta l? danh nh﹏, danh v鋘g t n (vt) "..Tb_aptitude_num[6][1],																	"return repute_num_chk()",			"Danh T骳, sng m? n﹗ (Linh ph竎h c蕄 2)",	2,2,"Danh v鋘g t n <color=yellow>"..Tb_aptitude_num[6][1].."<color> 甶觤","Danh T骳",30},
		{"Ta b薾 l? b? b竧 qu竔 Linh Kh? 筺 th蕄 ("..Tb_aptitude_num[7][1].."-"..Tb_aptitude_num[7][2]..")",			"return equipment_lin_chk(7) ",	"L筩 H?, sng m? t輒 v? h祇 quang lam (Linh ph竎h c蕄 2)",	2,1,"Х trang b? b? b竧 qu竔 Linh Kh? 筺 th蕄","L筩 H?",30},
		{"Xem b? b竧 qu竔 Linh Kh? 筺 trung ("..Tb_aptitude_num[8][1].."-"..Tb_aptitude_num[8][2]..")! D飊g r蕋 t鑤!","return equipment_lin_chk(8) ",	"L╪g Ti猽, sng m? t輒 v? tia s竛g l鬰 (Linh ph竎h c蕄 2)",	2,2,"Х trang b? b? b竧 qu竔 Linh Kh? 筺 trung (80-100)","L╪g Ti猽",30},
		{"Чi Tng Qu﹏ 琻g tri襲 l? t筰 h?!",																															"return general_chk()",					"筺 Giao, 竛h s竛g ph竧 t竛  (Linh ph竎h c蕄 3)",	3,6,"Qu﹏ h祄 chi課 trng l?: <color=yellow>Tng Qu﹏<color> (g錷 Tng Qu﹏ v躰h vi詎)","筺 Giao",30},
		{"Ta kinh nghi謒 y m譶h, b秐g x誴 h筺g th? gi韎 h筺g "..Tb_aptitude_num[10][1].."!!",															"return player_rank_chk() ",			"C竔 Th?, 竛h s竛g ph竧 t竛 lam (Linh ph竎h c蕄 3)",	3,4,"B秐g x誴 h筺g th? gi韎 h筺g <color=yellow>"..Tb_aptitude_num[10][1].."<color>","C竔 Th?",30},
		{"To gan! Th蕐 b鎛 Nguy猲 So竔 c遪 kh玭g qu? xu鑞g?",																												"return marshal_chk()",					"Ph? Qu﹏, 竛h s竛g t? h閕 t輒 (Linh ph竎h c蕄 4)",	4,8,"Qu﹏ h祄 chi課 trng l?: <color=yellow>Nguy猲 So竔<color> (g錷 Nguy猲 So竔 v躰h vi詎)","Ph? Qu﹏",30},
		{"Чi h閕 t? v? h筺g 1 l璾 ph竔",																													"return bw_seq_chk(1)",				"Tinh Di, 竛g s竛g ph竧 t竛 t輒 (Linh ph竎h c蕄 3)",7,3,"Чi h閕 t? v? h筺g <color=yellow>1<color> l璾 ph竔","Tinh Di",7},
		{"Чo trng c? th? ch筸 nh? v祇 b? b竧 qu竔 Linh Kh? 筺 cao ("..Tb_aptitude_num[13][1].." tr? l猲) c馻 ta",							"return equipment_lin_chk(13)",	"Ph莕 V﹏, sng m? t輒 v? tia s竛g v祅g (Linh ph竎h c蕄 2)",2,3,"Х trang b? b? b竧 qu竔 Linh Kh? 筺 (100) tr? l猲","Ph莕 V﹏",30},
		{"",																																								"return consume_num_chk()",		"H祇 M玭, 竛h s竛g t? h閕 v祅g (Linh ph竎h c蕄 4)",	4,7,"","H祇 m玭",30},
	}
	if Sever_diff == 1 then
		Tb_aptitude_info[getn(Tb_aptitude_info)][1] = "觤 t輈h l騳 ti猽 d飊g c馻 ta  g鉷 r蕋 nhi襲!"
		Tb_aptitude_info[getn(Tb_aptitude_info)][6]  = "<color=yellow>2000<color> 甶觤 t輈h l騳 ti猽 d飊g"
	else
		Tb_aptitude_info[getn(Tb_aptitude_info)][1] = "觤 t輈h l騳 ti猽 d飊g c馻 ta  g鉷 r蕋 nhi襲!"
		Tb_aptitude_info[getn(Tb_aptitude_info)][6]  = "<color=yellow>20 v筺<color> 甶觤 t輈h l騳 ti猽 d飊g"
	end
	Tb_ib_money = {"1 b筩 l?","1 Xu"}
	--撼天信息
	Break_sky_need_cent = 26
	--材料信息
	Tb_add_mertiral = {
	{2,1,3330,"Nh蕋 Thi觤 Y猽 Ho祅g"},
	{2,1,3331,"Tam Di謚 Long Hi"},
	{2,1,3332,"ч Nguy謙 Th莕 Sa"},
	{2,1,3333,"Ph莕 Quang Th莕 Sa"},
	{2,1,3334,"Tr秏 Tinh Th莕 Sa"},
	{2,1,3204," Ng? Th竔 Lung T髖"},
	{2,1,3205,"Th蕋 Huy襫 T? V╪"},
}
	--特效消耗信息
	Tb_aptitude_cost_info = {
		{	--收费
			{20,30,1},
			{50,35,1},
			{1000,30,2},
			{2000,50,6},
			{5000,20,7},
			{0,0,0},
			{0,0,0},
		},			
		{	--免费
			{30,30,1},
			{75,35,1},
			{1500,30,2},
			{3000,50,6},
			{7500,30,7},
			{0,0,0},
			{0,0,0},
		},			
	}
	--黄金武器信息
	Tb_golden_weapon_info = {
		{0,3,6001,"Ph? Y猲 產o"},
		{0,5,6002,"Ph? Y猲 c玭"},
		{0,8,6003,"Ph? Y猲 trng"},
		{0,0,6004,"H祄 Y猲 th?"},
		{0,1,6005,"T祅g Y猲 ch﹎"},
		{0,2,6006,"Phi Y猲 ki誱"},
		{0,10,6007,"V薾 Y猲 c莔"},
		{0,0,6008,"V﹏ Y猲 th?"},
		{0,5,6009,"L璾 Y猲 c玭"},
		{0,2,6010,"Huy襫 Y猲 ki誱"},
		{0,9,6011,"V? Y猲 b髏"},
		{0,6,6012,"H? Ti猰 Thng"},
		{0,4,6013,"H祅h Y猲 Cung"},
		{0,7,6014,"Tr鋍 Y猲 nh蒼"},
		{0,11,6015,"Y猽 Y猲 tr秓"},
		{0,3,8801,"Hi猲 Vi猲 To竔 V? o"},
		{0,5,8802,"Hi猲 Vi猲 To竔 V? C玭"},
		{0,8,8803,"Hi猲 Vi猲 C鰑 Nh? Trng"},
		{0,0,8804,"Hi猲 Vi猲 H筼 Nhi猲 Th?"},
		{0,1,8805,"Hi猲 Vi猲 ch﹎ v? h譶h"},
		{0,2,8806,"Hi猲 Vi猲 T? Tinh Ki誱"},
		{0,10,8807,"Hi猲 Vi猲 Ph鬾g Ho祅g C莔"},
		{0,0,8808,"Hi猲 Vi猲 Ng? Nh筩 Th?"},
		{0,5,8809,"Hi猲 Vi猲 Ph? Thi猲 C玭"},
		{0,2,8810,"Hi猲 Vi猲 H錸g Qu﹏ Ki誱"},
		{0,9,8811,"Hi猲 Vi猲 Sinh T? B髏"},
		{0,6,8812,"Hi猲 Vi猲 Ph? Qu﹏ Thng"},
		{0,4,8813,"Hi猲 Vi猲 Khai Thi猲 Cung"},
		{0,7,8814,"Hi猲 Vi猲  Dng Nh蒼"},
		{0,11,8815,"Hi猲 Vi猲 U Minh Tr秓"},
		{0,3,2351,"T? Quang B? Vng o"},
		{0,5,2352,"T? Quang B? Vng C玭"},
		{0,8,2353,"T? Quang B? б Trng"},
		{0,0,2354,"T? Quang Ph鬰 Ma Th?"},
		{0,1,2355,"T? Quang L璾 V﹏ Ch﹎"},
		{0,2,2356,"T? Quang Huy襫 Minh Ki誱"},
		{0,10,2357,"T? Quang Ti猽 Tng C莔"},
		{0,0,2358,"T? Quang Gi竛g Long Th?"},
		{0,5,2359,"T? Quang H祅h V﹏ C玭"},
		{0,2,2360,"T? Quang Lng Nghi Ki誱"},
		{0,9,2361,"T? Quang 筺 V╪ B髏"},
		{0,6,2362,"T? Quang Tr蕁 Qu﹏ Thng"},
		{0,4,2363,"T? Quang Xuy猲 Dng Cung"},
		{0,7,2364,"T? Quan O竛 Linh Nh蒼"},
		{0,11,2365,"T? Quang V筺 чc Tr秓"},
    {0,3,241,"Чt Ma Th? T鋋 д Th輈h o"},
    {0,3,242,"Чt Ma Th? T鋋 д Th輈h o"},
    {0,5,241,"Чt Ma Th? T鋋 д Th輈h C玭"},
    {0,5,242,"Чt Ma Th? T鋋 д Th輈h C玭"},
    {0,8,341,"T祅g Kinh Th? To? Huy襫 Trng"},
    {0,8,342,"T祅g Kinh Th? To? Huy襫 Trng"},
    {0,0,441,"La H竛 Th? To? Ch輓h Gi竎 Th?"},
    {0,0,442,"La H竛 Th? To? Ch輓h Gi竎 Th?"},
    {0,1,641,"Thi猲 Th? Th莕 V? Ti襪 萵 Ch﹎"},
    {0,1,642,"Thi猲 Th? Th莕 V? Ti襪 萵 Ch﹎"},
    {0,1,643,"Thi猲 Th? Th莕 V? Ti襪 萵 Ch﹎"},
    {0,1,644,"Thi猲 Th? Th莕 V? Ti襪 萵 Ch﹎"},
    {0,2,841,"Kim Quang Th竛h N? Ph藅 L? Ki誱"},
    {0,2,842,"Kim Quang Th竛h N? Ph藅 L? Ki誱"},
    {0,10,941,"Thi猲  Th竛h N? Ph藅 V薾 C莔"},
    {0,10,942,"Thi猲  Th竛h N? Ph藅 V薾 C莔"},
    {0,0,1141,"Ch蕄 Ph竝 Ph? T玭 Th?"},
    {0,0,1142,"Ch蕄 Ph竝 Ph? T玭 Th?"},
    {0,0,1143,"Ch蕄 Ph竝 Ph? T玭 Th?"},
    {0,0,1144,"Ch蕄 Ph竝 Ph? T玭 Th?"},
    {0,5,1241,"Chng B鎛g Long Ch髇g C玭"},
    {0,5,1242,"Chng B鎛g Long Ch髇g C玭"},
    {0,5,1243,"Chng B鎛g Long Ch髇g C玭"},
    {0,5,1244,"Chng B鎛g Long Ch髇g C玭"},
    {0,2,1441,"Thng Thanh Th莕 Kh玭g Ki誱"},
    {0,2,1442,"Thng Thanh Th莕 Kh玭g Ki誱"},
    {0,2,1443,"Thng Thanh Th莕 Kh玭g Ki誱"},
    {0,2,1444,"Thng Thanh Th莕 Kh玭g Ki誱"},
    {0,9,1541,"T? Ti猽 Ng? Kh玭g B髏"},
    {0,9,1542,"T? Ti猽 Ng? Kh玭g B髏"},
    {0,9,1543,"T? Ti猽 Ng? Kh玭g B髏"},
    {0,9,1544,"T? Ti猽 Ng? Kh玭g B髏"},
    {0,6,1741,"Tr蕁 Qu﹏ V? Song Thng"},
    {0,6,1742,"Tr蕁 Qu﹏ V? Song Thng"},
    {0,6,1743,"Tr蕁 Qu﹏ V? Song Thng"},
    {0,6,1744,"Tr蕁 Qu﹏ V? Song Thng"},
    {0,4,1841,"Chinh L? B? Gi? Cung"},
    {0,4,1842,"Chinh L? B? Gi? Cung"},
    {0,4,1843,"Chinh L? B? Gi? Cung"},
    {0,4,1844,"Chinh L? B? Gi? Cung"},
    {0,7,2041,"Di猰 La T玭 Gi? Ma H錸 Nh蒼"},
    {0,7,2042,"Di猰 La T玭 Gi? Ma H錸 Nh蒼"},
    {0,7,2043,"Di猰 La T玭 Gi? Ma H錸 Nh蒼"},
    {0,7,2044,"Di猰 La T玭 Gi? Ma H錸 Nh蒼"},
    {0,11,2141,"C? чc T玭 Gi? Ph? Thi猲 Tr秓"},	
    {0,11,2142,"C? чc T玭 Gi? Ph? Thi猲 Tr秓"},	
    {0,11,2143,"C? чc T玭 Gi? Ph? Thi猲 Tr秓"},	
    {0,11,2144,"C? чc T玭 Gi? Ph? Thi猲 Tr秓"},			
		{0,3,8851,"T? Quang To竔 V? o"},
		{0,5,8852,"T? Quang To竔 V? C玭"},
		{0,8,8853,"T? Quang C鰑 Nh? Trng"},
		{0,0,8854,"T? Quang H筼 Nhi猲 Th?"},
		{0,1,8855,"T? Quang V? H譶h Ch﹎"},
		{0,2,8856,"T? Quang T? Tinh Ki誱"},
		{0,10,8857,"T? Quang Ph鬾g Ho祅g C莔"},	
		{0,0,8858,"T? Quang Ng? Nh筩 Th?"},
		{0,5,8859,"T? Quang Ph? Thi猲 C玭"},
		{0,2,8860,"T? Quang H錸g Qu﹏ Ki誱"},
		{0,9,8861,"T? Quang Sinh T? B髏"},
		{0,6,8862,"T? Quang Ph? Qu﹏ Thng"},
		{0,4,8863,"T? Quang Khai Thi猲 Cung"},
		{0,7,8864,"T? Quang  Dng Nh蒼"},
		{0,11,8865,"T? Quang U Minh Tr秓"}	
	}
	
	Npc_name = "<color=green>Long Quang Ch﹏ Nh﹏<color>: "
--流派与灵能的对应信息
	Tb_route_point_info = {}
	Tb_route_point_info[2]={3,2}
	Tb_route_point_info[3]={6,2}
	Tb_route_point_info[4]={6,4}
	Tb_route_point_info[14]={6,5}
	Tb_route_point_info[15]={5,4}
	Tb_route_point_info[8]={2,6}
	Tb_route_point_info[9]={6,4}
	Tb_route_point_info[12]={4,5}
	Tb_route_point_info[11]={3,2}
	Tb_route_point_info[17]={3,2}
	Tb_route_point_info[18]={4,3}
	Tb_route_point_info[20]={4,3}
	Tb_route_point_info[21]={5,6}
	Tb_route_point_info[6]={4,3}
	Tb_point_name = {"","G﹏ c鑤","S鴆 m筺h","Th﹏ ph竝","Linh ho箃","N閕 c玭g ",}
--灵能消耗表
	Tb_blity_cost_name =  {
			{	
				{"Xu"},
				{"Tinh luy謓 B╪g Th筩h",2,1,533},
				{"V? Ng蕁 Th駓",2,1,503},
				{"N? Oa Tinh Th筩h",2,1,504},
			},
			{	
				{"B祅 Long b輈h",2,1,1000},
				{"Th? Th﹏ ph?",2,0,556},
				{"V? Ng蕁 Th駓",2,1,503},
				{"H遖 Th? B輈h",2,1,1001},
			},
	}
	Tb_ability_cost_num = {
		{
			{20,30,50},
			{100,150,150},
			{300,450,300},
			{450,650,500},
			{700,1000,600},
			{35,20,50},
			{150,150,100},
		},
		{
			{20,30,50},
			{100,150,150},
			{300,450,300},
			{450,650,500},
			{700,1000,600},
			{35,60,60},
			{150,150,100},
		}
	}
	--附着魔法属性的消耗
	Tb_ability_magic_goods_cost_num = {
	{	{},{},
		{9,18,27,36,45,0,0},
		{4,8,12,16,20,0,0},
		{4,8,12,16,20,0,0},
	}, 
	{	{},{},
		{9,18,27,36,45,0,0},
		{5,10,15,20,25,0,0},
		{4,8,12,16,20,0,0}, 
	}
	}
--灵能数值信息
Tb_lin_ability_info = {
	{"T╪g 甶觤 sinh l鵦",500,500},
	{"T╪g 甶觤 to祅 thu閏 t輓h",3,3},
	{"T╪g 甶觤 thu閏 t輓h l璾 ph竔",6,6},
}
------------------------------------------资质判断函数集合-------------------------------------
--武器强化7
function weapon_level_chk()
	--武器强化等级判断
	local weapon_index = GetPlayerEquipIndex(2)
	local equip_level = GetEquipAttr(weapon_index,2)
	if equip_level >= Tb_aptitude_num[1][1] then
		return 1
	else
		return 0
	end
end
--切磋积分(当前没有开，暂时闲置)
function bw_seq_chk(chk_flag)
	local week_seq,bw_seq_diff,bw_seq = GetPlayerBwRank()
	if chk_flag == 1 and bw_seq == 1 then
		return 1
	elseif chk_flag == 2 and (bw_seq >=2 and bw_seq <= 10) then
		return 1
	else
		return 0
	end		
end
--黄金武器
function golden_weapon_chk()
	--武器ID获取
	local weapon_id_1st,weapon_id_2nd,weapon_3rd = GetPlayerEquipInfo(2)
	local golden_weapon_chk_flag = 0
	for i = 1, getn(Tb_golden_weapon_info) do
		if Tb_golden_weapon_info[i][1] == weapon_id_1st and Tb_golden_weapon_info[i][2] == weapon_id_2nd and Tb_golden_weapon_info[i][3] == weapon_3rd then
			golden_weapon_chk_flag = 1
		end
	end
	if golden_weapon_chk_flag == 0 then
		return 0
	else
		return 1
	end
end
--师门贡献度
function tech_offer_num_chk()
	local tech_num = GetTask(336)
	if tech_num >= Tb_aptitude_num[4][1] then
		return 1
	else
		return 0
	end
end
--师德等级
function teah_prentice_chk()
	local table_temp = GetMPBaseInfo()
	if table_temp["moral"] >= (Tb_aptitude_num[5][1] * 100)then
		return 1
	else
		return 0
	end
end
--声望
function repute_num_chk()
	if GetReputation() >= Tb_aptitude_num[6][1] then
		return 1
	else
		return 0
	end
end
--八卦套
function equipment_lin_chk(aptitue_seq)
	local weapon_index = GetPlayerEquipIndex(2)
	--是否是八卦套
	if IsSlaveItem(weapon_index) ~= 1 then
		return 0
	end
	--灵气值(平均值)是否达到要求
	local lin_num_cout = 0
	for i = 0,3 do
		lin_num_cout = lin_num_cout + GetItemMaxLingQi(GetPlayerEquipIndex(i))
	end
	local lin_num_average = lin_num_cout/4
	if lin_num_average >= Tb_aptitude_num[aptitue_seq][1] and lin_num_average <= Tb_aptitude_num[aptitue_seq][2] then
		return 1
	else
		return 0
	end
end
--将军判断
function general_chk()
	if abs(GetTask(704)) == 5 or (GetTask(766) +GetTask(765)) >= 10 then
		return 1
	else
		return 0
	end
end
--元帅判断
function marshal_chk()
	if abs(GetTask(704)) == 6 or GetTask(765) >= 15 then
		return 1
	else
		return 0
	end
end
--等级排名判断
function player_rank_chk()
	local player_rank_seq = GetPlayerWorldRank(PlayerIndex)
	if player_rank_seq == nil then
		return 0
	end
	if player_rank_seq >= 1 and player_rank_seq <= Tb_aptitude_num[10][1] then
		return 1
	else
		return 0
	end
end
--消费积分（明天做）
function consume_num_chk()
	--local month_seq_saved = GetTask(IB_cost_month_seq)
	--local month_seq_now = tonumber(date("%Y%m"))
	--if month_seq_now > month_seq_saved then
	--	SetTask(month_seq_saved,month_seq_now)
	--	SetTask(IB_cost_num,0)
	--	return 0
	--elseif month_seq_now < month_seq_saved then
	--	return 0
	--else
		if GetTask(IB_cost_num) >= Tb_aptitude_num[12][Sever_diff] then
			return 1
		end
	--end
end
--武器更换检测
function weapon_cha_chk()
	local weapon_index = GetPlayerEquipIndex(2)
	local weapon_index_saved = GetTaskTemp(Weapon_index_save_TasktempID)
	--武器装备判断
	if  weapon_index == 0 then
		Talk(1,"",Npc_name.."H穣 trang b? v? kh? trc r錳 n t譵 ta!")
		return 0
	end
	--武器配对检测
	if weapon_index_saved ~= weapon_index then
		Talk(1,"",Npc_name..Zgc_pub_sex_name().."чng t竎 i v? kh? nhanh l緈, nh璶g kh玭g qua 頲 m総 l穙 phu!")
		return 0
	end
	return 1
end
