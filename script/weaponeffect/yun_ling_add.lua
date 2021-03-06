--脚本名称：蕴灵外装处理脚本
--脚本功能：处理蕴灵外装的相关功能
--功能策划：奶妈
--功能开发：村长
--开发时间：2008-11-5
--修改记录：
--公共变量定义区
--服务器区分
Tb_special_mertiral = {
	{2,1,503,"V? Ng蕁 Th駓","c竔"},
	{2,0,555,"C祅 Kh玭 ph?","Trng"},
}
--蕴灵消耗表
Tb_yunling_consume = {
	{		--收费区
		--特效材料(数量、材料)--其它消耗
			{		{50,1},				1000000	},
			{		{10,2},				{1,1}		},
			{		{5,6},					{4,2}		},
			{		{1,7},					{18,2}		},
	},
	{		--收费区
		--特效材料(数量、材料)--其它消耗
		{		{50,1},				1500000},
		{		{10,2},				{1,1},1500000},
		{		{5,6},					{5,2}	},
		{		{1,7},					{20,2}	},
	},
}
--外装名称
Tb_coat_name = {
	[6] = "Ngo筰 trang",
	[7] = "Thng y",
	[8] = "Ngo筰 trang",
}
--蕴灵属性表
Tb_yunling_att = {
	--专属属性
	{
		part_id = 6,
		name = "ч ch輓h x竎 t╪g ",
		level  = {1,2,3},
		num = {30,200,250},
		id = {573,307,574},
		id_level = {1,1,2},		
	},
	{
		part_id = 7,
		name = "N閕 ngo筰 c玭g t╪g ",
		level  = {1,2,3},
		num = {2,8,11},
		id = {575,575,576},
		id_level = {1,7,3},		
	},	
	{
		part_id = 8,
		name = "Sinh l鵦 t╪g t鑙 產 ",
		level  = {1,2,3},
		num = {3,9,15},
		id = {253,253,253},
		id_level = {1,3,5},		
	},	
	{
		part_id = 8,
		name = "N閕 l鵦 t╪g t鑙 產 ",
		level  = {1,2,3},
		num = {3,9,15},
		id = {254,254,254},
		id_level = {1,3,5},		
	},	
	--通用属性
	{
		name = "S鴆 m筺h t╪g ",
		level  = {1,2,3},
		num = {5,25,50},
		id = {246,246,569},
		id_level = {1,5,5},		
	},
	{
		name = "N閕 c玭g t╪g ",
		level  = {1,2,3},
		num = {5,25,50},
		id = {249,249,572},
		id_level = {1,5,5},		
	},
	{
		name = "G﹏ c鑤 t╪g ",
		level  = {1,2,3},
		num = {5,25,50},
		id = {245,245,568},
		id_level = {1,5,5},		
	},
	{
		name = "Th﹏ ph竝 t╪g ",
		level  = {1,2,3},
		num = {5,25,50},
		id = {247,247,570},
		id_level = {1,5,5},		
	},
	{
		name = "Linh ho箃 t╪g ",
		level  = {1,2,3},
		num = {5,25,50},
		id = {248,248,571},
		id_level = {1,5,5},		
	},
	{
		name = "T╪g Sinh l鵦",
		level  = {4},
		num = {25},
		id = {329},
		id_level = {5},
	},
}
--无法蕴灵的外装列表
Tb_can_yunling_suit  = {
	{0,108,518},{0,108,519},{0,108,520},{0,108,521},{0,108,522},{0,108,523},
	{0,108,524},{0,108,525},{0,108,526},{0,108,527},{0,108,528},{0,108,529},
	{0,108,1},{0,108,2},{0,108,3},{0,108,4},{0,108,5},{0,108,6},
	{0,108,7},{0,108,8},{0,108,9},{0,108,10},{0,108,11},{0,108,12},
	{0,108,13},{0,108,14},{0,108,15},{0,108,16},{0,108,17},{0,108,18},
	{0,108,19},{0,108,20},{0,108,21},{0,108,22},{0,108,23},{0,108,24},
	{0,108,25},{0,108,26},{0,108,27},{0,108,28},{0,108,29},{0,108,30},
	{0,108,31},{0,108,32},{0,108,33},{0,108,34},{0,108,35},{0,108,36},
	{0,108,37},{0,108,38},{0,108,39},{0,108,40},{0,108,41},{0,108,42},
	{0,108,43},{0,108,44},{0,108,45},{0,108,46},{0,108,47},{0,108,48},
	{0,108,49},{0,108,50},{0,108,51},{0,108,52},{0,108,53},{0,108,54},
	{0,108,55},{0,108,56},{0,108,57},{0,108,58},{0,108,59},{0,108,60},
	{0,108,61},{0,108,62},{0,108,63},{0,108,64},{0,108,65},{0,108,66},
	{0,108,67},{0,108,68},{0,108,69},{0,108,70},{0,108,71},{0,108,72},
	{0,108,109},{0,108,110},{0,108,111},{0,108,112},{0,108,139},{0,108,140},
	{0,108,141},{0,108,142},{0,108,195},{0,108,196},{0,108,197},{0,108,198},
	{0,108,510},{0,108,511},{0,108,512},{0,108,513},
	{0,109,518},{0,109,519},{0,109,520},{0,109,521},{0,109,522},{0,109,523},
	{0,109,524},{0,109,525},{0,109,526},{0,109,527},{0,109,528},{0,109,529},
	{0,109,1},{0,109,2},{0,109,3},{0,109,4},{0,109,5},{0,109,6},{0,109,7},
	{0,109,8},{0,109,9},{0,109,10},{0,109,11},{0,109,12},{0,109,13},{0,109,14},
	{0,109,15},{0,109,16},{0,109,17},{0,109,18},{0,109,19},{0,109,20},{0,109,21},
	{0,109,22},{0,109,23},{0,109,24},{0,109,25},{0,109,26},{0,109,27},{0,109,28},
	{0,109,29},{0,109,30},{0,109,31},{0,109,32},{0,109,33},{0,109,34},
	{0,109,35},{0,109,36},{0,109,37},{0,109,38},{0,109,39},{0,109,40},
	{0,109,41},{0,109,42},{0,109,43},{0,109,44},{0,109,45},{0,109,46},
	{0,109,47},{0,109,48},{0,109,49},{0,109,50},{0,109,51},{0,109,52},
	{0,109,53},{0,109,54},{0,109,55},{0,109,56},{0,109,57},{0,109,58},
	{0,109,59},{0,109,60},{0,109,61},{0,109,62},{0,109,63},{0,109,64},
	{0,109,65},{0,109,66},{0,109,67},{0,109,68},{0,109,69},{0,109,70},
	{0,109,71},{0,109,72},{0,109,109},{0,109,110},{0,109,111},{0,109,112},
	{0,109,185},{0,109,186},{0,109,187},{0,109,188},{0,109,255},{0,109,256},
	{0,109,257},{0,109,258},{0,109,510},{0,109,511},{0,109,512},{0,109,513},
	{0,110,518},{0,110,519},{0,110,520},{0,110,521},
	{0,110,522},{0,110,523},{0,110,524},{0,110,525},{0,110,526},{0,110,527},
	{0,110,528},{0,110,529},{0,110,1},{0,110,2},{0,110,3},{0,110,4},
	{0,110,5},{0,110,6},{0,110,7},{0,110,8},{0,110,9},
	{0,110,10},{0,110,11},{0,110,12},{0,110,13},{0,110,14},
	{0,110,15},{0,110,16},{0,110,17},{0,110,18},{0,110,19},
	{0,110,20},{0,110,21},{0,110,22},{0,110,23},{0,110,24},
	{0,110,25},{0,110,26},{0,110,27},{0,110,28},{0,110,29},
	{0,110,30},{0,110,31},{0,110,32},{0,110,33},{0,110,34},
	{0,110,35},{0,110,36},{0,110,37},{0,110,38},{0,110,39},
	{0,110,40},{0,110,41},{0,110,42},{0,110,43},{0,110,44},
	{0,110,45},{0,110,46},{0,110,47},{0,110,48},{0,110,49},
	{0,110,50},{0,110,51},{0,110,52},{0,110,53},{0,110,54},
	{0,110,55},{0,110,56},{0,110,57},{0,110,58},{0,110,59},
	{0,110,60},{0,110,61},{0,110,62},{0,110,63},{0,110,64},
	{0,110,65},{0,110,66},{0,110,67},{0,110,68},{0,110,69},
	{0,110,70},{0,110,71},{0,110,72},{0,110,73},{0,110,74},
	{0,110,75},{0,110,76},{0,110,81},{0,110,82},{0,110,83},
	{0,110,84},{0,110,85},{0,110,86},{0,110,87},{0,110,88},
	{0,110,510},{0,110,511},{0,110,512},{0,110,513},
}
--蕴灵主对话
function yunling_main()
	local Npc_dialog_tab = {
	"<color=red>Ta c? th? g緉 linh t輓h cho ngo筰 trang g錷: Kim Quan phng, Th竔 Hoa, Ng﹏ Trang phng, trang ph鬰 Gi竛g Sinh, trang ph鬰 Nguy猲 Цn, trang ph鬰 B竧 B竧. Nh? kh玭g 頲 m芻 sai y.<color>",
	"<color=red>Ta c? th? g緉 linh t輓h cho ngo筰 trang g錷: T? nh?, T? 竜, Trang ph鬰 Gi竛g Sinh, trang ph鬰 Nguy猲 Цn, trang ph鬰 B竧 B竧, nh? kh玭g 頲  m芻 sai y.<color>",
	}
	local dialog_npc_say = "Ngi mu鑞 t譵 hi觰 g緉 linh t輓h n祇?"
	dialog_npc_say = dialog_npc_say..""..Npc_dialog_tab[Sever_diff]..""
	Say(Npc_name..""..dialog_npc_say.."",
		4,
		"Ta mu鑞 g緉 linh t輓h cho ngo筰 trang/yunling_add_main",
		"Linh t輓h /yunling_sort",
		"C莕 nh鱪g nguy猲 li謚 n祇/mertiral_info",
		"Ta ch? gh? qua th玦/end_dialog"
		)
end
--蕴灵外装部位选择函数
function yunling_add_main()
	Say(Npc_name.."Ngi mu鑞 g緉 linh t輓h cho ngo筰 trang n祇? C莕 l璾 ?, hi謓 gi? m鏸 lo筰 ngo筰 trang ch? c? th? g緉 1 thu閏 t輓h, thu閏 t輓h cao c蕄 m韎 s? thay th? thu閏 t輓h c?, g緉 linh t輓h s? khi課 cho ngo筰 trang c馻 b筺 v? th阨 h筺, nh璶g s? kh玭g th? t v祇 t? 竜 v? h閜. <color=red>G緉 linh t輓h kh玭g l祄 thay i thu閏 t輓h giao d辌h<color>.",
		4,
		"Ngo筰 trang/#yunling_add(6)",
		"Thng y/#yunling_add(7)",
		"Ngo筰 trang/#yunling_add(8)",
		"в ta suy ngh?/end_dialog"
	)
end
--蕴灵外装检测
function yunling_add(part_seq)
	--获得对应位置的装备索引
	local equip_index = GetPlayerEquipIndex(part_seq)
	if yunling_suit_chk(part_seq) ~= 1 then
		return
	end
	--判断箱子是否解锁
	if IsBoxLocking() == 1 then
		Talk(1,"",Npc_name.."H穣 m? kh鉧 th? kh?!")
		return
	end
	--判断是否有属性
	if part_seq == 7 and  GetEquipSuitID(equip_index) ~= 0 then
		Say(Npc_name.."<color=yellow>"..Tb_coat_name[part_seq].."<color> l? m閠 b?, x竎 nh薾 mu鑞 g緉 linh t輓h ch??",
		2,
		"Ta x竎 nh薾 mu鑞 g緉 linh t輓h/#yunling_attr_sel("..part_seq..")",
		"в ta suy ngh? l筰/end_dialog"
		)
	end
	yunling_attr_sel(part_seq)
end
--蕴灵外装属性选择
function yunling_attr_sel(part_seq)
	local tb_dia_sel = {}
	for i = 1,getn(Tb_yunling_att) do
		if Tb_yunling_att[i].part_id == nil or Tb_yunling_att[i].part_id == part_seq then
			tinsert(tb_dia_sel,"Ta mu鑞 g緉 linh t輓h"..Tb_yunling_att[i].name.."/#yunling_level_sel("..part_seq..","..i..")")
		end
	end
	tinsert(tb_dia_sel,"в ta suy ngh? l筰/yunling_add_main")
	Say(Npc_name.."Ngi mu鑞 g緉 cho <color=yellow>"..Tb_coat_name[part_seq].."<color> thu閏 t輓h g??",
	getn(tb_dia_sel),
	tb_dia_sel
	)
end
--蕴灵外装等级限制
function yunling_level_sel(part_seq,attr_seq)
	local tb_dia_sel = {}
	for i = 1,getn(Tb_yunling_att[attr_seq].level) do
		tinsert(tb_dia_sel,"Ta mu鑞 g緉 linh t輓h"..Tb_yunling_att[attr_seq].level[i].."C蕄 "..Tb_yunling_att[attr_seq].name.."("..Tb_yunling_att[attr_seq].num[i]..")/#yunlinged_chk("..part_seq..","..attr_seq..","..i..")")
	end
	tinsert(tb_dia_sel,"в ta suy ngh? l筰/yunling_add_main")
	Say(Npc_name.."Ngi mu鑞 g緉 cho <color=yellow>"..Tb_coat_name[part_seq].."<color> g緉 linh t輓h thu閏 t輓h <color=yellow>"..Tb_yunling_att[attr_seq].name.."<color> ng c蕄 n祇?",
	getn(tb_dia_sel),
	tb_dia_sel
	)	
end
--如果已经蕴灵则要检测一次
function yunlinged_chk(part_seq,attr_seq,level_seq)
	local equip_index = GetPlayerEquipIndex(part_seq)
	local attr_id,attr_level = GetItemAttr(equip_index,1)
	if attr_level ~= 0 then
		--检测是哪个等级的属性
		local attr_seq_had,level_seq_had = 0,0
		for i =1,getn(Tb_yunling_att) do
			for j =1,getn(Tb_yunling_att[i].level) do
				if attr_id == Tb_yunling_att[i].id[j] and attr_level == Tb_yunling_att[i].id_level[j] then
					attr_seq_had,level_seq_had = i,j
					break
				end
			end
		end
		if Tb_yunling_att[attr_seq_had].level[level_seq_had] > Tb_yunling_att[attr_seq].level[level_seq] then
			Talk(1,"",Npc_name.."<color=yellow>"..Tb_coat_name[part_seq].."<color>  g緉 linh t輓h thu閏 t輓h <color=yellow>"..Tb_yunling_att[attr_seq_had].level[level_seq_had].."C蕄 "..Tb_yunling_att[attr_seq_had].name.."<color>, kh玭g th? g緉 th蕄 h琻 ng c蕄 n祔!")
			return
		else
			Say(Npc_name.."<color=yellow>"..Tb_coat_name[part_seq].."<color> g緉 linh t輓h, x竎 nh薾 d飊g thu閏 t輓h m韎 thay th? ch??",
				2,
				"Ta ng ? g緉 linh t輓h ch錸g/#yunling_add_deal("..part_seq..","..attr_seq..","..level_seq..")",
				"в ta suy ngh? l筰/end_dialog"
				)
			return
		end
	end
	yunling_add_deal(part_seq,attr_seq,level_seq)
end
--蕴灵外装增加了
function yunling_add_deal(part_seq,attr_seq,level_seq)
	local attr_level = Tb_yunling_att[attr_seq].level[level_seq]
	--属性生成
	local	main_dia = Npc_name.."Ngi ng ? 甧m <color=yellow>"..Tb_coat_name[part_seq].."<color> g緉 linh t輓h c蕄 <color=yellow>"..attr_level.."<color> cho <color=yellow>"..Tb_yunling_att[attr_seq].name.."<color><color=red>"..Tb_yunling_att[attr_seq].num[level_seq].."<color>?\n D飊g: \n     <color=yellow> "
	--消耗生成	
	local tb_consume = Tb_yunling_consume[Sever_diff][attr_level]
	for i = 1,getn(tb_consume) do
		if type(tb_consume[i]) =="number" then
			main_dia =  main_dia..floor(tb_consume[i]/10000).." Kim    "
		elseif i == 1 then
			main_dia =  main_dia..floor(tb_consume[i][1]).."c竔"..Tb_add_mertiral[tb_consume[i][2]][4].."   "
		else
			main_dia =  main_dia..floor(tb_consume[i][1])..Tb_special_mertiral[tb_consume[i][2]][5]..Tb_special_mertiral[tb_consume[i][2]][4].."   "
		end
		--不是最好一项就需要跳行
		if i ~= getn(Tb_yunling_consume[Sever_diff]) then
			main_dia =main_dia.."\n      "
		end	
	end
	main_dia = main_dia.."<color>"
	--对话展开
	
	Say(main_dia,
	2,
	"\nTa x竎 nh薾 g緉 thu閏 t輓h /#yunling_add_dtm("..part_seq..","..attr_seq..","..level_seq..")",
	"\nв ta suy ngh? l筰/end_dialog"
	)
end
--最终处理了
function yunling_add_dtm(part_seq,attr_seq,level_seq)
	--装备判断
	if yunling_suit_chk(part_seq) ~= 1 then
		return
	end
	--材料携带判断
	if yunling_mertiral_chk(Tb_yunling_att[attr_seq].level[level_seq],1) ~= 1 then
		return
	end
	--获得对应位置的装备索引
	local equip_index = GetPlayerEquipIndex(part_seq)
	--删除外装
	local genre_id,detail_id,particular_id = GetItemGenre(equip_index),GetItemDetail(equip_index),GetItemParticular(equip_index)
	if DelItemByIndex(equip_index,-1) ~= 1 then
		Talk(1,"",Npc_name.."Ngi kh玭g m芻 <color=yellow>"..Tb_coat_name[part_seq].."<color> tr猲 ngi! L莕 sau h絥 n!")
		return
	end
	--材料删除判断
	if yunling_mertiral_chk(Tb_yunling_att[attr_seq].level[level_seq],2) ~= 1 then
		return
	end
	--新外装增加
	local add_flag = AddItem(genre_id,detail_id,particular_id,1,1,Tb_yunling_att[attr_seq].id_level[level_seq],Tb_yunling_att[attr_seq].id[level_seq])
	if add_flag == 1 then
		Talk(1,"",Npc_name.."Ch骳 m鮪g ngi  g緉 linh t輓h <color=yellow>"..Tb_coat_name[part_seq].."<color> th祅h c玭g!")
		WriteLog("G緉 linh t輓h: Ngi ch琲["..GetName().."] g緉 linh t輓h thu閏 t輓h c蕄 "..Tb_yunling_att[attr_seq].level[level_seq].." th祅h c玭g!")
		if Tb_yunling_att[attr_seq].level[level_seq] >= 3 then
			AddGlobalNews("Чi hi謕"..GetName().." g緉 linh t輓h l猲 "..Tb_coat_name[part_seq].." thu閏 t輓h c蕄  "..Tb_yunling_att[attr_seq].level[level_seq].." th祅h c玭g, th藅 ng ngng m?!");
		end
	else
		WriteLog("G緉 linh t輓h: Ngi ch琲["..GetName().."]g緉 linh t輓h ngo筰 trang thu閏 t輓h c蕄 "..Tb_yunling_att[attr_seq].level[level_seq].." th蕋 b筰, nh d蕌 th蕋 b筰:  "..add_flag)
	end
end
--蕴灵装备检测
function yunling_suit_chk(part_seq)
	local Npc_dialog_tab = {
	"<color=red>Ta c? th? g緉 linh t輓h cho: Ngo筰 trang Kim Quan phng, Th竔 Hoa, Ng﹏ Trang phng, trang ph鬰 Gi竛g Sinh, trang ph鬰 Nguy猲 Цn, trang ph鬰 B竧 B竧.<color>",
	"<color=red>Ta c? th? g緉 linh t輓h cho: Ngo筰 trang trong T? nh?, T? 竜, trang ph鬰 Gi竛g Sinh, trang ph鬰 Nguy猲 Цn, trang ph鬰 B竧 B竧.<color>",
	}	
	--获得对应位置的装备索引
	local equip_index = GetPlayerEquipIndex(part_seq)
	--判断是否有装备
	if equip_index == 0 then
		Talk(1,"",Npc_name.."Ngi kh玭g m芻 <color=yellow>"..Tb_coat_name[part_seq].."<color> tr猲 ngi! L莕 sau h絥 n!")
		return 0
	end	
	--是否锁定判断
	if GetItemSpecialAttr(equip_index,"LOCK") == 1 then
		Talk(1,"",Npc_name.."<color=yellow>"..Tb_coat_name[part_seq].."<color>  kh鉧, m? kh鉧 r錳 h絥 n!")
		return 0
	end
	local genre_id,detail_id,particular_id = GetItemGenre(equip_index),GetItemDetail(equip_index),GetItemParticular(equip_index)
	--能否蕴灵判断
	local can_chk_flag = 0
	for i = 1,getn(Tb_can_yunling_suit) do
		if genre_id == Tb_can_yunling_suit[i][1] and detail_id ==Tb_can_yunling_suit[i][2] and  particular_id == Tb_can_yunling_suit[i][3] then
			can_chk_flag = 1
			break
		end
	end
	if can_chk_flag == 0 then
		Talk(1,"",Npc_name..""..Npc_dialog_tab[Sever_diff]..". N誹 ngi kh玭g c? c? th? n Ng? C竎 t譵!")
		return 0
	end
	--判断装备耐久
	if AbradeItem(equip_index,0) == 0 then
		Talk(1,"",Npc_name.."ч b襫 trang b? c馻 ngi l? <color=red>0<color>, kh玭g th? g緉 linh t輓h!")
		return 0
	end
	return 1
end
--材料处理函数
function yunling_mertiral_chk(yunling_level,chk_flag)
	local tb_consume = Tb_yunling_consume[Sever_diff][yunling_level]
	for i = 1,getn(tb_consume) do
		if type(tb_consume[i]) =="number" then		--金钱检测
			if chk_flag == 1 then
				if GetCash() < tb_consume[i] then
					Talk(1,"",Npc_name.."Ti襫 c馻 ngi kh玭g  <color=yellow>"..floor(tb_consume[i]/10000).."<color> v祅g, c? ph秈  qu猲 ? th? kh? r錳 kh玭g? ")
					return 0
				end
			elseif chk_flag == 2 then
				if Pay(tb_consume[i]) ~= 1 then
					Talk(1,"",Npc_name.."Ti襫 c馻 ngi kh玭g  <color=yellow>"..floor(tb_consume[i]/10000).."<color> v祅g, c? ph秈  qu猲 ? th? kh? r錳 kh玭g? ")
					return 0
				end
			end
		elseif i == 1 then		--特效材料检测
			if chk_flag == 1 then
				if GetItemCount(Tb_add_mertiral[tb_consume[i][2]][1],Tb_add_mertiral[tb_consume[i][2]][2],Tb_add_mertiral[tb_consume[i][2]][3]) < tb_consume[i][1] then
					Talk(1,"",Npc_name.."Ngi mang <color=yellow>"..Tb_add_mertiral[tb_consume[i][2]][4].."<color> kh玭g  <color=yellow>"..tb_consume[i][1].."<color>, c? ph秈  qu猲 ? th? kh? kh玭g? ")
					return 0
				end
			elseif chk_flag == 2 then
				if DelItem(Tb_add_mertiral[tb_consume[i][2]][1],Tb_add_mertiral[tb_consume[i][2]][2],Tb_add_mertiral[tb_consume[i][2]][3],tb_consume[i][1]) ~= 1  then
					Talk(1,"",Npc_name.."Ngi mang <color=yellow>"..Tb_add_mertiral[tb_consume[i][2]][4].."<color> kh玭g  <color=yellow>"..tb_consume[i][1].."<color>, c? ph秈  qu猲 ? th? kh? kh玭g? ")
					return 0
				end
			end
		else			--特殊消耗检测
			if chk_flag == 1 then
				if GetItemCount(Tb_special_mertiral[tb_consume[i][2]][1],Tb_special_mertiral[tb_consume[i][2]][2],Tb_special_mertiral[tb_consume[i][2]][3]) < tb_consume[i][1] then
					Talk(1,"",Npc_name.."Ngi mang <color=yellow>"..Tb_special_mertiral[tb_consume[i][2]][4].."<color> kh玭g  <color=yellow>"..tb_consume[i][1].."<color>"..Tb_special_mertiral[tb_consume[i][2]][5]..", c? ph秈  qu猲 ? th? kh? kh玭g? ")
					return 0
				end
			elseif chk_flag == 2 then
				if DelItem(Tb_special_mertiral[tb_consume[i][2]][1],Tb_special_mertiral[tb_consume[i][2]][2],Tb_special_mertiral[tb_consume[i][2]][3],tb_consume[i][1]) ~= 1  then
					Talk(1,"",Npc_name.."Ngi mang <color=yellow>"..Tb_special_mertiral[tb_consume[i][2]][4].."<color> kh玭g  <color=yellow>"..tb_consume[i][1].."<color>"..Tb_special_mertiral[tb_consume[i][2]][5]..", c? ph秈  qu猲 ? th? kh? kh玭g? ")
					return 0
				end
			end
		end
	end
	return 1
end
--蕴灵种类
function yunling_sort(print_seq)
	--显示范围准备
	local print_start = 1
	local print_end = 5
	if print_seq ~= nil then
		print_start = 6
		print_end = getn(Tb_yunling_att)
	end
	local dia_main = Npc_name.."G緉 linh t輓h g錷 c?: \n"
	for i =print_start , print_end do
		if Tb_yunling_att[i].part_id == nil then		--通用属性
			dia_main = dia_main.."<color=yellow>Ngo筰 trang d飊g <color> thu閏 t輓h: <color=yellow>"..Tb_yunling_att[i].name.."<color>"
		else			--专有属性
			dia_main = dia_main.."<color=yellow>"..Tb_coat_name[Tb_yunling_att[i].part_id].." c? <color> thu閏 t輓h: <color=yellow>"..Tb_yunling_att[i].name.."<color>"
		end
		--属性等级和点数生成
		local attr_level = ""
		local attr_num = ""
		for j = 1,getn(Tb_yunling_att[i].level) do
			attr_level = attr_level..Tb_yunling_att[i].level[j]
			attr_num = attr_num..Tb_yunling_att[i].num[j]
			if j ~= getn(Tb_yunling_att[i].level) then
				attr_level = attr_level.."/"
				attr_num = attr_num.."/"
			end
		end
		--组合
		dia_main = dia_main.."Ъng c蕄: <color=yellow>"..attr_level.."<color> tr? s? i 鴑g: <color=yellow>"..attr_num.."<color>\n"
	end
	if print_seq ~= nil then
		Talk(1,"yunling_main",dia_main)
	else
		Talk(1,"#yunling_sort(1)",dia_main)
	end
end
--蕴灵材料提示
function mertiral_info()
	local dialog_main = Npc_name.."Nguy猲 li謚 g緉 linh t輓h ph秈 t譵 ? T﹜ V鵦 m韎 c?, ng c蕄 kh竎 nhau nguy猲 li謚 s? kh竎 nhau\n"
	for i = 1,getn(Tb_yunling_consume[Sever_diff]) do
		dialog_main = dialog_main.."<color=red>"..i.."<color> c莕: "
		for j =1, getn(Tb_yunling_consume[Sever_diff][i]) do
			if type(Tb_yunling_consume[Sever_diff][i][j]) =="number" then		--金钱检测
				dialog_main = dialog_main.."<color=yellow>"..floor(Tb_yunling_consume[Sever_diff][i][j]/10000).." v祅g<color>    "
			elseif j == 1 then
				dialog_main = dialog_main.."<color=yellow>"..Tb_yunling_consume[Sever_diff][i][j][1].."c竔"..Tb_add_mertiral[Tb_yunling_consume[Sever_diff][i][j][2]][4].."<color>    "
			else
				dialog_main = dialog_main.."<color=yellow>"..Tb_yunling_consume[Sever_diff][i][j][1]..Tb_special_mertiral[Tb_yunling_consume[Sever_diff][i][j][2]][5]..Tb_special_mertiral[Tb_yunling_consume[Sever_diff][i][j][2]][4].."<color>    "
			end
		end
		dialog_main = dialog_main.."\n"
	end
	Talk(1,"yunling_main",dialog_main)
end
