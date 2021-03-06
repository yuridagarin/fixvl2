--脚本名称：2007清明接活动任务卷轴调用脚本。
--脚本功能：玩家使用任务卷轴，增加相关任务。
--策划人：阿松
--代码编写人：村长
--代码编写时间：2007-03-14
--代码修改记录：2008-3-19 2008年清明节
Include("\\script\\online\\zgc_public_fun.lua")					--村长的公共函数
Include("\\script\\lib\\lingshi_head.lua")
Include("\\script\\online\\qingming08\\head_qingming.lua")

--========================================Glb变量定义区====================================
tomb_sweep_2007_start_goodsID = 675
tomb_sweep_2008_task_reel_date_seq = 1852			--任务的日期序数
tomb_sweep_2008_task_reel_num = 1853					--可完成的任务数量
tomb_sweep_2008_task_reel_diff = 1854				--当前的任务种类
tomb_sweep_2008_task_reel_step = 1855				--当前任务步骤（杀怪）
if IS_SHOUFEI == TRUE then
	task_reel_table = {
		--任务类型(（1、为杀怪；2为收集；3为灵石）-怪物名称-触发器ID-奖励百分几率-奖励倍数-返回的触发器索引--说明
		{1,"C玭 ",1205,5,11,900,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>Nhi謒 v?<color>: <color=yellow>C玭  ngo礽 th祅h<color> l祄 h筰 b? t竛h, 甶 nh b筰 <color=yellow>30<color> t猲 sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng: 95%<color> x竎 su蕋 <color=yellow>nh﹏ i kinh nghi謒<color> ho芻 <color=yellow>5%<color> x竎 su蕋 g蕄 <color=yellow>11<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow> 2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		--任务类型-收集物品种类个数-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的物品名称-收集的物品大类-副类-小类-数量--说明<color>
		{2,1,10,6,2,"H? v?",2,1,19,20,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?: 玦 h?<color> l祄 thu鑓 c? th? 甶襲 tr? c竎 b謓h t藅, thu th藀 <color=yellow>20<color> <color=yellow>畊玦 h?<color> sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng: x竎 su蕋 90%<color> nh﹏ i <color=yellow>kinh nghi謒<color> ho芻 <color=yellow>10%<color> x竎 su蕋 g蕄 <color=yellow>6<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{1,"Quan s?",1206,16,4,901,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?: Quan s? <color>?<color=yellow> Dng Trung ng <color> h? hi誴 b? t竛h, gi竜 hu蕁 <color=yellow>30<color> t猲 m閠 b礽 h鋍 sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 84%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>16%<color> x竎 su蕋 g蕄 <color=yellow>4<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		--任务类型-收集物品种类个数-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的灵石名称-收集的灵石数量-收集的灵石数量的任务变量-说明
		{3,1,20,3.5,2,"Linh th筩h c蕄 1",4,SYS_TSK_LINGSHI_ONE,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚. Thu th藀 <color=yellow> 4 Linh th筩h c蕄 1<color>, sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 80%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>20%<color> x竎 su蕋 g蕄 <color=yellow>3.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{2,2,30,2.7,2,"B莡 ru da d?",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚. дn <color=yellow>Ki誱 M玭 Quan<color> thu th藀 10 <color=yellow>b莡 ru da d?<color>, n <color=yellow>Ki誱 C竎 th鬰 o<color> thu th藀 10 <color=yellow>Kim Thoa<color> sau  quay v? Th? l╪g m? <color>ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 70% <color>nh﹏ i<color=yellow> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 <color>ho芻<color=yellow>30%<color> x竎 su蕋 g蕄 <color=yellow>2.7<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{3,2,40,2.25,2,"Linh th筩h c蕄 2",2,SYS_TSK_LINGSHI_TWO,"Linh th筩h c蕄 3",2,SYS_TSK_LINGSHI_THREE,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: T譵 <color=yellow>2 Linh th筩h c蕄 2<color>, <color=yellow>2 Linh th筩h c蕄 3<color> t v祇 T? Linh nh xong, n g苝 <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 60%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>40%<color> x竎 su蕋 g蕄 <color=yellow>2.25<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{2,2,50,2,2,"Gi竝 x竎 phi課",2,1,177,10,"Kh? S琻 ch?",2,1,98,10,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚. Thu th藀 10 <color=yellow>Gi竝 x竎 phi課 ? Уo Hoa Фo<color>, <color=yellow>10 b秐  r鮪g n骾 g鑓 ? Чi Th秓 Nguy猲<color> sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 50%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒 <color> ho芻 <color=yellow>50%<color> x竎 su蕋 g蕄 <color=yellow>2<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈,1 Linh th筩h ng藆 nhi猲 1-7<color>."},
		{1,"Cao th? quan ngo筰",1207,65,1.75,902,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: ? Long M玭 tr蕁 c? <color=yellow>Cao th? quan ngo筰<color> h? hi誴 b? t竛h, 甶 nh <color=yellow>30<color> t猲 trong s? ch髇g, sau  n <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 35%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.75<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{3,1,80,1.65,2,"Linh th筩h c蕄 4",2,SYS_TSK_LINGSHI_FOUR,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: T譵 <color=yellow>2 Linh th筩h c蕄 4<color> t v祇 trong T? Linh nh xong, n Th? l╪g m? ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 45%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.65<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{1,"T莔 B秓 Nh﹏",1208,100,1.5,903,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Sa m筩 m? cung c? <color=yellow>T莔 b秓 nh﹏<color>  thng kh玭g 輙 nh﹏ s? giang h?, h穣 nh b筰 <color=yellow>30<color> t猲 sau  n g苝 <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: 100%<color> x竎 su蕋 g蕄 <color=yellow>1.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."}
		}
else
	task_reel_table = {
		--任务类型(（1、为杀怪；2为收集；3为灵石）-怪物名称-触发器ID-奖励百分几率-奖励倍数-返回的触发器索引--说明
		{1,"C玭 ",1205,5,11,900,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Ngo礽 th祅h c? nh鱪g t猲 <color=yellow>C玭 <color> l祄 h筰 b? t竛h, nh <color=yellow>30<color> t猲 sau  n <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 95%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>5%<color> x竎 su蕋 g蕄 <color=yellow>11<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		--任务类型-收集物品种类个数-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的物品名称-收集的物品大类-副类-小类-数量--说明<color>
		{2,1,10,6,2,"H? v?",2,1,19,20,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?: 玦 h?<color> l祄 thu鑓 c? th? 甶襲 tr? c竎 b謓h t藅, thu th藀 <color=yellow>20<color> <color=yellow>畊玦 h?<color> sau  n <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 90%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>10%<color> x竎 su蕋 g蕄 <color=yellow>6<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{1,"Quan s?",1206,16,4,901,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?: Quan s?<color> ? <color=yellow>Dng Trung ng<color> h? hi誴 b? t竛h, gi竜 hu蕁 <color=yellow>30<color> t猲 sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 84%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>16%<color> x竎 su蕋 g蕄 <color=yellow>4<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		--任务类型-收集物品种类个数-任务奖励百分几率-任务奖励倍数-随机祭品数-收集的灵石名称-收集的灵石数量-收集的灵石数量的任务变量-说明
		{3,1,20,3.5,2,"Linh th筩h c蕄 1",4,SYS_TSK_LINGSHI_ONE,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Hi謓 tri襲 nh c莕 thu th藀 <color=yellow>4 Linh th筩h c蕄 1<color> sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 80%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>20%<color> x竎 su蕋 g蕄 <color=yellow>3.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{2,2,30,2.7,2,"B莡 ru da d?",2,1,60,10,"Kim Thoa",2,1,41,10,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚, n <color=yellow>Ki誱 M玭 Quan<color> thu th藀 10 <color=yellow>b莡 ru da d?<color>, n <color=yellow>Ki誱 C竎 th鬰 o<color> thu th藀 10 <color=yellow>Kim Thoa<color> sau  quay v? Th? l╪g m? <color>ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 70%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>30%<color> x竎 su蕋 g蕄 <color=yellow>2.7<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{3,2,40,2.25,2,"Linh th筩h c蕄 2",2,SYS_TSK_LINGSHI_TWO,"Linh th筩h c蕄 3",2,SYS_TSK_LINGSHI_THREE,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: T譵 <color=yellow>2 Linh th筩h c蕄 2<color>, <color=yellow>2 Linh th筩h c蕄 3<color> t v祇 T? Linh nh xong n <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n    <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 60%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>40%<color> x竎 su蕋 g蕄 <color=yellow>2.25<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{2,2,50,2,2,"Gi竝 x竎 phi課",2,1,177,10,"Kh? S琻 ch?",2,1,98,10,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: Hi謓 tri襲 nh c莕 m閠 s? v藅 li謚, thu th藀 10 <color=yellow>Gi竝 x竎 phi課 ? Уo Hoa Фo<color>, 10 <color=yellow>b秐  r鮪g n骾 g鑓 ? Чi Th秓 Nguy猲<color> sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 50%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>50%<color> x竎 su蕋 g蕄 <color=yellow>2<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{1,"Cao th? quan ngo筰",1207,65,1.75,902,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: <color=yellow>Cao th? quan ngo筰<color> ? Long M玭 tr蕁  thng b? t竛h, h穣 nh b筰 <color=yellow>30<color> t猲 sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 35%<color> nh﹏ i <color=yellow>甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.75<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{3,1,80,1.65,2,"Linh th筩h c蕄 4",2,SYS_TSK_LINGSHI_FOUR,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?<color>: T譵 <color=yellow>2 Linh th筩h c蕄 4<color> t v祇 T? Linh nh xong n t譵 Th? l╪g m? ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v?: x竎 su蕋 45%<color> nh﹏ i <color=yellow> 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒<color> ho芻 <color=yellow>65%<color> x竎 su蕋 g蕄 <color=yellow>1.65<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."},
		{1,"T莔 B秓 Nh﹏",1208,100,1.5,903,"    Ti誸 Thanh Minh  n, ch? ta c? m閠 s? m藅  nhi謒 v? d祅h cho nh鱪g ai th祅h t﹎ c髇g b竔.\n    <color=yellow>N閕 dung nhi謒 v?: ? Sa m筩 m? cung<color> c? <color=yellow>T莔 b秓 nh﹏<color>  thng kh玭g 輙 nh﹏ s? giang h?, nh b筰 <color=yellow>30<color> t猲 sau  quay v? <color=yellow>Th? l╪g m?<color> ph鬰 m謓h.\n   <color=yellow>Ph莕 thng nhi謒 v?: 100%<color> x竎 su蕋 g蕄 <color=yellow>1.5<color> l莕 甶觤 s鴆 kh醗 chuy觧 th祅h kinh nghi謒. N誹 c蕄 99, th? nh薾 頲 <color=yellow>2 cu鑞 Thi猲 Th阨 Ch? Gi秈, 1 Linh th筩h c蕄 1-7<color>."}
		}
end
--========================================函数主逻辑区=====================================
--***********************************卷轴使用主函数****************************
function OnUse(goods_index)
	if GetLevel() < 11 then
		Talk(1,"","<color=green>Nh綾 nh?<color>:"..Zgc_pub_sex_name().."c莕 r蘮 luy謓 th猰 m閠 th阨 gian!")
		return
	end
	local task_reel_diff = (GetItemParticular(goods_index) - tomb_sweep_2007_start_goodsID + 1)
	local task_step_now = GetTask(tomb_sweep_2008_task_reel_diff)
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
		SetTask(tomb_sweep_2008_task_reel_diff,0)
	end
end
--*********************************卷轴详细信息查询****************************
function reel_inf_print(reel_diff,inq_flag)
	if is_qingming_opened() ~= 1 then				--在活动期间有效
		Talk(1,"","Ho箃 ng  k誸 th骳!")
		return
	end
	Talk(1,"",task_reel_table[reel_diff][getn(task_reel_table[reel_diff])])
end
--************************************接受任务********************************
function reel_task_accept(task_diff)
	--在活动期间有效
	if is_qingming_opened() ~= 1 then
		Talk(1,"","Ho箃 ng  k誸 th骳!")
		return
	end
	--
	--数据获取
	local reel_task_date_seq_save = GetTask(tomb_sweep_2008_task_reel_date_seq)
	local reel_task_num_save = GetTask(tomb_sweep_2008_task_reel_num)
	local date_seq_now = zgc_pub_day_turn(1)
	--可以完成的任务次数检测
	if reel_task_date_seq_save >= date_seq_now and reel_task_num_save == 0 then
		if IS_SHOUFEI == TRUE then
			Talk(1,"","<color=green>Nh綾 nh?<color>: V祇 ti誸 Thanh Minh m鏸 ng祔 ngi ch? c? th? ho祅 th祅h m藅  nhi謒 v? <color=yellow>2<color> l莕! Ngi c? th? d筼 ph? mua gi蕐 c髇g t? t╪g s? l莕 nhi謒 v? m藅 .")
		else
			Talk(1,"","<color=green>Nh綾 nh?<color>: V祇 ti誸 Thanh Minh m鏸 ng祔 ngi ch? c? th? ho祅 th祅h m藅  nhi謒 v? <color=yellow>1<color> l莕! Ngi c? th? d筼 ph? mua gi蕐 c髇g t? t╪g s? l莕 nhi謒 v? m藅 .")
		end
		return
	end
	if reel_task_date_seq_save < date_seq_now then--过了一天，重设任务次数
		if IS_SHOUFEI == TRUE then
			SetTask(tomb_sweep_2008_task_reel_num,2)--收费区每天可以接受任务两次
		else
			SetTask(tomb_sweep_2008_task_reel_num,1)
		end
	end
	SetTask(tomb_sweep_2008_task_reel_date_seq,date_seq_now)		--今天日期序数写入
	SetTask(tomb_sweep_2008_task_reel_diff,task_diff)
	SetTask(tomb_sweep_2008_task_reel_step,0)
	if task_reel_table[task_diff][1] == 1 then						--如果为杀怪任务则创建杀怪触发器
		CreateTrigger(0,task_reel_table[task_diff][3],task_reel_table[task_diff][6])
	end
	Talk(1,"","B筺  nh薾 nhi謒 v? th? <color=yellow>"..task_diff.."<color> c? th? n <color=yellow>th? l╪g nh﹏<color> h駓 nhi謒 v? ho芻 nh薾 thng! \n Nh蕁 chu閠 ph秈 xem n閕 dung nhi謒 v?!")
end
