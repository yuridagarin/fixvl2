Include("\\script\\class\\mem.lua");

tDataString = {
	["CJ"] = {--开启数 人次数 通关数
		{"pve_cjsz_begin1","pve_cjsz_people1","pve_cjsz_finish1"},
		{"pve_cjsz_begin2","pve_cjsz_people2","pve_cjsz_finish2"},
		{"pve_cjsz_begin3","pve_cjsz_people3","pve_cjsz_finish3"},
		{"pve_cjsz_begin4","pve_cjsz_people4","pve_cjsz_finish4"},
		{"pve_cjsz_begin5","pve_cjsz_people5","pve_cjsz_finish5"},
		{"pve_cjsz_begin6","pve_cjsz_people6","pve_cjsz_finish6"},
		{"pve_cjsz_begin7","pve_cjsz_people7","pve_cjsz_finish7"},
		{"item_use_baguamiling1"},
	},
	["XB"] = { --西北关卡开启数 人次数 通关数 使用1个八卦密令 使用3个八卦密令
		{"pve_xytm_begin","pve_xytm_people","pve_xytm_finish","item_use_baguamiling2","item_use_baguamiling3"},
	},
	["TX"] = { --开启数 人次数
		{"pve_txhjpt_begin","pve_txhjpt_people",},
		{"pve_txhjyx_begin","pve_txhjyx_people"},	
	},
	["LS"] = { --走后面是第5关 --开启数 人次数 通关数
		{"pve_lsyxh_begin1","pve_lsyxh_people1","pve_lsyxh_finish1"},
		{"pve_lsyxh_begin2","pve_lsyxh_people2","pve_lsyxh_finish2"},
		{"pve_lsyxh_begin3","pve_lsyxh_people3","pve_lsyxh_finish3"},
		{"pve_lsyxh_begin4","pve_lsyxh_people4","pve_lsyxh_finish4"},
		{"pve_lsyxh_begin9","pve_lsyxh_people9","pve_lsyxh_finish9"},
		{"pve_lsyxh_begin5","pve_lsyxh_people5","pve_lsyxh_finish5"},
		{"pve_lsyxh_begin6","pve_lsyxh_people6","pve_lsyxh_finish6"},
		{"pve_lsyxh_begin7","pve_lsyxh_people7","pve_lsyxh_finish7"},
		{"pve_lsyxh_begin8","pve_lsyxh_people8","pve_lsyxh_finish8"},
		--完成梁山英雄会日常任务1 2 3
		{"rcmission_lsyxh_mission1","rcmission_lsyxh_mission2","rcmission_lsyxh_mission3"},
		--聚义令使用数 天罡令掉落数量
		{"item_use_juyiling","item_loot_tiangangling"},
		{"pve_lsyxh_begin10","pve_lsyxh_people10","pve_lsyxh_finish10"},
		{"pve_lsyxh_mailcount"},
	},
	["DXG"] = {--走后面是第4关 --开启数 人次数 通关数
		{"pve_dpdxg_begin1","pve_dpdxg_people1","pve_dpdxg_finish1"},
		{"pve_dpdxg_begin2","pve_dpdxg_people2","pve_dpdxg_finish2"},
		{"pve_dpdxg_begin3","pve_dpdxg_people3","pve_dpdxg_finish3"},
		{"pve_dpdxg_begin8","pve_dpdxg_people8","pve_dpdxg_finish8"},
		{"pve_dpdxg_begin4","pve_dpdxg_people4","pve_dpdxg_finish4"},
		{"pve_dpdxg_begin5","pve_dpdxg_people5","pve_dpdxg_finish5"},
		{"pve_dpdxg_begin6","pve_dpdxg_people6","pve_dpdxg_finish6"},
		{"pve_dpdxg_begin7","pve_dpdxg_people7","pve_dpdxg_finish7"},
		--日常任务完成数量 通天令牌使用数 地玄金令掉落数量
		{"rcmission_dpdxg_mission1","item_use_tongtianlingpai","item_loot_dixuanjinling"},
	},
	["TMZ"] = {--天门阵开启次数  天门阵奖励人次数  银文虎符领取奖励  金纹虎符领取奖励
		{"pvp_tmz_begin","pvp_tmz_people","pvp_tmz_yinwen","pvp_tmz_jinwen",},
	},
	["ZC"] = { --战场
		--开始人次数 结束人次数 提前进入数 报名数 迟到报名数
		[1] = {"pvp_clz_beginpeople","pvp_clz_finishpeople","pvp_clz_overlinepeople","pvp_clz_writepeople","pvp_clz_latepeople"},--村落战
		[2] = {"pvp_cgc_beginpeople","pvp_cgc_finishpeople","pvp_cgc_overlinepeople","pvp_cgc_writepeople","pvp_cgc_latepeople"},--草谷场
		[3] = {"pvp_ptz_beginpeople","pvp_ptz_finishpeople","pvp_ptz_overlinepeople","pvp_ptz_writepeople","pvp_ptz_latepeople"},--炮台战
		[4] = {"pvp_ymg_beginpeople","pvp_ymg_finishpeople","pvp_ymg_overlinepeople","pvp_ymg_writepeople","pvp_ymg_latepeople"},--雁门关
		[5] = {"pvp_yumg_beginpeople","pvp_yumg_finishpeople","pvp_yumg_overlinepeople","pvp_yumg_writepeople","pvp_yumg_latepeople"},--玉门关	
	  --大战场奖励次数 小战场奖励次数
		[6] = {"pvp_prize_big_nomal","pvp_prize_small_nomal"}, --普通
		[7] = {"pvp_prize_big_jgz","pvp_prize_small_jgz"}, --军功章
		[8] = {"pvp_prize_big_djgz","pvp_prize_small_djgz"}, --大军功章
		[9] = {"pvp_prize_big_hhjgz","pvp_prize_small_hhjgz"}, --辉煌军功章
		[10] = {"pvp_prize_big_tigercard","pvp_prize_small_tigercard"}, --黄金虎纹卡
		[11] = {"pvp_prize_big_phoenixcard","pvp_prize_small_phoenixcard"}, --白金凤纹卡
		--补领大战场奖励次数 小战场奖励次数
		[12] = {"pvp_prizelatelate_big_jgz","pvp_prizelate_small_jgz"},
		[13] = {"pvp_prizelate_big_djgz","pvp_prizelate_small_djgz"},
		[14] = {"pvp_prizelate_big_hhjgz","pvp_prizelate_small_hhjgz"},
		[15] = {"pvp_prizelate_big_tigercard","pvp_prizelate_small_tigercard"},
		[16] = {"pvp_prizelate_big_phoenixcard","pvp_prizelate_small_phoenixcard"},
	},
	["ZG"] = {--开启关卡次数 通过关卡次数 通过关卡内堂人数 通过关卡外堂人数
		{"pve_zgg_begin1","pve_zgg_finish1","pve_zgg_peoplein1","pve_zgg_peopleout1"},
		{"pve_zgg_begin2","pve_zgg_finish2","pve_zgg_peoplein2","pve_zgg_peopleout2"},
		{"pve_zgg_begin3","pve_zgg_finish3","pve_zgg_peoplein3","pve_zgg_peopleout3"},
		{"pve_zgg_begin4","pve_zgg_finish4","pve_zgg_peoplein4","pve_zgg_peopleout4"},
		{"pve_zgg_begin5","pve_zgg_finish5","pve_zgg_peoplein5","pve_zgg_peopleout5"},
		{"pve_zgg_begin6","pve_zgg_finish6","pve_zgg_peoplein6","pve_zgg_peopleout6"},
		--紫光阁场地激活次数 紫光阁场地关闭次数
		{"pve_zgg_open","pve_zgg_close"},
	},
	["BW"] = {
		--比武配对成功数 成功比武场次数
		{"pvp_bwdh_pair","pvp_bwdh_finish",},
		--胜负场数奖励（1-3）胜负场数奖励（4-6）  胜负场数奖励（7-9） 胜负场数奖励（>=10） 对战经验兑换纹饰数量 对战经验兑换比武神秘盒数量
		{"pvp_prize_bwdh_123","pvp_prize_bwdh_456","pvp_prize_bwdh_789","pvp_prize_bwdh_10","pvp_prize_bwdh_fightexp1","pvp_prize_bwdh_fightexp2"},
		--单场比武结束（双方分差在50分以上）
		{	--获胜次数 失败次数
			[2] = {"pvp_bwdh_balance50+_win2","pvp_bwdh_balance50+_lose2",},
			[3] = {"pvp_bwdh_balance50+_win3","pvp_bwdh_balance50+_lose3",},
			[4] = {"pvp_bwdh_balance50+_win4","pvp_bwdh_balance50+_lose4",},
			[6] = {"pvp_bwdh_balance50+_win5","pvp_bwdh_balance50+_lose5",},
			[8] = {"pvp_bwdh_balance50+_win8","pvp_bwdh_balance50+_lose8",},
			[9] = {"pvp_bwdh_balance50+_win9","pvp_bwdh_balance50+_lose9",},
			[11] = {"pvp_bwdh_balance50+_win11","pvp_bwdh_balance50+_lose11",},
			[12] = {"pvp_bwdh_balance50+_win12","pvp_bwdh_balance50+_lose12",},
			[14] = {"pvp_bwdh_balance50+_win14","pvp_bwdh_balance50+_lose14",},
			[15] = {"pvp_bwdh_balance50+_win15","pvp_bwdh_balance50+_lose15",},
			[17] = {"pvp_bwdh_balance50+_win17","pvp_bwdh_balance50+_lose17",},
			[18] = {"pvp_bwdh_balance50+_win18","pvp_bwdh_balance50+_lose18",},
			[20] = {"pvp_bwdh_balance50+_win20","pvp_bwdh_balance50+_lose20",},
			[21] = {"pvp_bwdh_balance50+_win21","pvp_bwdh_balance50+_lose21",},
			[23] = {"pvp_bwdh_balance50+_win23","pvp_bwdh_balance50+_lose23",},
			[25] = {"pvp_bwdh_balance50+_win25","pvp_bwdh_balance50+_lose25",},
			[26] = {"pvp_bwdh_balance50+_win26","pvp_bwdh_balance50+_lose26",},
			[27] = {"pvp_bwdh_balance50+_win27","pvp_bwdh_balance50+_lose27",},
			[29] = {"pvp_bwdh_balance50+_win29","pvp_bwdh_balance50+_lose29",},
			[30] = {"pvp_bwdh_balance50+_win30","pvp_bwdh_balance50+_lose30",},
		},
		--单场比武结束（双方分差在50分以内）
		{	--获胜次数 失败次数
			[2] = {"pvp_bwdh_balance50-_win2","pvp_bwdh_balance50-_lose2",},
			[3] = {"pvp_bwdh_balance50-_win3","pvp_bwdh_balance50-_lose3",},
			[4] = {"pvp_bwdh_balance50-_win4","pvp_bwdh_balance50-_lose4",},
			[6] = {"pvp_bwdh_balance50-_win5","pvp_bwdh_balance50-_lose5",},
			[8] = {"pvp_bwdh_balance50-_win8","pvp_bwdh_balance50-_lose8",},
			[9] = {"pvp_bwdh_balance50-_win9","pvp_bwdh_balance50-_lose9",},
			[11] = {"pvp_bwdh_balance50-_win11","pvp_bwdh_balance50-_lose11",},
			[12] = {"pvp_bwdh_balance50-_win12","pvp_bwdh_balance50-_lose12",},
			[14] = {"pvp_bwdh_balance50-_win14","pvp_bwdh_balance50-_lose14",},
			[15] = {"pvp_bwdh_balance50-_win15","pvp_bwdh_balance50-_lose15",},
			[17] = {"pvp_bwdh_balance50-_win17","pvp_bwdh_balance50-_lose17",},
			[18] = {"pvp_bwdh_balance50-_win18","pvp_bwdh_balance50-_lose18",},
			[20] = {"pvp_bwdh_balance50-_win20","pvp_bwdh_balance50-_lose20",},
			[21] = {"pvp_bwdh_balance50-_win21","pvp_bwdh_balance50-_lose21",},
			[23] = {"pvp_bwdh_balance50-_win23","pvp_bwdh_balance50-_lose23",},
			[25] = {"pvp_bwdh_balance50-_win25","pvp_bwdh_balance50-_lose25",},
			[26] = {"pvp_bwdh_balance50-_win26","pvp_bwdh_balance50-_lose26",},
			[27] = {"pvp_bwdh_balance50-_win27","pvp_bwdh_balance50-_lose27",},
			[29] = {"pvp_bwdh_balance50-_win29","pvp_bwdh_balance50-_lose29",},
			[30] = {"pvp_bwdh_balance50-_win30","pvp_bwdh_balance50-_lose30",},
		},
	},
	["Camp_sf"] = {--春节活动
		{"holiday_1_1","holiday_1_2","holiday_1_3","holiday_1_4","holiday_1_5",
		 "holiday_1_6","holiday_1_7","holiday_1_8","holiday_1_9","holiday_1_10",
		 "holiday_1_11","holiday_1_12","holiday_1_13","holiday_1_14","holiday_1_15",
		 "holiday_1_16","holiday_1_17","holiday_1_18","holiday_1_19","holiday_1_20",
		 "holiday_1_21","holiday_1_22","holiday_1_23","holiday_1_24","holiday_1_25",
		 "holiday_1_26","holiday_1_27","holiday_1_28","holiday_1_29","holiday_1_30",
		 "holiday_1_31","holiday_1_32","holiday_1_33","holiday_1_34","holiday_1_35",
		 "holiday_1_36","holiday_1_37","holiday_1_38","holiday_1_39","holiday_1_40",
		},
	},
	["CallBack_sf"] = {
		{"holiday_2_1_1","holiday_2_1_2","holiday_2_1_3","holiday_2_1_4","holiday_2_1_5",
		 "holiday_2_1_6","holiday_2_1_7","holiday_2_1_8","holiday_2_1_9","holiday_2_1_10",
		 "holiday_2_1_11","holiday_2_1_12","holiday_2_1_13","holiday_2_1_14","holiday_2_1_15",
		 "holiday_2_1_16","holiday_2_1_17","holiday_2_1_18","holiday_2_1_19","holiday_2_1_20",
		 "holiday_2_2_1","holiday_2_2_2","holiday_2_2_3","holiday_2_2_4","holiday_2_2_5",
		 "holiday_2_2_6","holiday_2_2_7","holiday_2_2_8","holiday_2_2_9","holiday_2_2_10",
		 "holiday_2_2_11","holiday_2_2_12","holiday_2_2_13","holiday_2_2_14","holiday_2_2_15",
		 "holiday_2_2_16","holiday_2_2_17","holiday_2_2_18","holiday_2_2_19","holiday_2_2_20",
		},
	},
	["qingming_2011"] = {
		{"holiday_2_1_1","holiday_2_1_2","holiday_2_1_3","holiday_2_1_4","holiday_2_1_5",
		 "holiday_2_1_6","holiday_2_1_7","holiday_2_1_8","holiday_2_1_9","holiday_2_1_10",
		 "holiday_2_1_11","holiday_2_1_12","holiday_2_1_13","holiday_2_1_14","holiday_2_1_15",
		 "holiday_2_1_16","holiday_2_1_17","holiday_2_1_18","holiday_2_1_19","holiday_2_1_20",
		 "holiday_2_2_1","holiday_2_2_2","holiday_2_2_3","holiday_2_2_4","holiday_2_2_5",
		 "holiday_2_2_6","holiday_2_2_7","holiday_2_2_8","holiday_2_2_9","holiday_2_2_10",
		 "holiday_2_2_11","holiday_2_2_12",
		},
	},
	["holiday2"] = {
		{
			"holiday_2_1_1","holiday_2_1_2","holiday_2_1_3","holiday_2_1_4","holiday_2_1_5",
			"holiday_2_1_6","holiday_2_1_7","holiday_2_1_8","holiday_2_1_9","holiday_2_1_10",
			"holiday_2_1_11","holiday_2_1_12","holiday_2_1_13","holiday_2_1_14","holiday_2_1_15",
			"holiday_2_1_16","holiday_2_1_17","holiday_2_1_18","holiday_2_1_19","holiday_2_1_20",
		},{
			"holiday_2_2_1","holiday_2_2_2","holiday_2_2_3","holiday_2_2_4","holiday_2_2_5",
			"holiday_2_2_6","holiday_2_2_7","holiday_2_2_8","holiday_2_2_9","holiday_2_2_10",
			"holiday_2_2_11","holiday_2_2_12","holiday_2_2_13","holiday_2_2_14","holiday_2_2_15",
			"holiday_2_2_16","holiday_2_2_17","holiday_2_2_18","holiday_2_2_19","holiday_2_2_20",
		},{
			"holiday_2_3_1","holiday_2_3_2","holiday_2_3_3","holiday_2_3_4","holiday_2_3_5",
			"holiday_2_3_6","holiday_2_3_7","holiday_2_3_8","holiday_2_3_9","holiday_2_3_10",
			"holiday_2_3_11","holiday_2_3_12","holiday_2_3_13","holiday_2_3_14","holiday_2_3_15",
			"holiday_2_3_16","holiday_2_3_17","holiday_2_3_18","holiday_2_3_19","holiday_2_3_20",
		},
	},
	["HDTTD"] = {--魂断通天顶
		{"tongtianding_key_1","tongtianding_key_2","tongtianding_key_cost","tongtianding_open_1","tongtianding_cheat_1",
		 "tongtianding_open_2","tongtianding_cheat_2","tongtianding_open_3","tongtianding_cheat_3","tongtianding_open_4",
		 "tongtianding_cheat_4","tongtianding_open_5","tongtianding_cheat_5","tongtianding_open_6","tongtianding_cheat_6",
		 "tongtianding_open_7","tongtianding_cheat_7","tongtianding_open_8","tongtianding_cheat_8","tongtianding_over_1",
		 "tongtianding_over_2","tongtianding_over_3","tongtianding_over_4","tongtianding_over_5","tongtianding_over_6",
		 "tongtianding_over_7","tongtianding_over_8","tongtianding_free","tongtianding_ib_1","tongtianding_ib_2",
		 "tongtianding_ib_3","tongtianding_ib_4","tongtianding_ib_gold_1","tongtianding_ib_gold_2",
		 },
	},
	["JZMY"] = { --剑冢魔影
		{"Jianzhong_open_1","Jianzhong_open_2","Jianzhong_open_3","Jianzhong_open_4",
		 "Jianzhong_end_1","Jianzhong_end_2","Jianzhong_end_3","Jianzhong_end_4",
		 "Jianzhong_joinlevel_1","Jianzhong_joinlevel_2","Jianzhong_joinlevel_3","Jianzhong_joinlevel_4","Jianzhong_joinlevel_5",
		},
	},
	["FPVP"] = { --野外pvp
		{"xiyuzongheng_tianlongsi","xiyuzongheng_qiongjie","xiyuzongheng_xixia","xiyuzongheng_jingshuover","xiyuzongheng_jingshuone",
		 "xiyuzongheng_jingshutwo","xiyuzongheng_npcjuntuan","xiyuzongheng_zhongshuover","xiyuzongheng_zhongshuoone","xiyuzongheng_zhongshuotwo",
		 "xiyuzongheng_wabao","xiyuzongheng_yabiao","xiyuzongheng_yabiao_putong","xiyuzongheng_yabiao_zhongyao","xiyuzongheng_yabiao_junyong",
		 "xiyuzongheng_yabiao_jimi","xiyuzongheng_yabiao_huangjia","xiyuzongheng_yabiao_toubao","xiyuzongheng_tuoli","xiyuzongheng_tanmizuigao",
		 "xiyuzongheng_tanmizuidi",
		},
	},
};

function ds_AddStatValue(strName,nNum)
	if 1 ~= AddStatValue(strName, nNum) then
		WriteLog("[觤 ch玭 d? li謚] [AddStatValue ph秐 h錳 b? l鏸#]");
	end
	return 1;
end

dsBase = {};
function dsBase:AddStatValue(tbIDX1,tbIDX2,nNum)
	nNum = nNum or 1;
	if self.strName and tDataString[self.strName] then
		ds_AddStatValue(tDataString[self.strName][tbIDX1][tbIDX2],nNum); 
	else
		WriteLog("[觤 ch玭 d? li謚] [strName b?  l鏸#]");
	end
end

ds_CJ = {
	strName = "CJ",
};
ds_CJ = inherit(dsBase, ds_CJ);


ds_XB = {
	strName = "XB",
};
ds_XB = inherit(dsBase, ds_XB);

ds_TX = {
	strName = "TX",
};
ds_TX = inherit(dsBase, ds_TX);

ds_LS = {
	strName = "LS",
};
ds_LS = inherit(dsBase, ds_LS);

ds_DXG = {
	strName = "DXG",
};
ds_DXG = inherit(dsBase, ds_DXG);

ds_TMZ = {
	strName = "TMZ",
};
ds_TMZ = inherit(dsBase, ds_TMZ);

ds_ZC = {
	strName = "ZC",
};
ds_ZC = inherit(dsBase, ds_ZC);

ds_ZG = {
	strName = "ZG",
};
ds_ZG = inherit(dsBase, ds_ZG);

ds_BW = {
	strName = "BW",
};
function ds_BW:AddStatValueRoute(nRoute,tbIDX1,tbIDX2,nNum)
	nNum = nNum or 1;
	AddStatValue(tDataString["BW"][tbIDX1][nRoute][tbIDX2],nNum); 
end
ds_BW = inherit(dsBase, ds_BW);

ds_Camp_sf = {
	strName = "Camp_sf",
};
ds_Camp_sf = inherit(dsBase, ds_Camp_sf);

ds_CallBack_sf = {
	strName = "CallBack_sf",
};
ds_CallBack_sf = inherit(dsBase, ds_CallBack_sf);

ds_QingMing_2011 = {
	strName = "qingming_2011",
};
ds_QingMing_2011 = inherit(dsBase, ds_QingMing_2011);

ds_Holiday2 = {
	strName = "holiday2",
}
ds_Holiday2 = inherit(dsBase, ds_Holiday2);

ds_HDTTD = {
	strName = "HDTTD",
};
ds_HDTTD = inherit(dsBase, ds_HDTTD);

ds_JZMY = {
	strName = "JZMY",
};
ds_JZMY = inherit(dsBase, ds_JZMY);

ds_PVP = {
	strName = "FPVP",
};
ds_PVP = inherit(dsBase, ds_PVP);
