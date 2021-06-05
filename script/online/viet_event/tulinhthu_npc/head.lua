Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online_activites\\2011_12\\wupanguo\\silin_dogz.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\award\\feature_award.lua")

function main()
	local szName = ""
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	for i = 1, getn(TB_NATION_SERVERLIST) do
		if nNation == TB_NATION_SERVERLIST[i][1] then
			szName = TB_NATION_SERVERLIST[i][2]
			break
		end
	end
	
	local szNpcName = "<color=green>"..szName.." :<color>"
	local tSay = {}
	local szHeader = szNpcName.."Anh h�ng t�m ta c� vi�c g� kh�ng?"
	
	local nDate = tonumber(date("%y%m%d"));		
	-- Ho�t ��ng t�o m�m ng� qu� n�m 2012
	if nDate >= 120113 and nDate <= 120201 then
		tinsert(tSay,"Nh� Th�n Th� gh�p gi�p ta M�m Ng� Qu�/blag_blessing")		
	end
	
	local nSelfIndex = GetTargetNpc()
	local nGroup = GetUnitCurStates(nSelfIndex, 6)
--	if nGroup ~= 1 then
--		tinsert(tSay, "B�n so�i mu�n k�ch ho�t khi�u chi�n th�n d�n Long T�/do_something")
--	end
--	if nGroup ~= 2 then
--		tinsert(tSay, "B�n so�i mu�n k�ch ho�t khi�u chi�n th�n d�n H� T�/do_something")
--	end
--	if nGroup ~= 3 then
--		tinsert(tSay, "B�n so�i mu�n k�ch ho�t khi�u chi�n th�n d�n �ng T�/do_something")
--	end
--	if nGroup ~= 4 then
--		tinsert(tSay, "B�n so�i mu�n k�ch ho�t khi�u chi�n th�n d�n Ph�ng T�/do_something")
--	end
	
	-- Nhi�m v� Chuy�n Sinh 4
	if GetTask(TRANSLIFE_MISSION_ID) == 28 and gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) == 3 then
		tinsert(tSay, "Ta mu�n nh�n th� th�ch �� luy�n th�nh H�n Nguy�n C�ng th�nh th� 8/trans_talk_28")
	end
	
	if GetTask(TRANSLIFE_MISSION_ID) == 29 and gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) == 3 then
		tinsert(tSay, "Ta �� ho�n th�nh nhi�m v� �� luy�n H�n Nguy�n C�ng th�nh th� 8/trans_talk_29")
	end
	tinsert(tSay, "Ta mu�n nh�n ph�n th��ng C�ng T� (Ti�u hao 5 N� Oa B�o H�p v� 1 Ng�i sao may m�n)/#confirm_get_award(1)")	
	tinsert(tSay, "Ta mu�n nh�n ph�n th��ng Tr� An (Ti�u hao 1 Qu�n C�ng Ch��ng, 1 Qu�n C�ng ��i, 1 Qu�n C�ng Huy Ho�ng)/#confirm_get_award(2)")	
	tinsert(tSay, "Ta mu�n nh�n ph�n th��ng Th�y L�i (Ti�u hao 1 B�t Nh� nh�, 1 B�t Nh� l�n, 1 c�y T� Linh)/#confirm_get_award(3)")	
	tinsert(tSay, "Ta mu�n nh�n ph�n th��ng Luy�n ��n (Ti�u hao 1 B�i Nguy�n ��n, 1 T� Linh Quy Nguy�n ��n, 6 ��i Ng�n Phi�u)/#confirm_get_award(4)")	
	tinsert(tSay, "Hi�n t�i ch�a mu�n l�m g� c�/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function do_something()
	Talk(1,"","�i�u ki�n ch�a �� n�n kh�ng th� k�ch ho�t khi�u chi�n!")
	return
end

function confirm_get_award(nType)
	local nLimit = 3
	local tbAward = { --c�t 1 exp, c�t 2 ch�n kh�, ....
			[1] = {2000000, 10, 1, 10, 10, 10	},
			[2] = {18000000, 100, 600},
			[3] = {2000000, 10, 10},
			[4] = {1000000, 550, 55, 5},
		}
	local tbCheck = {
			[1] = {5, 1},
			[2] = {1, 1, 1},
			[3] = {1, 1, 1},
			[4] = {1, 1, 6},
		}
	local nDate = tonumber(date("%y%m%d"))
	local nCurdate = GetTask(TSK_RESET_DATE)
		
	if nDate >= 130405 and nDate <= 130428 then
		nLimit = 10
	end
	-- New server Tuy Ho
--	if GetGlbValue(1023) == 79 then -- and nDate <= 130210
--		nLimit = 1
--	end
	
	if nDate ~= nCurdate then
		SetTask(TSK_RESET_DATE , nDate)
		SetTask(TSK_BTH_EXCHANGE , 0)
	end	
	if (gf_GetTaskByte(TSK_BTH_EXCHANGE, nType) >= nLimit) then
		Talk(1,"","B�n �� nh�n ph�n th��ng n�y " .. nLimit .. " l�n trong ng�y, mai h�y nh�n ti�p nh�.")
		return 0
	end
	-------
	if nType == 1 then
		if GetItemCount(2,1,30154) < tbCheck[nType][1] or GetItemCount(2,1,30191) < tbCheck[nType][2] then
			Talk(1,"","��i hi�p kh�ng mang �� nguy�n li�u �� C�ng T� !!!")			
			return
  	   end
	end
	if nType == 2 then
		if GetItemCount(2,1,9999) < tbCheck[nType][1] or GetItemCount(2,1,9998) < tbCheck[nType][2] or GetItemCount(2,1,9977) < tbCheck[nType][3] then
			Talk(1,"","��i hi�p kh�ng mang �� nguy�n li�u �� Tr� An !!!")			
			return
  	   end
	end
	if nType == 3 then
		if GetItemCount(2,0,504) < tbCheck[nType][1] or GetItemCount(2,0,398) < tbCheck[nType][2] or GetItemCount(2,1,30269) < tbCheck[nType][3] then
			Talk(1,"","��i hi�p kh�ng mang �� nguy�n li�u �� Th�y L�i !!!")			
			return
  	   end
	end	
	if nType == 4 then
		if GetItemCount(2,1,30351) < tbCheck[nType][1] or GetItemCount(2,1,30352) < tbCheck[nType][2] or GetItemCount(2,1,199) < tbCheck[nType][3] then
			Talk(1,"","��i hi�p kh�ng mang �� nguy�n li�u �� Luy�n ��n !!!")			
			return
  	   end
	end	
	------
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end
	if GetLevel() < 79 then
		Talk(1, "", "��i hi�p ph�i c� ��ng c�p 79 tr� l�n m�i tham gia t�nh n�ng n�y ���c !!!")
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","��i hi�p ch�a gia nh�p m�n ph�i n�n kh�ng th� tham gia t�nh n�ng n�y ���c !!!!");
		return
	end
--	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
--	if nType == 1 and nChoose == 2 then
--		if nCurPetLevel < 1 then
--			Talk(1,"","��i hi�p ch�a c� B�n ��ng H�nh, kh�ng th� nh�n ph�n th��ng n�y !!!")			
--			return
--  	   end
--	end
--	if nType == 1 and nChoose == 3 then
--		if nCurPetLevel < 2 then
--			Talk(1,"","B�n ��ng H�nh ��ng c�p 2 tr� l�n m�i c� th� nh�n ph�n th��ng n�y !!!")
--			return
--  	   end
--	end
--	if GetExp() >= 2000000000 - tbAward[nType][1] then
--		Msg2Player("�i�m kinh nghi�m c�a ��i hi�p sau khi nh�n th��ng c� qu� nhi�u. H�y s� d�ng b�t r�i nh�n th��ng l�i !!!")
--		Talk(1,"","�i�m kinh nghi�m c�a ��i hi�p sau khi nh�n th��ng c� qu� nhi�u. H�y s� d�ng b�t r�i nh�n th��ng l�i !!!");							
--		return
--	end

--	if (nType == 1 and nChoose == 4) or (nType == 2 and nChoose == 3) or (nType == 3 and nChoose == 3) then
--		if MeridianGetLevel() <= 0 then
--			Talk ( 1, "", "��i hi�p ch�a k�ch ho�t xong kinh m�ch n�n kh�ng th� nh�n ph�n th��ng n�y !!!" )
--			return
--		end
--	end	
	----------ph�t th��ng
	--nhi�m v� l�m gi�u
	if CFG_NhiemVuLamGiau == 1 then
	     if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 5) == 0 then
	     		gf_SetTaskBit(TSK_LAMGIAU, 5, 1, 0)
	     		TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Ho�n th�nh 01 l�n nhi�m v� Th�y L�i.")
	     end
	end
	-----------------------Chu�i nhi�m v� ��ng H�nh
	if CFG_NhiemVuDongHanh == 1 then
		if nType == 3 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 16 then
				DongHanh_SetStatus()
			end			
		end
	end
	----------------------- Chu�i nhi�m v� Chuy�n Sinh ��n, l�u s� th� 4 v� 5 ��u b�n ph�i
	local nCSD_TA = floor(GetTask(TSK_CSD_COUNT_B) / 1000)
	local nNumTA = mod(GetTask(TSK_CSD_COUNT_B),1000)
	local nCSD_TL = floor(GetTask(TSK_CSD_COUNT_B) / 100000)
	local nNumTL = mod(GetTask(TSK_CSD_COUNT_B),100000)
	if nType == 2 then
		if mod(nCSD_TA, 100) < 33 and GetTask(TSK_CSD) == 1 then
			nCSD_TA = (nCSD_TA + 1) * 1000 + nNumTA
			SetTask(TSK_CSD_COUNT_B, nCSD_TA)
		end
	elseif nType == 3 then
		if mod(nCSD_TL, 100) < 33 and GetTask(TSK_CSD) == 1 then
			nCSD_TL = (nCSD_TL + 1) * 100000 + nNumTL
			SetTask(TSK_CSD_COUNT_B, nCSD_TL)
		end
	end
	----------------------- Chu�i nhi�m v� M�nh Thi�n Th�ch, l�u s� th� 45 v� 67 ��u b�n ph�i
	local nMTT_CT = floor(GetTask(TSK_MTT_COUNT) / 1000)
	local nNumCT_MTT = mod(GetTask(TSK_MTT_COUNT),1000)
	local nMTT_TL = floor(GetTask(TSK_MTT_COUNT) / 100000)
	local nNumTL_MTT = mod(GetTask(TSK_MTT_COUNT),100000)
	local nMTT_BTT_NV =  mod(floor(GetTask(TSK_MTT_COUNT) / 10000000),10)
	--Msg2Player("V�o 1")
	if nType == 1 then
	--	Msg2Player("V�o 2")
		if mod(nMTT_CT, 100) < 6 and nMTT_BTT_NV == 1 then
			nMTT_CT = (nMTT_CT + 1) * 1000 + nNumCT_MTT
			SetTask(TSK_MTT_COUNT, nMTT_CT)
		end
	elseif nType == 3 then
	--	Msg2Player("V�o 3")
		if mod(nMTT_TL, 100) < 6 and nMTT_BTT_NV == 1 then
			nMTT_TL = (nMTT_TL + 1) * 100000 + nNumTL_MTT
			SetTask(TSK_MTT_COUNT, nMTT_TL)
		end
	end
	----------------------Chu�i nhi�m v� Chuy�n sinh 6
	local nCS6_CT = mod(GetTask(TSK_CS6_COUNTA),100)
	local nCS6_CT_Num = floor(GetTask(TSK_CS6_COUNTA)/100)
	local nCS6_TA = mod(nCS6_CT_Num,100)
	--local nCS6_TA_Num = floor(GetTask(TSK_CS6_COUNTA)/10000)
	local cCS6_TL = mod(GetTask(TSK_CS6_COUNTB),100)
	local nCS6_TL_Num = floor(GetTask(TSK_CS6_COUNTB)/100)
	local nCS6_LD = mod(nCS6_TL_Num,100)
	--local nCS6_LD_Num = floor(GetTask(TSK_CS6_COUNTB)/10000)
	--if GetTaskTrans() == 38 then
	if GetTask(TSK_CS6_TULINH) < 2 then
		if nType == 1 then
			if nCS6_CT < 30 then
				SetTask(TSK_CS6_COUNTA, GetTask(TSK_CS6_COUNTA)+1)
			end
		elseif nType == 2 then
			if nCS6_TA < 30 then
				nCS6_CT_Num = (nCS6_CT_Num + 1) * 100 + nCS6_CT
				SetTask(TSK_CS6_COUNTA, nCS6_CT_Num)
			end
		elseif nType == 3 then
			if cCS6_TL < 30 then
				SetTask(TSK_CS6_COUNTB, GetTask(TSK_CS6_COUNTB)+1)
			end
		elseif nType == 4 then
			if nCS6_LD < 30 then
				nCS6_TL_Num = (nCS6_TL_Num + 1) * 100 + cCS6_TL
				SetTask(TSK_CS6_COUNTB, nCS6_TL_Num)
			end
		end
	end
	------------------------------chu�i nhi�m v� Ph�c Sinh PET
	local nActive_CT_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100)
	local nActive_TA_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10000)
	local nActive_TL_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/1000000)
	local nActive_LD_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/100000000)
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if nType == 1 then
			if mod(nActive_CT_PET_PS,100) < 30 then
				nActive_CT_PET_PS = (nActive_CT_PET_PS + 1) * 100 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 100)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_CT_PET_PS)
			end
		elseif nType == 2 then
			if mod(nActive_TA_PET_PS,100) < 30 then
				nActive_TA_PET_PS = (nActive_TA_PET_PS + 1) *10000 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 10000)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_TA_PET_PS)
			end		
		elseif nType == 3 then
			if mod(nActive_TL_PET_PS,100) < 30 then
				nActive_TL_PET_PS = (nActive_TL_PET_PS + 1) * 1000000 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 1000000)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_TL_PET_PS)
			end		
		elseif nType == 4 then
			if mod(nActive_LD_PET_PS,100) < 3 then
				nActive_LD_PET_PS = (nActive_LD_PET_PS + 1) * 100000000 + mod(GetTask(TSK_PET_PS_GIAIDOAN_B), 100000000)
				SetTask(TSK_PET_PS_GIAIDOAN_B, nActive_LD_PET_PS)
			end		
		end
		gf_WriteLogEx("PHUC SINH PET", "kick ho�t th�nh c�ng", 1, "K�ch ho�t  T� Linh lo�i"..nType)
	end
	----------------	
	gf_SetTaskByte(TSK_BTH_EXCHANGE, nType, gf_GetTaskByte(TSK_BTH_EXCHANGE,nType)+1)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nType == 1 then
		DelItem(2,1,30154,tbCheck[nType][1]) 
		DelItem(2,1,30191,tbCheck[nType][2]) 
		if nCurPetLevel >= 1 then
			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (10 * 100))
			Msg2Player("B�n nh�n ���c 10 �i�m N�ng C�p B�n ��ng H�nh")	
		end
		--gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "�i�m n�ng c�p PET")
		if nCurPetLevel >= 2 then
			Pet_AddGP(1)
			Msg2Player("B�n nh�n ���c 1 �i�m Linh L�c B�n ��ng H�nh")					
		end
		--gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "�i�m linh l�c PET")
		SetTask(336,GetTask(336) + 10)
		--gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "�i�m S� m�n")
		Msg2Player("B�n nh�n ���c 10 �i�m S� m�n")		
		ModifyReputation(10,0)
		--gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "�i�m Danh v�ng")
		--Msg2Player("B�n nh�n ���c 10 �i�m Danh v�ng")
		gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "C�ng T�")		
	end
	if nType == 2 then
		DelItem(2,1,9999,tbCheck[nType][1]) 
		DelItem(2,1,9998,tbCheck[nType][2]) 
		DelItem(2,1,9977,tbCheck[nType][3]) 
		--Nhan diem linh luc ban dong hanh
		if nCurPetLevel >= 2 then
			Pet_AddGP(10)
			Msg2Player("B�n nh�n ���c 10 �i�m Linh L�c B�n ��ng H�nh")					
		end
		--gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "�i�m linh l�c PET")
		--Nhan diem cong trang
		local nCongTrang = tbAward[nType][3]
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + nCongTrang)
		else
			SetTask(701, GetTask(701) - nCongTrang)
		end
		--gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "�i�m C�ng tr�ng")
		Msg2Player("B�n nh�n ���c " ..nCongTrang.." �i�m C�ng tr�ng")		
		gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "Tr� An")				
	end
	if nType == 3 then
		DelItem(2,0,504,tbCheck[nType][1]) 
		DelItem(2,0,398,tbCheck[nType][2]) 
		DelItem(2,1,30269,tbCheck[nType][3]) 
		local nAwardRand = mod(random(1,1000),20)
		gf_AddItemEx2({2,1,(30164+nAwardRand),10}, "Item Tr�i c�y", "BINH THIEN HA", "nh�n th�nh c�ng")    
		gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "Th�y L�i")					
	end		
	if nType == 4 then
		DelItem(2,1,30351,tbCheck[nType][1]) 
		DelItem(2,1,30352,tbCheck[nType][2]) 
		DelItem(2,1,199,tbCheck[nType][3]) 
		--AwardGenuineQi(tbAward[nType][1])
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + 55)
		else
			SetTask(701, GetTask(701) - 55)
		end
		Msg2Player("B�n nh�n ���c 55 �i�m C�ng tr�ng")	
		Earn(55000)
		gf_WriteLogEx("BINH THIEN HA", "nh�n th�nh c�ng", 1, "Luy�n ��n")		
	end
	AwardGenuineQi(tbAward[nType][2])
	ModifyExp(tbAward[nType][1])	
	Msg2Player("B�n nh�n ���c " ..tbAward[nType][1].." �i�m kinh nghi�m")
	--- �i�m V�n May
--	local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--	local nExpVM = (nPointVM - 100)/100*tbAward[nType][1]
--	ModifyExp(nExpVM)
--	if nExpVM > 0 then
--		Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--	else
--		Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--	end
-------------------------------------	
	TriQuocBinhThienHa_NhanThuong(nType)	
	
end

function do_nothing()

end