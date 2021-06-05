-- Created by TuanNA5
-- VNG August event - D� Th�o

Include("\\script\\online\\viet_event\\200908\\yecao\\head.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua")
CHIENTUONG_FILE = "\\script\\vng\\chientuong.lua";

function main()
	page1()
end

function page1()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead = "D� Th�o: ��ng ��o c� th� d�ng ��ng Ti�n V�ng v� c�c v�t ph�m c�n thi�t �� ��i l�y c�c v�t ph�m gi� tr� nh� sau:"
	local nDate = tonumber(date("%Y%m%d"))
	
--	if nDate <= 20100606 then
--		tinsert(tbSayDialog, "Ta mu�n mua 1 ��nh H�n Thi�n Th�ch (c�n 4 ��ng Ti�n V�ng + 4 T�i Thi�n Th�ch Tinh Th�ch + 4 Ho�ng Kim ��i H�ng Bao + 4 T� Kim H�ng Bao)/get_soulstone")
--	end
--	tinsert(tbSayDialog, "Ta mu�n ��i Chi�n T��ng Nguy�n So�i/#buy_elephant(0)")
	if nDate >= 20130528 and nDate <= 20130530 then
--		tinsert(tbSayDialog, "Ta mu�n ��i l�i Chi�n T��ng kh�c/change_elephant")
	end
--	tinsert(tbSayDialog, "Ta mu�n mua Th�n H�nh/get_transport")
--	tinsert(tbSayDialog, "Ta mu�n mua Th� b�i c� ��ng vi�n/support_card")
	if nDate <= 20110109 then
--		tinsert(tbSayDialog, "Ta mu�n ��i Tu�n L�c (c�n 1 Phi�u V� + 99 v�ng)/get_reindeer_2010")
	end
--	tinsert(tbSayDialog, "Hu�n luy�n chi�n m� Tr�ng (c�n 1 B�ch M� + 1 ��ng Ti�n V�ng + 99 v�ng)/#get_war_horse(3)")
--	tinsert(tbSayDialog, "Hu�n luy�n chi�n m� �en (c�n 1 B�ch M� + 1 ��ng Ti�n V�ng + 99 v�ng)/#get_war_horse(4)")
--	tinsert(tbSayDialog, "Hu�n luy�n L�u V�n K� L�n Th� (c�n 1 Chi�n m� Nguy�n So�i + 1 T� Kim H�ng Bao)/#get_war_horse(12)")
--	tinsert(tbSayDialog, "C�i t�o L�u V�n K� L�n Th� (c�n 1 L�u V�n K� L�n Th� + 1 T� Kim H�ng Bao)/#get_war_horse(13)")
	
--	tinsert(tbSayDialog, "Hu�n luy�n ��ng V� (c�n 1 Tr�o Ho�ng Phi �i�n + 1 ��ng Ti�n V�ng + 99 v�ng)/get_horse")
--	tinsert(tbSayDialog, "Hu�n luy�n Si�u Quang (C�n 1 H�t L�i B�c + 1 ��ng Ti�n V�ng + 99 v�ng)/get_new_horse")
--	tinsert(tbSayDialog, "Hu�n luy�n B�n Ti�u (C�n 1 X�ch Th� + 1 ��ng Ti�n V�ng + 99 v�ng)/get_new_horse_1")
--	tinsert(tbSayDialog, "Hu�n luy�n Phi�u V� (C�n 1 B� C�nh + 1 ��ng Ti�n V�ng + 99 v�ng)/get_new_horse_2")
--	tinsert(tbSayDialog, "Hu�n luy�n Ph� D�c (C�n 1 B� C�nh + 1 ��ng Ti�n V�ng + 99 v�ng)/get_new_horse_3")

	
	tinsert(tbSayDialog, "Xem trang sau/page2")
	tinsert(tbSayDialog, "T�i h� ch� gh� ngang!/end_dialogover")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog)
	
end

function page2()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead = "D� Th�o: ��ng ��o c� th� d�ng ��ng Ti�n V�ng v� c�c v�t ph�m c�n thi�t �� ��i l�y c�c v�t ph�m gi� tr� nh� sau:"
	local nDate = tonumber(date("%Y%m%d"))
	
--	tinsert(tbSayDialog, "Ta mu�n mua 1 Thi�n Th�ch Linh Th�ch (c�n 3 Ho� Th� B�ch + 5 ��ng Ti�n V�ng + 99 v�ng)/get_stone")
--	tinsert(tbSayDialog, "Ta mu�n mua 1 B�n v� ��c t�o th�n binh (c�n 12 lo�i v� kh� ch�a gi�m ��nh c�a 12 h� ph�i kh�c nhau + 1 ��ng Ti�n V�ng + 1 S� M�n T�nh Nguy�n Th� + 99 V�ng)/get_weapon_fag")
--	tinsert(tbSayDialog, "Ta mu�n mua 1 K� Kim c�a Th� r�n L�u (C�n 1 ��ng Ti�n V�ng + 1000 v�ng)/#get_item(10)")
--	tinsert(tbSayDialog, "Ta mu�n mua 1 Y�u Quy�t (C�n 1 ��ng Ti�n V�ng + 1 M�t H�m S� M�n + 100 v�ng)/#get_yue(1,10)")
	tinsert(tbSayDialog, "Xem trang tr��c/page1")
	tinsert(tbSayDialog, "T�i h� ch� gh� ngang!/end_dialogover")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog)
end

function support_card()
	if GetItemCount(2,1,537) < 2 then
		Say("D� Th�o: C�c h� kh�ng �� 2 T� Kim H�ng Bao �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng.")
		return
	end

	if gf_Judge_Room_Weight(1,10, "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng.")
		return
	end

	if DelItem(2, 1, 537, 2) == 1 then
		local nRetCode, nItem = AddItem(2,1,30204,1,4);
		if nRetCode == 1 then		
			SetItemExpireTime(nItem,30*24*3600)
			Say("D� Th�o: Ch�c m�ng c�c h� nh�n ���c 1 Th� b�i c� ��ng vi�n!",0)
			Msg2Player("B�n nh�n ���c 1 Th� b�i c� ��ng vi�n.")
			WriteLogEx("Worldcup 2010","D� Th�o",1,"Th� b�i c� ��ng vi�n");
		end
	else
		WriteLogEx("Worldcup 2010","AddItem th�t b�i",1,"Th� b�i c� ��ng vi�n");
	end
end

function get_yue(nPage,nStep)
	local tSay = {}
	local nMaxRow = getn(tYue)
	local nNextPage = nPage + nStep
	
	if nNextPage > nMaxRow then
		nNextPage = nMaxRow
	end
	
	if nNextPage < 1 then
		nNextPage = 1
	end
	
	if nStep <= 0 then
		local nTemp = nPage
		nPage = nNextPage
		nNextPage = nTemp
	end
	
	for i=nPage,nNextPage do
		tinsert(tSay,format("Ta mu�n mua 1 %s/#buy_yue(%d)",tYue[i][1],i))
	end
	
	if nNextPage < nMaxRow then
		tinsert(tSay,format("Xem trang sau/#get_yue(%d,%d)",nNextPage + 1,10))
	end
	if nPage > 1 then
		tinsert(tSay,format("Xem trang tr��c/#get_yue(%d,%d)",nPage - 1,-10))
	end
	
	tinsert(tSay,"T�i h� ch� gh� ngang!/end_dialogover")	
	Say("��ng ��o c�n mua Y�u Quy�t n�o?",getn(tSay),tSay)	
end

function buy_yue(nIndex)
	if CheckGoldCoin(1) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetItemCount(2,1,1020) < 1 then
		Say("D� Th�o: C�c h� ch�a �� 1 M�t H�m S� M�n �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < 1000000 then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(1,10, "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if DelItem(2, 1, 30094, 1) == 1 and DelItem(2,1,1020,1) ==1 and Pay(1000000) == 1  then
		local nRetCode, nItem = gf_AddItemEx(tYue[nIndex][2], tYue[nIndex][1]);
		if nRetCode == 1 then		
			Say("D� Th�o: Ch�c m�ng c�c h� nh�n ���c 1 "..tYue[nIndex][1],0)
			Msg2Player("B�n nh�n ���c 1 "..tYue[nIndex][1])
			WriteLogEx("Hoat dong thang 8","D� Th�o",1,tYue[nIndex][1]);
		end
	else
		WriteLogEx("Hoat dong thang 8","AddItem th�t b�i",1,tYue[nIndex][1]);
	end
end

function get_stone()
--	local nExtVal = GetExtPoint(EVENT_EXT)
--	local nExtBit = GetBit(nExtVal,STONE_BIT)	
--	if nExtBit  ~= 0 then
--		Say("D� Th�o: C�c h� �� ��i Thi�n Th�ch Linh Th�ch "..MAX_STONE_EXCHANGE.." l�n r�i, kh�ng th� ��i th�m ���c n�a!",0)
--		return
--	end 
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if CheckGoldCoin(5) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 5 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetItemCount(2,1,1001) < 3 then
		Say("D� Th�o: C�c h� ch�a �� 3 H�a Th� B�ch �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[1][3], tAwardItem[1][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if DelItem(2, 1, 30094, 5) == 1 and DelItem(2,1,1001,3) ==1 and Pay(MONEY_EXCHANGE) == 1  then
--		if AddExtPoint(EVENT_EXT,1) == 1 then
			AddEventItem(1,ITEM_TIME_LIMIT)
--		else
--			WriteLogEx("Hoat dong thang 8","Add Ext th�t b�i",tAwardItem[1][2][4],tAwardItem[1][1]);
--		end
	end
end

function get_weapon_fag()
--	local nTaskVal = GetTask(WEAPONFAG_TASKID)
--	if nTaskVal >= MAX_WEAPONFAG_EXCHANGE then
--		Say("D� Th�o: C�c h� �� s� d�ng h�t "..MAX_WEAPONFAG_EXCHANGE.." l�n ��i th��ng, kh�ng th� ��i th�m ���c n�a!",0)
--		return
--	end
	
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
--	if GetPlayerRoute() == 0 then
--		Say("D� Th�o: C�c h� ch�a gia nh�p m�n ph�i!",0)
--		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
--		return
--	end
		
	if CheckGoldCoin(1) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nCheckWeapon = CheckWeapon()	
	if  nCheckWeapon ~= 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 "..tWeapon[nCheckWeapon][1].." �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetItemCount(2,1,1019) < 1 then
		Say("D� Th�o: C�c h� ch�a �� 1 S� m�n t�nh nguy�n th� �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[2][3], tAwardItem[2][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if DelItem(2, 1, 30094, 1) == 1 and DelItem(2,1,1019,1) ==1 and Pay(MONEY_EXCHANGE) == 1 and DelWeapon() == 1 then
--		SetTask(WEAPONFAG_TASKID,GetTask(WEAPONFAG_TASKID) + 1)
		AddEventItem(2,0)		
	end		
end

function get_war_horse(nType)
--	local nExtVal = GetExtPoint(EVENT_EXT)
--	local nExtBit = GetBit(nExtVal,WARHORSE_BIT)	
--	if nExtBit  ~= 0 then
--		Say("D� Th�o: C�c h� �� n�ng c�p chi�n m� "..MAX_WARHORSE_EXCHANGE.." l�n r�i!",0)
--		return
--	end 
	
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetPlayerRoute() ~= 17 and GetPlayerRoute() ~= 18  then
		Say("D� Th�o: C�c h� ch�a gia nh�p D��ng M�n h� ph�i!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if nType ~= 12 and nType ~= 13 then
		if CheckGoldCoin(1) == 0 then
			Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end
		
		if GetCash() < MONEY_EXCHANGE then
			Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end
		
		local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or nP ~= 34 then
			Say("D� Th�o: Ph�i trang b� B�ch M� �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end
	else
		if GetItemCount(2,1,537) < 1 then
			Say("D� Th�o: C�c h� ch�a �� 1 T� Kim H�ng Bao �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end	
	end	
	
	if nType == 12 then
		local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or (nP ~= 51 and nP~= 52) then
			Say("D� Th�o: Ph�i trang b� Chi�n m� Nguy�n So�i �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end
	end
	
	if nType == 13 then
		local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or nP ~= 38 then
			Say("D� Th�o: Ph�i trang b� L�u V�n K� L�n Th� �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
	
	if nType ~= 12 and nType ~= 13 then
		if GetItemCount(0,105,34) < 1 then
			Say("D� Th�o: C�c h� ch�a �� 1 B�ch M� �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end
	elseif nType == 12 then
		if GetItemCount(0,105,51) <  1 and GetItemCount(0,105,52) < 1 then
			Say("D� Th�o: C�c h� ch�a �� 1 Chi�n m� Nguy�n So�i �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end	
	elseif nType == 13 then
		if GetItemCount(0,105,38) <  1 then
			Say("D� Th�o: C�c h� ch�a �� 1  L�u V�n K� L�n Th� �� ��i ph�n th��ng!",0)
			Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
			return
		end	
	end

	if gf_Judge_Room_Weight(tAwardItem[3][3], tAwardItem[3][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if nType ~= 12 and nType ~= 13 then
		if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
			AddEventItem(nType ,nExpireTime)
		end	
	else
		if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,537,1) == 1 then
			AddEventItem(nType ,nExpireTime)
		end	
	end
end

function get_horse()
--	local nExtVal = GetExtPoint(EVENT_EXT)
--	local nExtBit = GetBit(nExtVal,HORSE_BIT)	
--	if nExtBit  ~= 0 then
--		Say("D� Th�o: C�c h� �� n�ng c�p chi�n m� "..MAX_HORSE_EXCHANGE.." l�n r�i!",0)
--		return
--	end 
	
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D� Th�o: C�c h� ch�a gia nh�p m�n ph�i!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 11 then
		Say("D� Th�o: Ph�i trang b� Tr�o Ho�ng Phi �i�n �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,11) <1 then
		Say("D� Th�o: C�c h� ch�a �� 1 Tr�o Ho�ng Phi �i�n �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[4][3], tAwardItem[4][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
--		if AddExtPoint(EVENT_EXT,4) == 1 then
			AddEventItem(5,nExpireTime)
--		else
--			WriteLogEx("Hoat dong thang 8","Add Ext th�t b�i",tAwardItem[4][2][4],tAwardItem[4][1]);
--		end
	end
end

function get_new_horse()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D� Th�o: C�c h� ch�a gia nh�p m�n ph�i!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 12 then
		Say("D� Th�o: Ph�i trang b� H�t L�i B�c �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,12) <1 then
		Say("D� Th�o: C�c h� ch�a �� 1 H�t L�i B�c �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[6][3], tAwardItem[6][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(6,nExpireTime)
	end
end

function get_new_horse_1()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D� Th�o: C�c h� ch�a gia nh�p m�n ph�i!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 9 then
		Say("D� Th�o: Ph�i trang b� X�ch Th� �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,9) <1 then
		Say("D� Th�o: C�c h� ch�a �� 1 X�ch Th� �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[7][3], tAwardItem[7][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(7,nExpireTime)
	end
end

function get_new_horse_2()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D� Th�o: C�c h� ch�a gia nh�p m�n ph�i!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 13 then
		Say("D� Th�o: Ph�i trang b� B� C�nh �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,13) <1 then
		Say("D� Th�o: C�c h� ch�a �� 1 B� C�nh �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[8][3], tAwardItem[8][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(8,nExpireTime)
	end
end


function get_new_horse_3()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D� Th�o: C�c h� ch�a gia nh�p m�n ph�i!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if CheckGoldCoin(1) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 1 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 13 then
		Say("D� Th�o: Ph�i trang b� B� C�nh �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,13) <1 then
		Say("D� Th�o: C�c h� ch�a �� 1 B� C�nh �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[8][3], tAwardItem[8][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,1) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(9,nExpireTime)
	end
end

function get_new_horse_4()
	if GetLevel() < LEVEL_EXCHANGE then
		Say("D� Th�o: C�c h� ch�a �� c�p 70 �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetPlayerRoute() == 0  then
		Say("D� Th�o: C�c h� ch�a gia nh�p m�n ph�i!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if CheckGoldCoin(5) == 0 then
		Say("D� Th�o: C�c h� ch�a �� 5 ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nG,nD,nP = GetPlayerEquipInfo(10)
	if nG ~= 0 or nD ~= 105 or nP ~= 13 then
		Say("D� Th�o: Ph�i trang b� B� C�nh �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT	
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
		
	if GetItemCount(0,105,13) <1 then
		Say("D� Th�o: C�c h� ch�a �� 1 B� C�nh �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tAwardItem[11][3], tAwardItem[11][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if DelItemByIndex(nItemIdx,-1) == 1 and DelItem(2,1,30094,5) ==1 and Pay(MONEY_EXCHANGE) == 1  then
		AddEventItem(11,nExpireTime)
	end
end

function get_item(nIndex)
--	if nIndex == 4 and GetTask(ITEM4_TASKID) >= 1 then
--		Say("D� Th�o: C�c h� �� mua v�t ph�m n�y 1 l�n. Kh�ng th� mua th�m.",0)
--		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
--		return
--	end
	
--	if nIndex == 5 and GetTask(ITEM5_TASKID) >= 1 then
--		Say("D� Th�o: C�c h� �� mua v�t ph�m n�y 1 l�n. Kh�ng th� mua th�m.",0)
--		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
--		return
--	end
	
	if CheckGoldCoin(tNewAwardItem[nIndex][6]) == 0 then
		Say("D� Th�o: C�c h� ch�a �� s� ��ng Ti�n V�ng �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if GetCash() < tNewAwardItem[nIndex][7] then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if gf_Judge_Room_Weight(tNewAwardItem[nIndex][3], tNewAwardItem[nIndex][4], "D� Th�o") == 0 then		
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end

	if DelItem(2, 1, 30094, tNewAwardItem[nIndex][6]) == 1 and Pay(tNewAwardItem[nIndex][7]) == 1  then
		AddNewEventItem(nIndex,tNewAwardItem[nIndex][8]*24*60*60)
	end
end

function AddEventItem(nIndex, nExpireTime)
	if nIndex ~= 12 and nIndex ~= 13 then
		local nRetCode, nItem = gf_AddItemEx(tAwardItem[nIndex][2], tAwardItem[nIndex][1]);
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
			Say("D� Th�o: Ch�c m�ng c�c h� nh�n ���c 1 "..tAwardItem[nIndex][1],0)		
			WriteLogEx("Hoat dong thang 8","D� Th�o",tAwardItem[nIndex][2][4],tAwardItem[nIndex][1]);
		else
			WriteLogEx("Hoat dong thang 8","AddItem th�t b�i",tAwardItem[nIndex][2][4],tAwardItem[nIndex][1]);
		end
	elseif nIndex == 12 then
		local nRand = gf_GetRandItemByTable(tRewardHorseAttribute1,100,3)
		local nRetCode, nItem = AddItem(0, 105, 38, 1, 1, 1, 306, 6, 404, tRewardHorseAttribute1[nRand][3], tRewardHorseAttribute1[nRand][4])
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
			Say("D� Th�o: Ch�c m�ng c�c h� nh�n ���c 1L�u V�n K� L�n Th�!",0)		
			WriteLogEx("Ngua Option","H�p th�nh",1,tRewardHorseAttribute1[nRand][1]);
		else
			WriteLogEx("Ngua Option","Th�t b�i",1,tRewardHorseAttribute1[nRand][1]);
		end	
	elseif nIndex == 13 then
		local nRand = gf_GetRandItemByTable(tRewardHorseAttribute2,10000,1)
		local nRetCode, nItem = AddItem(0, 105, 38, 1, 1, 1, 306, 6, 404, tRewardHorseAttribute2[nRand][3], tRewardHorseAttribute2[nRand][4])
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
			Say("D� Th�o: Ch�c m�ng c�c h� nh�n ���c 1L�u V�n K� L�n Th�!",0)		
			WriteLogEx("Ngua Option","H�p th�nh",1,tRewardHorseAttribute2[nRand][1]);
		else
			WriteLogEx("Ngua Option","Th�t b�i",1,tRewardHorseAttribute2[nRand][1]);
		end
	end
end

function AddNewEventItem(nIndex, nExpireTime)
	nRetCodeAll = 1;
	for i = 1, tNewAwardItem[nIndex][2][4] do
		local nRetCode, nItem = 0,0;
		if nIndex ~= 11 then
			nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3], 1, tNewAwardItem[nIndex][2][5]);
		else
			if GetBody() == 1 or GetBody() == 2 then
				nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3] + GetBody() - 1, 1, tNewAwardItem[nIndex][2][5]);
			elseif GetBody() == 3 then
				nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3] + GetBody(), 1, tNewAwardItem[nIndex][2][5]);
			else
				nRetCode, nItem = AddItem(tNewAwardItem[nIndex][2][1], tNewAwardItem[nIndex][2][2], tNewAwardItem[nIndex][2][3] + GetBody() - 2, 1, tNewAwardItem[nIndex][2][5]);
			end
		end
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			end
		else
			nRetCodeAll = 0;
		end
	end
	
	if nRetCodeAll == 1 then	
		Say("D� Th�o: Ch�c m�ng c�c h� nh�n ���c "..tNewAwardItem[nIndex][2][4].." "..tNewAwardItem[nIndex][1],0)
		Msg2Player("B�n nh�n ���c "..tNewAwardItem[nIndex][2][4].." "..tNewAwardItem[nIndex][1])
		WriteLogEx("Hoat dong thang 8","D� Th�o",tNewAwardItem[nIndex][2][4],tNewAwardItem[nIndex][1]);
--		if nIndex == 4  then
--			SetTask(ITEM4_TASKID, GetTask(ITEM4_TASKID) + 1);
--		end
--		if nIndex == 5  then
--			SetTask(ITEM5_TASKID, GetTask(ITEM5_TASKID) + 1);
--		end
	else
		WriteLogEx("Hoat dong thang 8","AddItem th�t b�i",tNewAwardItem[nIndex][2][4],tNewAwardItem[nIndex][1]);
	end
end

function get_soulstone()
	if gf_GetTaskByte(1538, 1) < 1 then
		Say("D� Th�o: C�c h� ch�a luy�n th�nh H�p T��ng Quy Nguy�n n�n kh�ng th� mua ��nh H�n Thi�n Th�ch!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n mua ��nh H�n Thi�n Th�ch")
		return
	elseif GetTask(2430) == 2 then
		Say("D� Th�o: C�c h� �� mua ��nh H�n Thi�n Th�ch 2 l�n r�i, kh�ng th� mua ti�p!",0)
		Msg2Player("B�n kh�ng �� �i�u ki�n mua ��nh H�n Thi�n Th�ch")
		return
	elseif GetItemCount(2, 1, 30094) < 4 then
		Say("D� Th�o: C�c h� ch�a c� �� ��ng Ti�n V�ng �� mua!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n mua ��nh H�n Thi�n Th�ch")
		return
	elseif GetItemCount(2, 1, 3356) < 4 then
		Say("D� Th�o: C�c h� ch�a c� �� Bao Thi�n Th�ch Tinh Th�ch �� mua!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n mua ��nh H�n Thi�n Th�ch")
		return
	elseif GetItemCount(2, 1, 539) < 4 then
		Say("D� Th�o: C�c h� ch�a c� �� Ho�ng Kim ��i H�ng Bao �� mua!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n mua ��nh H�n Thi�n Th�ch")
		return
	elseif GetItemCount(2, 1, 537) < 4 then
		Say("D� Th�o: C�c h� ch�a c� �� T� Kim H�ng Bao �� mua!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n mua ��nh H�n Thi�n Th�ch")
		return
	else
		if DelItem(2, 1, 30094, 4) == 1 and DelItem(2, 1, 3356, 4) == 1 and DelItem(2, 1, 539, 4) == 1 and DelItem(2, 1, 537, 4) == 1 then
			gf_AddItemEx2({2, 1, 1067, 1}, "��nh H�n Thi�n Th�ch", "Hoat dong thang 5", "nh�n ���c", 15*24*60*60)
			local nGet = GetTask(2430)
			SetTask(2430, nGet + 1)
		end
	end
end

function get_transport()
	local tbSayDialog = {}
	local nSaySize = 0
	local szSayHead = "D� Th�o: C�c h� mu�n mua v�t ph�m n�o:"
	
	tinsert(tbSayDialog, "Ta mu�n mua Th�n H�nh B�o �i�n (1400 v�ng)/#get_transport_scroll(1)")
	tinsert(tbSayDialog, "Ta mu�n mua Th�n H�nh B� Ph� (160 v�ng)/#get_transport_scroll(2)")
	tinsert(tbSayDialog, "Tr� l�i trang tr��c/page1")
	
	nSaySize = getn(tbSayDialog)
	Say(szSayHead, nSaySize, tbSayDialog)
end

function get_transport_scroll(nType)
	if GetLevel() < 10 then
		Talk(1,"",format("Ch�a �� ��ng c�p �� mua %s!", TB_TRANSPORT_SCROLL[nType][2]))
		return
	end
	if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
		Talk(1,"",format("Ch�a ph�i l� th�n d�n b�n qu�c n�n kh�ng th� mua %s!",  TB_TRANSPORT_SCROLL[nType][2]))
		return
	end
	if GetCash() < TB_TRANSPORT_SCROLL[nType][3] then
		Talk(1,"",format("Kh�ng �� ti�n mua %s!", TB_TRANSPORT_SCROLL[nType][2]))
		return
	end
	if gf_Judge_Room_Weight(2, 200, "D� Th�o") == 0 then
		Talk(1,"","H�nh trang kh�ng �� ch� tr�ng ho�c qu� n�ng!")
		return
	end
	
	Pay(TB_TRANSPORT_SCROLL[nType][3])
	nRet, nItemIdx = gf_AddItemEx2(TB_TRANSPORT_SCROLL[nType][1],TB_TRANSPORT_SCROLL[nType][2], "Hoat dong thang 6 nam 2010", "D� Th�o")
	if nRet == 1 then
		SetItemExpireTime(nItemIdx,TB_TRANSPORT_SCROLL[nType][4])
	end
end

function get_reindeer_2010()
	if GetCash() < MONEY_EXCHANGE then
		Say("D� Th�o: S� ti�n c�c h� mang theo kh�ng ��!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
		
	local nG,nD,nP = GetPlayerEquipInfo(10)
		if nG ~= 0 or nD ~= 105 or nP ~= 15 then
		Say("D� Th�o: Ph�i trang b� Phi�u V� �� ��i ph�n th��ng!",0)
		Msg2Player("B�n ch�a �� �i�u ki�n ��i ph�n th��ng")
		return
	end
	
	if gf_Judge_Room_Weight(2, 200, "D� Th�o") == 0 then		
		Msg2Player("H�nh trang kh�ng �� ch� ch�a ho�c qu� n�ng!")
		return
	end
	
	local nItemIdx = GetPlayerEquipIndex(10)
	local nExpireTime = GetItemExpireTime(nItemIdx) or ITEM_TIME_LIMIT
	if nExpireTime <= 0 then
	 	nExpireTime =  ITEM_TIME_LIMIT	
	 end
	UnEquipAtPosition(10)
	
	if DelItemByIndex(nItemIdx,-1) == 1 and Pay(MONEY_EXCHANGE) == 1  then
		local nRetCode, nItem = AddItem(0, 105, 35, 1, 4, -1, -1, -1, -1, -1, -1)
		if nRetCode == 1 then
			if nExpireTime ~= 0 then
				SetItemExpireTime(nItem, nExpireTime)
			else
				SetItemExpireTime(nItem, 30 * 24 * 3600)
			end
			Say("D� Th�o: Ch�c m�ng c�c h� nh�n ���c Tu�n L�c!",0)
			WriteLogEx("Hoat dong thang 12 nam 2010", "��i Tu�n L�c th�nh c�ng")
		else
			WriteLogEx("Hoat dong thang 12 nam 2010", "��i Tu�n L�c th�t b�i")
		end
	end
end

function buy_elephant(nStep)
	local szNPC = "<color=green>D� Th�o:<color> "
	local nTichluy = 200000
	local nXu = 2400
	local nHSD = 90
	local tSay = {}
	if nStep == 0 then
		tinsert(tSay, "Ta ��ng �, h�y giao n� cho ta!/#buy_elephant(1)")
		tinsert(tSay, "T�i h� t�i h�n s�c m�n, kh�ng �� kh� n�ng/end_dialogover")
		Say("��a ta <color=yellow>" .. nTichluy .. "<color> t�ch l�y T�ng Li�u v� <color=yellow>" .. nXu .. "<color> v�t ph�m xu, <color=green>Chi�n T��ng Nguy�n So�i<color> s� theo c�c h� chinh chi�n <color=red>" .. nHSD .. " ng�y<color>. C�c h� ��ng � ch�?", getn(tSay), tSay)
		return 0
	end
	
	if nStep == 1 then
		if gf_Judge_Room_Weight(1, 10) == 0 then
			Talk(1,"", szNPC .. "S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
			return 0
		end
		if GetTask(707) < nTichluy then
			Talk(1,"", szNPC .. "�i�m t�ch l�y kh�ng ��, c�c h� quay l�i sau nh�.")
			return 0
		end
		if GetItemCount(2,1,30230) < nXu then
			Talk(1,"", szNPC .. "Kh�ng �� v�t ph�m xu, hay l� c�c h� qu�n mang theo?.")
			return 0
		end
	
		LIB_Award.szLogTitle = "CHIEN TUONG"
		LIB_Award.szLogAction = "mua"
		local tbAward = {item = {{gdp = {0,105,30033,1,1,-1,-1,-1,-1,-1,-1,-1}, nExpired = (nHSD*24*60*60), name = "Chi�n T��ng Nguy�n So�i"}}}
		
		if DelItem(2,1,30230,nXu) == 1 and GetTask(707) >= nTichluy then
			SetTask(707, GetTask(707) - nTichluy)
			LIB_Award:Award(tbAward)
			Talk(1,"",szNPC .. "Chi�n T��ng Nguy�n So�i �� theo c�c h�.")
		end
		return 0
	end
end


function change_elephant()
	PutinItemBox("��i Chi�n T��ng" ,1 , "Chi�n T��ng n�y ch�y kh�ng nhanh, ta mu�n ��i Chi�n T��ng Nguy�n So�i kh�c!", CHIENTUONG_FILE, 1)
end

function end_dialogover()
end