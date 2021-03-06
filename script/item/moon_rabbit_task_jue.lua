--脚本名称：师门诀要包使用脚本
--脚本功能：玩家使用脚本后，随机给玩家增加任意一个门派的任意两本诀要
--代码编写人：村长
--代码编写时间：2007-01-28
--修改记录：小蓝打补丁
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--=================================公共变量定义区============================
jue_list = {
		{{"Thi誹 L﹎ o quy誸",2,6,1},
		{"Thi誹 L﹎ C玭 quy誸",2,6,2},
		{"Tr秏 Ma o quy誸",2,6,3},
		{"Phong C玭 quy誸",2,6,4},
		{"Kim Chung Tr竜 quy誸",2,6,5},
		{"Nhi猲 M閏 o quy誸",2,6,6},
		{"V? Thng C玭 quy誸",2,6,7},
		{"X? Th﹏ Quy誸",2,6,8},
		{"Чi Nh? Lai quy誸",2,6,9},
		{"Чt Ma V? quy誸",2,6,10},
		{"Th蕋 B秓 Chi誹 quy誸",2,6,11},
		{"La H竛 Quy襫 quy誸",2,6,12},
		{"Ca Di謕 Th鑙 quy誸",2,6,13},
		{"Hu? Nh穘 quy誸",2,6,14},
		{"Vi У quy誸",2,6,15},
		{"V╪ V﹏ quy誸",2,6,16},
		{"La H竛 Tr薾 quy誸",2,6,17},
		{"Чi Tu Di Chng",2,6,18},
		{"V? 秐h quy誸",2,6,19},
		{"Long Tr秓 Th? quy誸",2,6,20},
		{"Ph鬰 H? quy誸",2,6,21},
		{"Tu T﹎ quy誸",2,6,22},
		{"Ng? Chuy觧 Ch? quy誸",2,6,23},
		{"Ph? Ma Ch? quy誸",2,6,24},
		{"Kim Cang y誹 quy誸",2,6,25},
		{"La L玦 quy誸",2,6,26},
		{"Ph鬰 Ma Th莕 quy誸",2,6,27},
		{"V? Tng quy誸",2,6,28},
		{"S? T? H鑞g",2,6,29},
		{"Minh Ch? quy誸",2,6,30},
		{"Kim Cang Ch? quy誸",2,6,31}},
		{{"Ch? 竚 y誹 quy誸",2,6,32},
		{"T﹎ Nh穘 quy誸",2,6,33},
		{"чc Th輈h C鑤 quy誸",2,6,34},
		{"Gi秈 чc B? quy誸",2,6,35},
		{"C﹗ H錸 T躰h quy誸",2,6,36},
		{"Ph? Quan quy誸",2,6,37},
		{"Truy T﹎ Ti詎 quy誸",2,6,38},
		{"Thu Minh quy誸",2,6,39},
		{"Xuy猲 T﹎ quy誸",2,6,40},
		{"Th鑙 чc quy誸",2,6,41},
		{"筺 Ph竎h quy誸",2,6,42},
		{"B筼 Ch﹎ quy誸",2,6,43},
		{"H祄 Xa quy誸",2,6,44},
		{"T醓 M謓h Ch﹎ quy誸",2,6,45},
		{"M穘 Thi猲 V? quy誸",2,6,46}},
		{{"Quan  Quy誸",2,6,47},
		{"Nga My Ph藅 quy誸",2,6,48},
		{"Ng鋍 N? Ki誱 quy誸",2,6,49},
		{"ч Nguy猲 Quy誸",2,6,50},
		{"Ph藅 Ph? quy誸",2,6,51},
		{"Li猲 Hoa quy誸",2,6,52},
		{"Thanh Ph筺 quy誸",2,6,53},
		{"L璾 Th駓 y誹 quy誸",2,6,54},
		{"Ph? T? quy誸",2,6,55},
		{"B蕋 Di謙 quy誸",2,6,56},
		{"Ph藅 Chi課 quy誸",2,6,57},
		{"Ph藅  quy誸",2,6,58},
		{"Чi Bi quy誸",2,6,59},
		{"T飝 Kh骳 quy誸",2,6,60},
		{"Kh骳 Ngh? quy誸",2,6,61},
		{"Nguy謙 Th鵦 Kh骳 quy誸",2,6,62},
		{"筺 Th駓 quy誸",2,6,63},
		{"T躰h D? T? quy誸",2,6,64},
		{"D? Nhi評 quy誸",2,6,65},
		{"Dng Tam quy誸",2,6,66},
		{"Ph骳 Th駓 ph竝",2,6,67},
		{"Ph蒼 C莔 quy誸",2,6,68},
		{"? D? б quy誸",2,6,69},
		{"M? T﹎ Kh骳 quy誸",2,6,70}},
		{{"C竔 Bang Chng quy誸",2,6,71},
		{"Th玭g T? quy誸",2,6,72},
		{"Thi猲 C﹏ quy誸",2,6,73},
		{"B? Vng quy誸",2,6,74},
		{"T醓 H莡 Th? quy誸",2,6,75},
		{"Ti猽 Dao Du quy誸",2,6,76},
		{"L鬰 H頿 y誹 quy誸",2,6,77},
		{"T髖 謕",2,6,78},
		{"T髖 Quy襫",2,6,79},
		{"C竔 Bang C玭 quy誸",2,6,80},
		{"Khu X? quy誸",2,6,81},
		{"Kh蕋 Th秓 quy誸",2,6,82},
		{"N? Thu quy誸",2,6,83},
		{"Di謚 Th? Quy誸",2,6,84},
		{"Th﹗ Chuy觧 quy誸",2,6,85},
		{"T? Gi竝 quy誸",2,6,86},
		{"Th﹗ Ho竛 quy誸",2,6,87},
		{"Ф C萿 quy誸",2,6,88}},
		{{"V? ng Ki誱 quy誸",2,6,89},
		{"L璾 Quang Ki誱 quy誸",2,6,90},
		{"V? Μng Ki誱 quy誸",2,6,91},
		{"Nhu V﹏ Ki誱 quy誸",2,6,92},
		{"Li謙 Di謒 Ki誱 quy誸",2,6,93},
		{"B玭 Ph竝 quy誸",2,6,94},
		{"V? Ng? Ph竝 quy誸",2,6,95},
		{"Th竔 Thanh Ki誱 quy誸",2,6,96},
		{"Tri襫 Ki誱 quy誸",2,6,97},
		{"L筩 Ki誱 quy誸",2,6,98},
		{"T輈h Dng Ki誱 quy誸",2,6,99},
		{"Huy襫 Ki誱 Tr薾 quy誸",2,6,100},
		{"Ng? Ki誱 quy誸",2,6,101},
		{"Ch輓h Lng ki誱 quy誸",2,6,102},
		{"Th竔 蕋 Ki誱 quy誸",2,6,103},
		{"Th藀 Tam Ki誱 quy誸",2,6,104},
		{"Huy襫  Ki誱 quy誸",2,6,105},
		{"Thi猲 Thu莕 ki誱 quy誸",2,6,106},
		{"B竧 Qu竔 Ki誱 quy誸",2,6,107},
		{"Th蕋 Ti謙 Ki誱 quy誸",2,6,108},
		{"B髏 Ph竝 quy誸",2,6,109},
		{"Th竔 Ti猽 C玭g quy誸",2,6,110},
		{"L鬰 H鉧 C玭g quy誸",2,6,111},
		{"Th? V﹏ Tung quy誸",2,6,112},
		{"Th蕋 Tinh Tr薾",2,6,113},
		{"Thi誹 Dng Quy誸",2,6,114},
		{"Thi誹  Quy誸",2,6,115},
		{"B綾 u Tr薾 quy誸",2,6,116},
		{"T祅 秐h Quy誸",2,6,117},
		{"C祅 Kh玭 Quy誸",2,6,118},
		{"Thng Thanh C玭g quy誸",2,6,119}},
		{{"Thng Ph竝 quy誸",2,6,120},
		{"Ph? Phong Thng quy誸",2,6,121},
		{"Ng? M? quy誸",2,6,122},
		{"B玭 Lang Thng quy誸",2,6,123},
		{"Chi課 мnh quy誸",2,6,124},
		{"X秓 Chi課 quy誸",2,6,125},
		{"Thi猲 Ho祅h Thng quy誸",2,6,126},
		{"Anh H飊g quy誸",2,6,127},
		{"Фo H秈 Thng quy誸",2,6,128},
		{"Ng? M? quy誸",2,6,129},
		{"B輈h Thng quy誸",2,6,130},
		{"Cung Ph竝 quy誸",2,6,131},
		{"Li猲 X? Thu藅 quy誸",2,6,132},
		{"Tr薾 Li謚 quy誸",2,6,133},
		{"H錳 Long Ti詎 quy誸",2,6,134},
		{"Tri襫 V﹏ Ti詎 quy誸",2,6,135},
		{"K? M玭 чn quy誸",2,6,136},
		{"Kh? Ti詎 quy誸",2,6,137},
		{"To竔 Ti詎 quy誸",2,6,138},
		{"Huy詎 Th莕 quy誸",2,6,139},
		{"T鬰 M謓h quy誸",2,6,140},
		{"L璾 Tuy謙 Ti詎 quy誸",2,6,141}},
		{{"B? ki誴 Ng? чc o Ph竝",2,6,142},
		{"B? ki誴 D蒼 H錸 Ch?",2,6,143},
		{"B? ki誴 Thao Thi Thu藅",2,6,144},
		{"B? ki誴 Thi чc Thu藅",2,6,145},
		{"B? ki誴 Thi B閏 Чi Ph竝",2,6,146},
		{"B? ki誴 T藀 Thi T? Kh?",2,6,147},
		{"B? ki誴 Ng? Thi Thu藅",2,6,148},
		{"B? ki誴 V筺 чc 箃 M謓h o",2,6,149},
		{"B? ki誴  T? H蕄 H錸 Kh?",2,6,150},
		{"B? ki誴 Th玦 Thi T? Kh?",2,6,151},
		{"B? ki誴 T? Linh Чi Ph竝",2,6,152},
		{"B? ki誴 T? чc C玭g",2,6,153},
		{"B? ki誴 Thi Li謙 Ma C玭g",2,6,154},
		{"B? ki誴 H? C? M藅 Phng",2,6,155},
		{"B? ki誴 Phong C?",2,6,156},
		{"B? ki誴 Dng C? B? Thu藅",2,6,157},
		{"B? ki誴 Cu錸g Phong Tr秓",2,6,158},
		{"B? ki誴 чc C?",2,6,159},
		{"B? ki誴 Huy誸 жnh C玭g",2,6,160},
		{"B? ki誴 Huy誸 C?",2,6,161},
		{"B? ki誴 Hng C?",2,6,162},
		{"B? ki誴 Thi C?",2,6,163},
		{"B? ki誴 Y猽 C?",2,6,164},
		{"B? ki誴 T﹎ C?",2,6,165},
		{"B? ki誴 V筺 C? Th鵦 Thi猲",2,6,166},
		{"B? ki誴 Huy詎 C?",2,6,167},
		{"B? ki誴 T祄 C?",2,6,168}},
}
jue_id = {	{607,"T骾 b? ki誴 Thi誹 L﹎"},
			{608,"T骾 b? ki誴 Л阯g M玭"},
			{609,"T骾 b? ki誴 Nga My"},
			{610,"T骾 b? ki誴 C竔 Bang"},
			{611,"T骾 b? ki誴 V? ng"},
			{612,"T骾 b? ki誴 Dng M玭"},
			{613,"T骾 b? ki誴 Ng? чc"}}
--==================================脚本主逻辑区=============================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i =1, getn(jue_id) do
		if goods_id == jue_id[i][1] then
			goods_diff = i
			break
		end
	end
	Say("Mu鑞 x竎 nh薾 s? d鬾g"..jue_id[goods_diff][2].." kh玭g? C? th? thu 頲 5 quy觧 tng 鴑g c馻 y誹 quy誸.",2,
	"фi/#goods_use_det("..goods_diff..")",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--***********************************物品使用区******************************
function goods_use_det(goods_diff)
	if Zgc_pub_goods_add_chk(5,50) ~= 1 then		--空间/负重判断
		Talk(1,"","Xin m阨 x竎 nh薾 h祅h trang kh玭g qu? t秈 ho芻  ch? tr鑞g!")
		return
	end
	if GetItemCount(2,0,jue_id[goods_diff][1]) == 0 then
		Talk(1,"","Xin x竎 nh薾 trong h祅h trang c? <color=red>"..jue_id[goods_diff][2].."<color>!")
		return
	end
	if DelItem(2,0,jue_id[goods_diff][1],1) ~= 1 then
		Talk(1,"","Xin x竎 nh薾 trong h祅h trang c? <color=red>"..jue_id[goods_diff][2].."<color>!")
		return
	else
		for i = 1, 5 do
			local ran_num = random(1,getn(jue_list[goods_diff]))
			local add_flag = AddItem(jue_list[goods_diff][ran_num][2],jue_list[goods_diff][ran_num][3],jue_list[goods_diff][ran_num][4],1)
			if add_flag == 1 then
				Msg2Player("Nh薾 頲 1 :\""..jue_list[goods_diff][ran_num][1].."\"")
			else
				WriteLog(GetName().."Nh薾 頲 ph莕 thng:"..jue_list[goods_diff][ran_num][1].."Th猰 th蕋 b筰, k? hi謚:"..add_flag)
			end
		end
	end	
end
