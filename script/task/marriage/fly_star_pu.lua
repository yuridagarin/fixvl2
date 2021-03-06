--脚本名称：飞星谱使用脚本
--脚本功能：飞星谱的使用脚本，包含查找碎片坐标、合成宝物等功能
--策划人：铁羊
--代码开发人：村长
--代码开发时间：2007-05-17
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("\\script\\task\\marriage\\map_att_head.lua")					--结婚二期头文件
--================================公共变量定义区================================
	task_map_id_TaskID = 1217
	task_att_seq_TaskID = 1218
	Frag_att_num_TaskID = 1220
	Tb_goods_compose = {}
	Tb_goods_compose[583] = {{573,"уng T﹎ Ho祅","S? d鬾g tr? уng t﹎ t╪g <color=yellow>125<color> 甶觤!","tr? уng t﹎ t╪g 125 甶觤"},{568,6,"Gi竝 M閏 dng"},{569,2,"蕋 M閏 ﹎"},{570,1,"B輓h h醓 dng"}}
	Tb_goods_compose[584] = {{574,"Чi уng T﹎ Ho祅","S? d鬾g tr? уng t﹎ t╪g <color=yellow>300<color> 甶觤!","tr? уng t﹎ t╪g 300 甶觤"},{568,9,"Gi竝 M閏 dng"},{569,5,"蕋 M閏 ﹎"},{570,2,"B輓h h醓 dng"}}
	Tb_goods_compose[585] = {{575,"уng T﹎ n","S? d鬾g tr? уng t﹎ t╪g <color=yellow>125<color> 甶觤!","Tr? уng T﹎ t╪g t鑙 產 125 甶觤"},{568,3,"Gi竝 M閏 dng"},{569,4,"蕋 M閏 ﹎"},{570,2,"B輓h h醓 dng"}}
	Tb_goods_compose[586] = {{576,"Чi уng T﹎ n","S? d鬾g tr? уng t﹎ t╪g <color=yellow>300<color> 甶觤!","Tr? уng T﹎ t╪g t鑙 產 300 甶觤"},{568,4,"Gi竝 M閏 dng"},{569,8,"蕋 M閏 ﹎"},{570,4,"B輓h h醓 dng"}}
	Tb_goods_compose[587] = {{577,"T? tng b秐 quy觧","S? d鬾g s? <color=red>h鋍 頲<color>: <color=yellow>k? n╪g Truy襫 t鑞g<color>!","H鋍 頲 phu th? truy襫 t鑞g"},{568,4,"Gi竝 M閏 dng"},{569,4,"蕋 M閏 ﹎"},{570,8,"B輓h h醓 dng"}}
	Tb_goods_compose[588] = {{578,"T? tng t祅 quy觧","S? d鬾g s? <color=red>th╪g c蕄<color>: <color=yellow>k? n╪g Truy襫 t鑞g<color>!","Th╪g c蕄 k? n╪g phu th? truy襫 t鑞g"},{568,5,"Gi竝 M閏 dng"},{569,2,"蕋 M閏 ﹎"},{570,8,"B輓h h醓 dng"},{571,5,"nh H醓 ﹎"}}
	Tb_goods_compose[589] = {{579,"H鉧 謕 b秐 quy觧","S? d鬾g s? <color=red>h鋍 頲<color>: <color=yellow>k? n╪g h錳 sinh<color>!","H鋍 頲 k? n╪g phu th? h錳 sinh"},{568,2,"Gi竝 M閏 dng"},{569,5,"蕋 M閏 ﹎"},{570,9,"B輓h h醓 dng"}}
	Tb_goods_compose[590] = {{580,"H鉧 謕 t祅 quy觧","S? d鬾g s? <color=red>th╪g c蕄<color>: <color=yellow>k? n╪g h錳 sinh<color>!","Th╪g c蕄 k? n╪g phu th? h錳 sinh"},{568,2,"Gi竝 M閏 dng"},{569,5,"蕋 M閏 ﹎"},{570,8,"B輓h h醓 dng"},{571,5,"nh H醓 ﹎"}}
	Tb_goods_compose[591] = {{581,"謕 Luy課 b秐 quy觧","S? d鬾g s? <color=red>h鋍 頲<color>: <color=yellow>k? n╪g H? tr?<color>!","H鋍 頲 k? n╪g phu th? cng h鉧"},{568,5,"Gi竝 M閏 dng"},{569,3,"蕋 M閏 ﹎"},{570,6,"B輓h h醓 dng"},{571,9,"nh H醓 ﹎"}}
	Tb_goods_compose[592] = {{582,"謕 Luy課 t祅 quy觧","S? d鬾g s? <color=red>th╪g c蕄<color>: <color=yellow>k? n╪g H? tr?<color>!","Th╪g c蕄 k? n╪g phu th? cng h鉧"},{568,3,"Gi竝 M閏 dng"},{569,5,"蕋 M閏 ﹎"},{570,5,"B輓h h醓 dng"},{571,10,"nh H醓 ﹎"}}
	Tb_player_sex_att = {
		{"X","Y"},
		{"Y","X"},
	}
	goods_id_tasktempID = 167
	Tb_frag = {}
	Tb_frag[568] = "Gi竝 M閏 dng"
	Tb_frag[569] = "蕋 M閏 ﹎"
	Tb_frag[570] = "B輓h h醓 dng"
	Tb_frag[571] = "nh H醓 ﹎"
--===============================主逻辑区============================
function OnUse()
	if GetMateName() == "" or GetMateName() == nil then
		Talk(1,"","<color=green>Ch? ?<color>: Ch璦 k誸 h玭 ch璦 th? s? d鬾g v藅 ph萴 n祔!")
		return
	end
	Say("<color=green>Ch? ?<color>: <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color> l? B秓 v藅 ph秈 t譵 trong <color=yellow>B秓 V藅 phu th?<color>, n? s? ch? ra <color=yellow>t鋋  L璾 tinh  n  t譵 L璾 tinh to竔 phi課<color>, c騨g c? th? d飊g n?  t譵 L璾 tinh to竔 phi課<color=yellow> h頿 th祅h B秓 V藅 phu th?<color>. C竎 h? mu鑞 <color=yellow>t譵 to竔 phi課<color> hay <color=yellow>h頿 th祅h B秓 v藅<color>",
	8,
	"Nhi謒 v? Phu th?/get_att_dia",
	"H頿 th祅h b秓 v藅/#cowry_comp_dia(583)",
	"L蕐 ra To竔 phi課 /ma_frag_get_out",
	"Tra xem s? to竔 phi課 ph?/get_frag_num",
	"Tra xem s? l莕 nhi謒 v? c遪 d?/get_att_num",
	"Thuy誸 minh Nhi謒 v? Phu th?/get_att_info",
	"Thuy誸 minh tr? уng t﹎/same_heart_value_info",
	"Tho竧/end_dialog"
	)
end
--**********************获取流星坐标对话***********************
function get_att_dia()
	local task_num_remain = GetTask(Frag_att_num_TaskID)
	if task_num_remain <= 0 or task_num_remain == nil then
		Talk(1,"","<color=green>Ch? ?<color>: S? l莕 nh薾 nhi謒 v? c馻 ngi  h誸. Xin n ch? <color=green>X秓 N?<color>  nh薾 ti誴 nhi謒 v?!")
		return
	elseif task_num_remain >= 200 then
		SetTask(Frag_att_num_TaskID,200)
	end
	local map_ID_save = GetTask(task_map_id_TaskID)
	if map_ID_save == nil or map_ID_save == 0 then
		Say("<color=green>Ch? ?<color>: B筺 x竎 nh s? d鬾g <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color>  nh薾 頲 <color=yellow>t鋋  to竔 phi課<color>. L莕 n祔 s? khi課 s? l莕 t鋋  trong Khi猲 V﹏ Phi Tinh ph? <color=green>gi秏 xu鑞g 1 l莕<color>. B筺 s? nh薾 頲 t鋋  <color=red>"..Tb_player_sex_att[GetSex()][1].."<color>, ? trung nh﹏ c馻 b筺 s? nh薾 頲 t鋋  <color=red>"..Tb_player_sex_att[GetSex()][2].."<color>",
		2,
		"уng ?/get_att",
		"H駓 b?/end_dialog"
		)
	else
		Say("<color=green>Ch? ?<color>: <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color> m鏸 l莕 ch? ch? ra 1 t鋋 , n誹 nh? qu猲 t鋋 , c? th? tra l筰 t筰 y. C騨g c? th? s? d鬾g <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color>  nh薾 頲 <color=yellow>t鋋  L璾 tinh<color> m韎! Nh璶g s? khi課 cho t鋋  c馻 to竔 phi課 l莕 trc m蕋 t竎 d鬾g",
		3,
		"Ta mu鑞 nh薾 頲 t鋋  L璾 tinh m韎/get_att",
		"Ta mu鑞 t譵 l筰 t鋋  L璾 tinh l莕 trc/star_att_inq",
		"H駓 b?/end_dialog"
		)
	end
end
--**********************流星坐标查询***************************
function star_att_inq()
	local map_ID_save = GetTask(task_map_id_TaskID)
	local att_seq_save = GetTask(task_att_seq_TaskID)
	--没有坐标保存的情况
	if map_ID_save == 0 or map_ID_save == nil or att_seq_save == 0 or att_seq_save == nil then
		Talk(1,"","<color=green>Ch? ?<color>: <color=yellow>L璾 tinh to竔 phi課<color> l莕 n祔  t譵 th蕐, hay l? 甶 t譵 <color=yellow>to竔 phi課<color> k? ti誴 甶!")
		return
	end
	--夫妻组队测试
	local mate_name = GetMateName()
	local team_member_num = GetTeamSize()
	local player_index_save = PlayerIndex
	local player_mate_index = 0
	local player_mate_mapID = 0
	if team_member_num ~= 2 then
		if team_member_num == 0 then
			Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 b筺 v? ? trung nh﹏  t? i!" )
			return
		else
			Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 trong t? i ch? c? <color=yellow>? trung nh﹏ c馻 b筺<color>!" )
			return
		end
	else
		for i = 1 , 2 do
			PlayerIndex = GetTeamMember(i)
			if mate_name == GetName() then
				player_mate_index = PlayerIndex
				player_mate_mapID = GetWorldPos()
				PlayerIndex = player_index_save
				break
			end
		end
		PlayerIndex = player_index_save
	end
	if player_mate_index == 0 then
		Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 b筺 v? ? trung nh﹏  t? i!" )
		return
	end
	local map_ID = GetWorldPos()
	if player_mate_mapID ~= map_ID then
		Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 b筺 v? ? trung nh﹏ ? c飊g m閠 khu v鵦!")
		return
	end
	local player_sex = GetSex()
	Talk(1,"","<color=green>Ch? ?<color>: Hi謓 t筰 <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color>-t鋋  L璾 tinh l?:? (<color=red>"..Tb_task_reel_att[map_ID_save].map_att[1].."<color>,<color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> t鋋  l? <color=red>"..Tb_task_reel_att[map_ID_save][att_seq_save][player_sex].."<color>),<color=yellow>"..Tb_player_sex_att[player_sex][2].."<color>, 甶 h醝 l筰 ? trung nh﹏ th玦! дn 頲 t鋋  th? hai ngi l祄 1 ng t竎 t譶h t?, s? nh薾 頲 to竔 phi課!")
	PlayerIndex = player_mate_index
	player_sex = GetSex()
	Talk(1,"","<color=green>Ch? ?<color>: ? trung nh﹏ c馻 b筺 s? d鬾g <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color> t譵 th蕐 1 t鋋  L璾 tinh: <color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> t鋋  l? <color=red>"..Tb_task_reel_att[map_ID_save][att_seq_save][player_sex].."<color>. дn 頲 t鋋  nh? nh綾 ? trung nh﹏ l祄 1 ng t竎 t譶h t?, s? nh薾 頲 to竔 phi課!")
	PlayerIndex = player_index_save	
end
--*************************碎片取出****************************
function ma_frag_get_out()
	Say("<color=green>Ch? ?<color>: B筺 c? th? l蕐 <color=yellow>to竔 phi課<color> trong <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color> t trong ngi. Xin h醝 mu鑞 l蕐 ra <color=yellow>to竔 phi課<color> n祇?",
	5,
	"L蕐 ra Gi竝 M閏 Dng/#get_out_num_in(568)",
	"L蕐 ra 蕋 M閏 /#get_out_num_in(569)",
	"L蕐 ra B輓h H醓 Dng/#get_out_num_in(570)",
	"L蕐 ra nh H醓 /#get_out_num_in(571)",
	"в ta suy ngh? l筰/end_dialog"
	)
end
--**********************取出数量输入***************************
function get_out_num_in(goods_id)
	local goods_num_save = GetTask(goods_id + 653)
	if goods_num_save <= 0 then
		Talk(1,"","<color=green>Ch? ?<color>: Trong <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color> c馻 b筺 c? b秐 kh玭g c? <color=yelllow>"..Tb_frag[goods_id].."<color>!")
		return
	end
	SetTaskTemp(goods_id_tasktempID,goods_id)
	AskClientForNumber("put_out",1,goods_num_save,"Xin nh藀 s? lng mu鑞 l蕐!")
end
--**************************取出操作***************************
function put_out(goods_num)
	--如果输入0则直接返回
	if goods_num == 0 then
		return
	end
	local goods_id = GetTaskTemp(goods_id_tasktempID)
	SetTaskTemp(goods_id_tasktempID,0)
	--数量判断
	local goods_num_save = GetTask(goods_id + 653)
	if goods_num_save < goods_num then
		Talk(1,"","<color=green>Ch? ?<color>: Trong <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color> c馻 b筺 kh玭g c?  <color=yelllow>"..Tb_frag[goods_id].."<color>!")
		return
	end
	--空间负重判断
	if Zgc_pub_goods_add_chk(1,goods_num) ~= 1 then
		return
	end
	--存放数量减少
	SetTask((goods_id + 653),(goods_num_save - goods_num))
	--物品增加
	if AddItem(2,1,goods_id,goods_num) == 1 then
		Msg2Player("B筺 l蕐 ra th祅h c玭g "..goods_num.."c竔"..Tb_frag[goods_id].."!")
	end
end
--**********************获取流星坐标***************************
function get_att()
	--所在地图测试
	local map_id = GetWorldPos()
	if Tb_task_reel_att[map_id] == nil then
		Talk(1,"","<color=green>Ch? ?<color>: Khu v鵦 n祔 kh玭g c? L璾 tinh to竔 phi課")
		return
	end
	--夫妻组队测试
	local mate_name = GetMateName()
	local team_member_num = GetTeamSize()
	local player_index_save = PlayerIndex
	local player_mate_index = 0
	local player_mate_mapID = 0
	if team_member_num ~= 2 then
		if team_member_num == 0 then
			Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 b筺 v? ? trung nh﹏  t? i!" )
			return
		else
			Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 trong t? i ch? c? <color=yellow>? trung nh﹏ c馻 b筺<color>!" )
			return
		end
	else
		for i = 1 , 2 do
			PlayerIndex = GetTeamMember(i)
			if mate_name == GetName() then
				player_mate_index = PlayerIndex
				player_mate_mapID = GetWorldPos()
				PlayerIndex = player_index_save
				break
			end
		end
		PlayerIndex = player_index_save
	end
	if player_mate_index == 0 then
		Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 b筺 v? ? trung nh﹏  t? i!" )
		return
	end
	local map_ID = GetWorldPos()
	if player_mate_mapID ~= map_ID then
		Talk(1,"","<color=green>Ch? ?<color>: Xin x竎 nh薾 b筺 v? ? trung nh﹏ ? c飊g m閠 khu v鵦!")
		return
	end
	--减少任务卷轴任务次数
	local fra_att_num = GetTask(Frag_att_num_TaskID) - 1
	SetTask(Frag_att_num_TaskID , fra_att_num)
	--写入并报告坐标
	local att_seq = random(1,getn(Tb_task_reel_att[map_id]))
	SetTask(task_map_id_TaskID,map_id)
	SetTask(task_att_seq_TaskID,att_seq)
	local player_sex = GetSex()
	TaskTip("Nh薾 頲 t鋋  2 vi猲 L璾 Tinh"..Tb_player_sex_att[player_sex][1].." t鋋  l?: "..Tb_task_reel_att[map_id][att_seq][player_sex])
	Talk(1,"","<color=green>Ch? ?<color>: Hi謓 t筰 t鋋  L璾 tinh trong <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color> s? lng c遪 <color=yellow>"..fra_att_num.."<color>, l莕 n祔 t譵 th蕐 to竔 phi課 <color=yellow>"..Tb_player_sex_att[player_sex][1].." (t鋋 ) <color> l? <color=red>"..Tb_task_reel_att[map_id][att_seq][player_sex].."<color>,<color=yellow>"..Tb_player_sex_att[player_sex][2].."<color>, 甶 h醝 l筰 ? trung nh﹏ th玦! дn 頲 t鋋  th? hai ngi l祄 1 ng t竎 t譶h t?, s? nh薾 頲 to竔 phi課!")
	Msg2Player("Nhi謒 v? l莕 n祔-"..Tb_player_sex_att[player_sex][1].." t鋋  l?: "..Tb_task_reel_att[map_id][att_seq][player_sex].."дn 頲 t鋋  th? l祄 1 ng t竎 t譶h t?, s? nh薾 頲 to竔 phi課!")
	PlayerIndex = player_mate_index
	player_sex = GetSex()
	Talk(1,"","<color=green>Ch? ?<color>: ? trung nh﹏ c馻 b筺 s? d鬾g <color=yellow>Khi猲 V﹏ Phi Tinh ph?<color>, nh薾 頲 1 t鋋  to竔 phi課, <color=yellow>"..Tb_player_sex_att[player_sex][1].."<color> t鋋  l? <color=yellow>"..Tb_task_reel_att[map_id][att_seq][player_sex].."<color> дn 頲 t鋋  xin nh綾 ? trung nh﹏ c馻 b筺 <color=yellow>l祄 1 ng t竎 t譶h t? b蕋 k?<color> s? <color=yellow> nh薾 頲 To竔 phi課<color>")
	Msg2Player("? trung nh﹏ c馻 b筺 s? d鬾g Khi猲 V﹏ Phi Tinh ph?, nh薾 頲 1 t鋋  to竔 phi課, "..Tb_player_sex_att[player_sex][1].." t鋋  l? "..Tb_task_reel_att[map_id][att_seq][player_sex].."дn 頲 t鋋  nh? nh綾 ? trung nh﹏ l祄 1 ng t竎 t譶h t?, s? nh薾 頲 to竔 phi課!")
	PlayerIndex = player_index_save	
end
--***********************宝物合成对话**************************
function cowry_comp_dia(page_diff)
	local tb_dia = {}
	local dia_add_num = 3
	if page_diff == 587 then
		dia_add_num = 5
	end
	for i = page_diff,(page_diff + dia_add_num) do
		tinsert(tb_dia,Tb_goods_compose[i][1][2].."("..Tb_goods_compose[i][1][4]..")/#cowry_comp_dtm("..i..")")
	end
	if page_diff == 583 then
		tinsert(tb_dia,"Trang k?/#cowry_comp_dia(587)")
	else
		tinsert(tb_dia,"Trang trc/#cowry_comp_dia(583)")
	end
		tinsert(tb_dia,"Tho竧/end_dialog")
	Say("<color=green>G頸 ?<color>: M鏸 lo筰 b秓 v藅 s? ti猽 hao s? lng <color=yellow>m秐h nh蕋 nh<color>, ch鋘 chu閠 ph秈 <color=yellow>m秐h<color>  cho v祇 <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color>. B筺 mu鑞 h頿 th祅h b秓 v藅 n祇?",
		getn(tb_dia),
		tb_dia
	)
end
--*******************宝物合成确认******************************
function cowry_comp_dtm(cowry_id)
	local compose_goods_need_dia = ""
	local compose_goods_save_dia = ""
	for i = 2 ,getn(Tb_goods_compose[cowry_id]) do
		local color = "<color=green>"
		local num_save = GetTask(Tb_goods_compose[cowry_id][i][1] + 653)
		if num_save < Tb_goods_compose[cowry_id][i][2] then
			color = "<color=red>"
		end
		compose_goods_need_dia = compose_goods_need_dia.."<color=yellow>"..Tb_goods_compose[cowry_id][i][2].."<color> c竔"..Tb_goods_compose[cowry_id][i][3]..";"
		compose_goods_save_dia = compose_goods_save_dia..color..GetTask(Tb_goods_compose[cowry_id][i][1] + 653).."<color> c竔"..Tb_goods_compose[cowry_id][i][3]..";"
	end
	Say("<color=green>G頸 ?<color>: B筺 mu鑞 d飊g nguy猲 li謚 trong <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color> h頿 th祅h 1 <color=yellow>"..Tb_goods_compose[cowry_id][1][2].."<color>? \n Nguy猲 li謚 c莕  h頿 th祅h:"..compose_goods_need_dia.."\n Nguy猲 li謚 hi謓 t筰 trong Khi猲 V﹏ Phi Tinh Ph?:"..compose_goods_save_dia.."\n Hi謚 qu? s? d鬾g:"..Tb_goods_compose[cowry_id][1][3],
		2,
		"T玦 mu鑞 h頿 th祅h/#cowry_comp("..cowry_id..")",
		"T玦 ch璦 chu萵 b? xong/end_dialog"
	)	
end
--*****************************开始合成************************
function cowry_comp(goods_id)
	--需要的物品对话
	--local goods_need_dia = ""
	--for i = 2,getn(Tb_goods_compose[goods_id]) do
	--	goods_need_dia = goods_need_dia.."<color=yellow>"..Tb_goods_compose[goods_id][i][2].."<color>个<color=yellow>"..Tb_goods_compose[goods_id][i][3].."<color>；"
	--end
	--所需要的材料检测
	for i = 2 ,getn(Tb_goods_compose[goods_id]) do
		if GetTask(Tb_goods_compose[goods_id][i][1] + 653) < Tb_goods_compose[goods_id][i][2] then
			Talk(1,"","<color=green>G頸 ?<color>: Xin x竎 nh薾 c?  nguy猲 li謚 trong <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color> <color=yellow>"..Tb_goods_compose[goods_id][i][3].."<color>!")
			return
		end
	end
	--空间负重检测
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
	--合成所需材料删除检测
	for i = 2, getn(Tb_goods_compose[goods_id]) do
		SetTask((Tb_goods_compose[goods_id][i][1] + 653),(GetTask((Tb_goods_compose[goods_id][i][1] + 653))-Tb_goods_compose[goods_id][i][2]))
	end
	--对应宝物增加
	if AddItem(2,1,Tb_goods_compose[goods_id][1][1],1) == 1 then
		Msg2Player("Ch骳 m鮪g b筺  h頿 th祅h 1"..Tb_goods_compose[goods_id][1][2].."!")
	end
end
--*****************************谱内元素查询********************
function get_frag_num()
	Talk(1,"OnUse","<color=green>G頸 ?<color>: T譶h tr筺g hi謓 t筰 m秐h v? trong <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color> l?: \n s? lng <color=yellow>Gi竝 M閏 Dng<color> <color=yellow>"..GetTask(1221).."<color>\n s? lng <color=yellow>蕋 M閏 <color>: <color=yellow>"..GetTask(1222).."<color>\n s? lng <color=yellow>B輓h H醓 Dng<color> <color=yellow>"..GetTask(1223).."<color>\n s? lng <color=yellow>nh H醓 Dng<color>: <color=yellow>"..GetTask(1224).."<color>")
end
--**************************流星谱剩余数量查询*****************
function get_att_num()
	Talk(1,"OnUse","<color=green>G頸 ?<color>: Hi謓 t筰 s? lng t鋋  L璾 tinh trong <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color> l?: <color=yellow>"..GetTask(Frag_att_num_TaskID).."<color>!")
end
--**************************流星采集说明************************
function get_att_info()
	Talk(2,"get_att_info_1",	"<color=green>G頸 ?<color>: T竎 d鬾g c馻 <color=yellow>Nhi謒 v? Phu th?<color> l? nh薾 頲 <color=yellow>B秓 v藅 Phu th?<color>, c? <color=yellow>2 bc<color>  t 頲 b秓 v藅 .<color=yellow> Bc 1<color> nh薾 頲 <color=yellow>m秐h L璾 tinh<color> trong r鮪g; <color=yellow>Bc 2<color> d飊g nh鱪g m秐h n祔 <color=yellow>h頿 th祅h B秓 v藅 Phu th?<color>.",
					"<color=green>G頸 ?<color>: 產 s? <color=yellow>Ngo礽 th祅h<color> u c? L璾 tinh r琲 xu鑞g, b筺 ng ng筰 th? s? d鬾g <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color>, xem n琲 n祇 c? m秐h L璾 tinh. <color=yellow>M秐h L璾 tinh<color> t譵 頲 ? <color=yellow>m鏸 khu v鵦<color> kh玭g gi鑞g nhau, <color=green>khu v鵦 c? ng c蕄 c祅g cao th? c? th? t譵 頲 to竔 phi課 c? ng c蕄 c祅g cao<color>."
		)
end
function get_att_info_1()
	Talk(1,"OnUse","<color=green>G頸 ?<color>: Nhi謒 v? Phu th? y猽 c莡 <color=yellow>phu th? ph秈 t? i<color>, kh玭g c? ngi kh竎 trong i. Sau  1 ngi d飊g Khi猲 V﹏ Phi Tinh Ph? kh雐 xng Nhi謒 v? Phu th?, <color=yellow>M鏸 ngi c? th? nh薾 頲 m閠 n鯽 a 甶觤 t鋋  L璾 tinh<color>. <color=red>Ch錸g nh薾 頲 t鋋  X, v? nh薾 頲 t鋋  Y<color>. <color=yellow>Ngi d飊g Khi猲 V﹏ Phi Tinh Ph?<color> t飝 ? th鵦 hi謓 1 <color=yellow>ng t竎<color> trong t鋋  m譶h  nh薾 頲 <color=yellow>m秐h L璾 tinh<color>. Ch? ?: <color=yellow>khi nh薾 t鋋  m秐h v?, ph秈 l? i v? ch錸g , c飊g ? trong 1 khu v鵦<color>, kh玭g 頲 gia nh藀 i kh竎."
		)
end
--**************************同心值说明***********************
function same_heart_value_info()
	Talk(2,"same_heart_value_info_2",	"<color=green>G頸 ?<color>: <color=yellow>Tr? s? ng t﹎<color> tng tr璶g cho t譶h c秏 v? ch錸g, t譶h c秏 v? ch錸g c祅g s﹗ n苙g <color=yellow>甶觤 Tr? s? ng t﹎<color> c祅g cao. S? d鬾g <color=yellow>Khi猲 V﹏ Phi Tinh Ph?<color> h頿 th祅h <color=yellow>уng T﹎ Кn<color>, <color=yellow>Чi уng T﹎ Кn<color>, <color=yellow>уng T﹎ Ho祅<color>, <color=yellow>Чi уng T﹎ Ho祅<color> u c? th? l祄 t╪g Tr? s? ng t﹎",
					"<color=green>G頸 ?<color>: T竎 d鬾g c馻 <color=yellow>уng T﹎ Кn<color> v? <color=yellow>Чi уng T﹎ Кn<color> l? <color=green>t╪g gi韎 h筺 Tr? s? ng t﹎<color>, <color=yellow>уng T﹎ Ho祅<color> v? <color=yellow>Чi уng T﹎ Ho祅<color> l祄 t╪g <color=green>甶觤 Tr? s? ng t﹎<color>. S? d鬾g ph鑙 h頿 m蕐 lo筰 уng T﹎ Кn n祔 s? li猲 t鬰 t╪g Tr? s? ng t﹎ l猲 n <color=green>5000<color>."
	)
end
function same_heart_value_info_2()
	Talk(2,"OnUse",	"<color=green>G頸 ?<color>: Tr? s? ng t﹎ <color=green>di 500<color>: i v? ch錸g T﹏ H玭 Y課 Nh?, Tr? s? ng t﹎ s? kh玭g ng鮪g t╪g trng, ch? c? qua 1 ng祔 s? gi秏 4 甶觤, ch? c莕 Tr? s? ng t﹎ <color=green>vt qua 500<color> s? kh玭g t╪g theo th阨 gian n鱝, ph秈 h頿 th祅h уng T﹎ Кn уng T﹎ Ho祅  gia t╪g. M鏸 tu莕 gi秏 <color=green>6%<color>; m閠 khi <color=green>vt qu? 2000<color>, Tr? s? ng t﹎ gi秏 <color=green>12%<color> m鏸 tu莕",
					"<color=green>G頸 ?<color>: T蕋 c? <color=yellow>k? n╪g Phu th?<color> u ph竧 huy t竎 d鬾g theo t譶h c秏 v? ch錸g, n誹 <color=yellow>Tr? s? ng t﹎<color> kh玭g t t韎 甶觤 nh蕋 nh s? <color=yellow>kh玭g ph竧 huy 頲<color> c竎 k? n╪g . C? k? n╪g <color=yellow>c╪ c? v祇 m鴆 cao th蕄 c馻 Tr? s? ng t﹎ ph竧 huy s鴆 m筺h<color>. в k? n╪g Phu th? c祅g m筺h. Ph秈 n? l鵦 n﹏g cao <color=yellow>Tr? s? ng t﹎<color>."
		)
end
