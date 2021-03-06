--脚本名称：2007清明接活动任务卷轴调用脚本。
--脚本功能：玩家使用任务卷轴，增加相关任务。
--策划人：阿松
--代码编写人：村长
--代码编写时间：2007-03-14
--代码修改记录：
Include("\\script\\online\\zgc_public_fun.lua")					--村长的公共函数

--========================================Glb变量定义区====================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2007_task_reel_date_seq = 855			--任务的日期序数
tomb_sweep_2007_task_reel_num = 856					--可完成的任务数量
tomb_sweep_2007_task_reel_diff = 857				--当前的任务种类
tomb_sweep_2007_task_reel_step = 858				--当前任务步骤（杀怪）
task_reel_table = {
	--任务类型(（1、为杀怪；2为收集）-完成标志-怪物名称-触发器ID-奖励百分几率-奖励倍数-随机祭品数量--说明
	{1,"C玭 ",1205,5,10,900,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>Nhi謒 v?<color>:<color> <color=yellow>C玭  ngo礽 th祅h<color> l祄 h筰 b? t竛h,  甶 nh b筰 <color=yellow>30<color> t猲 sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 95% c? h閕 nh﹏ i <color> kinh nghi謒 ho芻 <color=yellow>5%<color> c? h閕 g蕄 <color=yellow>11<color> kinh nghi謒. "},
	--任务类型-收集物品种类-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的物品名称-收集的物品大类-副类-小类-数量--说明<color>
	{2,1,10,5,2,"H? v?",2,1,19,20,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n    <color=yellow>N閕 dung nhi謒 v?: 畊玦 h?<color> l祄 thu鑓 c? th? tr? b謓h hay. H穣 thu th藀 <color=yellow>20<color> c竔 <color=yellow> 畊玦 h?<color> v? n <color=yellow>Th? L╪g Nh﹏<color>  ph鬰 m謓h. \n  <color=yellow>Ph莕 thng nhi謒 v?: 90%<color> c? h閕 nh﹏ <color=yellow>i <color>kinh nghi謒 ho芻 <color=yellow>10%<color> c? h閕 nh﹏ <color=yellow>6<color> kinh nghi謒."},
	{1,"X蕌 xa",1206,16,3,901,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n   <color=yellow>N閕 dung nhi謒 v?: Dng Trung чng<color> c? nh鱪g t猲 <color=yellow>Quan s?<color>,  h? hi誴 b? t竛h. H穣 甶 gi竜 hu蕁 甶 gi竜 hu蕁 <color=yellow>30<color> t猲,  sau  c? th? n <color=yellow>Th? l╪g nh﹏<color>  ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: nh薾 頲 84% c? h閕<color> <color=yellow> nh﹏ i <color>kinh nghi謒 ho芻 <color=yellow>16%<color> c? h閕 nh﹏ <color=yellow>4<color> kinh nghi謒."},
	{2,2,20,2.5,2,"Linh Chu t?",2,2,54,10,"Da g蕌",2,2,20,10,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>Nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚,  甶 thu th藀 10 <color=yellow>Linh Chu t?<color>,  10 <color=yellow>Da g蕌<color> sau   quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng:  80% c? h閕 nh﹏ i <color> kinh nghi謒 ho芻 <color=yellow>20%<color> c? h閕 g蕄 <color=yellow>3.5<color> kinh nghi謒. "},
	{2,2,30,1.7,2,"B莡 ru da d?",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>Nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚,  n <color=yellow>Ki誱 M玭 Quan<color> thu th藀 10 <color=yellow>b莡 ru da d?<color>,  n <color=yellow>Ki誱 C竎 th鬰 o<color> thu th藀 10 <color=yellow>Kim Thoa<color> sau  quay v? H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 70% c? h閕 nh﹏ i <color> kinh nghi謒 ho芻 <color=yellow>30%<color> c? h閕 g蕄 <color=yellow>2.7<color> kinh nghi謒. "},
	{2,2,40,1.25,2,"Thi猲 Lang y",0,100,15,1,"Minh Quang gi竝",0,100,51,1,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>Nhi謒 v?<color>:T譵 1 <color=yellow>Thi猲 Lang y<color> v? 1 <color=yellow>Minh Quang gi竝<color> sau  quay v? <color=yellow>Th? l╪g nh﹏<color> ph鬰 m謓h. \n    <color=yellow>Ph莕 thng nhi謒 v?: 60%<color> c? h閕 nh﹏ i<color=yellow> <color> kinh nghi謒 ho芻 <color=yellow>40%<color> c? h閕 g蕄 <color=yellow>2.25<color> l莕 甶觤 kinh nghi謒."},
	{2,2,50,1,2,"Gi竝 x竎 phi課",2,1,177,10,"Kh? S琻 ch?",2,1,98,10,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>Nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚,  甶 thu th藀 10 <color=yellow>Gi竝 x竎 phi課 ? Уo Hoa Фo<color>,  10 <color=yellow>b秐  r鮪g n骾 g鑓 ? Чi Th秓 Nguy猲<color>,  sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n    <color=yellow>Ph莕 thng: 50%<color> c? h閕 頲 nh﹏ i<color=yellow> <color> kinh nghi謒 v? <color=yellow>50%<color> c? h閕 nh薾 頲 g蕄 <color=yellow>1.5<color> l莕 甶觤 kinh nghi謒."},
	{1,"Xi H醓 trng l穙",1207,65,0.75,902,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>N閕 dung nhi謒 v?: Long Nh穘 чng<color> c? t猲 <color=yellow>Xi H醓 trng l穙<color> m? ho芻 b? t竛h,  sau khi nh b筰 <color=yellow>30<color> t猲 trong ,  h穣 n <color=yellow>Th? L╪g Nh﹏<color>  ph鬰 m謓h. \n    <color=yellow>Ph莕 thng nhi謒 v?: nh薾 頲 45% c? h閕<color> <color=yellow> nh﹏ i <color>kinh nghi謒 ho芻 <color=yellow>65%<color> c? h閕 nh﹏ <color=yellow>4<color> kinh nghi謒."},
	{2,2,80,0.65,2,"Huy襫 thi誸 Tr鋘g Ki誱",0,2,26,1,"Ph? Thi猲 k輈h",0,6,107,1,"    Ti誸 Thanh Minh  n,  ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>N閕 dung nhi謒 v?: <color>H穣 t譵 1 c竔 chu玦 <color=yellow>Huy襫 thi誸 tr鋘g ki誱 1<color> v? 1 chu玦 <color=yellow>Ph? Thi猲 K輈h 1<color>,  sau  n g苝 Th? l╪g nh﹏  ph鬰 m謓h. \n    <color=yellow>Ph莕 thng nhi謒 v?: 45%<color> c? h閕 nh﹏ <color=yellow>i <color>kinh nghi謒 ho芻 <color=yellow>65%<color> c? h閕 nh薾 頲 <color=yellow>1.75<color> l莕 kinh nghi謒."},
	{1,"Ti猽 Ti猲 T?",1208,100,0.5,903,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔. \n <color=yellow>N閕 dung nhi謒 v?: Ti猽 Ti猲 T?<color> ? <color=yellow>Thanh  ng<color> m? ho芻 kh玭g 輙 nh﹏ s? v? l﹎, 甶 nh b筰 m閠 trong <color=yellow>30<color> ngi sau  quay v? <color=yellow>H祅 gia nh﹏<color> ph鬰 m謓h. \n <color=yellow>Ph莕 thng: 100%<color> c? h閕 g蕄 <color=yellow>1.5<color> kinh nghi謒."}
	}
--========================================函数主逻辑区=====================================
--***********************************卷轴使用主函数****************************
function OnUse(goods_index)
	if GetLevel() < 11 then
		Talk(1,"","<color=green>Nh綾 nh?<color>:"..Zgc_pub_sex_name().."c莕 r蘮 luy謓 th猰 m閠 th阨 gian!")
		return
	end
	local task_reel_diff = (GetItemParticular(goods_index) - tomb_sweep_2007_start_goodsID + 1)
	local task_step_now = GetTask(tomb_sweep_2007_task_reel_diff)
	if task_step_now == 0 or task_step_now == nil then
		Say("B筺 mu鑞 th鵦 hi謓 bc n祇?",
		3,
		"Nh薾 nhi謒 v? trong m藅 /#reel_task_accept("..task_reel_diff..")",
		"Xem n閕 dung nhi謒 v?/#reel_inf_print("..task_reel_diff..",1)",
		"сng nhi謒 v?/end_dialog"
		)
	elseif task_step_now >= 1 and task_step_now <= 10 then
		Say("B筺 mu鑞 th鵦 hi謓 bc n祇?",
		3,
		"Xem nhi謒 v? 產ng l祄/#reel_inf_print("..task_step_now..",2)",
		"Xem n閕 dung nhi謒 v?/#reel_inf_print("..task_reel_diff..")",
		"сng nhi謒 v?/end_dialog"
		)
	else										--防止数据出错
		SetTask(tomb_sweep_2007_task_reel_diff,0)
	end
end
--*********************************卷轴详细信息查询****************************
function reel_inf_print(reel_diff,inq_flag)
	if tomb_sweep_2007_date_chk() ~= 1 then				--在活动期间有效
		Talk(1,"","Ho箃 ng  k誸 th骳!")
		return
	end
	Say(task_reel_table[reel_diff][getn(task_reel_table[reel_diff])],
	1,
	"Ta bi誸 r錳/end_dialog")
end
--************************************接受任务********************************
function reel_task_accept(task_diff)
	--在活动期间有效
	if tomb_sweep_2007_date_chk() ~= 1 then
		Talk(1,"","Ho箃 ng  k誸 th骳!")
		return
	end
	--
	--数据获取
	local reel_task_date_seq_save = GetTask(tomb_sweep_2007_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2007_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--可以完成的任务次数检测
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		Talk(1,"","M藅  nhi謒 v? Ti誸 Thanh Minh m鏸 ng祔 ch? l祄 頲 <color=yellow>1<color> l莕, b筺 c? th? d筼 ph? mua <color=yellow>gi蕐 c髇g t?<color>  t╪g s? l莕 ho祅 th祅h nhi謒 v?!")
		return
	end
	if reel_task_date_seq_save < date_seq_now then
		SetTask(tomb_sweep_2007_task_reel_num,1)
	end
	SetTask(tomb_sweep_2007_task_reel_date_seq,date_seq_now)		--今天日期序数写入
	SetTask(tomb_sweep_2007_task_reel_diff,task_diff)
	SetTask(tomb_sweep_2007_task_reel_step,0)
	if task_reel_table[task_diff][1] == 1 then						--如果为杀怪任务则创建杀怪触发器
		CreateTrigger(0,task_reel_table[task_diff][3],task_reel_table[task_diff][6])
	end
	Talk(1,"","B筺  nh薾 nhi謒 v? th? <color=yellow>"..task_diff.."<color> c? th? n <color=yellow>th? l╪g nh﹏<color> h駓 nhi謒 v? ho芻 nh薾 thng! \n Nh蕁 chu閠 ph秈 xem n閕 dung nhi謒 v?!")
end
