-- 世界收集任务的脚本头文件
Include("\\script\\task\\collection\\task_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

FILE_NAME = "\\script\\中原一区\\汴京\\npc\\行脚商人.lua"

Zgc_com_jue_table = {}						--诀要table
Zgc_adv_jue_talbe = {}						--高级诀要table
Zgc_com_jue_num = 0
Zgc_adv_jue_num = 0
Zgc_change_date_id = 951					--兑换日期
Zgc_change_date_num_id = 952				--兑换数量
Zgc_adv_jue_remain_day_id = 953				--上次兑换高级诀要的时间
Zgc_adv_jue_remain_times_id = 954			--上次兑换高级诀要到现在的次数
Zgc_com_jue_table = {
	{1,"Thi誹 L﹎ o quy誸"},
	{2,"Thi誹 L﹎ C玭 quy誸"},
	{3,"Tr秏 Ma o quy誸"},
	{4,"Phong C玭 quy誸"},
	{6,"Nhi猲 M閏 o quy誸"},
	{7,"V?Thng C玭 quy誸"},
	{8,"X?Th﹏ Quy誸"},
	{9,"Чi Nh?Lai quy誸"},
	{11,"Th蕋 B秓 Chi誹 quy誸"},
	{12,"La H竛 Quy襫 quy誸"},
	{13,"Ca Di謕 Th鑙 quy誸"},
	{15,"Vi У quy誸"},
	{16,"V╪ V﹏ quy誸"},
	{17,"La H竛 Tr薾 quy誸"},
	{18,"Чi Tu Di Chng"},
	{19,"V?秐h quy誸"},
	{21,"Ph鬰 H?quy誸"},
	{22,"Tu T﹎ quy誸"},
	{23,"Ng?Chuy觧 Ch?quy誸"},
	{24,"Ph?Ma Ch?quy誸"},
	{25,"Kim Cang y誹 quy誸"},
	{26,"La L玦 quy誸"},
	{27,"Ph鬰 Ma Th莕 quy誸"},
	{28,"V?Tng quy誸"},
	{30,"Minh Ch?quy誸"},
	{32,"Ch?竚 y誹 quy誸"},
	{33,"T﹎ Nh穘 quy誸"},
	{34,"чc Th輈h C鑤 quy誸"},
	{35,"Gi秈 чc B?quy誸"},
	{36,"C﹗ H錸 T躰h quy誸"},
	{37,"Ph?Quan quy誸"},
	{38,"Truy T﹎ Ti詎 quy誸"},
	{39,"Thu Minh quy誸"},
	{40,"Xuy猲 T﹎ quy誸"},
	{41,"Th鑙 чc quy誸"},
	{42,"筺 Ph竎h quy誸"},
	{43,"B筼 Ch﹎ quy誸"},
	{44,"H祄 Xa quy誸"},
	{45,"T醓 M謓h Ch﹎ quy誸"},
	{47,"Quan  Quy誸"},
	{48,"Nga My Ph藅 quy誸"},
	{49,"Ng鋍 N?Ki誱 quy誸"},
	{50,"ч Nguy猲 Quy誸"},
	{51,"Ph藅 Ph?quy誸"},
	{52,"Li猲 Hoa quy誸"},
	{54,"L璾 Th駓 y誹 quy誸"},
	{55,"Ph?T?quy誸"},
	{56,"B蕋 Di謙 quy誸"},
	{57,"Ph藅 Chi課 quy誸"},
	{58,"Ph藅  quy誸"},
	{60,"T飝 Kh骳 quy誸"},
	{61,"Kh骳 Ngh?quy誸"},
	{62,"Nguy謙 Th鵦 Kh骳 quy誸"},
	{63,"筺 Th駓 quy誸"},
	{64,"T躰h D?T?quy誸"},
	{65,"D?Nhi評 quy誸"},
	{66,"Dng Tam quy誸"},
	{68,"Ph蒼 C莔 quy誸"},
	{69,"?D?б quy誸"},
	{71,"C竔 Bang Chng quy誸"},
	{72,"Th玭g T?quy誸"},
	{73,"Thi猲 C﹏ quy誸"},
	{74,"B?Vng quy誸"},
	{75,"T醓 H莡 Th?quy誸"},
	{76,"Ti猽 Dao Du quy誸"},
	{77,"L鬰 H頿 y誹 quy誸"},
	{80,"C竔 Bang C玭 quy誸"},
	{81,"Khu X?quy誸"},
	{82,"Kh蕋 Th秓 quy誸"},
	{84,"Di謚 Th?Quy誸"},
	{85,"Th﹗ Chuy觧 quy誸"},
	{86,"T?Gi竝 quy誸"},
	{87,"Th﹗ Ho竛 quy誸"},
	{89,"V?ng Ki誱 quy誸"},
	{90,"L璾 Quang Ki誱 quy誸"},
	{91,"V?Μng Ki誱 quy誸"},
	{92,"Nhu V﹏ Ki誱 quy誸"},
	{93,"Li謙 Di謒 Ki誱 quy誸"},
	{94,"B玭 Ki誱 quy誸"},
	{95,"V?Ng?Ph竝 quy誸"},
	{96,"Th竔 Thanh Ki誱 quy誸"},
	{97,"Tri襫 Ki誱 quy誸"},
	{98,"L筩 Ki誱 quy誸"},
	{100,"Huy襫 Ki誱 Tr薾 quy誸"},
	{101,"Ng?Ki誱 quy誸"},
	{102,"Ch輓h Lng ki誱 quy誸"},
	{103,"Th竔 蕋 Ki誱 quy誸"},
	{104,"Th藀 Tam Ki誱 quy誸"},
	{105,"Huy襫  Ki誱 quy誸"},
	{106,"Thi猲 Thu莕 ki誱 quy誸"},
	{107,"B竧 Qu竔 Ki誱 quy誸"},
	{109,"B髏 Ph竝 quy誸"},
	{110,"Th竔 Ti猽 C玭g quy誸"},
	{111,"L鬰 H鉧 C玭g quy誸"},
	{112,"Th?V﹏ Tung quy誸"},
	{113,"Th蕋 Tinh Tr薾"},
	{115,"Thi誹  Quy誸"},
	{116,"B綾 u Tr薾 quy誸"},
	{117,"T祅 秐h Quy誸"},
	{118,"C祅 Kh玭 Quy誸"},
	{120,"Thng Ph竝 quy誸"},
	{121,"Ph?Phong Thng quy誸"},
	{122,"Ng?M?quy誸"},
	{123,"B玭 Lang Thng quy誸"},
	{124,"Chi課 мnh quy誸"},
	{125,"X秓 Chi課 quy誸"},
	{126,"Thi猲 Ho祅h Thng quy誸"},
	{127,"Anh H飊g quy誸"},
	{128,"Фo H秈 Thng quy誸"},
	{131,"Cung Ph竝 quy誸"},
	{132,"Li猲 X?Thu藅 quy誸"},
	{133,"Tr薾 Li謚 quy誸"},
	{134,"H錳 Long Ti詎 quy誸"},
	{135,"Tri襫 V﹏ Ti詎 quy誸"},
	{136,"K?M玭 чn quy誸"},
	{137,"Kh?Ti詎 quy誸"},
	{139,"Huy詎 Th莕 quy誸"},
	{140,"T鬰 M謓h quy誸"},
	{142,"B?ki誴 Ng?чc o Ph竝"},
	{143,"B?ki誴 D蒼 H錸 Ch?},
	{144,"B?ki誴 Thao Thi Thu藅"},
	{145,"B?ki誴 Thi чc Thu藅"},
	{146,"B?ki誴 Thi B閏 Чi Ph竝"},
	{147,"B?ki誴 T藀 Thi T?Kh?},
	{148,"B?ki誴 Ng?Thi Thu藅"},
	{149,"B?ki誴 V筺 чc 箃 M謓h o"},
	{150,"B?ki誴  T?H蕄 H錸 Kh?},
	{152,"B?ki誴 T?Linh Чi Ph竝"},
	{153,"B?ki誴 T?чc C玭g"},
	{155,"B?ki誴 H?C?M藅 Phng"},
	{156,"B?ki誴 Phong C?},
	{157,"B?ki誴 Dng C?B?Thu藅"},
	{158,"B?ki誴 Cu錸g Phong Tr秓"},
	{159,"B?ki誴 чc C?},
	{160,"B?ki誴 Huy誸 жnh C玭g"},
	{161,"B?ki誴 Huy誸 C?},
	{162,"B?ki誴 Hng C?},
	{163,"B?ki誴 Thi C?},
	{164,"B?ki誴 Y猽 C?},
	{165,"B?ki誴 T﹎ C?},
	{166,"B?ki誴 V筺 C?Th鵦 Thi猲"},			
}
Zgc_adv_jue_talbe = {
	{5,"Kim Chung Tr竜 quy誸"},
	{10,"Чt Ma V?quy誸"},
	{14,"Hu?Nh穘 quy誸"},
	{20,"Long Tr秓 Th?quy誸"},
	{29,"S?T?H鑞g"},
	{31,"Kim Cang Ch?quy誸"},
	{46,"M穘 Thi猲 V?quy誸"},
	{53,"Thanh Ph筺 quy誸"},
	{59,"Чi Bi quy誸"},
	{67,"Ph骳 Th駓 ph竝"},
	{70,"M?T﹎ Kh骳 quy誸"},
	{78,"T髖 謕"},
	{79,"T髖 Quy襫"},
	{83,"N?Thu quy誸"},
	{88,"Ф C萿 quy誸"},
	{99,"T輈h Dng Ki誱 quy誸"},
	{108,"Th蕋 Ti謙 Ki誱 quy誸"},
	{114,"Thi誹 Dng Quy誸"},
	{119,"Thng Thanh C玭g quy誸"},
	{129,"Ng?M?quy誸"},
	{130,"B輈h Thng quy誸"},
	{138,"To竔 Ti詎 quy誸"},
	{141,"L璾 Tuy謙 Ti詎 quy誸"},
	{151,"B?ki誴 Th玦 Thi T?Kh?},
	{154,"B?ki誴 Thi Li謙 Ma C玭g"},
	{168,"B?ki誴 T祄 C?},
	{167,"B?ki誴 Huy詎 C?}
}
Zgc_master_com_id = {
	205,206,207,208,209,350,390
}
--------------------------------------------主函数------------------------------------------
function main()
	local nMap, nX, nY = GetWorldPos()
	local strName = GetTargetNpcName()
	local time_h = tonumber(date("%H"))			--获得当前小时数（24小时制）
	
	if checkCollectNpc(nMap, strName) ==1 then
		if time_h >= 00 then
		Say("ng h醝 ta sao c?b玭 ba kh緋 n琲! Tuy ta kh玭g ph秈 l?ngi xu蕋 gia nh璶g l骳 n祇 c騨g ti猽 di猽 t?t筰, k?ph祄 phu t鬰 t?sao c?th?hi觰 頲?",
			3,
			"Ta n nh薾 nhi謒 v?thu th藀/#createCollectTalk(\"H祅h Cc Thng Nh﹏\")",
			"Ta n i B?ki誴/Dialog_main",
			"R阨 kh醝/Zgc_dialog_end"
		)
		elseif checkCollectNpc(nMap, strName) ==1 then
			createCollectTalk(strName)
		end
		return
	end
	if time_h >=00 then							--不同的时间对话不同
		Dialog_main()
	else
		Talk(2,"","ng h醝 ta sao c?b玭 ba kh緋 n琲! Tuy ta kh玭g ph秈 l?ngi xu蕋 gia nh璶g l骳 n祇 c騨g ti猽 di猽 t?t筰, k?ph祄 phu t鬰 t?sao c?th?hi觰 頲?","X璦 c?c﹗:  m閠 ng祔 ng h鋍 m閠 s祅g kh玭.")
	end	
end
--*********************************主对话函数************************
function Dialog_main()
	Say("G莕 y v?l﹎ loan tin b?ki誴 tuy謙 h鋍 c馻 c竎 m玭 ph竔 t nhi猲 bi課 m蕋 m閠 c竎h k?l? nghe n鉯 Minh Ch?Kim S琻 s?r琲 v祇 tay k?x蕌, h藆 qu?kh玭 lng do   i b?ki誴 ph秈 c?L謓h b礽 s?m玭, l穙 phu 頲 giao tr鋘g tr竎h gi髉  c竎 hi謕 kh竎h, xin h醝 b籲g h鱱 t譵 l穙 phu c?chuy謓 g?",
		4,
		"фi l謓h b礽 s?m玭 l蕐 B?Ki誴/Zgc_jue_change_main",		
		"H玬 nay c遪 bao nhi猽 l莕 i/Zgc_jue_change_time_inq",
		--"我要看看哪些是稀世诀要/Zgc_jue_change_com_jue_inq",
		"T譵 hi觰 quy t綾 i/Zgc_jue_change_rule_inq",
		"K誸 th骳/Zgc_dialog_end"
	)
end
------------------------------------------兑换对话----------------------------------------
function Zgc_jue_change_main()
	Say("Xin h穣 ch鋘 s?lng b?ki誴 ngi mu鑞 i.",
		5,
		"Ngi mu鑞 i 5 b?ki誴 b蕋 k?l蕐 1 b?ki誴 t?ch鋘 h?ph竔 (c莕 35 ti襫 V祅g v?5 b?ki誴)/exchange_yue",
		"Ngi mu鑞 i l謓h b礽 s?m玭 l蕐 1 b?ki誴 (c莕 2 ti襫 V祅g v?2 l謓h b礽 s?m玭)/#Zgc_jue_chg_cond_chk(1)",
		"Ngi mu鑞 i l謓h b礽 s?m玭 l蕐 5 b?ki誴 (c莕 10 ti襫 V祅g v?10 l謓h b礽 s?m玭)/#Zgc_jue_chg_cond_chk(5)",
		"Ngi mu鑞 i l謓h b礽 s?m玭 l蕐 10 b?ki誴 (c莕 20 ti襫 V祅g v?20 l謓h b礽 s?m玭)/#Zgc_jue_chg_cond_chk(10)",
		"K誸 th骳/Zgc_dialog_end"		
	)
end

----------------------------------------兑换主函数--------------------------------------
function Zgc_jue_chg_cond_chk(change_num)
	local Actor_function = GetPlayerFaction()
	local time_date_today = floor((GetTime()-57600)/86400)
	if Actor_function == 0 or GetLevel() < 11 then						--判断是否加入门派（未判断等级，因为加入门派等级就肯定达到要求）
		Say ("Ngi ph秈 t n c蕄 11 v?gia nh藀 m閠 m玭 ph竔 m韎  甶襲 ki謓 trao i.",
			1,
			"Ta bi誸 r錳!/Zgc_dialog_end"
		)
	elseif GetItemCount(2,0,Zgc_master_com_id[Actor_function]) < (2 * change_num) or GetCash() < (20000 * change_num) then		--判断兑换物品条件是否符合
		Say ("Чi hi謕 ng a v韎 l穙 phu! H穣 xem l謓h b礽 v?ng﹏ lng trong h祅h trang c? kh玭g? Nh?k? Nh蕋 nh ph秈 c?..(2*change_num).." l謓h b礽 v?"..(2*change_num).." Xu m韎 c?th?i"..change_num.." B?ki誴.",
			1,
			"Ta bi誸 r錳!/Zgc_dialog_end"
		)
	elseif GetFreeItemRoom() < change_num or (GetMaxItemWeight() - GetCurItemWeight()) < change_num then									--=========================在此加入负重和空格数的判断
		Say ("V?huynh  n祔! H祅h trang  y, s緋 x誴 xong h穣 quay l筰 nh?",
			1,
			"Ta bi誸 r錳!/Zgc_dialog_end"
		)
	elseif GetTask(Zgc_change_date_num_id) >= 20 and time_date_today <= GetTask(Zgc_change_date_id) then
		Say ("T猲 ti觰 t?n祔 tham qu? L穙 phu c遪 ph秈 chu萵 b?cho v?b籲g h鱱 kh竎.",
			1,
			"Ta bi誸 r錳!/Zgc_dialog_end"
		)
	elseif change_num > 1 and (GetTask(Zgc_change_date_num_id) >= (21 - change_num)) and time_date_today <= GetTask(Zgc_change_date_id) then
		Say ("H玬 nay b筺 ch?c?th?i b?ki誴"..(20 - GetTask(Zgc_change_date_num_id)).." l莕 y誹 quy誸!",
			1,
			"Ta bi誸 r錳!/Zgc_dialog_end"
		)	
	elseif Pay(20000 * change_num) == 1 and DelItem(2,0,Zgc_master_com_id[Actor_function],(2 * change_num)) ==1 then
		local com_jue_num = getn(Zgc_com_jue_table)
		local adv_jue_num = getn(Zgc_adv_jue_talbe)
		for i = 1, change_num do
			if GetTask(Zgc_adv_jue_remain_day_id) == 0 then		--如果玩家没有获得过高级诀要，则不受第二条件的限制。
				local change_num = random (1,((com_jue_num * 10) + adv_jue_num))
				if change_num > (com_jue_num * 10) then
					Zgc_jue_pay(1)
				else
					Zgc_jue_pay(0)
				end
			elseif GetTask(Zgc_adv_jue_remain_times_id) >= 30 and (time_date_today - GetTask(Zgc_adv_jue_remain_day_id)) >= 30then
				local change_num = random (1,((com_jue_num * 10) + adv_jue_num))
				if change_num > (com_jue_num * 10) then
					Zgc_jue_pay(1)
				else
					Zgc_jue_pay(0)
				end
			else 	
			 	local change_num = random (1,((com_jue_num * 10) + adv_jue_num))
				if change_num > (com_jue_num * 10) then
					Zgc_jue_pay(1)
				else
					Zgc_jue_pay(0)
				end
		end
	end
	else
		return	
	end
end

TSK_TMP_SELECT_YUE_YUE = 107
YUE_EXCHANGE = 5

tRouteYue =
{
		{"Thi誹 L﹎ T鬰 Gia", 1, {1,8}, {1,2}},
		{"Thi誹 L﹎ Thi襫 T玭g", 2, {17,25}, {5,6}},
		{"Thi誹 L﹎ V?T玭g", 3, {9,16}, {3,4}},
		{"Л阯g M玭", 4, {26,39}, {7,7}},
		{"Nga My Ph藅 Gia", 5, {40,50}, {8,9}},
		{"Nga My T鬰 Gia", 6, {51,59}, {10,11}},
		{"C竔 Bang T躰h Y", 7, {60,66}, {12,13}},
		{"C竔 Bang ?Y", 8, {67,73}, {14,15}},
		{"V?ng Чo Gia", 9, {74,91}, {16,17}},
		{"V?ng T鬰 Gia",10, {92,100}, {18,19}},	
		{"Dng Gia Thng K?, 11, {101,109}, {20,21}},
		{"Dng Gia Cung K?,12, {110,118}, {22,23}},
		{"Ng?чc Hi謕 чc", 13, {119,129}, {24,25}},
		{"Ng?чc T?чc", 14, {130,141}, {26,27}},
}

function exchange_yue()	
	local tSay = {}
	for i=1,getn(tRouteYue) do
		tinsert(tSay,format("%s/#do_exchange(%d)",tRouteYue[i][1],tRouteYue[i][2]))
	end
	tinsert(tSay,"Ta ch璦 c莕/Zgc_dialog_end")	
	Say("Ngi mu鑞 i b?ki誴 h?ph竔 n祇?",getn(tSay),tSay)	
end

function do_exchange(nSelected)	
	local time_date_today = floor((GetTime()-57600)/86400)
	if nSelected == 0 then
		return 0;
	end
	if gf_CheckPlayerRoute() == 0 or GetLevel() < 11 then
		Talk (1,"","Ngi ph秈 t n c蕄 11 v?gia nh藀 m閠 h?ph竔 m韎  甶襲 ki謓 trao i.")
		return 0;
	end
	if GetTask(Zgc_change_date_num_id) >= 20 and time_date_today <= GetTask(Zgc_change_date_id) then
		Talk (1,"","T猲 ti觰 t?n祔 tham qu? L穙 phu c遪 ph秈 chu萵 b?cho v?b籲g h鱱 kh竎.")
		return 0;
	end
	if GetCash() < 350000 then
		Talk(1, "", "Ng﹏ lng tr猲 ngi kh玭g !");
		return 0;
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end	
	SetTaskTemp(TSK_TMP_SELECT_YUE,nSelected)	
	local nSlot = YUE_EXCHANGE	
	PutinItemBox("фi Y誹 Quy誸" ,nSlot , "X竎 nh薾 mu鑞 th鵦 hi謓?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end	
	if (genre == 2 and detail == 6 and particular >= 0) then	
		return 1;
	end	
	Talk(1, "", "Ch?c?th?b?v祇 b?ki誴!");
	return 0;
end

function OnPutinComplete(param)	
	local nSelect = GetTaskTemp(TSK_TMP_SELECT_YUE)
	SetTaskTemp(TSK_TMP_SELECT_YUE,0)
	if param ~= 1 then
		Talk(1, "", "B?v祇 v藅 ph萴 kh玭g ng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= YUE_EXCHANGE then
		Talk(1, "", "S?lng v藅 ph萴 kh玭g ng");
		return 0;
	end	
	if get_yue_count(t, 2, 6) ~= YUE_EXCHANGE then
		Talk(1, "", "S?lng v藅 ph萴 kh玭g ng");
		return 0;							
	end	
	if GetCash() < 350000 then
		Talk(1, "", "Ng﹏ lng tr猲 ngi kh玭g ");
		return 0;
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end
	if Pay(350000) == 1 then
		local nResult = 1;
		for i = 1, getn(t) do			
			if DelItemByIndex(t[i][1], -1) ~= 1 then
				nResult = 0;
				break;
			end
		end		
		if nResult == 1 then
			local com_jue_num = getn(Zgc_com_jue_table)
			local adv_jue_num = getn(Zgc_adv_jue_talbe)
			local change_num = random (1,((com_jue_num * 5) + adv_jue_num))
			local change_jue_seq = 0
			local change_jue_id = 0
			local change_jue_times_now = 0
			local change_jue_name = ""
			local date_now = floor((GetTime()-57600)/86400)
			if GetTask(Zgc_change_date_id) >= date_now then
				change_jue_times_now = GetTask(Zgc_change_date_num_id) + 1
			else
				change_jue_times_now = 1
			end
			if change_num > (com_jue_num * 5) then
				local nRand = random(tRouteYue[nSelect][4][1],tRouteYue[nSelect][4][2])
				local nRet, nItemIdx = AddItem(2,6,Zgc_adv_jue_talbe[nRand][1],1)
				change_jue_name = Zgc_adv_jue_talbe[nRand][2]
				if nRet == 1 then
					if change_jue_times_now < 20 then
						Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", h玬 nay b筺 c遪"..(20-change_jue_times_now).." l莕 i b?ki誴")
					else
						Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", ng祔 mai h穣 quay l筰 y.")
					end
					SetTask(Zgc_change_date_id,date_now)
					SetTask(Zgc_change_date_num_id,change_jue_times_now)		
					SetTask(Zgc_adv_jue_remain_day_id,date_now)
					SetTask(Zgc_adv_jue_remain_times_id,0)
				end
			else
				local nRand = random(tRouteYue[nSelect][3][1],tRouteYue[nSelect][3][2])
				local nRet, nItemIdx = AddItem(2,6,Zgc_com_jue_table[nRand][1],1)
				change_jue_name = Zgc_com_jue_table[nRand][2]
				if nRet == 1 then
					if change_jue_times_now < 20 then
						Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", h玬 nay b筺 c遪"..(20-change_jue_times_now).." l莕 i b?ki誴")
					else
						Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", ng祔 mai h穣 quay l筰 y.")
					end				
					SetTask(Zgc_change_date_id,date_now)
					SetTask(Zgc_change_date_num_id,change_jue_times_now)
					local adv_jue_times = GetTask(Zgc_adv_jue_remain_times_id) + 1
					SetTask(Zgc_adv_jue_remain_times_id,adv_jue_times)
				end
			end		
		else
			WriteLogEx("Doi Yeu Quet","x鉧 item th蕋 b筰")		
		end
	end
end


function get_yue_count(t, id1, id2)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2) then
			nCount = nCount + 1;			
		end
	end
	return nCount;
end


-----------------------------------------诀要给予函数--------------------------------------
function Zgc_jue_pay(adv_flag)
	local change_jue_seq = 0
	local change_jue_id = 0
	local change_jue_times_now = 0
	local change_jue_name = ""
	local date_now = floor((GetTime()-57600)/86400)
	if GetTask(Zgc_change_date_id) >= date_now then
		change_jue_times_now = GetTask(Zgc_change_date_num_id) + 1
	else
		change_jue_times_now = 1
	end
	if adv_flag == 1 then
		change_jue_seq = random(1,getn(Zgc_adv_jue_talbe))
		change_jue_id = Zgc_adv_jue_talbe[change_jue_seq][1]
		change_jue_name = Zgc_adv_jue_talbe[change_jue_seq][2]
		local add_flag = AddItem(2,6,change_jue_id,1)
		if add_flag ~= 0 then
			if change_jue_times_now < 20 then
				Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", h玬 nay b筺 c遪"..(20-change_jue_times_now).." l莕 i b?ki誴")
			else
				Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", ng祔 mai h穣 quay l筰 y.")
			end
			--AddGlobalNews("[行脚商人]:"..GetName().."侠士获得了稀世诀要"..change_jue_name.."一本，祝他早日领悟武学真谛。")
			WriteLog("Ngi ch琲:"..GetName().."фi 1 quy觧 "..change_jue_name.."B?ki誴 cao c蕄.")
			SetTask(Zgc_change_date_id,date_now)
			SetTask(Zgc_change_date_num_id,change_jue_times_now)		
			SetTask(Zgc_adv_jue_remain_day_id,date_now)
			SetTask(Zgc_adv_jue_remain_times_id,0)
		else
			WriteLog("Ngi ch琲:"..GetName().."фi 1 quy觧 "..change_jue_name.." th蕋 b筰! Tr?quay l筰:"..add_flag..".")
		end
	else
		change_jue_seq = random (1,getn(Zgc_com_jue_table))
		change_jue_id = Zgc_com_jue_table[change_jue_seq][1]
		change_jue_name = Zgc_com_jue_table[change_jue_seq][2]
		local add_flag = AddItem(2,6,change_jue_id,1)
		if add_flag ~= 0 then
			if change_jue_times_now < 20 then
				Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", h玬 nay b筺 c遪"..(20-change_jue_times_now).." l莕 i b?ki誴")
			else
				Msg2Player("Ch骳 m鮪g! B筺 nh薾 頲 1 quy觧"..change_jue_name..", ng祔 mai h穣 quay l筰 y.")
			end
			SetTask(Zgc_change_date_id,date_now)
			SetTask(Zgc_change_date_num_id,change_jue_times_now)
			local adv_jue_times = GetTask(Zgc_adv_jue_remain_times_id) + 1
			SetTask(Zgc_adv_jue_remain_times_id,adv_jue_times)
		else
			WriteLog("Ngi ch琲:"..GetName().."фi b?ki誴 ph?th玭g"..change_jue_name.." th蕋 b筰, tr?quay l筰:"..add_flag..".")
		end
	end
end
------------------------------------------剩余兑换次数查询--------------------------------
function Zgc_jue_change_time_inq()
	local time_save = GetTask(Zgc_change_date_id)
	local change_time = GetTask(Zgc_change_date_num_id)
	local time_now = floor((GetTime()-57600)/86400)
	local times_remain = 20 
	if time_now - time_save < 1 then
		times_remain = 20 - change_time
	end
	Say ("H玬 nay b筺 ch?c?th?i b?ki誴 "..times_remain.."  l莕.",
		1,
		"Ta bi誸 r錳!/Zgc_dialog_end"
	)
end
------------------------------------------稀世诀要查询--------------------------------------
function Zgc_jue_change_com_jue_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_adv_jue_talbe) do
		dialog_string = dialog_string..Zgc_adv_jue_talbe[i][2]
		if floor(i/5)-(i/5) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(16-strlen(Zgc_adv_jue_talbe[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("Di y u l?b?ki誴\n hi誱 th蕐 c馻 c竎 m玭 ph竔"..dialog_string,
		1,
		"Ta bi誸 r錳!/Zgc_dialog_end"
	)
end
------------------------------------------兑换规则查询---------------------------------------
function Zgc_jue_change_rule_inq()
	Say("е t?<color=yellow>c蕄 11 tr?l猲<color> gia nh藀 m玭 ph竔 c?th?d飊g l謓h b礽 b鎛 m玭 i b?ki誴 m玭 ph竔, m鏸 ng祔 c?th?i t鑙 產 <color=yellow>20 l莕<color>, m鏸 l莕 t鑞 <color=yellow>2 l謓h b礽<color> v?<color=yellow>2 ti襫 V祅g<color>. Nh?k? M鏸 t鑙 t?<color=yellow>18 gi?24 gi?color> L穙 phu m韎 c?th?gi髉 ngi i.",
		1,
		"Ta bi誸 r錳!/Zgc_dialog_end"
	)
end
---------------------------------------------对话结束------------------------------------------
function Zgc_dialog_end()

end
