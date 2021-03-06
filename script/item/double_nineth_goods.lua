--******************************************************
--********************金山软件剑网2脚本*****************
--功能：2006重阳活动
--开发人员：赵贵春
--开发时间：2006-10-12
--******************************************************
prize_table = {
	{"Ho祅g C骳",546,"Ru hoa c骳",549,"? ru","b譶h"},
	{"T? C骳",547,"B竛h hoa c骳",550," ch? th祅h "," ph莕"},
	{"Th? du",548,"B? th? du",551," ch? th祅h ","Th骳"},
}
change_num = 9			--兑换需要的原料数量
map_id_min = 969
map_id_max = 971
use_att_Y = 2954
exp_num_1 = 500000
exp_num_2 = 200000
healthy_exp_need = 500000
prize_use_start_time = 13447
prize_use_end_time = 13463

function main()
	local palyer_sex = "Чi hi謕"
	if GetSex() == 2 then
		palyer_sex = "N? hi謕 "
	end
	if GetLevel() < 11 then
		Say("V? "..palyer_sex.."N誹 mu鑞 x璶g b? v? l﹎ th? c莕 ph秈 r蘮 luy謓 th猰.",
		1,
		"Ta bi誸 r錳/end_dialog")
		return
	end
	local plant_talble = {
	{"Ho祅g C骳",546},
	{"T? C骳",547},
	{"Th? du",548},	
	}
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	
	local num_save = GetUnitCurStates(npc_index,2)
	if num_save == 0 then
		return
	else
		AddUnitStates(npc_index,2,( - num_save))
	end
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
		Msg2Player("Kho秐g tr鑞g trong h祅h trang ho芻 s鴆 l鵦 c馻 b筺 kh玭g , xin ki觤 tra l筰!")
		AddUnitStates(npc_index,2,1)
		return
	end
	local npc_name = GetNpcName(npc_index)
	for i = 1,getn(plant_talble) do
		if npc_name == plant_talble[i][1] then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,0,plant_talble[i][2],1)
			if add_flag == 0 then
				WriteLog("Ho箃 ng Tr飊g C鰑:"..npc_name.."Th猰 th蕋 b筰, k? hi謚:"..add_flag)
			end
		end
	end	
end
function OnUse(id)
	local palyer_sex = "Чi hi謕"
	if GetSex() == 2 then
		palyer_sex = "N? hi謕 "
	end
	if GetLevel() < 11 then
		Say("V? "..palyer_sex.."N誹 mu鑞 x璶g b? v? l﹎ th? c莕 ph秈 r蘮 luy謓 th猰.",
		1,
		"Ta bi誸 r錳/end_dialog")
		return
	end
	if prze_use_date_chk() == 0 then
		Say("Ho箃 ng  k誸 th骳! Xem chi ti誸 tr猲 trang ch?!",
		1,
		"Ta bi誸 r錳/end_dialog")
		return
	end
	--初始变量定义
	local goods_ID = GetItemParticular(id)
	--主逻辑
	if goods_ID >= prize_table[1][2] and goods_ID <= prize_table[3][2] then					--判断玩家使用的是什么道具
		for i = 1, getn(prize_table) do
			if goods_ID == prize_table[i][2] then			--找到对应道具，增加对应物品
				if GetItemCount(2,0,prize_table[i][2]) < change_num then
					Say(change_num.."сa"..prize_table[i][1].." m韎 c? th? "..prize_table[i][5].."m閠"..prize_table[i][6]..prize_table[i][3]..". Tr猲 ngi b筺 h譶h nh? kh玭g "..prize_table[i][1].." H譶h nh? kh玭g !",
					1,
					"Ta bi誸 r錳/end_dialog"
					)
				else
					Say("B筺 ng ? d飊g"..change_num.."сa"..prize_table[i][1]..prize_table[i][5].."m閠"..prize_table[i][6]..prize_table[i][3].."?",
					2,
					"Ch? t竎 /#plant_use("..i..")",
					"в ta ngh? l筰/end_dialog"
					)
				end
			end
		end
	elseif goods_ID >= prize_table[1][4] and goods_ID <= prize_table[3][4] then
		local map_ID,att_X,att_Y = GetWorldPos()
		if map_ID < map_id_min or map_ID > map_id_max then
			Say("Tr猲 nh Hoa s琻 m韎 s? d鬾g 頲 v藅 ph萴 n祔. B筺 c? th? n g苝 V? L﹎ Minh truy襫 nh﹏ a 甶!",
			1,
			"Ta bi誸 r錳/end_dialog")
			return
		elseif att_Y >= use_att_Y  then
			Say("L猲 t韎 nh m韎 s? d鬾g v藅 ph萴 n祔!",
			1,
			"Ta bi誸 r錳/end_dialog")
			return
		end
		if GetTask(962) >= 42 then
			Say("Xin l鏸! T鎛g s? ph莕 thng b筺 nh薾 頲  qu? 42 l莕, m阨 b筺 tham gia ho箃 ng l莕 sau!",
			    1,
				"Ta bi誸 r錳/end_dialog")
			return			
		end	
		if GetTask(960) >= 6 and GetTask(961) >= day_num_return() then
			Say("Xin l鏸! S? ph莕 thng h玬 nay  qu? 6 l莕, ng祔 mai h穣 quay l筰!",
			    1,
				"Ta bi誸 r錳/end_dialog")
			return			
		end
		for i = 1 ,getn(prize_table) do
			if goods_ID == prize_table[i][4] then			--找到对应道具，增加对应物品
				Say(" B筺 ng ? d飊g "..prize_table[i][3].."?",
					2,
					"уng ? d飊g/#Prize_use("..i..")",
					"в ta ngh? l筰/end_dialog"
				)
			end
		end
	end
end
--*******************************兑换奖励函数**********************************
function plant_use(goods_seq)
	if GetFreeItemRoom() < 1 then
		Say("Kho秐g tr鑞g h祅h trang kh玭g , xin xem l筰!",
		    1,
			"Ta bi誸 r錳/end_dialog")
		return		
	end
	if GetItemCount(2,0,prize_table[goods_seq][2]) < change_num then
		Msg2Player("Xin x竎 nh薾 h祅h trang  v藅 ph萴  i thng!")
		return
	end
	local deal_flag = DelItem(2,0,prize_table[goods_seq][2],change_num)
	if deal_flag == 0 then
		Msg2Player("Xin x竎 nh薾 h祅h trang  v藅 ph萴  i thng!")
	else
		local add_flag = AddItem(2,0,prize_table[goods_seq][4],1)
		if add_flag ~= 0 then
			Msg2Player("Ch骳 m鮪g b筺 d飊g "..change_num.."сa"..prize_table[goods_seq][1]..prize_table[goods_seq][5].." d飊g 1 "..prize_table[goods_seq][6]..prize_table[goods_seq][3].."!")
		else
			WriteLog ("Ngi ch琲:"..GetName().."T╪g"..prize_table[goods_seq][3].." th蕋 b筰, tr? quay v?:"..add_flag..".")
		end
	end
end
--*******************************使用奖励函数**********************************
function Prize_use(goods_seq)
	if goods_seq == 1 then
		local healthy_exp = GetGoldenExp() 							--获取玩家健康经验
		if healthy_exp == 0 then
			Say("Hi謓 b筺 kh玭g c? 甶觤 s鴆 kh醗 kh玭g th? d飊g ru hoa c骳!",
			1,
			"Ta bi誸 r錳/end_dialog")
		elseif healthy_exp < exp_num_1 then
			Say("觤 s鴆 kh醗 c馻 b筺 l?:"..healthy_exp..", kh玭g  50 v筺, b筺 mu鑞 i 甶觤 s鴆 kh醗 l蕐 kinh nghi謒 kh玭g?",
			2,
			"Ta mu鑞 i 甶觤 s鴆 kh醗 th祅h kinh nghi謒/#exp_change(1)",
			"в khi kh竎/end_dialog")
		else
			exp_change(1)
		end
	elseif goods_seq == 2 or goods_seq == 3 then
		if goods_seq == 2 then
			local healthy_exp = GetGoldenExp() 							--获取玩家健康经验
			if healthy_exp == 0 then
				Say("Hi謓 b筺 kh玭g c? 甶觤 s鴆 kh醗 kh玭g th? d飊g b竛h hoa c骳!",
				1,
				"Ta bi誸 r錳/end_dialog")
			elseif healthy_exp < exp_num_2 then
				Say("觤 s鴆 kh醗 c馻 b筺 l?:"..healthy_exp..", kh玭g  20 v筺, b筺 mu鑞 i 甶觤 s鴆 kh醗 l蕐 kinh nghi謒 kh玭g?",
				2,
				"Ta mu鑞 i 甶觤 s鴆 kh醗 th祅h kinh nghi謒/#exp_change(2)",
				"в khi kh竎/end_dialog")
			else
				exp_change(2)
			end
		elseif goods_seq == 3 then
			local del_flag = DelItem(2,0,prize_table[3][4],1)
			if del_flag == 1 then
				ModifyGoldenExp(healthy_exp_need)
				Msg2Player("B筺  s? d鬾g "..prize_table[goods_seq][3]..", nh薾 頲 50 v筺 甶觤 s鴆 kh醗!")
				use_times_save()
				prize_end_dialog()
			else
				Msg2Player("Xin x竎 nh薾 h祅h trang c遪 "..prize_table[goods_seq][4].."!")
			end
		end
	end
end
--****************************健康经验转换为经验***********************************
function exp_change(change_flag)											--健康经验转为经验
	local healthy_exp = GetGoldenExp() 										--获取玩家健康经验
	local del_flag = DelItem(2,0,prize_table[change_flag][4],1)
	if del_flag == 1 and change_flag == 1 then
		if healthy_exp >= exp_num_1 then
			ModifyGoldenExp(-exp_num_1)
			ModifyExp(exp_num_1)
			Msg2Player("B筺 s? d鬾g "..prize_table[change_flag][3]..", 甧m"..exp_num_1.."甶觤 s鴆 kh醗 i"..exp_num_1.." 甶觤 kinh nghi謒!")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("B筺 s? d鬾g "..prize_table[change_flag][3]..", 甧m"..healthy_exp.."甶觤 s鴆 kh醗 i"..healthy_exp.." 甶觤 kinh nghi謒!")
		end
		use_times_save()
		prize_end_dialog()
	elseif del_flag == 1 and change_flag == 2 then
		if healthy_exp >= exp_num_2 then
			ModifyGoldenExp(-exp_num_2)
			ModifyExp(exp_num_2)
			Msg2Player("B筺 s? d鬾g "..prize_table[change_flag][3]..", 甧m"..exp_num_2.."甶觤 s鴆 kh醗 i"..exp_num_2.." 甶觤 kinh nghi謒!")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("B筺 s? d鬾g "..prize_table[change_flag][3]..", 甧m"..healthy_exp.."甶觤 s鴆 kh醗 i"..healthy_exp.." 甶觤 kinh nghi謒!")
		end
		ModifyReputation(10,0)
		Msg2Player("B筺 s? d鬾g "..prize_table[change_flag][3].."nh薾 頲 10 甶觤 danh v鋘g!")
		use_times_save()
		prize_end_dialog()
	else
		Msg2Player("Xin x竎 nh薾 h祅h trang c遪 "..plant_talble[1][4].."!")
	end
end
--**********************************使用时间判断**********************************
function prze_use_date_chk()
	if day_num_return() < prize_use_start_time or day_num_return() > prize_use_end_time then
		return 0 
	else
		return 1
	end
end
--**********************************使用次数记录**********************************
function use_times_save()
	local use_times = GetTask(960)
	local use_date_seq = GetTask(961)
	local use_time_total = GetTask(962)
	if use_date_seq == day_num_return() then
		SetTask(960,use_times + 1)
	else
		SetTask(961,day_num_return())
		SetTask(960,1)
	end
	SetTask(962,use_time_total + 1)
end
--*******************************使用次数提示************************************
function prize_end_dialog()
	local use_times = GetTask(960)
	local use_num_today = 6 - use_times
	local use_num_total = GetTask(962)
	if use_times < 6 and use_num_total < 42 then
		Msg2Player("H玬 nay l莕 th? "..use_times.."b筺 nh薾 頲 ph莕 thng, c遪"..use_num_today.."l莕 c? h閕 nh薾 thng. Зy l? l莕 t輈h l騳 th?"..use_num_total.." l莕 i ph莕 thng, c遪 i 頲"..(42-use_num_total).." l莕.")
	elseif use_times == 6 and use_num_total < 42 then
		Msg2Player("H玬 n祔 b筺  nh薾 thng 6 l莕 cho ph衟, ng祔 mai h穣 quay l筰! Зy l? l莕 t輈h l騳 th?"..use_num_total.." l莕 i ph莕 thng, c遪 i 頲"..(42-use_num_total).." l莕.")
	elseif use_num_total == 42 then
		Msg2Player("B筺  i 42 ph莕 thng kh玭g th? ti誴 t鬰 i, m阨 tham gia ho箃 ng l莕 sau!")
	end
end
function end_dialog()
end
--**************************轮次计算函数******************************************
function day_num_return()
	local times_return = floor((GetTime() - 57600)/(86400))
	return times_return
end
