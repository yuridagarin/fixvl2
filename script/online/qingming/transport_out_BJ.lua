--File name:transport_out_BJ.lua
--Describe:扫墓传送人（传出）
--Create Date:2006-3-16
--Author:yanjun
--脚本修改记录：
--2007年清明节活动修改。
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
LeavePointTab = {	--记录从陵墓出来时的坐标
			[1] = {100,1453,2812},	--泉州　黄侠冢
			[2] = {200,1170,2834},	--汴京　韩侠冢
			[3] = {300,1640,3531},	--成都　轩辕侠冢
			}
--================================以下是全局变量=======================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2007_task_finish_count = 853
tomb_sweep_2007_task_reel_date_seq = 855			--任务的日期序数
tomb_sweep_2007_task_reel_num = 856					--可完成的任务数量
tomb_sweep_2007_task_reel_diff = 857				--当前的任务种类
tomb_sweep_2007_task_reel_step = 858				--当前任务步骤（杀怪）
task_reel_table = {
	--任务类型(（1、为杀怪；2为收集）-完成标志-怪物名称-怪物数量-奖励百分几率-奖励倍数-随机祭品数量--说明
	{1,"C玭 ",1205,5,10,900,""},
	--任务类型-收集物品种类-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的物品名称-收集的物品大类-副类-小类-数量--说明
	{2,1,10,5,2,"H? v?",2,1,19,20,""},
	{1,"X蕌 xa",1206,16,3,901,""},
	{2,2,20,2.5,2,"Linh Chu t?",2,2,54,10,"Da g蕌",2,2,20,10,""},
	{2,2,30,1.7,2,"B莡 ru da d?",2,1,60,10,"Kim Thoa",2,1,41,10,""},
	{2,2,40,1.25,2,"Thi猲 Lang y",0,100,15,1,"Minh Quang gi竝",0,100,51,1,""},
	{2,2,50,1,2,"Gi竝 x竎 phi課",2,1,177,10,"Kh? S琻 ch?",2,1,98,10,""},
	{1,"Xi H醓 trng l穙",1207,65,0.75,902,""},
	{2,2,80,0.65,2,"Huy襫 thi誸 Tr鋘g Ki誱",0,2,26,1,"Ph? Thi猲 k輈h",0,6,107,1,""},
	{1,"Ti猽 Ti猲 T?",1208,100,0.5,903,""}
	}
--========================================函数主逻辑区=====================================
--***********************************对话主函数****************************
function main()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	local selTab = {}
	if task_diff == nil or task_diff == 0 then
		selTab = {
				"Xin a ta v?!/#gohome(2)",
				"T譵 hi觰 ho箃 ng Ti誸 Thanh Minh./tomb_sweep_2007_inf",
				"M謙 qu?! Cho ng錳 ngh? ch髏 !/end_dialog",
				}
	else
		selTab = {
				"Xin a ta v?!/#gohome(2)",
				"Nh薾 ph莕 thng./get_teel_task_prize",
				"H駓 nhi謒 v?./teel_task_release",
				"T譵 hi觰 ho箃 ng Ti誸 Thanh Minh./tomb_sweep_2007_inf",
				"M謙 qu?! Cho ng錳 ngh? ch髏 !/end_dialog",
				}
	end
	Say(" t?!"..Zgc_pub_sex_name().."n b竔 t? m? ch? nh﹏, c? c莕 ti觰 nh﹏ a ng礽 v? kh玭g?",getn(selTab),selTab);
end
--*******************************传回三大主城*****************************
function gohome(MapIndex)
	NewWorld(LeavePointTab[MapIndex][1],LeavePointTab[MapIndex][2],LeavePointTab[MapIndex][3]);
end
--********************************任务奖励换取****************************
function get_teel_task_prize()
	--在活动期间有效
	if tomb_sweep_2007_date_chk() ~= 1 then				
		Talk(1,"","Ti誸 Thanh Minh  qua,"..Zgc_pub_sex_name().."N誹 c? l遪g n╩ sau nh? n c髇g b竔!")
		return
	end
	--玩家负重检测
	if Zgc_pub_goods_add_chk(2,10) ~= 1 then
		return
	end
	--任务次数检测
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)	
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		Talk(1,"","M藅  Thanh Minh m鏸 ng祔 ch? c? th? ho祅 th祅h <color=yellow>1<color> l莕, ngi c? th? d筼 ph? mua <color=yellow>gi蕐 c髇g t?<color>  t╪g s? l莕 ho祅 th祅h!")
		return
	end
	
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	--任务检测
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","Trc m? ti猲 nh﹏ kh玭g 頲 n鉯 b藋"..Zgc_pub_sex_name().."B籲g h鱱 nh薾 nhi謒 v? khi n祇?")
		return
	end
	--任务卷轴检测
	if GetItemCount(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1)) < 1 then
		Talk(1,"","Ngi kh玭g mang theo m藅  nhi謒 v?!")
		return
	end
	if task_reel_table[task_diff][1] == 1 then			--杀怪任务
		if GetTask(tomb_sweep_2007_task_reel_step) ~= 1 then
			Talk(1,"","<color=green>H祅 Gia nh﹏<color>:"..Zgc_pub_sex_name().."kh玭g 頲 n鉯 b藋 trc m? ti猲 nh﹏, l祄 xong nhi謒 v? m韎 n y!")
			return
		end
	else
		--物品拥有检测
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if task_reel_table[task_diff][10+add_num] ~= 1 then
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Xin ki觤 tra tr猲 ngi mang  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				end
			else
				if GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) < task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Xin ki觤 tra tr猲 ngi mang  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>!")
					return
				--收装备时为了防止收错，多于收的件数一律不收。
				elseif GetItemCount(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num]) > task_reel_table[task_diff][10+add_num] then
					Talk(1,"","Ngi"..task_reel_table[task_diff][6+add_num].."d? ra <color=yellow>1<color> c竔, l穙 phu kh玭g th? nh薾.")
					return
				end
			end
		end
	end
	local player_level = GetLevel()
	local exp_chg_num = floor(player_level*player_level*player_level*player_level/100)
	prize_exp_add()
end
--*******************************经验转经验***************************
function prize_exp_add()
	local task_finish_count = GetTask(tomb_sweep_2007_task_finish_count)
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_reel_table[task_diff][1] == 2 then
		--物品删除检测
		for i = 1,task_reel_table[task_diff][2] do
			local add_num = (i - 1) * 5
			if DelItem(task_reel_table[task_diff][7+add_num],task_reel_table[task_diff][8+add_num],task_reel_table[task_diff][9+add_num],task_reel_table[task_diff][10+add_num]) ~= 1 then
				Talk(1,"","Xin ki觤 tra tr猲 ngi mang  <color=yellow>"..task_reel_table[task_diff][6+add_num].."<color>")
				return
			end
		end
	end
	--任务卷轴删除检测
	if DelItem(2,0,(tomb_sweep_2007_start_goodsID + task_diff -1),1) ~= 1 then
		Talk(1,"","H譶h nh? m藅  nhi謒 v? c馻 ngi kh玭g ng!")
		return
	end
	--经验转经验
	local player_level = GetLevel()
	local exp_num = floor(player_level*player_level*player_level*player_level/100)
	local prize_times = 1
	if task_reel_table[task_diff][1] == 1 and random(1,100) <= task_reel_table[task_diff][4] then			--杀怪任务
		prize_times =(1+ task_reel_table[task_diff][5])
	elseif task_reel_table[task_diff][1] == 2 and random(1,100) <= task_reel_table[task_diff][3] then
		prize_times = (1+ task_reel_table[task_diff][4])
	end
	if task_finish_count == 14 then
		prize_times = (prize_times +9)
		Talk(1,"","Зy l? l莕 "..Zgc_pub_sex_name().."th? <color=yellow>15<color> ho祅 th祅h nhi謒 v? m藅 ,"..Zgc_pub_sex_name().." nh薾 頲 ph莕 thng kinh nghi謒 g蕄 10 l莕.")
	end
		exp_num = floor(exp_num*prize_times)
		ModifyExp(exp_num)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..exp_num.." 甶觤 kinh nghi謒!")	
	--任务完成处理
		--数据获取
	if task_reel_table[task_diff][1] == 1 then				--如果是杀怪任务则删除杀怪触发器
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--数据保存
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2007_task_reel_num,0)
	elseif reel_task_date_seq_save == date_seq_now and reel_task_num_save > 0 then
		SetTask(tomb_sweep_2007_task_reel_num,(reel_task_num_save-1))
	elseif reel_task_date_seq_save > date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)
		SetTask(tomb_sweep_2007_task_reel_num,0)
	end
	--完成次数
	if task_finish_count == nil then
		SetTask(tomb_sweep_2007_task_finish_count,1)
	else
		SetTask(tomb_sweep_2007_task_finish_count,(task_finish_count+1))
	end
	SetTask(tomb_sweep_2007_task_reel_diff,0)
	SetTask(tomb_sweep_2007_task_reel_step,0)
end
--**********************************任务取消******************************
function teel_task_release()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_diff == 0 or task_diff == nil then
		Talk(1,"","Trc m? ti猲 nh﹏ kh玭g 頲 n鉯 b藋"..Zgc_pub_sex_name().."Ngi ch璦 nh薾 qua nhi謒 v? n猲 kh玭g th? h駓!")
		return
	elseif task_diff >= 1 and task_diff <= 10 then
		Say("M藅  n祔"..Zgc_pub_sex_name().."ngi h鱱 duy猲 m韎 c?, ngi th藅 s? mu鑞 h駓 kh玭g?",
		2,
		"ng/task_release_dtm",
		"в ta suy ngh? l筰/end_dialog"
		)
	else			--数据出错的情况
		SetTask(tomb_sweep_2007_task_reel_diff,0)
	end
end
--********************************任务数据清除*******************************
function task_release_dtm()
	local task_diff = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_reel_table[task_diff][1] == 1 then				--如果是杀怪任务则删除杀怪触发器
		RemoveTrigger(GetTrigger(task_reel_table[task_diff][6]))
	end
	SetTask(tomb_sweep_2007_task_reel_diff,0)
	Msg2Player("B筺  h駓 nhi謒 v? Thanh Minh!")
end
--********************************活动详情描述*******************************
function tomb_sweep_2007_inf()
	Talk(2,"tomb_sweep_2007_inf_1",
	"\n Th阨 gian di詎 ra ho箃 ng: <color=yellow>30/3 - 8/4<color>. \n Trong Ti誸 Thanh Minh vi謈 t秓 m? l? ch? y誹, ta c莕 c髇g b竔 c竎 v? nh? <color=yellow>Chu i hi謕, H祅 i hi謕, Hi猲 Vi猲 i hi謕<color>.",
	"\n Trong Ti誸 Thanh Minh m鏸 ng祔 n b蕋 k? m? ph莕 c髇g b竔 <color=yellow>1<color> l莕 b籲g c竎h <color=yellow>v竔 l箉<color> l? 頲. Do"..Zgc_pub_sex_name().."th祅h t﹎ nh薾 頲 m藅  nhi謒 v? c馻 th? l╪g nh﹏."
	)
end
function tomb_sweep_2007_inf_1()
	Talk(2,"","\n Ho祅 th祅h nhi謒 v? <color=yellow>H祅 gia nh﹏<color>. Mang <color=yellow>m藅 <color> n <color=yellow>H祅 gia nh﹏<color> nh薾 <color=yellow>ph莕 thng kinh nghi謒<color> nh蕋 nh.",
		"\n Ho祅 th祅h <color=yellow>15<color> l莕 <color=yellow>m藅  Thanh Minh<color> nh薾 頲 ph莕 thng g蕄 <color=yellow>10 l莕<color>."
)
end