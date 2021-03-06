--脚本名称：祭品符纸使用脚本
--脚本功能：祭品符纸使用脚本，可以让玩家在一天内多接9次清明任务卷轴任务
--策划人：阿松
--代码开发人：村长
--代码开发时间：2007-03-13
--代码修改记录：2008-3-20byMoxian
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\online\\qingming08\\head_qingming.lua")
--=================================Glb变量定义区===========================
tomb_sweep_2008_task_reel_date_seq = 1852			--任务的日期序数
tomb_sweep_2008_task_reel_num = 1853					--可完成的任务数量
tomb_sweep_2008_fu_use_date_seq	= 1856			--祭品符纸的使用日期序数
tomb_sweep_2008_fu_use_num = 1857					--祭品符纸今天的使用数量
if IS_SHOUFEI == TRUE then
	tomb_sweep_2008_fu_use_max_num = 8					--符纸每天限制使用数量，非任务变量，免费区9次符纸
else
	tomb_sweep_2008_fu_use_max_num = 9	
end

--=================================函数主逻辑区============================
function OnUse(goods_index)
	--时间判断
	local date_chk = is_qingming_opened()
	if date_chk == 1 then
		--DelItemByIndex(goods_index,1)--这里不能删除
	else
		Talk(1,"","<color=green>Nh綾 nh?<color>: V藅 ph萴 n祔 ch? s? d鬾g trong ho箃 ng Thanh Minh <color=yellow>3-4-2008 n 12-4<color>.")
		return
	end
	--使用数量判断
	local use_date_seq = GetTask(tomb_sweep_2008_fu_use_date_seq)
	local use_num = GetTask(tomb_sweep_2008_fu_use_num)
	local date_seq_now = zgc_pub_day_turn(1)
	local task_deal_seq = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local task_deal_num = GetTask(tomb_sweep_2008_task_reel_num)
	--使用次数限制、服务器时间差异导致的特殊情况
	if (use_date_seq >= date_seq_now and use_num >= tomb_sweep_2008_fu_use_max_num) or date_seq_now < ((use_date_seq + task_deal_seq)/2) then
		Talk(1,"","<color=green>Nh綾 nh?<color>: V藅 ph萴 n祔 m鏸 ng祔 ch? c? th? s? d鬾g <color=yellow>"..tomb_sweep_2008_fu_use_max_num.."<color> l莕!")
		return
	end
	--物品删除检测
	if DelItemByIndex(goods_index,1) ~= 1 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: Xin ki觤 tra tr猲 ngi c? mang theo <color=yellow>gi蕐 c髇g t?<color>!")
		return
	end
	--数据操作
		--符纸使用限制数据写人
	if use_date_seq == nil or date_seq_now > use_date_seq then
		SetTask(tomb_sweep_2008_fu_use_date_seq,date_seq_now)
		SetTask(tomb_sweep_2008_fu_use_num,1)
	elseif date_seq_now == use_date_seq then
		SetTask(tomb_sweep_2008_fu_use_num,(use_num+1))
	end
		--任务次数处理
	if task_deal_seq == date_seq_now then
		if task_deal_num == nil then
			SetTask(tomb_sweep_2008_task_reel_num,3)--收费区原有的两次+符纸1次
		else
			SetTask(tomb_sweep_2008_task_reel_num,(task_deal_num+1))
		end
	elseif task_deal_seq < date_seq_now then
		SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2008_task_reel_num,3)--收费区原有的两次+符纸1次
	end
	local use_num_dealed = GetTask(tomb_sweep_2008_fu_use_num)
	local dia_use_num_remain = ""
	if use_num_dealed == tomb_sweep_2008_fu_use_max_num then
		dia_use_num_remain = " kh玭g th? s? d鬾g"
	else
		dia_use_num_remain = "C遪 s? d鬾g 頲 <color=yellow>"..(tomb_sweep_2008_fu_use_max_num-use_num_dealed).."<color> l莕"
	end
	Talk(1,"","<color=green>Nh綾 nh?<color>: B筺 s? d鬾g gi蕐 c髇g t? th祅h c玭g, nhi謒 v? <color=yellow>h玬 nay<color> 頲 t╪g th猰 <color=yellow>1<color> l莕, h玬 nay b筺"..dia_use_num_remain.." gi蕐 c髇g t?!")
end

