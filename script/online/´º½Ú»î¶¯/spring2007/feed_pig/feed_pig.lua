--脚本功能：2007年春节活动
--脚本开发：赵贵春
--脚本涉及任务ID：变量：1275-，主变量：
Include("\\script\\online\\zgc_public_fun.lua")
--2007年春节活动TaskID记录
TaskID_spring2007_pig_color =976
TaskID_spring2007_pig_sex = 977

TaskID_spring2007_create_time = 978

TaskID_spring2007_pig_feedtime = 979
TaskID_spring2007_pig_handtime = 980
TaskID_spring2007_pig_borntotal = 981
TaskID_spring2007_pig_bornseq = 982
TaskID_spring2007_pig_bornnumtoday = 983
TaskID_spring2007_pig_backcode1 = 984
TaskID_spring2007_pig_backcode2 = 985
Goods_Id_feed_pig_book = 615
Goods_Id_pig_ran_color_sex = 616
Goods_Id_pig_black_ran_sex = 618
Goods_Id_pig_white_ran_sex = 620
Goods_Id_pig_any_color_sex = 622
Goods_Id_golden_pig = 624
Goods_Id_catch_pig_stick = 626
--***************************物品使用主函数****************************
function OnUse(goods_index)
	if zgc_pub_day_turn(1) > 13576 then			--活动时间判断
		return
	end
	local goods_id = GetItemParticular(goods_index)
	if goods_id == Goods_Id_feed_pig_book then
		pig_book_use()
	else
		pig_baby_use(goods_id)
	end
end
--*************************猪宝宝的使用********************************
function pig_baby_use(goods_id)					--猪宝宝的使用
	if goods_id == Goods_Id_pig_ran_color_sex then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 頲 th? c璶g m祏 s綾 t飝 ?, ngi ng ? ch??",
		2,
		"Ta ng ?/#pig_create(0,0,"..goods_id..")",		--性别、颜色、物品索引
		"в ta suy ngh? l筰/end_dialog")		
	elseif goods_id == Goods_Id_pig_black_ran_sex then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 H綾 tr?, ngi ng ? ch??",
		2,
		"Ta ng ?/#pig_create(1,0,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == Goods_Id_pig_white_ran_sex then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 頲 B筩h tr?, ngi ng ? ch??",
		2,
		"Ta ng ?/#pig_create(2,0,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == Goods_Id_pig_any_color_sex then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 頲 th? c璶g t飝 ?, ngi ng ? ch??",
		5,
		"Ta mu鑞 g鋓 B筩h Tr? (b?)/#pig_create(2,1,"..goods_id..")",
		"Ta mu鑞 g鋓 B筩h Tr? (m?)/#pig_create(2,2,"..goods_id..")",		
		"Ta mu鑞 g鋓 H綾 tr? (b?)/#pig_create(1,1,"..goods_id..")",
		"Ta mu鑞 g鋓 H綾 tr? (m?)/#pig_create(1,2,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == Goods_Id_golden_pig then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 頲 Ho祅g kim tr?, ngi ng ? ch??",
		3,
		"Ta mu鑞 g鋓 Ho祅g kim tr? (b?)/#pig_create(3,1,"..goods_id..")",
		"Ta mu鑞 g鋓 Ho祅g kim tr? (m?)/#pig_create(3,2,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	end
end
--*************************养猪宝典的使用******************************
function pig_book_use()
	if GetFollower() == 0 or GetFollower() == nil then
		Say("Ngi mu鑞 th? c璶g c? nh鱪g ng t竎 g??",
		2,
		"Ta mu鑞 a th? c璶g/pig_out",
		"R阨 b秓 甶觧/end_dialog")
	else
		Say("Ngi mu鑞 th? c璶g c? nh鱪g ng t竎 g??",
		2,
		"Ta mu鑞 thu h錳 th? c璶g/pig_in",
		"R阨 b秓 甶觧/end_dialog")
	end
end
--*************************收回猪宝宝*********************************
function pig_in()
	KillFollower()
	Talk(1,"","B筺  thu h錳 頲 th? c璶g, sau n祔 c? th? m? B秓 觧 ra  g鋓 l筰.")
end
--*************************猪宝宝的创建********************************
function pig_create(pig_color,pig_sex,goods_id)
	SetTask(TaskID_spring2007_pig_color,pig_color)			--猪的颜色
	SetTask(TaskID_spring2007_pig_sex,pig_sex)			--猪的性别
	SetTaskTemp(165,goods_id)
	--先删除目前的跟宠，然后添加新的跟宠，并在976中记录下跟宠信息
	AskClientForString("pig_create_rtn","",0,16,"Xin nh藀 t猲 c馻 th? c璶g")
end
--****************************放出猪宝宝*******************************
function pig_out()
	local pig_clolor = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_color)
	if pig_clolor == 0 or pig_sex == 0 then
		Talk(1,"","B筺 kh玭g c? th? c璶g!")
		return
	end
	AskClientForString("pig_out_rtn","",0,16,"Xin nh藀 t猲 c馻 th? c璶g")
end
--********************************猪宝宝的创建**************************
function pig_create_rtn(pig_name)
	if pig_name == "" then
		Talk(1,"","T猲 c馻 th? c璶g kh玭g th? b? tr鑞g!")
		return
	end
	if pig_name_chk(pig_name) == 0 then
		return
	end
	local goods_id = GetTaskTemp(165)
	if DelItem(2,0,goods_id,1) ~= 1 then					--判断删除道具是否成功
		Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c? th? c璶g <color=red>Ti觰 Tr?<color>!")
		return
	end
	local pig_diff = pig_crt(pig_name)
	if pig_diff ~= 0 then
		SetTask(TaskID_spring2007_create_time,GetTime())
		AddItem(2,0,615,1)
		Talk(1,"","Ch骳 m鮪g b筺  g鋓 頲 m閠 <color=green>"..pig_diff.."<color>, v? nh薾 頲 m閠 quy觧 B秓 觧")
	end
end
--****************************猪宝宝放出*******************************
function pig_out_rtn(pig_name)
	if pig_name_chk(pig_name) == 0 then
		return
	end
	local pig_diff = pig_crt(pig_name)
	if pig_diff ~= 0  then
		Talk(1,"","B筺  g鋓 頲 <color=green>"..pig_diff.."<color>!")
	end
end
--****************************猪宝宝的创建回调*************************
function pig_crt(pig_name)
	local pig_color = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_sex)
	local pig_level = 1
	local pig_table = {			--四个等级的猪
		{{"Ti觰 H綾 tr? (b?)","Ti觰 H綾 tr? (m?)"},{"Ti觰 B筩h tr? (b?)","Ti觰 B筩h tr? (m?)"},{"Ti觰 Kim tr? (b?)","Ti觰 Kim tr? (m?)"}},
	}
	if pig_sex == 0 then
		pig_sex = random(1,2)
	end
	if pig_color == 0 then
		pig_color = random(1,2)
	end
	SetTask(976,pig_color)
	SetTask(977,pig_sex)
	SummonNpc(pig_table[pig_level][pig_color][pig_sex],pig_name)
	return pig_table[pig_level][pig_color][pig_sex]
end
--**************************猪宝宝的名字检测**************************
function pig_name_chk(pig_name)
	if pig_name == "" then
		Talk(1,"","T猲 c馻 th? c璶g kh玭g th? b? tr鑞g!")
		return 0
	end
	--**************************名字过滤****************************
	local pigname_forbid_chr = {"C莡","B?","Qu﹏","L玦","Qu﹏","Kim S琻","ch輓","Tuy謙","JS","фng Ca Minh","Chung Th?"}
	for i = 1,getn(pigname_forbid_chr) do
		local startS,endS = strfind(pig_name,pigname_forbid_chr[i])
		if startS then
			Talk(1,"pig_rename","T猲 c馻 th? c璶g kh玭g ng, xin nh藀 l筰!")
			return 0
		end
	end
	
end
