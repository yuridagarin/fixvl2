Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\task_access_code_def.lua")

Include("\\settings\\static_script\\missions\\hunduantongtianding\\runtime_data_stat.lua")

_t_free_award_no_stage =
{
	n_other_group_rate = 10000,--�����������ĸ���
	t_daibi_group =
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
        --{{"��ϼ�ؼ�",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        --t_item_para = {{function, {nCount, nBind, nExpireDays, bGblMsg}}, rate}
        --{{MissionAward_GiveFactionEquip4, {1, nil, nil, 0}}, 10000},
        { {"C� Linh Th�ch", {2,1,30368,1}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,2}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,3}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,4}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,5}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,6}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,7}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,8}, nil,nil,{1, 100} }, 1000},
        { {"C� Linh Th�ch", {2,1,30368,9}, nil,nil,{1, 100} }, 800},
        { {"C� Linh Th�ch", {2,1,30368,10}, nil,nil,{1, 100} }, 500},
        { {"C� Linh Th�ch", {2,1,30368,15}, nil,nil,{1, 100} }, 300},
        { {"C� Linh Th�ch", {2,1,30368,20}, nil,nil,{1, 100} }, 200},
        { {"C� Linh Th�ch", {2,1,30368,30}, nil,nil,{1, 100} }, 100},
        { {"C� Linh Th�ch", {2,1,30368,40}, nil,nil,{1, 100} }, 100},
	},
	--------------------------------------------
	t_other_group = --������
	{
		--t_item_para = {name, {g,d,p,n,bind}, expire_days,bGblMsg}
        --{{"��ϼ�ؼ�",{0,107,65,1, 4}, 720, bGblMsg}, 150},
        { {"Ng� H�nh Huy�n Th�ch", {2,1,30302,1}, nil,nil,{1, 100} }, 1500},
        { {"Kh�c b�n", {2,1,30373,1}, nil,nil,{1, 100} }, 1500},
        { {"Thi�n M�n Lam D��c", {1,0,30004,9}, nil,nil,{1, 100} }, 2000},
        { {"Thi�n M�n H�ng D��c", {1,0,30003,9}, nil,nil,{1, 100} }, 1500},
        { {"V� l�m b�o m�i", {2,1,30314,1}, nil,nil,{1, 100} }, 400},
        { {"Th�nh V�t S� M�n", {2,1,30311,1}, nil,nil,{1, 100} }, 400},
        { {"Ti�u truy�n c�ng ��n", {2,1,30312,1}, nil,nil,{1, 100} }, 400},
        { {"M�nh Tu Ch�n Y�u Quy�t", {2,1,30315,1}, nil,nil,{1, 100} }, 400},
        { {"Ti�u B�ch C�u ho�n", {2,1,30307,1}, nil,nil,{1, 100} }, 400},
        { {"Ti�u Tam Thanh Ho�n", {2,1,30308,1}, nil,nil,{1, 100} }, 400},
        { {"Ti�u L�c Th�n Ho�n", {2,1,30309,1}, nil,nil,{1, 100} }, 300},
        { {"Truy�n C�ng ��n", {2,1,30313,1}, nil,nil,{1, 100} }, 400},
        { {"B�i Nguy�n ��n", {2,1,30351,1}, nil,nil,{1, 100} }, 400},
	},
};

_t_free_award_stage =
{
	[1] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 3000,--�����������ĸ���
        	t_equip_group = --װ����
        	{
        		----tPara = {nCount, nBind, nExpireDays, bGblMsg}
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 10000},
        	},
		},
	[2] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 4000,--�����������ĸ���
        	t_equip_group = --װ����
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 10000},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        	},
		},
	[3] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 4000,--�����������ĸ���
        	t_equip_group = --װ����
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[4] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 4000,--�����������ĸ���
        	t_equip_group = --װ����
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[5] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 4000,--�����������ĸ���
        	t_equip_group = --װ����
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5000},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[6] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 4000,--�����������ĸ���
        	t_equip_group = --װ����
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 5500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        	},
		},
	[7] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 4000,--�����������ĸ���
        	t_equip_group = --װ����
        	{
        		{{MA_GiveFactionEquip5, {1, nil, nil, 0}}, 3500},
        		--{{MA_GiveLevel2WenShi, {1, nil, nil, 0}}, 0},
        		{{MA_GiveTongTianEquip, {1, nil, nil, 0}}, 4500},
        		{{MA_GiveHaoYueEquip, {1, nil, nil, 0}}, 2000},
        	},
		},
	[8] =
		{
			n_equip_group_rate = 1000,--�����װ����ĸ���
			n_daibi_group_rate = 4000,--�����������ĸ���
        	t_equip_group = --װ����
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

_t_special_award = --����бس������������
{
	nSaveTaskId = 3080,
	nSaveTaskAccessCode = TASK_ACCESS_CODE_GUTIANMENBAOXIANG,
	nSaveTaskWordIdx = 2,
	nSureAwardCount = 600,
	nAddcounterPerUpdate=2, --ÿִ��һ��Update����������ֵ
	t_award =
	{
		{{MA_TianMenJinLing, {}}, 10000},
	},
}

_t_ib_award_no_stage =
{
	t_cost = --����
	{
		--{"��ϼ�ؼ�",{0,107,65,1, 4}},
		{"Th�ng Thi�n L�nh",{2,1,30409,2}, _stat_when_ib_consume},	
	},
	t_ib_award =--ib����
	{
		{{"H�c Ng�c �o�n T�c Cao",{1,0,6,1},nil,nil,{1, 100} },300},
		{{"V�n V�t Quy Nguy�n ��n",{1,0,11,1},nil,nil,{1, 100} },300},
		{{"Sinh Sinh H�a T�n",{1,0,16,1},nil,nil,{1, 100} },300},
		{{"T�i ti�n",{2,1,30367,1},nil,nil,{1, 100} },600},
		{{"C�u chuy�n h�i h�n ��n",{1,0,32,1},nil,nil,{1, 100} },200},
		{{"C�y B�t Nh� nh�",{2,0,504,1},30,nil,{1, 100} },100},
		{{"M�nh Thi�n th�ch",{2,2,7,1},nil,nil,{1, 100} },300},
		{{"T�i ti�n",{2,1,30367,2},nil,nil,{1, 100} },500},
		{{"Tu Ch�n Y�u Quy�t",{2,0,554,1},30,nil,{1, 100} },200},
		{{"L�c Th�n ho�n",{2,1,1064,1},30,nil,{1, 100} },300},
		{{"B�ch C�u Ho�n",{2,1,270,1},30,nil,{1, 100} },250},
		{{"Tam Thanh ho�n",{2,1,1097,1},30,nil,{1, 100} },300},
		{{"M�nh Thi�n M�n",{2,1,30410,1},nil,nil,{1, 100} },400},
		{{"T�i ti�n",{2,1,30367,4},nil,nil,{1, 100} },600},
		{{"C��ng L�c Th�n ho�n",{2,1,1065,1},30,nil,{1, 100} },200},
		{{"Th�n N�ng ��n",{2,1,343,1},30,nil,{1, 100} },100},
		{{"C�y B�t Nh�",{2,0,398,1},30,nil,{1, 100} },100},
		{{"C��ng Tam Thanh ho�n",{2,1,1098,1},30,nil,{1, 100} },200},
		{{"��i B�ch C�u ho�n",{2,1,1007,1},30,nil,{1, 100} },100},
		{{"M�nh Thi�n M�n",{2,1,30410,2},nil,nil,{1, 100} },400},
		{{"T�i ti�n",{2,1,30367,8},nil,nil,{1, 100} },400},
		{{"L�c Th�n Ti�n ��n",{2,1,1066,1},30,nil,{1, 100} },100},
		{{"Qu�n C�ng Ch��ng",{2,1,9999,1},30,nil,{1, 100} },200},
		{{"M�nh Thi�n M�n",{2,1,30410,3},nil,nil,{1, 100} },400},
		{{"��i Nh�n s�m",{2,0,553,1},30,nil,{1, 100} },200},
		{{"B�ch C�u Ti�n ��n",{2,1,1008,1},30,nil,{1, 100} },50},
		{{"Tam Thanh Ti�n ��n",{2,1,1099,1},30,nil,{1, 100} },100},
		{{"M�nh Thi�n M�n",{2,1,30410,4},nil,nil,{1, 100} },400},
		{{"Qu�n C�ng b�i",{2,1,9997,1},30,nil,{1, 100} },100},
		{{"T�i h�t gi�ng",{2,1,30087,1},30,nil,{1, 100} },100},
		{{"T�i ti�n",{2,1,30367,16},nil,nil,{1, 100} },300},
		{{"M�nh Thi�n M�n",{2,1,30410,5},nil,nil,{1, 100} },200},
		{{"S� m�n l�nh k�",{2,1,1017,1},30,nil,{1, 100} },100},
		{{"T�i ti�n",{2,1,30367,32},nil,nil,{1, 100} },100},
		{{"T� Linh Quy Nguy�n ��n",{2,1,30352,1},30,nil,{1, 100} },100},
		{{"M�nh Thi�n M�n",{2,1,30410,10},nil,nil,{1, 100} },100},
		{{"Ho�ng Kim ��i H�ng Bao (tr�ng)",{2,1,538,1},30,nil,{1, 100} },100},
		{{"T� Kim H�ng Bao (tr�ng)",{2,1,536,1},30,nil,{1, 100} },100},
		{{"T�i ti�n",{2,1,30367,40},nil,nil,{1, 100} },100},
		{{"Qu�n C�ng ��i",{2,1,9998,1},30,nil,{1, 100} },100},
		{{"Thi�n Th�ch Tinh Th�ch",{2,1,1009,1},nil,nil,{1, 100} },100},
		{{"B�ch Kim ��i H�ng Bao (kh�ng)",{2,1,30228,1},30,nil,{1, 100} },100},
		{{"M�nh Thi�n M�n",{2,1,30410,50},nil,1,{1, 100} },33},
		{{"Qu�n C�ng Huy Ho�ng",{2,1,9977,1},30,1,{1, 100} },100},
		{{"Thi�n Th�ch linh th�ch",{2,1,1068,1},nil,1,{1, 100} },10},
		{{"��nh H�n Thi�n Th�ch Th�n Th�ch",{2,1,1067,1},nil,1,{1, 100} },5},
		--{{"�󶨻�������ʯ",{2,1,1113,1},nil,1,{1, 100} },0},
		{{"Ma �ao Th�ch c�p 1",{2,1,30428,1},nil,nil,{1, 100} },350},
		{{"Ma ��o Th�ch c�p 2",{2,1,30429,1},nil,nil,{1, 100} },150},
		{{"Ma �ao Th�ch c�p 3",{2,1,30430,1},nil,nil,{1, 100} },50},
		{{MA_SpecialAward, _t_special_award}, 2},
	},
}

ttd_all_award_tb = 
{
	--------------------------------------------
	t_free_award = 
	{
		sz_award_title = "Khu l�t b�i mi�n ph� Th�ng Thi�n Huy�n C�nh",
		--����û�еõ�װ��ʱ�س�װ��
		t_equip_round = {[3] = 1,[5] = 1,},
		n_max_daibi_perday = 30,--һ������ö��ٴ���
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
		sz_award_title = "Ph�n th��ng c� ��nh �i Th�ng Thi�n Huy�n C�nh",
		t_stage = _t_fix_award_stage,
	},
	--------------------------------------------
	t_ib_award = 
	{
		sz_award_title = "Khu l�t b�i thu ph� Th�ng Thi�n Huy�n C�nh",
		t_special = _t_special_award,  --�س������
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

