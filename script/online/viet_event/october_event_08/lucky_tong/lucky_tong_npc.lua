--File name:	lucky_tong_npc.lua
--Describe:		ʮ�»|���˰��|��ͷ����npc�ļ�
--Create Date:	2008-09-27
--Author:		chenbenqian

Include("\\script\\online\\viet_event\\october_event_08\\oct_event_head.lua");
Include("\\script\\lib\\globalfunctions.lua")

g_szLogTitle = "Ho�t ��ng th�ng 10 : ".."B�ch ��u L�o Nh�n"		--�˴���Ϊ2��ֻ��Ϊ�˲������µķ���
g_szInfoHead = "<color=green>".."B�ch ��u L�o Nh�n".."<color>: "
g_szThisFile = "\\script\\online\\viet_event\\october_event_08\\lucky_tong\\lucky_tong_npc.lua"

g_tbItem = {15, 10, 5}

function main()
	if is_oct_event_viet_open() == 0 then
		return
	end
	local nTime = tonumber(date("%H"))
	if nTime >= 0 and nTime < 19 then
		if nTime == 18 and tonumber(date("%M")) > 56 then
			Say(g_szInfoHead.."Quay l�i sau!",0)
			return
		end
		sign_up()
	else
		give_prize()
	end
end

function sign_up()
	if IsTongMember() ~= 1 then
		Talk(1,"",g_szInfoHead.."B�n kh�ng ph�i bang ch�!");
		return
	end
	if GetTongLevel() < 2 then
		Say(g_szInfoHead.."Qu� bang ch�a �� �i�u ki�n tham gia ho�t ��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
		return
	end
	DelRelayShareDataCopy(GetTongName(), 0, 0)
	local selTab = {
				"Ta ��n �� ��ng k� tham gia ho�t ��ng bang h�i may m�n./want_sign_up",
				"Ta ch� gh� ngang!!/no",
				}
	Say(g_szInfoHead.." Ho�t ��ng Bang H�i May M�n di�n ra h�ng ng�y t� 10-10-2008 ��n 20-10-2008. T� 0:00 ��n 19:00, sau khi ho�n th�nh nhi�m v� Bang H�i, bang ch� c� th� ��n g�p l�o �� ��ng k� tham gia.. T� 19h:00 ��n 24:0 c�c bang ch� g�p l�o �� xem danh s�ch tr�ng th��ng nh�!\nCh� �:\n\tBang h�i tham gia ph�i c� ��ng c�p 2 tr� l�n.\n\tSau 24:00 m� bang ch� v�n ch�a nh�n th��ng th� ph�n th��ng s� b� h�y b�.",getn(selTab),selTab);
end

function want_sign_up()
	ApplyRelayShareData(GetTongName(), 0, 0, g_szThisFile, "sign_up_cb")
end

function sign_up_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_szInfoHead.."Qu� bang ch�a �� �i�u ki�n tham gia ho�t ��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
		return
	end

	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)

	if tong_state ~= 4 then
		Say(g_szInfoHead.."Qu� bang ch�a �� �i�u ki�n tham gia ho�t ��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
		return
	end
	
	local tong_ID_save, day_parity = Zgc_conf_task_time_return()
	if tong_ID ~= tong_ID_save then
		Say(g_szInfoHead.."Qu� bang ch�a �� �i�u ki�n tham gia ho�t ��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
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
	Say(g_szInfoHead.."Qu� bang �� ��ng k� th�nh c�ng. T� 19:00 ��n 24:00, bang ch� c�a qu� bang h�y quay l�i �� xem th�ng tin nh�.",1,"C�m �n ti�n b�i!/no");
	local strLogCaption = "Hoat Dong Thang 10"
	WriteLogEx(strLogCaption,"tham gia r�t th�m Bang h�i","","","",GetTongName())
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
				Say(g_szInfoHead.."Qu� bang ch�a �� �i�u ki�n tham gia ho�t ��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
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
		Talk(1,"",g_szInfoHead.."B�n kh�ng ph�i bang ch�!");
		return
	end
	if GetTongLevel() < 2 then
		Say(g_szInfoHead.."Qu� bang ch�a �� �i�u ki�n tham gia ho�t ��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
		return
	end

	ApplyRelayShareData(RELAY_DB_08_OCT_EVENT_VIET,0,1,g_szThisFile,"give_prize_cb")
end

function give_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_szInfoHead.."Qu� bang kh�ng th� nh�n ���c ph�n th��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
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
				"T�i h� ��n �� nh�n th��ng./obtain_prize",
				"Ta ch� gh� ngang!/no",
				}
	Say(g_szInfoHead.."3 bang h�i may m�n nh�t c�a ng�y h�m nay "..":\n"..tbName[1].."\n"..tbName[2].."\n"..tbName[3].."\n".."H�y mau mau nh�n th��ng!",getn(selTab),selTab);
end

function obtain_prize()
	ApplyRelayShareData(RELAY_DB_08_OCT_EVENT_VIET,0,0,g_szThisFile,"obtain_prize_cb")
end

function obtain_prize_cb(szKey, nKey1, nKey2, nCount)
	if nCount == 0 then
		Say(g_szInfoHead.."Qu� bang kh�ng th� nh�n ���c ph�n th��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
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
		Say(g_szInfoHead.."Qu� bang kh�ng th� nh�n ���c ph�n th��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
		return
	end
	if nDateNow - nDateFlag > 86400  then
		Say(g_szInfoHead.."Qu� bang kh�ng th� nh�n ���c ph�n th��ng l�n n�y.",1,"�i! Ta qu�n m�t./no");
		return
	end
	if nPrizeFlag == 1 then
		Say("H�m nay ng��i �� nh�n ph�n th��ng r�i, ng�y mai h�y ��n nh�!",0)
		return
	end

	if gf_Judge_Room_Weight(2, 20) == 0 then
		Talk(1,"",g_szInfoHead.."Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!")
		return
	end

	add_item_ex("Sinh Th�n Cang", 2, 0, 545, g_tbItem[nPrizeType])
	nPrizeFlag = 1
	AddRelayShareData(RELAY_DB_08_OCT_EVENT_VIET, 0, 0, "", "", 0, GetTongName(), "dddd", nWishType, nPrizeType, nPrizeFlag, nDateFlag)
		
	Say(g_szInfoHead.."Ph�n th��ng c�a qu� bang l�: "..g_tbItem[nPrizeType].." Sinh Th�n Cang",1,"C�m �n ti�n b�i!/no");
end

function add_item_ex(szItemName, genre, detail, particular, nItemNum)
	local nRetCode = 0;
	nRetCode = AddItem(genre, detail, particular, nItemNum);
	if nRetCode == 1 then
		Msg2Player("B�n nh�n ���c  "..nItemNum.." c�i "..szItemName);
		WriteLogEx("Hoat Dong Thang 10","nh�n",nItemNum,szItemName,"",szTongName)		
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

