
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 镖师脚本
-- Edited by peres
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\task\\teach\\teach_main.lua");

g_InfoHeader_BSh = "<color=green>Ti猽 S?<color>: "
g_szThisFile = "\\script\\中原一区\\汴京\\npc\\镖师.lua"

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00();
		return
	else
		Say("<color=green>Ti猽 s?<color>: Huhu, ng祔 y mai , kh玭g bi誸 khi n祇 t蕀 xng kh? n祔 c? ch? d鮪g ch﹏.",
			2,
			"Nh薾 ph莕 thng ho箃 ng bang h閕 tinh anh/first_tong_event",
			"K誸 th骳 i tho筰/no"
		)
	end;
end;

function first_tong_event()
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ngi kh玭g gia nh藀 bang h閕, v? v藋 kh玭g th? nh薾 ph莕 thng ho箃 ng bang h閕 tinh anh!", 0)
		return
	end
	ApplyRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "first_tong_prize_cb")
end

function first_tong_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_InfoHeader_BSh.."V? i hi謕 n祔 kh玭g ph? h頿 v韎 甶襲 ki謓 nh薾 thng!", 0)
		return
	end
	local nDateStart, nPrizeFlag, szTongName = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."V? i hi謕 n祔 kh玭g ph? h頿 v韎 甶襲 ki謓 nh薾 thng!", 0)
		return
	end

	local selTab = {
--				format("领取帮主奖励/#get_first_tong_reward_1(%d,%d,\"%s\")",nDateStart, nPrizeFlag, szTongName),
				format("Nh薾 ph莕 thng bang ch髇g/#get_first_tong_reward_2(%d,\"%s\")",nDateStart, szTongName),
				"Redeem later/no",
				}
	Say(g_InfoHeader_BSh.."Xin m阨 ch鋘 ph莕 thng!",getn(selTab),selTab)
end

function get_first_tong_reward_1(nDateStart, nPrizeFlag, szTongName)
	if IsTongMember() ~= 1 then
		Say(g_InfoHeader_BSh.."Ch? c? bang ch? m韎 c? th? nh薾 ph莕 thng n祔.", 0)
		return
	end
	if nPrizeFlag == 0 then
		Say(g_InfoHeader_BSh.."Чi hi謕  nh薾 qua ph莕 thng bang ch? r錳, ngi ch? 頲 nh薾 1 l莕.", 0)
		return
	end
	local selTab = {
				format("Ta mu鑞 l穘h ngay/#obtain_first_tong_reward_1(%d,%d,\"%s\")",nDateStart, nPrizeFlag, szTongName),
				"ьi ta ki觤 tra l筰!/no",
				}
	Say(g_InfoHeader_BSh.."Ngi c? ch綾 b﹜ gi? mu鑞 nh薾 ph莕 thng bang h閕?",getn(selTab),selTab)
end

function obtain_first_tong_reward_1(nDateStart, nPrizeFlag, szTongName)
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ngi kh玭g gia nh藀 bang h閕, v? v藋 kh玭g th? nh薾 ph莕 thng ho箃 ng bang h閕 tinh anh!", 0)
		return
	end
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."V? i hi謕 n祔 kh玭g ph? h頿 v韎 甶襲 ki謓 nh薾 thng!", 0)
		return
	end
	if IsTongMember() ~= 1 then
		Say(g_InfoHeader_BSh.."Ch? c? bang ch? m韎 c? th? nh薾 ph莕 thng n祔.", 0)
		return
	end
	if nPrizeFlag == 0 then
		Say(g_InfoHeader_BSh.."Чi hi謕  nh薾 qua ph莕 thng bang ch? r錳, ngi ch? 頲 nh薾 1 l莕.", 0)
		return
	end
	
	if gf_Judge_Room_Weight(9,50) == 0 then
		Say(g_InfoHeader_BSh.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!", 0)
		return
	end
	
	Earn(50000000)--改为黄金5000两
	WriteLog("[Jx2 First Guild]: [Role Name:"..GetName().."]  Obtain 5000 gold.")

	if random(1, 100) > 50 then
		if AddItem(0,107,155,1,1) == 1 then			--五行秘籍
			Msg2Player("B筺 nh薾 頲 1 quy觧  ".."Ng? H祅h M藅 t辌h");
			WriteLog("[Jx2 First Guild]:"..GetName().." B筺 nh薾 頲 1 quy觧  ".."Ng? H祅h M藅 t辌h");
		else
			WriteLog("[Jx2 First Guild]:"..GetName().." B筺 nh薾 頲 1 quy觧  ".."Ng? H祅h M藅 t辌h");
		end
	else
		local tBookList = {
			--  "名字",						G1,G2,G3,数量
			[1] = { "Kim Cang Ph鬰 Ma T﹎ Ph竝",	0,107, 2,1},
			[2] = { "Ti襪 Long T﹎ Ph竝",		0,107, 4,1},
			[3] = { "V? Tr莕 T﹎ Ph竝",		0,107, 6,1},
			[4] = { "Thi猲 La T﹎ Ph竝",		0,107, 8,1},
			[5] = { "Nh? ? T﹎ Ph竝",		0,107,10,1},
			[6] = { "B輈h H秈 T﹎ Ph竝",		0,107,12,1},
			[7] = { "H鏽 чn T﹎ Ph竝",		0,107,14,1},
			[8] = { "Qu? Thi猲 T﹎ Ph竝",		0,107,16,1},
			[9] = { "Huy襫 秐h T﹎ Ph竝",		0,107,18,1},
			[10] = {"Qu﹏ T? T﹎ Ph竝",		0,107,20,1},
			[11] = {"Tr蕁 Qu﹏ T﹎ Ph竝",		0,107,22,1},
			[12] = {"Xuy猲 V﹏ T﹎ Ph竝",		0,107,24,1},
			[13] = {"U Minh T﹎ Ph竝",		0,107,26,1},
			[14] = {"Linh C? T﹎ Ph竝",		0,107,28,1},
			[15] = {"Kim Cang Ph鬰 Ma kinh",	0,107, 1,1},
			[16] = {"Ti襪 Long M藅 t辌h",		0,107, 3,1},
			[17] = {"V? Tr莕 M藅 t辌h",		0,107, 5,1},
			[18] = {"Thi猲 La M藅 T辌h",		0,107, 7,1},
			[19] = {"Nh? ? M藅 T辌h",		0,107, 9,1},
			[20] = {"B輈h H秈 Ph?",		0,107,11,1},
			[21] = {"H鏽 чn M藅 t辌h",		0,107,13,1},
			[22] = {"Qu? Thi猲 M藅 t辌h",		0,107,15,1},
			[23] = {"Huy襫 秐h M藅 t辌h",		0,107,17,1},
			[24] = {"Qu﹏ T? M藅 t辌h",		0,107,19,1},
			[25] = {"Tr蕁 Qu﹏ M藅 t辌h",		0,107,21,1},
			[26] = {"Xuy猲 V﹏ M藅 t辌h",		0,107,23,1},
			[27] = {"U Minh Qu? L鬰",		0,107,25,1},
			[28] = {"Linh C? M藅 t辌h",		0,107,27,1},
		}

		gf_SetLogCaption("Jx2 First Guild")
		local nRandom = random(1,28)
		gf_AddItemEx({tBookList[nRandom][2],tBookList[nRandom][3],tBookList[nRandom][4],tBookList[nRandom][5],1}, tBookList[nRandom][1]);
		gf_SetLogCaption("")
	end
	
	local nPrizeFlagNew = 0;
	AddRelayShareData(RELAY_DB_FIRSTTONG_JPZ, 0, 0, g_szThisFile, "", 0, "0", "dds", nDateStart, nPrizeFlagNew, szTongName)
end

function get_first_tong_reward_2(nDateStart, szTongName)
	local nDateNow = tonumber(date("%y%m%d"))
	if nDateNow <= nDateStart then
		Say(g_InfoHeader_BSh.."V? i hi謕 n祔 kh玭g ph? h頿 v韎 甶襲 ki謓 nh薾 thng!", 0)
		return
	end

	local selTab = {
				format("Ta mu鑞 l穘h ngay/#obtain_first_tong_reward_2(%d,\"%s\")",nDateStart, szTongName),
				"ьi ta ki觤 tra l筰!/no",
				}
	Say(g_InfoHeader_BSh.."Ngi c? ch綾 b﹜ gi? mu鑞 nh薾 ph莕 thng bang ch髇g?",getn(selTab),selTab)
end

function obtain_first_tong_reward_2(nDateStart, szTongName)
	if IsTongMember() == 0 then
		Say(g_InfoHeader_BSh.."Ngi kh玭g gia nh藀 bang h閕, v? v藋 kh玭g th? nh薾 ph莕 thng ho箃 ng bang h閕 tinh anh!", 0)
		return
	end
	if szTongName ~= GetTongName() then
		Say(g_InfoHeader_BSh.."V? i hi謕 n祔 kh玭g ph? h頿 v韎 甶襲 ki謓 nh薾 thng!", 0)
		return
	end
	local nDateNow = tonumber(date("%y%m%d"))
	if nDateNow <= nDateStart then
		Say(g_InfoHeader_BSh.."V? i hi謕 n祔 kh玭g ph? h頿 v韎 甶襲 ki謓 nh薾 thng!", 0)
		return
	end
	if nDateNow <= GetTask(2446) then
		Say(g_InfoHeader_BSh.."Ngi  nh薾 h誸 ph莕 thng h玬 nay r錳, ng祔 mai l筰 n nh?!",0)
		return
	end

	local tItemInfo = {"B錸g Lai L? Th駓", "B錸g Lai Ti猲 Th駓", "B錸g Lai Ti猲 L?", "B錸g Lai Ti猲 Кn"}
	local nType, nTime, nSpeed = GetExistXclInfo()
	if nTime > 0 then
		if nSpeed == 300 then
			Say("B筺 nh薾 頲 hi謚 qu? "..tItemInfo[4].."  c馻 hi謚 qu?, kh玭g th? i b籲g  "..tItemInfo[3], 0)
		elseif nSpeed == 200 then
			obtain_xcl_reward();
		elseif nSpeed == 150 then
			Say(g_InfoHeader_BSh.."Hi謓 b筺 b筺 c?  "..tItemInfo[2].." , mu鑞 i th祅h "..tItemInfo[3].."?\n<color=red>Ch? ?: Sau khi thay i th阨 gian hi謚 qu? ban u s? tr? v? 0<color>", 2, "Yes/obtain_xcl_reward", "No/no")
		elseif nSpeed == 120 then
			Say(g_InfoHeader_BSh.."Hi謓 b筺 b筺 c?  "..tItemInfo[1].." , mu鑞 i th祅h "..tItemInfo[3].."?\n<color=red>Ch? ?: Sau khi thay i th阨 gian hi謚 qu? ban u s? tr? v? 0<color>", 2, "Yes/obtain_xcl_reward", "No/no")
		end
	else
		obtain_xcl_reward()
	end
end

function obtain_xcl_reward()
	local nDate = tonumber(date("%y%m%d"))
	if EatXcl(2,3600) == 1 then
		SetTask(2446,nDate)
		Say(g_InfoHeader_BSh.."Ngi nh薾 頲 1 gi? nh qu竔 nh﹏ i kinh nghi謒",0)
		Msg2Player("Ngi nh薾 頲 1 gi? nh qu竔 nh﹏ i kinh nghi謒")
		WriteLog("[Jx2 First Guild]: [Role Name:"..GetName().."] obtained 1 hours of 2 times EXP effect.");
	end
end

function no()
end

