Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\task_access_code_def.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--随机到代币组的概率
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
        --{{"紫霞秘籍",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
        { {"C? Linh Th筩h", {2,1,30368,1}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,2}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,3}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,4}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,6}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,7}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,8}, nil,nil,{1, 100} }, 1000},
        { {"C? Linh Th筩h", {2,1,30368,9}, nil,nil,{1, 100} }, 800},
        { {"C? Linh Th筩h", {2,1,30368,10}, nil,nil,{1, 100} }, 500},
        { {"C? Linh Th筩h", {2,1,30368,15}, nil,nil,{1, 100} }, 300},
        { {"C? Linh Th筩h", {2,1,30368,20}, nil,nil,{1, 100} }, 200},
        { {"C? Linh Th筩h", {2,1,30368,30}, nil,nil,{1, 100} }, 100},
        { {"C? Linh Th筩h", {2,1,30368,40}, nil,nil,{1, 100} }, 100},
	},
	--------------------------------------------
	t_other_group = --杂物组
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
        --{{"紫霞秘籍",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        { {"Ng? H祅h Huy襫 Th筩h", {2,1,30302,1}, nil,nil,{1, 100} }, 1500},
        { {"Kh綾 b秐", {2,1,30373,1}, nil,nil,{1, 100} }, 1500},
        { {"Thi猲 M玭 Lam Dc", {1,0,30004,9}, nil,nil,{1, 100} }, 2000},
        { {"Thi猲 M玭 H錸g Dc", {1,0,30003,9}, nil,nil,{1, 100} }, 1500},
        { {"V? l﹎ b竜 m韎", {2,1,30314,1}, nil,nil,{1, 100} }, 400},
        { {"Th竛h V藅 S? M玭", {2,1,30311,1}, nil,nil,{1, 100} }, 400},
        { {"Ti觰 truy襫 c玭g n", {2,1,30312,1}, nil,nil,{1, 100} }, 400},
        { {"M秐h Tu Ch﹏ Y誹 Quy誸", {2,1,30315,1}, nil,nil,{1, 100} }, 400},
        { {"Ti觰 B筩h C﹗ ho祅", {2,1,30307,1}, nil,nil,{1, 100} }, 400},
        { {"Ti觰 Tam Thanh Ho祅", {2,1,30308,1}, nil,nil,{1, 100} }, 400},
        { {"Ti觰 L鬰 Th莕 Ho祅", {2,1,30309,1}, nil,nil,{1, 100} }, 300},
        { {"Truy襫 C玭g Кn", {2,1,30313,1}, nil,nil,{1, 100} }, 400},
        { {"B錳 Nguy猲 Кn", {2,1,30351,1}, nil,nil,{1, 100} }, 400},
	},
};

_t_free_award_stage =
{
	[1] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 3000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 10000},
        	},
		},
	[2] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 10000},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        	},
		},
	[3] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[4] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[5] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5000},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[6] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[7] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 3500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        		{{MA_GiveHaoYueEquip, {1, nil, nil, 0}}, 2000},
        	},
		},
	[8] =
		{
			n_equip_group_rate = 1000,--随机到装备组的概率
			n_daibi_group_rate = 4000,--随机到代币组的概率
        	t_equip_group = --装备组
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 2450},
        		--{{MA_GiveLevel3WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 3500},
        		{{MA_GiveHaoYueEquip, {1, nil, nil, 0}}, 4000},
        		{{MA_GiveJiuZhouEquip, {1, nil, nil, 0}}, 50},
        	},
		},
}

_t_fix_award_stage =
{
	[1] =
		{
      {MA_GiveExp, {500000}},
		},
	[2] =
		{
			{MA_GiveExp, {600000}},
		},
	[3] =
		{
			{MA_GiveExp, {700000}},
		},
	[4] =
		{
			{MA_GiveExp, {800000}},
		},
	[5] =
		{
			{MA_GiveExp, {900000}},
		},
	[6] =
		{
			{MA_GiveExp, {1000000}},
		},
	[7] =
		{
			{MA_GiveExp, {1100000}},
		},
	[8] =
		{
			{MA_GiveExp, {1200000}},
		},
}

_t_special_award = --如果有必出在这个表配置
{
	nSaveTaskId = 3080,
	nSaveTaskAccessCode = TASK_ACCESS_CODE_GUTIANMENBAOXIANG,
	nSaveTaskWordIdx = 2,
	nSureAwardCount = 600,
	nAddcounterPerUpdate=2, --每执行一次Update计数器增加值
	t_award =
	{
		{{MA_TianMenJinLing, {}}, 10000},
	},
}

_t_ib_award_no_stage =
{
	t_cost = --消耗
	{
		--{"紫霞秘籍",{0,107,65,1, 4}},
		{"Th玭g Thi猲 L謓h",{2,1,30409,2}, _stat_when_ib_consume},	
	},
	t_ib_award =--ib奖励
	{
		{{"H綾 Ng鋍 筺 T鬰 Cao",{1,0,6,1},nil,nil,{1, 100} },300},
		{{"V筺 V藅 Quy Nguy猲 Кn",{1,0,11,1},nil,nil,{1, 100} },300},
		{{"Sinh Sinh H鉧 T竛",{1,0,16,1},nil,nil,{1, 100} },300},
		{{"T骾 ti襫",{2,1,30367,1},nil,nil,{1, 100} },600},
		{{"C鰑 chuy觧 h錳 h錸 n",{1,0,32,1},nil,nil,{1, 100} },200},
		{{"C﹜ B竧 Nh? nh?",{2,0,504,1},30,nil,{1, 100} },100},
		{{"M秐h Thi猲 th筩h",{2,2,7,1},nil,nil,{1, 100} },300},
		{{"T骾 ti襫",{2,1,30367,2},nil,nil,{1, 100} },500},
		{{"Tu Ch﹏ Y誹 Quy誸",{2,0,554,1},30,nil,{1, 100} },200},
		{{"L鬰 Th莕 ho祅",{2,1,1064,1},30,nil,{1, 100} },300},
		{{"B筩h C﹗ Ho祅",{2,1,270,1},30,nil,{1, 100} },250},
		{{"Tam Thanh ho祅",{2,1,1097,1},30,nil,{1, 100} },300},
		{{"M秐h Thi猲 M玭",{2,1,30410,1},nil,nil,{1, 100} },400},
		{{"T骾 ti襫",{2,1,30367,4},nil,nil,{1, 100} },600},
		{{"Cng L鬰 Th莕 ho祅",{2,1,1065,1},30,nil,{1, 100} },200},
		{{"Th莕 N玭g Кn",{2,1,343,1},30,nil,{1, 100} },100},
		{{"C﹜ B竧 Nh?",{2,0,398,1},30,nil,{1, 100} },100},
		{{"Cng Tam Thanh ho祅",{2,1,1098,1},30,nil,{1, 100} },200},
		{{"Чi B筩h C﹗ ho祅",{2,1,1007,1},30,nil,{1, 100} },100},
		{{"M秐h Thi猲 M玭",{2,1,30410,2},nil,nil,{1, 100} },400},
		{{"T骾 ti襫",{2,1,30367,8},nil,nil,{1, 100} },400},
		{{"L鬰 Th莕 Ti猲 n",{2,1,1066,1},30,nil,{1, 100} },100},
		{{"Qu﹏ C玭g Chng",{2,1,9999,1},30,nil,{1, 100} },200},
		{{"M秐h Thi猲 M玭",{2,1,30410,3},nil,nil,{1, 100} },400},
		{{"Чi Nh﹏ s﹎",{2,0,553,1},30,nil,{1, 100} },200},
		{{"B筩h C﹗ Ti猲 n",{2,1,1008,1},30,nil,{1, 100} },50},
		{{"Tam Thanh Ti猲 n",{2,1,1099,1},30,nil,{1, 100} },100},
		{{"M秐h Thi猲 M玭",{2,1,30410,4},nil,nil,{1, 100} },400},
		{{"Qu﹏ C玭g b礽",{2,1,9997,1},30,nil,{1, 100} },100},
		{{"T骾 h箃 gi鑞g",{2,1,30087,1},30,nil,{1, 100} },100},
		{{"T骾 ti襫",{2,1,30367,16},nil,nil,{1, 100} },300},
		{{"M秐h Thi猲 M玭",{2,1,30410,5},nil,nil,{1, 100} },200},
		{{"S? m玭 l謓h k?",{2,1,1017,1},30,nil,{1, 100} },100},
		{{"T骾 ti襫",{2,1,30367,32},nil,nil,{1, 100} },100},
		{{"T? Linh Quy Nguy猲 Кn",{2,1,30352,1},30,nil,{1, 100} },100},
		{{"M秐h Thi猲 M玭",{2,1,30410,10},nil,nil,{1, 100} },100},
		{{"Ho祅g Kim Чi H錸g Bao (tr鑞g)",{2,1,538,1},30,nil,{1, 100} },100},
		{{"T? Kim H錸g Bao (tr鑞g)",{2,1,536,1},30,nil,{1, 100} },100},
		{{"T骾 ti襫",{2,1,30367,40},nil,nil,{1, 100} },100},
		{{"Qu﹏ C玭g Чi",{2,1,9998,1},30,nil,{1, 100} },100},
		{{"Thi猲 Th筩h Tinh Th筩h",{2,1,1009,1},nil,nil,{1, 100} },100},
		{{"B筩h Kim Чi H錸g Bao (kh玭g)",{2,1,30228,1},30,nil,{1, 100} },100},
		{{"M秐h Thi猲 M玭",{2,1,30410,50},nil,1,{1, 100} },33},
		{{"Qu﹏ C玭g Huy Ho祅g",{2,1,9977,1},30,1,{1, 100} },100},
		{{"Thi猲 Th筩h linh th筩h",{2,1,1068,1},nil,1,{1, 100} },10},
		{{"мnh H錸 Thi猲 Th筩h Th莕 Th筩h",{2,1,1067,1},nil,1,{1, 100} },5},
		--{{"大定魂陨铁神石",{2,1,1113,1},nil,1,{1, 100} },0},
		{{"Ma o Th筩h c蕄 1",{2,1,30428,1},nil,nil,{1, 100} },350},
		{{"Ma Чo Th筩h c蕄 2",{2,1,30429,1},nil,nil,{1, 100} },150},
		{{"Ma o Th筩h c蕄 3",{2,1,30430,1},nil,nil,{1, 100} },50},
		{{MA_SpecialAward, _t_special_award}, 2},
	},
}

ttd_all_award_tb = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu l藅 b礽 mi詎 ph? Th玭g Thi猲 Huy詎 C秐h",
		--几次没有得到装备时必出装备
		t_equip_round = {[3] = 1,[5] = 1,},
		n_max_daibi_perday = 30,--一天最多获得多少代币
		t_stage =
		{
			[1] = inherit(_t_free_award_no_stage, _t_free_award_stage[1]),
			[2] = inherit(_t_free_award_no_stage, _t_free_award_stage[2]),
			[3] = inherit(_t_free_award_no_stage, _t_free_award_stage[3]),
			[4] = inherit(_t_free_award_no_stage, _t_free_award_stage[4]),
			[5] = inherit(_t_free_award_no_stage, _t_free_award_stage[5]),
			[6] = inherit(_t_free_award_no_stage, _t_free_award_stage[6]),
			[7] = inherit(_t_free_award_no_stage, _t_free_award_stage[7]),
			[8] = inherit(_t_free_award_no_stage, _t_free_award_stage[8]),
		},
	},
	---------------------------------------------
	t_fix_award = 
	{
		sz_award_title = "Ph莕 thng c? nh 秈 Th玭g Thi猲 Huy詎 C秐h",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu l藅 b礽 thu ph? Th玭g Thi猲 Huy詎 C秐h",
		t_special = _t_special_award,  --必出天罡奖励
		t_stage = 
		{
			[1] = _t_ib_award_no_stage,
			[2] = _t_ib_award_no_stage,
			[3] = _t_ib_award_no_stage,
			[4] = _t_ib_award_no_stage,
			[5] = _t_ib_award_no_stage,
			[6] = _t_ib_award_no_stage,
			[7] = _t_ib_award_no_stage,
			[8] = _t_ib_award_no_stage,
		},
	},
}

_t_free_award_no_stage = nil
_t_free_award_stage = nil
_t_fix_award_stage = nil
_t_ib_award_no_stage = nil
_t_special_award = nil

