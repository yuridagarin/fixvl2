--filename:泉州福神.lua
--create date:2006-01-12
--author:yanjun
--describe:汴京福神脚本

--修改：1、村长20070123修改本脚本，增加华山竞技相关内容

Include("\\script\\online\\春节活动\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
--==========================公共变量定义区域=============================
	start_seq = {
		{630,638},
		{639,647},
		{648,656},
		{657,663}
		}
	--所有麻将初始化
	mah_jong = {
		"Nh蕋 ng","Nh? ng","Tam ng","T? ng","Ng? ng","L鬰 ng","Th蕋 ng","B竧 ng","C鰑 ng",
		"M閠","Nh? 甶襲","Ba","B鑞","Ng? 甶襲","L鬰 甶襲","Th蕋 甶襲","B竧 甶襲","C鰑 甶襲",
		"Nh蕋 v筺","Nh? v筺","Tam v筺","T? v筺","Ng? v筺","L鬰 v筺","Th蕋 v筺","B竧 v筺","C鰑 v筺",
		"Йng phong","Nam phong","T﹜ phong","B綾 phong","H錸g trung","ph竧 t礽","B筩h ban"
	}
	mah_jong_prize_bag = {{670,"Con b礽 4 甧m cc"},{669,"Con b礽 3 甧m cc"},{668,"Con b礽 2 甧m cc"},{667,"Con b礽 甧m cc"},{667,"Con b礽 甧m cc"}}
	Npc_name = {"<color=green>Hi猲 Vi猲 Trung<color>:","<color=green>Hi猲 Vi猲 Nh﹏<color>:","<color=green>Hi猲 Vi猲 L?<color>:"}
--==============================主逻辑区域===============================
function main(npc_index)
	local map_ID = GetWorldPos()				--记录NPC名称
	--加上等级判断
	local npc_dia = {
		"Hay l緈! Xem ta ra tay y!/mah_jong_suc_list",
		"Цnh theo quy t綾 n祇 v藋? L祄 sao t輓h th緉g?/mah_jong_suc_inf",
		"Kh玭g bi誸 M箃 chc l? c竔 g??/what_is_mah_jong",
		"Cu閏 thi х th莕 tranh b? l? g??/mah_jong_task_inf",
		"Ta mu鑞 nh薾 Hng d蒼 ho箃 ng 1-5/#AddItem(2,1,1114,1)",
		"Ta c遪 ph秈 h祅h hi謕 c鴘 ngi, kh玭g r秐h  nh M箃 chc!/end_dialog",
	}
	Say(Npc_name[floor(map_ID/100)].."Ta l?  t? c馻 Hi猲 Vi猲 m玭, g莕 y b鎛 m玭 c? t? ch鴆 1 cu閏 thi <color=yellow>х Th莕 tranh b?<color>, sao b籲g h鱱 kh玭g n  th? xem!",
		getn(npc_dia),
		npc_dia
	)
end
--*********************************胡牌规则说明**************************
function mah_jong_suc_inf()
	local map_ID = GetWorldPos()
	Say(Npc_name[floor(map_ID/100)].."Di y l? quy t綾 th緉g, b筺 mu鑞 ch琲 theo c竎h n祇?",
	7,
	"Ta mu鑞 bi誸 quy t綾 h遖 v? ph莕 thng/#mah_jong_rule_dia(1)",
	"Ta mu鑞 bi誸 quy t綾 v? ph莕 thng c馻 Thanh Nh蕋 S綾 уng/#mah_jong_rule_dia(2)",
	"Ta mu鑞 bi誸 quy t綾 v? ph莕 thng c馻 Thanh Nh蕋 S綾 襲/#mah_jong_rule_dia(3)",
	"Ta mu鑞 bi誸 quy t綾 v? ph莕 thng c馻 Thanh Nh蕋 S綾 V筺/#mah_jong_rule_dia(4)",
	"Ta mu鑞 bi誸 quy t綾 v? ph莕 thng c馻 Чi T? H?/#mah_jong_rule_dia(5)",
	"Ta mu鑞 bi誸 quy t綾 v? ph莕 thng c馻 B礽 Th莕/#mah_jong_rule_dia(6)",
	"Tho竧/end_dialog"
	)
end
function mah_jong_rule_dia(suc_way)
	local map_ID = GetWorldPos()
	local tb_mah_jong_suc_rule = {
		"<color=yellow>Quy t綾 B譶h H?<color>: \n C莕 <color=yellow>14 <color>c遪 b礽 b蕋 k? !\n<color=yellow>Ph莕 thng<color>: <color=yellow>14 ф Hi謕 Ng? Thng Bao<color> (m? ra nh薾 頲: Ng﹏ lng, c? th? nh薾 頲: H閜 qu? c? c秈 nh?, M藅 t辌h, G醝 m秐h Thi猲 Th筩h, H遖 Th? B輈h, <color=red>Rng trang b? T祅g Ki誱<color>)!",
		"<color=yellow>Thanh Nh蕋 S綾 уng<color>: \n C莕 c? Nh蕋 уng n C鰑 уng <color=yellow>m鏸 lo筰 1 con<color>, ngo礽 ra <color=yellow>4 con уng b蕋 k?<color>!\n<color=yellow>Ph莕 thng<color>: <color=yellow>ф Hi謕 T? Thng Bao<color>(M? ra nh薾 頲: v? kh? c bi謙, danh v鋘g, m藅 t辌h, h閜 qu? c? c秈 nh?, Ph竜 hoa a tin. C? th? nh薾 頲: B秐 v? binh kh? m玭 ph竔, G鉯 Thi猲 Th筩h, N玭g Tang ph?, <color=red>Vi猰 д Gi竝<color>)!", 
		"<color=yellow>Thanh Nh蕋 S綾 襲<color>: \n  C莕 Nh蕋 襲 n C鰑 襲 <color=yellow>m鏸 lo筰 1 con<color>, ngo礽 ra <color=yellow>5 con 襲 b蕋 k?<color>!\n<color=yellow>Ph莕 thng<color>: <color=yellow>ф Hi謕 Tam Thng Bao<color>(M? ra nh薾 頲: v? kh? c bi謙, danh v鋘g, m藅 t辌h, h閜 qu? c? c秈 nh?, Ph竜 hoa a tin. C? th? nh薾 頲: B秐 v? binh kh? m玭 ph竔, G鉯 Thi猲 Th筩h, N玭g Tang ph?, <color=red>Vi猰 д Gi竝<color>)!", 
		"<color=yellow>Thanh Nh蕋 S綾 V筺<color>: \n  C莕 Nh蕋 V筺 n C鰑 V筺 <color=yellow>m鏸 lo筰 1 con<color>, ngo礽 ra <color=yellow>5 con V筺 b蕋 k?<color>!\n<color=yellow>Ph莕 thng<color>: <color=yellow>ф Hi謕 Nh? Thng Bao<color>(M? ra nh薾 頲: v? kh? c bi謙, danh v鋘g, m藅 t辌h, h閜 qu? c? c秈 l韓, Ph竜 hoa a tin. C? th? nh薾 頲: B秐 v? binh kh? m玭 ph竔, G鉯 Thi猲 Th筩h, N玭g Tang ph?,  Rng s総 Nguy謙 Lng Th?, <color=red>Vi猰 д Gi竝<color>, <color=red>Vi猰 д Kh玦<color>)!", 
		"<color=yellow>Quy t綾 Чi T? H?<color>: \n   C莕 c? Йng Phong, Nam Phong, T﹜ Phong, B綾 Phong <color=yellow>m鏸 lo筰 3 con<color>, ngo礽 ra c遪 c? <color=yellow>H錸g Trung, Ph竧 T礽, B筩h B秐 <color>1 i ng蓇 nhi猲!\n<color=yellow>Ph莕 thng<color>: <color=red>ф Hi謕 Nh蕋 Thng Bao<color>(M? ra 頲: V? kh? c bi謙, danh v鋘g, M藅 t辌h, H閜 qu? c? c秈 l韓, c? th? nh薾 頲: B秐 v? binh kh? m玭 ph竔, G鉯 Thi猲 Th筩h, N玭g Tang ph?,  B秓 rng Nguy謙 Lng Th?, <color=red>3 m鉵 trang b? Vi猰 д<color>)!",
		"<color=yellow>B礽 Th莕<color>: \n   C莕 <color=yellow>336 <color> con <color=yellow>M箃 Chc b蕋 k?<color>!\n<color=yellow>Ph莕 thng<color>: <color=red>ф Hi謕 Nh蕋 Thng Bao<color>(M? ra 頲: V? kh? c bi謙, danh v鋘g, M藅 t辌h, H閜 qu? c? c秈 l韓. C? th? nh薾 頲: B秐 v? binh kh? m玭 ph竔, G鉯 Thi猲 Th筩h, N玭g Tang ph?, B秓 rng Nguy謙 Lng Th?, <color=red>3 m鉵 trang b? Vi猰 д<color>)!"
	}
	Talk(1,"",Npc_name[floor(map_ID/100)].."\n"..tb_mah_jong_suc_rule[suc_way])
end
--**********************************麻将来历******************************
function what_is_mah_jong()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_1",Npc_name[floor(map_ID/100)].."<color=yellow>M箃 Chc<color> v鑞 c? t猲 l? <color=yellow>M箃 Tng<color>, M箃 l? <color=yellow>108<color> v? h秓 h竛 c馻 Th駓 H? truy謓. c? ngi t猲 <color=green>V筺 B豱h 襲<color> r蕋 s飊g b竔 h秓 h竛 Lng S琻 B筩,  ph竧 minh ra c? <color=yellow>M箃 Chc<color>, 甧m 108 Anh h飊g h鉧 th﹏ v祇 tr? ch琲. M箃 Chc c? t鎛g c閚g <color=yellow>108<color> qu﹏ b礽, v? nh? <color=yellow>108<color> v? h秓 h竛. Trong b礽 c? <color=yellow>C鰑 襲<color> v? nh? <color=green>C鰑 襲 Long S? Ti課<color>, <color=yellow>Nh? 襲<color> v? nh? <color=green>Song Ti猲 H? Di猲 Chc<color>, <color=yellow>Nh蕋 B輓h<color> v? nh? <color=green>H綾 Ti襫 Phong L? Qu?<color>.")
end
function what_is_mah_jong_1()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_2",Npc_name[floor(map_ID/100)].."T鎛g c玭g chia l祄 <color=yellow>V筺, B輓h. 襲<color> 3 lo筰, l? h礽 ﹎ t猲 h? c馻 m鏸 ngi. M鏸 lo筰 t? 1 n 9 m鏸 lo筰 c? 4 t蕀 b礽,  v鮝 ng <color=yellow>108<color> con b礽. <color=yellow>108<color> v? h秓 h竛 h閕 t? Lng S琻 t? 8 phng 4 hng, cho n猲 c閚g th猰 <color=yellow>Йng T﹜ Nam B綾 Trung<color> 5 hng th猰 4 qu﹏ b礽 t鎛g c閚g <color=yellow>20 qu﹏ b礽<color>. C竎 v? h秓 h竛 xu蕋 th﹏ t? t莕g l韕 kh竎 nhau cho n猲 c閚g th猰 <color=yellow>Trung, Ph竧, B筩h<color> v? nh? t莕g l韕 c馻 h?, c閚g th猰 8 qu﹏ b礽 n祔 t鎛g c閚g  c? <color=yellow>136<color> qu﹏ b礽.")
end
function what_is_mah_jong_2()
	local map_ID = GetWorldPos()
	Talk(1,"",Npc_name[floor(map_ID/100)].."Sau  l筰 c閚g th猰 4 lo筰 Hoa b礽 t鎛g c閚g  c? <color=yellow>144<color> qu﹏ b礽. Цnh M箃 Chc d飊g b祅 c? 4 hng Йng T﹜ Nam B綾, c騨g l? ch? 4 m颽 xu﹏ h? thu ng, m鏸 ngi <color=yellow>13 qu﹏ b礽<color> b雐 v? m鏸 qu? c? <color=yellow>13 tu莕 <color>. 4 m颽 h頿 l筰 l? <color=yellow>52<color> tu莕, t鎛g c閚g <color=yellow>364 ng祔<color>, c閚g th猰 <color=yellow>1 qu﹏ b礽<color> gi? d?, t鎛g c閚g c? <color=yellow>365 ng祔<color>, v鮝 ng 1 n╩. ")
end
--**********************************活动简述******************************
function mah_jong_task_inf()
	local map_ID = GetWorldPos()
	Talk(1,"",Npc_name[floor(map_ID/100)].."<color=yellow>Hi猲 Vi猲 m玭<color> ta v鑞 l? t? ch鴆 t藀 h頿 nhi襲 con b筩 s飊g b竔 <color=green>Hi猲 Vi猲 i hi謕<color>, m鏸 n╩ u t? ch鴆 cu閏 thi ф Th莕  tng nh? <color=green>Hi猲 Vi猲 i hi謕<color>. B籲g h鱱 c? th阨 gian c? th? t譵 1 qu﹏ b礽 t鑤 n ch? ta, ta s? c╪ c? s? qu﹏ b礽 thu th藀 頲  t苙g <color=yellow>ph莕 thng<color> tng 鴑g.")
end
--**********************************胡牌对话******************************
function mah_jong_suc_list()
	local date_chk = labor_day_2007_date_chk()
	local map_ID = GetWorldPos()
	if date_chk == -1 then				--活动时间判断
		Talk(1,"mah_jong_task_inf",Npc_name[floor(map_ID/100)].."Cu閏 thi ф Th莕 tranh b? v蒼 ch璦 ch輓h th鴆 b総 u. b籲g h鱱 c? th? xem thuy誸 minh li猲 quan ho箃 ng")
		return
	elseif date_chk == 0 then			--胡牌列表
		Say(Npc_name[floor(map_ID/100)].."Kh玭g bi誸 <color=yellow>"..Zgc_pub_sex_name().."<color>C? b礽 n祇 hay?",
			7,
			"Ta mu鑞 ch鋘 B譶h H?/#mah_jong_suc_dtm(1)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 уng/#mah_jong_suc_dtm(2)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 襲/#mah_jong_suc_dtm(3)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 V筺/#mah_jong_suc_dtm(4)",
			"Ta mu鑞 ch鋘 Чi T? H?/#mah_jong_suc_dtm(5)",
			"Ta mu鑞 ch鋘 B礽 Th莕/#mah_jong_suc_dtm(6)",
			"Ta v蒼 ch璦 chu萵 b?/end_dialog"
		)
	else
		Say(Npc_name[floor(map_ID/100)].."<color=yellow>Cu閏 thi х Th莕 tranh b? <color><color=red> k誸 th骳<color> nh璶g ph莕 thng v蒼 c? th? i b譶h thng, b籲g h鱱 mu鑞 i thng <color=red>h穣 nhanh l猲<color> k蝟 h誸 c? h閕.",
			7,
			"Ta mu鑞 ch鋘 B譶h H?/#mah_jong_suc_dtm(1)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 уng/#mah_jong_suc_dtm(2)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 襲/#mah_jong_suc_dtm(3)",
			"Ta mu鑞 ch鋘 Thanh Nh蕋 S綾 V筺/#mah_jong_suc_dtm(4)",
			"Ta mu鑞 ch鋘 Чi T? H?/#mah_jong_suc_dtm(5)",
			"Ta mu鑞 ch鋘 B礽 Th莕/#mah_jong_suc_dtm(6)",
			"Ta v蒼 ch璦 chu萵 b?/end_dialog"
		)
	end
end
--********************************胡牌确认********************************
function mah_jong_suc_dtm(suc_seq)
	local map_ID = GetWorldPos()
	local mah_jong_suc_dia = {
		Npc_name[floor(map_ID/100)].."<color=yellow>B譶h H?<color> ch? c莕 <color=yellow>14<color> con b礽 b蕋 k? u c? th? i, ph莕 thng l?: <color=yellow>14 ф Hi謕 Ng? Thng Bao<color>. Con b礽 n祇 ngi kh玭g mu鑞 n閜 c? th? gi? l筰!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh蕋 S綾 (Th飊g)<color> c莕 Nh蕋 уng n C鰑 уng <color=yellow>m鏸 lo筰 1 con<color>, ngo礽 ra<color=yellow>5 con уng T? b蕋 k?<color> t鎛g c閚g <color=yellow>14 con уng T?<color>!\n   Ph莕 thng l?: <color=yellow>ф Hi謕 T? Thng Bao<color>. Con b礽 n祇 ngi kh玭g mu鑞 n閜 c? th? gi? l筰!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh蕋 S綾 <color>c莕 1 n 9<color=yellow> m鏸 lo筰 1 con<color>, mgo礽 ra <color=yellow>5 con b蕋 k?<color> t鎛g c閚g, <color=yellow>14 con<color>!\n   Ph莕 thng: <color=yellow>ф Hi謕 Tam Thng Bao<color>. Con b礽 n祇 ngi kh玭g mu鑞 n閜 c? th? gi? l筰!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh Nh蕋 S綾 V筺 <color>c莕 Nh蕋 V筺 n C鰑 V筺 <color=yellow>m鏸 lo筰 1 con<color>, ngo礽 ra<color=yellow>b蕋 k? 5 con<color> t鎛g c閚g <color=yellow>14 con v筺<color>!\n   Ph莕 thng: <color=yellow>ф Hi謕 Nh? Thng Bao<color>. Con b礽 n祇 ngi kh玭g mu鑞 n閜 c? th? gi? l筰!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Чi T? H?<color> c莕 c? Йng Phong, Nam Phong, T﹜ Phong, B綾 Phong <color=yellow>m鏸 lo筰 3 con<color>, ngo礽 ra c遪 c? <color=yellow>H錸g Trung, Ph竧 T礽, B筩h B秐<color> m鏸 lo筰 1 c苝, t鎛g c閚g <color=yellow>14 t蕀 b礽 ch?<color>!\n Ph莕 thng: <color=red>ф Hi謕 Nh蕋 Thng Bao<color>.Con b礽 n祇 ngi kh玭g mu鑞 n閜 c? th? gi? l筰!",
		Npc_name[floor(map_ID/100)].."<color=yellow>B礽 Th莕<color> c莕 <color=yellow>336<color> con b礽 th? c? th? i!\n Ph莕 thng l?: <color=red>ф Hi謕 Nh蕋 Thng Bao<color>",
	}
	Say(mah_jong_suc_dia[suc_seq],
	2,
	"Ta mu鑞 i ph莕 thng/#mah_jong_num_chk("..(suc_seq-1)..")",		--进入数量检测
	"в ta chu萵 b? th猰/end_dialog"
	)
end
--********************************麻将检测*****************************
function mah_jong_num_chk(color_diff)
--数据准备
	local map_ID = GetWorldPos()
	local npc_name = Npc_name[floor(map_ID/100)]
--------------------------------------数量检测--------------------------------------
	local mah_jong_id_start = 0
	local mah_jong_id_end = 0
	if color_diff == 0 or color_diff == 5 then			--定义麻将数量的开始计算ID和结束计算ID
		mah_jong_id_start = start_seq[1][1]
		mah_jong_id_end = start_seq[4][2]
	else
		mah_jong_id_start = start_seq[color_diff][1]
		mah_jong_id_end = start_seq[color_diff][2]
	end
	local mah_jong_count = 0		--定义总的麻将数
	for i = mah_jong_id_start,mah_jong_id_end do
		mah_jong_count = mah_jong_count + GetItemCount(2,0,i)
	end
	if (color_diff ~= 5 and mah_jong_count < 14) or (color_diff == 5 and mah_jong_count < 336) then
		Talk(1,"",npc_name.."B筺 h穣 x竎 nh薾 trong t骾 c? <color=yellow> s? lng M箃 chc<color> ph? h頿 quy t綾!")
		return
	end
--------------------------------------规则检测--------------------------------------
	--开始检测
	if color_diff ~= 0 and color_diff ~= 5 then		--平胡和牌神不需要规则检测
		if color_diff ~= 4 then						--检测同种花色1-9各一张
			for i = start_seq[color_diff][1],start_seq[color_diff][2] do
				if GetItemCount(2,0,i) < 1 then
					Talk(1,"",npc_name.."B筺 h穣 x竎 nh薾 trong t骾 c? <color=yellow>con b礽<color>  kh玭g!")
					return
				end
			end
		else
			for i = start_seq[4][1],(start_seq[4][1]+3) do	--检测四风各三张
				if GetItemCount(2,0,i) < 3 then
					Talk(1,"",npc_name.."B筺 x竎 nh薾 trong t骾 c? Йng Phong, Nam Phong, T﹜ Phong, B綾 Phong m鏸 lo筰 <color=yellow>3 con b礽<color>!")
					return
				end
			end
			local double_chk = 0 							--对子检测标志
			for i = (start_seq[4][1]+4),start_seq[4][2] do
				if GetItemCount(2,0,i) >= 2 then
					double_chk = 1
					break
				end
			end
			if double_chk == 0 then
				Talk(1,"",npc_name.."Xin x竎 nh薾 trong h祅h trang c? <color=yellow>1 c苝<color> H錸g Trung ho芻 Ph竧 T礽 ho芻 B筩h B秐!")
				return
			end
		end
	end
-------------------------------------包裹空间检测--------------------------------
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
--------------------------------------删除检测--------------------------------------
	local del_chk = 0
	local del_remain_num = 14		--需要删除14张麻将
	if color_diff == 0 or color_diff == 5 then
		if color_diff == 5 then
			del_remain_num = 336
		end
		for i = mah_jong_id_start,mah_jong_id_end do
			local mah_jong_num = GetItemCount(2,0,i)
			if mah_jong_num ~= 0 then
				local del_num = min(mah_jong_num,del_remain_num)
				if DelItem(2,0,i,del_num) == 1 then
					del_remain_num = del_remain_num - del_num
				end
			end
			if del_remain_num <= 0 then
				break
			end
		end
	elseif color_diff >= 1 and color_diff <= 3 then
		del_remain_num = 5						--除一到九万另外需要删除5张
		for i = start_seq[color_diff][1],start_seq[color_diff][2] do		--逻辑比较复杂
			local mah_jong_num = GetItemCount(2,0,i)
			local del_num = min(mah_jong_num,(del_remain_num + 1))
			if DelItem(2,0,i,del_num) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - (del_num - 1)
		end
	elseif color_diff == 4 then
		del_remain_num = 5
		for i = start_seq[4][1],(start_seq[4][1]+3) do	--删除四风各三张
			if DelItem(2,0,i,3) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - 1
		end
		for i = (start_seq[4][1]+4),start_seq[4][2] do	--删除对子
			if GetItemCount(2,0,i) >= 2 then
				if DelItem(2,0,i,2) == 1 then
					del_remain_num = del_remain_num - 1
					break
				end
			end
		end
	end
	if del_remain_num > 0 then			--删除失败
		Talk(1,"",npc_name.."Xin x竎 nh薾 M箃 chc trong t骾 ph? h頿 quy t綾 y猽 c莡!")
		return
	end
--------------------------------------- 奖励给于-------------------------------------
	if color_diff == 0 then
		local add_flag = AddItem(2,1,1112,14)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 14 ф Hi謕 Ng? Thng Bao!")
		end
	else
		local add_flag = AddItem(2,0,mah_jong_prize_bag[color_diff][1],1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..mah_jong_prize_bag[color_diff][2].."!")
			if color_diff == 4 or color_diff == 5 then
				Msg2SubWorld("Ngi ch琲:"..GetName().."N閜 qu﹏ b礽 i 鴑g! Nh薾 頲"..mah_jong_prize_bag[color_diff][2].."!")
			end
			WriteLog("Ngi ch琲:"..GetName().."Nh薾 頲:"..mah_jong_prize_bag[color_diff][2])
		else
			WriteLog("Ho箃 ng M筩 Chc, Ngi ch琲:"..GetName().."Nh薾 頲"..mah_jong_prize_bag[color_diff][2].."T╪g th猰 th蕋 b筰, k? hi謚"..add_flag)
		end	
	end
end
