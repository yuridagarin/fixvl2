Include("\\script\\online\\qixi08\\function.lua");
Include("\\script\\online\\qixi08\\star\\npc.lua");
Include("\\script\\online\\qixi08\\guess\\npc.lua");
Include("\\script\\online\\qixi08\\light\\npc.lua");
Include("\\script\\online\\qixi08\\box\\npc.lua");
Include("\\script\\lib\\time.lua");

g_tbEquipHead = 
{			--8级外防			8级内防				9级
	[1] = {{"B竎h Chi課 (Trang s鴆 ngo筰 ph遪g c蕄 8)",0,103,73},{"Huy襫 V? (Trang s鴆 n閕 ph遪g c蕄 8)",0,103,77},{"L鬰 Ly (Trang s鴆 c蕄 9)",0,103,81}},
	[2] = {{"? B祅 (Trang s鴆 ngo筰 ph遪g c蕄 8)",0,103,74},{"C鰑 Anh (Trang s鴆 n閕 ph遪g c蕄 8)",0,103,78},{"Th鬰 Qu? (Trang s鴆 c蕄 9)",0,103,82}},
	[3] = {{"H鋋 Hu﹏ (Trang s鴆 ngo筰 ph遪g c蕄 8)",0,103,75},{"Y猲 Hoa (Trang s鴆 n閕 ph遪g c蕄 8)",0,103,79},{"Ph? V? (Trang s鴆 c蕄 9)",0,103,83}},
	[4] = {{"Phi猲 Tuy誸 (Trang s鴆 ngo筰 ph遪g c蕄 8)",0,103,76},{"Y猲 M閚g (Trang s鴆 n閕 ph遪g c蕄 8)",0,103,80},{"秏 Nguy謙 (Trang s鴆 c蕄 9)",0,103,84}},
}
g_tbEquipCloth = 
{			--8级外防				8级内防				9级
	[1] = {{"Th蕋 Th莕 Y (竜 ngo筰 ph遪g c蕄 8)",0,100,73},{"Gi竛g T? B祇 (竜 n閕 ph遪g c蕄 8)",0,100,77},{"T? Ng﹏ B祇 (竜 c蕄 8)",0,100,81}},
	[2] = {{"Long L﹏ ? Kim Gi竝 (竜 ngo筰 ph遪g c蕄 8)",0,100,74},{"L璾 Kim Gi竝 Y (竜 n閕 ph遪g c蕄 8)",0,100,78},{"X輈h Luy謓 Gi竝 Y (竜 c蕄 9)",0,100,82}},
	[3] = {{"L鬰 Oanh V? Y (竜 ngo筰 ph遪g c蕄 8)",0,100,75},{"Song Чi V? Thng (竜 n閕 ph遪g c蕄 8)",0,100,79},{"Ng鋍 Thoa V? Y (竜 c蕄 9)",0,100,83}},
	[4] = {{"Doanh V? Thng (竜 ngo筰 ph遪g c蕄 8)",0,100,76},{"Ph鬾g V? Ngh? Sa (竜 n閕 ph遪g c蕄 8)",0,100,80},{"Чi Y猲 Ngh? Thng (竜 c蕄 9)",0,100,84}},
}
g_tbEquipTrousers = 
{			--8级外防				8级内防				9级
	[1] = {{"S? Ca (H? y ngo筰 ph遪g c蕄 8)",0,101,73},{"мnh M芻 (H? y n閕 ph遪g c蕄 8)",0,101,77},{"Th? V﹏ (H? y c蕄 9)",0,101,81}},
	[2] = {{"K譶h Thng (H? y ngo筰 ph遪g c蕄 8)",0,101,74},{"Щng Ng鋍 (H? y n閕 ph遪g c蕄 8)",0,101,78},{"Huy襫 Ti猽 (H? y c蕄 9)",0,101,82}},
	[3] = {{"Ph? Th髖 (H? y ngo筰 ph遪g c蕄 8)",0,101,75},{"V? M? (H? y n閕 ph遪g c蕄 8)",0,101,79},{"Kh? V﹏ (H? y c蕄 9)",0,101,83}},
	[4] = {{"H祅 ч (H? y ngo筰 ph遪g c蕄 8)",0,101,76},{"Tinh Lam (H? y n閕 ph遪g c蕄 8)",0,101,80},{"D? Ca (H? y c蕄 9)",0,101,84}},
}

g_tbEquipWeapon = 
{
	[0] = {{"Th莕 Qui (V? kh? c蕄 9)",0,0,15},			{" Dng 蕁 (V? kh? c蕄 10)",0,0,16}},	--手
	[1] = {{"Khoa Ph? (V? kh? c蕄 9)",0,1,54},			{"M閠 V? (V? kh? c蕄 10)",0,1,55}},	--暗器
	[2] = {{"H鋋 秐h (V? kh? c蕄 9)",0,2,37},			{"Nha C鰑 (V? kh? c蕄 10)",0,2,38}},	--剑
	[3] = {{"L藆 C秐h (V? kh? c蕄 9)",0,3,65},			{"Ngh辌h L﹏ (V? kh? c蕄 10)",0,3,66}},	--刀
	[4] = {{"Vi猲 б (V? kh? c蕄 9)",0,4,120},			{"B蕋 X? Chi X? (V? kh? c蕄 10)",0,4,121}},	--弓
	[5] = {{"Ng鋍 Tr? (V? kh? c蕄 9)",0,5,41},			{"Th莕 Ch﹎ (V? kh? c蕄 10)",0,5,42}},	--棍
	[6] = {{"C鰑 Long To祅 K輈h (V? kh? c蕄 9)",0,6,109},		{"Thng N? (V? kh? c蕄 10)",0,6,110}},	--枪
	[7] = {{"B輈h Th駓 (V? kh? c蕄 9)",0,7,13},			{"Thi猲 T玭 (V? kh? c蕄 10)",0,7,14}},	--双刀
	[8] = {{"M鬰 Ki襫 Li猲 Trng (V? kh? c蕄 9)",0,8,98},		{"Dc S? Trng (V? kh? c蕄 10)",0,8,99}},	--杖
	[9] = {{"Toan D? (V? kh? c蕄 9)",0,9,87},			{"Th竔 H? (V? kh? c蕄 10)",0,9,88}},	--笔
	[10] = {{"Чi Th竛h Di  (V? kh? c蕄 9)",0,10,76},	{"Kh? M閏 Long Ng﹎ (V? kh? c蕄 10)",0,10,77}},	--琴
	[11] = {{"V? Ng﹏ (V? kh? c蕄 9)",0,11,13},		{"Thanh Long (V? kh? c蕄 10)",0,11,14}},	--爪
}

g_tbRouteEquip = 
{
	[0]={1,2,3,4,5,6,7,8,9,10,11},
	[1]={0,3,5,8},
 	[2]={3,5},
	[3]={8},
	[4]={0},
 	[5]={1},
 	[6]={1},
	[7]={2,10},
	[8]={2},
	[9]={10},
	[10]={0,5},
	[11]={0},
	[12]={5},
	[13]={2,9},
	[14]={2},
	[15]={9},
	[16]={4,6},
	[17]={6},
	[18]={4},
	[19]={7,11},
	[20]={7},
	[21]={11},
}

g_tbEquip = {g_tbEquipHead,g_tbEquipCloth,g_tbEquipTrousers,g_tbEquipWeapon};

function main()
	local nLevel = GetLevel()
	if nLevel <= 30 then
		Talk(1,"",g_szInfoHead.."Ъng c蕄 qu? th蕄, ho箃 ng y猽 c莡 c蕄 th蕄 nh蕋 l? <color=yellow>31<color>.");
		return 0;
	end;
	local selTab = {};
	local nDate = tonumber(date("%Y%m%d"));
	local nYear1,nMonth1,nDay1 = QX08_GetDate(g_nGameBeginDate);
	local nYear2,nMonth2,nDay2 = QX08_GetDate(g_nGameEndDate);
	local nYear3,nMonth3,nDay3 = QX08_GetDate(g_nAwardEndDate);
	if nDate < g_nGameBeginDate then
		Talk(1,"",g_szInfoHead.."Th阨 gian ho箃 ng <color=yellow>"..nYear1.."ni猲"..nMonth1.."Nguy謙"..nDay1.." n "..nYear2.."ni猲"..nMonth2.."Nguy謙"..nDay2.."<color>, v? thi誹 hi謕 n祔 n l骳 nh? gh? l筰 xem.");
		return 0;
	end;
	if nDate > g_nGameEndDate then
		local selTab2 = {};
		if nDate <= g_nAwardEndDate then
			tinsert(selTab2,"D飊g 甶觤 thi u i ph莕 thng (Th阨 h筺: "..nYear3.."ni猲"..nMonth3.."Nguy謙"..nDay3..")/point_award");
		end;
		tinsert(selTab2,"K誸 th骳 i tho筰/nothing");
		Say(g_szInfoHead.."Th阨 gian l莕 ho箃 ng n祔 l? <color=yellow>"..nYear1.."ni猲"..nMonth1.."Nguy謙"..nDay1.." n "..nYear2.."ni猲"..nMonth2.."Nguy謙"..nDay2.."<color>, hi謓  qu? th阨 gian ho箃 ng, xin l莕 sau quay l筰.",getn(selTab2),selTab2);
		return 0;
	end;
	local szGameName,nGameID = QX08_GetTodayGame();
	local nYear4,nMonth4,nDay4 = QX08_GetDate(g_nQiXiBeginDate);
	local nYear5,nMonth5,nDay5 = QX08_GetDate(g_nQiXiEndDate);
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	if nDate <= g_nQiXiEndDate then
		tinsert(selTab,"L? th蕋 t辌h c飊g nhau c莡 nguy謓 (Th阨 gian m?: "..nYear4.."ni猲"..nMonth4.."Nguy謙"..nDay4.." n "..nYear5.."ni猲"..nMonth5.."Nguy謙"..nDay5..")/aoyun_star_main");
	end;
	if nGameID == GAME_ID_GUESS then
		tinsert(selTab,"Thi u Thi猲 C? Th莕 To竛 (Th? 2, th? 4, th? 6)/#enter_aoyun_game(1)");
	elseif nGameID == GAME_ID_BOX then
		tinsert(selTab,"Thi u 箃 B秓 K? Binh (Th? 3, th? 5, th? 7)/#enter_aoyun_game(2)");
	elseif nGameID == GAME_ID_LIGHT then
		tinsert(selTab,"H閕 th緋 n (Ch? nh藅)/#enter_aoyun_game(3)");
	end;
	if nDate <= g_nAwardEndDate then
		tinsert(selTab,"D飊g 甶觤 thi u i ph莕 thng (Th阨 h筺: "..nYear3.."ni猲"..nMonth3.."Nguy謙"..nDay3..")/point_award");
	end;
--	tinsert(selTab,"领取“天下第一比武邀请函”/get_ticket");
	tinsert(selTab,"Xem th阨 gian ho箃 ng/see_game_schedule");
	tinsert(selTab,"Nh薾 hng d蒼 ho箃 ng tr遪 20 n╩/get_book");
	if nDate >= g_nYearsBeginDate and nDate <= g_nYearsEndDate then
		tinsert(selTab,"Nh薾 danh hi謚 M鮪g tr遪 20 n╩ (Th阨 h筺 nh薾: "..nYear6.."ni猲"..nMonth6.."Nguy謙"..nDay6..")/get_years_title");
	end
	if nDate <= 20080823 then
		tinsert(selTab,"Ta mu鑞 nh薾 b錳 thng H閕 th緋 n ch? nh藅 trc (17/8). (Th阨 h筺: 23/8)/diandeng_buchang");
	end 	
	tinsert(selTab,"Ta n xem th?/nothing");
	if DEBUG_VERSION == 1 then
		tinsert(selTab,"L鑙 v祇 ki觤 tra/test_entry");
	end;
	Say(g_szInfoHead.."N╩ 1988 玭g C莡 B? Qu﹏ vi誸 ra wps, nh d蕌 th祅h l藀 c馻 c玭g ty Kingsoft, n nay  20 n╩, trong 20 n╩ , Kingsoft ng cay c? vinh quang c? nh璶g cho d? l骳 n祇 c騨g c? s? 駈g h? c馻 m鋓 ngi. T? b﹜ gi? n 23 gi? 27/1/2009, s? m? ho箃 ng K? ni謒 20 n╩ Kingsoft, hoan ngh猲h m鋓 ngi tham gia, ta  chu萵 r蕋 nhi襲 tr? ch琲 nh? h蕄 d蒼. M鏸 ng祔 ch? c? th? tham gia m閠 tr? ch琲 nh?. <color=yellow>H玬 nay: ["..szGameName.."]. Th阨 gian ho箃 ng: "..nYear1.."ni猲"..nMonth1.."Nguy謙"..nDay1.." n "..nYear2.."ni猲"..nMonth2.."Nguy謙"..nDay2.." m鏸 ng祔 t? 9:00 n 23:00<color>. Xin ch? ?, m鏸 ngi nhi襲 nh蕋 ch? c? th? t輈h l騳 200 甶觤.",getn(selTab),selTab);
end;

function see_game_schedule()
	local selTab = {
				"Th? 2: Thi猲 C? Th莕 To竛/#know_game_detail(1)",
				"Th? 3: 箃 B秓 K? Binh/#know_game_detail(2)",
				"Th? 4: Thi猲 C? Th莕 To竛/#know_game_detail(1)",
				"Th? n╩: 箃 B秓 K? Binh/#know_game_detail(2)",
				"Th? 6: Thi猲 C? Th莕 To竛/#know_game_detail(1)",
				"Th? 7: 箃 B秓 K? Binh/#know_game_detail(2)",
				"Ch? nh藅: H閕 th緋 n/#know_game_detail(3)",
				"Ta  hi觰/main",
				}
	Say(g_szInfoHead.."Sau y l? s緋 x誴 c馻 th? 2:",getn(selTab),selTab);
end;

function know_game_detail(nGameID)
	if nGameID == GAME_ID_GUESS then
		Talk(1,"see_game_schedule",g_szInfoHead.."H? th鑞g ch鋘 ng蓇 nhi猲 1 s? t? 0 n 100, sau  b筺 c? 5 c? h閕 畂竛 s? n祔, c祅g 畂竛 頲 s韒 th? ph莕 thng c祅g t鑤. <color=red>Ch? ?: Ph莕 thng ph秈 頲 nh薾 trong ng祔<color>.");
	elseif nGameID == GAME_ID_BOX then
		Talk(1,"see_game_schedule",g_szInfoHead.."B筺 v? h秓 h鱱  v祇 b秐 , h? th鑞g m鏸 v遪g s? gi秏 1 Rng theo s? ngi, ch? c? ngi gi祅h 頲 rng m韎 c? th? ? l筰 ti誴 t鬰 tr? ch琲. Gi? v鱪g c祅g v? sau s? nh薾 ph莕 thng c祅g t鑤. <color=red>Ch? ?: Ph莕 thng ph秈 頲 nh薾 trong ng祔<color>.");
	elseif nGameID == GAME_ID_LIGHT then
		Talk(1,"see_game_schedule",g_szInfoHead.."Quan s竧 k? th? t? n 頲 th緋, c╪ c? g頸 ? c馻 h? th鑞g m? th緋 n, t鎛g c閚g c? 5 秈, vt 秈 c祅g nhi襲 ph莕 thng c祅g t鑤. <color=red>Ch? ?: Ph莕 thng ph秈 頲 nh薾 trong ng祔<color>.");
	end;
end;

function get_ticket()
	local nDate = tonumber(date("%Y%m%d"));
	if GetTask(TSK_AOYUN_GET_TICKET_DATE) < nDate then
		if gf_JudgeRoomWeight(2,30,g_szInfoHead) == 0 then
			return 0;
		end;
		SetTask(TSK_AOYUN_GET_TICKET_DATE,nDate);
		AddItem(2,0,1069,10);
		Msg2Player("B筺 nh薾 頲 10 t蕀 'Th? m阨 T? v? Thi猲 h?  nh蕋'");
		Talk(1,"main",g_szInfoHead.."C? 'Th? m阨 T? v? Thi猲 h?  nh蕋' m韎 c? th? tham gia thi u, h玬 nay g鰅 ngi 10 t蕀, h穣 nh薾 l蕐. D飊g h誸 n誹 v蒼 mu鑞 tham gia h穣 <color=yellow>tham gia l玦 i Чi h閕 t? v? Thi猲 h?  nh蕋, m鏸 l莕 tham gia s? c? th? nh薾 頲 1 t蕀 'Th? m阨 Чi h閕 t? v? Thi猲 h?  nh蕋'.<color>");
	else
		Talk(1,"main",g_szInfoHead.."Xin l鏸, ngi  nh薾 'Th? m阨 Чi h閕 t? v? Thi猲 h?  nh蕋' h玬 nay, nh璶g v蒼 c? th? nh薾 th? m阨 khi <color=yellow>tham gia Чi h閕 t? v? Thi猲 h?  nh蕋<color>, ho芻 ng祔 mai h穣 n t譵 ta.");
	end;
end;

function test_entry()
	local selTab = {
			"Thi u Thi猲 C? Th莕 To竛/aoyun_guess_main",
			"Thi u 箃 B秓 K? Binh/aoyun_box_main",
			"觤 Жng H閕/aoyun_light_main",
			"Kh玭g c? g?/nothing",
			}
	Say(g_szInfoHead.."в ki觤 tra",getn(selTab),selTab);
end;

function use_point()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear,nMonth,nDay = QX08_GetDate(g_nAwardEndDate);
	if nDate > g_nAwardEndDate then
		Talk(1,"",g_szInfoHead.."Th阨 gian i trang b?  h誸, xin ch? ho箃 ng l莕 sau.");
		return 0;
	end;
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local selTab = {
				"D飊g 甶觤 i trang b? linh kh? cao (Th阨 h筺: "..nYear.."ni猲"..nMonth.."Nguy謙"..nDay..")/exchange_equipment",
				"L祄 sao i trang b? linh kh? cao/know_how_to_get_point",
				"T筸 kh玭g i ph莕 thng/nothing",
				}
	Say(g_szInfoHead.."H祅h t萿 giang h?, kh玭g th? thi誹 trang b?, n誹 trang b? t鑤 n? c? th? gi髉 b筺 c駈g c? a v? tr猲 giang h?. в ban thng cho c竎 v? anh h飊g, tham gia ho箃 ng s? c? c? h閕 nh薾 頲 trang b? linh kh? cao. 觤 ho箃 ng hi謓 t筰 c馻 b筺 l?: <color=yellow>"..nPoint.."<color>",getn(selTab),selTab);
end;

function point_award()
	local nDate = tonumber(date("%Y%m%d"));
	local nYear,nMonth,nDay = QX08_GetDate(g_nAwardEndDate);
	if nDate > g_nAwardEndDate then
		Talk(1,"",g_szInfoHead.."Th阨 gian i trang b?  h誸, xin ch? ho箃 ng l莕 sau.");
		return 0;
	end;
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local strtab = {
				"D飊g 甶觤 i ph莕 thng (Th阨 h筺: "..nYear.."ni猲"..nMonth.."Nguy謙"..nDay..")/exchange_award",
				"L祄 sao d飊g 甶觤 i ph莕 thng/know_how_to_get_point",
				"T筸 kh玭g i ph莕 thng/nothing"
				};
	Say(g_szInfoHead.."Ngi c? th? d飊g 甶觤  i c竎 lo筰 ph莕 thng t筰 y, 甶觤 kh玭g  th? c? th? tham gia ho箃 ng thu th藀, nh? v藋 tuy kh玭g c? ph莕 thng b譶h thng, nh璶g c? ph莕 thng 甶觤 r蕋 cao. 觤 hi謓 t筰 l?: <color=yellow>"..nPoint.."<color>, xin trc 23 gi? ng祔 "..nYear.."ni猲"..nMonth.."Nguy謙"..nDay.." nh薾 ph莕 thng.",getn(strtab),strtab);
end

function exchange_award()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	local strtab = {
				"Ta mu鑞 d飊g 1 甶觤 t輈h l騳 i 1 Rng k? ni謒 20 n╩/change_one_box",
				"Ta mu鑞 d飊g 10 甶觤 t輈h l騳 i ph莕 thng/#ask_exchange_award(10)",
				"Ta mu鑞 d飊g 50 甶觤 t輈h l騳 i ph莕 thng/#ask_exchange_award(50)",
				"Ta mu鑞 d飊g 200 甶觤 t輈h l騳 i ph莕 thng/#ask_exchange_award(200)",
				"Ta mu鑞 d飊g 200 甶觤 t輈h l騳 i 1 quy觧 H頿 Th祅h M藅 T辌h/exchange_miji",
				"Rng k? ni謒 20 n╩ c? th? m? ra ph莕 thng n祇/know_20box_award",
				"Tr? l筰 i ph莕 thng sau/nothing",
				}
	Say(g_szInfoHead.."觤 hi謓 l?: <color=yellow>"..nPoint.."<color>, ngi mu鑞 i ph莕 thng n祇?",getn(strtab),strtab);
end

function change_one_box()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 1 then
		Talk(1,"",g_szInfoHead.."Xin l鏸, ngi ch璦 c? 甶觤 t輈h l騳.");
	else
		Say(g_szInfoHead.."Mu鑞 d飊g 1 甶觤 t輈h l騳 i 1 Rng k? ni謒 20 n╩ kh玭g?",
			3,
			"?, ta mu鑞 i./input_box_num",
			"Kh玭g, ta nh莔!/exchange_award",
			"Tr? l筰 i ph莕 thng sau/nothing")
	end
end

function input_box_num()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	AskClientForNumber("confirm_give_box",1,nPoint,"mu鑞 i m蕐 rng?");
end

function confirm_give_box(nCount)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nCount then
		return 0;
	end
	if gf_Judge_Room_Weight(1,nCount*10,g_szInfoHead) ~= 1 then
		return 0;
	end 
	SetTask(TSK_AOYUN_POINT,nPoint-nCount);
	AddItem(tItemName[6][2],tItemName[6][3],tItemName[6][4],nCount);
	Msg2Player("B筺 nh薾 頲 "..nCount.."c竔"..tItemName[6][1]);	
end

function know_20box_award()
	if IB_VERSION == 1 then
		Talk(2,"exchange_award",g_szInfoHead.."Rng k? ni謒 20 n╩ c? th? m? 頲: \nNg鵤 di chuy觧 120%,  b襫 200 甶觤 (Dng M玭 l? chi課 m? di chuy觧 35%,  b襫 1000 甶觤)\nM藅 t辌h cao c蕄 S? M玭 (ngi ch琲 ch璦 gia nh藀 l璾 ph竔 s? nh薾 頲 quy觧 m藅 t辌h l璾 ph竔 ng蓇 nhi猲)\n100 tri謚 kinh nghi謒 (l璾 ?, khi kinh nghi謒 c馻 b筺 t n 2 t?, th? ph莕 d? ra s? b? m蕋, m鏸 tu莕 ch? c? th? i th祅h c玭g 1 l莕)\nмnh H錸 Thi猲 Th筩h Th莕 Th筩h (cng h鉧 v藅 ph萴, khi  cng h鉧 l? 7 th? kh玭g th? cng h鉧 n鱝)\nThi猲 Qu竔 Th筩h(d飊g th╪g c蕄 trang b? Vi猰 д, trang b? tng qu﹏, trang b? nguy猲 so竔 v? i trang b? Thi猲 мa Huy襫 Ho祅g th祅h trang b? Thi猲 Qu竔)",g_szInfoHead.."\nM秐h Thi猲 Th筩h (trang b? cng h鉧 c蕄 1-4 ti猽 hao v藅 ph萴)\nThi猲 Th筩h Tinh Th筩h (trang b? cng h鉧 c蕄 8-15 ti猽 hao v藅 ph萴)\nKinh nghi謒 l藀 phng ng c蕄\nHuy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓\n    Ph莕 thng ? tr猲, s? c╪ c? v祇 ch譨 kh鉧 d飊g  m? b秓 rng m? c? t? l? kh竎 nhau, t蕋 c? nh鱪g v藅 ph萴 ? tr猲, tr? <color=yellow>kinh nghi謒, Thi猲 Qu竔 Th筩h, Huy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓<color>, u c? th? giao d辌h 頲, ch骳 b筺 may m緉!");
	else
		Talk(2,"exchange_award",g_szInfoHead.."Rng k? ni謒 20 n╩ c? th? m? ra 頲: \nNg鵤 di chuy觧 120%,  b襫 200 甶觤 (Dng M玭 l? chi課 m? di chuy觧 35%,  b襫 1000 甶觤)\nM藅 t辌h cao c蕄 S? M玭 (ngi ch璦 gia nh藀 l璾 ph竔 s? nh薾 頲 1 quy觧 m藅 t辌h l璾 ph竔 ng蓇 nhi猲)\n100 tri謚 kinh nghi謒 (l璾 ?, khi kinh nghi謒 c馻 b筺 t n 2 t?, th? ph莕 d? ra s? b? m蕋, m鏸 tu莕 ch? c? th? i th祅h c玭g 1 l莕)\nThi猲 Th筩h Linh Th筩h (cng h鉧 trang b? tr鵦 ti誴 n c蕄 )\nThi猲 Qu竔 Th筩h(d飊g th╪g c蕄 trang b? Vi猰 д, trang b? tng qu﹏, trang b? nguy猲 so竔 v? i trang b? Thi猲 мa Huy襫 Ho祅g th祅h trang b? Thi猲 Qu竔)\nNguy謙 Hoa ho芻 N? Oa Tinh Th筩h",g_szInfoHead.."\nKinh nghi謒 l藀 phng ng c蕄\nHuy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓\n    Ph莕 thng ? tr猲, s? c╪ c? v祇 ch譨 kh鉧 d飊g  m? b秓 rng m? c? t? l? kh竎 nhau, t蕋 c? nh鱪g v藅 ph萴 ? tr猲, tr? <color=yellow>kinh nghi謒, Thi猲 Qu竔 Th筩h, Huy Ho祅g Chi Th駓 v? Vinh D? Chi Th駓<color>, u c? th? giao d辌h 頲, ch骳 b筺 may m緉!");
	end
end

function ask_exchange_award(nJifen)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nJifen then
		Talk(1,"",g_szInfoHead.."Xin l鏸, 甶觤 kh玭g   i ph莕 thng, 甶觤 hi謓 l?: <color=yellow>"..nPoint.."<color>.")
		return 0
	end
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_EXP_NUM,0);
		SetTask(TSK_AOYUN_YI_EXP,0);
	end
	if GetTask(TSK_AOYUN_EXP_NUM) >= g_nExpNum then
		Talk(1,"",g_szInfoHead.."Xin l鏸, ph莕 thng kinh nghi謒 m鏸 ngi m鏸 tu莕 ch? 頲 i "..g_nExpNum.." l莕, tu莕 n祔  i r錳, tu莕 sau n 甶.");
		return 0
	end
	local nLv = GetLevel();
	local nExpArg = nLv^3/80^3;
	local nExp = floor(tJifenAward[nJifen][6]*nExpArg);
	local nExpNum = GetTask(TSK_AOYUN_EXP_NUM);
	Say(g_szInfoHead.."Mu鑞 d飊g "..nJifen.." 甶觤 t輈h l騳 i "..tJifenAward[nJifen][5].."c竔"..tJifenAward[nJifen][1].." v?"..nExp.." kinh nghi謒 kh玭g? <color=red>Ch? ?, cho d? i ph莕 thng n祇, ph莕 thng kinh nghi謒 m鏸 tu莕 nhi襲 nh蕋 ch? nh薾 "..g_nExpNum.." l莕, y l? l莕 "..(nExpNum+1).." nh薾 ph莕 thng.<color>",
			3,
			"?, ta mu鑞 i./#confirm_exchange_award("..nJifen..")",
			"Kh玭g, ta nh莔!/exchange_award",
			"Tr? l筰 i ph莕 thng sau/nothing")
end

function confirm_exchange_award(nJifen)
	if gf_Judge_Room_Weight(2,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < nJifen then
		Talk(1,"",g_szInfoHead.."Xin l鏸, 甶觤 kh玭g   i ph莕 thng, 甶觤 hi謓 l?: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end
	local nWeek = GetWeekSequence(1,0);
	if GetTask(TSK_AOYUN_AWARD_WEEK) < nWeek then
		SetTask(TSK_AOYUN_AWARD_WEEK,nWeek);
		SetTask(TSK_AOYUN_EXP_NUM,0);
		SetTask(TSK_AOYUN_YI_EXP,0);
	end
	if GetTask(TSK_AOYUN_EXP_NUM) >= g_nExpNum then
		Talk(1,"",g_szInfoHead.."Xin l鏸, ph莕 thng kinh nghi謒 m鏸 ngi m鏸 tu莕 ch? 頲 i "..g_nExpNum.." l莕, tu莕 n祔  i r錳, tu莕 sau n 甶.");
		return 0;
	end
	local nLv = GetLevel();
	local nExpArg = nLv^3/80^3;
	local nExp = floor(tJifenAward[nJifen][6]*nExpArg);	
	SetTask(TSK_AOYUN_POINT,nPoint-nJifen);
	SetTask(TSK_AOYUN_EXP_NUM,GetTask(TSK_AOYUN_EXP_NUM)+1);
	AddItem(tJifenAward[nJifen][2],tJifenAward[nJifen][3],tJifenAward[nJifen][4],tJifenAward[nJifen][5]);
	ModifyExp(nExp);
	Msg2Player("B筺 nh薾 頲 "..tJifenAward[nJifen][5].."c竔"..tJifenAward[nJifen][1].." v?"..nExp.." kinh nghi謒.");
	WriteLog("[Ho箃 ng K? ni謒 20 n╩]: Ngi ch琲 "..GetName().."S? d鬾g "..nJifen.."фi ph莕 thng.");
	Talk(1,"exchange_award",g_szInfoHead.."Ch骳 m鮪g b筺 nh薾 頲 "..tJifenAward[nJifen][5].."c竔"..tJifenAward[nJifen][1].." v?"..nExp.." kinh nghi謒.");
end

function exchange_miji()
	local strtab = {
				"T? Linh Chi課 ? Ph? (hi謚 qu? Kim Thi襫 v? Chi猰 Y)/#ask_change_miji(1)",
				"T? Linh Thi猲 Y Ph? (hi謚 qu? Thi猲 H? v? Chi猰 Y)/#ask_change_miji(2)",
				"T? Linh T? Y Ph? (hi謚 qu? T? H? v? Chi猰 Y)/#ask_change_miji(3)",
				"Ta ch鋘 nh莔 r錳./exchange_award",
				"T筸 kh玭g i ph莕 thng/nothing"
				}
	Say(g_szInfoHead.."mu鑞 i m藅 t辌h n祇?",getn(strtab),strtab);	
end

function ask_change_miji(nType)
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 200 then
		Talk(1,"",g_szInfoHead.."Xin l鏸, 甶觤 kh玭g   i ph莕 thng, 甶觤 hi謓 l?: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end	
	Say(g_szInfoHead.."Mu鑞 d飊g 200 甶觤 t輈h l騳 i <color=yellow>"..tMijiName[nType][1].."<color> ch??",
			3,
			"?, ta mu鑞 i./#confirm_exchange_miji("..nType..")",
			"Kh玭g, ta nh莔!/exchange_miji",
			"T筸 kh玭g i ph莕 thng/nothing")	
end

function confirm_exchange_miji(nType)
	if gf_Judge_Room_Weight(1,50) ~= 1 then
		return 0;
	end	
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < 200 then
		Talk(1,"",g_szInfoHead.."Xin l鏸, 甶觤 kh玭g   i ph莕 thng, 甶觤 hi謓 l?: <color=yellow>"..nPoint.."<color>.")
		return 0;
	end
	SetTask(TSK_AOYUN_POINT,nPoint-200);
	AddItem(tMijiName[nType][2],tMijiName[nType][3],tMijiName[nType][4],1);
	Msg2Player("D飊g 200 甶觤 t輈h l騳 i 1 quy觧 "..tMijiName[nType][1]);
	WriteLog("[Ho箃 ng K? ni謒 20 n╩]: Ngi ch琲 "..GetName().."D飊g 200 甶觤 t輈h l騳 i 1 quy觧 "..tMijiName[nType][1]);	
end

function exchange_equipment()
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < g_nEquipPoint then
		Talk(1,"",g_szInfoHead.."Xin l鏸, 甶觤 t輈h l騳 kh玭g   i 1 m鉵 trang b?, 輙 nh蕋 c莕 c? <color=yellow>"..g_nEquipPoint.."<color> 甶觤 m韎 c? th? i 1 m鉵 trang b?.");
		return 0;
	end;
	local selTab = {
				"Trang s鴆/#exchange_equipment_1(1)",
				"Ngo筰 trang/#exchange_equipment_1(2)",
				"H? y/#exchange_equipment_1(3)",
				"V? kh?/#exchange_equipment_1(4)",
				"T筸 th阨 kh玭g i/nothing",
				}
	Say(g_szInfoHead.."Xin ch鋘 v? tr? trang b?: ",getn(selTab),selTab);
end;

function exchange_equipment_1(nEquipType)
	local selTab = {};
	local nBody = GetBody();
	local tbEquip = g_tbEquip[nEquipType];
	if nEquipType ~= 4 then
		for i=1,getn(tbEquip[nBody]) do
			tinsert(selTab,tbEquip[nBody][i][1].."/#exchange_equipment_2("..nEquipType..","..i..")");
		end;
	else
		tinsert(selTab,"V? kh? c蕄 9/#exchange_equipment_2("..nEquipType..",1)");
		tinsert(selTab,"V? kh? c蕄 10/#exchange_equipment_2("..nEquipType..",2)");
	end;
	tinsert(selTab,"Ch鋘 l筰/exchange_equipment");
	tinsert(selTab,"T筸 th阨 kh玭g i/nothing");
	local szEquipName = get_equip_describe(nEquipType);
	Say(g_szInfoHead.."B筺  ch鋘 1 "..szEquipName..", ti誴 theo xin ch鋘 ng c蕄 c馻 trang b?: ",getn(selTab),selTab);
end;

function exchange_equipment_2(nEquipType,nLevel)
	local nPlayerRoute = GetPlayerRoute();
	SetTask(TSK_WEAPON_TYPE,0);
	if nPlayerRoute == 2 and nEquipType == 4 then 	--万恶的少林俗家
		local selTab = {
					"o/#exchange_equipment_2_1("..nEquipType..","..nLevel..",1)",
					"C玭/#exchange_equipment_2_1("..nEquipType..","..nLevel..",2)",
					"Ch鋘 l筰/exchange_equipment",
					"T筸 th阨 kh玭g i/nothing",
					}
		Say(g_szInfoHead.."Xin ch鋘 lo筰 v? kh?: ",getn(selTab),selTab);
		return 0;
	end;
	exchange_equipment_2_1(nEquipType,nLevel);
end;

function exchange_equipment_2_1(nEquipType,nLevel,nType)
	if nType then
		SetTask(TSK_WEAPON_TYPE,nType);
	end;
	local selTab = {
				"S? l? (Linh kh? 111)/#exchange_equipment_3("..nEquipType..","..nLevel..",1)",
				"S? ch絥 (Linh kh? 110)/#exchange_equipment_3("..nEquipType..","..nLevel..",2)",
				"Ch鋘 l筰/exchange_equipment",
				"T筸 th阨 kh玭g i/nothing",
				}
	local szEquipName = get_equip_describe(nEquipType,nLevel)
	Say(g_szInfoHead.."B筺  ch鋘 1 "..szEquipName..", ti誴 theo xin ch鋘 甶觤 linh kh? ch絥:",getn(selTab),selTab);

end;

function exchange_equipment_3(nEquipType,nLevel,nJO)
	local selTab = {
				"уng ? i /#exchange_equipment_4("..nEquipType..","..nLevel..","..nJO..")",
				"Ch鋘 l筰/exchange_equipment",
				"T筸 th阨 kh玭g i/nothing",
				}
	local szEquipName = get_equip_describe(nEquipType,nLevel,nJO);
	Say(g_szInfoHead.."B筺  ch鋘 1 "..szEquipName..", b筺 x竎 nh薾 mu鑞 i?",getn(selTab),selTab);
end;

function exchange_equipment_4(nEquipType,nLevel,nJO)
	if gf_JudgeRoomWeight(2,200,g_szInfoHead) == 0 then
		return 0;
	end;
	local szEquipName,tbEquipInfo = get_equip_describe(nEquipType,nLevel,nJO);
	local nID1,nID2,nID3 = tbEquipInfo[2],tbEquipInfo[3],tbEquipInfo[4];
	local nPoint = GetTask(TSK_AOYUN_POINT);
	if nPoint < g_nEquipPoint then
		Talk(1,"",g_szInfoHead.."Xin l鏸, 甶觤 t輈h l騳 kh玭g   i 1 m鉵 trang b?, 輙 nh蕋 c莕 c? <color=yellow>"..g_nEquipPoint.."<color> 甶觤 m韎 c? th? i 1 m鉵 trang b?.");
		return 0;
	end;
	local nLingqi = 0;
	if nJO == 1 then
		nLingqi = 111;
	else
		nLingqi = 110;
	end;
	local nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,1,4,0,0,0,0,0,0,0,0,nLingqi);
	SetEquipCanChouQu(nItemIdx,1);
	SetTask(TSK_AOYUN_POINT,nPoint-g_nEquipPoint);
	szEquipName = sf_RemoveTag(szEquipName,"<",">");
	Msg2Player("B筺 i "..g_nEquipPoint.." 甶觤 t輈h lu? ho箃 ng i 1 "..szEquipName);
	WriteLog("[Ho箃 ng Olympic]:"..GetName().."  i 1 "..szEquipName..". T輈h lu? c遪: "..(nPoint-g_nEquipPoint));
end;

function know_how_to_get_point()
	Talk(2,"point_award",g_szInfoHead.."Tham gia ho箃 ng m鏸 ng祔, b筺 s? nh薾 頲 ph莕 thng v? 甶觤 t輈h lu?. Ph莕 thng c? ng c蕄 kh竎 nhau s? nh薾 頲 甶觤 t輈h lu? kh竎 nhau.\nPh莕 thng c蕄 1: 5 甶觤\nPh莕 thng c蕄 2: 4 甶觤\nPh莕 thng c蕄 3: 3 甶觤\nPh莕 thng c蕄 4: 2 甶觤\nPh莕 thng c蕄 5: 1 甶觤",g_szInfoHead.."\nS? d鬾g 1 甶觤 t輈h lu?  i 1 'Rng k? ni謒 20 n╩'\nS? d鬾g 10 甶觤 t輈h lu?  i 1 'Rng k? ni謒 20 n╩' + [2 tri謚*l藀 phng ng c蕄 ngi ch琲/l藀 phng 80] 甶觤 kinh nghi謒\nS? d鬾g 50 甶觤 t輈h lu?  i 8 'Rng k? ni謒 20 n╩'+[5 tri謚*l藀 phng ng c蕄 ngi ch琲/l藀 phng 80] 甶觤 kinh nghi謒\nS? d鬾g 200 甶觤 t輈h lu?  i 35 'Rng k? ni謒 20 n╩'+[10 tri謚*l藀 phng ng c蕄 ngi ch琲/l藀 phng 80] 甶觤 kinh nghi謒\nS? d鬾g 200 甶觤 t輈h lu?  i 1 H頿 Th祅h M藅 T辌h\n    <color=red>Ch? ?, m鏸 tu莕 ch? c? th? i ph莕 thng kinh nghi謒 nhi襲 nh蕋 l? 21 l莕, b秓 rng c? th? i kh玭g gi韎 h筺.<color>");
end;

function get_equip_describe(nEquipType,nLevel,nJO)
	local tbEquipName = {"Trang s鴆","Ngo筰 trang","Qu莕 ","V? kh?"};
	local szEquipName = "";
	local szLingQi = "";
	local tbEquipInfo = {};
	local nBody = GetBody();
	if nEquipType == nil then
		return "";
	end;
	local tbEquip = g_tbEquip[nEquipType];
	if nLevel == nil and nJO == nil then
		return "<color=yellow>"..tbEquipName[nEquipType].."<color>";
	elseif nLevel ~= nil and nJO == nil then
		if nEquipType ~= 4 then
			szEquipName = "<color=yellow>"..tbEquip[nBody][nLevel][1].."<color>";
		else
			if nLevel == 1 then
				szEquipName = "<color=yellow>V? kh? c蕄 9<color>";
			elseif nLevel == 2 then
				szEquipName = "<color=yellow>V? kh? c蕄 10<color>";
			end;
		end;
		return szEquipName;
	else
		if nEquipType ~= 4 then
			szEquipName ="<color=yellow>".. tbEquip[nBody][nLevel][1].."<color>";
			tbEquipInfo = tbEquip[nBody][nLevel];
		else
			if nLevel == 1 then
				szEquipName = "<color=yellow>V? kh? c蕄 9<color>";
			elseif nLevel == 2 then
				szEquipName = "<color=yellow>V? kh? c蕄 10<color>";
			end;
			local nRoute = GetPlayerRoute();
			local nWeaponIdx = 0;
			if nRoute == 2 then
				nWeaponIdx = g_tbRouteEquip[nRoute][GetTask(TSK_WEAPON_TYPE)];
			else
				nWeaponIdx = g_tbRouteEquip[nRoute][random(1,getn(g_tbRouteEquip[nRoute]))];
			end;
			tbEquipInfo = g_tbEquipWeapon[nWeaponIdx][nLevel];
			if gf_CheckPlayerRoute() == 1 then
				szEquipName = tbEquipInfo[1];
			end;
		end;
		if nJO == 1 then
			szLingQi = "<color=red>Linh kh? 111<color>";
		elseif nJO == 2 then
			szLingQi = "<color=red>Linh kh? 110<color>";
		end;
		szEquipName = szLingQi.." c馻 <color=yellow>"..szEquipName.."<color>"
		return szEquipName,tbEquipInfo;
	end;
end;

function enter_aoyun_game(nType)	
	if nType == GAME_ID_GUESS then
		aoyun_guess_main();
	elseif nType == GAME_ID_BOX then
		aoyun_box_main();
	elseif nType == GAME_ID_LIGHT then
		aoyun_light_main();
	end;
end;

function diandeng_buchang()
	if GetTask(571) ~= 0 then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 b錳 thng r錳.");
		return
	end
	local nGuan = GetTask(TSK_AOYUN_LIGHT_GUAN);
	if nGuan == 0 then
		Talk(1,"",g_szInfoHead.."Tu莕 trc ngi kh玭g tham gia h閕 hoa ng n猲 kh玭g th? nh薾 ph莕 thng.");
	else
		QX08_GetAward(3,6-nGuan,571); 		
	end
end

function get_book()
	if GetItemCount(2,0,1090) >= 1 then
		Talk(1,"",g_szInfoHead.."Kh玭g ph秈 tr猲 ngi ngi  c? m閠 c竔 r錳 sao?");
		return 0
	end
	AddItem(2,0,1090,1);
end

function get_years_title()
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	Say(g_szInfoHead.."Hai mi n╩ trc, C莡 B? Qu﹏ ti猲 sinh  vi誸 n猲 ph莕 m襪 x? l? wps, nh d蕌 vi謈 s竛g l藀 Kingsoft. Ch韕 m総  20 n╩ tr玦 qua, Kingsoft  tr秈 qua bi誸 bao th╪g tr莔, nh璶g kh玭g c? s? quan t﹎ 駈g h? c馻 ngi d飊g th? s? kh玭g c? Kingsoft ng祔 h玬 nay. T? 18/11 n 23h 24/11, nh﹏ d辮 k? ni謒 20 n╩ th祅h l藀 Kingsoft, ch髇g t玦  chu萵 b? m閠 s? l? v藅, hy v鋘g b筺 s? th輈h!",
			3,
			"Nh薾 danh hi謚 M鮪g tr遪 20 n╩ (Th阨 h筺 nh薾: "..nYear6.."ni猲"..nMonth6.."Nguy謙"..nDay6..")/ask_get_title",
			"Ki觤 tra th阨 gian nh薾 danh hi謚 v? th阨 gian hi謚 qu?/check_title_time",
			"Ta ch? n xem th?/nothing");
end

function ask_get_title()
	local nHour = tonumber(date("%H"));
	if GetTask(TSK_YEARS_BEGIN_DATE) ~= 0 then
		Talk(1,"",g_szInfoHead.."B筺  nh薾 danh hi謚 r錳.");
		return 0;
	end
	if nHour >= 23 then
		Say(g_szInfoHead.."B﹜ gi?  qu? 23h, n誹 b筺 nh薾 danh hi謚 l骳 n祔, b筺 s? kh玭g nh薾 頲 kinh nghi謒 1h c馻 ng祔 h玬 nay. Khuy猲 b筺 ng祔 mai h穣 nh薾 danh hi謚. B筺 c? mu鑞 nh薾 l骳 n祔 kh玭g?",
			2,
			"Ta mu鑞 nh薾 /ask_get_title2",
			"Ng祔 mai l筰 n nh薾 /nothing");
	else
		ask_get_title2();
	end
end

function ask_get_title2()
	Say(g_szInfoHead.."Danh hi謚 k? ni謒 20 n╩, sau khi s? d鬾g, m鏸 ph髏 s? t╪g 0.5% kinh nghi謒, l韓 h琻 <color=yellow>"..tYearsExp[IB_VERSION][1].."<color> gi?, t鑙 產 nh薾 頲 "..tYearsExp[IB_VERSION][1]..", m鏸 ng祔 c? hi謚 qu? trong 1h, <color=yellow>7 ng祔<color> sau danh hi謚 s? bi課 m蕋.",
		2,
		"Ta bi誸 r錳, ta mu鑞 nh薾 danh hi謚/confirm_get_title",
		"Ta ch璦 mu鑞 nh薾 danh hi謚/nothing")
end

function confirm_get_title()
	local nDate = tonumber(date("%Y%m%d"));
	if IsTitleExist(3,8) > 0 then
		return
	end	
	if AddTitle(3, 8) > 0 then
		SetCurTitle(3,8);
	end
	SetTask(TSK_YEARS_BEGIN_DATE,nDate);
	local nEndDate = tf_GetResultDate(GetTask(TSK_YEARS_BEGIN_DATE),g_nYearsDays-1);
	SetTask(TSK_YEARS_END_DATE,nEndDate);	
end

function check_title_time()
	local nBeginDate = GetTask(TSK_YEARS_BEGIN_DATE);
	local nYear6,nMonth6,nDay6 = QX08_GetDate(g_nYearsEndDate);
	if nBeginDate == 0 then
		Talk(1,"get_years_title",g_szInfoHead.."Th阨 gian h誸 h筺 nh薾 danh hi謚 l?: <color=yellow>"..nYear6.."ni猲"..nMonth6.."Nguy謙"..nDay6.." ng祔<color>.");
	else
		local nEndDate = GetTask(TSK_YEARS_END_DATE);
		local nYear1,nMonth1,nDay1 = QX08_GetDate(nBeginDate);
		local nYear2,nMonth2,nDay2 = QX08_GetDate(nEndDate);
		Talk(1,"get_years_title",g_szInfoHead.."Th阨 gian nh薾 danh hi謚 c馻 b筺 l? <color=yellow>"..nYear1.."ni猲"..nMonth1.."Nguy謙"..nDay1.." ng祔<color>, th阨 gian h誸 h筺 nh薾 kinh nghi謒 l? <color=yellow>"..nYear2.."ni猲"..nMonth2.."Nguy謙"..nDay2.." ng祔<color>.");
	end
end