--File name:	lucky_tong_npc.lua
--Describe:		十月活动|幸运帮会|白头老人npc文件
--Create Date:	2008-09-27
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\october_event_08\\oct_event_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho箃 ng th竛g 10 : ".."B筩h u L穙 Nh﹏"		--此处分为2段只是为了不增加新的翻译
g_szInfoHead = "<color=green>".."B筩h u L穙 Nh﹏".."<color>: "
g_szThisFile = "\\script\\online\\viet_event\\october_event_08\\lucky_tong\\lucky_tong_npc.lua"

g_tbItem = {15, 10, 5}

function main()
	if is_oct_event_viet_open() == 0 then
		return
	end
	local nTime = tonumber(date("%H"))
	if nTime >= 0 and nTime < 19 then
		if nTime == 18 and tonumber(date("%M")) > 56 then
			Say(g_szInfoHead.."Quay l筰 sau!",0)
			return
		end
		sign_up()
	else
		give_prize()
	end
end

function sign_up()
	if IsTongMember() ~= 1 then
		Talk(1,"",g_szInfoHead.."B筺 kh玭g ph秈 bang ch?!");
		return
	end
	if GetTongLevel() < 2 then
		Say(g_szInfoHead.."Qu? bang ch璦  甶襲 ki謓 tham gia ho箃 ng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end
	DelRelayShareDataCopy(GetTongName(), 0, 0)
	local selTab = {
				"Ta n  ng k? tham gia ho箃 ng bang h閕 may m緉./want_sign_up",
				"Ta ch? gh? ngang!!/no",
				}
	Say(g_szInfoHead.." Ho箃 ng Bang H閕 May M緉 di詎 ra h祅g ng祔 t? 10-10-2008 n 20-10-2008. T? 0:00 n 19:00, sau khi ho祅 th祅h nhi謒 v? Bang H閕, bang ch? c? th? n g苝 l穙  ng k? tham gia.. T? 19h:00 n 24:0 c竎 bang ch? g苝 l穙  xem danh s竎h tr髇g thng nh?!\nCh? ?:\n\tBang h閕 tham gia ph秈 c? ng c蕄 2 tr? l猲.\n\tSau 24:00 m? bang ch? v蒼 ch璦 nh薾 thng th? ph莕 thng s? b? h駓 b?.",getn(selTab),selTab);
end

function want_sign_up()
	ApplyRelayShareData(GetTongName(), 0, 0, g_szThisFile, "sign_up_cb")
end

function sign_up_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_szInfoHead.."Qu? bang ch璦  甶襲 ki謓 tham gia ho箃 ng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end

	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)

	if tong_state ~= 4 then
		Say(g_szInfoHead.."Qu? bang ch璦  甶襲 ki謓 tham gia ho箃 ng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end
	
	local tong_ID_save, day_parity = Zgc_conf_task_time_return()
	if tong_ID ~= tong_ID_save then
		Say(g_szInfoHead.."Qu? bang ch璦  甶襲 ki謓 tham gia ho箃 ng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end
	
	if day_parity == 1 then
		sign_up_notify()
	elseif day_parity == 2 then
		DelRelayShareDataCopy(RELAY_DB_08_OCT_EVENT_VIET, 0, 1)
		ApplyRelayShareData(RELAY_DB_08_OCT_EVENT_VIET,0,1,g_szThisFile,"sign_up_check_cb")
	end
end

function sign_up_notify()
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = tonumber(GetTime())
	AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 0, "", "", 0, GetTongName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
	Say(g_szInfoHead.."Qu? bang  ng k? th祅h c玭g. T? 19:00 n 24:00, bang ch? c馻 qu? bang h穣 quay l筰  xem th玭g tin nh?.",1,"C竚 琻 ti襫 b鑙!/no");
	local strLogCaption = "Hoat Dong Thang 10"
	WriteLogEx(strLogCaption,"tham gia r髏 th╩ Bang h閕","","","",GetTongName())
end

function sign_up_check_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		sign_up_notify()
		return
	end

	if nCount > 3 then
		nCount = 3
	end

	local tbName = {}
	local szTongName = ""
	local i, j = 1, 1
	local nTableSize = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())

	for j = 1, nCount do
		nDateFlag, szTongName = GetRelayShareDataByKey(szKey, nKey1, nKey2, tostring(j) )
		if new_task_time_return(nDateNow) - new_task_time_return(nDateFlag) == 1  then
			tbName[i] = szTongName
			i = i + 1
		end
	end
	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)

	nTableSize = getn(tbName)
	if nTableSize == 0 then
		sign_up_notify()
	elseif nTableSize >= 1 then
		if nTableSize > 3 then
			nTableSize = 3
		end
		for j = 1, nTableSize do
			if GetTongName() == tbName[j] then
				Say(g_szInfoHead.."Qu? bang ch璦  甶襲 ki謓 tham gia ho箃 ng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
				return
			end
		end
		sign_up_notify()
	end
end

function give_prize()
	DelRelayShareDataCopy(RELAY_DB_08_OCT_EVENT_VIET, 0, 1)
	DelRelayShareDataCopy(RELAY_DB_08_OCT_EVENT_VIET, 0, 0)

	if IsTongMember() ~= 1 then
		Talk(1,"",g_szInfoHead.."B筺 kh玭g ph秈 bang ch?!");
		return
	end
	if GetTongLevel() < 2 then
		Say(g_szInfoHead.."Qu? bang ch璦  甶襲 ki謓 tham gia ho箃 ng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end

	ApplyRelayShareData(RELAY_DB_08_OCT_EVENT_VIET,0,1,g_szThisFile,"give_prize_cb")
end

function give_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_szInfoHead.."Qu? bang kh玭g th? nh薾 頲 ph莕 thng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end

	if nCount > 3 then
		nCount = 3
	end
	
	local tbName = {"", "", ""}
	local szTongName = ""
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())

	for j = 1, nCount do
		nDateFlag, szTongName = GetRelayShareDataByKey(szKey, nKey1, nKey2, tostring(j) )
		if nDateNow - nDateFlag < 86400  then
			tbName[j] = szTongName
		end
	end
	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)

	local selTab = {
				"T筰 h? n  nh薾 thng./obtain_prize",
				"Ta ch? gh? ngang!/no",
				}
	Say(g_szInfoHead.."3 bang h閕 may m緉 nh蕋 c馻 ng祔 h玬 nay "..":\n"..tbName[1].."\n"..tbName[2].."\n"..tbName[3].."\n".."H穣 mau mau nh薾 thng!",getn(selTab),selTab);
end

function obtain_prize()
	ApplyRelayShareData(RELAY_DB_08_OCT_EVENT_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_szInfoHead.."Qu? bang kh玭g th? nh薾 頲 ph莕 thng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end

	local szTongName = ""
	local nWishType = 0
	local nPrizeType = 0
	local nPrizeFlag = 0
	local nDateFlag = 0
	local nDateNow = tonumber(GetTime())
	szTongName = GetTongName()

	nWishType, nPrizeType, nPrizeFlag, nDateFlag = GetRelayShareDataByKey(szKey, nKey1, nKey2, szTongName)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if nPrizeType == 0 or nPrizeType == nil or nPrizeType > 3 then
		Say(g_szInfoHead.."Qu? bang kh玭g th? nh薾 頲 ph莕 thng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end
	if nDateNow - nDateFlag > 86400  then
		Say(g_szInfoHead.."Qu? bang kh玭g th? nh薾 頲 ph莕 thng l莕 n祔.",1,"! Ta qu猲 m蕋./no");
		return
	end
	if nPrizeFlag == 1 then
		Say("H玬 nay ngi  nh薾 ph莕 thng r錳, ng祔 mai h穣 n nh?!",0)
		return
	end

	if gf_Judge_Room_Weight(2, 20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho秐g tr鑞g h祅h trang ho芻 s鴆 l鵦 kh玭g , xin ki觤 tra l筰!")
		return
	end

	add_item_ex("Sinh Th莕 Cang", 2, 0, 545, g_tbItem[nPrizeType])
	nPrizeFlag = 1
	AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 0, "", "", 0, GetTongName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		
	Say(g_szInfoHead.."Ph莕 thng c馻 qu? bang l?: "..g_tbItem[nPrizeType].." Sinh Th莕 Cang",1,"C竚 琻 ti襫 b鑙!/no");
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B筺 nh薾 頲  "..nItemNum.." c竔 "..szItemName);
		WriteLogEx("Hoat Dong Thang 10","nh薾",nItemNum,szItemName,"",szTongName)		
	else
		WriteLog("["..g_szLogTitle.."]: [Account: "..GetAccount().."][Role Name:"..GetName().."] Obtain "..nItemNum.." "..szItemName.." Failed, return value = "..nRetCode);
	end
end

function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 61200)/(172800))
	local day_parity = 0
	if mod(GetTime() - 61200, 172800) < 86400 then
		day_parity = 1
	else
		day_parity = 2
	end
	return time_return, day_parity
end

function new_task_time_return(nTime)
	local time_return = floor((nTime - 61200)/86400)
	return time_return
end

function no()
end

