--2007年春节活动-麻将收集活动-物品使用函数
--代码开发人：赵贵春
--代码开发时间：2007-01-24
--代码修改记录：2008-04-11 by 墨仙
Include("\\script\\online\\zgc_public_fun.lua")		--村长的公共函数
Include("Script\\Online\\\laborday08\\mah_jong_head.lua")
Include("Script\\Lib\\lingshi_head.lua")
--==========================公共变量定义区域=============================
	--特殊麻将ID：624
	random_mah_jong_id = 664
	--麻将ID序列表
	start_seq = {
		{630,638},
		{639,647},
		{648,656},
		{657,663},
		}
	--麻将包
	mah_jong_bag = {{665,8,"T骾 M筩 Chc (ti觰)"},{666,14,"T骾 M筩 Chc (i)"}} --ID，张数
	--麻将活动奖励包
	--mah_jong_prize_bag = {{667,200,"赌侠一奖包"},{668,200,"赌侠二奖包"},{669,200,"赌侠三奖包"},{670,200,"赌侠四奖包"}}
	--麻将奖励包对应奖励
	Tb_mah_jong_bag_prize = {
		--名称----------------------ID---空间-负重-声望-大匠师手书-76武器-农桑辑要-炎帝盔甲靴-师门碎片-打包陨铁-萝卜礼盒-传信烟火-铁宝箱
		-------------1---------------2------3-------4----5-----6------7----8---------9-----10---11-------12----13--14--------15--16------------17-18---19-20--------21-
		{"Con b礽 甧m cc",667,25,700,200,300,5,10,	10,	50,	100,100,50,60,	3,50,	1095,2,0,25,"\n 100%: 10 m鉵 v? kh? c蕄 76, danh v鋘g 200-300 甶觤, 5 quy觧 m藅 t辌h, 2 h閜 qu? c? c秈 l韓 \n 60%: 1-3 t蕀 b秐 v? v? kh? m玭 ph竔\n 50%: G鉯 Thi猲 Th筩h, N玭g Tang ph鎈n 25%: <color=red>Rng s総 Nguy謙 Lng Th?<color>\n 10%: <color=red>Vi猰 д Gi竝<color>\n 10%: <color=red>Vi猰 д Kh玦<color>\n  5%: <color=red>Vi猰 д Trang<color>"},
		{"Con b礽 2 甧m cc",668,20,600,100,200,4,8,	8,	30,	30,	30,	0,30,	3,25,	1095,1,3,10,"\n 100%: 8 m鉵 v? kh? c蕄 76, danh v鋘g 100-200 甶觤, 4 quy觧 m藅 t辌h, 1 h閜 qu? c? c秈 l韓, 3 Ph竜 hoa a tin\n 30%: 1-3 t蕀 b秐 v? v? kh? m玭 ph竔, N玭g Tang ph鎈n 25%: G鉯 Thi猲 Th筩h\n 10%: <color=red>Rng s総 Nguy謙 Lng Th?<color>\n  3%: <color=red>Vi猰 д Gi竝<color>\n  3%: <color=red>Vi猰 д Kh玦<color>"},
		{"Con b礽 3 甧m cc",669,15,400,50,80,	2,4,	4,	20,	0,	6,	0,5,	2,10,	1094,8,2,0,"\n 100%: 4 m鉵 v? kh? c蕄 76, danh v鋘g 50-80 甶觤, 2 quy觧 m藅 t辌h, 8 h閜 qu? c? c秈 nh?, 2 Ph竜 hoa a tin\n 10%: G鉯 Thi猲 Th筩h, N玭g Tang ph鎈n 5%: 1-2 t蕀 b秐 v? v? kh? m玭 ph竔 \n   0.6%: <color=red>Vi猰 д Gi竝<color>"},
		{"Con b礽 4 甧m cc",670,11,300,20,30,	1,2,	2,	5,	0,	3,	0,1,	1,5,	1094,5,1,0,"\n 100%: 2 m鉵 v? kh? c蕄 76, danh v鋘g 20-30 甶觤, 1 quy觧 m藅 t辌h, 5 h閜 qu? c? c秈 nh?, 1 Ph竜 hoa a tin\n  5%: G鉯 Thi猲 Th筩h, N玭g Tang ph鎈n  1%: b秐 v? v? kh? m玭 ph竔\n 0.3%: <color=red>Vi猰 д Gi竝<color>"},
	}
	--所有麻将初始化
	mah_jong = {
			"Nh蕋 ng","Nh? ng","Tam ng","T? ng","Ng? ng","L鬰 ng","Th蕋 ng","B竧 ng","C鰑 ng",
			"M閠","Nh? 甶襲","Ba","B鑞","Ng? 甶襲","L鬰 甶襲","Th蕋 甶襲","B竧 甶襲","C鰑 甶襲",
			"Nh蕋 v筺","Nh? v筺","Tam v筺","T? v筺","Ng? v筺","L鬰 v筺","Th蕋 v筺","B竧 v筺","C鰑 v筺",
			"Йng phong","Nam phong","T﹜ phong","B綾 phong","H錸g trung","ph竧 t礽","B筩h ban"}
	--特殊麻将ID
	spec_mahj_id_start = 1108
	spec_mahj_id_end = 1111
	mah_jong_prize_shoe = 1215
	--赌侠五奖包
	mahj_prize_5th = {1112,"<color=yellow>Danh s竎h ph莕 thng<color>: \n 100%: <color=yellow>20<color> ti襫 V祅g\n 50%: H閜 qu? c? c秈 nh醆n  5%: M藅 t辌h\n  1.5%: Bao m秐h Thi猲 Th筩h ho芻 H遖 Th? B輈h\n 0.5%: <color=red>B秓 rng trang b? T祅g Ki誱 ng蓇 nhi猲<color>"}
	--麻将相关可以使用标志
	mah_jong_use_flag = 1			--五一节后一个版本关闭
--==============================主逻辑区域===============================
function OnUse(goods_index)
	if get_laborday08_award_state() ~= 1 then--判断是否在活动开放期间
		Talk(1,"end_dialog","V藅 ph萴 n祔 ch? s? d鬾g trong th阨 gian di詎 ra ho箃 ng <color=yellow>1/5<color>!")
		return
	end
	if Zgc_pub_action_level_chk() == 0 then
		return
	end
	if mah_jong_use_flag ~= 1 then
		Talk(1,"end_dialog","V藅 ph萴 n祔 ch? s? d鬾g trong th阨 gian di詎 ra ho箃 ng <color=yellow>1/5<color>!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--单个麻将换取奖励
	if goods_id >= start_seq[1][1] and goods_id <= start_seq[4][2] then
		Say("<color=green>Nh綾 nh?<color>: B筺 mu鑞 d飊g 1 M箃 chc i thng?\n<color=yellow>Ph莕 thng<color>:\n    B譶h phng ng c蕄*10 甶觤 kinh nghi謒, t? l? 20% nh薾 頲 1 Linh th筩h c蕄 1-7, t v祇 T? Linh nh, t? l? gi鑞g t骾 b秓 th筩h. N誹 ngi ch琲 c蕄 99 s? nh薾 頲 1 Linh th筩h c蕄 1-7, t v祇 T? Linh nh, t? l? gi鑞g t骾 b秓 th筩h.",
		2,
		"Ta mu鑞 i ph莕 thng/#single_mahj_pri("..goods_id..")",
		"в ta suy ngh? l筰/end_dialog"
		)
		return
	--麻将包兑换奖励
	elseif goods_id == mah_jong_bag[1][1] or goods_id == mah_jong_bag[2][1] then
		local bag_diff = (goods_id + 1) - mah_jong_bag[1][1]
		Say("<color=green>Nh綾 nh?<color>: B筺 x竎 nh薾 mu鑞 s? d鬾g: <color=green>".. mah_jong_bag[bag_diff][3].."<color> i <color=green>".. mah_jong_bag[bag_diff][2].."<color> M筩 chc ??",
		2,
		"фi/#mah_jong_bag_chg("..bag_diff..")",
		"в ta suy ngh? l筰/end_dialog")
	--麻将奖励包换取奖励
	elseif goods_id >= Tb_mah_jong_bag_prize[1][2] and goods_id <= Tb_mah_jong_bag_prize[4][2] then  	
		local prize_diff = (goods_id + 1) - Tb_mah_jong_bag_prize[1][2]
		Say("<color=green>Nh綾 nh?<color>: B筺 x竎 nh薾 mu鑞 s? d鬾g:<color=green>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>фi ph莕 thng kh玭g? \n<color=yellow>Danh s竎h ph莕 thng<color>:"..Tb_mah_jong_bag_prize[prize_diff][21],
			2,
			"Ta c莕 i ph莕 thng/#mah_jong_prize("..prize_diff..")",
			"в ta suy ngh? l筰/end_dialog"
		)
	--麻将一张的使用
	elseif goods_id == random_mah_jong_id then
		--麻将一张删除检测
		if DelItem(2,0,random_mah_jong_id,1) ~= 1 then
			Talk(1,"","<color=green>Nh綾 nh?<color>: Xin x竎 nh薾 trong h祅h trang c? <color=yellow>1 qu﹏ b礽<color>!")
			return
		else
			--通用麻将概率 传入参数为：概率。单位：千分比。比如传入50 表示5%获得
			add_mahjong_prob(1000)
		end
	elseif goods_id >= spec_mahj_id_start and goods_id <= spec_mahj_id_end then
		local special_mahj_diff = goods_id - 1107
		mah_jong_chg(special_mahj_diff)
	--赌侠五奖包
	elseif goods_id == mahj_prize_5th[1] then
		Say("<color=green>Nh綾 nh?<color>: B筺 x竎 nh薾 mu鑞 s? d鬾g <color=yellow>ф Hi謕 Ng? Thng Bao<color>!\n"..mahj_prize_5th[2],
		2,
		"фi/mah_jong_przie_5",
		"в ta suy ngh? l筰/end_dialog"
		)
	end
end
--**************************单个麻将换取奖励************************
function single_mahj_pri(goods_id)
	if GetTask(TASK_MJ_SINGLE_PRIZE) >= 1000 then--领取奖励限制
		Msg2Player("S? l莕 i t蕀 M箃 chc l蕐 ph莕 thng t鑙 產 l? 1000 l莕! B筺  nh薾 h琻 1000 l莕!")
		return
	end
	if DelItem(2,0,goods_id,1) == 1 then
		SetTask(TASK_MJ_SINGLE_PRIZE,GetTask(TASK_MJ_SINGLE_PRIZE) + 1)
		if GetLevel() ~= 99 then
			local nexp = GetLevel()*GetLevel()*10
			ModifyExp(nexp)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..nexp.." 甶觤 kinh nghi謒!")
			local nLingShi = random(1,5)--20%几率获得灵石
			if nLingShi == 1 then
				laborday08_baoshi_prob("S? d鬾g 1 t蕀 M箃 chc")
			end
		else
			laborday08_baoshi_prob("S? d鬾g 1 t蕀 M箃 chc")
		end
		Msg2Player("B筺 c? th? nh薾 ph莕 thng m閠 t蕀 M箃 chc"..1000 - GetTask(TASK_MJ_SINGLE_PRIZE).."l莕 n鱝 th玦 nh?!")
	else
		WriteLog("Ho箃 ng 1-5: Ngi ch琲"..GetName().."X鉧 t蕀 M箃 chc th蕋 b筰.")
	end
end
--***************************麻将包换麻将********************************
function mah_jong_bag_chg(bag_diff)
	if GetItemCount(2,0,mah_jong_bag[bag_diff][1]) == 0 then
		Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c?: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
		return
	end
	if DelItem(2,0,mah_jong_bag[bag_diff][1],1) ~= 1 then
		Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c馻 b筺 c?: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
		return
	else
		for j = 1,mah_jong_bag[bag_diff][2] do
			add_mahjong_prob(1000)
			--通用麻将概率 传入参数为：概率。单位：千分比。比如传入50 表示5%获得
		end
	end
end
--**************************特殊麻将换取对话*****************************
function mah_jong_chg(mah_jong_diff)
	local mah_jong_id = {{start_seq[1][1],9,1},{start_seq[2][1],9,10},{start_seq[3][1],9,19},{start_seq[4][1],7,28}}
	local mah_jong_chg_dia = {}
	for i = 1, mah_jong_id[mah_jong_diff][2] do
		mah_jong_chg_dia[i]="Ta c莕 i ("..mah_jong[(mah_jong_id[mah_jong_diff][3]-1)+i]..")/#mah_jong_add("..(mah_jong_id[mah_jong_diff][1] - 1 + i)..","..mah_jong_diff..")"
	end
	mah_jong_chg_dia[mah_jong_id[mah_jong_diff][2] + 1] = "в ta suy ngh? l筰/end_dialog"
	Say("B筺 h穣 ch鋘 qu﹏ b礽 mu鑞 i l蕐.",
		getn(mah_jong_chg_dia),
		mah_jong_chg_dia
	)	
end
--***************************特殊麻将换取****************************
function mah_jong_add(goods_id,color_diff)
	local special_mahj_ID = (1107 + color_diff)
	if GetItemCount(2,1,special_mahj_ID) == 0 then
		Talk(1,"end_dialog","B筺 h穣 x竎 nh薾 trong h祅h trang c? <color=yellow>Qu﹏ b礽 c bi謙<color>!")
		return
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then			--负重判断
			return
		end
		if DelItem(2,1,special_mahj_ID,1) ~= 1 then	--删除特殊麻将成功判断
			Talk(1,"end_dialog","Xin x竎 nh薾 trong h祅h trang c? <color=yellow>1 qu﹏ b礽 M箃 chc<color>!")
			return
		else
			local add_flag = AddItem(2,0,goods_id,1)
			if add_flag == 1 then
				Msg2Player("Ch骳 m鮪g b筺 i 頲 1 qu﹏ b礽 c bi謙"..mah_jong[goods_id - start_seq[1][1] +1].."!")
			else
				WriteLog ("Ngi ch琲:"..GetName().."D飊g con b礽 c bi謙 i"..mah_jong[goods_id - start_seq[1][1] +1].."Th蕋 b筰!")
			end
		end
	end
end
--*************************麻将奖励包换取奖励************************
function mah_jong_prize(prize_diff)
	--物品判断
	if GetItemCount(2,0,Tb_mah_jong_bag_prize[prize_diff][2]) == 0 then	
		Talk(1,"","<color=green>Nh綾 nh?<color>: Xin x竎 nh薾 trong h祅h trang c?<color=yellow>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>!")
		return
	end
	--负重和空间判断
	if Zgc_pub_goods_add_chk(Tb_mah_jong_bag_prize[prize_diff][3],Tb_mah_jong_bag_prize[prize_diff][4]) ~= 1 then
		return
	end
	--删除物品成功判断
	if DelItem(2,0,Tb_mah_jong_bag_prize[prize_diff][2],1) ~= 1 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: Xin x竎 nh薾 trong h祅h trang c?<color=yellow>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>!")
		return	
	end
	--增加声望
	ModifyReputation(random(Tb_mah_jong_bag_prize[prize_diff][5],Tb_mah_jong_bag_prize[prize_diff][6]),0)
	--增加炎帝装
	local palyer_bady = GetBody()
	if random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][11] then
		local yandi_att_cap = {
			{0,103,8001},
			{0,103,8002},
			{0,103,8003},
			{0,103,8004},
		}
		local add_flag = AddItem(yandi_att_cap[palyer_bady][1],yandi_att_cap[palyer_bady][2],yandi_att_cap[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 Vi猰 д Kh玦!")
			Msg2SubWorld("Ch骳 m鮪g ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 Vi猰 д Kh玦!")
			WriteLog("Ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 Vi猰 д Kh玦!")
		else
			WriteLog("Ho箃 ng 1/5: Ngi ch琲 "..GetName().."T╪g th猰 Vi猰 д Kh玦 th蕋 b筰, k? hi謚:"..add_flag)
		end
	elseif random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][12] then
		local yandi_att_cloth = {
			{0,100,8001},
			{0,100,8002},
			{0,100,8003},
			{0,100,8004},		
		}
		local add_flag = AddItem(yandi_att_cloth[palyer_bady][1],yandi_att_cloth[palyer_bady][2],yandi_att_cloth[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 Vi猰 д Gi竝!")
			Msg2SubWorld("Ch骳 m鮪g ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 Vi猰 д Gi竝!")
			WriteLog("Ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 Vi猰 д Gi竝!")
		else
			WriteLog("Ho箃 ng 1/5: Ngi ch琲 "..GetName().."T╪g th猰 Vi猰 д Gi竝 th蕋 b筰, k? hi謚:"..add_flag)
		end
	elseif random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][13] and GetTask(mah_jong_prize_shoe) ~= 1 then
		local yandi_att_shoe = {
			{0,101,8001},
			{0,101,8002},
			{0,101,8003},
			{0,101,8004},
		}
		local add_flag = AddItem(yandi_att_shoe[palyer_bady][1],yandi_att_shoe[palyer_bady][2],yandi_att_shoe[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			SetTask(mah_jong_prize_shoe,1)
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 Vi猰 д Trang!")
			Msg2SubWorld("Ch骳 m鮪g ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 Vi猰 д Trang!")
			WriteLog("Ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 Vi猰 д Trang!")
		else
			WriteLog("Ho箃 ng 1/5: Ngi ch琲 "..GetName().."T╪g th猰 Vi猰 д Trang th蕋 b筰, k? hi謚:"..add_flag)
		end
	end
	--大匠师手书
	AddItem(2,0,397,Tb_mah_jong_bag_prize[prize_diff][7])
	--农桑辑要
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][10] then
		local add_flag = AddItem(2,1,1056,1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 N玭g Tang ph?!")
			Msg2SubWorld("Ch骳 m鮪g ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 N玭g Tang ph?!")
		else
			WriteLog("Ho箃 ng 1/5: Ngi ch琲 "..GetName().."T╪g th猰 N玭g Tang ph? th蕋 b筰, k? hi謚:"..add_flag)
		end	
	end
	--师门武器碎片
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][14] then
		local add_ran_num = random(1,Tb_mah_jong_bag_prize[prize_diff][15])
		local add_flag = AddItem(2,1,1086,add_ran_num)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..add_ran_num.." B秐 v? c t筼 th莕 kh?!")
			Msg2SubWorld("Ch骳 m鮪g ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 "..add_ran_num.." B秐 v? c t筼 th莕 kh?!")
		else
			WriteLog("Ho箃 ng 1/5: Ngi ch琲 "..GetName().."T╪g"..add_ran_num.." B秐 v? c t筼 th莕 kh?  th蕋 b筰, k? hi謚:"..add_flag)
		end
	end
	--打包陨铁
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][16] then
		local add_flag = AddItem(2,1,1050,1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 G鉯 Thi猲 Th筩h!")
			Msg2SubWorld("Ch骳 m鮪g ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 g鉯 Thi猲 Th筩h!")
		else
			WriteLog("Ho箃 ng 1/5: Ngi ch琲 "..GetName().."T╪g G鉯 Thi猲 Th筩h th蕋 b筰, k? hi謚:"..add_flag)
		end
	end
	--萝卜礼盒
	AddItem(2,1,Tb_mah_jong_bag_prize[prize_diff][17],Tb_mah_jong_bag_prize[prize_diff][18])
	--传信烟火
	if Tb_mah_jong_bag_prize[prize_diff][19] ~= 0 then
		AddItem(2,1,203,Tb_mah_jong_bag_prize[prize_diff][19])
	end
	--铁宝箱
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][20] then
		local add_flag = AddItem(2,0,606,1)
		if add_flag == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 Rng s総 Nguy謙 Lng Th?!")
			Msg2SubWorld("Ch骳 m鮪g ngi ch琲:"..GetName().."s? d鬾g"..Tb_mah_jong_bag_prize[prize_diff][1].."Nh薾 頲 Rng s総 Nguy謙 Lng Th?!")
		else
			WriteLog("Ho箃 ng 1/5: Ngi ch琲 "..GetName().."T╪g th猰 Rng s総 Nguy謙 Lng Th? th蕋 b筰, k? hi謚:"..add_flag)
		end
	end
	--增加76级未开锋武器
	mah_jong_bag_prize_weapon(Tb_mah_jong_bag_prize[prize_diff][8])
end
--**********************未开锋的武器增加**************************
function mah_jong_bag_prize_weapon(num)
	for i = 1,num do
		local weapon_id =random(375,(375+11))
		local add_flag = AddItem(2,1,weapon_id,1)
		if add_flag ~= 1 then
			WriteLog("Ho箃 ng 1/5/2007: Ngi ch琲:"..GetName().."t╪g v? kh? ["..weapon_id.."] th蕋 b筰, v? tr? th蕋 b筰:"..add_flag)
		end
	end
	Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 "..num.."V? kh? ch璦 k輈h ho箃")
	return
end
--************************赌侠五奖包奖励******************************
function mah_jong_przie_5()
	--物品携带检测
	if GetItemCount(2,1,1112) == 0 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: H穣 x竎 nh薾 b筺 c? mang theo <color=yellow>ф Hi謕 ng? thng bao<color>!")
		return
	end
	--包裹负重空间检测
	if Zgc_pub_goods_add_chk(5,100) ~= 1 then
		return
	end
	--物品删除检测
	if DelItem(2,1,1112,1) ~= 1 then
		Talk(1,"","<color=green>Nh綾 nh?<color>: H穣 x竎 nh薾 b筺 c? mang theo <color=yellow>ф Hi謕 ng? thng bao<color>!")
		return
	end
--奖励增加
	--增加金币
	Earn(200000)
	--增加萝卜小礼盒
	if random(1,100) <= 50 then
		if AddItem(2,1,1094,1) == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 H閜 qu? c? c秈 nh?!")
		end
	end
	--增加大匠师手书
	if random(1,100) <= 5 then
		if AddItem(2,0,397,1) == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 Чi tng s? th? th?")
		end
	end
	--增加打包的陨铁碎片或和氏璧
	if random(1,100) == 1 then
		if AddItem(2,1,1049,1) == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲 G鉯 m秐h Thi猲 Th筩h!")
			Msg2SubWorld("Ngi ch琲:"..GetName().."di y l? danh s竎h h? b礽, b筺 mu鑞 bi誸 phng ph竝 h? b礽 n祇?")
		end	
	elseif random(1,1000) <= 5 then
		if AddItem(2,1,1001,1) == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲H遖 Th? B輈h!")
			Msg2SubWorld("Ngi ch琲:"..GetName().."S? d鬾g ф Hi謕 ng? thng bao nh薾 頲 1 H遖 Th? B輈h!")
		end		
	end
	--增加藏剑装备
	if random(1,1000) <= 1 then
		if AddItem(2,1,random(1059,1063),1) == 1 then
			Msg2Player("Ch骳 m鮪g b筺 nh薾 頲T骾 trang b? T祅g Ki誱!")
			Msg2SubWorld("Ngi ch琲:"..GetName().."S? d鬾g ф Hi謕 ng? thng bao nh薾 頲 1 t骾 trang b? T祅g Ki誱!")
		end
	end
end
