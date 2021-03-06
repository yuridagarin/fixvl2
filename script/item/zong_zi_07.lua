--脚本名称：07年端午节脚本
--脚本功能：粽子使用对应脚本
--策划人：小天天
--代码开发人：村长
--代码开发时间：2007-05-25
--代码修改记录：
	Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
	happy_zong_zi_num_TaskID = 1229
	aixiang_eat_num_TaskID = 1243
	happy_zong_zi_date_TaskID = 1244
--==============================================公共变量定义区====================================
	TB_zongzi_use_fun = {}
	TB_zongzi_use_fun[1123] = {"b竛h 輙 ng秈 hng","C? th? nh薾 頲 <color=yellow>10 v筺*ng c蕄*ng c蕄/6400<color> 甶觤 kinh nghi謒.","return zong_zi_exp_chg(100000)"}
	TB_zongzi_use_fun[1124] = {"b竛h 輙 ch﹏ g?","C? th? t╪g Sinh l鵦 t鑙 產 <color=yellow>30%<color>, duy tr? <color=yellow>10<color> ph髏!","return zong_zi_life_add(30,10800)"}
	TB_zongzi_use_fun[1125] = {"b竛h 輙 B竎 B秓","T╪g to祅 b? n╪g l鵦<color=yellow>60<color> 甶觤, duy tr? <color=yellow>3<color> ph髏.","return zong_zi_all_add(60,3240)"}
--==============================================功能主逻辑区======================================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	Say("<color=green>G頸 ? <color>: S? d鬾g <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>"..TB_zongzi_use_fun[goods_id][2].."B筺 c? mu鑞 s? d鬾g kh玭g?",
	2,
	"фi/#use_dtm("..goods_id..")",
	"в suy ngh?/end_dialog"
	)
end
function use_dtm(goods_id)
	if GetItemCount(2,1,goods_id) == 0 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
	dostring(TB_zongzi_use_fun[goods_id][3])
end
--艾香粽子
function zong_zi_exp_chg(exp_chg_num)
	local player_level = GetLevel()
	exp_chg_num = floor(exp_chg_num * player_level * player_level /6400)
	--数量判断
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save >= date_now and num_save >= 5 then
		Talk(1,"","<color=green>G頸 ? <color>: <color=yellow>b竛h 輙 ng秈 hng<color> m鏸 ng祔 ch? 頲 ╪ <color=red>5<color> c竔!")
		return
	end
	if DelItem(2,1,1123,1) == 1 then
		ModifyExp(exp_chg_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..exp_chg_num.." 甶觤 kinh nghi謒!")
		ai_xiang_update()
		return
	else
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..TB_zongzi_use_fun[goods_id][1].."<color>!")
		return
	end
end
function ai_xiang_update()
	local date_save = GetTask(happy_zong_zi_date_TaskID)
	local num_save = GetTask(aixiang_eat_num_TaskID)
	local date_now = zgc_pub_day_turn(1)
	if date_save < date_now then
		SetTask(happy_zong_zi_date_TaskID,zgc_pub_day_turn(1))
		SetTask(aixiang_eat_num_TaskID,1)
		SetTask(happy_zong_zi_num_TaskID,0)
		num_save = 0
	else
		SetTask(aixiang_eat_num_TaskID,(num_save + 1))
	end
	Talk(1,"","<color=green>G頸 ? <color>: <color=yellow>b竛h 輙 ng秈 hng<color> m鏸 ng祔 ch? 頲 s? d鬾g <color=yellow>5<color> l莕, y l? l莕 th? <color=yellow>"..(num_save+1).." <color> s? d鬾g <color=yellow>b竛h 輙 ng秈 hng<color>!")
	return
end
--火腿粽子
function zong_zi_life_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1124,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>B竛h 輙 th辴 nng <color>!")
		return
	end
	CastState("state_life_max_percent_add",add_num,abidance_time,1,1124)
end
--八宝粽子
function zong_zi_all_add(add_num,abidance_time)
	if leitai_chk() ~= 1 then
		return
	end
	if DelItem(2,1,1125,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>b竛h 輙 B竧 B秓<color>!")
		return
	end
	CastState("state_add_strength",add_num,abidance_time,1,11251)
	CastState("state_add_energy",add_num,abidance_time,1,11252)
	CastState("state_add_vitality",add_num,abidance_time,1,11253)
	CastState("state_add_dexterity",add_num,abidance_time,1,11254)
	CastState("state_add_observe",add_num,abidance_time,1,11255)
end
--擂台不能吃
function leitai_chk()
	local player_map = GetWorldPos()
	if (player_map >= 801 and player_map <= 805) or (player_map >= 810 and player_map <= 838) then
		Talk(1,"","<color=yellow>G頸 ? <color>: L玦 i kh玭g th? s? d鬾g nh鱪g v藅 n祔!")
		return 0
	else
		return 1
	end
end
