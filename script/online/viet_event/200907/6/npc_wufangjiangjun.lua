--====================================================
--create by baiyun 2009.6.3
--describe:越南版7月份活动之六卧虎藏龙，武芳将军脚本
--====================================================
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function main()
	tSay = {
					"Ta mu鑞 nh薾 ph莕 thng c蕄  73/#get_aword(73)",
					"Ta mu鑞 nh薾 ph莕 thng c蕄  74/#get_aword(74)",
					"Ta mu鑞 nh薾 ph莕 thng c蕄  75/#get_aword(75)",
					"Ta mu鑞 nh薾 ph莕 thng c蕄  76/#get_aword(76)",
					"Ta mu鑞 nh薾 ph莕 thng c蕄  77/#get_aword(77)",
					"Ta mu鑞 nh薾 ph莕 thng c蕄  78/#get_aword(78)",
					"Trang k?/nextpage",
					"T筰 h? ch? gh? ngang!/dlgover",
			}
						
	if CheckStateNHTL() == 2 then
		tinsert(tSay,1,"Ta mu鑞 nh薾 thng th╪g c蕄 73/levelup")
	end

	if CheckStateNHTL() == 1 or  CheckStateNHTL() == 2 then
		Say("<color=green>V? Phng Tng Qu﹏<color>: S? ki謓 Ng鋋 H? T祅g Long di詎 ra t? ng祔<color=red>19-06-2009 n 24:00 30-11-2009<color>. Trong th阨 gian n祔, khi t 頲 c竎 m鑓 甶襲 ki謓 nh薾 thng (xem th猰 tr猲 trang ch?), ng o c? th? n g苝 ta  nh薾 ph莕 thng.",	getn(tSay),tSay)
	else
		Say("C竎 h? ch璦  th阨 gian  k輈h ho箃 nh薾 thng, ( 8 ti課g k? t? th阨 甶觤 ng nh藀 u ti猲) xin h穣 quay l筰 sau!",0)
	end
end

function nextpage()
	if CheckStateNHTL() == 1 or  CheckStateNHTL() == 2 then
		Say("<color=green>V? Phng Tng Qu﹏<color>: S? ki謓 Ng鋋 H? T祅g Long di詎 ra t? ng祔<color=red>19-06-2009 n 24:00 30-11-2009<color>. Trong th阨 gian n祔, khi t 頲 c竎 m鑓 甶襲 ki謓 nh薾 thng (xem th猰 tr猲 trang ch?), ng o c? th? n g苝 ta  nh薾 ph莕 thng.",
			8,
			"Ta mu鑞 nh薾 ph莕 thng c蕄  79/#get_aword(79)",
			"Ta mu鑞 nh薾 ph莕 thng c蕄  80/#get_aword(80)",
			"Ta mu鑞 nh薾 ph莕 thng c蕄  81/#get_aword(81)",
			"Ta mu鑞 nh薾 ph莕 thng c蕄  82/#get_aword(82)",
			"Ta mu鑞 nh薾 ph莕 thng c蕄  83/#get_aword(83)",
			"Ta mu鑞 nh薾 ph莕 thng c蕄  84/#get_aword(84)",
			"Trang trc/main",
			"T筰 h? ch? gh? ngang!/dlgover");
	else
		Say("Ho箃 ng  k誸 th骳!",0)
	end
end

function CheckStateNHTL()
	local nRet = 0
	local nExtVal = GetExtPoint(EXT_POINT)	
	if (VerifyDate(3) == 1 and GetBit(nExtVal,1) == 1)  then
		nRet = 2	
	elseif  (VerifyDate(2) == 1) then
		nRet = 1
	end			
	return nRet
end

function GetEventBit(nBit)
	return GetBit(GetExtPoint(EXT_POINT),nBit)	
end

function SetEventBit(nBit)
	local nExtVal = GetExtPoint(EXT_POINT)
	local nExtVal2 = SetBit(nExtVal,nBit,1)
	
	local nExtFinal = nExtVal2 - nExtVal

	if AddExtPoint(EXT_POINT,nExtFinal) == 1 then
		return 1
	else
		return 0
	end
end

function levelup()
	if GetLevel() >= 73 then
		Say("C竎 h?  t ng c蕄 73 r錳, kh玭g th? nh薾 thng!",0)
		return
	end
	if GetEventBit(2) == 0 then
		if SetEventBit(2) == 1 then
			SetLevel(73, 454)
			ResetProperty()
			ModifyExp(20000000)
			Say("Ch骳 m鮪g c竎 h?  th╪g c蕄 73, vui l遪g ng nh藀 l筰!",0)
			Msg2Player("B筺 nh薾 頲 20000000 甶觤 kinh nghi謒.")
			WriteLogEx("Ngoa Ho Tang Long","nh薾 ph莕 thng th╪g c蕄")
		else
			WriteLogEx("Ngoa Ho Tang Long","nh薾 ph莕 thng th╪g c蕄 th蕋 b筰")
		end
	else
		Say("Ch糿g ph秈 c竎 h?  nh薾 thng r錳 sao?",0)
	end
end



function dlgover()
end

function get_aword(nLevel)
--时间戳
--1245394800,是2009-06-19 0点
--1249282800,是2009-08-02 24点
	if CheckStateNHTL() == 1 or CheckStateNHTL() == 2 then		
		if GetEventBit(1) == 0 then -- C竎 t礽 kho秐 t? t筼 c馻 gamer
			if GetExtPoint(1) == 0 then -- Th阨 gian t筼 t礽 kho秐 ko ng quy nh			
				Talk(1, "", "<color=green>V? Phng Tng Qu﹏<color>: T礽 kho秐 c馻 c竎 h? kh玭g ph秈 t筼 trong th阨 gian y猽 c莡.");
				return
			end
		end
		if GetPlayerRoute() == 0 then
			Talk(1, "", "<color=green>V? Phng Tng Qu﹏<color>: Ch璦 gia nh藀 m玭 ph竔 kh玭g th? nh薾 thng.");
			return
		end
		local bHaveLearnFullSkill = get_full_skill_level()
		if (bHaveLearnFullSkill == 0) then
			Talk(1, "", "<color=green>V? Phng Tng Qu﹏<color>: C竎 h? v蒼 ch璦 h鋍  k? n╪g c蕄 55.");
			return	
		end
		if GetLevel() < 73 then
			Talk(1, "", "<color=green>V? Phng Tng Qu﹏<color>: C蕄 c馻 i hi謕 v蒼 ch璦 , kh玭g th? nh薾 thng.");
			return
		end
		if GetEventBit(nLevel - 70) == 1  then
			Talk(1, "", "<color=green>V? Phng Tng Qu﹏<color>: Чi hi謕  nh薾 thng r錳, kh玭g th? ti誴 t鬰 nh薾 thng.");
			return
		end
		confim_get_aword(nLevel);
	end
end

function confim_get_aword(nLevel)
	local nAwordLevel = check_aword_level();
	if nAwordLevel == 0 or nAwordLevel < nLevel then
		Talk(1, "", "<color=green>V? Phng Tng Qu﹏<color>: Kh玭g  甶襲 ki謓 nh薾 ph莕 thng n祔");
		return
	end
	warning_get_aword(nLevel, nAwordLevel);--警告玩家领取奖励
end

function warning_get_aword(nWantLevel, nLevel)
	Say("Nh薾 ph莕 thng l? ph莕 thng c蕄 <color=red>"..nWantLevel.."<color>, ngi c? th? nh薾 ph莕 thng cao nh蕋 l?  ph莕 thng c蕄 <color=red>"..nLevel.."<color>. C? ch綾 mu鑞 nh薾 ph莕 thng c蕄 "..nWantLevel.." kh玭g??",
		2,
		"Ta mu鑞 nh薾 /#confirm_confirm("..nWantLevel..")",
		"в ta suy ngh? l筰 xem./nothing");
end

--最终发奖了
function confirm_confirm(nLevel)
	if GetEventBit(nLevel - 70) == 1  then
		Talk(1, "", "<color=green>V? Phng Tng Qu﹏<color>: Чi hi謕  nh薾 thng r錳, kh玭g th? ti誴 t鬰 nh薾 thng.");
		return
	end
	if gf_Judge_Room_Weight(5, 100, " ") == 0 then
		return
	end
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	if SetEventBit(nLevel - 70) == 1 then
		gf_SetLogCaption("Ho箃 ng ng鋋 h? t祅g long");
		if nLevel == 73 or nLevel == 76 or nLevel == 77 or nLevel == 80 or nLevel == 84 then
			local nRetCode, nItem = gf_AddItemEx(tb_wohucanglong_item_aword[nLevel][2], tb_wohucanglong_item_aword[nLevel][1]);
			if nLevel == 77 or nLevel == 84 then
				if nRetCode == 1 then
					SetItemExpireTime(nItem, 30*24*60*60);				
				end
			end				
			WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",tb_wohucanglong_item_aword[nLevel][2][4],tb_wohucanglong_item_aword[nLevel][1]);
		elseif nLevel == 74 then
			gf_AddItemEx(tb_wohucanglong_item_aword_74[nBody][2], tb_wohucanglong_item_aword_74[nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",tb_wohucanglong_item_aword_74[nBody][2][4],tb_wohucanglong_item_aword_74[nBody][1]);
		elseif nLevel == 75 then
			gf_AddItemEx(tb_wohucanglong_item_aword_75[nRoute][nBody][2], tb_wohucanglong_item_aword_75[nRoute][nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1, "竜 S? m玭 c蕄 8x");
		elseif nLevel == 78 then
			gf_AddItemEx(tb_wohucanglong_item_aword_78[nRoute][2], tb_wohucanglong_item_aword_78[nRoute][1]);
			WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1,"T骾 Y誹 Quy誸");
		elseif nLevel == 79 then
			local nItem = gf_GetRandItemByTable(tb_wohucanglong_item_aword_79, 100, 1);
			gf_AddItemEx(tb_wohucanglong_item_aword_79[nItem][3], tb_wohucanglong_item_aword_79[nItem][1]);
			WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1,"Trang S鴆 Th竔 H?");
		elseif nLevel == 81 then
			gf_AddItemEx(tb_wohucanglong_item_aword_81[nBody][2], tb_wohucanglong_item_aword_81[nBody][1]);
			WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1,"Qu莕 T祅g Ki誱 c蕄 8x");
		elseif nLevel == 82 then
			local nItem = random(1, 100);
			local nBook = random(1, 14);
			if 0 < nItem and nItem <= 45 then
				gf_AddItemEx(tb_wohucanglong_item_aword_82_1[nBook][2], tb_wohucanglong_item_aword_82_1[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1,"Quy觧 M藅 T辌h Tr蕁 Ph竔");
			elseif nItem > 45 and nItem <= 90 then
				gf_AddItemEx(tb_wohucanglong_item_aword_82_2[nBook][2], tb_wohucanglong_item_aword_82_2[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1,"Quy觧 M藅 T辌h Tr蕁 Ph竔");
			else
				gf_AddItemEx(tb_wohucanglong_item_aword_82_3[nBook][2], tb_wohucanglong_item_aword_82_3[nBook][1]);
				WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1,"Quy觧 M藅 T辌h Tr蕁 Ph竔");
			end
		elseif nLevel == 83 then
			gf_AddItemEx(tb_wohucanglong_item_aword_83[nRoute][2], tb_wohucanglong_item_aword_83[nRoute][1]);
			WriteLogEx("Hoat dong thang 6","Ngo? H? T祅g Long",1,"V? Kh? B? Phi Y猲");
		end
		gf_SetLogCaption("");	
	end
end

--判断可以满足哪个级别的奖励
function check_aword_level()
	local nAwordLevel = 0;
	local nLevel = GetLevel();
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = GetTask(701);
	if nHor < 0 then
		nHor = 0 - nHor;
	end
	
	for i = 84, 73, -1 do
		if nLevel >= i and nRep >= tb_wohucanglong_aword[i][1] and nFaction >= tb_wohucanglong_aword[i][2] and nHor >= tb_wohucanglong_aword[i][3] then
			nAwordLevel = i;
			break;
		end
	end
	return nAwordLevel;
end

function get_full_skill_level()
	local nPlayerRoute = GetPlayerRoute()
	if TB_55_SKILL_INFO[nPlayerRoute] == nil then
		return 0
	end
	for i = TB_55_SKILL_INFO[nPlayerRoute][1], TB_55_SKILL_INFO[nPlayerRoute][2] do
		if GetSkillLevel(i) == 0 then
			return 0;
		end
	end
	return 1;
end;


-- 获得55级技能是否已经学满了
TB_55_SKILL_INFO = {
	[2] = {21, 31},
	[3] = {45, 56},
	[4] = {33, 43},
	[6] = {58, 73},
	[8] = {75, 88},
	[9] = {90, 101},
	[11] = {103, 112},
	[12] = {114, 123},
	[14] = {125, 145},
	[15] = {147, 158},
	[17] = {720, 731},
	[18] = {733, 744},
	[20] = {364, 377},
	[21] = {347, 363}
}

function nothing()
end