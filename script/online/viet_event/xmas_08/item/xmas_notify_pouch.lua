--File name:	xmas_notify_pouch.lua
--Describe:		锦囊大事件脚本
--Item ID:		2,1,30045
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")


g_szLogTitle = "Giang Sinh 2008"		--此处分为2段只是为了不增加新的翻译

g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}


function OnUse()
	if is_xmas_08_viet_open() == 0 then
		return
	end

	if GetTask(GAIN_STAR_08_XMAS_VIET) == 0 then
		if GetLevel() >= 50 then
			if gf_Judge_Room_Weight(1, 20) == 0 then
				Msg2Player("Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
				return
			end
			
			add_item_ex( {"Ng玦 Sao Gi竛g Sinh",	2,	1,	30044,	1} )
			SetTask(GAIN_STAR_08_XMAS_VIET, 1)
		end
	end
	local selTab = {
			"Gi竛g Sinh 蕀 竝 C飊g B╪g Nhi./#xmas_08_info_viet(1)",
			"Qu? T苙g C馻 C﹜ Th玭g./#xmas_08_info_viet(2)",
			"Truy T譵 C﹜ Th玭g./#xmas_08_info_viet(3)",
			"Vui Gi竛g Sinh C飊g Nhau Nh薾 Thng./#xmas_08_info_viet(4)",
			"S綾 M祏 Ph竜 Hoa./#xmas_08_info_viet(5)",
			"Nh薾 h閜 qu? may m緉 (Vui gi竛g sinh c飊g nhau nh薾 thng)/obtain_lucky_box",
			"K誸 th骳 i tho筰/no"
			}
	
	Say("Gi竛g sinh l筰 v? tr猲 to祅 c鈏 V? L﹎. Nh? nh?, ngi ngi 產ng r閚 r祅g ch祇 n 1 m gi竛g sinh an l祅h b猲 ngi th﹏ c馻 m譶h. Ho箃 ng gi竛g sinh b総 u t? 06-12-2008 n 04-01-2009, c竎 v? c? th? t譵 hi觰 th玭g tin chi ti誸 s? ki謓 nh? sau:\n",getn(selTab),selTab);
end
function xmas_08_info_viet(nType)
	local selTab =
	{
		{
		"Ho箃 ng Gi竛g Sinh 蕀 竝 C飊g B╪g Nhi di詎 ra t? ng祔 06-12-2008 n 24:00 ng祔 04-01-2009. Trong th阨 gian ho箃 ng, c竎 v? v? l﹎ nh﹏ s? c? th? th玭g qua nh qu竔 v? tham gia c竎 t輓h n╪g trong game  thu th藀 H閜 Qu? Gi竛g Sinh. M? c竎 H閜 qu? gi竛g sinh  thu th藀 c竎 nguy猲 li謚 c莕 thi誸, i tho筰 v韎 NPC B╪g Nhi  i l蕐 c竎 H閜 Qu?, m? c竎 h閜 qu? s? nh薾 頲 ph莕 thng. R蕋 nhi襲 ph莕 thng 產ng ch? qu? v?!.",
		},
		
		{
		"Ho箃 ng Qu? T苙g C﹜ Th玭g di詎 ra t? 06-12-2008 n 24:00 04-01-2009. trong th阨 gian s? ki謓, t蕋 c? c竎 t礽 kho秐 頲 t筼 m韎 trong th阨 gian n祔 c? nh﹏ v藅 t c蕄 55, 甶觤 s? m玭 l韓 h琻 1200, danh v鋘g l韓 h琻 600, 甶觤 T祅g Ki誱 l韓 h琻 1000 v? 甶觤 c玭g tr筺g T鑞g Li猽 l韓 h琻 500 th? c? th? n i tho筰 v韎 NPC C﹜ Th玭g GI竛g Sinh  nh薾 Long Huy誸 Ho祅 v? 1 H閜 Qu?. S? d鬾g Long Huy誸 Ho祅  t ngay c蕄  73, s? d鬾g H閜 Qu?  s? h鱱 1 trong nh鱪g trang b? T祅g Ki誱 8x.",
		},
			
		{
		"Ho箃 ng Truy T譵 C﹜ Th玭g di詎 ra v祇 c竎 ng祔 th? s竨, th? b秠 v? ch? nh藅 h祅g tu莕, t? ng祔 06-12-2008 n 24:00 ng祔 04-01-2009. M鏸 ng祔 c? 4 t xu蕋 hi謓 c﹜ th玭g tr猲 c竎 b秐  (13:30, 14:00, 19:00, 22:30) c竎 v? v? l﹎ nh﹏ s? h穣 d飊g v藅 ph萴 C﹜ K裲 Gi竛g Sinh (c? b筺 t筰 NPC B╪g Nhi)  trang tr? c竎 c﹜ th玭g 頲 ph﹏ b? tr猲 c竎 b秐  ch? nh. M鏸 ng祔 ch? c? th? trang tr? 10 c﹜ th玭g. H穣 nh? b藅 ch鴆 n╪g chi課 u(F9) l猲 nh?!",
		},
			
		{
		"Ho箃 ng vui gi竛g sinh c飊g nhau nh薾 thng di詎 ra v祇 c竎 ng祔 th? 7 ch? nh藅 t? 06-12-2008 n 24:00 04-01-2009. M鏸 ng祔 t? 13:300 n 14:30 (1 ti課g), t蕋 c? v? l﹎ nh﹏ s? c? th? th玭g qua c萴 nang i s? ki謓 ho芻 i tho筰 v韎 NPC C﹜ Th玭g Gi竛g Sinh (6 i th祅h th?) th? c? th? thu 頲 H閜 Qu? May M緉. Ngo礽 ra m鏸 ng祔 s? c? 1 nh﹏ v藅 頲 l鵤 ch鋘 ng蓇 nhi猲  trao t苙g ph莕 qu? c bi謙, i h閜 qu? c bi謙 ? NPC Gi竜 S?.",
		},
			
		{
		"Ho箃 ng Ph竜 Hoa di詎 ra v祇 c竎 ng祔 th? 6, th? 7 v? ch? nh藅 h祅g tu莕 ng祔 06-12-2008 n 24:00 04-01-2008. Trong th阨 gian t? 13:00 n 15:00, c竎 v? v? l﹎ nh﹏ s? c? th? n NPC Thng Nh﹏ T﹜ V鵦  nh薾 10 Ph竜 Hoa, s? d鬾g ph竜 hoa  nh薾 ph莕 thng, ch? c? th? s? d鬾g t鑙 產 10 ph竜 hoa trong 1 ng祔. Ngo礽 ra, c竎 v? v? l﹎ nh﹏ s? c遪 c? c? h閕 s? h鱱 nh鱪g b? ngo筰 trang p m総 khi tham gia t ph竜 hoa.",
		},
	}

	Say(selTab[nType][1], 1, "Ta mu鑞 xem ho箃 ng kh竎/OnUse" );
end

function obtain_lucky_box()
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 6 and nWeek ~= 0 then
		Say("C竎 h? v蒼 ch璦  甶襲 ki謓 l躰h thng",1,"K誸 th骳 i tho筰/no")
		return
	end

	local nTime = tonumber(date("%H%M"))
	if nTime < 930 or nTime >= 1033 then
		Say("C竎 h? v蒼 ch璦  甶襲 ki謓 l躰h thng",1,"K誸 th骳 i tho筰/no")
		return
	end
	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCK_BOX_DATE_08_XMAS_VIET) then
		SetTask(LUCK_BOX_DATE_08_XMAS_VIET, nDate)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, 0)
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, 0)
	end
	
	if GetTask(LUCK_BOX_NUM_08_XMAS_VIET) >= 6 then
		Say("M鏸 ng祔 m鏸 nh﹏ v藅 ch? c? th? nh薾 6 h閜 qu? may m緉.",1,"K誸 th骳 i tho筰/no")
		return
	end

	local tTime =
	{
		{930,938},
		{939,947},
		{948,956},
		{957,1005},
		{1006,1014},
		{1015,1023},
		{1024,1032},
	}
	local nTurn = 0
	local nTurnNum = getn(tTime)
	for i = 1, nTurnNum do
		if nTime >= tTime[i][1] and nTime <= tTime[i][2] then
			nTurn = i
			break
		end
	end
	if GetTask(LUCK_BOX_TURN_08_XMAS_VIET) == nTurn then
		Say("C竎 h? v蒼 ch璦  甶襲 ki謓 l躰h thng",1,"K誸 th骳 i tho筰/no")
		return
	else
		if gf_Judge_Room_Weight(1, 20) == 0 then
			Msg2Player("Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
			return
		end

		add_item_ex( {"H閜 Qu? May M緉",	2,	1,	30038,	1} )
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, nTurn)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, GetTask(LUCK_BOX_NUM_08_XMAS_VIET)+1 )

		local nMapID = GetWorldPos()
		if GetGlbValue(AWARD_MAP_IDX_XMAS_VIET) == nMapID then
			if GetGlbValue(AWARD_TURN_XMAS_VIET) == nTurn then
				SetGlbValue(g_tbMap[nMapID], GetGlbValue(g_tbMap[nMapID])+1)
				if GetGlbValue(g_tbMap[nMapID]) == 68 then
					add_item_ex( {"H閜 Qu? c Bi謙",	2,	1,	30037,	1} )
				end
			end
		end
	end
end

function add_item_ex(tItem)
	local szItemName = tItem[1]
	local G, D, P = tItem[2], tItem[3], tItem[4]
	local nItemNum = tItem[5]
	local nRetCode = 0

	nRetCode = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName..", V蒼 c遪 r蕋 nhi襲 ph莕 thng 產ng ch? b筺, xin m阨 h穣 ti誴 t鬰 tham gia ho箃 ng.");
		WriteLogEx(g_szLogTitle, "C萴 Nang Чi S? Ki謓", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "C萴 Nang Чi S? Ki謓", "", "", "", "", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
end

function no()
end



