--文件名称：西北区关卡mission头文件
--文件功能：西北区关卡mission的头文件，主要做mission的整合处理
--策划人：陈公子
--代码开发人：村长
--代码开发时间：2007-08-06
--代码修改记录：
--备注：我不上天堂，谁上天堂？
--公共变量定义区
--mission timer
Include("\\script\\lib\\globalfunctions.lua")
Timmer_ID = 67				--计时器ID
Frame_per_second = 18						--服务器每秒帧数=18
Timer_interval = 10 * Frame_per_second		--调用的秒数
Timmer_loop_num = 194						--总计循环的次数

--公共变量定义区
Mission_step_taskID = 1
TB_mission_step_value = {10,15,20,25,30}

MS_ID = 39									--mission的id
--MS_ID总的使用情况（1-9为所有MS通用10以后各个MS自行分配）
MS_STATE_ID = 1						--mission状态的存储id
MS_STATE_DIFF_ID = 2				--当前是第几关的id
MS_PLAYER_NUM = 3					--存放进入玩家的数量
MS_DIFF = 4								--存放当前关卡模式（1为普通，2为复杂）
MS_TIMMER_LOOP_ID = 5			--计时器的数量存放位置

MS_BOSS_KILL_NUM = 11			--第五关杀死boss的数量
MS_BOSS_INDEX_ID = 12			--boss索引存放位置
MS_DRAGON_FOX_NUM = 13		--玩家杀死小怪/血魔人数量存放位置
MS_BLOOD_MONSTER_NUM = 14 --血魔人的数量
--20-25保存boss索引
MS_BOSS_INDEX_1 = 21
MS_BOSS_INDEX_2 = 22
MS_BOSS_INDEX_3 = 23
MS_BOSS_INDEX_4 = 24
MS_BOSS_INDEX_5 = 25
--mission状态ID
MS_state_unuse = 0
MS_state_wait_start = 1
MS_state_running = 2
MS_state_wait_end = 3
--trigger使用ID
Trigger_ID = 1110
Trigger_save_ID = 904
Tb_stage_npc_name = {"е T? C玭 L玭","Th? m? nh﹏","Th? M? Tng Qu﹏","Dc th蕋 th? v?","Ng? H祅h Tr薾 S?","B筩h Thi猲 Th祅h"}
--2008-06-12：添加
Npc_name_city = "<color=green>M藅 th竚 Чi T鑞g T﹜ V鵦<color>: "
TaskID_miss_login_diff = 1426
--end
Stage_count = getn(Tb_stage_npc_name)
Stage_info = {}
for i = 1,Stage_count do
	--关卡信息
	Stage_info[i] = {}
	--关卡函数信息
	Stage_info[i] .Timmer_function = {}
end
--每关时间进度条的数量
Tb_stage_time_bar_num = {2,4,2,2,2,3}
--小怪数量限制
Tb_devil_num_max = {0,20,20,40,25,20}
--闯关条件相关公共变量
	--进入关卡最低等级
	Stage_player_level_min = 85
	--闯关人数限制
	team_member_chk = {3,5}
	--进入关卡的PK最大值
	Mission_PK_max = 3
	--每周进入光卡的次数限制
	Mission_week_seq_TaskID = 1422
	Mission_login_times_TaskID = 1423
	Mission_login_times_per_week = 10
	--流派名称
	Tb_route_name = {
		[0] = "Ch? tr緉g",
		[1] = "Thi誹 L﹎",
		[2] = "Thi誹 L﹎ t鬰 gia",
		[3] = "Thi誹 L﹎ thi襫 t╪g",
		[4] = "Thi誹 L﹎ v? t╪g",
		[5] = "Л阯g M玭",
		[6] = "Л阯g M玭",
		[7] = "Nga My",
		[8] = "Nga My ph藅 gia",
		[9] = "Nga My t鬰 gia",
		[10] = "C竔 Bang",
		[11] = "C竔 Bang T躰h y",
		[12] = "C竔 Bang ? Y",
		[13] = "V? ng",
		[14] = "V? ng o gia",
		[15] = "V? ng t鬰 gia",
		[16] = "Dng M玭",
		[17] = "Dng M玭 thng K?",
		[18] = "Dng M玭 Cung K?",
		[19] = "Ng? чc",
		[20] = "T? hi謕",
		[21] = "C? s?",
	}
--npc名称
for i = 1,6 do
	Stage_info[i].npc_name = "<color=green>"..Tb_stage_npc_name[i].."<color>: "
end
--进入关卡需要的taskid
Stage_info.task_ID = {2031,68,"Nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩"}
--npc主对话
Stage_info[1].main_dialog = {Stage_info[1].npc_name.."Ngi l? ai? t n祔 c? d? th?, v? c飊g nguy hi觤, n誹 kh玭g c? vi謈 g? th? mau mau 甶 甶.",
							Stage_info[1].npc_name.."C? Dng Th? b? dc l鵦 c馻 h醓 luy謓 kim n l祄 tr鎖 d藋 t輓h kh? hung 竎, tr鑞 t筰 n琲 y, xem ra n? 產ng h鴑g ch辵 m飅 v? 產u kh?."	
							}
Stage_info[1].no_task_dialog = Stage_info[1].npc_name.."Ngi l? ai? <color=yellow>C? Dng d? th?<color>  xu蕋 hi謓, t筸 th阨 phong t醓 ng n祔, n琲 y r蕋 nguy hi觤, n誹 kh玭g c? vi謈 g? th? mau 甶 甶."					--无任务时候的对话
Stage_info[1].finish_task_dialog = Stage_info[1].npc_name.."V? c飊g c秏 k輈h b籲g h鱱 tng tr?, C? Dng th?  b? thu ph鬰, trong M藅 ng t筸 th阨 kh玭g kh竎 thng. N誹 C? Dng th? l筰 c? h祅h ng kh竎 l?. Xin nh? b籲g h鱱 gi髉 !"
Stage_info[1].stage_name = "C? Dng M藅 ng"											--stage名称
Stage_info[1].ground_sel_dialog = {
	{Stage_info[1].npc_name.."N誹 nay c? h祇 ki謙 thu ph鬰 C? Dng d? th?, nh? ngi n y th? m閠 phen?",Stage_info[1].npc_name.."N誹 nay c? <color=yellow>5<color> i nh﹏ m? th? thu ph鬰 C? Dng d? th?,   s鴆 i ph?. Xin i m閠 l竧."},
	{Stage_info[1].npc_name.."R蕋 nhi襲 cao th? t譵 頲 B輈h Dao Thanh T﹎ Кn, nh璶g mu鑞 C? Dng Th? ngoan ngoan ph鬰 d飊g e r籲g ph秈 t鑞 c玭g s鴆. Ngi mu鑞 n  kh玭g?",Stage_info[1].npc_name.."S? ngi n C? Dng чng  y, khi kh竎 h穣 quay l筰!"},
}
Stage_info[1].log_in_dialog = {"Ta ph秈 d総 i 甶 thu ph鬰 C? Dng th?","Ta mu鑞 d蒼 i c鴘 C? Dng Th?",}
Stage_info[1].map ={{1100,1200},{1300,1400,1500}}								--开启的5个关卡对应的map_id 
--闯关条件
Stage_info[1].stage_background =  {	Stage_info[1].npc_name.."<color=yellow>C? Dng ng<color> nghe n c? <color=yellow>D? th?<color> tr蕁 th?. C? Dng th? tuy c? s鴆 m筺h phi thng, nh璶g c騨g ch? ? ng. T猲 ph秐  <color=yellow>Phi Thng Чo Nh﹏<color>l遪g d? hi觤 竎, ? mu鑞 l頸 d鬾g th? n祔 g﹜ h鋋 cho nh﹏ gian. C? Dng th? ph鬰 di H醓 luy謓 Kim n  tr? n猲 hung 竎, ta nh薾 l謓h s? ph? t筸 th阨 phong 蕁 trong M藅 ng, nh璶g l筰 b? thng n猲 ch璦 th? di謙 tr? qu竔 th?. Nh璶g nh蕋 nh ph秈 di謙 tr? n?...",
																Stage_info[1].npc_name.."<color=yellow>C? Dng Th?<color> trc  b? thu ph鬰, l骳 d蒼 v? C玭 L玭  thoi th鉷. Л頲 <color=green>Mai s? th骳<color> ch鱝 tr?. <color=green>Mai s? th骳<color> a ph莕 l韓 h醓 luy謓 kim n v祇 trong ngi linh th?, gi? l筰 C玭 L玭  h蕄 thu tinh hoa tr阨 t. Kh玭g  <color=yellow>C? Dng Th?<color> r琲 v祇 T醓 Y猽 Th竝, y猽 kh? trong th竝 c? th? khi課 linh th? b閏 ph竧 t輓h kh? hung d?, <color=yellow>C? Dng Th?<color> dng nh? 產ng ph秈 ch辵 s? 產u n t閠 c飊g, ch璦 s竧 thng m閠 ai  l蒼 tr鑞 v祇 trong ng n祔."
									}
Stage_info[1].stage_condition = {	Stage_info[1].npc_name.."C? Dng d? th? uy l鵦 v? song, c莕 <color=yellow>3 n 5 ngi c馻 c竎 m玭 ph竔 kh竎<color> h頿 l鵦 m韎 c? th? thu ph鬰. N誹  bi誸 r? g鑓 t輈h c馻 C? Dng d? th?, c? th? t譵 hi觰 c竎h thu ph鬰 n? qua <color=yellow>s? huynh Di謕 T? Thu<color> c馻 b鎛 ph竔, mang t輓 v藅 c馻 s? huynh <color=yellow>C玭 L玭 Tr蕁 Y猽 ph?<color> v? <color=yellow>Уo M閏 Ki誱<color> t韎, ta s? y猲 t﹎  ngi v祇 ng thu ph鬰 d? qu竔.",
															Stage_info[1].npc_name.."C? Dng Th? t輓h kh? ph竧 t竎, n誹 mu鑞 c鴘 n? c莕:\n  <color=green>1<color>. <color=yellow>чi trng t? i 3-5 ngi<color>, <color=red>t蕋 c? th祅h vi猲 <color> c莕 l祄 <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>\n  <color=green>2<color>. Tr猲 ngi i trng ph秈 c? <color=yellow>B輈h Dao Thanh T﹎ Кn<color>.\n  <color=green>3<color>. Trong i kh玭g 頲 c? ngi <color=yellow>v? c玭g l璾 ph竔 gi鑞g nhau<color>."}					--关卡的背景介绍
Stage_info[1].task_goods = {
	{	
		{2,0,704,1,"C玭 Lu﹏ tr蕁 y猽 ph?"},
		{2,0,759,1,"C玭 Lu﹏ Уo m閏 ki誱"},
	},
	{	
		{2,0,1031,1,"B輈h Dao Thanh T﹎ Кn"},
	}
}	--闯关需要物品
Stage_info[1].task_ID = {2032,17}													--闯关时对应的ID
Stage_info[1].in_coordinate = {1584,3223}											--进入对应坐标
Stage_info[1].out_coordinate = {512,2061,3414}										--传出的地图及坐标
Stage_info[1].cannot_log_reason = {
	{	Stage_info[1].npc_name.."C? Dng Th? uy l鵦 kinh ngi, s鴆 m閠 ngi kh玭g th? i ph?, c莕 ph秈 d蒼 theo <color=yellow>3-5 ngi luy謓 theo hng kh竎 nhau v? 頲 i trng d蒼 d総<color> h絥 n y!",
		Stage_info[1].npc_name.."C? Dng d? th? uy l鵦 ng s?, ta 頲 i s? b鎛 ph竔 d苙 d?, ? y phong t醓 ng huy謙, kh玭g cho ai n g莕, tr竛h l祄 b? thng ngi v? t閕. N誹 ngi kh玭g 甶 t譵 s? huynh <color=yellow>Di謕 T? Thu<color>, t譵 hi觰 c竎h thu ph鬰 d? qu竔, mang theo t輓 v藅 <color=yellow>Уo M閏 Ki誱<color> v? <color=yellow>Tr蕁 Y猽 ph?<color> thu ph鬰 C? Dng th? c馻 s? huynh r錳 t韎 th? xem th? n祇!",
		Stage_info[1].npc_name.."C? Dng Th? uy l鵦 v? song <color=yellow>n誹 ng i ch璦 bi誸 th鵦 l鵦 c馻 linh th?<color>, ngang nhi猲 x玭g v祇, e r籲g nguy hi觤 n t輓h m筺g, khuy猲 ngi mau mau r阨 kh醝.",
		Stage_info[1].npc_name.."C莕 ph秈 c? <color=yellow>ngi v? c玭g tinh th玭g c竎 m玭 ph竔 kh竎 nhau<color> hi謕 l鵦 h頿 t竎 m韎 c? th? quy ph鬰 C? Dng th?, n誹 kh玭g ngi ph秈 l祄 th? n祇?"
	},
	{	Stage_info[1].npc_name.."C? Dng Th? hi謓 r蕋 hung bao, ph秈 h鋚 s鴆 <color=yellow>3-5 ngi<color>. (Nh綾 nh?: ",
		Stage_info[1].npc_name.."C? Dng Th? b? k輈h th輈h dc l鵦 trong ngi, Mai s? th骳 c╪ d苙 c莕 d飊g <color=yellow>B輈h Dao Thanh T﹎ Кn<color> t? t? h鉧 gi秈 dc l鵦 trong ngi m韎 頲.",
		Stage_info[1].npc_name.."C竎 ngi ch璦 bi誸 r? lai l辌h c馻 C? Dng Th?, t鑤 nh蕋 kh玭g n猲 v祇 trong. (Nh綾 nh?: <color=yellow>Th祅h vi猲 trong i ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>)",
		Stage_info[1].npc_name.."C? Dng Th? r蕋 hung b筼, <color=yellow>ph秈 bi誸 v? c玭g c馻 c竎 m玭 ph竔 kh竎 nhau<color>, ng t﹎ h頿 s鴆 m韎 c? th? chi課 th緉g."
	},
	{	Npc_name_city.."Mu鑞 nh b筰 <color=yellow>C? Dng Th?<color> v韎 s鴆 l鵦 c竎 ngi e r籲g kh玭g , mau k猽 i trng d蒼 theo <color=yellow>3-5 ngi c蕄 85 tr? l猲<color> m韎 mong ch? ng? n鎖 t輓h hung b筼 c馻 <color=yellow>C? Dng Th?<color>.",
		Npc_name_city.."<color=yellow>C? Dng Th?<color> t輓h kh? b蕋 thng, nh璶g <color=green>Mai B蕋 Dung<color>  luy謓 ch? ra <color=yellow>B輈h Dao Thanh T﹎ Кn<color> c? th? gi秏 t輓h hung bao c馻 <color=yellow>C? Dng Th?<color>, n誹 c竎 ngi kh玭g c? <color=yellow>B輈h Dao Thanh T﹎ Кn<color> th? ng mi詎 cng. T筰 sao <color=yellow>C? Dng Th?<color> l筰 nh? v藋 ?? 礽! Ph秈 n <color=yellow>C? Dng чng<color> 甶襲 tra th玦.",
		Npc_name_city.."H譶h nh? c竎 ngi ch璦 甶 h誸 T﹜ v鵦, ch璦 t譵 hi觰 k? n琲 . Ta e 阯g n C? Dng чng c竎 ngi c遪 kh玭g bi誸, l祄 xong <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color> h絥 n y.",
		Npc_name_city.."Trong i c? ngi v? c玭g <color=yellow>l璾 ph竔 gi鑞g nhau<color>, kh玭g th? i ph? v韎 <color=yellow>C? Dng Th?<color>.",
	},
}		--无法进入关卡的原因对话
Stage_info[1].boss_chat = {			--boss喊话
	" th玦! N誹 kh玭g ngi s? g苝 ph秈 n鎖 kh? nh? ta?",
	"Nh鱪g sinh linh d筰 d閠, l祄 sao c? th? vt qua t? nhi猲!",
	" th玦! N誹 kh玭g b? nu鑤 ch鰊g b﹜ gi?!",
	"R阨 kh醝 y th玦 m鋓 ngi, sau n祔 ng bao gi? t ch﹏ n y n鱝!",
	" nhanh!... Ngi v鑞 kh玭g n猲 t韎 y!",
}
Stage_info[1].stage_start_msg ="Ngi ng鵤  v祇 C? Dng M藅 ng, C? Dng th? s? t豱h l筰 trong sau 1 ph髏, m鋓 ngi chu萵 b? t? th? s絥 s祅g ngh猲h chi課."
Stage_info[1].stage_start_talk = "Do m閠 s? tia s竛g c馻 kho竛g th筩h ph竧 ra, khi課 trong ng 竛h l猲 m祏  nh? m竨. Xung quanh hoang t祅  n竧, x竎 ngi ch蕋 ng, b蕋 lu薾 <color=yellow>Ngi o kho竛g th莕 b?<color> hay <color=yellow>Li Long H醓 H?<color> b猲 ngo礽 u th蕐 頲 v誸 t輈h . B鋘 ngi t譵 b秓 v藅 mu鑞 x玭g v祇 trong ng nh璶g h? kh玭g ng? r籲g <color=yellow>C? Dng Th?<color> b? <color=yellow>h醓 luy謓 kim n<color> d祔 v?, tr? n猲 hung 竎, <color=yellow>C? Dng Th?<color> nh藀 v祇 nh鱪g ai x﹎ ph筸. C祅g nhi襲 sinh v藅 trong ng c祅g thu h髏 nhi襲 <color=yellow>Huy誸 Ma Nh﹏<color>."
Stage_info[1].boss_crt_msg = " C? Dng Th? tr蕁 th? M藅 ng  hi謓 th﹏! Ph秈 ti猽 di謙 頲 n? trong 30 ph髏, n誹 kh玭g h祅h ng l莕 n祔 s? th蕋 b筰. "
Stage_info[1].stage_end_msg = "H祅h ng thu ph鬰 C? Dng Th? l莕 n祔  ho祅 th祅h, sau  s? a c竎 v? n b猲 ngo礽 M藅 ng. Xin ng n鉵g. "
Stage_info[1].stage_start_time_bar = "C? Dng Th? hi謓 th﹏ (m ngc)"
Stage_info[1].boss_crt_time_bar = "Thu ph鬰 C? Dng Th? (m ngc)"
Stage_info[1].stage_end_time_bar = "Khu v鵦 頲 d蒼 n, (m ngc)"
---------------------------------------------------华丽的分割线---------------------------------------
Stage_info[2].main_dialog = {Stage_info[2].npc_name.."To gan! ng l筰. Зy l? Ho祅g L╪g M藅 Чo, ngi l? kh玭g 頲 n g莕, n誹 kh玭g s? b? Tr蕁 M? Linh Th? tr鮪g ph箃 nghi猰!",
							Stage_info[2].npc_name.."To gan! B猲 trong y r蓎 c筸 b蓎, n誹 mu鑞 s鑞g h穣 mau ch鉵g r阨 kh醝!"	
							}
Stage_info[2].no_task_dialog = 	Stage_info[2].npc_name.."To gan! ng l筰. Зy l? Ho祅g L╪g M藅 Чo, ngi l? kh玭g 頲 n g莕, n誹 kh玭g s? nh薾 頲 h藆 qu? kh玭 lng. "					--无任务时候的对话
Stage_info[2].finish_task_dialog = Stage_info[2].npc_name.."Ai m ti猽 di謙 Tr蕁 M? Linh Th?! Nh﹏ l骳 ta ch璦 n鎖 gi薾, mau c髏 甶, n誹 kh玭g th莕 h玭 ng祅 n╩ ta y s? kh玭g bu玭g tha. "
Stage_info[2].stage_name = "Ho祅g L╪g M藅 o"											--stage名称
Stage_info[2].ground_sel_dialog = {
	{Stage_info[2].npc_name.."ng l筰! Ph輆 trc c? Tr蕁 M? Linh Th? canh gi?, cng quy誸 v祇 M藅 o ch? c? ch誸!",Stage_info[2].npc_name.."ng l筰! Ph輆 trc c? Tr蕁 M? Linh Th? canh gi?, c竎 阯g 甶 v祇 M藅 o  ng. "},
	{Stage_info[2].npc_name.."C? b秐 l躰h th? c? m? xem Tr蕁 M? Linh Th? c? tha ngi kh玭g!",Stage_info[2].npc_name.."C? quan chuy觧 ng, phong t醓 m藅 o."},
}
Stage_info[2].log_in_dialog = {"Ta ph秈 d蒼 ng i 甶 ti猽 di謙 Tr蕁 M? Th?. ","Ta ph秈 d蒼 ng i 甶 ti猽 di謙 Tr蕁 M? Th?. ",}
Stage_info[2].map = {{1101,1201},{1301,1401,1501}}									--开启的5个关卡对应的map_id
Stage_info[2].stage_background = {	Stage_info[2].npc_name.."N琲 y v鑞 d? long m筩h, xung quanh b? tr? theo h譶h c鰑 cung, tr猲 di 2 t莕g, c? Tr蕁 M? Linh Th? canh gi?, ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha!",
																Stage_info[2].npc_name.."N琲 y v鑞 d? long m筩h, xung quanh b? tr? theo h譶h c鰑 cung, tr猲 di 2 t莕g, c? Tr蕁 M? Linh Th? canh gi?, ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha!"
									}
Stage_info[2].stage_condition = {	Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸, ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! N誹 c? ai d蒼 theo <color=yellow>3-5 ngi<color> x玭g v祇 y v? ph? 4 huy謙 phong th駓, Tr蕁 M? Linh Th? s? tr鮪g tr? h?. Nh璶g ch髇g kh玭g gi誸 1,2 ngi x玭g v祇, ch璦 ph? 4 huy謙 phong th駓, <color=yellow>kh玭g gi誸 nh鱪g ngi c? v? c玭g l璾 ph竔 gi鑞g nhau<color>",
															Stage_info[2].npc_name.."Tr蕁 M? Linh Th? ch? t蕁 c玭g t? <color=yellow>3-5 ngi c? v? c玭g l璾 ph竔 kh竎 nhau<color>, c? quan m藅 o  m?, n誹 c? b秐 l躰h m? m藅 o  kh鉧, linh th? s? kh玭g tha."}					--闯关条件
Stage_info[2].task_goods = {
	{},
	{	
		{2,0,1032,1,"H錳 Long s竎h"}
	}
}												--闯关需要物品
Stage_info[2].task_ID = {2031,25}												--闯关时对应的ID
Stage_info[2].in_coordinate = {1599,3224}										--进入对应坐标
Stage_info[2].out_coordinate = {513,1591,3192}									--传出的地图及坐标
Stage_info[2].cannot_log_reason = {	--无法进入关卡的原因对话
	{	Stage_info[2].npc_name.."Tr蕁 M? Linh Th? kh玭g t蕁 c玭g 1,2 ngi, c遪 kh玭g mau r阨 kh醝! Nh璶g n誹 c? t? <color=yellow>3-5 ngi x玭g v祇<color>, linh th? s? kh玭g tha.",
		Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸! ",
		Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸! <color=yellow>Nh鱪g ai kh玭g bi誸 y l? m? c馻 ta m? v? t譶h x玭g v祇, ta s? tha t閕 ch誸<color>, c遪 kh玭g mau r阨 kh醝!",
		Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸! <color=yellow>(Nh綾 nh?: Trong i c? ngi c飊g m玭 ph竔, kh玭g 頲 v祇 Ho祅g L╪g M藅 o.<color>",
		},
	{	Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸! Tr蕁 M? Linh Th? ch? t蕁 c玭g <color=yellow>3 -5 ngi<color> ngang nhi猲 x玭g v祇. (Nh綾 nh?: ",
		Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸! (Nh綾 nh?: mu鑞 ph? c? quan b猲 trong, c莕 ph秈 d飊g <color=yellow>H錳 Long S竎h<color> c馻 k? cp m?)",
		Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸! Nh綾 nh?: <color=yellow>Th祅h vi猲 trong i c莕 ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>)",
		Stage_info[2].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸! (Nh綾 nh?: Th祅h vi猲 trong i <color=yellow>v? c玭g l璾 ph竔 kh玭g 頲 gi鑞g nhau<color>)",
		},
	{	Npc_name_city.."<color=yellow>Tr蕁 M? Th?<color> canh gi? m藅 o, mu鑞 i ph? <color=yellow>Tr蕁 M? Th?<color> c莕 i trng m阨 t? <color=yellow>3-5 ngi c蕄 85 tr? l猲<color>, n誹 kh玭g ch? c? ch誸 trong y.",
		Npc_name_city.."Qua 甶襲 tra <color=yellow>Ho祅g L╪g m藅 o<color> li猲 th玭g v韎 Ho祅g L╪g t莕g 1,2, nh璶g c? quan  b? ph?, mu鑞 m? ph秈 c? <color=yellow>H錳 Long S竎h<color>, c竎 ngi th? 甶 t譵 nh鱪g t猲 cp m? h醝 th?.",
		Npc_name_city.."H譶h nh? c竎 ngi ch璦 甶 h誸 T﹜ v鵦, ch璦 t譵 hi觰 k? n琲 . <color=yellow>Tr蕁 M? Th?<color> trong <color=yellow>Ho祅g L╪g m藅 o<color> kh玭g d? i ph?, c竎 ngi ho祅 th祅h <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color> h絥 n y.",
		Npc_name_city.."Trong i c? th祅h vi猲 v? c玭g l璾 ph竔 gi鑞g nhau, kh玭g th? i ph? <color=yellow>Tr蕁 M? Th?<color>.",
	},
}	
Stage_info[2].boss_chat = {
	"Ta y tr蕁 gi? n琲 y, ai d竚 l祄 c祅! ",
	"B鋘 ngi ngu mu閕 kia,  ta ti詎 c竎 ngi xu鑞g su鑙 v祅g! ",
	"Ph祄 nh鱪g ai kh玭g bi誸, ng bc v祇!. ",
	"Ta cho d? c? ch誸 c騨g tr蕁 gi? ? y!",
	"H錸 ph竎h c竎 ngi 產ng run s? trc ta! ",
}
Stage_info[2].stage_start_msg ="Nh鉳 ngi ng鵤 c竎 b筺  v祇 Ho祅g L╪g M藅 o, Tr蕁 M? Th? tr蕁 gi? M藅 o s? t豱h l筰 sau 1 ph髏 n鱝  truy 畊鎖 nh鱪g ngi v祇 m?, m鋓 ngi ph秈 lu玭 trong t? th? chi課 u!"
Stage_info[2].stage_start_talk = "<color=yellow>H錳 Long S竎h<color> qu? nhi猲 l? l頸 h筰. Tuy m藅 o th玭g v韎 t莕g tr猲 t莕g di, nh璶g <color=green>T莕 Th駓 Ho祅g<color> v蒼 kh玭g l? l?. <color=yellow>Tr蕁 M? Th?<color> l蒼 Ho祅g L╪g c遪 nhi襲 甶襲 huy襫 b?. Xem ra <color=yellow>Tr蕁 M? Th?<color> d? d祅g i ph? gi鑞g nh? m藅 o l祄 m? ho芻 nh鱪g k? cp m?. <color=yellow>Tr蕁 M? Th?<color> canh gi? l╪g m? tr鋘g a, v韎 t輓h c竎h c馻 <color=green>T莕 Th駓 Ho祅g<color> sao kh玭g l緋 t c? quan!? <color=yellow>Tr蕁 M? Th?<color> v? c? quan trong m? nh蕋 nh c? li猲 quan v韎 nhau."
Stage_info[2].boss_crt_msg = "Tr蕁 M? Th?  xu蕋 hi謓! Trong v遪g 30 ph髏 ph秈 ti猽 di謙 頲 n?, n誹 kh玭g h祅h ng v祇 L╪g m? l莕 n祔 s? th蕋 b筰. "
Stage_info[2].stage_end_msg = "L莕 thu ph鬰 Tr蕁 M? Th? n祔  k誸 th骳. Xin i gi﹜ l竧 s? d蒼 c竎 v? ra ngo礽 M藅 o. "
Stage_info[2].stage_start_time_bar = "Tr蕁 M? Th? xu蕋 hi謓 (m ngc)"
Stage_info[2].boss_crt_time_bar = "Цnh b筰 Tr蕁 M? Th? (m ngc)"
Stage_info[2].stage_end_time_bar = "Khu v鵦 頲 d蒼 n, (m ngc)"
---------------------------------------------------飘逸的分割线---------------------------------------
Stage_info[3].main_dialog = {Stage_info[3].npc_name.."N琲 ta y猲 ngh?, kh玭g 頲 x﹎ ph筸, ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha!",
							Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha!"	
							}
Stage_info[3].no_task_dialog = 	Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha!"
Stage_info[3].finish_task_dialog = Stage_info[3].npc_name.."Mau r阨 kh醝 y, s? ngi ch璦 t薾! N誹 c遪 quay l筰 l? t? t譵 阯g ch誸, kh玭g g苝 may nh? v藋 n鱝 u! "
Stage_info[3].stage_name = "Ho祅g L╪g m? th蕋"											--stage名称
Stage_info[3].ground_sel_dialog = {
	{Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha!",Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha!"},
	{Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 Qu? Tng Qu﹏ gi誸 kh玭g tha!",Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 ph秈 tr? gi?, c鯽 m藅 th蕋  ng, kh玭g ai c? th? m? ra!"},
}
Stage_info[3].log_in_dialog = {"Ta ph秈 d蒼 ng i 甶 ti猽 di謙 Qu? Tng u","Ta ph秈 d蒼 ng i 甶 ti猽 di謙 Qu? Tng u",}
Stage_info[3].map = {{1102,1202},{1302,1402,1502}}									--开启的5个关卡对应的map_id
Stage_info[3].stage_background = {Stage_info[3].npc_name.."N琲 y v鑞 d? long m筩h, c蕋 gi? nhi襲 ch﹗ b竨 qu? hi誱, v祅g b筩 nhi襲 v? s? k?! C? Tr蕁 m? tng qu﹏ canh gi?, Qu? Tng Qu﹏ nghi猰 ng苩 b秓 v?, canh gi? kho b竨.",
									Stage_info[3].npc_name.."N琲 y v鑞 d? long m筩h, c蕋 gi? nhi襲 ch﹗ b竨 qu? hi誱, v祅g b筩 nhi襲 v? s? k?! N誹 ai  ngang nhi猲 x﹎ ph筸, Qu? Tng Qu﹏ s? tr鮪g tr? h?."
									}
Stage_info[3].stage_condition = { 					--闯关条件
	Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! Nh璶g <color=yellow>Qu? Tng Qu﹏ kh鑞g gi誸 1,2 ngi x﹎ ph筸, kh玭g gi誸 nh鱪g ai c? v? c玭g l璾 ph竔 gi鑞g nhau<color>",
	Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! Qu? Tng Qu﹏ kh玭g gi誸 1,2 ngi x﹎ ph筸, c遪 kh玭g mau r阨 kh醝!"
}
Stage_info[3].task_goods = {
	{},
	{
		{2,0,1033,1,"To竔 Th筩h Ch蕁"}
	}
}												--闯关需要物品
Stage_info[3].task_ID = {2031,27}												--闯关时对应的ID
Stage_info[3].in_coordinate = {1590,3230}										--进入对应坐标
Stage_info[3].out_coordinate = {514,1728,2869}									--传出的地图及坐标
Stage_info[3].cannot_log_reason = {
	{
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! Qu? Tng Qu﹏ kh玭g t蕁 c玭g 1,2 ngi. <color=yellow>n誹 d竚 d蒼 theo t? 3-5 ngi<color>, Qu? Tng Qu﹏ s? kh玭g tha.",
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 y gi誸 総 kh玭g tha! Kh玭 h錸 mau r阨 kh醝 y! ",
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! Nh鱪g ai kh玭g bi誸, v? t譶h x﹎ ph筸 <color=yellow>nhanh ch鉵g r阨 kh醝 n琲 y.<color>",
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 y gi誸 総 kh玭g tha! Kh玭 h錸 mau r阨 kh醝 y! <color=yellow>(Nh綾 nh?: Trong i c? ngi c飊g chuy猲 m玭 kh玭g 頲 v祇 Ho祅g L╪g M藅 Чo)<color>",
	},
	{
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! Qu? Tng Qu﹏ ch? i ph? t? <color=yellow>3-5 ngi<color> (Nh綾 nh?: ",
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! Nh綾 nh?: Tr猲 ngi i trng ph秈 c? <color=yellow>To竔 th筩h ch蕁<color>)",
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! (Nh綾 nh?: <color=yellow>Th祅h vi猲 trong i c莕 ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>)",
		Stage_info[3].npc_name.."Ngang nhi猲 x玭g v祇 総 gi誸 kh玭g tha! (Nh綾 nh?: Th祅h vi猲 trong i <color=yellow>v? c玭g l璾 ph竔 kh玭g 頲 gi鑞g nhau<color>)",
	},
	{	Npc_name_city.."<color=yellow>Qu? Tng Qu﹏<color> l骳 c遪 s鑞g theo ph? T莕 Th駓 Ho祅g nam chinh b綾 ph箃, nh蕋 th鑞g thi猲 h?, sau khi T莕 Th駓 Ho祅g ch誸 c騨g ch玭 theo, c竎 ngi ngang nhi猲 x玭g v祇, n誹 trong i kh玭g c? t? <color=yellow>3-5 ngi c蕄 85 tr? l猲<color> th? sao nh l筰 qu? vng.",
		Npc_name_city.."Th筩h m玭 c馻 <color=yellow>Ho祅g L╪g m藅 th蕋<color>  ng, <color=yellow>To竔 th筩h ch蕁<color> c? th? ph? h駓 m閠 l鑙 nh? 甶 v祇, c竎 ngi mu鑞 v祇 b猲 trong ph秈 mang theo <color=yellow>To竔 th筩h ch蕁<color>.",
		Npc_name_city.."H譶h nh? c竎 ngi ch璦 甶 h誸 T﹜ v鵦, ch璦 t譵 hi觰 k? n琲 . Uy l鵦 c馻 <color=yellow>Qu? Tng Qu﹏<color> e r籲g c竎 ngi ch璦 th蕐, mau ho祅 th祅h <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color> h絥 n y.",
		Npc_name_city.."Trong i c? th祅h vi猲 <color=yellow>v? c玭g l璾 ph竔 gi鑞g nhau<color>, nh? v藋 s? m蕋 甶 c? h閕 i ph? v韎 <color=yellow>Qu? Tng Qu﹏<color>.",
	}
}	--无法进入关卡的原因对话
Stage_info[3].boss_chat = {
	"Kho b竨 vua ta, ai d竚 o tr閙?",
	"Ngi tham lam v? tri u ph秈 ti猽 tan trc b秐 tng l躰h! ",
	"d竚 qu蕐 r莥 n琲 ta y猲 ngh?, gi誸 kh玭g th?! ",
	"в ta ti詎 c竎 ngi xu鑞g ﹎ t祇 a ph?! ",
	"Ta s? tr鮪g ph箃 nh鱪g k? d竚 v祇 m?! ",
}
Stage_info[3].stage_start_msg ="Nh鉳 ngi ng鵤 c竎 ngi  v祇 Ho祅g L╪g M藅 Чo, Qu? Tng u s? t豱h l筰 trong v遪g 1 ph髏 n鱝  truy s竧 nh鱪g ai x玭g v祇 m?, c竎 ngi ph秈 lu玭 trong tr筺g th竔 chi課 u! "
Stage_info[3].stage_start_talk = "Sau khi d飊g <color=yellow>To竔 th筩h ch蕁<color>, trc khi v祇 m藅 th蕋, kh玭g ngh? n琲 y c? c筸 b蓎, T莕 Th駓 Ho祅g c騨g cho r籲g v韎 s鴆 m筺h c馻 <color=yellow>Qu? Tng Qu﹏<color>   b秓 v? l╪g m?. Tuy m藅 th蕋 kh玭g t c? quan, nh璶g  x﹎ ph筸 v祇 m? T莕 Th駓 Ho祅g, theo quy t綾 c馻 k? cp m? ph秈 ? <color=yellow>g鉩 ng nam<color> t m閠 c﹜ <color=yellow>n c莥<color>. Nh璶g v韎 uy l鵦 c馻 <color=yellow>Qu? Tng Qu﹏<color> e r籲g l祅h 輙 d? nhi襲."
Stage_info[3].boss_crt_msg = "Qu? Tng u  xu蕋 hi謓! Trong v遪g 30 ph髏 ph秈 ti猽 di謙 頲 n?, n誹 kh玭g h祅h ng l莕 n祔 s? th蕋 b筰."
Stage_info[3].stage_end_msg = "L莕 thu ph鬰 Qu? Tng u  ho祅 th祅h. Xin i gi﹜ l竧 s? d蒼 c竎 v? ra b猲 ngo礽 m藅 o. "
Stage_info[3].stage_start_time_bar = "Qu? Tng u xu蕋 hi謓 (m ngc)"
Stage_info[3].boss_crt_time_bar = "Цnh b筰 Qu? Tng u m ngc"
Stage_info[3].stage_end_time_bar = "Khu v鵦 頲 d蒼 n, (m ngc)"
---------------------------------------------------潇洒的分割线---------------------------------------
Stage_info[4].main_dialog = {	
	Stage_info[4].npc_name.."Ngi l? ai? Dc Vng ng l? l穘h a c馻 Dc Vng ch? nh﹏ ta, ngi l? kh玭g 頲 bc v祇. Luy謓 n ng l? c蕀 a, ai mu鑞 v祇 ph秈 bc qua x竎 cu? ta! ",
	Stage_info[4].npc_name.."Ngi l? ai? Dc Vng ch? nh﹏ ta g鋓 ta l? Dc Nh﹏ th玭g minh, canh gi? Luy謓 n ng! Ch? nh﹏ ta s緋 luy謓 th祅h 產o thng b蕋 nh藀, sao ngi c? th? nh l筰."	
							}
Stage_info[4].no_task_dialog = 	Stage_info[4].npc_name.."Ngi l? ai? Dc Vng ng l? l穘h a c馻 Dc Vng ch? nh﹏ ta, kh玭g 頲 bc v祇, mau quay v?, ch? nh﹏ ta s? kh玭g truy c鴘. L骳 ra kh玭g 頲 ng v祇 b蕋 c? th秓 dc n祇 trong ng! "
Stage_info[4].finish_task_dialog = Stage_info[4].npc_name.."Ta nh薾 ra ngi r錳, n y l祄 g?? Mau c髏 甶, ng h遪g l鮝 頲 ta! "
Stage_info[4].stage_name = "Luy謓 n ng"											--stage名称
Stage_info[4].ground_sel_dialog = {
	{Stage_info[4].npc_name.."Dc Vng ng l? l穘h a c馻 Dc Vng ch? nh﹏ ta, Luy謓 n ng l? c蕀 a, mau c髏 甶, n誹 kh玭g h藆 qu? kh玭 lng. ",Stage_info[4].npc_name.."Dc Vng ng l? l穘h a c馻 Dc Vng ch? nh﹏ ta, Luy謓 n ng l? c蕀 a, ch? nh﹏ ta  tr? v? r錳, kh玭g 頲 bc v祇 Luy謓 n ng. Ngi l? ai? D竚 gi? m筼 l? ch? ta!",},
	{Stage_info[4].npc_name.."Luy謓 n ng v鑞 l? c蕀 a, ta l? Dc Nh﹏ th玭g minh, th筩h m玭 n祔 ta y kh玭g l猲, ngi c? gi醝 th? h穣 y cho ta xem!",Stage_info[4].npc_name.."Luy謓 n ng v鑞 l? c蕀 a, ta nh薾 ra ngi, ng h遪g v祇 trong."},
}
Stage_info[4].log_in_dialog = {"Ta mu鑞 d蒼 theo ng i v祇 Luy謓 n ng. ","Ta mu鑞 d蒼 theo ng i v祇 Luy謓 n ng. "}
Stage_info[4].map = {{1103,1203},{1303,1403,1503}}									--开启的5个关卡对应的map_id
Stage_info[4].stage_background = {Stage_info[4].npc_name.."Dc Vng ch? nh﹏ ta l? ngi r蕋 th玭g minh, trong Dc Vng ng c? mu玭 v祅 k? hoa d? th秓. Luy謓 n ng l? c蕀 a, b蕋 c? ai c騨g kh玭g 頲, ng h遪g gi? m筼 ch? nh﹏ qua m苩 ta!. ",
									Stage_info[4].npc_name.."Trong Dc Vng ng ch蕋 y dc li謚, hoa c? l? tr錸g kh緋 n琲, l? n琲 th莕 ti猲 d祅h t苙g cho Dc Vng. Kh玭g bi誸 ngi n祇 d竚 h駓 m閠 n鯽 s? hoa c? trong ng, may ch? nh﹏ l衝 gi蕌 甶 Dc Nh﹏ Th秓,  sau n祔 d飊g n. Ta ph鬾g m謓h canh gi? n琲 y, ch? c? ta m韎 m? 頲 c竛h c鯽 n祔."
									}
Stage_info[4].stage_condition ={ 						--闯关条件
	Stage_info[4].npc_name.."Dc Vng ch? nh﹏ ta l? ngi anh minh nh蕋, Dc Vng ng v? Luy謓 n ng l? c蕀 a c馻 ngi, ta ph鬾g m謓h tr蕁 gi? ? y, kh玭g d? d祅g g? b? qua m苩 u! Cho n猲 <color=yellow>Ngi d蒼 3-5 ngi n l祄 lo筺<color>, Dc Vng ch? nh﹏ ta s? kh玭g tha! <color=yellow>Kh玭g bi誸 th? kh玭g c? t閕<color>, mau 甶 trc khi ta i ?!",
	Stage_info[4].npc_name.."\n1. чi trng d蒼 theo <color=yellow>3-5 ngi<color>, <color=red>t蕋 c? th祅h vi猲<color> u ph秈 <color=yellow>ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>).\n2. чi trng mang theo <color=yellow>T輈h Dng Tinh Hoa<color>, <color=yellow>T輈h Dng Tinh Hoa<color> th藅 l? kh駈g khi誴...\n3. Trong i kh玭g 頲 c? <color=yellow>ngi v? c玭g l璾 ph竔 gi鑞g nhau<color>."
}
Stage_info[4].task_goods = {						--闯关需要物品
	{
		{2,0,760,1,"Dung m筼 Dc Vng"}
	},
	{
		{2,0,1034,1,"T輈h Dng Tinh Hoa"}
	}
}
Stage_info[4].task_ID = {2031,47}												--闯关时对应的ID
Stage_info[4].in_coordinate = {1599,3218}										--进入对应坐标
Stage_info[4].out_coordinate = {510,1573,2863}									--传出的地图及坐标
Stage_info[4].cannot_log_reason = {
	{
		Stage_info[4].npc_name.."Dc Vng ng l? l穘h a c馻 Dc Vng ch? nh﹏ ta, Luy謓 n ng l? c蕀 a, kh玭g 頲 v祇! <color=yellow>N誹 ngi d蒼 3-5 ngi n l祄 lo筺<color>, Dc Vng ch? nh﹏ ta s? ch th﹏ ra tay.",
		Stage_info[4].npc_name.."Dc Vng ng l? l穘h a c馻 Dc Vng ch? nh﹏ ta, Luy謓 n ng ch? c? ch? nh﹏ ta m韎 頲 v祇, <color=yellow>Ngi kh玭g ph秈 Dc Vng<color>, d竚 g箃 ta? <color=yellow>(Nh綾 nh?: c? th? gi? d筺g Dc Vng  qua)<color>",
		Stage_info[4].npc_name.."Luy謓 n ng v鑞 l? c蕀 a, ch? nh﹏ kh玭g tr竎h <color=yellow>nh鱪g ai v? t譶h x﹎ ph筸<color>, tha cho c竎 ngi kh玭g bi誸 y l? n琲 ? c馻 Dc Vng, c遪 kh玭g mau r阨 kh醝!",
		Stage_info[4].npc_name.."Luy謓 n ng l? c蕀 a, c竎 ngi d竚 n qu蕐 nhi評? <color=yellow>C? ngi c飊g v? c玭g l璾 ph竔<color>, c竎 ng璷i kh玭g ng  Dc Vng ch? nh﹏ ta ra tay!",
	},
	{
		Stage_info[4].npc_name.."Ta 頲 ch? nh﹏ cho canh gi? Luy謓 n ng, kh玭g c? <color=yellow>3-5 ngi<color> th? ng h遪g v祇 trong. (Nh綾 nh?: ",
		Stage_info[4].npc_name.."H譶h nh? c竎 ngi kh玭g bi誸 uy l鵦 c馻 Dc Nh﹏. (Nh綾 nh?: Tr猲 ngi i trng c莕 ph秈 mang theo <color=yellow>T輈h Dng Tinh Hoa<color>)",
		Stage_info[4].npc_name.."Luy謓 n ng v鑞 l? c蕀 a, b鋘 c竎 ngi kh玭g bi誸 sao. (Nh綾 nh?: <color=yellow>Th祅h vi猲 trong i c莕 ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>)",
		Stage_info[4].npc_name.."Trong i c竎 ngi c? ngi v? c玭g l璾 ph竔 gi鑞g nhau, ng h遪g g箃 ta. (Nh綾 nh?: Th祅h vi猲 trong i <color=yellow>v? c玭g l璾 ph竔 kh玭g 頲 gi鑞g nhau<color>)",
	},
	{	Npc_name_city.."Ta 甶襲 tra 頲 <color=green>Dc Vng<color> m韎 ch? ra nhi襲 <color=yellow>Dc Nh﹏<color> d飊g  b秓 v? 玭g ta, kh? c? th? ti誴 c薾, n誹 i trng m阨 頲 t? <color=yellow>3-5 ngi c蕄 85 tr? l猲<color> m韎 c? hy v鋘g nh th緉g.",
		Npc_name_city.."Dc Nh﹏ s? nh蕋 l? r? c﹜ c馻 v飊g sa m筩, t? r? c﹜ l蕐 ra <color=yellow>T輈h Dng Tinh Hoa<color>, ch? c莕 <color=yellow>Dc Nh﹏ Th秓<color> ch筸 ph秈 l? ti猽 tan, nh? v藋 m蕐 <color=yellow>Dc Nh﹏<color> sao tr竛h kh醝 c竔 ch誸, c竎 ngi c? kh玭g?",
		Npc_name_city.."H譶h nh? c竎 ngi ch璦 甶 h誸 T﹜ v鵦, ch璦 t譵 hi觰 k? n琲 . Kh玭g n緈 r? t譶h h譶h trong ng, c騨g kh玭g bi誸 nhc 甶觤 c馻 Dc Nh﹏ Th秓, ngang nhi猲 x玭g v祇 ch? c? t譵 c竔 ch誸, c竎 ngi ho祅 th祅h <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color> h絥 n y.",
		Npc_name_city.."Trong i c竎 ngi c? ngi <color=yellow>v? c玭g l璾 ph竔 gi鑞g nhau<color>, sao c? th? i ph? v韎 b鋘 <color=yellow>Dc Nh﹏<color>?",
	},
}		--无法进入关卡的原因对话
Stage_info[4].boss_chat = {
	"To gan, d竚 n l祄 c祅 ? Luy謓 n ng, ta s? cho c竎 ngi c? 甶 m? kh玭g c? v?!",
	"Kh? 產u, th? h薾, sinh l穙 b謓h t?, thi猲 h? ch髇g sinh kh玭g ch鑞g l筰 頲.",
	"дn y r錳, ta s? thay i x竎 th辴 y誹 畊鑙 c馻 c竎 ngi!",
	"ьi ta bi課 c竎 ngi th祅h Dc Nh﹏, s鑞g d? ch誸 d?.",
	"L﹗ r錳 kh玭g th蕐 nhi襲 ngi s鑞g nh? th? n祔, ta s? gi秈 tho竧 cho c竎 ngi!",
}
Stage_info[4].stage_start_msg ="Ngi ng鵤 c竎 ngi  v祇 Luy謓 n ng, m閠 ph髏 n鱝 Dc Vng s? xu蕋 hi謓  b総 c竎 ngi ch? th祅h dc nh﹏, "
Stage_info[4].stage_start_talk = "Dc Nh﹏ canh gi? qu? nhi猲 hi謚 qu?. Luy謓 n ng c祅g l骳 c祅g nguy hi觤, ch? l? th猰 v礽 c竔 l? luy謓 n. M飅 c馻 than v? th秓 dc tr閚 l蒼, ng鰅 v祇 g﹜ kh? ch辵. Kh玭g bi誸 <color=green>Dc Vng<color>  nghi猲 c鴘 ra chi猽 g? m韎, <color=yellow>Dc Nh﹏ Th秓  l頸 h筰, nay Dc Nh﹏ c遪 l頸 h筰 h琻<color>, <color=green>Dc Vng<color> c騨g ch璦 v鮝 l遪g. Xem ra <color=green>Dc Vng<color> c遪 tr錸g th猰 nhi襲 Dc Nh﹏ Th秓."
Stage_info[4].boss_crt_msg = "Dc Vng c馻 Luy謓 n ng  xu蕋 hi謓! Ph秈 ti猽 di謙 頲 h緉 trong v遪g 30 ph髏!"
Stage_info[4].stage_end_msg = "Thu ph鬰 Dc Vng  ho祅 th祅h. Xin i gi﹜ l竧 s? d蒼 c竎 v? n b猲 ngo礽 Luy謓 n ng."
Stage_info[4].stage_start_time_bar = "Dc Vng xu蕋 hi謓 (m ngc)"
Stage_info[4].boss_crt_time_bar = "Цnh b筰 Dc Vng m ngc"
Stage_info[4].stage_end_time_bar = "Khu v鵦 頲 d蒼 n, (m ngc)"
---------------------------------------------------可怜的分割线---------------------------------------
Stage_info[5].main_dialog = {	
	Stage_info[5].npc_name.."Ng? h祅h tr薾 v鑞 l? c? m竬 trinh s竧, Ng? H祅h S? m nh薾 nhi謒 v? c bi謙, chuy猲 truy s竧 nh鱪g k? t筼 ph秐!",
	Stage_info[5].npc_name.."N琲 y thu閏 Nh蕋 Ph萴 Л阯g, ph輆 trc  b? tr? Ng? H祅h Tr薾, c竎 ngi c遪 kh玭g nhanh ch鉵g r阨 kh醝!"	
}
Stage_info[5].no_task_dialog = 	Stage_info[5].npc_name.."Ng? H祅h Gi?, Nh藅 Kim M閏 Th駓 H醓 Th?; Ng? h祅h tr薾 gi? l? tr薾 Kim M閏 Th駓 H醓 Th?. Vi謈 kh玭g li猲 quan m譶h, ng xem v祇."
Stage_info[5].finish_task_dialog = Stage_info[5].npc_name.."B筺  vt qua Ng? h祅h tr薾? Hay l筰 ch蕄 nh薾 luy謓 th鴆? Kh玭g th? 頲, trong th阨 gian ng緉 l祄 sao luy謓 nhi襲 l莕? N誹 gi髉 V? V?  ch蕄 nh薾 luy謓 th鴆 th? c? th?."
Stage_info[5].stage_name = "Ng? h祅h tr薾"												--stage名称
Stage_info[5].ground_sel_dialog = {
	{Stage_info[5].npc_name.."Ng? h祅h tr薾 do nh鱪g ngi ch鴆 V? V? tr? l猲 cung c蕄 c竎 lo筰 luy謓 th鴆, m鏸 luy謓 th鴆 u l蕐 tr薾 ph竝 m筺h nh蕋  i ph?, kh玭g  ? t韎 ai! Ngi ph秈 c萵 th薾.",Stage_info[5].npc_name.."Ng? h祅h tr薾  b総 u, tr薾 a  khai h醓. ng tr竎h ta kh玭g nh綾 nh? c竎 ngi!"},
	{Stage_info[5].npc_name.."Ng? H祅h Tr薾  b祔 b?, ch辵 ch誸 甶!",Stage_info[5].npc_name.."Ng? H祅h Tr薾  b祔 b?, nh璶g v蒼 c? ngi c遪 c鴑g u h琻 ngi, ch辵 ch誸 甶!"},
}
Stage_info[5].log_in_dialog = {"Ta mu鑞 d蒼 i x玭g v祇 Ng? h祅h tr薾","Ta mu鑞 d蒼 i x玭g v祇 Ng? h祅h tr薾",}
Stage_info[5].map = {{1104,1204},{1304,1404,1504}}									--开启的5个关卡对应的map_id
Stage_info[5].stage_background = {
	Stage_info[5].npc_name.."Ng? H祅h S? v鑞 l? c v? c馻 b鎛 阯g, chuy猲 theo d鈏 nh鱪g ai c? h祅h vi x蕌, Ng? H祅h Tr薾 chuy猲 truy s竧 nh鱪g k? t筼 ph秐. B譶h thng c騨g c? th? d飊g l祄 n琲 luy謓 binh. N誹 mu鑞 v祇 tr薾 ph秈 mang theo Nh蕋 Ph萴 Л阯g L謓h m韎 頲.",
	Stage_info[5].npc_name.."Ng? H祅h S? v鑞 l? c v? c馻 b鎛 阯g, Ng? H祅h Tr薾 chuy猲 truy s竧 ph秐 . D? c? ch箉 n ch﹏ tr阨 g鉩 b? c騨g kh? tho竧 kh醝 s? truy s竧. C竎 h? qu? nhi猲 ch竛 s鑞g, d竚 ngang nhi猲 x﹎ ph筸."
}
Stage_info[5].stage_condition ={					--闯关条件
	Stage_info[5].npc_name.."Ng? H祅h Tr薾 v鑞 l? c? m竬 trinh s竧, Ng? H祅h S? m nh薾 tr竎h nhi謒 c v?, ai c騨g v? ngh? cao cng. Mu鑞 th? v祇 tr薾, ch鴆 v? 輙 nh蕋 ph秈 b籲g V? V?, <color=yellow>c? Nh蕋 Ph萴 Л阯g l謓h<color>. C遪 kh玭g <color=yellow>tri謚 t藀 s鴆 m筺h 3-5 ngi<color> m韎 c? th? v祇 trong. N誹 trong nh鉳 c? ngi <color=yellow>kh玭g bi誸 Ng? H祅h Tr薾, v? c玭g l璾 ph竔 gi鑞g nhau th? xin m阨 v?!<color>",
	Stage_info[5].npc_name.."N琲 y thu閏 Nh蕋 Ph萴 Л阯g, mu鑞 g苝 Ng? H祅h S?, c莕 ph秈: \n1. чi trng d蒼 theo <color=yellow>3-5 ngi<color>, v? <color=red>t蕋 c? th祅h vi猲<color> u ph秈 ho祅 th祅h <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>).\n2. чi trng mang theo <color=yellow>Ng? H祅h K? Phi猲<color>, n誹 kh玭g Ng? H祅h S? kh玭g ch辵 ti誴 ki課.\n3. Trong i <color=yellow>kh玭g 頲 c? ngi v? c玭g l璾 ph竔 gi鑞g nhau<color>."
}
Stage_info[5].task_goods = {						--闯关需要物品
	{
		{2,0,755,1,"Nh蕋 Ph萴 Th竎 B箃 L謓h"}
	},
	{
		{2,0,1035,1,"Ng? H祅h K? Phi猲"}
	}
}
Stage_info[5].task_ID = {2031,58}												--闯关时对应的ID
Stage_info[5].in_coordinate = {1603,3228}										--进入对应坐标
Stage_info[5].out_coordinate = {506,1318,2720}									--传出的地图及坐标
Stage_info[5].cannot_log_reason = {			--无法进入关卡的原因对话
	{	
		Stage_info[5].npc_name.."V韎 s鴆 c馻 ngi Ng? H祅h Tr薾 S? kh玭g cho th? luy謓 u. <color=yellow>C莕 d蒼 theo 3-5 ngi<color> m韎 c? th? i ph? v韎 Ng? H祅h S?.",
		Stage_info[5].npc_name.."N誹 mu鑞 v祇 tr薾 tu luy謓, c蕄 tr猲 s? cho b筺 <color=yellow>Nh蕋 Ph萴 Л阯g L謓h<color>, d飊g  v祇 trong tr薾.",
		Stage_info[5].npc_name.."C竎 ngi <color=yellow>ch璦 th蕌 hi觰 Ng? H祅h Tr薾<color>, kh玭g n猲 t飝 ti謓 x玭g v祇, tr竛h mang h鋋 v祇 th﹏.",
		Stage_info[5].npc_name.."Ngi mu鑞 th? Ng? h祅h tr薾 <color=yellow>kh玭g 頲 c? ngi tr飊g v? c玭g l璾 ph竔<color>, n誹 kh玭g Ng? H祅h S? s? kh玭g cho v祇!",
	},
	{
		Stage_info[5].npc_name.."Kh玭g n猲 xem thng Ng? H祅h Tr薾, n誹 c竎 h?  c? Ng? H祅h K? Phi猲, th? h穣 d蒼 theo <color=yellow>3-5 ngi<color> (Nh綾 nh?: ",
		Stage_info[5].npc_name.."N誹 mu鑞 hy sinh c騨g kh玭g n猲 ch鋘 l骳 n祔! (Nh綾 nh?: Tr猲 ngi i trng ph秈 c? <color=yellow>Ng? H祅h K? Phi猲<color>)",
		Stage_info[5].npc_name.."H譶h nh? ngi ch璦 nghe danh Ng? H祅h Tr薾, mau v? 甶! (Nh綾 nh?: <color=yellow>Th祅h vi猲 trong i c莕 ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>)",
		Stage_info[5].npc_name.."H譶h nh? c竎 ngi c? ngi v? c玭g l璾 ph竔 gi鑞g nhau. (Nh綾 nh?: Th祅h vi猲 trong i <color=yellow>v? c玭g l璾 ph竔 kh玭g 頲 gi鑞g nhau<color>)",
	},
	{	Npc_name_city.."<color=green>Ng? H祅h S?<color> l頸 d鬾g o l? sinh kh綾 c馻 Ng? H祅h Tr薾 bi課 h鉧, n誹 kh玭g ch韕 th阨 c? h祅h ng ngay th? kh? c玭g ph?, v? v藋 i trng ph秈 m阨  <color=yellow>3-5 ngi c蕄 85 tr? l猲<color> h頿 s鴆 m韎 c? hy v鋘g.",
		Npc_name_city.."<color=yellow>Ng? H祅h Tr薾<color> 頲 Nh蕋 Ph萴 Л阯g d飊g l祄 n琲 hu蕁 luy謓 s竧 th?, kh玭g th? t飝 ti謓 v祇 trong, c莕 ph秈 mang theo <color=yellow>Ng? H祅h K? Phi猲<color>.",
		Npc_name_city.."H譶h nh? c竎 ngi ch璦 甶 h誸 T﹜ v鵦, ch璦 t譵 hi觰 k? n琲 . E r籲g c竎 ngi ch璦 bi誸 c竎h ph? Ng? H祅h Tr薾, hy sinh v? 輈h l祄 chi, mau ho祅 th祅h <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color> h絥 n y.",
		Npc_name_city.."<color=yellow>Ng? H祅h Tr薾<color> n鉯 l猲 s鴆 m筺h t藀 th?, c竎 ngi c? ngi v? c玭g <color=yellow>l璾 ph竔 gi鑞g nhau<color>, kh玭g th? v祇 trong.",
	},
}
Stage_info[5].boss_chat = {
	"C竎 ngi mu鑞 ch辵 ch誸 thay h緉?",
	"Cho ngi bi誸 th? n祇 l? tr薾 ph竝 m筺h nh蕋!",
	"H藆 qu? xem thng Ng? H祅h Tr薾",
	"N鏸 s? h穒 產ng bao tr飉 l猲 c竎 ngi!!",
	"Ch辵 ch誸 thay cho Th竎 B箃 Ho籲g, c騨g ch? l? lao v祇 ch? ch誸 m? th玦!",
}
Stage_info[5].stage_start_msg ="Ngi ng鵤 c竎 ngi  v祇 Ng? h祅h tr薾, Ng? V? Tr薾 S? s? xu蕋 hi謓 m閠 ph髏 n鱝, c竎 ngi ph秈 chu萵 b? tinh th莕  ph? tr薾! "
Stage_info[5].stage_start_talk = "<color=yellow>Ng? H祅h Tr薾<color> d鵤 theo tng sinh tng kh綾 c馻 ng? h祅h. M鏸 m閠 <color=green>Ng? H祅h S?<color> u c? th? mn s? tng sinh tng kh綾  ph竧 huy m閠 s鴆 m筺h th莕 b?, n誹 ph鑙 h頿 th猰 Ng? H祅h Tr薾 th? s鴆 m筺h kinh ngi. Mu鑞 ph? Ng? H祅h S?, Ng? H祅h Tr薾 l? m蕌 ch鑤. Ng? h祅h kh玭g ch? theo tng sinh tng kh綾, <color=green>Ng? H祅h S?<color> c遪 ph鑙 h頿 phng v? b猲 trong c馻 Ng? H祅h Tr薾, n誹 n緈 頲 s? bi課 i th? may ra c? c? h閕 s鑞g s鉻. Ghi nh韁n<color=red>Sinh<color>: <color=yellow>Kim sinh Th駓, Th駓 sinh M閏, M閏 sinh H醓, H醓 sinh Th?, Th? sinh Kim<color>\n<color=red>Kh綾<color>: <color=yellow>Kim kh綾 M閏, M閏 kh綾 Th?, Th? kh綾 Th駓, Th駓 kh綾 H醓, H醓 kh綾 Kim<color>"
Stage_info[5].boss_crt_msg = "Ng? h祅h tr薾 s?  xu蕋 hi謓 v? b? tr薾 Ng? H祅h! Trong v遪g 30 ph髏 ph秈 ti猽 di謙 h緉, n誹 kh玭g s? th蕋 b筰! "
Stage_info[5].stage_end_msg = "Vt tr薾  ho祅 th祅h. Xin i gi﹜ l竧 s? d蒼 c竎 v? n b猲 ngo礽 Ng? h祅h tr薾"
Stage_info[5].stage_start_time_bar = "Ng? H祅h S? xu蕋 hi謓 (m ngc)"
Stage_info[5].boss_crt_time_bar = "Цnh b筰 Ng? H祅h S? m ngc"
Stage_info[5].stage_end_time_bar = "Khu v鵦 頲 d蒼 n, (m ngc)"
---~~~~~~~~~~~~~~~~~~~~~朋克的分割线~~~~~~~~~~~~~~~~~~~~~~~
Stage_info[6].main_dialog = {
	Stage_info[6].npc_name.."Cu鑙 Sa m筩 kh? ph﹏ bi謙 頲 ng祔 hay m, nguy hi觤 t? b?, c? Hoan Tng m? ho芻 l遪g ngi. Ngi mu鑞 n Cu鑙 Sa m筩, c遪 ta kh玭g mu鑞. Nh璶g n誹 c竎 ngi c? b秓 v藅 t苙g, ta s? ngh? l筰.",
	Stage_info[6].npc_name.."G莕 y sa m筩 n鎖 phong ba b穙 t竝, kh玭g th? v祇 trong. C竎 h? mu鑞 n  ?? Nh璶g b穙 c竧  th鎖 m蕋 phng hng, ta c騨g kh玭g th? n ."	
	}
Stage_info[6].no_task_dialog = 	Stage_info[6].npc_name.."Sa m筩 r閚g l韓, nguy hi觤 tr飊g tr飊g, c? Hoan Tng m? ho芻 l遪g ngi. C竎 ngi 甶 甶, ng n qu蕐 nhi評."
Stage_info[6].finish_task_dialog = Stage_info[6].npc_name..": S? hoang v緉g c馻 Cu鑙 Sa m筩 ngi c騨g hi觰, s? ng s? c馻 秓 秐h Sa M筩, ngi c騨g l穘h gi竜 qua, kh玭g c? b秓 t祅g , l筰 c? k? ch m筺h, n l祄 g?? Ta kh玭g th? d蒼 ngi 甶 頲."
Stage_info[6].stage_name = "Cu鑙 Sa m筩"												--stage名称
Stage_info[6].ground_sel_dialog = {
	{Stage_info[6].npc_name.."N誹 ta d蒼 ngi n Cu鑙 Sa m筩, ph秈 t苙g ta b秓 v藅 c? gi? tng 琻g n誹 kh玭g mi詎 b祅. Ngi c? b秓 v藅 kh玭g?",Stage_info[6].npc_name.."Ta c騨g mu鑞 d蒼 ngi n Cu鑙 Sa m筩, nh璶g m鋓 ng? 阯g u  b? gi? sa m筩 l蕄 k輓. Chi b籲g  b秓 v藅 ? ch? ta, ng n  n鱝, kh玭g ph秈 hay h琻 sao?"},
	{Stage_info[6].npc_name.."B穙 c竧  th鎖 m蕋 phng hng, khuy猲 ngi kh玭g n猲 n .",Stage_info[6].npc_name.."B穙 c竧 c? quan h? g? v韎 t薾 c飊g sa m筩? Nh蕋 nh ph秈 n  sao? Ta ch璦 mu鑞 ch誸 u."},
}
Stage_info[6].log_in_dialog = {"Ta mu鑞 d蒼 i v祇 Cu鑙 Sa m筩","Ta mu鑞 d蒼 i v祇 Cu鑙 Sa m筩",}
Stage_info[6].map = {{1105,1205},{1305,1405,1505}}									--开启的5个关卡对应的map_id
Stage_info[6].stage_background = {Stage_info[6].npc_name.."Ph鬾g Tng , sa m筩 r閚g l韓 v? h筺, kh玭g bi誸 v飅 l蕄 bao nhi猽 di t輈h c? qu鑓. Nhi襲 ngi v蒼 n t譵 kho b竨 m芻 d? n琲 y nguy hi觤 b鑞 b?, c遪 c? 秓 秐h sa m筩, nguy c? b? gi? m筩 ch玭 v飅.",
									Stage_info[6].npc_name.."Th? ra c竎 h? c? la b祅, nh? ngi n  ng╪ ch苙 b穙 c竧"
								}
Stage_info[6].stage_condition ={ 						--闯关条件
	Stage_info[6].npc_name.."Tng truy襫 Cu鑙 Sa m筩 c? r蕋 nhi襲 b秓 t祅g b? v飅 l蕄, nh璶g l筰 c? 秓 秐h Sa M筩 萵 hi謓 u , m? ho芻 l遪g ngi. C莕 ta d蒼 甶 , ph秈 c?<color=yellow>b秓 v藅 gi? tr? tng 琻g<color> t苙g phe ta . ph秈 c? <color=yellow>3 n 5 ngi<color> l祄 b筺 ng h祅h, <color=yellow>kh玭g c? ngi kh玭g bi誸 秓 秐h Sa M筩<color> v? <color=yellow>kh玭g c? ai gi鑞g nhau v? v? c玭g l璾 ph竔<color>, c竎 ngi  甶襲 ki謓 th輈h h頿?",
	Stage_info[6].npc_name.."1. чi trng d蒼 theo <color=yellow>3-5 ngi<color>, v? nh鉳 ngi n祔 ph秈 t鮪g 甶 qua t薾 c飊g sa m筩. (<color=yellow>Ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>).\n2. чi trng mang theo <color=yellow>la b祅<color> n誹 kh玭g kh? c? th? ph﹏ bi謙 hng 甶.\n3. Trong i <color=yellow>kh玭g 頲 c? ngi v? c玭g l璾 ph竔 gi鑞g nhau<color>."
}
Stage_info[6].task_goods = {
	{
		{2,0,733,1,"Hoan Tng Ph竝 Kh?"},
		{2,0,732,1,"Th竝 Phong Y猽"}
	},
	{
		{2,0,1036,1,"La b祅"},
	}
}	--闯关需要物品
Stage_info[6].task_ID = {2031,64}												--闯关时对应的ID
Stage_info[6].in_coordinate = {1578,3242}										--进入对应坐标
Stage_info[6].out_coordinate = {506,1552,2667}									--传出的地图及坐标
Stage_info[6].cannot_log_reason = {			--无法进入关卡的原因对话
	{	
		Stage_info[6].npc_name.."T薾 c飊g sa m筩 r蕋 kh? ph﹏ bi謙 phng hng, d? g﹜ ra 秓 gi竎, c? 甶 kh玭g v?, c竎 ngi tri謚 t藀 t? <color=yellow>3-5 ngi<color> h絥  n .",
		Stage_info[6].npc_name.."Ngi kh玭g c? g? <color=yellow>cho ta<color>, ta c騨g kh玭g mu鑞 n c竔 n琲 qu竔 qu? , t鑤 h琻 kh玭g n猲 甶!",
		Stage_info[6].npc_name.."<color=yellow>H譶h nh? c竎 ngi ch璦 bi誸 秓 gi竎 sa m筩 l? g?<color>, n誹 ngang nhi猲 n , ch? s? nguy hi觤 n t輓h m筺g, t鑤 h琻 kh玭g n猲 !",
		Stage_info[6].npc_name.."Cu鑙 Sa m筩 c竎h bi謙 v韎 th? gi韎 b猲 ngo礽, nguy hi觤 y r蓎, l筰 b? 甧 d鋋 b雐 秓 秐h Sa M筩. <color=yellow>C竎 ngi ph秈 tinh th玭g v? c玭g c竎 l璾 ph竔<color> h頿 l鵦 c飊g nhau, c? ngi v? c玭g l璾 ph竔 gi鑞g nhau, l祄 sao l藀 th祅h h祅g ng??",
	},
	{	
		Stage_info[6].npc_name.."B穙 c竧  l祄 m蕋 hng, r蕋 kh? n t薾 c飊g sa m筩, t鑤 nh蕋 <color=yellow>tri謚 t藀 3-5 ngi<color>. (Nh綾 nh?: ",
		Stage_info[6].npc_name.."B穙 c竧  l祄 m蕋 hng, n誹 c? <color=yellow>la b祅<color> th? hay bi誸 m蕐.",
		Stage_info[6].npc_name.."H譶h nh? c竎 ngi kh玭g bi誸 s? nguy hi觤 c馻 b穙 c竧, mau quay v? 甶! (Nh綾 nh?: <color=yellow>Th祅h vi猲 trong i c莕 ph秈 ho祅 th祅h nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color>)",
		Stage_info[6].npc_name.."T薾 c飊g sa m筩 c竎h bi謙 v韎 th? gi韎 b猲 ngo礽, b鑞 b? hi觤 nguy, ph秈 c? <color=yellow>ngi v? c玭g l璾 ph竔 kh竎 nhau<color> ng t﹎ h頿 s鴆 m韎 c? hy v鋘g.",
	},
	{	Npc_name_city.."T薾 c飊g sa m筩 ngo礽 b穙 c竧 ra, <color=yellow>秓 gi竎 sa m筩<color> l? th? ng s? nh蕋, n? bi課 i 5 lo筰 h譶h d筺g. чi trng c莕 tri謚 t藀<color=yellow>3-5 ngi c蕄 85 tr? l猲<color> m韎 c? hy v鋘g.",
		Npc_name_city.."Con 阯g n t薾 c飊g sa m筩  b? b穙 c竧 c秐 tr?, l祄 m蕋 phng hng, ph秈 c? <color=yellow>la b祅<color> m韎 c? th? mi詎 cng v祇 trong.",
		Npc_name_city.."H譶h nh? c竎 ngi ch璦 甶 h誸 T﹜ v鵦, ch璦 t譵 hi觰 k? n琲 . Ch璦 bi誸 c竎h i ph? v韎 <color=yellow>秓 gi竎 sa m筩<color>, ho祅 th祅h <color=yellow>nhi謒 v? T﹜ b綾-Ho祅g Sa L筩 M筩<color> h絥 quay l筰.",
		Npc_name_city.."Trong s? c竎 ngi c? v? c玭g l璾 ph竔 gi鑞g nhau, ph? h駓 <color=yellow>秓 gi竎 sa m筩<color> s? r蕋 kh? kh╪.",
	},
}
Stage_info[6].boss_chat = {
	"chi誱 畂箃 t蕋 c? ?",
	"chi誱 畂箃 c? th? gi韎 ?",
	"Hoan tng ta y l? n鏸 khi誴 s? c馻 c竎 ngi!",
	"kh玭g c? tr阨 cao t d祔, h鏽 n u l? ? ",
	"h錸g hoang ? v? kh雐 ? v? di謙!",
}
Stage_info[6].stage_start_msg ="C竎 ngi n Cu鑙 Sa m筩, 秓 秐h Sa M筩 s? xu蕋 hi謓 trong m閠 ph髏 n鱝, c竎 ngi ph秈 lu玭 trong tr筺g th竔 chi課 u!"
Stage_info[6].stage_start_talk = "<color=yellow>La b祅<color> ? t薾 c飊g sa m筩 m蕋 甶 nh hng. C﹜ c? xung quanh kh? c籲, nh鱪g b? xng kh? l蕄 l? 萵 hi謓 tr猲 c竧. B穙 c竧 v? 秓 gi竎 sa m筩  l祄 lung lay ? tr? c馻 nh鱪g ai mu鑞 <color=yellow>t譵 kho b竨<color>, ph輆 sau b穙 c竧 c? th? c? th? <color=yellow>ph? 秓 gi竎<color>?"
Stage_info[6].boss_crt_msg = "秓 秐h 萵 n髉 ? Cu鑙 Sa m筩  xu蕋 hi謓! Ph秈 l祄 cho 秓 秐h hi謓 nguy猲 h譶h trong v遪g 30 ph髏  ti猽 di謙 nguy猲 h譶h (con trai) ."
Stage_info[6].stage_end_msg = "Vt tr薾  ho祅 th祅h. Xin i gi﹜ l竧 s? d蒼 c竎 v? n b猲 ngo礽 Ng? h祅h tr薾"
Stage_info[6].stage_start_time_bar = "Hoan Tng xu蕋 hi謓 (m ngc)"
Stage_info[6].boss_crt_time_bar = "Цnh b筰 Hoan Tng m ngc"
Stage_info[6].stage_end_time_bar = "Khu v鵦 頲 d蒼 n, (m ngc)"
--城市关卡传送人对话--
Stage_info.city_mis_dia_main = {
	Npc_name_city.."Ngi T﹜ v鵦 c騨g 輙 lui t韎, ? y c? nhi襲 ch? r蕋 nguy hi觤, ta t鮪g d? h醝 頲 bi誸 trong <color=yellow>C? Dng чng<color> c? con <color=yellow>C? Dng Th?<color> hung b筼 b猲 trong, c竎 ngi c遪 mu鑞 n  sao?",
	Npc_name_city.."<color=yellow>T莕 L╪g<color> l? n琲 ch玭 c蕋 <color=green>T莕 Th駓 Ho祅g<color>, c? quan b猲 trong  ch玭 v飅 kh玭g 輙 nh鱪g tay cp m?, ta  quan s竧 th蕐 b猲 trong m? c? <color=yellow>Tr蕁 M? Linh Th?<color> r蕋 kh? i ph?, c竎 ngi c遪 mu鑞 v祇 ??",
	Npc_name_city.."<color=yellow>Ho祅g L╪g m藅 th蕋<color> kh玭g c遪 c? qu秐 b秓 v?, do c? <color=yellow>Qu? Tng Qu﹏<color> canh gi? b猲 trong, <color=yellow>Qu? Tng Qu﹏<color> l骳 c遪 s鑞g  c飊g T莕 Th駓 Ho祅g nam chinh b綾 ph箃, ra n hi觤 竎, c竎 ngi c遪 mu鑞 n  ??",
	Npc_name_city.."<color=yellow>Dc Vng<color> l? m閠 nh﹏ v藅 nguy hi觤, c? ﹎ m璾 甶襲 khi觧 <color=yellow>Dc Nh﹏<color> nh? cng thi d飊g  t蕁 c玭g i T鑞g, may c k? ch璦 th祅h, nh璶g Luy謓 n ng xu蕋 hi謓 r蕋 nhi襲 <color=yellow>Dc Nh﹏ Th秓<color>, kh玭g bi誸 Dc Vng 產ng gi? tr? g?, c竎 ngi n猲 c萵 th薾!",
	Npc_name_city.."<color=yellow>Ng? H祅h Tr薾<color> k? b? kh? 畂竛, kh玭g ng? T﹜ h? l筰 c? cao nh﹏ am hi觰 ng? h祅h, c遪 c? th? d飊g ch髇g hu蕁 luy謓 ra Ng? H祅h S?, n誹 mu鑞 v祇 <color=yellow>Ng? H祅h Tr薾<color> c竎 ngi n猲 c萵 th薾.",
	Npc_name_city.."T﹜ v鵦 n琲 ngi ta khi誴 s? ph秈 k? n sa m筩 hoang vu, ?  y r蓎 hi觤 nguy, k? n l? b穙 c竧 ? t薾 c飊g sa m筩 khi課 ai nghe n c騨g ph秈 khi誴 s?, n? ch玭 v飅 kh玭g 輙 k? t譵 ki誱 <color=yellow>kho b竨<color>, c竎 ngi c遪 mu鑞 n  ??",
}
Stage_info.stage_condition_main_dialog = {
	"дn <color=yellow>C? Dng чng<color> c竎 v? c莕 h閕  甶襲 ki謓 sau:",
	"V祇 <color=yellow>Ho祅g L╪g m藅 o<color> c竎 v? c莕 h閕  甶襲 ki謓 sau:",
	"V祇 <color=yellow>Ho祅g L╪g m藅 th蕋<color> c竎 v? c莕 h閕  甶襲 ki謓 sau:",
	"V祇 <color=yellow>Luy謓 n ng<color>, c竎 v? c莕 h閕  甶襲 ki謓 sau:",
	"Khi猽 chi課 <color=yellow>Ng? H祅h Tr薾<color>, c竎 v? c莕 h閕  甶襲 ki謓 sau:",
	"Mu鑞 nh tan <color=yellow>秓 gi竎 sa m筩<color>, c竎 v? c莕 h閕  甶襲 ki謓 sau:",
}
Stage_info.stage_login_clew = {
	"M閠 s? tia s竛g c馻 kho竛g th筩h ph竧 ra, khi課 <color=yellow>C? Dng чng<color> 竛h l猲 m祏  nh? m竨. Xung quanh hoang t祅  n竧, x竎 ngi ch蕋 ng, b蕋 lu薾 Ngi o kho竛g th莕 b? hay <color=yellow>Li Long H醓 H?<color> b猲 ngo礽 u th蕐 頲 v誸 t輈h . B鋘 ngi t譵 b秓 v藅 mu鑞 x玭g v祇 trong ng nh璶g h? kh玭g ng? r籲g <color=yellow>C? Dng Th?<color> b? h醓 luy謓 kim n d祔 v?, tr? n猲 hung 竎, <color=yellow>C? Dng Th?<color> nh藀 v祇 nh鱪g ai x﹎ ph筸. C祅g nhi襲 sinh v藅 trong ng c祅g thu h髏 nhi襲 <color=yellow>Huy誸 Ma Nh﹏<color>. C竎 ngi ph秈 c萵 th薾!",
	"<color=yellow>H錳 Long S竎h<color> qu? nhi猲 l? l頸 h筰, c? th? m? m藅 o t莕g tr猲 t莕g di, <color=yellow>Tr蕁 M? Th?<color> l蒼 Ho祅g L╪g c遪 nhi襲 甶襲 huy襫 b?. Xem ra <color=yellow>Tr蕁 M? Th?<color> canh gi? l╪g m? tr鋘g a, v韎 t輓h c竎h c馻 <color=green>T莕 Th駓 Ho祅g<color> sao kh玭g l緋 t c? quan!? Tr蕁 M? Th? v? c? quan trong m? nh蕋 nh c? li猲 quan v韎 nhau. T﹜ v鵦 ng l? n琲 huy襫 b?.",
	"<color=yellow>To竔 th筩h ch蕁<color> trc khi d飊g  v祇 m藅 th蕋, kh玭g ngh? n琲 y c? c筸 b蓎, <color=green>T莕 Th駓 Ho祅g<color> c騨g cho r籲g v韎 s鴆 m筺h c馻 <color=yellow>Qu? Tng Qu﹏<color>   b秓 v? l╪g m?. Tuy m藅 th蕋 kh玭g t c? quan, nh璶g  x﹎ ph筸 v祇 m? T莕 Th駓 Ho祅g, theo quy t綾 c馻 k? cp m? ph秈 ? g鉩 ng nam t m閠 c﹜ n c莥. Nh璶g v韎 uy l鵦 c馻 <color=yellow>Qu? Tng Qu﹏<color> e r籲g l祅h 輙 d? nhi襲.",
	"<color=yellow>Dc Nh﹏<color> canh gi? qu? nhi猲 hi謚 qu?. <color=yellow>Luy謓 n ng<color> c祅g l骳 c祅g nguy hi觤, ch? l? th猰 v礽 c竔 l? luy謓 n. M飅 c馻 than v? th秓 dc tr閚 l蒼, ng鰅 v祇 g﹜ kh? ch辵. Kh玭g bi誸 <color=green>Dc Vng<color>  nghi猲 c鴘 ra chi猽 g? m韎, Dc Nh﹏ Th秓  l頸 h筰, nay Dc Nh﹏ c遪 l頸 h筰 h琻, Dc Vng c騨g ch璦 h礽 l遪g. Xem ra <color=green>Dc Vng<color> c遪 tr錸g th猰 nhi襲 Dc Nh﹏ Th秓.",
	"<color=yellow>Ng? H祅h Tr薾<color> d鵤 theo tng sinh tng kh綾 c馻 ng? h祅h. M鏸 m閠 <color=yellow>Ng? H祅h S?<color> u c? th? mn s? tng sinh tng kh綾  ph竧 huy m閠 s鴆 m筺h th莕 b?, n誹 ph鑙 h頿 th猰 Ng? H祅h Tr薾 th? s鴆 m筺h kinh ngi. Mu鑞 ph? Ng? H祅h S?, Ng? H祅h Tr薾 l? m蕌 ch鑤. Ng? h祅h kh玭g ch? theo tng sinh tng kh綾, Ng? H祅h S? c遪 ph鑙 h頿 phng v? b猲 trong c馻 Ng? H祅h Tr薾, n誹 n緈 頲 s? bi課 i th? may ra c? c? h閕 s鑞g s鉻. Ghi nh韁n<color=yellow>Ng? h祅h tng sinh: Kim sinh Th駓, Th駓 sinh M閏, M閏 sinh H醓, H醓 sinh Th?, Th? sinh Kim.\nNg? h祅h tng kh綾: Kim kh綾 M閏, M閏 kh綾 Th?, Th? kh綾 Th駓, Th駓 kh綾 H醓, H醓 kh綾 Kim<color>",
	"<color=yellow>La b祅<color> ch? 阯g ? t薾 c飊g sa m筩 nh璶g n t薾 c飊g sa m筩 s? m蕋 甶 phng hng. C﹜ c? xung quanh kh? c籲, nh鱪g b? xng kh? l蕄 l? 萵 hi謓 tr猲 c竧. B穙 c竧 v? 秓 gi竎 sa m筩  l祄 lung lay ? tr? c馻 nh鱪g k? <color=yellow>t譵 kho b竨<color>.",
}
---------------------------------------------------被阉割了的分割线----------------
--临时处理
--普通关卡boss信息
Tb_normal_boss_info = {
	{
		{"C? Dng Th?","C? Dng Th?",1618,3207,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"Tr蕁 M? Th?","Tr蕁 M? Th?",1618,3207,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"T﹜ B綾 Qu? Tng u","Qu? Tng Qu﹏",1612,3210,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"Dc Vng","Dc Vng",1600,3168,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
	{
		{"Ng? H祅h S? Kim","Ng? H祅h Kim S?",1613,3205,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng? H祅h S? Th駓","Ng? H祅h Th駓 S?",1602,3258,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng? H祅h S? M閏","Ng? H祅h M閏 S?",1625,3231,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng? H祅h S? H醓","Ng? H祅h H醓 S?",1577,3230,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
		{"Ng? H祅h S? Th?","Ng? H祅h Th? S?",1592,3203,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"},
	},
	{
		{"Hoan Tng (Tng l躰h tng)","Th鑞g l躰h tng binhHoanTng ",1614,3217,"\\script\\missions\\northwest_mission\\npc\\boss_death.lua"}
	},
}
--复杂关卡boss信息
	Tb_Monster_info = {}
	Tb_Monster_info[1] = {
		{"C? Dng Th? 秈 1","C? Dng Th? (h醓 luy謓)",1599,3195,5},
		{"C? Dng Th? 秈 2","C? Dng Th? (nh藀)",1599,3195,5},
		{"秈  Nh藅 S?"," Nh藅 S? ",1599,3195,350},
		{"秈 Minh Nh藅 S? ","Minh Nh藅 S?",1599,3195,350},
		{"秈 Huy誸 Ma Nh﹏","Huy誸 Ma Nh﹏",1599,3195,350},
		{"秈 Li謙 Nhan Li Long ","Li謙 Nhan Li Long",1599,3195,350},
		{"秈 X輈h Luy謓 H醓 H?","X輈h Luy謓 H醓 H?",1599,3195,350},
	}
	Tb_Monster_info[2] = {
		{"Tr蕁 M? Tr?","",1629,3224,},
		{"Tr蕁 M? Tr?","",1601,3193,},
		{"Tr蕁 M? Tr?","",1574,3222,},
		{"Tr蕁 M? Tr?","",1603,3253,},
		{"秈 Tr蕁 M? Th?","Tr蕁 M? Th?",1618,3207,},
	}
	Tb_Monster_info[3] = {
		{"Mang n課 v? ng鋘 畊鑓 (trung)","Ng鋘 畊鑓 Йng B綾",1638,3224,"","Kh玭g c? n課 v? ng鋘 畊鑓","Йng B綾 Tr蕁 m? Tng qu﹏","Йng B綾 Tr蕁 m? Tng qu﹏",{10,60,100},"Qu? t飝 t飊g","Qu? t飝 t飊g",{{1627,1637},{3214,3234}}},
		{"Mang n課 v? ng鋘 畊鑓 (i)","Ng鋍 畊鑓 Йng Nam",1601,3265,"","Kh玭g c? n課 v? ng鋘 畊鑓","Йng Nam Tr蕁 m? Tng qu﹏","Йng Nam Tr蕁 m? Tng qu﹏",{0,20,100},"Qu? Kh玦 L鏸","Qu? Kh玦 L鏸",{{1594,1604},{3251,3261}}},
		{"Mang n課 v? ng鋘 畊鑓 (trung)","Ng鋘 畊鑓 T﹜ Nam",1563,3223,"","Kh玭g c? n課 v? ng鋘 畊鑓","T﹜ Nam Tr蕁 m? Tng qu﹏","T﹜ Nam Tr蕁 m? Tng qu﹏",{10,60,100},"Qu? n? b閏","Qu? n? b閏",{{1565,1575},{3212,3232}}},
		{"Mang n課 v? ng鋘 畊鑓 (ti觰)","Ng鋍 畊鑓 T﹜ B綾",1601,3182,"","Kh玭g c? n課 v? ng鋘 畊鑓","T﹜ B綾 Tr蕁 m? Tng qu﹏","T﹜ B綾 Tr蕁 m? Tng qu﹏",{70,100,0},"Qu? Th? T飊g","Qu? Th? T飊g",{{1597,1607},{3183,3193}}},
		{"秈 Qu? Tng u","Qu? Tng Qu﹏",1600,3221,""},
	}
	Tb_Monster_info[4] = {
		{"秈 Dc Vng","Dc Vng",1597,3192},
		{"Dc Nh﹏ Th秓","Dc Nh﹏ Th秓",1597,3192}, 
		{"秈 Dc Nh﹏ Vng","Dc Nh﹏"},
	}
	--npc死亡脚本
	TB_Npc_death_script = {}
	TB_Npc_death_script[1] = {
		{"C? Dng Th? (h醓 luy謓)","stage1_boss_death()"},
		{" Nh藅 S? ","stage1_sun_moon_death()"},
		{"Minh Nh藅 S?","stage1_sun_moon_death()"},
		{"Li謙 Nhan Li Long","stage1_dragon_fox_death()"},
		{"X輈h Luy謓 H醓 H?","stage1_dragon_fox_death()"}
	}
	TB_Npc_death_script[2] = {
		{"Ph? ph遪g Tr蕁 m? tr?","stage2_pillar_death(1,"},
		{"Gi竛g c玭g Tr蕁 m? tr?","stage2_pillar_death(2,"},
		{"H? nhc Tr蕁 m? tr?","stage2_pillar_death(3,"},
		{"Gi秏 t鑓 Tr蕁 m? tr?","stage2_pillar_death(4,"},
		{"чn th﹏ Tr蕁 m? tr?","stage2_pillar_death(5,"},
		{"筺 huy誸 Tr蕁 m? tr?","stage2_pillar_death(6,"},
		{"H錳 m謓h Tr蕁 m? tr?","stage2_pillar_death(7,"},
		{"H錳 n閕 Tr蕁 m? tr?","stage2_pillar_death(8,"},
		{"Cng c玭g Tr蕁 m? tr?","stage2_pillar_death(9,"},
		{"Ng? th? Tr蕁 m? tr?","stage2_pillar_death(10,"},
		{"Cng l鵦 Tr蕁 m? tr?","stage2_pillar_death(11,"},
		{"б t鑓 Tr蕁 m? tr?","stage2_pillar_death(12,"},
		{"Tr蕁 M? Th?","stage2_boss_death("},
	}
	TB_Npc_death_script[3] = {
		{"Qu? Tng Qu﹏","stage3_boss_death()"},
		{"Йng B綾 Tr蕁 m? Tng qu﹏","devil_Gen_death(1)"},
		{"Йng Nam Tr蕁 m? Tng qu﹏","devil_Gen_death(2)"},
		{"T﹜ Nam Tr蕁 m? Tng qu﹏","devil_Gen_death(3)"},
		{"T﹜ B綾 Tr蕁 m? Tng qu﹏","devil_Gen_death(4)"},
		{"Qu? t飝 t飊g","end_dialog()"},
		{"Qu? Kh玦 L鏸","end_dialog()"},
		{"Qu? n? b閏","end_dialog()"},
		{"Qu? Th? T飊g","end_dialog()"},	
		{"Ng鋘 畊鑓 Йng B綾","player_kill_candler(1)"},
		{"Ng鋍 畊鑓 Йng Nam","player_kill_candler(2)"},
		{"Ng鋘 畊鑓 T﹜ Nam","player_kill_candler(3)"},
		{"Ng鋍 畊鑓 T﹜ B綾","player_kill_candler(4)"},
	}
	TB_Npc_death_script[4] = {
		{"Dc Vng","stage4_boss_death()"},
		{"Dc Nh﹏","stage4_devil_death()"},
	}
TB_Npc_death_script[5] = {
	{"Kim s?","stage5_element_death(1)"},
	{"Th駓 s?","stage5_element_death(2)"},
	{"M閏 s?","stage5_element_death(3)"},
	{"H醓 s?","stage5_element_death(4)"},
	{"Th? s?","stage5_element_death(5)"},
}
TB_Npc_death_script[6] = {
	{"Huy誸 Ma Nh﹏Hoan Tng ","stage6_shadow_death(1)"},
	{"Qu? Tng uHoan Tng ","stage6_shadow_death(2)"},
	{"Tr蕁 m? Tng qu﹏Hoan Tng ","stage6_shadow_death(3)"},
	{"Th鑞g l躰h tng binhHoanTng ","stage6_shadow_death(4)"},
	{"Tr蕁 M? Th驢oan Tng ","stage6_shadow_death(5)"},
	{"Nguy猲 h譶h 秓 秐h (t躰h m辌h)","stage6_boss_slience_death()"},
	{"Nguy猲 h譶h 秓 秐h (th莕)","stage6_boss_death()"},
}
	--npc对话脚本
	--玩家taskid记录内容
	Task_ID_stage_diff = 1252	--关卡区分：普通/复杂
	Task_ID_stage_seq = 1253	--关卡序号
	--怪物信息，在各个关卡中使用
	Tb_Npc_dialog_info = {}
	Main_Npc_Script_way = "\\script\\missions\\northwest_mission\\stage\\stage_time.lua"
--登录触发器的处理
function player_log_out_pub_deal()
	RemoveTrigger(GetTrigger(Trigger_save_ID))
	for i =1,4 do
		StopTimeGuage(i)
	end
	local mission_diff = GetTask(Task_ID_stage_diff)
	if mission_diff == 2 then
		ForbidChangePK(0)	--禁止转换PK状态
		SetPKFlag(0,0)		--PK状态
		SetCreateTeam(0)
		local stage_seq = GetTask(Task_ID_stage_seq)
		--第二关称号处理
		if stage_seq == 2 then
			for i = 11,16 do
				RemoveTitle(60,i)
			end
			for i = 19801228,19801252 do
				RemoveState(i)
			end
		elseif stage_seq == 3 then
			for i = 1038,1040 do
				BigDelItem(2,0,i,BigGetItemCount(2,0,i))
			end
		elseif stage_seq == 4 then
			--第四关称号处理和状态处理
			for i = 21,25 do
				RemoveTitle(60,i)
			end
			RemoveState(19801223)
		end
	end
	UseScrollEnable(1)		--禁止使用回城符
	ForbitTrade(0)			--禁止交易
	StallEnable(1)				--禁止摆摊
	SetDeathPunish(1)		--无死亡惩罚
	OpenFriendliness(1)	--增加好感度
	gf_ForbidFactionSkill(0)	--镇派可以使用
	if IsPlayerDeath() == 1 then
		RevivePlayer(0)
	end
	RestoreAll()		--全部回复
	SetDeathScript("")
	DelMSPlayer(MS_ID,0)
end
function Ms_on_log_in()
	player_log_out_pub_deal()
	--玩家传出
	local login_diff = GetTask(TaskID_miss_login_diff)
	if login_diff ~= 2 then
		local map_id = GetWorldPos()
		local stage_seq = tonumber(strsub(tostring(map_id),4,4)) + 1
		NewWorld(Stage_info[stage_seq].out_coordinate[1],Stage_info[stage_seq].out_coordinate[2],Stage_info[stage_seq].out_coordinate[3])
	else
		NewWorld(500,1764,3147)
		SetFightState(0)
	end
end
-------------------------------------------------奖励给于函数--------------------------------------------
Sever_diff = 2		--(1为收费区、2为免费区)
Tb_stage_tichket = {
	{2,0,1031,"B輈h Dao Thanh T﹎ Кn"},
	{2,0,1032,"H錳 Long s竎h"},
	{2,0,1033,"To竔 Th筩h Ch蕁"},
	{2,0,1034,"T輈h Dng Tinh Hoa"},
	{2,0,1035,"Ng? H祅h K? Phi猲"},
	{2,0,1036,"La b祅"},
	{2,0,1037,"Thi謕 d? ti謈 Long M玭"},
}
Tb_add_mertiral = {
	{2,1,3330,"Nh蕋 Thi觤 Y猽 Ho祅g"},
	{2,1,3331,"Tam Di謚 Long Hi"},
	{2,1,3332,"ч Nguy謙 Th莕 Sa"},
	{2,1,3333,"Ph莕 Quang Th莕 Sa"},
	{2,1,3334,"Tr秏 Tinh Th莕 Sa"},
	{2,1,3204," Ng? Th竔 Lung T髖"},
	{2,1,3205,"Th蕋 Huy襫 T? V╪"},
}
Tb_stage_prize = {
--服务器-关卡-队长
	{
		{--健康转经验-J-陨铁-灵石（等级下上限，数量）-门票（几率、代号）-材料（几率、数量、代号）
			{2000000,200000,20,{3,4,2},{{10},{5}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{2000000,200000,20,{3,4,2},{{10},{3}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{3000000,200000,20,{4,5,2},{{10},{6}},{{90,100},{1,2},{2,2}},{{25,75,100},{2,3,4},{3,3,3}},{{100,1,1}}},
			{3000000,200000,20,{4,5,2},{{},{}},{{100},{1},{2}},{{50,100},{1,2},{3,3}},{{100,1,1}}},
		},
		{
			{2000000,200000,20,{3,4,2},{{10},{5}},{{25,75,100},{2,3,4},{1,1,1}},{},{}},
			{2000000,200000,20,{3,4,2},{{},{}},{{100},{2},{1}},{},{}},
		},
		{
			{3000000,200000,20,{4,5,2},{{10},{6}},{{90,100},{1,2},{2,2}},{{25,75,100},{2,3,4},{3,3,3}},{{100,1,1}}},
			{3000000,200000,20,{4,5,2},{{},{}},{{100},{1},{2}},{{50,100},{1,2},{3,3}},{{100,1,1}}},
		},
		{
			{4000000,200000,20,{5,6,2},{{100},{7}},{{50,100},{1,2},{6}},{{25,75,100},{6,7,8},{3,3,3}},{{100,1,1},{5,1,2}}},
			{4000000,200000,20,{5,6,2},{{},{}},{{100},{1},{6}},{{50,100},{3,4},{3,3}},{{100,1,1},{5,1,2}}},
		},
	},
	{
		{--经验-J-陨铁-灵石（等级下上限，数量）-门票（几率、代号）-材料（几率、数量、代号）
			{1000000,0,0,{3,4,1},{{10},{5}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{1000000,0,0,{3,4,1},{{10},{3}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{2000000,0,0,{4,5,1},{{10},{6}},{{20},{1},{2}},{{100},{1},{3}},{}},
			{2000000,0,0,{4,5,1},{{},{}},{{20},{1},{2}},{{30},{1},{3}},{}},
		},
		{
			{1000000,0,0,{3,4,1},{{10},{5}},{{100},{1},{1}},{},{}},
			{1000000,0,0,{3,4,1},{{},{}},{{100},{1},{1}},{},{}},
		},
		{
			{2000000,0,0,{4,5,1},{{10},{6}},{{20},{1},{2}},{{100},{1},{3}},{}},
			{2000000,0,0,{4,5,1},{{},{}},{{20},{1},{2}},{{30},{1},{3}},{}},
		},
		{
			{3000000,0,0,{5,6,1},{{100},{7}},{{20},{1},{6}},{{50,90,100},{2,3,4},{3,3,3}},{}},
			{3000000,0,0,{5,6,1},{{},{}},{{20},{1},{6}},{{65,100},{1,2},{3,3}},{}},
		},
	},
}
--奖励给予
function Ms_stage_prize()
	--关卡序号合法判断
	local stage_diff = GetMissionV(MS_STATE_DIFF_ID)
	if stage_diff <= 0 or stage_diff > getn(Tb_stage_prize[Sever_diff]) then
		return
	end
	--是否队长
	local is_team_captain = 2
	if GetTeamMember(0) == PlayerIndex then
		is_team_captain = 1
	end
	--加经验
	local exp_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1]
		--收费区转换经验
	if Sever_diff == 1 then
		exp_num = min((Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1]/2),GetGoldenExp())
		if exp_num ~= 0 then
			ModifyGoldenExp(-exp_num)
			ModifyExp(exp_num)
			Msg2Player("B筺 甧m "..exp_num.."甶觤 s鴆 kh醗 i 甶觤 kinh nghi謒.")
		else
			Msg2Player("觤 s鴆 kh醗 hi謓 t筰 c馻 b筺 l? 0, kh玭g th? chuy觧 th祅h kinh nghi謒!")
		end
		--免费区
	end
	ModifyExp(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1])
	Msg2Player("B筺 nh薾 頲 "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][1].." 甶觤 kinh nghi謒!")
	--加钱
	if Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][2] ~= 0 then
		Earn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][2])
	end
	--加铁
	local add_flag = 0
	if Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3] ~= 0 then
		 add_flag = AddItem(2,2,8,Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3]) 
		 if add_flag == 1 then
			Msg2Player("B筺 nh薾 頲 "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3].." Thi猲 Th筩h!")
		else
			WriteLog("秈 T﹜ B綾: Ph莕 thng ban cho-ngi ch琲["..GetName().."]t╪g th猰 "..Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][3].." thi猲 th筩h th蕋 b筰, v? tr? th蕋 b筰: "..add_flag)
		end
	end
	--增加灵石
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4]) ~= 0 then
		for i = 1,Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][3] do
			local linshi_level = random(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][1],Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][4][2])
			lspf_AddLingShiInBottle(linshi_level,1)
			Msg2Player("B筺 nh薾 頲 1 vi猲 c蕄 "..linshi_level.." Linh th筩h,  cho v祇 T? Linh nh!")
		end
	end
	--增加门票
	local ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [1][i] then
				local ticket_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][5] [2][i]
				add_flag = AddItem(Tb_stage_tichket[ticket_seq][1],Tb_stage_tichket[ticket_seq][2],Tb_stage_tichket[ticket_seq][3],1)
				if add_flag == 1 then
					Msg2Player("B筺 nh薾 頲 1 "..Tb_stage_tichket[ticket_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh薾 頲 1 "..Tb_stage_tichket[ticket_seq][4].."\")")
				else
					WriteLog("秈 T﹜ B綾: Ph莕 thng ban cho-ngi ch琲["..GetName().."]t╪g 1"..Tb_stage_tichket[ticket_seq][4].." th蕋 b筰, k? hi謚:"..add_flag)
				end
				break
			end
		end		
	end
	--增加材料
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [1][i] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [2][i]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][6] [3][i]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B筺 nh薾 頲 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh薾 頲 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("秈 T﹜ B綾: Ph莕 thng ban cho-ngi ch琲["..GetName().."]t╪g th猰 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].." th蕋 b筰, k? hi謚:"..add_flag)
				end
				break
			end
		end
	end
	--2008-5-13增加材料
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8][i][1] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8] [i][2]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][8] [i][3]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B筺 nh薾 頲 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh薾 頲 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("秈 T﹜ B綾: Ph莕 thng ban cho-ngi ch琲["..GetName().."]t╪g th猰 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].." th蕋 b筰, k? hi謚:"..add_flag)
				end
			end
		end
	end
	--结束
	ran_num = random(100)
	if getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7]) > 0 then
		for i = 1,getn(Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [1]) do
			if ran_num <= Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [1][i] then
				local mertiral_num = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [2][i]
				local mertiral_seq = Tb_stage_prize[Sever_diff][stage_diff][is_team_captain][7] [3][i]
				add_flag = AddItem(Tb_add_mertiral[mertiral_seq][1],Tb_add_mertiral[mertiral_seq][2],Tb_add_mertiral[mertiral_seq][3],mertiral_num)
				if add_flag == 1 then
					Msg2Player("B筺 nh薾 頲 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4])
					Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh薾 頲 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].."\")")
				else
					WriteLog("秈 T﹜ B綾: Ph莕 thng ban cho-ngi ch琲["..GetName().."]t╪g th猰 "..mertiral_num.."c竔"..Tb_add_mertiral[mertiral_seq][4].." th蕋 b筰, k? hi謚:"..add_flag)
				end
				break
			end
		end
	end
	--2008-11-10：增加七炫鎏纹
	ran_num = random(1000)
	if (ran_num <= 10 and Sever_diff == 1) or  (ran_num <= 5 and Sever_diff == 2) then
		AddItem(2,1,3205,1)
		Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 1 Th蕋 Huy襫 L璾 V╪!")
		Zgc_pub_mission_fun(MS_ID,"Msg2Player(\""..GetName().."Nh薾 頲 1 Th蕋 Huy襫 L璾 V╪!\")")
	end
end
