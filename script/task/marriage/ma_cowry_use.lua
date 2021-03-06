--脚本名称：结婚二期任务宝物使用脚本
--脚本功能：结婚二期的各种丸子的使用，分为两个方面一个是增加同心值，一个相关的技能的学习和升级
--策划人：铁羊
--代码开发人：村长
--代码开发时间：2007-04-27
--代码修改记录：
	Same_heart_value_TaskID = 2015			--同心值
	Same_heart_value_max = 5000				--同心值上限
	Same_heart_value_max_TaskID = 2023		--同心值上限id
	Ma_skill_level_max = 5					--婚姻技能上限
	--宝物对应技能信息
	Tb_ma_skill = {}
	Tb_ma_skill[581] = {867,5,"謕 Luy課"}		--技能代号、名称，暂时替代
	Tb_ma_skill[582] = {867,5,"謕 Luy課"}		--技能代号、名称，暂时替代
	Tb_ma_skill[577] = {865,4,"Tng T?"}			--技能代号、名称，暂时替代
	Tb_ma_skill[578] = {865,4,"Tng T?"}			--技能代号、名称，暂时替代
	Tb_ma_skill[579] = {866,5,"H鉧 甶謕"}			--技能代号、名称，暂时替代
	Tb_ma_skill[580] = {866,5,"H鉧 甶謕"}			--技能代号、名称，暂时替代
	--宝物信息
	Tb_goods_compose = {}
	Tb_goods_compose[573] = {"уng T﹎ Ho祅","S? d鬾g tr? уng t﹎ t╪g <color=yellow>125<color> 甶觤!"}
	Tb_goods_compose[574] = {"Чi уng T﹎ Ho祅","S? d鬾g tr? уng t﹎ t╪g <color=yellow>300<color> 甶觤!"}
	Tb_goods_compose[575] = {"уng T﹎ n","Ngi s? d鬾g Tr? s? ng t﹎ t鑙 產 t╪g <color=yellow>125<color> 甶觤!"}
	Tb_goods_compose[576] = {"Чi уng T﹎ n","Ngi s? d鬾g Tr? s? ng t﹎ t鑙 產 t╪g <color=yellow>300<color> 甶觤!"}
	Tb_goods_compose[577] = {"T? tng b秐 quy觧","Ngi s? d鬾g c? th? <color=yellow>h鋍 h醝: k? n╪g truy襫 t鑞g<color>!"}
	Tb_goods_compose[578] = {"T? tng t祅 quy觧","Ngi s? d鬾g c? th? <color=yellow>t╪g c蕄: k? n╪g truy襫 t鑞g<color>!"}
	Tb_goods_compose[579] = {"H鉧 謕 b秐 quy觧","M藅  L璾 tinh"}
	Tb_goods_compose[580] = {"H鉧 謕 t祅 quy觧","Ngi s? d鬾g c? th? <color=yellow>t╪g c蕄 k? n╪g h錳 sinh<color>!"}
	Tb_goods_compose[581] = {"謕 Luy課 b秐 quy觧","Ngi s? d鬾g c? th? <color=yellow>h鋍 h醝 k? n╪g gi髉 <color>!"}
	Tb_goods_compose[582] = {"謕 Luy課 t祅 quy觧","Ngi s? d鬾g c? th? <color=yellow>th╪g c蕄 k? n╪g gi髉 <color>!"}

--==================================函数主逻辑区域==================================
function OnUse(goods_index)
	--判断是否结婚
	if GetMateName() == nil or GetMateName() == "" then
		Talk(1,"","<color=green>Ch? ?<color>: Ch璦 k誸 h玭 ch璦 th? s? d鬾g v藅 ph萴 n祔!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	Say("<color=green>G頸 ? <color>: S? d鬾g <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> c? th? "..Tb_goods_compose[goods_id][2],
	2,
	"фi/#use_deal("..goods_id..")",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--*******************************确认使用*************************
function use_deal(goods_id)
	--道具携带检测
	if GetItemCount(2,1,goods_id) < 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--同心值增加道具的使用
	if goods_id == 573 or goods_id == 574 then
		local same_heart_value_add_num = 0			--本宝物增加的同心值
		if goods_id == 573 then
			same_heart_value_add_num = 125
		elseif goods_id == 574 then
			same_heart_value_add_num = 300
		end
		--同心值及其上限获取
		local same_heart_value_max = GetTask(Same_heart_value_max_TaskID)
		local same_heart_value_now = GetTask(Same_heart_value_TaskID)
		local same_heart_value_dis = same_heart_value_max - same_heart_value_now
		--同心值超过上限处理
		if same_heart_value_dis < 0 then
			SetTask(Same_heart_value_TaskID,same_heart_value_max)
			same_heart_value_dis = 0
		end
		--开始处理
			--同心值上限不够直接加
		if 	same_heart_value_dis >= same_heart_value_add_num then
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			else
				local Same_heart_value = (same_heart_value_now + same_heart_value_add_num)
				SetTask(Same_heart_value_TaskID,Same_heart_value)
				Talk(1,"","<color=green>G頸 ?<color>: Ch骳 m鮪g b筺  s? d鬾g "..Tb_goods_compose[goods_id][1].."Х t╪g"..same_heart_value_add_num.." (甶觤) Tr? s? ng t﹎, t 頲 <color=yellow>"..Same_heart_value.."<color> 甶觤!")
			end
		--同心值达到上限直接返回
		elseif same_heart_value_dis == 0 then
			Talk(1,"","<color=green>G頸 ?<color>: Tr? s? ng t﹎  t t韎 : <color=red>"..same_heart_value_max.."<color>甶觤, kh玭g th? s? d鬾g<color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		else
			Say("<color=green>G頸 ?<color>: Gi韎 h筺 Tr? s? ng t﹎ hi謓 t筰 l? <color=red>"..same_heart_value_max.."<color> 甶觤, s? d鬾g <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> ch? t╪g <color=yellow>"..same_heart_value_dis.."<color> 甶觤, s? d鬾g ch??",
			2,
			"фi/#use_dtm("..goods_id..","..same_heart_value_dis..")",
			"в ta suy ngh? l筰/end_dialog"
			)
		end
	--同心值上限增加道具的使用
	elseif goods_id == 575 or goods_id == 576 then
		local same_heart_value_max_add_num = 0			--本宝物增加的同心值
		if goods_id == 575 then
			same_heart_value_max_add_num = 125
		elseif goods_id == 576 then
			same_heart_value_max_add_num = 300
		end
		--同心值增加上限处理
		local same_heart_max_value_now = GetTask(Same_heart_value_max_TaskID)
		local same_heart_max_dis_value = Same_heart_value_max - same_heart_max_value_now
			--同心值上限不到上限直接加
		if same_heart_value_max_add_num <= same_heart_max_dis_value then
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			else
				local Same_heart_value_max = (same_heart_max_value_now + same_heart_value_max_add_num)
				SetTask(Same_heart_value_max_TaskID,(same_heart_max_value_now + same_heart_value_max_add_num))
				Talk(1,"","<color=green>G頸 ?<color>: Ch骳 m鮪g b筺  s? d鬾g "..Tb_goods_compose[goods_id][1].."Х t╪g"..same_heart_value_max_add_num.."(甶觤) gi韎 h筺 Tr? s? ng t﹎,  t 頲 <color=yellow>"..Same_heart_value_max.."<color> 甶觤!")
			end
			--同心值已经到达上限不用删除直接返回
		elseif same_heart_max_dis_value == 0 then
			Talk(1,"","<color=green>G頸 ?<color>: Gi韎 h筺 Tr? s? ng t﹎  t t韎 tr? cao nh蕋: <color=red>"..same_heart_max_value_now.."<color>甶觤, kh玭g th? s? d鬾g<color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		else
			Say("<color=green>G頸 ?<color>: gi韎 h筺 Tr? s? ng t﹎ hi謓 t筰, tr? cao nh蕋 l? <color=red>"..same_heart_max_value_now.."<color> 甶觤, s? d鬾g <color=yellow>"..Tb_goods_compose[goods_id][1].."<color> ch? t╪g <color=yellow>"..same_heart_max_dis_value.."<color> 甶觤 Tr? s? ng t﹎, s? d鬾g ch??",
			2,
			"фi/#use_dtm("..goods_id..","..same_heart_max_dis_value..")",
			"в ta suy ngh? l筰/end_dialog"
			)
		end
	--技能学习物品
	elseif goods_id == 577 or goods_id == 579 or goods_id == 581 then
		if HaveLearnedSkill(Tb_ma_skill[goods_id][1]) == 1 then
			Talk(1,"","<color=green>G頸 ?<color>: b筺  h鋍 頲: <color=yellow>"..Tb_ma_skill[goods_id][3].."<color>, kh玭g th? s? d鬾g m藅  n祔!")
			return
		else
			if DelItem(2,1,goods_id,1) ~= 1 then
				Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
				return
			end
			if LearnSkill(Tb_ma_skill[goods_id][1]) == 1 then
				Talk(1,"","<color=green>G頸 ?<color>: Ch骳 m鮪g b筺 h鋍 頲 '<color=yellow>"..Tb_ma_skill[goods_id][3].."<color>', nh蕁' <color=yellow>F3<color>' m? giao di謓<color=yellow>H玭 Nh﹏<color> m韎 c? th? s? d鬾g k? n╪g n祔!")
			else
				WriteLog("K? n╪g H玭 Nh﹏: ngi ch琲 ("..GetName()..") s? d鬾g "..Tb_goods_compose[goods_id][1].."h鋍 h醝 th蕋 b筰!")
			end
		end
	--技能升级物品
	else
		if GetSkillLevel(Tb_ma_skill[goods_id][1]) == 0 then
			Talk(1,"","<color=green>G頸 ?<color>: B筺 ch璦 h鋍 頲 <color=yellow>"..Tb_ma_skill[goods_id][3].."<color>, kh玭g th? s? d鬾g m藅  n祔!")
			return
		end
		if GetSkillLevel(Tb_ma_skill[goods_id][1]) >= Tb_ma_skill[goods_id][2] then
			Talk(1,"","<color=green>G頸 ?<color>: Hi謓 t筰 ng c蕄 k? n╪g <color=yellow>"..Tb_ma_skill[goods_id][3].."<color>  cao nh蕋, kh玭g th? th╪g c蕄!")
			return
		end
		if DelItem(2,1,goods_id,1) ~= 1 then
			Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
			return
		end
		if LevelUpSkill(Tb_ma_skill[goods_id][1]) == 1 then
			Msg2Player("Ch骳 m鮪g b筺 th╪g c蕄!"..Tb_ma_skill[goods_id][3].. " !")
		else
			WriteLog("K? n╪g H玭 Nh﹏: ngi ch琲 ("..GetName()..") s? d鬾g "..Tb_goods_compose[goods_id][1].."th╪g c蕄 th蕋 b筰!")
		end
	end
end
--******************************同心值不足的时候的处理******************************
function use_dtm(goods_id,add_num)
	--物品携带检测
	if GetItemCount(2,1,goods_id) == 0 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--物品删除检测
	if DelItem(2,1,goods_id,1) ~= 1 then
		Talk(1,"","<color=green>G頸 ? <color>: Xin h穣 x竎 nh薾 b筺  mang theo <color=yellow>"..Tb_goods_compose[goods_id][1].."<color>!")
		return
	end
	--通过检测后同心值或同心值上限增减
	if goods_id == 573 or goods_id == 574 then
		local Same_heart_value = (GetTask(Same_heart_value_TaskID) + add_num)
		SetTask(Same_heart_value_TaskID,Same_heart_value)
		Talk(1,"","<color=green>G頸 ?<color>: Ch骳 m鮪g b筺  s? d鬾g "..Tb_goods_compose[goods_id][1].."Х t╪g"..add_num.." (甶觤) Tr? s? ng t﹎, t 頲 <color=yellow>"..Same_heart_value.."<color> 甶觤!")
	else
		local Same_heart_value_max = (GetTask(Same_heart_value_max_TaskID) + add_num)
		SetTask(Same_heart_value_max_TaskID,Same_heart_value_max)
		Talk(1,"","<color=green>G頸 ?<color>: Ch骳 m鮪g b筺  s? d鬾g "..Tb_goods_compose[goods_id][1].."Х t╪g"..add_num.."(甶觤) gi韎 h筺 Tr? s? ng t﹎,  t 頲 <color=yellow>"..Same_heart_value_max.."<color> 甶觤!")
	end
end
