--奥运活动大使
Include("\\script\\online\\olympic\\oly_head.lua")
Include("\\settings\\static_script\\global\\regular_clear_task.lua")
Include("\\script\\lib\\talktmp.lua")

tbSay_201207 = {
	"Gi韎 thi謚 ho箃 ng/introduce_201207",
--	"奥运幸运抽奖/oly_lucky_star_201207",
	"R髏 thng H筺h V薾/oly_lucky_star_201207",
	"Gh衟 Ng? Th竔 Th竛h H醓/combining_flame_201207",
	"竛 s? nh薾 Lam S綾 Th竛h H醓 /guess_flame_201207",
	"дn H醓 V鵦 C鰑 Ch﹗ thu th藀 Th竛h H醓/goto_caji_map_201207",
}

--sTitle_201207 = "欢迎参加奥运活动，收集各色圣火点燃圣坛，赢取好礼。<color=green>70<color>级已入流派学会<color=green>1<color>套<color=green>55<color>级技能的人士可以参加。";
sTitle_201207 = "Ch骳 m鮪g Phi猲 B秐 m韎, nh薾 h秓 l?. C蕄 80  gia nh藀 m玭 ph竔 h鋍 k? n╪g 55 t c蕄 t鑙 產 c? th? tham gia";

Activity_Ds_Name = "<color=green>Чi S? ho箃 ng: <color>";

sTitle_201207_1 = "T筰 m鏸 th祅h Thuy襫 Ch﹗ (165/192), Th祅h Й (180/179), Чi L? ( 231/222), Tng Dng (221/195), Phng Tng (221/195), Bi謓 Kinh ( 183/173) u c? m閠 Th竛h H醓 Уn";

function introduce_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"Ngu錸 g鑓 v? ch駈g lo筰 Th竛h H醓/source_201207",
		"Ph莕 thng v? s? l莕 s? d鬾g 5 lo筰 Th竛h H醓  th緋 s竛g/danse_award_201207",
		"Ph莕 thng v? s? l莕 s? d鬾g Ng? Th竔 Th竛h H醓  th緋 s竛g/wucai_award_201207",
--		"每日奥运幸运星抽奖/lucky_star_201207",
		"R髏 thng H筺h V薾 Tinh m鏸 ng祔/lucky_star_201207",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1,getn(tbSay),tbSay);
end

function source_201207()
	local tbBody = "  \n H綾 S綾 Th竛h H醓棗R琲 ra t? Boss 秈 Lng S琻, V筺 Ki誱 Tr騨g;  \n Ho祅g S綾 Th竛h H醓棗Nh薾 頲 khi gi誸 qu竔 ? Qu? M玭 H錳 Lang;  \n H錸g S綾 Th竛h H醓棗R琲 ra t? Thi猲 M玭 Tr薾;  \n L鬰 S綾 Th竛h H醓棗Thu th藀 U Minh Hoa ? Qu? M玭 H錳 Lang (c? x竎 su蕋 sinh ra khi gi誸 ch誸 qu竔 v藅);   \n Lam S綾 Th竛h H醓棗Nh薾 頲 khi tham gia 畂竛 s?;  \n Ng? Th竔 Th竛h H醓棗Gh衟 ? Чi S? ho箃 ng ho芻 c? th? nh薾 頲 khi gi誸 qu竔 chi猽 d? Minh H醓 Qu? Linh";
	local tbSay = {};
	tbSay.msg = Activity_Ds_Name..tbBody;
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function danse_award_201207()
	local tbBody = format("S? l莕: Th竛h H醓 Уn c馻 m鏸 th祅h, m鏸 ng祔 c? th? t s竛g 1 l莕. Ph莕 thng: \n c閚g d錸 s? l莕 甶觤 h醓 + 1; \n exp<color=green>%d<color>; \n ng蓇 nhi猲 1 o c? qu? hi誱, ph莕 thng cao nh蕋 c? Tinh Kh綾, trang b? Thi猲 Ngh躠, trang b? ng蓇 nhi猲 v.v.", OLY_EXP_2);
	local tbSay = {
		"S? l莕 th緋 s竛g c閚g d錸 c? l頸 輈h g? kh玭g?/fire_used_201207",
		"\n tr? v? t莕g trc/introduce_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function wucai_award_201207()
	local tbBody = format("S? l莕: C? th? 甶觤 h醓 t筰 b蕋 k? Th竛h H醓 Уn c馻 th祅h th? v韎 s? l莕 b蕋 k?. Ph莕 thng: \n c閚g d錸 s? l莕 甶觤 h醓 +1; \n exp<color=green>%d<color>; \n ng蓇 nhi猲 1 o c? qu? hi誱, ph莕 thng cao nh蕋 c? Linh Th筩h c蕄 7, Thi猲 Cang L謓h, мnh H錸 Thi猲 Th筩h Linh Th筩h, Thi猲 Th筩h Linh Th筩h, trang b? ng蓇 nhi猲 v.v", OLY_EXP_3);
	local tbSay = {
		"S? l莕 th緋 s竛g c閚g d錸 c? l頸 輈h g? kh玭g?/fire_used_201207",
		"\n tr? v? t莕g trc/introduce_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name..sTitle_201207_1..tbBody,getn(tbSay),tbSay);
end

function fire_used_201207()
	local tbSay = {};
--	tbSay.msg = Activity_Ds_Name.."达到不同的累计点火次数获得奖励时将比获得如下奖励：\n    50次-1级千幻刻板；100次-神行宝典；150次-陨铁精石；\n    300次-2级千幻刻板（可换取指定部位指定属性的2级蕴灵）；\n    600次-辉煌军功章；\n    800次-7级灵石；\n    1000次-3级千幻刻板（可换取指定部位指定属性的3级蕴灵）；\n    1200次-天罡令；\n	注意：领取1200次的奖励后，累计点火次数会清零，可以重新开始累积。\n";
	tbSay.msg = Activity_Ds_Name.."觤 h醓 c閚g d錸 t n 50 l莕 kh竎 nhau trang b? ng蓇 nhi猲-1-3 sao; 100 l莕-B? Ng﹏ To秐; 200 l莕-B? Ng﹏ Ch飝; 400 l莕-Qu﹏ C玭g Чi; 700 l莕-Thi猲 Th筩h Tinh Th筩h; 1000 l莕-Qu﹏ C玭g Huy Ho祅g; 1300 l莕-T葃 T﹎ Th筩h c蕄 3; 1600 l莕-Luy謓 L? Thi誸 c蕄 3; 1800 l莕-Thi猲 M玭 Kim L謓h; 2000 l莕-Thi猲 Cang L謓h; \n Ch? ?: Sau khi nh薾 ph莕 thng 2000 l莕, s? l莕 甶觤 h醓 t輈h l騳 c閚g d錸 s? 頲 l祄 m韎, c? th? ti誴 t鬰 b総 u t輈h l騳 l筰 t? u.";
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function combining_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"Gh衟 b籲g Ng? Th竔 Th莕 Th筩h (b竛 ? Ng? C竎)/combining_1_201207",
		"Gh衟 Th竛h H醓 v? V祅g/combining_2_201207",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name.."C竎 h? mu鑞 ch鋘 c竎h th鴆 n祇  gh衟 Ng? Th竔 Th竛h H醓 v藋?",getn(tbSay),tbSay);
end

function combining_1_201207()
	local tbSay = {
		format("Gh衟 %d H錸g S綾 Th竛h H醓+%d Ng? Th竔 Th莕 Th筩h/#begin_combining_1(1)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d L鬰 S綾 Th竛h H醓+%d Ng? Th竔 Th莕 Th筩h/#begin_combining_1(2)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d Ho祅g S綾 Th竛h H醓+%d Ng? Th竔 Th莕 Th筩h/#begin_combining_1(3)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d Lam S綾 Th竛h H醓+%d Ng? Th竔 Th莕 Th筩h/#begin_combining_1(4)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		format("Gh衟 %d H綾 S綾 Th竛h H醓+%d Ng? Th竔 Th莕 Th筩h/#begin_combining_1(5)",Compose_ShengHuo_Num_1,Compose_ShenShi_Num_1),
		"\n tr? v? t莕g trc/combining_flame_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name.."1 Th竛h H醓 b蕋 k?+1 Ng? Th竔 Th莕 Th筩h (b竛 ? Ng? C竎)=1 Ng? Th竔 Th竛h H醓",getn(tbSay),tbSay);
end

function combining_2_201207()
	local tbSay = {
		format("Gh衟 %d H錸g S綾 Th竛h H醓+%d V祅g/#begin_combining_2(1)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d L鬰 S綾 Th竛h H醓+%d V祅g/#begin_combining_2(2)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d Ho祅g S綾 Th竛h H醓+%d V祅g/#begin_combining_2(3)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d Lam S綾 Th竛h H醓+%d V祅g /#begin_combining_2(4)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		format("Gh衟 %d H綾 S綾 Th竛h H醓+%d V祅g/#begin_combining_2(5)",Compose_ShengHuo_Num_2,Compose_Coin_Num_2),
		"\n tr? v? t莕g trc/combining_flame_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name.."9 Th竛h H醓 b蕋 k?+30 V祅g=1 Ng? Th竔 Th竛h H醓",getn(tbSay),tbSay);
end

function guess_flame_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbBody = "T筰 h? ra 1 ch? s? (t? 1-100)  c竎 h? 畂竛 5 l莕, s? l莕 畂竛 tr髇g c祅g 輙 th? ph莕 thng c祅g l韓. S? l莕 tham gia tr? ch琲 m鏸 ng祔 l? t飝 ?, nh璶g ch? 頲 nh薾 thng 3 l莕.";
	local tbSay = {
		"H穣 b総 u 甶 /oly_begin_guess",
		"Nh薾 ph莕 thng l莕 trc/oly_get_last_guess_award",
		"\n r髏 lui/nothing",
	}
	Say(Activity_Ds_Name..tbBody,getn(tbSay),tbSay);
end

function lucky_star_201207()
	local tbSay = {};
--	tbSay.msg = Activity_Ds_Name.."一天累计点火次数达到 6 次，即可参加奥运幸运抽奖活动:\n   方式：输入一个1-9999之间的数字；\n   领奖流程：每晚21:00开奖，21:00-21:30中奖玩家需要来我这里进行中奖登记，前10名登记的玩家可以均分奖励。晚上21:30后可以领奖，22:00领奖结束，过时不能领奖。\n   奖励：每天1个天罡令，当日无人中奖（领奖），奖励将一直累计直到有人中奖或活动结束。\n   注意：幸运数字当日有效。";
	tbSay.msg = Activity_Ds_Name.."M鏸 ng祔 s? l莕 t輈h l騳 甶觤 h醓 t n 6 l莕, c? th? tham gia ho箃 ng r髏 thng H筺h V薾: \n   H譶h th鴆: t? 1-9999 nh藀 v祇 1 con s?; \n   L璾 tr譶h ph莕 thng: 21:00 m鏸 t鑙 s? m? thng, 21:00-21:30 nh鱪g ai tr髇g thng ph秈 n y  ng k?, 10 ngi ch琲 ng k? trc s? c? ph莕 thng. Sau 21:30 c? th? nh薾 thng, 22:00 k誸 th骳 nh薾 thng, qu? th阨 gian kh玭g th? nh薾 thng. \n Ph莕 thng: M鏸 ng祔 1 Thi猲 Cang L謓h, trong ng祔 kh玭g ai tr髇g thng (nh薾 thng), th? ph莕 thng s? 頲 t輈h l騳 cho n khi c? ngi tr髇g thng ho芻 ho箃 ng k誸 th骳. \n Ch? ?: S? H筺h V薾 c? hi謚 l鵦 trong ng祔.";
	tbSay.sel = {
		{"\n r髏 lui","nothing"},
	};
	temp_Talk(tbSay);
end

function oly_lucky_star_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	CheckAndDoRegularClear(EM_REGULAR_CLEAR_TYPE_DAILY);
--	local tbBody = "一天累计点火次数达到 6 次，即可参加奥运幸运抽奖活动。\n    目前累积奖励为：<color=green>%d个天罡令<color>；\n    今天的幸运数字是：<color=green>%s<color>；\n    你今天的幸运数字是：<color=green>%d<color>；\n    奖励：每天1个天罡令，当日无人中奖（领奖），奖励将一直累计直到有人中奖或活动结束。";
	local tbBody = "M鏸 ng祔 s? l莕 t輈h l騳 甶觤 h醓 t n 6 l莕, c? th? tham gia ho箃 ng r髏 thng H筺h V薾. \n Hi謓 t筰 t輈h l騳 r髏 thng l?: <color=green>%d Thi猲 Cang L謓h<color>; \n S? H筺h V薾 h玬 nay l?: <color=green>%s<color>; \n S? H筺h V薾 h玬 nay c馻 ngi l?: <color=green>%d<color>; \n Ph莕 thng: M鏸 ng祔 1 Thi猲 Cang L謓h, trong ng祔 kh玭g ai tr髇g thng (l躰h thng), ph莕 thng s? 頲 t輈h l騳 cho n khi c? ngi tr髇g thng ho芻 ho箃 ng k誸 th骳. ";
	local tbSay = oly_CreateDlgTable();
	local nTglNum,strNum,nMyluckNum = oly_GetBaseInfo();	
	tinsert(tbSay,"Tho竧/nothing");
	Say(Activity_Ds_Name..format(tbBody,nTglNum,strNum,nMyluckNum),getn(tbSay),tbSay);
end

function input_luck_num_201207()
	if gf_GetMyTaskByte(VET_OLY_TASK1,2,3) == 0 then
		AskClientForNumber("input_luck_num_cb_201207",1,OLY_MAX_LUCK_NUM,"Nh藀 ch? s? may m緉 c馻 c竎 h?");
	end
end

function input_luck_num_cb_201207(nNum)
	local nDayTime = oly_GetDayCurrTime(); --当天时间
	if nDayTime >= 0 and nDayTime < OLY_TIME_START then
		gf_SetMyTaskByte(VET_OLY_TASK1,2,3,nNum,TASK_ACCESS_CODE_OLYMPIC);
		Msg2Player(format("Ch? s? may m緉 c馻 c竎 h? l? %d",nNum));
	else
		Msg2Player("B﹜ gi? kh玭g th? nh藀 ch? s? may m緉 , h穣 quay l筰 v祇 ng祔 mai.");
	end
end

function goto_caji_map_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	local tbSay = {
		"уng ?/sure_201207",
		"Tho竧/nothing",
	}
	Say(Activity_Ds_Name.."C? mu鑞 甶 thu th藀 Lam S綾 v? L鬰 S綾 Th竛h H醓 kh玭g?",getn(tbSay),tbSay);
end

function sure_201207()
	if oly_IsActivityOpen() ~= 1 then
		Talk(1,"","Event  h誸 h筺");
		return 0;
	end
	if oly_Is_LevelSkill()	~= 1 then
		return 0;
	end
	NewWorld(328,1628,3981);
	SetFightState(1);
end

--登记
function register_mylucknum_201207()
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_Rigister");
end

--领奖
function get_lucknum_award_201207()
	if gf_GetTaskByte(VET_OLY_TASK1,4) == 0 then
		Talk(1,"","C竎 h? ch璦 ng k? kh玭g th? nh薾 ph莕 thng");
	end
	--领奖
	ApplyRelayShareData(Oly_Record3.szKey,Oly_Record3.nKey1,Oly_Record3.nKey2,Oly_CallBack_Script,"oly_CallBack_GetLuckPersonNum");
end