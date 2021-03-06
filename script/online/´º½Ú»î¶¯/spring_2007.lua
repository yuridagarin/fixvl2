--脚本功能：2007年春节活动
--脚本开发：赵贵春
--脚本涉及任务ID：变量：1275-，主变量：
Include("\\script\\online\\zgc_public_fun.lua")
--2007年春节活动TaskID记录
TaskID_spring2007_pig_color =976
TaskID_spring2007_pig_sex = 977
TaskID_spring2007_pig_level = 978
TaskID_spring2007_pig_feedtime = 979
TaskID_spring2007_pig_handtime = 980
TaskID_spring2007_pig_borntotal = 981
TaskID_spring2007_pig_bornseq = 982
TaskID_spring2007_pig_bornnumtoday = 983
TaskID_spring2007_pig_backcode1 = 984
TaskID_spring2007_pig_backcode2 = 985
--2007年春节活动时间区域
spring_2007_date_min = 13552
spring_2007_date_max = 13569
--***************************物品使用主函数****************************
function OnUse(goods_index)
	if Zgc_pub_action_level_chk() ~= 1 then		--等级判断
		return
	end
	if zspring_2007_date_chk() ~= 1 then		--活动时间判断
		return
	end
	local goods_id = GetItemParticular(goods_index)
	Msg2Player(goods_id)
	if goods_id >= 546 and goods_id <= 551 then		--猪宝宝
		--test
		--修改为测试其现在是否有跟宠物
		if GetTask(TaskID_spring2007_pig_color) == nil or GetTask(TaskID_spring2007_pig_color) == 0 then
			pig_baby_use(goods_id)
		else
			Talk(1,"end_dialog","Ngi  c? Pet r錳, mu鑞 g鋓 l筰 Pet m韎 ph秈 d飊g XXX ph鉵g th輈h!")
		end
	elseif goods_id == 552 then						--释放猪宝宝道具
		Say("D飊g v藅 ph萴 <color=red>ph鉵g th輈h<color> pet, sau  g鋓 l筰 pet m韎.",
		2,
		"фi/pig_delete_chk",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == 553 then						--养猪宝典			--test:这里判断不足。有问题。
		local dialog_pig = {}				--猪是放还是收的对话
		if GetFollower() == 0 then
			dialog_pig[1] = "Ta mu鑞 a th? c璶g/pig_out"
			dialog_pig[2] = "R阨 kh醝/end_dialog"
		else
			local follower_name = GetNpcName(GetFollower())
			if  follower_name ~= "фng Ca Minh" and follower_name ~= "Chung Th?" then
				dialog_pig[1] = "Ta mu鑞 thu h錳 th? c璶g/pig_in"
				local pig_level = GetTask(978)
				if pig_level ~= 4 then
					local pig_foods = {"10 b竛h ng?","20 m祅 th莡"," 50 B竛h x誴"}
					dialog_pig[2] = "Ta mu鑞 ch╩ s鉩 th? c璶g (c莕"..pig_foods[pig_level]..")/pig_feed"
				else
					dialog_pig[2] = "Ta c莕 th? c璶g/pig_use"
				end
			else
				Talk(1,"end_dialog","Ho祅 th祅h nhi謒 v?"..follower_name.."m韎 c? th? g鋓 th? c璶g")
				return
			end
			dialog_pig[3] = "Ta c莕 t t猲 cho th? c璶g/pig_rename"
			dialog_pig[4] = "R阨 kh醝/end_dialog"
		end
		Say("Xin l鵤 ch鋘 nh鱪g ng t竎 cho th? c璶g:",
			getn(dialog_pig),
			dialog_pig
		)
	end	
end
--*************************猪宝宝的使用********************************
function pig_baby_use(goods_id)						--猪宝宝的使用
	if goods_id == 546 then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 頲 th? c璶g m祏 s綾 t飝 ?, ngi ng ? ch??",
		2,
		"Ta ng ?/#pig_create(0,0,"..goods_id..")",		--性别、颜色、物品索引
		"в ta suy ngh? l筰/end_dialog")		
	elseif goods_id == 547 then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 H綾 tr?, ngi ng ? ch??",
		2,
		"Ta ng ?/#pig_create(1,0,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == 548 then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 頲 B筩h tr?, ngi ng ? ch??",
		2,
		"Ta ng ?/#pig_create(2,0,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == 549 then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 th? c璶g _H綾 tr?, ngi ng ? s? d鬾g kh玭g?",
		3,
		"Ta mu鑞 g鋓 th? c璶g_H綾 Tr? (b?)/#pig_create(1,1,"..goods_id..")",
		"Ta mu鑞 g鋓 th? c璶g_H綾 Tr? (m?)/#pig_create(1,2,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == 550 then
		Say("s? d鬾g v藅 ph萴 n祔 c? th? g鋓 th? c璶g_B筩h tr?, ngi ng ? ch??",
		3,
		"Ta mu鑞 g鋓 th? c璶g_B筩h Tr? (b?)/#pig_create(2,1,"..goods_id..")",
		"Ta mu鑞 g鋓 th? c璶g_B筩h Tr? (m?)/#pig_create(2,2,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	elseif goods_id == 551 then
		Say("S? d鬾g v藅 ph萴 n祔 c? th? g鋓 頲 Ho祅g kim tr?, ngi ng ? ch??",
		3,
		"Ta mu鑞 g鋓 Ho祅g kim tr? (b?)/#pig_create(3,1,"..goods_id..")",
		"Ta mu鑞 g鋓 Ho祅g kim tr? (m?)/#pig_create(3,2,"..goods_id..")",
		"в ta suy ngh? l筰/end_dialog")
	end
end
--*****************************喂养猪宝宝******************************
function pig_feed()
	local feed_distance = (GetTime() - GetTask(TaskID_spring2007_pig_feedtime))
	if feed_distance < 3600 then
		Talk(1,"end_dialog","Ngi mu鑞 cho th? c璶g b閕 th鵦 ?? C遪"..Zgc_pub_time_sec_change(feed_distance,1).." m韎 c? th? cho ╪!")
		return
	end
	local pig_level = GetTask(TaskID_spring2007_pig_level)
	local pig_foods = {	{1,1,1,10,"10","B竛h Ng?"},
						{1,1,3,20,"20","M祅 th莡"},
						{1,1,4,50," 50 ","B竛h x誴"}}
	if GetItemCount(pig_foods[pig_level][1],pig_foods[pig_level][2],pig_foods[pig_level][3]) < pig_foods[pig_level][4] then
		Talk(1,"end_dialog","<color=red>"..pig_foods[pig_level][6].." H譶h nh? kh玭g  "..pig_foods[pig_level][5].."??")
		return
	end
	if DelItem(pig_foods[pig_level][1],pig_foods[pig_level][2],pig_foods[pig_level][3],pig_foods[pig_level][4]) ~= 1 then
		Talk(1,"end_dialog","<color=red>"..pig_foods[pig_level][6].." H譶h nh? kh玭g  "..pig_foods[pig_level][5].."??")
		return		
	else
		SetTask(978,(pig_level + 1))
		pig_create_rtn(GetNpcName(GetFollower()))
	end
end
--*************************猪宝宝的创建********************************
function pig_create(pig_color,pig_sex,goods_id)
	SetTask(TaskID_spring2007_pig_color,pig_color)			--猪的颜色
	SetTask(TaskID_spring2007_pig_sex,pig_sex)			--猪的性别
	SetTask(TaskID_spring2007_pig_level,1)					--猪的等级
	SetTaskTemp(165,goods_id)
	--先删除目前的跟宠，然后添加新的跟宠，并在976中记录下跟宠信息
	AskClientForString("pig_create_rtn","",0,16,"Xin nh藀 t猲 c馻 th? c璶g")
end
--****************************收回猪宝宝*******************************
function pig_in()
	KillFollower()
	Talk(1,"end_dialog","Th? c璶g c馻 b筺  thu h錳, c? th? m? B秓 觧 ra  g鋓 l筰.")
end
--****************************放出猪宝宝*******************************
function pig_out()
	AskClientForString("pig_create_rtn","",0,16,"Xin nh藀 t猲 c馻 th? c璶g")
end
--****************************猪宝宝重新命名***************************
function pig_rename()
	AskClientForString("pig_create_rtn","",0,16,"Xin nh藀 l筰 t猲 th? c璶g")
end
--****************************猪宝宝的创建回调*************************
function pig_create_rtn(pig_name)
	--if GetNpcName(GetFollower()) ~= "" then			--test
	--	Talk(1,"end_dialog","您目前已经有了一个跟宠，请完成任务后再召唤猪宝宝！")
	--	return
	--end
	--**************************名字过滤****************************
	local pigname_forbid_chr = {"C莡","B?","Qu﹏","L玦","Qu﹏","Kim S琻","ch輓","Tuy謙","JS","фng Ca Minh","Chung Th?"}
	for i = 1,getn(pigname_forbid_chr) do
		local startS,endS = strfind(pig_name,pigname_forbid_chr[i])
		if startS then
			Talk(1,"pig_rename","T猲 c馻 th? c璶g kh玭g ng, xin nh藀 l筰!")
			return
		end
	end
	local pig_color = GetTask(TaskID_spring2007_pig_color)
	local pig_sex = GetTask(TaskID_spring2007_pig_sex)
	local pig_level = GetTask(TaskID_spring2007_pig_level)
	local goods_id = GetTaskTemp(165)
	if DelItem(2,0,goods_id,1) ~= 1 then					--判断删除道具是否成功
		Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c? th? c璶g <color=red>Ti觰 Tr?<color>!")
		return
	end
	local pig_table = {			--四个等级的猪
		{{"S竧 th?10","S竧 th?11"},{"S竧 th?12","S竧 th?13"},{"S竧 th?14","S竧 th?15"}},
		{{"S竧 th?20","S竧 th?21"},{"S竧 th?22","S竧 th?23"},{"S竧 th?24","S竧 th?25"}},
		{{"S竧 th?30","S竧 th?31"},{"S竧 th?32","S竧 th?33"},{"S竧 th?34","S竧 th?35"}},
		{{"S竧 th?40","S竧 th?41"},{"S竧 th?42","S竧 th?43"},{"S竧 th?44","S竧 th?45"}},
	}
	if pig_sex == 0 then
		pig_sex = random(1,2)
	end
	if pig_color == 0 then
		pig_color = random(1,2)
	end
	SetTask(976,pig_color)
	SetTask(977,pig_sex)
	SetTask(979,GetTime())
	SummonNpc(pig_table[pig_level][pig_color][pig_sex],pig_name)
end
--**************************猪宝宝的删除提示***************************
function pig_delete_chk()
	Say("B筺 x竎 nh s? d鬾g v藅 ph萴 n祔?",
	2,
	"фi/pig_delete_determine",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--**************************猪宝宝的删除*******************************
function pig_delete_determine()
	if GetItemCount(2,0,552) == 0 then
		Talk(1,"end_dialog","Xin x竎 nh薾 b筺 c? XXX!")  --test
		return
	end
	if DelItem(2,0,552,1) ~= 1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 b筺 c? XXX!")  --test
		return		
	end
	--删除跟宠
	KillFollower()
	for i = 974,979 do
		SetTask(i,0)
	end
end
--***********************生小猪的触发函数******************************
function pig_born_timer()
	local time_distance = GetTime() - GetTask(TaskID_spring2007_pig_handtime)
	if (time_distance + 56) < 600 then			--给奖励的时间还没有到的情况下
		return
	end
	if time_distance > 600 then					--给奖励的时间已经超过了（错误的处理）
		RemoveTrigger(GetTrigger(900))
		return
	end
	local player_index_ask = PlayerIndex		--申请人的索引
	local player_pig_sex_ask = GetTask(TaskID_spring2007_pig_sex)		-- 1为公，2为母
	local player_pig_level_ask = GetTask(TaskID_spring2007_pig_level)
	local Player_hand_start_time_ask = GetTask(TaskID_spring2007_pig_handtime)
	
	if GetInteractivePlayerIndex() <= 0 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	PlayerIndex = GetInteractivePlayerIndex()	--接受人的索引
	local player_index_accept = PlayerIndex		
	local player_pig_sex_accept = GetTask(TaskID_spring2007_pig_sex)
	local player_pig_level_accept = GetTask(TaskID_spring2007_pig_level)
	local Player_hand_start_time_accept = GetTask(TaskID_spring2007_pig_handtime)
	
	PlayerIndex = player_index_ask
	
	if Player_hand_start_time_accept - Player_hand_start_time_ask > 1 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	
	if (player_pig_sex_ask + player_pig_sex_accept) ~= 3 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	if (palyer_pig_level_ask + player_pig_level_accept) ~= 8 then
		RemoveTrigger(GetTrigger(900))
		return
	end
	--找到母猪宝宝所在的玩家，并进行是否可以增加猪娃娃的判断
	if player_pig_sex_accept == 1 then									--找到携带母猪宝宝的玩家，判断生出猪娃娃的数量。
		PlayerIndex = player_index_ask
		if GetTask(TaskID_pig_born_date) > zgc_pub_day_turn(1) then
			return
		elseif GetTask(TaskID_pig_born_date) == zgc_pub_day_turn(1) and GetTask(TaskID_pig_born_num_today) >= 2 then
			return
		end
		if GetTask(TaskID_pig_born_num_total) >= 6 then
			return
		end
	end	
	--添加前对母猪携带人的数据处理
	if GetTask(TaskID_spring2007_pig_bornseq) < zgc_pub_day_turn(1) then
		SetTask(TaskID_pig_born_date,zgc_pub_day_turn(1))
		SetTask(TaskID_spring2007_pig_bornnumtoday,1)
	else
		SetTask(TaskID_spring2007_pig_bornnumtoday,2)
	end
	SetTask(TaskID_spring2007_pig_borntotal,(GetTask(TaskID_spring2007_pig_borntotal) + 1))
	--猪娃娃的增加
	PlayerIndex = player_index_ask
	local pig_ID = random(546,560)
	if random(1,10) > 5 then
		local add_flag = AddItem(2,0,pig_ID,1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Ti觰 Tr?")
			local player_name = GetName()
			PlayerIndex = player_index_accept
			Msg2Player("Ch骳 m鮪g b筺 v?"..player_name.."Nh薾 頲 1 Ti觰 Tr?!")
		else
			--写日志
		end
	else
		PlayerIndex = player_index_accept
		local player_name = GetName()
		local add_flag = AddItem(2,0,pig_ID,1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Ti觰 Tr?")
			local player_name = GetName()
			PlayerIndex = player_index_ask
			Msg2Player("Ch骳 m鮪g b筺 v?"..player_name.."Nh薾 頲 1 Ti觰 Tr?!")
		else
			--写日志
		end
	end
	PlayerIndex = player_index_ask
end
