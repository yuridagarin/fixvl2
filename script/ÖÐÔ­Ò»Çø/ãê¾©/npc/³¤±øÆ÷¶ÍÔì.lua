-- =========================================
-- File : 中原一区，汴京，长兵器锻造.lua
-- Name : 莫大
-- ID   : 1, 2

--村长于2007-06-25增加IB版本：炎帝套装转换相关功能
--策划人：小天天
--代码开发人：村长
--代码修改记录：2008-02-26将炎帝装转换修改位永久开放

-- =========================================
Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua")
Include("\\script\\task\\lingshi_task.lua")
--==============================炎帝套装相关===============================
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
task_start_date = 20080128				--兑换活动开始日期
task_end_date = 20080218					--兑换结束日期
TaskID_yandi_chg_num = 1288
--重铸需要材料列表
Tb_refound_mertiral = {
	{
	{2,1,504,4,"N? Oa Tinh Th筩h"},
	{2,0,555,2,"C祅 Kh玭 ph?"},
	{2,1,503,5,"V? Ng蕁 Th駓"},
	{2,1,1009,100,"Thi猲 Th筩h Tinh Th筩h"},
	{2,1,1145,1,"B秐 v? Ch? t筼 Vi猰 д"},
	},
	{
		{2,1,504,4,"N? Oa Tinh Th筩h"},
		{2,0,555,2,"C祅 Kh玭 ph?"},
		{2,1,503,5,"V? Ng蕁 Th駓"},
		{2,1,1009,200,"Thi猲 Th筩h Tinh Th筩h"},
		{2,1,1190,1,"B秐 v? Ch? t筼 Ho祅g д"},
	},
}
--重铸需要装备列表
Tb_refound_att = {}
Tb_refound_att[0]	= {0,103,8000,"Vi猰 д kh玦"}
Tb_refound_att[1]	= {0,100,8000,"Vi猰 д gi竝"}
Tb_refound_att[3]	= {0,101,8000,"Vi猰 д trang"}
--炎黄铁魂信息
Tb_yanhuang_stone = {2,1,1146,"Vi猰 Ho祅g Thi誸 H錸"}
--铸造对应的对话信息
Tb_refound_get_dia = {
	{
		"Vi猰 д gi竝","","Vi猰 д trang"
	},
	{	
		"","Hi猲 Vi猲 v? kh?","","Hi猲 Vi猲 Chi課","Hi猲 Vi猲 u",
	}
}
Tb_refound_get_dia[1][0] = "Vi猰 д kh玦"
--黄帝装对应装备
Tb_huandi_position = {1,2,3}
Tb_huandi_equip = {}
Tb_huandi_equip[2] = {
	{},
	{},
	{0,8,8803,"Hi猲 Vi猲 C鰑 Nh? Trng"},
	{0,0,8804,"Hi猲 Vi猲 H筼 Nhi猲 Th?"},
	{},
	{0,1,8805,"Hi猲 Vi猲 ch﹎ v? h譶h"},
	{},
	{0,2,8806,"Hi猲 Vi猲 T? Tinh Ki誱"},
	{0,10,8807,"Hi猲 Vi猲 Ph鬾g Ho祅g C莔"},
	{},
	{0,0,8808,"Hi猲 Vi猲 Ng? Nh筩 Th?"},
	{0,5,8809,"Hi猲 Vi猲 Ph? Thi猲 C玭"},
	{},
	{0,2,8810,"Hi猲 Vi猲 H錸g Qu﹏ Ki誱"},
	{0,9,8811,"Hi猲 Vi猲 Sinh T? B髏"},
	{},
	{0,6,8812,"Hi猲 Vi猲 Ph? Qu﹏ Thng"},
	{0,4,8813,"Hi猲 Vi猲 Khai Thi猲 Cung"},
	{},
	{0,7,8814,"Hi猲 Vi猲  Dng Nh蒼"},
	{0,11,8815,"Hi猲 Vi猲 U Minh Tr秓"},
}
Tb_huandi_equip[4] = {
	{},
	{0,102,8801,"Hi猲 Vi猲 Chi課"},
	{0,102,8803,"Hi猲 Vi猲 Chi課"},
	{0,102,8805,"Hi猲 Vi猲 Chi課"},
	{},
	{0,102,8807,"Hi猲 Vi猲 Chi課"},
	{},
	{0,102,8809,"Hi猲 Vi猲 Chi課"},
	{0,102,8811,"Hi猲 Vi猲 Chi課"},
	{},
	{0,102,8813,"Hi猲 Vi猲 Chi課"},
	{0,102,8815,"Hi猲 Vi猲 Chi課"},
	{},
 	{0,102,8817,"Hi猲 Vi猲 Chi課"},
	{0,102,8819,"Hi猲 Vi猲 Chi課"},
	{},
	{0,102,8821,"Hi猲 Vi猲 Chi課"},
	{0,102,8823,"Hi猲 Vi猲 Chi課"},
	{},
	{0,102,8825,"Hi猲 Vi猲 Chi課"},
	{0,102,8827,"Hi猲 Vi猲 Chi課"},
} 
Tb_huandi_equip[5] = {
  {},
  {0,102,8802,"Hi猲 Vi猲 u"},
  {0,102,8804,"Hi猲 Vi猲 u"},
  {0,102,8806,"Hi猲 Vi猲 u"},
  {},
  {0,102,8808,"Hi猲 Vi猲 u"},
  {},
  {0,102,8810,"Hi猲 Vi猲 u"},
  {0,102,8812,"Hi猲 Vi猲 u"},
  {},
  {0,102,8814,"Hi猲 Vi猲 u"},
  {0,102,8816,"Hi猲 Vi猲 u"},
  {},
  {0,102,8818,"Hi猲 Vi猲 u"},
  {0,102,8820,"Hi猲 Vi猲 u"},
  {},
  {0,102,8822,"Hi猲 Vi猲 u"},
  {0,102,8824,"Hi猲 Vi猲 u"},
  {},
  {0,102,8826,"Hi猲 Vi猲 u"},
  {0,102,8828,"Hi猲 Vi猲 u"},
}
Tb_huandi_sushao_weapon = {
	{0,3,8801,"Hi猲 Vi猲 To竔 V? o"},
	{0,5,8802,"Hi猲 Vi猲 To竔 V? C玭"},
}
Tb_equip_position_info = {}
Tb_equip_position_info[0] = {"Vi猰 д kh玦",1}
Tb_equip_position_info[1] = {"Vi猰 д gi竝",1}
Tb_equip_position_info[2] = {"Hi猲 Vi猲 v? kh?",2}
Tb_equip_position_info[3] = {"Vi猰 д trang",1}
Tb_equip_position_info[4] = {"Hi猲 Vi猲 Chi課",2}
Tb_equip_position_info[5] = {"Hi猲 Vi猲 u",2}
Refound_level_max = 15			--重铸后的最高强化度
--2007-11-19
--增加黄帝装备的重铸功能：
Tb_refound_att_name ={"Trang b? Vi猰 ","Trang b? Ho祅g д"}
Tb_refound_paper_info = {
	{1145,"B秐 v? Ch? t筼 Vi猰 д"},
	{1190,"B秐 v? Ch? t筼 Ho祅g д"}
}
--================================结束====================================
--*****************************************定义常量及预处理***************************************
ID_LEARNLIFESKILL		= 1925		-- 配方学习任务变量
LEVELTASKID49			= 517		-- 吞龙宝刀任务
TASK49_BEGGING			= 1933		-- 49级晋级任务开始标示
FORGETMAIN_NUM			= 1940		-- 遗忘主技能次数
FORGETOHTER_NUM			= 1941		-- 遗忘主技能次数
LEV_LEARNRECIPE			= 1926
HaveWeekend				= 9001		-- 周末配方学习任务变量
strName = "";
strTitle = "";

--*****************************************MAIN函数*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","Х qu? 5 gi? ch琲, h穣 ngh? ng琲  gi? g譶 s鴆 kh醗!")
	 	return
	 end
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Tuy ngi c? th? theo ta h鋍 c竎h ch? t筼 trang b? c? linh kh?, nh璶g mu鑞 t譵 hi觰 trang b? B竧 Qu竔, ngi n猲 甶 t譵 ngi c馻 C玭g D? Th? Gia!");
	end;
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	-----------------------------------------新手任务-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."дn <color=yellow>C蕄 10<color> c? th? n <color=yellow>Th祅h Й<color> g苝 <color=yellow>Du Phng i phu<color> t譵 hi觰 <color=yellow>k? n╪g s鑞g<color>!",0)
		TaskTip("дn c蕄 10 c? th? n Th祅h Й t譵 Du Phng i phu.")        
		return 
	end
	---------------------------------------------主对话-------------------------------------------
	--local date_now = zgc_pub_date_num()
	--if date_now >= task_start_date and date_now <= task_end_date then
		local strtab = {
--		"炎帝装备和黄帝装备的相关事项/yandi_chg_dia_main",
		"Nh鱪g 甶襲 li猲 quan v? r蘮 binh kh? d礽/old_dia",
--		"Nh鱪g 甶襲 li猲 quan v? trang b? B竧 Qu竔/bagua",
		"H鋍 c竎h l祄 v? kh? linh kh? c蕄 76/xinwuqi"
		}
		if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
			tinsert(strtab,"ti誴 t鬰 nhi謒 v? h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
		end
		if GetLifeSkillMaxLevel(1, 2) == 79 then
			tinsert(strtab, "Mu鑞 h鋍k? n╪g cao c蕄 h琻/update_max_skill_level");
		end 
		tinsert(strtab,"R阨 kh醝/SayHello")
		Say("Ta t猲 M筩 Чi, truy襫 nh﹏ i th? 73 c馻 Can Tng M筩 T?, s? trng r蘮 c竎 lo筰 v? kh? Th莕 Binh, nh蕋 l? nh鱪g binh kh? d礽 nh?: c玭, trng. Trong thi猲 h? kh玭g th? t譵 ra ngi th? hai. V韎 l筰 g莕 y ta ph竧 hi謓 ra phng ph竝 ch? t筼 <color=red>trang b? Vi猰 д<color> nh? trong truy襫 thuy誸 n鉯, ngi c? mu鑞 nghe kh玭g?",
			getn(strtab),
			strtab)
	--else
	--	Say("<color=green>莫大<color>：我是干将莫邪的第七十三代传人－莫大，擅长锻造各种神兵利器，尤其是长兵器锻造，比如棍、杖。天下无出其右，有什么我能帮忙你的？我最近有了些空闲，可以帮大家做些炎帝装备的修整，如果有需要的话，就仔细看看吧。",
	--	    3,
	--	    "炎帝装备的相关事项/yandi_att_chg",
	--	    "长兵器锻造得相关事项/old_dia",
	--	    "离开/SayHello")
	--end
end

--============================================炎帝装转换对话增加====================================
--炎帝装的主对话
function yandi_chg_dia_main()
	Say("<color=red>Trang b? Vi猰 д v? trang b? Ho祅g д<color> l? v藅 ph萴 phi ph祄, ta nghi猲 c鴘 c? i ph竧 hi謓 ra n誹 th猰 1 v礽 nguy猲 li謚, s? c 1 <color=yellow>trang b? Vi猰 д ho芻 trang b? Ho祅g д<color> th祅h 1 <color=yellow>trang b? Vi猰 д ho芻 trang b? Ho祅g д<color> kh竎, t輓h n╪g 頲 t╪g c蕄. N誹 kh玭g mu鑞 ti猽 hao<color=yellow>trang b? Vi猰 д ho芻 trang b? Ho祅g д<color>, th? c? th? xem qua, c? m閠 s?<color=yellow>Vi猰 Ho祅g Thi誸 H錸<color> trong cung. Ta  t譵 ra c竎h thay i<color=yellow>thu閏 t輓h trang b? Vi猰 д<color>, c? th? chuy觧 t╪g n閕 ngo筰 c玭g c馻<color=yellow>trang b? Vi猰 д<color> th祅h t╪g s竧 thng, nh璶g m鏸 ngi ch? i 頲 <color=red>1<color> l莕.",
	7,
	"Ta  t譵  nguy猲 li謚, ta mu鑞 c trang b? Vi猰 д/#yandi_att_chk(1)",
	"Ta  t譵  nguy猲 li謚, ta mu鑞 c trang b? Ho祅g д/#yandi_att_chk(2)",
	"Ta mu鑞 l蕐 Vi猰 д Trang v? t╪g t蕁 c玭g gia c玭g th祅h t╪g s竧 thng/yandi_att_chg",
	"Ta mu鑞 l蕐 1 b秐 v? Ch? t筼Vi猰 д/#refound_paper_chg(1)",
	"Ta mu鑞 l蕐 1 b秐 v? Ch? t筼 Ho祅g д/#refound_paper_chg(2)",
	"Sau khi ch? t筼 c? g? thay i/refuond_info",
	"дn h醝 th╩ th玦 m?!/SayHello"
	)
end
-----------------------------------装备转换----------------------------
--材料检查
function yandi_att_chk(equip_diff)
	if equip_diff == 2 then
		if GetPlayerRoute() == 0 then
			Talk(1,"","Ta kh玭g th? gi髉 ngi ch璦 nh藀 m玭 ph竔 n祇 ch? t筼 <color=red>trang b? Ho祅g д<color>!")
			return
		end
		if Tb_huandi_equip[4][GetPlayerRoute()] [1]== nil  then
		Talk(1,"","Ta kh玭g th? gi髉 ngi ch璦 nh藀 m玭 ph竔 n祇 ch? t筼 <color=red>trang b? Ho祅g д<color>!")
		return
		end
	end
	--材料携带检测
	if refound_mertiral_chk(equip_diff,1) ~= 1 then
		return
	end
	local equipment_num = 0
	local equipment_position = 0
	local yanhuang_stone_chk_flag = GetItemCount(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3])
	if yanhuang_stone_chk_flag ~= 0 then
		if equip_diff == 1 then
			Say("Ngi mu鑞 d飊g <color=yellow>Vi猰 Ho祅g Thi誸 H錸<color> c th祅h g??"..Tb_refound_att_name[equip_diff].."?",
			4,
			"Ta mu鑞 c"..Tb_refound_get_dia[equip_diff][0].."/#stone_chg_dtm("..equip_diff..",0)",
			"Ta mu鑞 c"..Tb_refound_get_dia[equip_diff][1].."/#stone_chg_dtm("..equip_diff..",1)",
			"Ta mu鑞 c"..Tb_refound_get_dia[equip_diff][3].."/#stone_chg_dtm("..equip_diff..",3)",
			"в ta suy ngh? l筰/end_dialog"
			)
		else
			Say("Ngi mu鑞 d飊g <color=yellow>Vi猰 Ho祅g Thi誸 H錸<color> c th祅h g??"..Tb_refound_att_name[equip_diff].."?",
			4,
			"Ta mu鑞 c"..Tb_refound_get_dia[equip_diff][2].."/#stone_chg_dtm("..equip_diff..",2)",
			"Ta mu鑞 c"..Tb_refound_get_dia[equip_diff][4].."/#stone_chg_dtm("..equip_diff..",4)",
			"Ta mu鑞 c"..Tb_refound_get_dia[equip_diff][5].."/#stone_chg_dtm("..equip_diff..",5)",
			"в ta suy ngh? l筰/end_dialog"
			)
		end
	else
		local sel_dia = {}
		for i = 0 ,getn(Tb_equip_position_info) do
			if Tb_equip_position_info[i][2] == equip_diff then
				tinsert(sel_dia,"Ta mu鑞 l蕐  "..Tb_equip_position_info[i][1].." c/#refoud_dia("..i..")")
			end
		end
		tinsert(sel_dia,"в ta suy ngh? l筰/end_dialog")
		Say("B筺 mu鑞 l蕐 trang b? n祇 <color=red>產ng mang tr猲 ngi<color>  ch? t筼?",
			getn(sel_dia),
			sel_dia
		)
	end
end
--炎黄铁魂转换确认对话
function stone_chg_dtm(equip_diff,part_diff)
	Say("B筺 x竎 nh薾 mu鑞 l蕐 <color=yellow>Vi猰 Ho祅gThi誸 H錸<color> c 1 <color=red>"..Tb_refound_get_dia[equip_diff][part_diff].."<color> ch??",
	2,
	"Ta x竎 nh薾/#stone_chg("..equip_diff..","..part_diff..")",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--炎黄铁魂换
function stone_chg(equip_diff,part_diff)
	if refound_mertiral_chk(equip_diff,1) ~= 1 then
		return
	end
	--炎黄铁魂携带检测
	if GetItemCount(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3]) == 0 then
		Talk(1,"","H穣 x竎 nh薾 ngi c? 甧m <color=yellow>Vi猰 Ho祅gThi誸 H錸<color> theo!")
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end	
	--俗少特殊处理
	if GetPlayerRoute() == 2 and part_diff == 2 then
		Say("Ngi mu鑞 c 產o hay c c玭?",
		3,
		"Ta mu鑞 c 產o/#huangdi_ws_weapon(1)",
		"Ta mu鑞 c c玭/#huangdi_ws_weapon(2)",
		"в ta suy ngh? l筰/end_dialog"
		)
		return
	end
	--材料携带检测
	if refound_mertiral_chk(equip_diff,2) ~= 1 then
		return
	end
	--炎黄铁魂删除检测
	if DelItem(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3],1) ~= 1 then
		Talk(1,"","H穣 x竎 nh薾 ngi c? 甧m <color=yellow>Vi猰 Ho祅gThi誸 H錸<color> theo!")
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."Khi 產ng x鉧 Vi猰 Ho祅g Thi誸 H錸 nguy猲 li謚 kh玭g !")
		return
	end	
	--增加装备
	local add_flag = 0
	if equip_diff == 1 then		--炎帝
		add_flag =AddItem(Tb_refound_att[part_diff][1],Tb_refound_att[part_diff][2],(Tb_refound_att[part_diff][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Talk(1,"","<color=yellow>"..Tb_refound_att[part_diff][4].."<color> c xong r錳, ngi c? th? c莔 v?!")
			WriteLog("c trang b? Vi猰 Ho祅g:"..GetName().."Х c xong 1 "..Tb_refound_att[part_diff][4])
		else
			WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."T╪g"..Tb_refound_att[part_diff][4].." th蕋 b筰, k? hi謚:"..add_flag)
		end
	else		--黄帝
		add_flag =AddItem(Tb_huandi_equip[part_diff][GetPlayerRoute() ][1],Tb_huandi_equip[part_diff][GetPlayerRoute() ][2],Tb_huandi_equip[part_diff][GetPlayerRoute() ][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Talk(1,"","<color=yellow>"..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4].."<color> c xong r錳, ngi c? th? c莔 v?!")
			WriteLog("c trang b? Vi猰 Ho祅g:"..GetName().."Х c xong 1 "..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4])
		else
			WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."T╪g"..Tb_huandi_equip[part_diff][GetPlayerRoute() ][4].." th蕋 b筰, k? hi謚:"..add_flag)
		end	end
end
--WS的武器选择（特殊处理）
function huangdi_ws_weapon(weapon_diff)
	--材料携带检测
	if refound_mertiral_chk(2,2) ~= 1 then
		return
	end
	--炎黄铁魂删除检测
	if DelItem(Tb_yanhuang_stone[1],Tb_yanhuang_stone[2],Tb_yanhuang_stone[3],1) ~= 1 then
		Talk(1,"","H穣 x竎 nh薾 ngi c? 甧m <color=yellow>Vi猰 Ho祅gThi誸 H錸<color> theo!")
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."Khi 產ng x鉧 Vi猰 Ho祅g Thi誸 H錸 nguy猲 li謚 kh玭g !")
		return
	end
	local add_flag = AddItem(Tb_huandi_sushao_weapon[weapon_diff][1],Tb_huandi_sushao_weapon[weapon_diff][2],Tb_huandi_sushao_weapon[weapon_diff][3],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		Talk(1,"","<color=yellow>"..Tb_huandi_sushao_weapon[weapon_diff][4].."<color> c xong r錳, ngi c? th? c莔 v?!")
		WriteLog("c trang b? Vi猰 Ho祅g:"..GetName().."Х c xong 1 "..Tb_huandi_sushao_weapon[weapon_diff][4])
		return
	else
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."T╪g"..Tb_huandi_sushao_weapon[weapon_diff][4].." th蕋 b筰, k? hi謚:"..add_flag)
	end
end
--转换确认
function refoud_dia(equip_seq)
	--检测是否穿着
	if equipmen_deal_chk(equip_seq,1) ~= 1 then
		return
	end
	local tb_dia = {}
	for i = 0 ,5 do
		if strsub(Tb_equip_position_info[equip_seq][1],1,2) == strsub(Tb_equip_position_info[i][1],1,2) and equip_seq ~= i then
			tinsert(tb_dia,"Ta mu鑞 c "..Tb_equip_position_info[i][1].."/#refound_dtm("..equip_seq..","..i..")")
		end
	end
	tinsert(tb_dia,"в ta suy ngh? l筰/end_dialog")
	Say("Ngi mu鑞 l蕐 trang b? 產ng m芻 <color=red>"..Tb_equip_position_info[equip_seq][1].."<color> ch? t筼 th祅h c竔 n祇 <color=yellow>"..Tb_refound_att_name[Tb_equip_position_info[equip_seq][2]].."<color>?",
	getn(tb_dia),
	tb_dia
	)
end
--炎帝装的转换
function refound_dtm(old_seq,new_seq)
	if GetPlayerRoute() == 2 and new_seq == 2 then		--ss是bug，一定要解决呀。
		Say("Чi hi謕 l?  t? thi誹 l﹎, kh玭g bi誸 Чi hi謕 mu鑞 l蕐 <color=red>"..Tb_equip_position_info[old_seq][1].."<color> l? v? kh? Hi猲 Vi猲 n祇?",
		3,
		"Ta mu鑞 Hi猲 Vi猲 To竔 V? o/#ss_refoud_dtm("..old_seq..",1)",
		"Ta mu鑞 Hi猲 Vi猲 To竔 V? C玭/#ss_refoud_dtm("..old_seq..",2)",
		"в ta suy ngh? l筰/end_dialog"
		)
	else
		Say("Ngi mu鑞 l蕐 trang b? 產ng m芻 <color=red>"..Tb_equip_position_info[old_seq][1].."<color> ch? t筼 th祅h <color=red>"..Tb_equip_position_info[new_seq][1].."<color> ch??",
		2,
		"Ta x竎 nh薾 mu鑞 ch? t筼/#refound_deal("..old_seq..","..new_seq..")",
		"в ta suy ngh? l筰/end_dialog"
		)
	end
end
--ss武器转化确认
function ss_refoud_dtm(old_seq,weapon_diff)
	Say("Чi hi謕 x竎 nh薾 mu鑞 l蕐 <color=red>"..Tb_equip_position_info[old_seq][1].."<color> ch? t筼 th祅h <color=red>"..Tb_huandi_sushao_weapon[weapon_diff][4].."<color> ch??",
	2,
	"Ta x竎 nh薾 mu鑞 ch? t筼/#ss_refoud_deal("..old_seq..","..weapon_diff..")",
	"в ta suy ngh? l筰/end_dialog"
	)
	end
--ss重铸武器处理
function ss_refoud_deal(old_seq,weapon_diff)
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--材料携带检测
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],1) ~= 1 then
		return
	end
	--装备穿着检测
	if equipmen_deal_chk(old_seq,1) ~= 1 then
		return
	end
	--装备信息获取
	local att_step = 1
	if old_seq < 4 then
		att_step = (GetEquipAttr(GetPlayerEquipIndex(old_seq),2)+1)
	end
	if att_step > Refound_level_max then
		att_step = Refound_level_max
	end
	--材料删除检测
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],2) ~= 1 then
		return
	end
	--装备删除检测
	if equipmen_deal_chk(old_seq,2) ~=1 then
		return
	end
	local add_flag = 0
	local equip_index = 0
	add_flag,equip_index = AddItem(Tb_huandi_sushao_weapon[weapon_diff][1],Tb_huandi_sushao_weapon[weapon_diff][2],Tb_huandi_sushao_weapon[weapon_diff][3],1,1,-1,-1,-1,-1,-1,-1,0,att_step)
	if ding_flag == 1 then
		SetItemSpecialAttr(equip_index,"DING7",1)
	end
	if add_flag == 1 then
		Talk(1,"","Cu鑙 c飊g  th祅h c玭g, v藅 n祔 kh玭g b譶h thng u, "..Zgc_pub_sex_name().."h穣 d飊g v藅 n祔 h祅h hi謕 trng ngh躠!")
	else
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."D飊g th?"..Tb_equip_position_info[old_seq][1].."Ch? t筼 "..Tb_equip_position_info[new_seq][1].." th蕋 b筰, k? hi謚:"..add_flag)
	end
end
--装备增加
function refound_deal(old_seq,new_seq)
	local player_route = GetPlayerRoute()
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--材料携带检测
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],1) ~= 1 then
		return
	end
	--装备穿着检测
	if equipmen_deal_chk(old_seq,1) ~= 1 then
		return
	end
	--装备信息获取
	local att_step = 1
	local ding_flag = 0
	if old_seq < 4 then 
		att_step = (GetEquipAttr(GetPlayerEquipIndex(old_seq),2)+1)
		ding_flag = GetItemSpecialAttr(GetPlayerEquipIndex(old_seq),"DING7")
end
	if att_step > Refound_level_max then
		att_step = Refound_level_max
	end
	--材料删除检测
	if refound_mertiral_chk(Tb_equip_position_info[old_seq][2],2) ~= 1 then
		return
	end
	--装备删除检测
	if equipmen_deal_chk(old_seq,2) ~=1 then
		return
	end
	--开始增加物品
	local add_flag = 0
	local equip_index = 0
	if new_seq < 4 then	--非首饰类装备，有强化度
		if Tb_equip_position_info[old_seq][2] == 1 then	--炎帝
			add_flag,equip_index = AddItem(Tb_refound_att[new_seq][1],Tb_refound_att[new_seq][2],(Tb_refound_att[new_seq][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1,0,att_step)
		else	--黄帝
			add_flag,equip_index = AddItem(Tb_huandi_equip[new_seq][player_route][1],Tb_huandi_equip[new_seq][player_route][2],Tb_huandi_equip[new_seq][player_route][3],1,1,-1,-1,-1,-1,-1,-1,0,att_step)
		end
	else	--首饰类，无强化度
		add_flag = AddItem(Tb_huandi_equip[new_seq][player_route][1],Tb_huandi_equip[new_seq][player_route][2],Tb_huandi_equip[new_seq][player_route][3],1,1,-1,-1,-1,-1,-1,-1)
	end
	if add_flag == 1 then
		Talk(1,"","Cu鑙 c飊g  th祅h c玭g, v藅 n祔 kh玭g b譶h thng u, "..Zgc_pub_sex_name().."h穣 d飊g v藅 n祔 h祅h hi謕 trng ngh躠!")
		if ding_flag == 1 then
			SetItemSpecialAttr(equip_index,"DING7",1)
		end
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."Th祅h c玭g nh薾 頲 m鴆 t╪g c蕄 l?:"..att_step.."-"..Tb_equip_position_info[new_seq][1].."Trang b?")
	else
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."D飊g th?"..Tb_equip_position_info[old_seq][1].."Ch? t筼 "..Tb_equip_position_info[new_seq][1].." th蕋 b筰, k? hi謚:"..add_flag)
	end
end
--装备穿着、删除检测
function equipmen_deal_chk(equip_seq,deal_diff)
	local player_route = GetPlayerRoute()
	local equip_id ={}
	equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(equip_seq)
	if deal_diff == 1 then		--穿着检测
		if Tb_equip_position_info[equip_seq][2] == 1 then		--炎帝
			if equip_id[1] == Tb_refound_att[equip_seq][1]  and  equip_id[2] == Tb_refound_att[equip_seq][2] and (equip_id[3] == Tb_refound_att[equip_seq][3]+GetBody()) then
				return 1
			else
				Talk(1,"","H穣 x竎 nh薾 ngi 產ng m芻 <color=red>"..Tb_equip_position_info[equip_seq][1].."<color>!")
				return 0
			end
		else
			if player_route == 2 and equip_seq == 2then
				if (equip_id[1] ==Tb_huandi_sushao_weapon[1][1] and equip_id[2] ==Tb_huandi_sushao_weapon[1][2] and equip_id[3] ==Tb_huandi_sushao_weapon[1][3] ) or 
					(equip_id[1] ==Tb_huandi_sushao_weapon[2][1] and equip_id[2] ==Tb_huandi_sushao_weapon[2][2] and equip_id[3] ==Tb_huandi_sushao_weapon[2][3] ) then
					return 1
				else
					Talk(1,"","H穣 x竎 nh薾 ngi 產ng m芻 <color=red>v? kh? Hi猲 Vi猲<color>!")
					return 0
				end
			elseif equip_seq == 4 or equip_seq == 5 then
				equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(4)
				equip_id[11],equip_id[12],equip_id[13]= GetPlayerEquipInfo(5)
				if (equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3])
				or (equip_id[11] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[12] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[13] == Tb_huandi_equip[equip_seq][player_route][3])
				then
					return 1
				else
					Talk(1,"","H穣 x竎 nh薾 ngi 產ng m芻 <color=red>"..Tb_equip_position_info[equip_seq][1].."<color>!")
				end
			else
				if equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3] then
					return 1
				else
					Talk(1,"","H穣 x竎 nh薾 ngi 產ng m芻 <color=red>".. Tb_huandi_equip[equip_seq][player_route][4] .."<color>!")
					return 0
				end
			end
		end
	else							--删除检测
		local equip_index = 0
		if equip_seq == 4 or equip_seq == 5 then
			equip_id[1],equip_id[2],equip_id[3]= GetPlayerEquipInfo(4)
			equip_id[11],equip_id[12],equip_id[13]= GetPlayerEquipInfo(5)
			if (equip_id[1] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[2] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[3] == Tb_huandi_equip[equip_seq][player_route][3]) then
				equip_index = GetPlayerEquipIndex(4)
			elseif (equip_id[11] == Tb_huandi_equip[equip_seq][player_route][1] and equip_id[12] == Tb_huandi_equip[equip_seq][player_route][2] and equip_id[13] == Tb_huandi_equip[equip_seq][player_route][3]) then
				equip_index = GetPlayerEquipIndex(5)
			else
				Talk(1,"","H穣 x竎 nh薾 ngi 產ng m芻 trang b? mu鑞 ch? t筼!")
				return 0
			end
		else
			equip_index = GetPlayerEquipIndex(equip_seq)
		end
		if equip_index == 0 then
			Talk(1,"","H穣 x竎 nh薾 ngi 產ng m芻 trang b? mu鑞 ch? t筼!")
			return 0
		else
			local del_flag = DelItemByIndex(equip_index,-1)
			if del_flag == 1 then
				return 1
			else
				Talk(1,"","H穣 x竎 nh薾 ngi 產ng m芻 trang b? mu鑞 ch? t筼!")
				WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."X鉧:"..equip_id[1]..":"..equip_id[2]..":"..equip_id[3].." th蕋 b筰, k? hi謚:"..del_flag)
				return 0
			end
		end
	end
end
--材料携带检测
function refound_mertiral_chk(equip_diff,deal_flag)
	for i = 1, getn(Tb_refound_mertiral[equip_diff]) do
		if deal_flag == 1 then	--携带检测
			if GetItemCount(Tb_refound_mertiral[equip_diff][i][1],Tb_refound_mertiral[equip_diff][i][2],Tb_refound_mertiral[equip_diff][i][3]) < Tb_refound_mertiral[equip_diff][i][4] then
				Talk(1,"","Ch? t筼 <color=yellow>"..Tb_refound_att_name[equip_diff].."<color> c莕 <color=yellow>"..Tb_refound_mertiral[equip_diff][i][4].."<color> <color=yellow>"..Tb_refound_mertiral[equip_diff][i][5].."<color> Ngi mang theo kh玭g , trc ti猲 ngi m? b秐 v? ra xem c遪 c莕 nguy猲 li謚 g? sau  th? l筰.")
				return 0
			end
		else 	--删除检测
			if DelItem(Tb_refound_mertiral[equip_diff][i][1],Tb_refound_mertiral[equip_diff][i][2],Tb_refound_mertiral[equip_diff][i][3] ,Tb_refound_mertiral[equip_diff][i][4]) ~= 1 then
				Talk(1,"","Ch? t筼 <color=yellow>"..Tb_refound_att_name[equip_diff].."<color> c莕 <color=yellow>"..Tb_refound_mertiral[equip_diff][i][4].."<color> <color=yellow>"..Tb_refound_mertiral[equip_diff][i][5].."<color> Ngi mang theo kh玭g , trc ti猲 ngi m? b秐 v? ra xem c遪 c莕 nguy猲 li謚 g? sau  th? l筰.")
				WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."ng x鉧"..Tb_refound_mertiral[equip_diff][i][5].." nguy猲 li謚 kh玭g !")
				return 0
			end
		end
	end
	return 1
end
------------------------------------------------属性转换--------------------------------
--2007-12-11再次调整
TaskID_yandi_att_chg_num = 1289
function yandi_att_chg()
	Say("B﹜ gi? ta kh玭g c遪  Tinh L鵦  l祄 <color=yellow>trang b? Vi猰 д<color>, c? 甶襲 ta c? th? gi髉 c竎 ngi ch豱h s鯽 nh鱪g trang b? n祔, ta c? th? i v韎 gi? th蕄 cho ngi <color=yellow>3<color> l莕 <color=yellow>trang b? Vi猰 д<color>, m鏸 l莕 ch? thu <color=yellow>1 V? Ng蕁 Th駓<color>, n誹 thay i ti誴, m鏸 l莕 u c莕 <color=yellow>1 N? Oa tinh th筩h<color> m韎 c? th? i cho ngi. Kh玭g bi誸 "..Zgc_pub_sex_name().."Mu鑞 i thu閏 t輓h n祇 c馻 <color=yellow>trang b? Vi猰 д<color>?? (<color=yellow>Vi猰 д Gi竝<color> chuy觧 i th祅h t╪g <color=red>100<color> 甶觤 s竧 thng, <color=yellow>Vi猰 д Trang<color> chuy觧 i th祅h t╪g <color=red>60<color> 甶觤 s竧 thng)",
	6,
	"Ta mu鑞 t╪g 甶觤 t蕁 c玭g c馻 Vi猰 д Gi竝/#yandi_atti_chg(1,1)",
	"Ta mu鑞 t╪g 甶觤 s竧 thng c馻 Vi猰 д Gi竝/#yandi_atti_chg(1,2)",
	"Ta mu鑞 t╪g 甶觤 t蕁 c玭g c馻 Vi猰 д Trang/#yandi_atti_chg(3,1)",
	"Ta mu鑞 t╪g 甶觤 s竧 thng c馻 Vi猰 д Trang/#yandi_atti_chg(3,2)",
	"фi trang b? Vi猰 д c? g? kh竎/chg_atti_info",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--转换以后的属性变化
function chg_atti_info()
	Talk(1,"yandi_att_chg","Khi ngi kh玭g h礽 l遪g thu閏 t輓h c馻 <color=yellow>trang b? Vi猰 д<color> c? th? n ch? ta i. T╪g t蕁 c玭g l? thu閏 t輓h ngo筰 c玭g/ n閕 c玭g t╪g##? (<color=red>Vi猰 д Gi竝<color> t╪g n閕 ngo筰 c玭g <color=yellow>11%<color>, <color=red>Vi猰 д Trang<color> t╪g n閕 ngo筰 c玭g <color=yellow>5%<color>), t╪g s竧 thng l? t╪g thu閏 t輓h s竧 thng? (<color=red>Vi猰 д Gi竝<color> t╪g <color=yellow>100<color> 甶觤 s竧 thng, <color=red>Vi猰 д Trang<color> t╪g <color=yellow>60<color> 甶觤 s竧 thng). Nh璶g ta n鉯 trc, sau khi i<color=yellow>thu閏 t輓h ph遪g ng?<color> 甶觤 ph遪g th? s? thay i, trc khi i ph秈 c﹏ nh綾 c萵 th薾. Nh璶g i trang b? <color=yellow> cng h鉧<color> v蒼 gi? nguy猲, v? 甶觤 n祔 ngi c? y猲 t﹎.")
end
Tb_attitude_chg_info = {
	{2,268},
	{},
	{4,331}
}
--炎帝装备属性转换对话
function yandi_atti_chg(equip_diff,chg_flag)
	local chg_att = {
		{"T╪g thu閏 t輓h s竧 thng","T╪g t蕁 c玭g"},
		{"T╪g thu閏 t輓h t蕁 c玭g","T╪g s竧 thng"},
	}
	local chg_num  = GetTask(TaskID_yandi_att_chg_num)
	local need_goods = ""
	if chg_num < 3 then
		need_goods = "V? Ng蕁 Th駓"
	else
		need_goods = "N? Oa Tinh Th筩h"
	end
	Say("B﹜ gi? ngi c莕 i 1<color=yellow>"..need_goods.."<color> v祇,"..Zgc_pub_sex_name().."X竎 nh薾 mu鑞 ngi m芻 <color=yellow>"..Tb_refound_att[equip_diff][4].."<color> thu閏 t輓h th? nh蕋 chuy觧 th祅h <color=yellow>"..chg_att[chg_flag][2].."<color> ng kh玭g?",
		2,
		"Ta mu鑞 i/#yandi_atti_chg_deal("..equip_diff..","..chg_flag..")",
		"в ta suy ngh? l筰/end_dialog"
		)

end
--炎帝装备属性转换处理
function yandi_atti_chg_deal(equip_diff,chg_flag)
	local chg_num  = GetTask(TaskID_yandi_att_chg_num)
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,100) ~= 1 then
		return
	end
	--装备穿着检测
	if equipmen_deal_chk(equip_diff,1) ~= 1 then
		return
	end
	--装备是否锁定
	local equip_index = GetPlayerEquipIndex(equip_diff)
	local equip_level = GetEquipAttr(equip_index,2)
	if GetItemSpecialAttr(equip_index,"LOCK") == 1 then
		Talk(1,"","Trang b? 產ng kh鉧 kh玭g th? i thu閏 t輓h, sau khi m? kh鉧 h穣 th? l筰.")
		return
	end
	if chg_num < 3 then
		if GetItemCount(2,1,503) == 0 then
			Talk(1,"","фi thu閏 t輓h c馻 <color=yellow>Vi猰 д Thao Trang<color> s? t鑞 m閠 輙 nguy猲 li謚, l莕 n祔 thu <color=yellow>"..Zgc_pub_sex_name().."<color> B筺 c? m閠 <color=yellow>V? Ng蕁 Th駓<color> 產ng c莕 thanh l?!")
			return
		end
		if DelItem(2,1,503,1) ~= 1 then
			Talk(1,"","фi thu閏 t輓h c馻 <color=yellow>Vi猰 д Thao Trang<color> s? t鑞 m閠 輙 nguy猲 li謚, l莕 n祔 thu <color=yellow>"..Zgc_pub_sex_name().."<color> B筺 c? m閠 <color=yellow>V? Ng蕁 Th駓<color> 產ng c莕 thanh l?!")
			return
		end
	else
		if GetItemCount(2,1,504) == 0 then
			Talk(1,"","фi thu閏 t輓h c馻 <color=yellow>Vi猰 д Thao Trang<color> s? t鑞 m閠 輙 nguy猲 li謚, l莕 n祔 thu <color=yellow>"..Zgc_pub_sex_name().."<color> B筺 c? m閠 <color=yellow>N? Oa tinh th筩h<color> 產ng c莕 thanh l?!")
			return
		end
		if DelItem(2,1,504,1) ~= 1 then
			Talk(1,"","фi thu閏 t輓h c馻 <color=yellow>Vi猰 д Thao Trang<color> s? t鑞 m閠 輙 nguy猲 li謚, l莕 n祔 thu <color=yellow>"..Zgc_pub_sex_name().."<color> B筺 c? m閠 <color=yellow>N? Oa tinh th筩h<color> 產ng c莕 thanh l?!")
			return
		end
	end	
	--装备是否定魂
	local ding_flag = GetItemSpecialAttr(equip_index,"DING7")
	--装备删除检测
	if equipmen_deal_chk(equip_diff,2) ~= 1 then
		return
	else
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."X鉧 1  cng h鉧 l?:"..equip_level.."-"..Tb_refound_att[equip_diff][4])
	end
	--装备增加
	local add_flag = 0
	local new_equip_index = 0
	local attribute_level = 5
	if equip_diff == 3 then
		attribute_level = 1
	end
	if chg_flag == 2 then
		add_flag,new_equip_index = AddItem(Tb_refound_att[equip_diff][1],Tb_refound_att[equip_diff][2],(Tb_refound_att[equip_diff][3]+GetBody()),1,1,Tb_attitude_chg_info[equip_diff][1],Tb_attitude_chg_info[equip_diff][2],-1,-1,-1,-1,0,equip_level)
	else
		add_flag,new_equip_index = AddItem(Tb_refound_att[equip_diff][1],Tb_refound_att[equip_diff][2],(Tb_refound_att[equip_diff][3]+GetBody()),1,1,-1,-1,-1,-1,-1,-1,0,equip_level)
	end
	if add_flag == 1 then
		local dialog_remain_time = ""
		local remain_time = 2 - chg_num
		if remain_time <= 0 then
			dialog_remain_time = "B筺 kh玭g c遪 c? h閕 s? d鬾g <color=yellow>V? Ng蕁 Th駓<color>  i n鱝, l莕 sau mu鑞 i c莕 ph秈 c? 1 <color=yellow>N? Oa tinh th筩h<color>!"
		else
			dialog_remain_time = "B筺 v蒼 c遪 <color=yellow>"..remain_time.."<color> l莕 s? d鬾g <color=yellow>V? Ng蕁 Th駓<color> i, l莕 sau mu鑞 i c莕 ph秈 c? 1 <color=yellow>N? Oa tinh th筩h<color>!"
		end
		if ding_flag == 1 then
			SetItemSpecialAttr(new_equip_index,"DING7",1)
		end
		Talk(1,"","фi 頲 r錳, "..Zgc_pub_sex_name().."C莔 l蕐!"..dialog_remain_time)
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."Nh薾 頲 1  cng h鉧:"..equip_level.."-"..Tb_refound_att[equip_diff][4])
	else
		WriteLog("c trang b? Vi猰 Ho祅g: Ngi ch琲"..GetName().."ng thay i cng "..equip_level.."-"..Tb_refound_att[equip_diff][3].."Khi thu閏 t輓h t╪g trang b? th蕋 b筰, k? hi謚 th蕋 b筰:"..add_flag)
	end
	SetTask(TaskID_yandi_chg_num,(GetTask(TaskID_yandi_chg_num)+equip_diff))
	SetTask(TaskID_yandi_att_chg_num,(GetTask(TaskID_yandi_att_chg_num)+1))
end
-----------------------------------------------图纸交换---------------------------------
--给我10块钱，给你一张paper
function refound_paper_chg(paper_diff)
	if paper_diff == 2 then
		if GetPlayerRoute() == 0 then
			Talk(1,"","Ta kh玭g th? gi髉 ngi ch璦 nh藀 m玭 ph竔 n祇 ch? t筼 <color=red>trang b? Ho祅g д<color>!")
			return
		end
		if Tb_huandi_equip[4][GetPlayerRoute()] [1]== nil  then
		Talk(1,"","Ta kh玭g th? gi髉 ngi ch璦 nh藀 m玭 ph竔 n祇 ch? t筼 <color=red>trang b? Ho祅g д<color>!")
		return
		end
	end
	Say("Ngi mu鑞 ch? t筼 <color=red>"..Tb_refound_att_name[paper_diff].."<color>? K? n╪g ph鑙 ch? n祔 ta c鵦 kh? t譵 ra, mu鑞 ta ch? kh玭g ngi sao, c遪 mu鑞 ta gi髉 ngi ch? t筼 n鱝 ?? Kh玭g d? th? u. Ta c莕 <color=yellow>10<color> vi猲 <color=yellow>B╪g th筩h tinh luy謓<color>  ch? t筼, ngi h穣 甧m n y ta m韎 cho ngi k? n╪g ph鑙 ch?. Th? n祇, ngi c莕 t蕀 <color=yellow>k? n╪g ph鑙 ch?<color> n祔 kh玭g? Qua kh醝 th玭 n祔 kh玭g c遪 qu竛 tr? n祇 u.",
	2,
	"Ta c莕 1 t蕀 b秐 v?/#paper_chg("..paper_diff..")",
	"M綾 th?, th玦, ta kh玭g c莕 n鱝/end_dialog"
	)
end
--给钱
function paper_chg(paper_diff)
	--物品携带检测
	if GetItemCount(2,1,533) < 10 then
		Talk(1,"","Ch? c? ngh? n chuy謓 l鮝 ta <color=yellow>b秐 v?<color>, ta t鑞 r蕋 nhi襲 c玭g s鴆 m韎 nghi猲 c鴘 ra.")
		return
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--物品删除检测
	if DelItem(2,1,533,10) ~= 1 then
		Talk(1,"","Ch? c? ngh? n chuy謓 l鮝 ta <color=yellow>b秐 v?<color>, ta t鑞 r蕋 nhi襲 c玭g s鴆 m韎 nghi猲 c鴘 ra.")
		return
	else
		local add_flag = AddItem(2,1,Tb_refound_paper_info[paper_diff][1],1)
		if add_flag == 1 then
			Talk(1,"","C莔 l蕐, y l? <color=yellow>b秐 v? ch? t筼<color> ngi c莕, t譵  <color=yellow>nguy猲 li謚<color> ghi tr猲 b秐 v?, mang theo b秐 v?, m芻 <color=red> mu鑞 ch? t筼 l猲 ngi"..Tb_refound_att_name[paper_diff].."<color> ho芻 mang <color=yellow>Vi猰 Ho祅g Thi誸 H錸<color>, n t譵 ta l? ch? t筼 頲!")
			return
		else
			WriteLog("Th╪g c蕄 Vi猰 д Trang: Ngi ch琲 "..GetName().."Nh薾 b秐 v? th蕋 b筰, k? hi謚 th蕋 b筰:"..add_flag)
		end
	end
end
function refuond_info()
	Talk(1,"","<color=green>M筩 Чi<color>: Ta c? th? gi髉 ngi chuy觧 ho? <color=yellow>trang b? Vi猰 д ho芻 trang b? Ho祅g д<color> th祅h <color=red><color><color=yellow>trang b? Vi猰 д ho芻 trang b? Ho祅g д<color> tng 鴑g<color=red><color> b蕋 k?. Sau khi suy ngh? xong, h穣 mang 1 b秐 v? n ch? ta, chu萵 b? c <color=yellow>trang b? Vi猰 д ho芻 trang b? Ho祅g д<color>. N誹 ngi kh玭g c? <color=yellow>trang b? Vi猰 д ho芻 trang b? Ho祅g д<color>, th? c騨g c? th? n <color=yellow>Ng? C竎<color> th? v薾 may, r錳 mang <color=yellow>Vi猰 Ho祅g thi誸 h錸<color> n cho ta c騨g 頲. Nh璶g n誹 nh? v藋, th? trang b? ch? t筼 ra <color=yellow>s? kh玭g c? hi謚 qu? cng ho?<color> u.")
end
--老的对话
function old_dia()
	local strtab = {
		"H鋍 k? n╪g ch? t筼 binh kh? d礽/luaLearnLifeSkill",
		"H鋍 c竎h ph鑙 ch? ho芻 l祄 nhi謒 v? ph鑙 ch?/learn_all_recipe",
		"Qu猲 k? n╪g ch? t筼 binh kh? d礽/forget_life_skill",
--		"Nh鱪g 甶襲 li猲 quan v? trang b? B竧 Qu竔/bagua",
		"H鋍 c竎h l祄 v? kh? linh kh? c蕄 76/xinwuqi",
		"T譵 hi觰 v藅 ph? gia/Dating",
	}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"ti誴 t鬰 nhi謒 v? h鋍 t藀 Linh Th筩h B竧 Qu竔/task_new3");
	end
	tinsert(strtab,"R阨 kh醝/SayHello")
    Say(strTitle.."K? n╪g ch? t筼 v? kh? c馻 ta v飊g n祔 c? m閠 kh玭g hai, c bi謙 l? binh kh? d礽, th? n祇 c? mu鑞 mua m閠 c竔 kh玭g?",
    getn(strtab),strtab)
end
--============================================炎帝装转换对话结束====================================
-- 所有配方相关的事情
function learn_all_recipe()
	Say(strTitle.."Ngi mu鑞 h鋍 c竎h ph鑙 ch? ho芻 l祄 nhi謒 v? ph鑙 ch??",
		7,
			"H鋍 c竎h ph鑙 ch? m韎/luaLearnRecipe",
			"H鋍 ph鑙 ch? trang b? Linh у/learnLtEquip",
    	"H鋍 c竎h ph鑙 ch? d祅h cho ho箃 ng cu鑙 tu莕/Weekend",
    	"Xem nh薾 頲 nhi謒 v? v? kh? c蕄 76 kh玭g/get_76_task",
    	"H鋍 c竎h ph鑙 ch? c蕄 76/relearn_76_recipe",
    	"Kh玭g h鋍 頲 s鯽 c竎h gh衟/LearnRecipe",
    	"R阨 kh醝/SayHello")
end;


-- 接受76级配方任务
function get_76_task()
 	-------------------------------------76级武器配方任务-------------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_76 = GetTask(TASK_76WEAPON);
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU);
		
	--长兵器制造系配方任务
	if (nSkillGenre == 1 and nSkillDetail == 2 and nSkillLevel >= 79) then
		--尚未触发配方任务
		if nTaskState_76 == 0 then
			weapon_76_001(1)
			return
		--上交武器
		elseif nTaskState_76 == 1 then
			weapon_76_002(1)
			return
		--未与五位掌门对话
		elseif nTaskState_76 == 2 then
			weapon_76_004(1)
			return
		--已经与五位掌门对话
		elseif nTaskState_76 == 3 then
			weapon_76_005(1)
			return
		--选择学习神兵的方向
		elseif nTaskState_76 == 4 then
			weapon_76_choice(1)
			return
		end			
	end
	
	--制药系黑钨精石配方任务
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--取得玄石
		if nTaskState_heiwu == 3 then
			medicine_heiwu_007()
			return
		--未将玄石交予游方医生
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_008()
			return
		end
	end
		
	--提示玩家76级武器配方任务
	if nSkillGenre == 1 and nSkillDetail ~= 2 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B筺 ch璦  甶襲 ki謓 nh薾 nhi謒 v? ph鑙 ch? c蕄 76.", 0)
end;

-- 补学76级配方
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (nGene == 1 and nSkillID == 2) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(795) == 0 and HaveLearnRecipe(800) == 0 and HaveLearnRecipe(801) == 0) then
				Say("H穣 ch鋘 1 lo筰 v? kh? b筺 mu鑞 h鋍 c竎h ch? t筼:",
					4,
					"Trng/learn_long_1",   
					"c玭 b鎛g/learn_long_2",  
					"Thng/learn_long_3",    
					"Ta suy ngh? l筰/SayHello")
			else
				Say("B筺  h鋍 頲 phng ph竝 ph鑙 ch? m韎!", 0)
			end
		else
			Say("Ngi v蒼 ch璦 ho祅 th祅h nhi謒 v? ch? t筼 binh kh? d礽 c蕄 67", 0)
		end
	else
		Say("B筺 v蒼 ch璦 ho祅 th祅h k? n╪g: <color=yellow>Ch? t筼 Binh kh? d礽<color>!", 0)
	end
end;
-- 杖
function learn_long_1()
	AddRecipe(800)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: A La H竛 Trng")
end;
-- 棍棒
function learn_long_2()
	AddRecipe(795)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Li謙 Di謒")
end;
-- 枪
function learn_long_3()
	AddRecipe(801)
	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi H祇 L玦 Thng")
end;


-- 遗忘生活技能
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 2) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."Зy l? l莕 th? "..(nForgetTimes + 1).." l莕 b? k? n╪g s秐 xu蕋, m蕋 "..nShouldPay.." lng, ngi suy ngh? k? ch璦?",
			2,
			"Ta  quy誸 nh r錳!/forget_now",
			"Khoan ! Ch? ta suy ngh? l筰!/SayHello")
	else
		Say(strTitle.."K? n╪g ch? t筼 binh kh? d礽 ngi v蒼 ch璦 h鋍, ta s? gi髉 ngi.", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- 主技能
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 2) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 2)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(1600,0);--清空79级武器配方任务
				SetTask(1601,0);--清空79级武器配方任务
				Msg2Player("Ngi qu猲 k? n╪g ch? t筼 binh kh? d礽 r錳")				
			end
		else
			Say(strTitle.."Ngi kh玭g mang theo  ti襫! L蕐 ti襫 r錳 h穣 n nh?!", 0)
		end
	end
end;


------------------------------------------时间判定--------------------------------------------
 --返回星期几，0代表星期天
function GetWeekDay()
	return tonumber(date("%w"))
end;

--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23点59分
function CheckTime(day)
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--换算19:00 - 24:00是什么区间
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;




--**********************************************技能学习部分***************************************
--技能学习选择
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B筺 kh玭g  <color=yellow>c蕄 10<color> ch??th? h鋍 k? n╪g s鑞g.", 0)
    	return
	end

    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."Ngi c莕 h駓 k? n╪g s秐 xu蕋 m韎 h鋍 ti誴 k? n╪g ch? t筼 binh kh? d礽.", 0)
		return
	end
    
	Say(strTitle.."<color=yellow>Ch? t筼 Binh kh? d礽<color> s? thay th? k? n╪g s秐 xu蕋, c? mu鑞 h鋍 kh玭g?",
    	2,
    	"Ta mu鑞 h鋍/LearnYes",
    	"в ta suy ngh? l筰/LearnNo")
end

--学习技能
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 2, 1, 79, 1)) then
        	Msg2Player("B筺 h鋍 頲 k? n╪g ch? t筼 binh kh? d礽, nh薾 頲 3 H綾 Kim Ph蕁.")
        	AddItem(2, 2, 59, 3)
    	end
    	
    	AddRecipe(86)
        Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th駓 H醓 C玭")
    	AddRecipe(87)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? B譶h C玭")
    	AddRecipe(97)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T輈h Trng")
    	AddRecipe(98)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ho籲g Ph竝 Trng")
        AddRecipe(749)
        Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
    	AddRecipe(750)
    	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
    	SetTask(LEV_LEARNRECIPE, 10)
    	
	else
		Say (strTitle.."B筺  h鋍 k? n╪g s鑞g, kh玭g th? h鋍 th猰 k? n╪g kh竎.",0)
	end
end;

--取消学习技能
function LearnNo()
    Say(strTitle.."H穣 suy ngh? k? r錳 quay l筰 y nh?!", 0)
end
--长兵器配方不能学习的错误修复
function LearnRecipe()
    SetTask(LEV_LEARNRECIPE, 0)
end


--**********************************************配方学习部分***************************************
--学习新的配方
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (GetLifeSkillLevel(1, 2) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(749) == 0) then
        	AddRecipe(749)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        	AddRecipe(750)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
       	elseif (GetTask(LEV_LEARNRECIPE) == 20 and HaveLearnRecipe(749) == 0) then
        	AddRecipe(749)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        	AddRecipe(750)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        	AddRecipe(753)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
       elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(749)==0 then
       		AddRecipe(749)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        	AddRecipe(750)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        	AddRecipe(753)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        	AddRecipe(754)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        	AddRecipe(755)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
       	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        	AddRecipe(750)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        	AddRecipe(753)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        	AddRecipe(754)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        	AddRecipe(755)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        	AddRecipe(756)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
       	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        	AddRecipe(750)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        	AddRecipe(753)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        	AddRecipe(754)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        	AddRecipe(755)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        	AddRecipe(756)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        	AddRecipe(757)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
       	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
        	AddRecipe(750)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        	AddRecipe(753)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        	AddRecipe(754)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        	AddRecipe(755)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        	AddRecipe(756)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        	AddRecipe(757)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
        	AddRecipe(758)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Trng B竧 X? M﹗")
       	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(749)==0 then
        	AddRecipe(749)
	        Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
    	    AddRecipe(750)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        	AddRecipe(753)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        	AddRecipe(754)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        	AddRecipe(755)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        	AddRecipe(756)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        	AddRecipe(757)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
        	AddRecipe(758)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Trng B竧 X? M﹗")
        	AddRecipe(759)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Thi猲 K輈h")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(749)==1 and HaveLearnRecipe(759)==0 then
        	AddRecipe(759)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Thi猲 K輈h")
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
			AddRecipe(86)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Th駓 H醓 C玭")
    		AddRecipe(87)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? B譶h C玭")
    		AddRecipe(97)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T輈h Trng")
    		AddRecipe(98)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ho籲g Ph竝 Trng")
        	AddRecipe(749)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi誸 Thng")
    		AddRecipe(750)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: 觤 Cang Thng")
    		SetTask(LEV_LEARNRECIPE, 10)
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(88)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? ч C玭")
        	AddRecipe(89)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H筩 V? C玭")
        	AddRecipe(99)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Tam B秓 Trng")
        	AddRecipe(100)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph鬰 Ma Trng")
        	AddRecipe(751)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: L鬰 L╪g Thng")
        	AddRecipe(752)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: C﹗ Li猰 Thng")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(90)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph﹏ Th駓 C玭")
        	AddRecipe(101)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? ч Trng")
        	AddRecipe(753)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Truy H錸 Thng")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(91)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ti襪 Long C玭")
        	AddRecipe(92)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? Kim Lng")
        	AddRecipe(102)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Nguy謙 Lu﹏ Trng")
        	AddRecipe(103)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kh玭g Minh Trng")
        	AddRecipe(754)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: T? C鑤 Thng")
        	AddRecipe(755)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: X輈h Nguy謙 Thng")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(93)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ф C萿 B鎛g")
        	AddRecipe(94)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Kh萵 Na La B鎛g")
        	AddRecipe(104)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: B秓 Quang Trng")
        	AddRecipe(105)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi T? T筰 Trng")
        	AddRecipe(756)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ng﹏ X? Thng")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
	        AddRecipe(95)
    	    Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 X? C玭")
        	AddRecipe(106)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi B竧 Nh? Trng")
        	AddRecipe(757)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: H醓 Ti猰 Thng")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(96)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thanh Long C玭")
        	AddRecipe(107)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Ph藅 Trng")
        	AddRecipe(758)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Trng B竧 X? M﹗")
        	SetTask(LEV_LEARNRECIPE,70)
      elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
        	AddRecipe(759)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Ph? Thi猲 K輈h")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say(strTitle..": ng qu? n玭 n鉵g, kinh nghi謒 giang h? ngi c遪 k衜 l緈, c? g緉g th猰 nh?!",0)
    	end
    end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 2)
	if nLevel >= 79 then
    	AddRecipe(1115)
    	Msg2Player(format("Х h鋍 ph鑙 ch? m韎: %s", "Linh у C竔 Bang C玭"))
    	AddRecipe(1121)
    	Msg2Player(format("Х h鋍 ph鑙 ch? m韎: %s", "Linh у Thi誹 L﹎ Trng"))
    	AddRecipe(1124)
    	Msg2Player(format("Х h鋍 ph鑙 ch? m韎: %s", "Linh у Dng M玭 Thng"))
	else
    	Say(strTitle..": ng qu? n玭 n鉵g, kinh nghi謒 giang h? ngi c遪 k衜 l緈, c? g緉g th猰 nh?!",0)
	end
end

--活动函数
function Weekend()
	if (GetLifeSkillLevel(1, 2) >= 1) then
    	if GetTask(HaveWeekend)==1 then
        	Say(strTitle.."Ngi  h鋍 h誸 c竎 k? n╪g ? ch? ta r錳!", 0)
		elseif (CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1) then
    		Talk(1,"",strTitle.."Ti襫 tuy課 chi課 tranh 竎 li謙, ta c? 1 c竎h ch? t筼 v? kh? c o mu鑞 truy襫 th? cho ngi. H穣 ch? t筼 trng m﹗ cho c竎 binh s? ra chi vi謓 cho ti襫 tuy課!")
    		AddRecipe(227)
    		Msg2Player("B筺 h鋍 頲 ph鑙 ch?-- Trng m﹗ qu﹏ d鬾g!")
    		SetTask(HaveWeekend,1)
    	end
    else
    	Say(strTitle.."B筺 ch璦 h鋍 qua c竎h ch? t筼 binh kh? d礽 ho芻 th阨 gian ch璦 n! Ta kh玭g th? truy襫 th? cho ngi!", 0)
    end
end;

--添加物信息
function Dating()
	Talk(1,
		 "",
		 strTitle.."Mu鑞 ch? t筼 1 binh kh? tuy謙 th? v? song, c莕 ph秈 b? th猰 nhi襲 v藅 ph? gia, ngi h穣 th? b? th猰 1 s? v藅 li謚 t鑤, c? th? s? r蘮 頲 nh鱪g v? kh? c? m閠 kh玭g hai.")
end;

--取消函数
function SayHello()

end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang b? B竧 Qu竔<color> l? t﹎ huy誸 c? i c馻 huynh  M筩 gia ch髇g ta v? Tng Dng L穙 L璾, C玭g D? Th? Gia, C萴 Nng c飊g nhau nghi猲 c鴘 ra. N誹 nh薾 頲 v礽 m鉵  c馻 Linh Th筩h ngi 甶 h醝 con ch竨 c馻 C玭g D? Th? Gia, n誹 ngi mu鑞 t譵 hi觰 l祄 th? n祇  ch? t筼 1 trang b? c? th?<color=yellow>Kh秏 n筸 linh th筩h<color>, th? n ch? ta y.",
	4,
	"L祄 sao ch? t筼 trang b? c? l? kh秏 n筸/kongzhuangbeizhizuo",
	"V藅 ph萴 th猰 v祇 c? t竎 d鬾g g?/tianjiawu",
	"L祄 sao trang b? 頲 ch? t筼 th祅h trang b? B竧 Qu竔/xiangqianzhuyi",
	"дn h醝 th╩ th玦 m?!/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."R蕋 n gi秐, qua nghi猲 c鴘 c馻 b鋘 ta, c秈 ti課 phng ph竝 ch? t筼 ta truy襫 th? cho c竎 ngi, b﹜ gi? ngi 產ng thu th藀 nguy猲 li謚 ? khu v鵦 thu th藀, nh鱪g trang b? ch? t筼 ra c? m鴆 linh kh? t鑙 產 v? c? th? c? l? kh秏 n筸, nh璶g m? c騨g ch輓h v? v藋, nh鱪g trang b? c? thu閏 t輓h linh kh? kh玭g c遪 ch? t筼 頲 n鱝.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V筺 v藅 tr猲 th? gian u c? gi? tr? ri猲g, gi? tr? t飝 v祇 linh kh? 輙 hay nhi襲, khi ch? t筼 trang b? t╪g v藅 ph萴 th猰 v祇, c? th? t╪g m鴆 linh kh? t鑙 產 v? t╪g s? l? kh秏 n筸 linh th筩h tr猲 trang b?. M鴆 linh kh? t鑙 產 c馻 trang b? quy誸 nh m鴆 linh kh?  kh秏 n筸 linh th筩h, v? s? l? quy誸 nh n? c? th? kh秏 bao nhi猽 linh th筩h, c? th? th祅h thu閏 t輓h b竧 qu竔 hay kh玭g, cho n猲 n誹 頲 th? c? g緉g th猰 v礽 v藅 c? gi? tr?.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."? tr猲  nh綾 n r錳, tr猲 trang b? c? m鴆 linh kh? t鑙 產 v? l? kh秏 n筸, 1 trang b? kh秏 <color=yellow>3 vi猲<color> linh th筩h, khi m鴆 linh kh? c馻 3 vi猲 linh th筩h b籲g v韎 m鴆 linh kh? t鑙 產 c馻 trang b?, s? h譶h th祅h trang b? thu閏 t輓h b竧 qu竔. Linh th筩h l? s? l? th? m鴆 linh kh? ﹎, Linh th筩h l? s? ch絥 th? m鴆 linh kh? dng, n誹 th? t? Linh Th筩h 頲 kh秏 kh玭g gi鑞g nhau, th? trang b? c? thu閏 t輓h b竧 qu竔 kh竎 nhau, tr猲 \'B竧 qu竔 B秓 觧\' d祅h cho h藆 du? c馻 C玭g D? Th? Gian c? ghi r蕋 r? l祄 th? n祇  ch? t筼 1 trang b? c? thu閏 t輓h b竧 qu竔 mong mu鑞, c? th阨 gian th? xem.")
end

function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 2)
	if (GetLifeSkillLevel(1, 2) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1010) == 0) then
        	AddRecipe(1011)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Чi H祇 L玦 Thng")
        	AddRecipe(1005)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Li謙 Di謒")
        	AddRecipe(1010)
        	Msg2Player("B筺 h鋍 頲 ph鑙 ch?: A La H竛 Trng")
       else
        	Say(strTitle.."N祔, ngi thanh ni猲, ng s鑤 ru閠, t? ch蕋 c馻 ngi b﹜ gi? c遪 k衜 l緈, i ngi s? d鬾g th祅h th筼 t蕋 c? c竎 lo筰 binh kh? d礽 th玭g thng, l骳  n t譵 ta.",0)
		end
	else
		Talk(1,"","Ngi v蒼 ch璦 h鋍 k? n╪g n祔!")
	end
end

function update_max_skill_level()
	Say(strTitle..format("M? r閚g c蕄 k? n╪g s秐 xu蕋 c莕 k? n╪g thu th藀 t c蕄 79 ng th阨 ti猽 hao %d V祅g", 1000), 
		2, "уng ?/update_max_skill_level_ensure", "T筰 h? ch? xem qua th玦/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 2) < 79 then
		Talk(1,"",format("Hi謓 t筰 c蕄 k? n╪g s秐 xu蕋 ch璦 t c蕄 %d, kh玭g th? m? r閚g c蕄 gi韎 h筺 k? n╪g", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng﹏ lng kh玭g  %d v祅g", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 2, 99);
	Msg2Player("Ch骳 m鮪g c蕄 gi韎 h筺 k? n╪g s秐 xu蕋  t c蕄 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
