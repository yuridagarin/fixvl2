Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");
Include("\\script\\online\\viet_event\\golden_card\\npc_golden_saleman.lua");
Include("\\script\\online_activites\\reborn\\tongban\\npc\\bacdaulaonhan.lua");
Include("\\script\\weapon_upgrade\\upgrade_npc.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua") 
Include("\\script\\vng\\loiholenh\\caitheanhhao.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua")

-- 20120416: Chimc Modify: Dieu chinh gia ban Bach Kim Lenh
function PlatinumCard_GetPrice()
	local nDate = tonumber(date("%Y%m%d"))
	local nPrice = 2400
	local tbPrice = {
			{startdate=20120605, enddate=20120617, price=600}
		}
	for i=1,getn(tbPrice) do
		if nDate>=tbPrice[i]["startdate"] and nDate<=tbPrice[i]["enddate"] then
			nPrice = tbPrice[i]["price"]
		end
	end
	return nPrice
end

function platinum_award()
	local nType = CheckAccountExt_BKL()
	if nType == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh B�i .")
		return
	end
	local tSay = {
--		"Ta mu�n mua m� Ho�ng Kim L�nh B�i/get_golden_card",
--		"Ta mu�n k�ch ho�t L�nh b�i B�ch Kim (t�n "..PlatinumCard_GetPrice().." Xu V�t Ph�m)/activate_BKL",
--		"Xem th�i h�n c�n l�i c�a th� B�ch Kim L�nh/get_info_BKL",
--		"Ta mu�n k�ch ho�t nh�n th��ng C�i Th� Anh H�o (nh�n th��ng theo ��ng c�p)/#activate_account_BKL(1)",
--		"Ta mu�n k�ch ho�t nh�n th��ng Tuy�t Th� Cao Nh�n/#activate_account_BKL(2)",
--		"Ta mu�n nh�n th��ng Tuy�t Th� Cao Nh�n/#get_friendly_award_BKL(1)",
--		"Ta mu�n nh�n th��ng Tuy�t Th� Cao Nh�n - VIP/#get_friendly_award_BKL(2)",
--Ch�a xong, c�n C�i Th� Anh H�o--		"Ta mu�n nh�n ph�n th��ng m�i ng�y/get_platinum_day",
--		"Ta mu�n nh�n th��ng ng�y v�ng/get_platinum_weekday",
--		"Ta mu�n nh�n th��ng theo ��ng c�p (�� k�ch ho�t th�nh c�ng)/award_level_BKL",
		--"Ta mu�n ��i T� Linh B�i/award_golden_jewel",
--		"T�i h� ch� gh� ngang!/dlgover",
	}
	if nType == 1 then	
		tinsert(tSay,"Ta mu�n k�ch ho�t nh�n th��ng C�i Th� Anh H�o (nh�n th��ng theo ��ng c�p/#activate_account_BKL(1)")		
	elseif nType == 2 then
		tinsert(tSay,"Ta mu�n k�ch ho�t nh�n th��ng Tuy�t Th� Cao Nh�n/#activate_account_BKL(2)")	
	elseif nType == 3 then	
		tinsert(tSay,"Ta mu�n nh�n th��ng theo ��ng c�p (�� k�ch ho�t th�nh c�ng)/LHL_menu_award")
		tinsert(tSay,"Ta mu�n nh�n th��ng ng�y v�ng/get_platinum_weekday")
		tinsert(tSay,"Ta mu�n nh�n ph�n th��ng m�i ng�y/get_platinum_day_CTAH")
		tinsert(tSay,"Nh�n v�t ph�m mi�n ph� m�i ng�y (c�p 88 tr� l�n: 44 v�ng + 2 th�i d�ch h�n nguy�n c�ng))/get_platinum_day_freeAward_CTAH")
	elseif nType == 4 then	
		tinsert(tSay,"Ta mu�n nh�n th��ng Tuy�t Th� Cao Nh�n/#get_friendly_award_BKL(1)")	
		tinsert(tSay,"Ta mu�n nh�n th��ng Tuy�t Th� Cao Nh�n - VIP/#get_friendly_award_BKL(2)")	
		tinsert(tSay,"Ta mu�n nh�n th��ng ng�y v�ng/get_platinum_weekday")
		tinsert(tSay,"Ta mu�n nh�n ph�n th��ng m�i ng�y/get_platinum_day_TTCN")
	end	
	tinsert(tSay,"T�i h� ch� gh� ngang/dlgover")
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>L�i H� L�nh<color>, c�c h� c� th� ��n g�p ta �� nh�n c�c ph�n th��ng sau:", getn(tSay),tSay)
end

function get_platinum_day_CTAH()
	local tSay = {}
	tinsert(tSay,"��ng �/confirm_get_platinum_day_CTAH")
	tinsert(tSay,"T�i h� ch� gh� ngang/dlgover")
	Say("<color=green>Ch� Ph�ng M�y<color>: Nhi�m v� c�ng hi�n c�c v�t ph�m (1 B�t nh� nh�, 1 B�t nh� l�n, 1 H�t gi�ng, 1 T�ng r��ng) �� nh�n th��ng c�c v�t ph�m: 2 th�i d�ch h�n nguy�n c�ng ��, 30 m�nh thi�n cang, 7 m�nh thi�n m�n, 20 danh v�ng, 20 s� m�n, 2000 qu�n c�ng, 4,7 tri�u �i�m kinh nghi�m.", getn(tSay),tSay)
end

function confirm_get_platinum_day_CTAH()
	local tbdailyCTAH = {
									{2,0,504,1}, --b�t nh� nh�
									{2,0,398,1}, --b�t nh� l�n
									{2,1,30086,1},  --h�t gi�ng
									{2,1,30341,1},	 --t�ng r��ng				
								}
	local nType = CheckActivatedExt_BKL()
	if nType ~= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	local nType = CheckActivatedExt_BKL()
	if nType ~= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_BKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_DAILYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_BKLB_DAILYAWARD), 10)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n th��ng h�m nay r�i. Mai quay l�i nh�.")
		return
	end
	local nCheckItemCountCTAH = 1
	for i =1, getn(tbdailyCTAH) do
		if GetItemCount(tbdailyCTAH[i][1],tbdailyCTAH[i][2],tbdailyCTAH[i][3]) < tbdailyCTAH[i][4] then
			nCheckItemCountCTAH = 0
			break
		end
	end			
	if nCheckItemCountCTAH == 0 then
		Talk(1, "", "��i hi�p kh�ng mang �� nguy�n li�u �� nh�n nhi�m v� !!!!")
		return
	end				
	if gf_Judge_Room_Weight(10, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	local nDelItemCountCTAH = 1
	for i =1, getn(tbdailyCTAH) do
		if DelItem(tbdailyCTAH[i][1],tbdailyCTAH[i][2],tbdailyCTAH[i][3],tbdailyCTAH[i][4]) ~= 1 then
			nDelItemCountCTAH = 0
			gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "M�i ng�y CTAH kh�ng th�nh c�ng")
			break
		end
	end
	if nDelItemCountCTAH == 1 then
		SetTask(TSK_BKLB_DAILYAWARD, GetTask(TSK_BKLB_DAILYAWARD) + 1)
		gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "M�i ng�y CTAH th�nh c�ng")
	end
	gf_AddItemEx2({2,0,1082, 2,1},"Th�i D�ch H�n Nguy�n C�ng ��", szBKLBLogHeader, szBKLBLogAction) 
	gf_AddItemEx2({2,1,30390, 30,1},"M�nh Thi�n Cang", szBKLBLogHeader, szBKLBLogAction)
	gf_AddItemEx2({2,1,30410, 7,1},"M�nh Thi�n M�n", szBKLBLogHeader, szBKLBLogAction)
	ModifyReputation(20,0)	--th�m 20 danh v�ng
	SetTask(336,GetTask(336) +20) --th�m 20 s� m�n
	Msg2Player("B�n nh�n ���c 20 �i�m s� m�n")
	if GetTask(701) > 0 then
				SetTask(701, GetTask(701) + 2000)
			elseif GetTask(701) < 0 then
				SetTask(701, GetTask(701) - 2000)
			end
	Msg2Player("B�n nh�n ���c 2000 �i�m qu�n c�ng.")
	ModifyExp(4700000)
end

function get_platinum_day_freeAward_CTAH()
	local nType = CheckActivatedExt_BKL()
	if nType ~= 1 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	if gf_Judge_Room_Weight(4, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end	
	if GetLevel() < 88 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��i hi�p ch�a ��t c�p 88, kh�ng th� nh�n th��ng.");
		return
	end	
	local nReceiveDate = floor(GetTask(TSK_BKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_DAILYAWARD, nDate * 100)
	end	
	local nReceiveCount = VNG_GetTaskPos(TSK_BKLB_DAILYAWARD, 2, 2)--mod(GetTask(TSK_BKLB_DAILYAWARD), 100)
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n th��ng h�m nay r�i. Mai quay l�i nh�.")
		return
	end
	VNG_SetTaskPos(TSK_BKLB_DAILYAWARD, 1, 2, 2)--SetTask(TSK_BKLB_DAILYAWARD, GetTask(TSK_BKLB_DAILYAWARD) + 1)	
	Earn(440000)
	gf_AddItemEx2({2,0,1082, 2,1},"Th�i D�ch H�n Nguy�n C�ng ��", szBKLBLogHeader, szBKLBLogAction) 
	gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "Mi�n ph� m�i ng�y CTAH th�nh c�ng")

end

function get_platinum_day_TTCN()
	local tSay = {
		"Ta mu�n nh�n v�t ph�m thu th�p + H�t gi�ng/#confirm_get_platinum_day(1)",
		"Ta mu�n nh�n v�t ph�m thu th�p + V�ng/#confirm_get_platinum_day(2)",
		"Ta mu�n nh�n v�t ph�m thu th�p + Tu Ch�n Y�u Quy�t/#confirm_get_platinum_day(3)",
--		"Ta mu�n nh�n v�t ph�m thu th�p + Tr�i C�y/#confirm_get_platinum_day(4)",
		"T�i h� ch� gh� ngang!/dlgover",
	}	
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>L�i H� L�nh<color>, m�i ng�y c�c h� c� th� ��n g�p ta �� nh�n c�c ph�n th��ng sau:", getn(tSay),tSay)	
end

function activate_BKL()
	local nPlatinumPrice = PlatinumCard_GetPrice()
	local nBKL_End = GetTime()
	if nBKL_End - GetTask(TSK_BKLB_START) < 5270400 or CheckAccountExt_BKL() ~= 0 then
		Msg2Player("L�i H� L�nh v�n c�n �ang hi�u l�c. ��i hi�p kh�ng th� k�ch ho�t th�m ���c n�a.")
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: L�i H� L�nh v�n c�n �ang hi�u l�c. ��i hi�p kh�ng th� k�ch ho�t th�m ���c n�a.")
		return
	end	
	
	if GetItemCount(2,1,30230) < nPlatinumPrice then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng �� Xu V�t Ph�m �� k�ch ho�t L�i H� L�nh")
		return
	end
	local nCreateTime = GetCreateTime()  --1332435468
	if DelItem(2,1,30230,nPlatinumPrice) == 1 then
		if nCreateTime >= 1332370895 and GetTask(TSK_BKLB_COUNT) == 0 and CheckCharged_BKL() == 0 then
			SetTask(TSK_BKLB_START, GetTime())
			SetTask(TSK_BKLB_ACTIVE,1)
			gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 1) 	
			WriteLogEx(szBKLBLogHeader, "kich hoat CTAH",1);
			Msg2Player("K�ch ho�t L�i H� L�nh th�nh c�ng tr� th�nh C�i Th� Anh H�o. Vui l�ng k�ch ho�t nh�n th��ng C�i Th� Anh H�o.")
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: K�ch ho�t L�i H� L�nh th�nh c�ng tr� th�nh C�i Th� Anh H�o. Vui l�ng k�ch ho�t nh�n th��ng C�i Th� Anh H�o.")
		else
			SetTask(TSK_BKLB_START, GetTime())
			SetTask(TSK_BKLB_ACTIVE,2)
			gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 2) 		
			WriteLogEx(szBKLBLogHeader, "kich hoat TTCN",1);
			Msg2Player("K�ch ho�t L�i H� L�nh th�nh c�ng tr� th�nh Tuy�t Th� Cao Nh�n. Vui l�ng k�ch ho�t nh�n th��ng Tuy�t Th� Cao Nh�n.")
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: K�ch ho�t L�i H� L�nh th�nh c�ng tr� th�nh Tuy�t Th� Cao Nh�n. Vui l�ng k�ch ho�t nh�n th��ng Tuy�t Th� Cao Nh�n.")
		end
	end
	SetTask(TSK_BKLB_COUNT, GetTask(TSK_BKLB_COUNT) + 1)
	local nCoutBKL = CheckCharged_BKL()
	gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_COUNT, nCoutBKL + 1) 		
	gf_WriteLogEx(szBKLBLogHeader, "T�ng s� k�ch ho�t")
end
function get_info_BKL()
	local nType = CheckActivated_BKL()
	if nType == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	local nBKL_End = GetTime()
	local nDay = floor((5270400 - (nBKL_End - GetTask(TSK_BKLB_START))) / 86400)
	Msg2Player("Th�i gian hi�u l�c c�a L�i H� L�nh c�n : "..nDay.." ng�y")
	Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Th�i gian hi�u l�c c�a L�i H� L�nh c�n : "..nDay.." ng�y")
	 end
function confirm_get_platinum_day(nIndex)
	local nType = CheckActivatedExt_BKL()
	if nType ~= 2 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_BKLB_DAILYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_DAILYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_BKLB_DAILYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n th��ng h�m nay r�i. Mai quay l�i nh�.")
		return
	end
	
	if gf_Judge_Room_Weight(10, 100, "Ch� Ph�ng M�y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	
	SetTask(TSK_BKLB_DAILYAWARD, GetTask(TSK_BKLB_DAILYAWARD) + 1)
	
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end
	
	gf_AddItemEx2({2,0,1082, tb_everyday_award_BKL[nType][nLevel][1]},"Th�i D�ch H�n Nguy�n C�ng ��", szBKLBLogHeader, szBKLBLogAction)
	if nIndex == 1 then
		gf_AddItemEx2({2,1,30086, tb_everyday_award_BKL[nType][nLevel][2],4},"H�t gi�ng", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "M�i ng�y: H�t gi�ng, c�p "..nLevel)
	elseif nIndex == 2 then
		Earn(tb_everyday_award_BKL[nType][nLevel][4] * 10000)
		gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "M�i ng�y: V�ng, c�p "..nLevel)		
	elseif nIndex == 3 then
		gf_AddItemEx2({2,0,554, tb_everyday_award_BKL[nType][nLevel][3],4},"Tu ch�n y�u quy�t", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "M�i ng�y: Y�u Quy�t, c�p "..nLevel)
--	elseif nIndex == 4 then
		--gf_AddItemEx2(tb_everyday_award_BKL[nType][nLevel][6], tb_everyday_award_BKL[nType][nLevel][5], szBKLBLogHeader, szBKLBLogAction)
--		local nIndex_fruit = mod(random(1,10000),20)
--		gf_AddItemEx2({2,1,tb_everyday_fruit_BKL[nIndex_fruit][1],tb_everyday_award_BKL[nType][nLevel][7]}, "Tr�i c�y", szBKLBLogHeader, szBKLBLogAction)		
--		gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "M�i ng�y: Tr�i c�y, c�p "..nLevel)
	end
end

function get_platinum_weekday()
	local tSay = {}
	tinsert(tSay, "Ta mu�n nh�n G� Qu�n D�ng + Qu�n C�ng + B�t Nh� Nh�/#confirm_get_platinum_weekday_BKL(1)")
	tinsert(tSay, "Ta mu�n nh�n G� Qu�n D�ng + V�ng/#confirm_get_platinum_weekday_BKL(2)")
	tinsert(tSay, "T�i h� ch� gh� ngang!/dlgover")
	
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>L�i H� L�nh<color>, v�o c�c ng�y th� 6, 7, Ch� Nh�t h�ng tu�n c�c h� c� th� ��n g�p ta �� nh�n c�c ph�n th��ng sau:", getn(tSay),tSay)		
end

function confirm_get_platinum_weekday_BKL(nIndex)
	--local nType = CheckActivated_BKL()
	local nType1 = CheckActivatedExt_BKL()
	if nType1 == 0 then		--nType == 0 or 
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh ho�c ch�a k�ch ho�t nh�n th��ng.")
		return
	end
	
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� c� th� nh�n ph�n th��ng n�y v�o th� s�u, th� b�y v� ch� nh�t.");
		return
	end
	
	local nReceiveDate = floor(GetTask(TSK_BKLB_GOLDENDAYAWARD) / 100)
	local nDate = tonumber(date("%y%m%d"))
		
	if nReceiveDate ~= nDate then
		SetTask(TSK_BKLB_GOLDENDAYAWARD, nDate * 100)
	end
	
	local nReceiveCount = mod(GetTask(TSK_BKLB_GOLDENDAYAWARD), 100)
	
	if nReceiveCount > 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n th��ng h�m nay r�i. Mai quay l�i nh�.")
		return
	end
	
	if gf_Judge_Room_Weight(10, 800, "Ch� Ph�ng M�y") == 0 then
		return
	end
	
	if GetPlayerRoute() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	
	SetTask(TSK_BKLB_GOLDENDAYAWARD, GetTask(TSK_BKLB_GOLDENDAYAWARD) + 1)
	local nLevel = floor(GetLevel()/10)
	if nLevel < 7 then
		nLevel = 7
	end

	if nIndex == 1 then
		gf_AddItemEx2({2,0,308,tb_golden_material_goldenday_BKL[nLevel][3]}, "G� Qu�n D�ng", szBKLBLogHeader, szBKLBLogAction)		
		gf_AddItemEx2({2,0,504,tb_golden_material_goldenday_BKL[nLevel][5],4}, "B�t Nh� nh�", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		if nLevel == 9 then
			gf_AddItemEx2({2,1,9977,1,4}, "Qu�n C�ng Huy Ho�ng", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)	
		elseif nLevel == 8 then
			gf_AddItemEx2({2,1,9998,1,4}, "Qu�n C�ng ��i", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		elseif nLevel == 7 then	
			gf_AddItemEx2({2,1,9999,1,4}, "Qu�n C�ng Ch��ng", szBKLBLogHeader, szBKLBLogAction, 15*24*60*60)
		end
		 gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "Ng�y v�ng: G� + B�t nh�, c�p "..nLevel)
	else
		local nCash = tb_golden_material_goldenday_BKL[nLevel][6] * 10000
		gf_AddItemEx2({2,0,308,tb_golden_material_goldenday_BKL[nLevel][3]}, "G� Qu�n D�ng", szBKLBLogHeader, szBKLBLogAction)	
		Earn(nCash)
		gf_WriteLogEx(szBKLBLogHeader, "��i th�nh c�ng", 1, "Ng�y v�ng: G� + v�ng, c�p "..nLevel)
	end

end

function activate_account_BKL(nType)
	local nLevel = GetLevel()
	local nExp = GetExp()
	if CheckAccountExt_BKL() <= 0 then  --CheckAccount_BKL() <= 0 	--GetTask(TSK_BKLB_ACTIVE) == 0 and 
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� kh�ng c� L�i H� L�nh.")
		return
	end
	
	if CheckActivatedExt_BKL() ~= 0 then	--CheckActivated_BKL() ~= 0 or 
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� �� ���c k�ch ho�t r�i, kh�ng c�n k�ch ho�t n�a!");
		return
	end
	
	if nType == 1 then
		if CheckAccountExt_BKL() ~= 1 then	--GetTask(TSK_BKLB_ACTIVE) ~= 1 and 
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Kh�ng ph�i C�i Th� Anh H�o, kh�ng th� k�ch ho�t.");
			return
		end
		
		if CheckCharged_BKL() > 1 then 	--GetTask(TSK_BKLB_COUNT) > 1 and 
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ho�t ��ng ch� �p d�ng ��i v�i t�i kho�n n�p L�i H� L�nh l�n ��u.");
			return
		end
		
		if nLevel <= NEEDED_LEVEL then		
			if nLevel == NEEDED_LEVEL then
					if nExp <= NEEDED_EXP then
						if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 3) == 1 then
							--SetTask(TSK_BKLB_ACTIVE, 3)
							--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_LEVELAWARD, 1)
							--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_STATUS, 3)
							SetLevel(73,0)
							ModifyExp(20000000)			
							ModifyReputation(3000, 0)
							Earn(999999)
							gf_WriteLogEx(szBKLBLogHeader, "K�ch ho�t th�nh c�ng C�i Th� Anh H�o",1, "C�i Th� Anh H�o")
							Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� �� ���c k�ch ho�t C�i Th� Anh H�o! Vui l�ng ��ng nh�p l�i!");	
						end	
					else
--						if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 4) == 1 then
--							SetTask(TSK_BKLB_REWARD, 0)
--							SetTask(TSK_BKLB_EXCHANGE,0)
--							gf_WriteLogEx(szBKLBLogHeader, "K�ch ho�t th�nh c�ng Tuy�t Th� Cao Nh�n",1, "Tuy�t Th� Cao Nh�n do level cao")
--							Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� c� level qu� cao n�n kh�ng th� tr� th�nh C�i Th� Anh H�o ���c. Ch�c m�ng ��i hi�p �� tr� th�nh Tuy�t Th� Cao Nh�n. Vui l�ng ��ng nh�p l�i!");	
--						end	
						Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: �� k�ch ho�t C�i Th� Anh H�o c�n ��ng c�p <= 73 v� �i�m kinh nghi�m ph�i �t h�n 20 tri�u.")
						return 0
					end
			elseif nLevel < NEEDED_LEVEL then
					if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 3) == 1 then
						--SetTask(TSK_BKLB_ACTIVE, 3)
						--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_LEVELAWARD, 1)
						--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_STATUS, 3)
						SetLevel(73,0)
						ModifyExp(20000000)			
						ModifyReputation(3000, 0)
						Earn(999999)
						gf_WriteLogEx(szBKLBLogHeader, "K�ch ho�t th�nh c�ng C�i Th� Anh H�o",1, "C�i Th� Anh H�o")
						Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� �� ���c k�ch ho�t C�i Th� Anh H�o! Vui l�ng ��ng nh�p l�i!");	
					end	
			end
		else
--			if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 4) == 1 then
--				SetTask(TSK_BKLB_REWARD, 0)
--				SetTask(TSK_BKLB_EXCHANGE,0)
--				gf_WriteLogEx(szBKLBLogHeader, "K�ch ho�t th�nh c�ng Tuy�t Th� Cao Nh�n",1, "Tuy�t Th� Cao Nh�n")
--				Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� c� level qu� cao n�n kh�ng th� tr� th�nh C�i Th� Anh H�o ���c. Ch�c m�ng ��i hi�p �� tr� th�nh Tuy�t Th� Cao Nh�n. Vui l�ng ��ng nh�p l�i!");	
--			end	
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: �� k�ch ho�t C�i Th� Anh H�o c�n ��ng c�p <= 73 v� �i�m kinh nghi�m ph�i �t h�n 20 tri�u.")
			return 0
		end
	elseif nType == 2 then
		if CheckAccountExt_BKL() ~= 2 then		--GetTask(TSK_BKLB_ACTIVE) ~= 2 and 
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Kh�ng ph�i Tuy�t Th� Cao Nh�n, kh�ng th� k�ch ho�t.");
			return
		end
		if gf_SetExtPointByte(EXT_POINT_BKLB, BYTE_BKLB_TYPE, 4) == 1 then
			--SetTask(TSK_BKLB_ACTIVE, 4)  --
			--gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_STATUS, 4)
			SetTask(TSK_BKLB_REWARD, 0)
			SetTask(TSK_BKLB_EXCHANGE,0)
			gf_WriteLogEx(szBKLBLogHeader, "K�ch ho�t th�nh c�ng Tuy�t Th� Cao Nh�n",1, "Tuy�t Th� Cao Nh�n")
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� �� ���c k�ch ho�t Tuy�t Th� Cao Nh�n! Vui l�ng ��ng nh�p l�i!");	
		end
	end
end

function award_level_BKL()
	local tSay = {
					"Ta mu�n nh�n ph�n th��ng c�p �� 74/#get_BKL_award(74)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 75/#get_BKL_award(75)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 76/#get_BKL_award(76)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 77/#get_BKL_award(77)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 78/#get_BKL_award(78)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 79/#get_BKL_award(79)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 80/#get_BKL_award(80)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 81/#get_BKL_award(81)",			
					"Ta mu�n nh�n ph�n th��ng c�p �� 82/#get_BKL_award(82)",	
					"Trang k�/award_level_2_BKL",
					"T�i h� ch� gh� ngang!/dlgover",
			}
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>L�i H� L�nh<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), c�c h� c� th� ��n g�p ta �� nh�n ph�n th��ng.",	getn(tSay),tSay)	
end

function award_level_2_BKL()
	local tSay = {							
					"Ta mu�n nh�n ph�n th��ng c�p �� 83/#get_BKL_award(83)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 84/#get_BKL_award(84)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 85/#get_BKL_award(85)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 86/#get_BKL_award(86)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 87/#get_BKL_award(87)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 88/#get_BKL_award(88)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 89/#get_BKL_award(89)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 90/#get_BKL_award(90)",
					"Trang k�/award_level_3_BKL",	
					"Trang tr��c/award_level_BKL",
					"T�i h� ch� gh� ngang!/dlgover",
			}
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>L�i H� L�nh<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), c�c h� c� th� ��n g�p ta �� nh�n ph�n th��ng.",	getn(tSay),tSay)		
end

function award_level_3_BKL()
	local tSay = {							
					"Ta mu�n nh�n ph�n th��ng c�p �� 91/#get_BKL_award(91)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 92/#get_BKL_award(92)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 93/#get_BKL_award(93)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 94/#get_BKL_award(94)",	
					"Ta mu�n nh�n ph�n th��ng c�p �� 95/#get_BKL_award(95)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 96/#get_BKL_award(96)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 97/#get_BKL_award(97)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 98/#get_BKL_award(98)",
					"Ta mu�n nh�n ph�n th��ng c�p �� 99/#get_BKL_award(99)",										
					"Trang tr��c/award_level_2_BKL",
					"T�i h� ch� gh� ngang!/dlgover",
			}
	Say("<color=green>Ch� Ph�ng M�y<color>: ��i v�i c�c t�i kho�n c� <color=yellow>L�i H� L�nh<color>, khi ��t ���c c�c m�c �i�u ki�n nh�n th��ng (xem th�m tr�n trang ch�), c�c h� c� th� ��n g�p ta �� nh�n ph�n th��ng.",	getn(tSay),tSay)		
end

function get_BKL_award(nLevel)
	if CheckActivatedExt_BKL() ~= 1 then		--CheckActivated_BKL() ~= 1 and 
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� ch�a k�ch ho�t nh�n th��ng ho�c kh�ng ph�i C�i Th� Anh H�o!");
		return
	end
	
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� ch�a gia nh�p m�n ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if tRouteSkillInfo[nRoute]== 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end
	if GetLevel() < 74 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p c�a c�c h� ch�a �� 74, kh�ng th� nh�n th��ng.");
		return
	end
	
	if gf_Check55MaxSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	
	confim_get_golden_award_BKL(nLevel)
end

function confim_get_golden_award_BKL(nLevel)
	do return end
	local nAwardLevel = CheckLevel_BKL();
	if nAwardLevel == 0 or nAwardLevel < nLevel then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Kh�ng �� �i�u ki�n �i�m qu�n c�ng, danh v�ng v� �i�m s� m�n �� nh�n ph�n th��ng n�y");
		return
	end
	if nLevel >= 90 and nLevel< 99 then
		if GetExp() < tb_golden_award_BKL[nLevel][5] then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ph�i c� �� ".. tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m m�i c� th� nh�n ph�n th��ng c�p "..nLevel.."!")
			return
		end
		if GetReputation() < tb_golden_award_BKL[nLevel][6] then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ph�i c� �� ".. tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng m�i c� th� nh�n ph�n th��ng c�p "..nLevel.."!")
			return
		end
		if GetTask(336) < tb_golden_award_BKL[nLevel][7] then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ph�i c� �� ".. tb_golden_award_BKL[nLevel][7].." �i�m s� m�n m�i c� th� nh�n ph�n th��ng c�p "..nLevel.."!")
			return
		end
		if GetItemCount() < tb_golden_award_BKL[nLevel][8] then
			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ph�i c� �� ".. tb_golden_award_BKL[nLevel][8].." Xu v�t ph�m m�i c� th� nh�n ph�n th��ng c�p "..nLevel.."!")
			return	
		end
--		if GetCash() < tb_golden_award_BKL[nLevel][8]*10000 then
--			Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ph�i c� �� ".. tb_golden_award_BKL[nLevel][8].." v�ng m�i c� th� nh�n ph�n th��ng c�p "..nLevel.."!")
--			return
--		end
	end
	warning_get_golden_award_BKL(nLevel, nAwardLevel);
end

function warning_get_golden_award_BKL(nWantLevel, nLevel)
	do return end
	Say("<color=green>Ch� Ph�ng M�y<color>: Nh�n ph�n th��ng c�p <color=red>"..nWantLevel.."<color>, c�c h� c� th� nh�n ph�n th��ng cao nh�t l�  ph�n th��ng c�p <color=red>"..nLevel.."<color>. C� ch�c mu�n nh�n ph�n th��ng c�p "..nWantLevel.." kh�ng?",
		2,
		"Ta mu�n nh�n /#confirm_confirm_BKL("..nWantLevel..")",
		"�� ta suy ngh� l�i xem./dlgover");
end

function confirm_confirm_BKL(nLevel)
	do return end
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c nh�n th��ng")
		return
	end
	if CheckActivatedExt_BKL() ~= 1 then		--CheckActivated_BKL() ~= 1
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: T�i kho�n c�a c�c h� ch�a k�ch ho�t nh�n th��ng ho�c kh�ng ph�i C�i Th� Anh H�o!");
		return
	end
	
	local nGet = CheckAwardLevel_BKL()
	if nGet > tb_golden_award_BKL[nLevel][4] then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n ti�p n�a!");
		return
	end
	if nLevel == 78 then	
		if gf_Judge_Room_Weight(20, 500, "Ch� Ph�ng M�y") == 0 then
			return
		end
	else
		if gf_Judge_Room_Weight(12, 500, "Ch� Ph�ng M�y") == 0 then
			return
		end
	end
	
	local nBody = GetBody();
	local nRoute = GetPlayerRoute();
	local nGuanGong = GetTask(701)
	local szLogTitle = szBKLBLogHeader
	local szLogAction = "nh�n th��ng theo c�p"
	local nRet, nItemIdx = 0,0;
	local nCashPay = tb_golden_award_BKL[nLevel][8]*10000
	local nCash1= tb_golden_award_BKL[nLevel][8]
	
	if tRouteSkillInfo[nRoute] == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: C�c h� ch�a gia nh�p h� ph�i kh�ng th� nh�n th��ng.");
		return
	end	
	
	gf_SetTaskByte(TSK_BKLB_FLAG, BYTE_BKLB_LEVELAWARD, nGet + 1)
	if nLevel == 74 then										
		gf_AddItemEx2({2, 0, 553,3,1},"��i Nh�n S�m", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({2, 0, 554,15,1},"Tu Ch�n Y�u Quy�t", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({0, 107, 64,1,1},"Thi�n H� M�t t�ch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 65,1,1},"T� H� M�t t�ch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 66,1,1},"Chi�m Y Ph�", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 60,1,1},"Tu La M�t t�ch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 59,1,1},"Kim Thi�n Ph�", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 61,1,1},"B� Kim M�t t�ch", szLogTitle, szLogAction)
		gf_AddItemEx2({0, 107, 62,1,1},"B� Th�ch M�t t�ch", szLogTitle, szLogAction)		
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		 gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 75 then
		 gf_AddItemEx2({2, 1, 9977,7,1},"Huy hi�u chi�n c�ng (Huy Ho�ng)", szLogTitle, szLogAction, 7*24*60*60)
		 if nGuanGong >= 0 then
		 	gf_AddItemEx2({0, 109, 992 + nBody -1,1,4},"T�ng Qu�n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 else
		 	gf_AddItemEx2({0, 109, 996 + nBody -1,1,4},"Li�u Qu�n Trang", szLogTitle, szLogAction, 60*24*60*60)
		 end	
		 Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 76 then
		--gf_AddItemEx2({2,1,30178,100}, "�u ��", szLogTitle, szLogAction)
--		local nIndex_fruit = mod(random(1,10000),20)
--		gf_AddItemEx2({2,1,tb_everyday_fruit_BKL[nIndex_fruit][1],200}, "Tr�i c�y", szBKLBLogHeader, szBKLBLogAction)		
		gf_AddItemEx2({2, 2, 7,100,1},"M�nh Thi�n Th�ch", szLogTitle, szLogAction)	
		gf_AddItemEx2({2, 2, 8,100,1},"Thi�n Th�ch", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 77 then
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 100, 30029 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"T�ng TU �� Th�ng chi�n")
			gf_AddItemEx({0, 101, 30029 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"T�ng TU �� Th�ng chi�n")
			gf_AddItemEx({0, 103, 30029 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"T�ng TU �� Th�ng chi�n")
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9988,1,1},"Phong th��ng l�nh_T�ng (�� Th�ng)")
		else
			gf_AddItemEx({0, 100, 30041 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Li�u TU �� Th�ng chi�n")
			gf_AddItemEx({0, 101, 30041 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Li�u TU �� Th�ng chi�n")
			gf_AddItemEx({0, 103, 30041 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,10},"Li�u TU �� Th�ng chi�n")	
			nRet, nItemIdx = gf_AddItemEx({2, 1, 9987,1,1},"Phong th��ng l�nh_Li�u (�� Th�ng)")
		end
		if nRet == 1 then
		 	SetItemExpireTime(nItemIdx,30*24*60*60)
		end
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 78 then
		if nRoute == 23 or nRoute == 29 or nRoute == 30 then
			if gf_Judge_Room_Weight(19,100) ~= 1 then
				Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
				return 0
			end
			TraoBiKiepPhaiMoi()
		else
			gf_AddItemEx2(tb_golden_skillbag[nRoute][2], tb_golden_skillbag[nRoute][1], szLogTitle, "nh�n ���c")
		end
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11], tb_golden_faction_tree[nRoute][10], szLogTitle, "nh�n ���c")
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11], tb_golden_faction_tree[nRoute][10], szLogTitle, "nh�n ���c")			
		--gf_AddItemEx2(tb_golden_faction_tree[nRoute][7], tb_golden_faction_tree[nRoute][6], szLogTitle, "nh�n ���c")
		--gf_AddItemEx2(tb_golden_faction_tree[nRoute][9], tb_golden_faction_tree[nRoute][8], szLogTitle, "nh�n ���c")		
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 79 then
--		local nBody = GetBody()
--		local tWeapons = {0, 3, 8, 0, 0, 1,  0, 2, 10, 0, 0, 5, 0, 2, 9, 0, 6, 4, 0, 7, 11}
--		if nRoute ==8 or nRoute == 9 then
--			nBody = nBody - 2		
--		end
--		AddItem(0, tWeapons[nRoute], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0 , 7);	
--		if nRoute == 2 then
--			AddItem(0, tWeapons[12], nRoute * 100 + 20 + nBody, 1, 1, -1, -1, -1, -1, -1, -1, 0, 7);	
--		end
		gf_AddItemEx2({2,1,30340,800,4}, "M�c R��ng", szLogTitle, "nh�n ���c")
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][11], tb_golden_faction_tree[nRoute][10], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 80 then
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13], tb_golden_faction_tree[nRoute][12], szLogTitle, "nh�n ���c")
		gf_AddItemEx2({2, 0, 554, 15, 4},"Tu ch�n y�u quy�t", szLogTitle, "nh�n ���c", 7*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		--th�m k�ch ho�t kinh m�ch v� gi�
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 81 then
		gf_AddItemEx2({2, 1, 1068, 1, 4},"Thi�n Th�ch Linh Th�ch", szLogTitle, "nh�n ���c", 15*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
		WriteLogEx(szLogTitle,"nh�n ph�n th��ng c�p "..nLevel);
	elseif nLevel == 82 then
		--GoldenGiveJewel_BKL()
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 102, 30044 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"T�ng Th��ng �ng Ti�n Phong k�")
		else
			gf_AddItemEx({0, 102, 30080 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"Li�u Th��ng �ng Ti�n Phong k�")
		end
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)	
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 83 then
		--GoldenGiveJewel_BKL()
		if nGuanGong >= 0 then
			gf_AddItemEx({0, 102, 30048 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"T�ng Th��ng �ng Ti�n Phong ph�")
		else
			gf_AddItemEx({0, 102, 30084 + nBody - 1, 1,4,-1,-1,-1,-1,-1,-1,0,0},"Li�u Th��ng �ng Ti�n Phong ph�")
		end		
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)	
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 84 then
		gf_AddItemEx2(tb_golden_book_all[nRoute][2], tb_golden_book_all[nRoute][1], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 85 then
		gf_AddItemEx2({2,1,30368,88,4}, "C� Linh Th�ch", szLogTitle, "nh�n ���c")
		gf_AddItemEx2({2,1,30369,88,4}, "C� Linh Ng�c", szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 86 then
		--GetTQVD()
--		if nRoute == 23 or nRoute == 29 or nRoute == 30 then
--			gf_AddItemEx2({2,1,30390,999},"nh�n th��ng",szLogTitle,"Nh�n Th�nh C�ng M�nh Thi�n Cang")
--		else	
--			gf_AddItemEx2(tb_golden_dvy_weapon[nRoute][2],tb_golden_dvy_weapon[nRoute][1],szLogTitle,"Nh�n Th�nh C�ng")
--			Msg2Player("B�n �� nh�n ���c "..tb_golden_dvy_weapon[nRoute][1])		
--		end
		gf_AddItemEx2({2, 1, 1068, 1, 4},"Thi�n Th�ch Linh Th�ch", szLogTitle, "nh�n ���c", 15*24*60*60)
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13] , tb_golden_faction_tree[nRoute][12], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 87 then
		--GetTQVD()
		--gf_AddItemEx2({0,107,155,1}, "Ng� H�nh M�t t�ch", szLogTitle, "nh�n ���c")
		gf_AddItemEx2({2,1,30408,3}, "Thi�n Huy�n Kh�c B�n c�p 3", szLogTitle, "nh�n ���c")
		gf_AddItemEx2({2,1,30491,7,1}, "V� Ti�u Y V�ng", szLogTitle, "nh�n ���c", 15*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 88 then
		--GetTQVD()
		--gf_EventGiveRandAward(tb_golden_book_gaojimiji,10000,1, szLogTitle, szLogAction)
--		local G_nNonHN = tbHaoNguyet_Non_BKL[nRoute][nBody][2]
--		local D_nNonHN = tbHaoNguyet_Non_BKL[nRoute][nBody][3]
--		local P_nNonHN = tbHaoNguyet_Non_BKL[nRoute][nBody][4]				
--		gf_AddItemEx2({G_nNonHN, D_nNonHN, P_nNonHN, 1,4,-1,-1,-1,-1,-1,-1,0,9},"N�n H�o Nguy�t", szLogTitle, "nh�n ���c")
--		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13] , tb_golden_faction_tree[nRoute][12], szLogTitle, "nh�n ���c")
		gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch Th�n Th�ch", szLogTitle, "nh�n ���c", 15*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 89 then
		--gf_AddItemEx2({2, 1, 504, 8, 4},"N� Oa Tinh Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		--gf_AddItemEx2(tb_golden_book_gaojimiji_faction[nRoute][2], tb_golden_book_gaojimiji_faction[nRoute][1], szLogTitle, "nh�n ���c")	
		local G_nAoHN = tbHaoNguyet_Ao_BKL[nRoute][nBody][2]
		local D_nAoHN = tbHaoNguyet_Ao_BKL[nRoute][nBody][3]
		local P_nAoHN = tbHaoNguyet_Ao_BKL[nRoute][nBody][4]				
		gf_AddItemEx2({G_nAoHN, D_nAoHN, P_nAoHN, 1,4,-1,-1,-1,-1,-1,-1,0,9},"A� H�o Nguy�t", szLogTitle, "nh�n ���c")	
		gf_AddItemEx2(tb_golden_faction_tree[nRoute][13], tb_golden_faction_tree[nRoute][12], szLogTitle, "nh�n ���c")
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 90 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		gf_AddItemEx2({2,1,1113,1,1}, "��i ��nh H�n", szLogTitle, szLogAction, 30*24*60*60)	
		local G_nQuanHN = tbHaoNguyet_Quan_BKL[nRoute][nBody][2]
		local D_nQuanHN = tbHaoNguyet_Quan_BKL[nRoute][nBody][3]
		local P_nQuanHN = tbHaoNguyet_Quan_BKL[nRoute][nBody][4]				
		gf_AddItemEx2({G_nQuanHN, D_nQuanHN, P_nQuanHN, 1,4,-1,-1,-1,-1,-1,-1,0,9},"Qu�n H�o Nguy�t", szLogTitle, "nh�n ���c")		
		--gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		--AddTrangBiSuMon4()
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 91 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		

		for i = 1, 5 do
			gf_AddItemEx2(tbHaoNguyet_NgocBoi_BKL[i][2],"Nh�n H�o Nguy�t", szLogTitle, "nh�n ���c")					
		end
		gf_AddItemEx2({2,1,30346,3,1}, "M�nh B�ch Kim", szLogTitle, szLogAction)
		--AddTrangBiSuMon4()		
		--gf_AddItemEx2({2,0,1084,3,1}, "Thi�n Qu�i Th�ch", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 92 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		--gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 93 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		--gf_AddItemEx2({0,112,78,1,4}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 94 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		gf_AddItemEx2({2,1,1009,39,1}, "Thi�n Th�ch Tinh Th�ch", szLogTitle, szLogAction)
		gf_AddItemEx2(tbHaoNguyet_VuKhi_BKL[nRoute][2],tbHaoNguyet_VuKhi_BKL[nRoute][1],szLogTitle,szLogAction)		
		--AddweaponFYVYDV94()
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 95 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")	
		Pay(nCashPay)			
		gf_AddItemEx2({0,112,158,1,4}, "L�ng Ba Vi B� to�n t�p", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		AddGlobalNews("Qu� l� C�i Th� Anh H�o, "..GetName().." �� nh�n th�nh c�ng 1 L�ng Ba Vi B� To�n T�p, ph�n th��ng c�p 95 L�i H� L�nh")
  		Msg2SubWorld("Qu� l� C�i Th� Anh H�o, "..GetName().." �� nh�n th�nh c�ng 1 L�ng Ba Vi B� To�n T�p, ph�n th��ng c�p 95 L�i H� L�nh")		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 96 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		Pay(nCashPay)
		Msg2Player("B�n �� b� tr� "..nCash1.." v�ng.")		
		--gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		--gf_AddItemEx2({2,1,1067,1,1}, "��nh H�n Thi�n Th�ch", szLogTitle, szLogAction, 7*24*60*60)
		gf_AddItemEx2({2,1,30345,1,1}, "Chuy�n sinh ��n", szLogTitle, szLogAction, 60*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)	
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 97 then
	ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		Pay(nCashPay)
		local nCash1 = tb_golden_award_BKL[nLevel][8]*10000
		Msg2Player("B�n �� b� tr� "..nCash1.." v�ng.")			
		--gf_AddItemEx2({0,112,78,1,1}, "L�ng Ba Vi B�", szLogTitle, szLogAction)
		--gf_AddItemEx2(tb_VK_SuMon[nRoute][2][nBody], tb_VK_SuMon[nRoute][1], szLogTitle, "nh�n ���c")		
		gf_AddItemEx2({2,1,30345,1,4}, "Chuy�n sinh ��n", szLogTitle, szLogAction)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 98 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		Pay(nCashPay)
		local nCash1 = tb_golden_award_BKL[nLevel][8]*10000
		Msg2Player("B�n �� b� tr� "..nCash1.." v�ng.")				
		gf_AddItemEx2({2,1,1113,1,1}, "��i ��nh H�n", szLogTitle, szLogAction, 30*24*60*60)	
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	elseif nLevel == 99 then
		ModifyExp(0 - tb_golden_award_BKL[nLevel][5])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][5].." �i�m kinh nghi�m.")
		ModifyReputation(- tb_golden_award_BKL[nLevel][6],0)
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][6].." �i�m danh v�ng.")
		SetTask(336, GetTask(336) - tb_golden_award_BKL[nLevel][7])
		Msg2Player("B�n �� b� tr� "..tb_golden_award_BKL[nLevel][7].." �i�m s� m�n.")		
		Pay(nCashPay)
		local nCash1 = tb_golden_award_BKL[nLevel][8]*10000
		Msg2Player("B�n �� b� tr� "..nCash1.." v�ng.")		
		gf_AddItemEx2({2,1,30345,1,1}, "Chuy�n sinh ��n", szLogTitle, szLogAction, 60*24*60*60)
		Say("<color=green>Ch� Ph�ng M�y<color>: Ch�c m�ng c�c h� nh�n ���c ph�n th��ng c�p "..nLevel.."!",0)	
		AddGlobalNews("Qu� l� C�i Th� Anh H�o, "..GetName().." �� nh�n th�nh c�ng 1 Chuy�n Sinh ��n, ph�n th��ng c�p 99 L�i H� L�nh. Qu� tr�nh b�n t�u giang h� b�t ��u")
  		Msg2SubWorld("Qu� l� C�i Th� Anh H�o, "..GetName().." �� nh�n th�nh c�ng 1 Chuy�n Sinh ��n , ph�n th��ng c�p 99 L�i H� L�nh. Qu� tr�nh b�n t�u giang h� b�t ��u")		
		gf_WriteLogEx(szLogTitle, "��i th�nh c�ng", 1, "6/2013 nh�n th��ng theo c�p "..nLevel)		
	else
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: ��ng c�p kh�ng ��ng!");
		return
	end
end


function TraoBiKiepPhaiMoi()
	local tbBiKipConLon = {
		[1] = {[1] = {item={{gdp={2,6,169,1}, name = "B� ki�p L�i T�"}}}, nRate = 7.15},
		[2] = {[1] = {item={{gdp={2,6,170,1}, name = "B� ki�p Phong T�"}}}, nRate = 7.15},
		[3] = {[1] = {item={{gdp={2,6,171,1}, name = "B� ki�p Thi�n l�i ph�"}}}, nRate = 7.15},
		[4] = {[1] = {item={{gdp={2,6,172,1}, name = "B� ki�p B�ng Phong Quy�t"}}}, nRate = 7.15},
		[5] = {[1] = {item={{gdp={2,6,173,1}, name = "B� ki�p Ng� Phong Quy�t"}}}, nRate = 7.14},
		[6] = {[1] = {item={{gdp={2,6,174,1}, name = "B� Ki�p Cu�ng L�i Ph�"}}}, nRate = 7.14},
		[7] = {[1] = {item={{gdp={2,6,175,1}, name = "B� Ki�p D��ng Sa Quy�t"}}}, nRate = 7.14},
		[8] = {[1] = {item={{gdp={2,6,176,1}, name = "B� Ki�p Oanh L�i Ph�"}}}, nRate = 7.14},
		[9] = {[1] = {item={{gdp={2,6,177,1}, name = "B� Ki�p Cang phong quy�t"}}}, nRate = 7.14},
		[10] = {[1] = {item={{gdp={2,6,178,1}, name = "B� Ki�p B�o L�i Ph�"}}}, nRate = 7.14},
		[11] = {[1] = {item={{gdp={2,6,179,1}, name = "B� Ki�p Ti�u phong t�n quy�t"}}}, nRate = 7.14},
		[12] = {[1] = {item={{gdp={2,6,180,1}, name = "B� Ki�p Ng� L�i ch�nh ph�p ph�"}}}, nRate = 7.14},
		[13] = {[1] = {item={{gdp={2,6,181,1}, name = "B� Ki�p V�n L�i To�i Tinh ph�"}}}, nRate = 7.14},
		[14] = {[1] = {item={{gdp={2,6,182,1}, name = "B� Ki�p Huy�n Phong tri�n quy�t"}}}, nRate = 7.14},
	}
	local tbBiKipThuyYen = {
		[1] = {[1] = {item={{gdp={2,6,219,1}, name = "Y�u quy�t Kh�i V�"}}}, nRate = 4.55},
		[2] = {[1] = {item={{gdp={2,6,220,1}, name = "Y�u quy�t Linh Mi�u V�n"}}}, nRate = 4.55},
		[3] = {[1] = {item={{gdp={2,6,221,1}, name = "Y�u quy�t V� V�n T�m Ph�p"}}}, nRate = 4.55},
		[4] = {[1] = {item={{gdp={2,6,222,1}, name = "Y�u quy�t M� Hoa"}}}, nRate = 4.55},
		[5] = {[1] = {item={{gdp={2,6,223,1}, name = "Y�u quy�t �o�n V�n"}}}, nRate = 4.55},
		[6] = {[1] = {item={{gdp={2,6,224,1}, name = "Y�u quy�t Thu Nguy�t V�"}}}, nRate = 4.55},
		[7] = {[1] = {item={{gdp={2,6,225,1}, name = "Y�u quy�t Thi�n L�i T�m Kinh"}}}, nRate = 4.54},
		[8] = {[1] = {item={{gdp={2,6,226,1}, name = "Y�u quy�t �i�p Uy�n"}}}, nRate = 4.54},
		[9] = {[1] = {item={{gdp={2,6,227,1}, name = "Y�u quy�t Thi�n H�a Di�m D��ng"}}}, nRate = 4.54},
		[10] = {[1] = {item={{gdp={2,6,228,1}, name = "��p V�n X�o B� Quy�t Y�u"}}}, nRate = 4.54},
		[11] = {[1] = {item={{gdp={2,6,229,1}, name = "Y�u quy�t M�ng X�"}}}, nRate = 4.54},
		[12] = {[1] = {item={{gdp={2,6,230,1}, name = "Y�u quy�t L�c Hoa Quy�t"}}}, nRate = 4.55},
		[13] = {[1] = {item={{gdp={2,6,231,1}, name = "Y�u quy�t ��o Hoa Ch��ng"}}}, nRate = 4.55},
		[14] = {[1] = {item={{gdp={2,6,232,1}, name = "Y�u quy�t B�ch Hoa T�m Kinh"}}}, nRate = 4.55},
		[15] = {[1] = {item={{gdp={2,6,233,1}, name = "Y�u quy�t T�a T�m Quy�t"}}}, nRate = 4.55},
		[16] = {[1] = {item={{gdp={2,6,234,1}, name = "Y�u quy�t Ho�n Th�n Thu�t"}}}, nRate = 4.55},
		[17] = {[1] = {item={{gdp={2,6,235,1}, name = "Y�u quy�t Linh ��ng Quy�t"}}}, nRate = 4.55},
		[18] = {[1] = {item={{gdp={2,6,236,1}, name = "Y�u quy�t M� X�o Quy�t"}}}, nRate = 4.54},
		[19] = {[1] = {item={{gdp={2,6,237,1}, name = "Y�u quy�t Ti�n L� H��ng"}}}, nRate = 4.54},
		[20] = {[1] = {item={{gdp={2,6,238,1}, name = "Y�u quy�t B�ch �i�p Ngh�nh H��ng Quy�t"}}}, nRate = 4.54},
		[21] = {[1] = {item={{gdp={2,6,239,1}, name = "Y�u quy�t �i�p Luy�n Hoa"}}}, nRate = 4.54},
		[22] = {[1] = {item={{gdp={2,6,240,1}, name = "Y�u quy�t Ng�c Long Xuy�n Nguy�t"}}}, nRate = 4.54},
	}
	
	for i=1,15 do
		if GetPlayerRoute() == 23 then
			LIB_Award:AwardByRate(tbBiKipConLon)
		elseif GetPlayerRoute() == 29 or GetPlayerRoute() == 30 then
			LIB_Award:AwardByRate(tbBiKipThuyYen)
		end
	end
end
function dlgover()
end	
