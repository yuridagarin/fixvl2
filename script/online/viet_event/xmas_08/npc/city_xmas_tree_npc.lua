--File name:	city_xmas_tree_npc.lua
--Describe:		圣诞树(城市)npc脚本
--Create Date:	2008-11-18
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\xmas_08\\xmas_func.lua")
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Giang Sinh 2008"				--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."C﹜ th玭g gi竜 h閕".."<color>: "


g_tbMap = 
{
	[100] = QZ_LUCK_BOX_NUM_XMAS_VIET,
	[200] = BJ_LUCK_BOX_NUM_XMAS_VIET,
	[300] = CD_LUCK_BOX_NUM_XMAS_VIET,
}

function main()
	if is_xmas_08_viet_open() == 0 then
		return
	end
	local selTab = {				
				"Nh薾 L? H閜 v? Long Huy誸 Ho祅/obtain_new_xmas_box",
				"Nh薾 h閜 qu? may m緉 (Vui gi竛g sinh c飊g nhau nh薾 thng)/obtain_lucky_box",
				"Ta ch? n xem th?/no",
				}
	Say(g_szInfoHead.."Ho箃 ng Qu? T苙g  C﹜ Th玭g Gi竛g Sinh di詎 ra t? ng祔 06-12-2008 n 24:00 ng祔 04-01-2009. Trong th阨 gian s? ki謓, t蕋 c? c竎 t礽 kho秐 頲 t筼 m韎 trong th阨 gian n祔 c? nh﹏ v藅 t c蕄 55 tr? l猲, 甶觤 s? m玭 l韓 h琻 1200, 甶觤 danh v鋘g l韓 h琻 600, 甶觤 t輈h l騳 T祅g Ki誱 l韓 h琻 1000 v? 甶觤 t輈h l騳 c玭g tr筺g T鑞g Li猽 l韓 h琻 500 th? c? th? n i tho筰 v韎 NPC C﹜ Th玭g Gi竛g Sinh  nh薾 v藅 ph萴 Long Huy誸 Ho祅 v? 1 H閜 Qu?.",getn(selTab),selTab);
end


function obtain_new_xmas_box()

	if GetTask(GAIN_PILL_08_XMAS_VIET) == 1 then
		Say(g_szInfoHead.."Чi hi謕  nh薾 r錳, kh玭g th? ti誴 t鬰 nh薾 頲 n鱝!",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no")
		return
	end
	
	if GetTask(GAIN_NEW_BOX_08_XMAS_VIET) == 1 then
		Say(g_szInfoHead.."Чi hi謕  nh薾 r錳, kh玭g th? ti誴 t鬰 nh薾 頲 n鱝!",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no")
		return
	end
	
	if is_could_award() == 0 then
		Say(g_szInfoHead.."C竎 h? v蒼 ch璦  甶襲 ki謓 l躰h thng",1,"Th藅 l? ng筰 qu?! T筰 h? xin c竜 t?./no")
		return
	end
	
	if gf_Judge_Room_Weight(2,40) == 0 then
		Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end
	if GetExtPoint(4) == 1 then
		if PayExtPoint(4,1) == 1 then
			if GetExtPoint(4) == 0 then		
				local nRetCode, nItemIdx = add_item_ex( {"Long Huy誸 ho祅",	2,	1,	1002,	1} )
				SetTask(GAIN_PILL_08_XMAS_VIET, 1)
				if nRetCode == 1 then
					SetItemExpireTime(nItemIdx, 7*24*3600)		
				end
				
				nRetCode = add_item_ex( {"H閜 qu?",	2,	1,	30035,	1} )
				SetTask(GAIN_NEW_BOX_08_XMAS_VIET, 1)
				if nRetCode == 1 then
					Say(g_szInfoHead.."R蕋 t鑤! Ngi  t c蕄 55 r錳 sao? Зy l? ph莕 qu? c馻 ngi, h穣 mau mau s? d鬾g, kh玭g kh衞 l筰 h誸 h筺 s? d鬾g.",1," t? c﹜ th玭g gi竛g sinh/no")
				end
			end
		end
	end
end


function obtain_lucky_box()
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 6 and nWeek ~= 0 then
		Say(g_szInfoHead.."C竎 h? v蒼 ch璦  甶襲 ki謓 l躰h thng",1,"K誸 th骳 i tho筰/no")
		return
	end

	local nTime = tonumber(date("%H%M"))
	if nTime < 930 or nTime >= 1033 then
		Say(g_szInfoHead.."C竎 h? v蒼 ch璦  甶襲 ki謓 l躰h thng",1,"K誸 th骳 i tho筰/no")
		return
	end

	local nDate = tonumber(date("%Y%m%d"))
	if nDate > GetTask(LUCK_BOX_DATE_08_XMAS_VIET) then
		SetTask(LUCK_BOX_DATE_08_XMAS_VIET, nDate)
		SetTask(LUCK_BOX_NUM_08_XMAS_VIET, 0)
		SetTask(LUCK_BOX_TURN_08_XMAS_VIET, 0)
	end
	
	if GetTask(LUCK_BOX_NUM_08_XMAS_VIET) >= 6 then
		Say(g_szInfoHead.."M鏸 ng祔 m鏸 nh﹏ v藅 ch? c? th? nh薾 6 h閜 qu? may m緉.",1,"K誸 th骳 i tho筰/no")
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
		Say(g_szInfoHead.."C竎 h? v蒼 ch璦  甶襲 ki謓 l躰h thng",1,"K誸 th骳 i tho筰/no")
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
	local nItemIdx = 0

	nRetCode, nItemIdx = AddItem(G, D, P, nItemNum)
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName..", V蒼 c遪 r蕋 nhi襲 ph莕 thng 產ng ch? b筺, xin m阨 h穣 ti誴 t鬰 tham gia ho箃 ng.");
		WriteLogEx(g_szLogTitle, "C﹜ Th玭g Gi竛g Sinh", nItemNum, szItemName, format("(%d,%d,%d)", G, D, P), GetTongName() )
	else
		WriteLogEx(g_szLogTitle, "C﹜ Th玭g Gi竛g Sinh", "", "", "","", "Thu 頲 th蕋 b筰, ".."AddItem return value = "..nRetCode)
	end
	return nRetCode, nItemIdx
end


function is_could_award()
	if GetCreateTime() < 1228406400 or GetCreateTime() >= 1231084800 then
		return 0
	end
	if GetExtPoint(4) ~=1 then
		return 0
	end
	if GetLevel() < 55 then
		return 0
	end
	if GetReputation() <= 600 then
		return 0
	end
	if GetTask(336) <= 1200 then
		return 0
	end
	if GetTask(1801) <= 1000 then
		return 0
	end
	if abs(GetTask(701)) <= 500 then
		return 0
	end
	return 1
end


function no()
end


