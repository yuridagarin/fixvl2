Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\sinhtuvonga\\sinhtuvonga_core.lua");
Include("\\script\\vng\\weapon_upgrade\\viemde2thienchiviemde.lua");
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online\\viet_event\\ip_bonus\\ip_manager_npc.lua");
----script KS
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")
----


--Award cho  B�t nh� nh�
function ThuHoachBatNhaNho()
	--=============== Chu�i nhi�m v� Ph�c Sinh 2 ===================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 9 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(2)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 or ChiTonNew_GetStep() == 2 or ChiTonNew_GetStep() == 4 or ChiTonNew_GetStep() == 10 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--=======	
end

function KichHoatBatNhaNho()
	nhiemvuVBonus(2) --nhi�m v� VBonus 07/2014
	VBonus_BatNhaNho()
	ModifyReputation(1,0)
	SetTask(336,GetTask(336)+1)
	Msg2Player("B�n nh�n ���c 1 �i�m S� m�n !")
	local nExp = 2100000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m!")
	local nExpChanKhi = 25
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� B�t nh� nh�")			
	gf_WriteLogEx("KICH HOAT BAT NHA NHO 13/5/2013", "kick ho�t th�nh c�ng", 1, "K�ch ho�t  B�t nh� nh�")
	-- chu�i nhi�m v� Ph�c Sinh PET
	local nActive_BNN_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000) --l�y s� l�n k�ch ho�t b�t nh� nh� c�a Pet Ph�c Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_BNN_PET_PS,1000) < 160 then
			nActive_BNN_PET_PS = (nActive_BNN_PET_PS + 1) * 10000 -- c�ng 1 khi k�ch ho�t th�nh c�ng
			nActive_BNN_PET_PS = nActive_BNN_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000) --c�ng v�o nguy�n task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_BNN_PET_PS) --set l�i to�n b� task
			gf_WriteLogEx("PHUC SINH PET", "kick ho�t th�nh c�ng", 1, "K�ch ho�t  B�t nh� nh�")
		end
	end
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 29 or CTVL_GetDailyMission() == 30 or CTVL_GetDailyMission() == 31 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 
	ChiTonNew_ExpBonus(300000)
end

--Award cho  H�t Gi�ng
function ThuHoachHatGiong()
	vaf_award_api("tPlantSeedTree") --2XU
	nhiemvuVBonus(1) --nhi�m v� VBonus 07/2014
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130524 and nDate <=130613 then		
			gf_AddItemEx2({2,1,30512 , 100}, "Nguy�n li�u Event ", "MAT LANH NGAY HE THANG 5", "Thu ho�ch h�t gi�ng")
	end
	--=============== Chu�i nhi�m v� Ph�c Sinh 2 ====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 7 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(3)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 or ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 3 or ChiTonNew_GetStep() == 15 or ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--==========
end

function KichHoatHatGiong()
	VBonus_HatGiong()
	ModifyReputation(1,0)
	SetTask(336,GetTask(336)+1)
	Msg2Player("B�n nh�n ���c 1 �i�m S� m�n !")
	local nExp = 1200000
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m!")
	local nExpChanKhi = 25
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� h�t gi�ng")	
	gf_WriteLogEx("KICH HOAT HAT GIONG 13/5/2013", "kick ho�t th�nh c�ng", 1, "K�ch ho�t H�t gi�ng")
	 -----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 26 or CTVL_GetDailyMission() == 27 or CTVL_GetDailyMission() == 28 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 
	ChiTonNew_ExpBonus(300000)
	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(5)
	set_value_nv_nangcap(10)	
end

--Award cho  C�y T� Linh
function ThuHoachCayTuLinh()
	--=============== Chu�i nhi�m v� Ph�c Sinh 2 ==========================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 13 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(1)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30661 ,200}, "Nguy�n li�u Event", "Hoat dong thang 06 nam 2014", "ho�n th�nh tr�ng c�y T� Linh")
		Msg2Player("B�n nh�n ���c 200 Nguy�n Li�u Event")
	end		
	--=============== Chi Ton Vuong Lenh New=========================
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 2 or ChiTonNew_GetStep() == 3 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 9 or ChiTonNew_GetStep() == 13 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	--===========
end

function KichHoatCayTuLinh()
	nhiemvuVBonus(4) --nhi�m v� VBonus 07/2014
	VBonus_CayTuLinh()
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 10)
	else
		SetTask(701,GetTask(701) - 10)
	end
	Msg2Player("B�n nh�n ���c 10 �i�m c�ng tr�ng")
	SetTask(707, GetTask(707)+ 10)
	Msg2Player("B�n nh�n ���c 10 �i�m t�ch l�y")
    	local nBonusExp = 3600000
	ModifyExp(nBonusExp)
	Msg2Player("B�n nh�n ���c "..nBonusExp.." �i�m kinh nghi�m!")
	ModifyReputation(2,0)
	SetTask(336,GetTask(336)+2)
	Msg2Player("B�n nh�n ���c 2 �i�m S� m�n !")
	local nExpChanKhi = 32
	AwardGenuineQi(nExpChanKhi)
	gf_WriteLogEx("DA THONG KINH MACH", "��i th�nh c�ng", nExpChanKhi, "�i�m ch�n kh� c�y T� Linh")		
	gf_WriteLogEx("KICH HOAT CAY TU LINH 13/5/2013", "kick ho�t th�nh c�ng", 1, "K�ch ho�t C�y T� Linh")	
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 130919 and nDate <=131013 then		
			gf_AddItemEx2({2,1,30567 , 60}, "Nguy�n li�u Event ", "Hoat dong thang 07 nam 2013", "Kich hoat c�y T� Linh")
	end	
	-- chu�i nhi�m v� Ph�c Sinh PET
	local nActive_CTL_PET_PS = floor(GetTask(TSK_PET_PS_GIAIDOAN_A)/10000000) --l�y s� l�n k�ch ho�t b�t nh� nh� c�a Pet Ph�c Sinh
	if mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10) == 1 then
		if mod(nActive_CTL_PET_PS,1000) < 160 then
			nActive_CTL_PET_PS = (nActive_CTL_PET_PS + 1) * 10000000 -- c�ng 1 khi k�ch ho�t th�nh c�ng
			nActive_CTL_PET_PS = nActive_CTL_PET_PS + mod(GetTask(TSK_PET_PS_GIAIDOAN_A),10000000) --c�ng v�o nguy�n task
			SetTask(TSK_PET_PS_GIAIDOAN_A, nActive_CTL_PET_PS) --set l�i to�n b� task
			gf_WriteLogEx("PHUC SINH PET", "kick ho�t th�nh c�ng", 1, "K�ch ho�t  c�y T� Linh")
		end
	end
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 32 or CTVL_GetDailyMission() == 33 or CTVL_GetDailyMission() == 34 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	---------	 	
	ChiTonNew_ExpBonus(300000)
	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(4)
	set_value_nv_nangcap(9)	
end

--Award cho N� Oa B�o H�p
function Use_Award_NuOa() 
	nhiemvuVBonus(10) --nhi�m v� VBonus 07/2014
	VBonus_NuOa()
  	local nExp = 1000000	--�i�m v�n may khai b�o b�n file g�c
  	ModifyExp(nExp)
    	local nExpChanKhi = 2
	AwardGenuineQi(nExpChanKhi)	
	local nQuanCong = 2
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + nQuanCong)
	else
		SetTask(701,GetTask(701) - nQuanCong)
	end	
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 40 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 35 or CTVL_GetDailyMission() == 36 or CTVL_GetDailyMission() == 37 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	if ChiTonNew_CheckNewServer() == 1 then
		--------========== CTVL new server ==========
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 13 or ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 5 or ChiTonNew_GetStep() == 16 or ChiTonNew_GetStep() == 20 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	---------
	ChiTonNew_ExpBonus(100000)
end

function Use_Award_NuOa_100()
	local tbAward = {item ={
			{gdp={2, 0, 553, 3}, name="��i Nh�n S�m", nExpired = 7*24*60*60},
			{gdp={2, 0, 552, 3}, name="Ti�u Nh�n S�m", nExpired = 7*24*60*60},
			{gdp={2, 0, 554, 3}, name="Tu Ch�n Y�u Quy�t", nExpired = 7*24*60*60},},
		nGold = 300000,
		nPetExp = 20,
		nPetLinhluc = 10,
	}
	LIB_Award.szLogTitle = VET_201003_01_STR_LOG_TITLE
	LIB_Award.szLogAction = "Nh�n th�nh c�ng s� d�ng 100"
	LIB_Award:Award(tbAward)
--	Earn(300000)
--	gf_AddItemEx2({2, 0, 553, 3}, "��i Nh�n S�m", VET_201003_01_STR_LOG_TITLE, "Nh�n th�nh c�ng s� d�ng 100", 7*24*60*60)	
--	gf_AddItemEx2({2, 0, 552, 3}, "Ti�u Nh�n S�m", VET_201003_01_STR_LOG_TITLE, "Nh�n th�nh c�ng s� d�ng 100", 7*24*60*60)		
--	gf_AddItemEx2({2, 0, 554, 3}, "Tu Ch�n Y�u Quy�t", VET_201003_01_STR_LOG_TITLE, "Nh�n th�nh c�ng s� d�ng 100", 7*24*60*60)		
end

--Award cho Ng�i Sao May M�n
function Use_Award_NgoiSao() 
	nhiemvuVBonus(9) --nhi�m v� VBonus 07/2014
	VBonus_LuckyStar()
	local tbAward = {
		nChankhi = 20,
		nQuancong = 50,
		nPetLinhluc = 3
	}
	LIB_Award:Award(tbAward)
--    	local nExpChanKhi = 20
--	AwardGenuineQi(nExpChanKhi)
--	local nQuanCong = 50
--	if GetTask(701) >= 0 then
--		SetTask(701,GetTask(701) + nQuanCong)
--	else
--		SetTask(701,GetTask(701) - nQuanCong)
--	end
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 41 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end	
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
 	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 38 or CTVL_GetDailyMission() == 39 or CTVL_GetDailyMission() == 40 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--==================== Chi Ton Vuong Lenh NewServer ============
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 5 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 9 then
			ChiTonNew_SetMissionPart(2)
--		elseif ChiTonNew_GetStep() == 13 then
--			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 14 or ChiTonNew_GetStep() == 19 then
			ChiTonNew_SetMissionPart(1)
		end
	end
	---------	 
	ChiTonNew_ExpBonus(300000)
end

function Use_Award_NgoiSao_16()
	Earn(60000)
	SetTask(2501, GetTask(2501) + 60) --b�ch c�u ho�n
	EatSanqin(1, 60) --tam thanh ho�n
	EatLiushen(1, 60) --l�c th�n ho�n
	SetTask(3105, GetTask(3105) + 60, 8)	--t� linh ho�n
end


-- Th��ng t�ng �i Th�i H�
function ThaiHu_ThuongVuotAi()
	local tbAward1 = {
		[1] = {nCheckExp = 0, nExp = 2000000, nChankhi = 10},
		[2] = {nCheckExp = 0, nExp = 3000000, nChankhi = 20},
		[3] = {nCheckExp = 0, nExp = 3500000, nChankhi = 20},
		[4] = {nCheckExp = 0, nExp = 4000000, nChankhi = 20},
		[5] = {nCheckExp = 0, nExp = 4500000, nChankhi = 20},
		[6] = {nCheckExp = 0, nExp = 5000000, nChankhi = 30},
		[7] = {nDanhvong = 60, nSumon = 60, nChankhi = 40},
		[8] = {fn="RandThaiHuRing(8)", nExp = 7000000, nChankhi = 40},
	}
	local tbAward2 = {
		[1] = {nCheckExp = 0, nExp = 3000000, nChankhi = 15},
		[2] = {nCheckExp = 0, nExp = 4500000, nChankhi = 15},
		[3] = {nCheckExp = 0, nExp = 5250000, nChankhi = 25},
		[4] = {nCheckExp = 0, nExp = 6000000, nChankhi = 30},
		[5] = {nCheckExp = 0, nExp = 6750000, nChankhi = 30},
		[6] = {nCheckExp = 0, nExp = 7500000, nChankhi = 40},
		[7] = {nDanhvong = 90, nSumon = 90, nChankhi = 45},
		[8] = {fn="RandThaiHuRing(8)", nExp = 10500000,nChankhi = 50},
	}
	local nCountType = GetTaskTemp(104) -- S� l�n v��t �i
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nh�n"
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local tbAward = tbAward1
		if mod(GetTask(TSK_THAIHU_DAY) ,100) > 1 then
			_vjw_SetTaixu()
			if VietCheckEvent() == 1 then
				gf_AddItemEx2({2,1,30742 ,10}, "Nguy�n li�u Th�i H�", "Hoat dong thang 11 nam 2014", "ho�n th�nh nhi�m v� Th�i H� l�n 2 tr� l�n")
				Msg2Player("B�n nh�n ���c 10 Nguy�n Li�u Event")
			end		
			--===== nhi�m v� Th�ng Ti�n Ph�c Sinh
			if TTPS_GetStatus() == 1 then
				VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,6,6)
			end
			----------------------------------
			tbAward = tbAward2
		end
		if tbAward[nCountType] ~= nil then
			LIB_Award:Award(tbAward[nCountType])
			--- �i�m V�n May
--			local nPointVM = gf_GetTaskByte(TSK_LUCKY_DAOHUU_NEW_THANG4, BYTE_POINT_LUCKY)	
--			if tbAward[nCountType]["nExp"] ~= nil then
--				local nExpVM = (nPointVM - 100)/100*tbAward[nCountType]["nExp"]
--				ModifyExp(nExpVM)
--				if nExpVM > 0 then
--					Msg2Player("B�n nh�n th�m ".. nExpVM.." �i�m kinh nghi�m t� v�n may!")
--				else
--					Msg2Player("B�n b� t�n th�t ".. nExpVM.." �i�m kinh nghi�m do kh�ng may m�n. H�y �i gi�i v�n xui � Th�y B�i Si�u H�ng!")
--				end
--			end
		end
		--==================== Chi Ton Vuong Lenh NewServer
--		if ChiTonNew_CheckNewServer() == 1 then
--			if ChiTonNew_GetStep() == 4 then
--				ChiTonNew_SetMissionPart(5)
--			end
--		end
	end
	PlayerIndex = nOldPlayer
end


-- Random v�ng th�i h� theo t� l� thi�t k�
function RandThaiHuRing(nQty)	
	nhiemvuVBonus(6) --nhi�m v� VBonus 07/2014
	local tThaiHuRing = {
		[1] = {[1] = {item={{gdp={2,1,469,1}, name = "V�ng Th�i H� B�t Qu�i - C�n"}}}, nRate = 35},
		[2] = {[1] = {item={{gdp={2,1,470,1}, name = "V�ng Th�i H� B�t Qu�i - Kh�n"}}}, nRate = 10},
		[3] = {[1] = {item={{gdp={2,1,471,1}, name = "V�ng Th�i H� B�t Qu�i - Kh�m"}}}, nRate = 10},
		[4] = {[1] = {item={{gdp={2,1,472,1}, name = "V�ng Th�i H� B�t Qu�i - �o�i"}}}, nRate = 10},
		[5] = {[1] = {item={{gdp={2,1,473,1}, name = "V�ng Th�i H� B�t Qu�i - Ly"}}}, nRate = 20},
		[6] = {[1] = {item={{gdp={2,1,474,1}, name = "V�ng Th�i H� B�t Qu�i - Ch�n"}}}, nRate = 8},
		[7] = {[1] = {item={{gdp={2,1,475,1}, name = "V�ng Th�i H� B�t Qu�i - C�n"}}}, nRate = 6},
		[8] = {[1] = {item={{gdp={2,1,476,1}, name = "V�ng Th�i H� B�t Qu�i - T�n"}}}, nRate = 1},
	}
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nh�n"
	for i = 1, nQty do
		LIB_Award:AwardByRate(tThaiHuRing)
	end
end


-- Nh�n th��ng Thi�n M�n Tr�n
function ThienMonTran_NhanThuong(nType)
	nhiemvuVBonus(3) --nhi�m v� VBonus 07/2014
	--Add nguy�n li�u Event
	if nType == 4 then
		if VietCheckEvent() == 1 then
			gf_AddItemEx2({2,1,30741 ,1000}, "Nguy�n li�u Event VIP TMT", "Hoat dong thang 11 nam 2014", "ho�n th�nh nhi�m v� Thi�n M�n Tr�n VIP")
			Msg2Player("B�n nh�n ���c 1000 Nguy�n Li�u Event")
		end		
	end
	------------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="M�c R��ng"}}},
		[1] = {item={{gdp={2,1,30340,3}, name="M�c R��ng"}}},
		[2] = {item={{gdp={2,1,30340,6}, name="M�c R��ng"}}},
		[3] = {item={{gdp={2,1,30340,10}, name="M�c R��ng"}}},
		[4] = {item={{gdp={2,1,30340,14}, name="M�c R��ng"}}},
	}
	LIB_Award:Award(tbBonus[nType])
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 23 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	---------	 	
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 6,5)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 6,5)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� Thi�n M�n Tr�n")
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(5)
	end
	if STVN_GetDailyAwardStatus() == 1 and STVN_GetStatus() == 2 then
		STVN_DailyMissionComplete(4)
	end
	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(6)
	set_value_nv_nangcap(7)
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	  	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 17 or CTVL_GetDailyMission() == 18 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 2,1)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 2,1)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n nhi�m v� Thi�n M�n Tr�n")
			end
		end
	end		
	--========================
end

-- Nh�n th��ng T�i Nguy�n Chi�n
function TaiNguyenChien_NhanThuong(nType)
	_vjw_SetZyz()
	nhiemvuVBonus(5) --nhi�m v� VBonus 07/2014
	if VietCheckEvent() == 1 then	
		local tMaterialQuantity2013 = 
		{
			[1] = {100}, -- s� d�ng qu�n c�ng ch��ng
			[2] = {200},-- s� d�ng qu�n c�ng ��i
			[3] = {500}, -- S� d�ng qu�n c�ng huy ho�ng
			[4] = {50},  -- Kh�ng s� d�ng qu�n c�ng
			[5] = {1000}, -- VIP
		}
		gf_AddItemEx2({2,1,30742 ,  tMaterialQuantity2013[nType][1]}, "Nguy�n li�u Event", "Hoat dong thang 11 nam 2014", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n lo�i"..nType)
		Msg2Player("B�n nh�n ���c "..tMaterialQuantity2013[nType][1].." Nguy�n li�u Event")
	end						
------------Ph�n th��ng Hu�n Ch��ng Anh H�ng
	local tbHCAnhHung = 
		{
			[1] = {1},
			[2] = {2},
			[3] = {3},
			[4] = {0},
			[5] = {4},
		}
		gf_AddItemEx2({2,1,30499 ,  tbHCAnhHung[nType][1]}, "Hu�n Ch��ng Anh H�ng", "TAI NGUYEN CHIEN NEW LOG", "ho�n th�nh nhi�m v� T�i Nguy�n Chi�n nh�n th��ng HCAH")
		Msg2Player("B�n nh�n ���c "..tbHCAnhHung[nType][1].." Hu�n Ch��ng Anh H�ng")
------------
	local tbBonus = {
		[0] = {item={{gdp={2,1,30340,1}, name="M�c R��ng"}}},
		[1] = {item={{gdp={2,1,30340,2}, name="M�c R��ng"}}},
		[2] = {item={{gdp={2,1,30340,4}, name="M�c R��ng"}}},
		[3] = {item={{gdp={2,1,30340,6}, name="M�c R��ng"}}},
		[4] = {item={{gdp={2,1,30340,1}, name="M�c R��ng"}}}, -- Kh�ng s� d�ng qu�n c�ng
		[5] = {item={{gdp={2,1,30340,10}, name="M�c R��ng"}}}, -- VIP
	}
	LIB_Award:Award(tbBonus[nType])
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 24 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end
	---------
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 2,1)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 2,1)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� T�i Nguy�n Chi�n")
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 4,3)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 4,3)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n nhi�m v� T�i nguy�n chi�n")
			end
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(3)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 9 or CTVL_GetDailyMission() == 10 or CTVL_GetDailyMission() == 11 or CTVL_GetDailyMission() == 12 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	if ChiTonNew_CheckNewServer() == 1 then
		--==================== Chi Ton Vuong Lenh NewServer
		if ChiTonNew_GetStep() == 5 then
			ChiTonNew_SetMissionPart(2)
		elseif ChiTonNew_GetStep() == 17 then
			ChiTonNew_SetMissionPart(3)
		end
	end
	--=============	
end

function ThuHoachBatNhaLon()
	VBonus_BatNhaLon()
	--============= Chu�i nhi�m v� Ph�c Sinh 2 =====================
	if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 11 and PhucSinh2_GetMissionPart() > 0 then
		PhucSinh2_SetMissionPart()
	end

	--============= Nhi�m v� ��i trang b� Vi�m �� ==================
	set_value_nv_nangcap(3)
	set_value_nv_nangcap(8)
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a	
	--============= Bonus Chi Ton server moi ==================
	if ChiTonNew_CheckNewServer() == 1 then
		Earn(20000)
		local nRandom = mod(random(1,10000),20)
		AddItem(2,1,(30164 + nRandom), 5)
	end
	--================
end

function Use_Award_PhaoHoa()
	-----------------------Chu�i nhi�m v� Ph�c Sinh 2
	if PhucSinh2_CheckActive() == 1 then
		if PhucSinh2_GetDailyMission() == 1 and PhucSinh2_GetMissionPart() > 0 then
			PhucSinh2_SetMissionPart()
		end
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a		
    	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 19 or CTVL_GetDailyMission() == 20 or CTVL_GetDailyMission() == 21 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
	--------========== CTVL new server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(5)
		elseif ChiTonNew_GetStep() == 2 then
			ChiTonNew_SetMissionPart(3)
		elseif ChiTonNew_GetStep() == 20 then
			ChiTonNew_SetMissionPart(2)
		end
	end
end

function TriQuocBinhThienHa_NhanThuong(nType)
	--Add nguy�n li�u Event
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30741 ,200}, "Nguy�n li�u Event", "Hoat dong thang 11 nam 2014", "ho�n th�nh nhi�m v� Tr� Qu�c B�nh Thi�n H� lo�i"..nType)
		Msg2Player("B�n nh�n ���c 200 Nguy�n Li�u Event")
	end		
	
	--do return 0 end
    	-----------------------Nhi�m v� h�ng ng�y CTVL
    	if nType == 1 then
    		TriQuocBinhThienHa_NhanThuongCungTe()
    	elseif nType == 2 then
    		TriQuocBinhThienHa_NhanThuongTriAn()
    	elseif nType == 3 then
    		TriQuocBinhThienHa_NhanThuongThuyLoi()
    	elseif nType == 4 then
    		TriQuocBinhThienHa_NhanThuongLuyenDon()
    	end
end


function TriQuocBinhThienHa_NhanThuongCungTe()
	nhiemvuVBonus(7) --nhi�m v� VBonus 07/2014
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(7)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 22 and  CTVL_GetMissionPart() > 0 then	
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 2 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 3 or  ChiTonNew_GetStep() == 13 then
			ChiTonNew_SetMissionPart(3)
		end
	end
end

function TriQuocBinhThienHa_NhanThuongTriAn()
	nhiemvuVBonus(13) --nhi�m v� VBonus 07/2014
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 23 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 6 then
			ChiTonNew_SetMissionPart(1)
		end
	end
end


function TriQuocBinhThienHa_NhanThuongThuyLoi()
	nhiemvuVBonus(8) --nhi�m v� VBonus 07/2014
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(6)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 24 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
	--=========== New server ==========
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 1 then
			ChiTonNew_SetMissionPart(6)
		elseif ChiTonNew_GetStep() == 4 then
			ChiTonNew_SetMissionPart(4)
		end
	end
end

function TriQuocBinhThienHa_NhanThuongLuyenDon()
	nhiemvuVBonus(16) --nhi�m v� VBonus 07/2014
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 25 and  CTVL_GetMissionPart() > 0 then
			CTVL_SetMissionPart()
		end
	end
end


function ThitNuong_NhanThuong()
	--===== nhi�m v� Th�ng Ti�n Ph�c Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,7,7)
	end
	----------------------------------	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a	
	if VietCheckEvent() == 1 then
		gf_AddItemEx2({2,1,30660 ,50}, "Nguy�n li�u Event", "Hoat dong thang 06 nam 2014", "ho�n th�nh nhi�m v� B�ch Ti�n Sinh")
		Msg2Player("B�n nh�n ���c 50 Nguy�n Li�u Event")
	end			
    	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 13 or CTVL_GetDailyMission() == 14 or CTVL_GetDailyMission() == 15 or CTVL_GetDailyMission() == 16 then
			if CTVL_GetMissionPart() > 0 then
				CTVL_SetMissionPart()
			end
		end
	end
end


function TongLieu_NhanThuong(nType)
	if nType == 1 then
		TongLieu_NhanThuongNongTrang()
	elseif nType == 2 then
		TongLieu_NhanThuongLuongThao()
	elseif nType == 3 then
		nhiemvuVBonus(15) --nhi�m v� VBonus 07/2014
		TongLieu_NhanThuongThanhTri()
	elseif nType == 4 then
--		nhiemvuVBonus(14) --nhi�m v� VBonus 07/2014
		TongLieu_NhanThuongNhanMonQuan()
	end
	--===== nhi�m v� Th�ng Ti�n Ph�c Sinh
	if TTPS_GetStatus() == 1 then
		VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH,1,8,8)
	end
	----------------------------------	
end


function TongLieu_NhanThuongNongTrang()

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 1 or CTVL_GetDailyMission() == 2 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 8,7)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 8,7)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng n�ng trang")
			end
		end
	end
end


function TongLieu_NhanThuongLuongThao()

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 3 or CTVL_GetDailyMission() == 4 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 2,1)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 2,1)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng l��ng th�o")
			end
		end
	end
end


function TongLieu_NhanThuongThanhTri()
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(1)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 5 or CTVL_GetDailyMission() == 6 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 4,3)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 4,3)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng b�o v� th�nh tr�")
			end
		end
	end
end


function TongLieu_NhanThuongNhanMonQuan()
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 2 and STVN_GetDailyAwardStatus() == 1 then
		STVN_DailyMissionComplete(2)
	end

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	-----------------------Nhi�m v� h�ng ng�y CTVL
	if CTVL_CheckActive() == 1 then
		if CTVL_GetDailyMission() == 7 or CTVL_GetDailyMission() == 8 then  
			if CTVL_GetMissionPart() > 0 then	
				CTVL_SetMissionPart()
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 8,7)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 8,7)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� Nh�n M�n Quan")
		end
	end
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION2, 6,5)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION2, nQty + 1, 6,5)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n chi�n tr��ng Nh�n M�n Quan")
			end
		end
	end
end


function KichHoatBacDauDuongSinhThuat()

	do return 0 end		--kh�c d��i kh�ng ch�y n�a
	--==================== Chi Ton Vuong Lenh NewServer
	if ChiTonNew_CheckNewServer() == 1 then
		if ChiTonNew_GetStep() == 3 then
			ChiTonNew_SetMissionPart(4)
		elseif ChiTonNew_GetStep() == 12 or ChiTonNew_GetStep() == 18 then
			ChiTonNew_SetMissionPart(1)
		end
	end
end


function HoanThanhNhiemVuLuongSonBac()
	nhiemvuVBonus(12) --nhi�m v� VBonus 07/2014
	-----------------------Chu�i nhi�m v� ��ng H�nh
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 26 then
			if mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1), 10) == 3 or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2), 10) == 3  or mod(GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3), 10) == 3  then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
	end
	local nDate = tonumber(date("%Y%m%d"))
	if nDate <= 20140406 then
		local nQty = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 4,3)
		if nQty < 30 then
			VNG_SetTaskPos(TSK_HOATDONGNEWSERVER, nQty + 1, 4,3)
			TaskTip("Ho�t ��ng Linh B�o S�n: Ho�n th�nh 1 l�n nhi�m v� L��ng S�n B�c")
		end
	end
	--=============== Sinh Tu Vo Nga =========================
	if STVN_time_remain() == 1 and STVN_GetStatus() == 1 then
		STVN_SubMissionComplete(4)
	end
	
	do return 0 end		--kh�c d��i kh�ng ch�y n�a	
	--=============== T�i xu�t giang h� ===========
	if gf_GetTaskBit(TSK_TAIXUAT_FLAG,1) == 1 then
		local nDate = tonumber(date("%Y%m%d"))
		if nDate <= 20140320 then
			local nQty = VNG_GetTaskPos(TSK_TAIXUAT_MISSION1, 6,5)
			if nQty < 18 then
				VNG_SetTaskPos(TSK_TAIXUAT_MISSION1, nQty + 1, 6,5)
				TaskTip("T�i xu�t giang h�: Ho�n th�nh 1 l�n nhi�m v� L��ng S�n B�c")
			end
		end
	end	
	--===========	
end

function HoanThanhNhiemVuSuMon()
	nhiemvuVBonus(11)
end

function VietCheckEvent()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= 141107 and nDate <=141130 then
		return 1
	end
	return 0
end

--====ph�n th��ng VBonus cho s� d�ng c�c item
function VBonus_NuOa()
	if CheckVbonus() == 1 then
		ModifyExp(200000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 200.000 kinh nghi�m.")
	end
end

function VBonus_BatNhaNho()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 300.000 kinh nghi�m.")
	end
end

function VBonus_HatGiong()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 300.000 kinh nghi�m.")
	end
end

function VBonus_CayTuLinh()
	if CheckVbonus() == 1 then
		ModifyExp(300000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 300.000 kinh nghi�m.")
	end
end

function VBonus_LuckyStar()
	if CheckVbonus() == 1 then
		ModifyExp(250000)
		Msg2Player("T�i kho�n c� k�ch ho�t VBonus, ���c nh�n th�m 250.000 kinh nghi�m.")
	end
end

function VBonus_BatNhaLon()
	local tbFruite = {
		[1] = {"Nh�n" , 30164},			[2] = {"Ch�m Ch�m", 30165},		[3] = {"Cam", 30165},		[4] = {"D�a", 30167},
		[5] = {"M�ng C�t", 30168},		[6] = {"M�ng c�u", 30179},			[7] = {"Kh�m", 30180},	[8] = {"L�", 30181},
		[9] = {"B�n Bon", 30182},		 [10] = {"Kh�", 30183},				[11] = {"B��i", 30169},	[12] = {"D�u", 30170},
		[13] = {"Chu�i", 30171},			[14] = {"Xo�i", 30172},				[15] = {"��o", 30173},	[16] = {"M�n", 30174},
		[17] = {"V�i", 30175},				[18] = {"T�o", 30176},				[19] = {"B�", 30177},		[20] = {"�u ��", 30178},
		}
	if CheckVbonus() == 1 then
		local nIndex = random(1,20)
		gf_AddItemEx2({2, 1, tbFruite[nIndex][2], 2}, tbFruite[nIndex][1], "NHAN THUONG VBONUS BK", "tr�i c�y")
	end
end

function TTPS_GetStatus()
	local nStatus = VNG_GetTaskPos(TSK_THANGTIEN_PHUCSINH,1,1)
	return nStatus
end

--interface for viet----------
function _vjw_SetTaixu()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
	if nTimes < 2 then
		gf_SetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Tham gia Th�i H� Huy�n C�nh", nTimes + 1, 2));
	end
end

function _vjw_SetZyz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Ho�n th�nh T�i Nguy�n Chi�n", nTimes + 1, 1));
	end
end
-------------------------------