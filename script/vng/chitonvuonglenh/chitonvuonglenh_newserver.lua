Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua")
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_head.lua");

-- Task 2667, 2668, 2669
IP_TIME_LIMIT = 7246800--2592000
IP_ONLINE_TIME = 2536
szNPCName = "<color=green>Anh/Ch� Ch� Ph�ng M�y: <color>"
szLogTitle = "CHI TON VUONG LENH"
szLogTitle1 = "CHI TON VUONG LENH BK"
LIB_Award.szLogTitle = szLogTitle .. " NEW SERVER"
LIB_Award.szLogAction = "nh�n"

tbChiTonPhanThuong = {
	[1] = {fn="ChiTonNew_PhanThuong99()"},
	[2] = {fn="ChiTonNew_PhanThuong199()"},
	[3] = {fn="ChiTonNew_PhanThuong299()"},
	[4] = {fn="ChiTonNew_PhanThuong399()"},
	[5] = {fn="ChiTonNew_PhanThuong499()"},
	[6] = {nCheckExp = 0, nChankhi = 20000, nExp = 50000000, fn="ChiTonNew_ThuongTraiCay()"},
	[7] = {nCheckExp = 0, nExp = 50000000},
	[8] = {nCheckExp = 0, nExp = 100000000},
	[9] = {nCheckExp = 0, item={{gdp={2,1,1068,1}, name="Thi�n Th�ch Linh Th�ch", nExpired = 7*24*3600}}, nChankhi = 10000, nExp = 100000000},
	[10] = {nCheckExp = 0, nChankhi = 10000, nExp = 100000000, fn="ChiTonNew_NonDieuDuong()"},
	[11] = {nCheckExp = 0, item={{gdp={2,1,1067,1}, name="��nh H�n Thi�n Th�ch Th�n Th�ch", nExpired=7*24*3600}}, nChankhi = 10000, nExp = 100000000},
	[12] = {nCheckExp = 0, nChankhi = 10000, nExp = 100000000, fn="ChiTonNew_AoDieuDuong()"},
	[13] = {nCheckExp = 0, item={{gdp={2,1,1068,1}, name="Thi�n Th�ch Linh Th�ch", nExpired=7*24*3600}}, nChankhi = 10000, nExp = 200000000},
	[14] = {nCheckExp = 0, nExp = 200000000, fn="ChiTonNew_QuanDieuDuong()"},
	[15] = {nCheckExp = 0, item={{gdp={2,1,1113,1}, name="��i ��nh H�n", nExpired=7*24*3600}}, nChankhi = 10000, nExp = 300000000},
	[16] = {nCheckExp = 0, item={{gdp={0,112,78,1}, name="L�ng Ba Vi B�"}}, nChankhi = 20000, nExp = 500000000, fn="ChiTonNew_ThuongTraiCay()"},
	[17] = {nCheckExp = 0, nChankhi = 30000, nExp = 500000000, fn="ChiTonNew_MatTichMonPhai70(10)"},
	[18] = {nCheckExp = 0, item={{gdp={0,112,158,1}, name="L�ng Ba Vi B� to�n t�p"}}, nExp = 500000000},
	[19] = {item={{gdp={2,1,30497,500}, name="Ma Tinh"}, {gdp={2,1,1113,1}, name="��i ��nh H�n", nExpired = 7*24*3600}}, nChankhi = 100000, fn="ChiTonNew_VuKhiDieuDuong(); ChiTonNew_HoanThanhPS1Part1()"},
--	[20] = {nCheckExp = 0, nExp = 3000000000, fn="ChiTonNew_KichHoatKinhMach(3)"},
--	[21] = {nCheckExp = 0, item={{gdp={2,1,30497,2}, name="Ma Tinh"}, {gdp={2,1,30132,500}, name="V� L�m B�o H�p"}}, nExp = 690000000},
}

tbDieuKienHoanThanh = {
	[6] = {nDanhvong = 4000},
	[7] = {nSumon = 4000},
	[8] = {nQuancong =50000},
	[9] = {nDanhvong = 6000, nSumon = 6000, nQuancong = 70000},
	[10] = {nDanhvong = 8000, nSumon = 8000, nQuancong = 100000},
	[11] = {nDanhvong = 10000, nSumon = 10000, nQuancong = 120000},
	[12] = {nDanhvong = 12000, nSumon = 12000, nQuancong = 140000},
--	[13] = {nQuancong = 150000},
	[14] = {nQuancong = 150000},
	[15] = {nDanhvong = 14000, nSumon = 14000},
	[16] = {nDanhvong = 15000, nSumon = 15000, nQuancong = 160000},
	[18] = {nQuancong = 180000},
	[19] = {nQuancong = 200000},
}

tbHanhTrang = {
	[1] = {38,500},
	[2] = { 26,1000},
	[3] = { 26,500},
	[4] = { 26,500},
	[5] = { 26,500},
	[6] = { 26,500},
	[7] = { 26,500},
	[8] = { 26,500},
	[9] = { 26,500},
	[10] = { 26,500},
	[11] = { 26,500},
	[12] = { 26,500},
	[13] = { 26,500},
	[14] = { 26,500},
	[15] = { 26,500},
	[16] = { 26,500},
	[17] = { 26,500},
	[18] = { 26,500},
	[19] = { 26,500},
--	[20] = { 26,500},
}
tbHoTroPhaiMoi = {
	[1] = {80, {item={{gdp={2,1,30071,100}, name="Nh�n S�m V�n N�m"}}, fn="AddItem(2,1,30132,8888)"}, 12, 250},
	[2] = {85, {nDanhvong = 2000, nSumon = 2000}, 0,250},
	[3] = {88, {item={{gdp={2,1,30497,100}, name="Ma Tinh"}}, nQuancong = 30000}, 2,250},
	[4] = {90, {item={{gdp={2,1,30071,200}, name="Nh�n S�m V�n N�m"}}, fn="ChiTonNew_KichHoatKinhMach(1)"}, 2,250},
	[5] = {96, {nChankhi = 100000}, 2,250},
	[6] = {99, {nCheckExp = 0, item={{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n", nExpired = 60*24*3600}}, nExp=1600000000, fn="ChiTonNew_KichHoatKinhMach(2)"}, 2, 250},
}

tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
	
function ChiTonNewServer_Menu()
	local nIndex = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT)*100 + GetPlayerRebornParam(0)*100 + GetLevel()
	local nStepID = ChiTonNew_GetStep()
	local tbSay = {}
	if nStepID < 19 then
		for i= nStepID, getn(tbMission) do
			if tbMission[i] ~= nil then
				if tbMission[i][1] <= nIndex and nIndex <= tbMission[i][2] then
					tinsert(tbSay, tbMission[i][3].."/#ChiTonNew_NhanNhiemVuTheoLevel("..i..")")
				end
			end
		end
	end
--	if nStepID >= 19 then
--		Talk(1,"","Nhi�m v� ch� ta hi�n th�i �� h�t, khi n�o c� nhi�m v� m�i ta s� th�ng b�o cho ng��i.")
--		return
--	end
	tinsert(tbSay, "Tr�  nhi�m v� �ang th�c hi�n/ChiTonNew_TraNhiemVu_Menu")
	tinsert(tbSay, "Nh�n h� tr� ph�i m�i/ChiTonNew_HoTroPhaiMoi")
	tinsert(tbSay, "Nh�n h� tr� server m�i/ChiTonNew_HoTroServerMoi")
	tinsert(tbSay, "Ta ch�a mu�n nh�n/gf_DoNothing")
	Say("N�u c�c h� th�c hi�n ��y �� y�u c�u c�a ta, ph�n th��ng s� kh�ng nh�.", getn(tbSay), tbSay)
end


function ChiTonNew_NhanNhiemVuTheoLevel(nIndex)
	if ChiTonNew_CheckNewServer() ~= 1 then
		Talk(1,"","C�c h� ch�a k�ch ho�t t�nh n�ng Ch� T�n V��ng L�nh server m�i.")
		return 0
	end
	local nStepID = ChiTonNew_GetStep()
	if nStepID >= nIndex then
		Talk(1,"","C�c h� �� nh�n ho�c ho�n th�nh nhi�m v� n�y")
		return 0
	end
	if nStepID > 0 and GetTask(TSK_CHITONNEW2) > 0 then
		Talk(1,"","Nhi�m v� hi�n t�i ch�a xong, c�c h� kh�ng th� nh�n nhi�m v� m�i")
		return 0
	end
	VNG_SetTaskPos(TSK_CHITONNEW1, nIndex, 2,1)
	SetTask(TSK_CHITONNEW2, tbMission[nIndex][4])
	Talk(1,"","Nh�n nhi�m v� th�nh c�ng, h�y mau �i th�c hi�n")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, tbMission[1][3])
end


function ChiTonNew_TraNhiemVu_Menu()
	if ChiTonNew_CheckNewServer() ~= 1 then
		Talk(1,"","C�c h� ch�a k�ch ho�t t�nh n�ng Ch� T�n V��ng L�nh server m�i.")
		return 0
	end
	local nRoute = GetPlayerRoute() or 0
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� tr� nhi�m v�.")
		return 0
	end
	local nStepID = ChiTonNew_GetStep()
	if tbDieuKienHoanThanh[nStepID] ~= nil then
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbDieuKienHoanThanh[nStepID])
		if nCheck ~= 1 then
			return 0
		end
	end
	local tbSay = {}
--	if tbMissionPart[nStepID] == nil then
--		Talk(1,"","Nhi�m v� kh�ng ��i h�i th�c hi�n y�u c�u kh�c, h�y mau tr� nhi�m v�.")
--		return 0
--	end
	ChiTonNew_CheckPassivePart()
	local szMsg = "<color=yellow>"..tbMission[nStepID][3].."<color>, c�c h� c�n ph�i th�c hi�n c�c y�u c�u sau:\n"
	if tbMissionPart[nStepID] ~= nil then
		for i=1, getn(tbMissionPart[nStepID]) do
			local nPart = VNG_GetTaskPos(TSK_CHITONNEW2, tbMissionPart[nStepID][i][2], tbMissionPart[nStepID][i][3])
			szMsg = szMsg .. i.." - "..tbMissionPart[nStepID][i][1]..": "
			if nPart == 0 then
				szMsg = szMsg .. "<color=green>Ho�n th�nh<color>\n"
			else
				szMsg = szMsg  .. "c�n <color=red>"..nPart.."<color> l�n\n"
			end
		end
	end
	if GetTask(TSK_CHITONNEW2) == 0 then
		tinsert(tbSay,"Nh�n ph�n th��ng v�t ph�m/ChiTonNew_NhanThuongTheoLevel")
		local nChuyenSinh = GetTranslifeCount()
		if nStepID <= 5 and nStepID >= nChuyenSinh then
			tinsert(tbSay,"Nh�n ph�n th��ng chuy�n sinh/ChuyenSinhForm")
		end
		tinsert(tbSay, "Ta ch�a mu�n nh�n/gf_DoNothing")
		Say("Nhi�m v� �� ho�n th�nh, h�y mau nh�n th��ng.", getn(tbSay), tbSay)
	else
		Talk(1,"",szMsg)
	end
end


function ChiTonNew_CheckPassivePart()
	local nStepID = ChiTonNew_GetStep()
	if nStepID == 1 then
		if GetTongName() ~= "" then
			ChiTonNew_SetMissionPart(7)
		end
		if GetSkillLevel(20) > 0 then
			ChiTonNew_SetMissionPart(8)
		end
	elseif nStepID == 2 then
		if mod(GetTask(TASK_VNG_PET), 100) > 0 then
			ChiTonNew_SetMissionPart(5)
		end
	elseif nStepID == 19 then
		if GetTask(TSK_USEFRUIT_FLAG_1) == 1010101010 and GetTask(TSK_USEFRUIT_FLAG_2) == 1010101010 and GetTask(TSK_USEFRUIT_FLAG_3) == 1010101010 and GetTask(TSK_USEFRUIT_FLAG_4) == 1010101010 then
			ChiTonNew_SetMissionPart(3)
		end
		if GetTask(TSK_CS6_TULINH) > 0 then
			ChiTonNew_SetMissionPart(2)
		end
	end
end


function ChiTon_Test()
	local nStepID = ChiTonNew_GetStep()
	local nSubPart = getn(tbMissionPart[nStepID])
	AskClientForNumber("ChiTonNew_SetMissionPart", 1, nSubPart, "(1-"..nSubPart..":")
end


--=================== function phat thuong ==================
function ChiTonNew_NhanThuongTheoLevel()
	local nIndex = ChiTonNew_GetStep()
	if tbChiTonPhanThuong[nIndex] == nil then
		return 0
	end
	if ChiTonNew_CheckNewServer() ~= 1 then
		return 0
	end
	if ChiTonNew_GetAward() >= nIndex then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	if gf_JudgeRoomWeight(tbHanhTrang[nIndex][1],tbHanhTrang[nIndex][2],"") == 0 then
		Talk(1,"","H�nh trang c�n <color=yellow>".. tbHanhTrang[nIndex][1] .."<color> � tr�ng, <color=yellow>".. tbHanhTrang[nIndex][2] .."<color> �� n�ng, vui l�ng s�p x�p l�i")
		return 0
	end
	LIB_Award:Award(tbChiTonPhanThuong[nIndex])
	ChiTonNew_SetAward(nIndex)
	if nIndex > 5 then
		gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "Nh�n th��ng "..tbMission[nIndex][3])
	end
end


function ChiTonNew_PhanThuong99()
	local tbAward = {nCheckExp = 0, 
			item={{gdp={0,105,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Phi�u V�", nExpired = 30*24*3600}, 
				{gdp={2,0,138,2}, name="B�t B�o T�y T�y Ti�n ��n", nExpired = 30*24*3600}, 
				{gdp={2,1,503,4}, name="V� Ng�n Th�y", nExpired = 30*24*3600}},
			nExp = 500000000,
	}
	ChiTonNew_MatTichMonPhai70(10)
	ChiTonNew_YeuQuyet()
	ChiTonNew_MatTichTranPhai()
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(1)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "Nh�n th��ng "..tbMission[1][3])
end


function ChiTonNew_PhanThuong199()
	local tbAward = {nChankhi = 10000}
	ChiTonNew_MatTichMonPhai70(10)
	ChiTonNew_NhanThuongThienNghia()
	ChiTonNew_KichHoatKinhMach(1)
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(2)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "Nh�n th��ng "..tbMission[2][3])
end


function ChiTonNew_PhanThuong299()
	local tbAward = {nCheckExp = 0, nExp = 690000000, nChankhi = 10000}
	ChiTonNew_KichHoatKinhMach(2)
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(3)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "Nh�n th��ng "..tbMission[3][3])
end


function ChiTonNew_PhanThuong399()
	local tbAward = {nCheckExp = 0, nGold = 500000,  nExp = 790000000}
	ChiTonNew_VuKhiCuuChau()
	ChiTonNew_NgocBoiCuuChau()
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(4)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "Nh�n th��ng "..tbMission[4][3])
end


function ChiTonNew_PhanThuong499()
	local tbAward = {nCheckExp = 0, nGold = 500000,  nExp = 1000000000, nChankhi = 20000}
	LIB_Award:Award(tbAward)
	ChiTonNew_SetAward(5)
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "Nh�n th��ng "..tbMission[5][3])
end


--========================
function ChiTonNew_MatTichMonPhai70(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nQty}, name="Kim Cang B�t Nh� Ch�n Quy�n"}}},
		[4] = {item={{gdp={0,107,205, nQty}, name="Ti�m Long T�c Di�t Ch�n Quy�n"}}},
		[3] = {item={{gdp={0,107,206, nQty}, name="V� Tr�n B� �� Ch�n Quy�n"}}},
		[6] = {item={{gdp={0,107,207, nQty}, name="Thi�n La Li�n Ch�u Ch�n Quy�n"}}},
		[8] = {item={{gdp={0,107,208, nQty}, name="Nh� � Kim ��nh Ch�n Quy�n"}}},
		[9] = {item={{gdp={0,107,209, nQty}, name="B�ch H�i Tuy�t �m Ch�n Quy�n"}}},
		[11] = {item={{gdp={0,107,210, nQty}, name="H�n ��n Tr�n Nh�c Ch�n Quy�n"}}},
		[12] = {item={{gdp={0,107,211, nQty}, name="Qu� Thi�n Du Long Ch�n Quy�n"}}},
		[14] = {item={{gdp={0,107,212, nQty}, name="Huy�n �nh M� T�ng Ch�n Quy�n"}}},
		[15] = {item={{gdp={0,107,213, nQty}, name="Qu�n T� ��i Phong Ch�n Quy�n"}}},
		[17] = {item={{gdp={0,107,214, nQty}, name="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"}}},
		[18] = {item={{gdp={0,107,215, nQty}, name="Xuy�n V�n L�c H�ng Ch�n Quy�n"}}},
		[20] = {item={{gdp={0,107,216, nQty}, name="Huy�n Minh Phong Ma Ch�n Quy�n"}}},
		[21] = {item={{gdp={0,107,217, nQty}, name="Linh C� Huy�n T� Ch�n Quy�n"}}},
		[23] = {item={{gdp={0,107,218, nQty}, name="C�u Thi�n Phong L�i Ch�n Quy�n"}}},
		[29] = {item={{gdp={0,107,222, nQty}, name="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}},
		[30] = {item={{gdp={0,107,223, nQty}, name="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end


function ChiTonNew_YeuQuyet()
	local tbYeuQuyet = {
		[2] = {1,10},
		[4] = {11,20},
		[3] = {21,31},
		[6] = {32,46},
		[8] = {47,59},
		[9] = {60,70},
		[11] = {71,79},
		[12] = {80,88},
		[14] = {89,108},
		[15] = {109,119},
		[17] = {120,130},
		[18] = {131,141},
		[20] = {142,154},
		[21] = {155,168},
		[23] = {169,182},
		[29] = {219,229},
		[30] = {230,240},
	}
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		return 0
	end
	for i=tbYeuQuyet[nRoute][1], tbYeuQuyet[nRoute][2] do
		AddItem(2,6,i,1)
	end
end


function ChiTonNew_MatTichTranPhai()
	local tbTranPhai = {
		[2] = {item={{gdp={0, 112, 101, 1}, name= "D�ch C�n Kinh"}}},
		[4] = {item={{gdp={0, 112, 102, 1},name= "Nh� Lai Th�n Ch��ng"}}},
		[3] = {item={{gdp={0, 112, 103, 1},name= "T�y T�y Kinh"}}},
		[6] = {item={{gdp={0, 112, 104, 1},name= "H�p Tinh Tr�n"}}},
		[8] = {item={{gdp={0, 112, 105, 1},name= "V�n T��ng Th�n C�ng"}}},
		[9] = {item={{gdp={0, 112, 106, 1},name= "Thi�n �m Tr�n H�n Kh�c"}}},
		[11] = {item={{gdp={0, 112, 107, 1},name= "Gi�ng Long Th�p B�t Ch��ng"}}},
		[12] = {item={{gdp={0, 112, 108, 1},name= "�� C�u C�n Tr�n"}}},
		[14] = {item={{gdp={0, 112, 109, 1},name= "V� Th��ng Th�i C�c Ki�m"}}},
		[15] = {item={{gdp={0, 112, 110, 1},name= "Th�i C�c Th�n C�ng"}}},
		[17] = {item={{gdp={0, 112, 111, 1},name= "Li�n Ho�n To�n Long Th��ng"}}},
		[18] = {item={{gdp={0, 112, 112, 1},name= "B� V��ng T��ng Ph�ng Ti�n"}}},
		[20] = {item={{gdp={0, 112, 113, 1},name= "V� Thi�n Ma C�ng"}}},
		[21] = {item={{gdp={0, 112, 114, 1},name= "V� �nh Ma C�"}}},
		[23] = {item={{gdp={0,112,192,1},name= "Phong L�i Ch�u"}}},
		[29] = {item={{gdp={0,112,196,1},name= "Ph�ng Minh Ph�"}}},
		[30] = {item={{gdp={0,112,197,1},name= "Hoa Ti�n T�m Kinh"}}},
	}
	LIB_Award:AwardByRoute(tbTranPhai)
end


function ChiTonNew_NhanThuongThienNghia()
	local tbThienNghia1_B1 = {item = {
			{gdp={0,100,3034,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3034,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3034,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},
			{gdp={0,100,3037,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3037,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3037,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},},
	}
	local tbThienNghia1_B2 = {item = {
			{gdp={0,100,3040,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3040,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3040,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},
			{gdp={0,100,3043,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3043,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3043,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
				
	}
	local tbThienNghia1_B3 = {item = {
			{gdp={0,100,3046,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3046,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3046,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},
			{gdp={0,100,3049,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3049,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3049,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghia1_B4 = {item = {
			{gdp={0,100,3052,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3052,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3052,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},
			{gdp={0,100,3055,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Th�y Y"},
			{gdp={0,103,3055,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Nguy�t Qu�n"},
			{gdp={0,101,3055,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name = "Thi�n Ngh�a-C�u �m Ph�ng Trang"},}
	}
	local tbThienNghiaSet1 = {
		[1] = tbThienNghia1_B1,
		[2] = tbThienNghia1_B2,
		[3] = tbThienNghia1_B3,
		[4] = tbThienNghia1_B4,
	}
	local tbNgocBoiThienNghia = {item={
		{gdp={0,102,3122,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thi�n Ngh�a- Huy�n Th�ch Kim Ng�c"},
		{gdp={0,102,3125,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thi�n Ngh�a- Ph� Th�y Ng�c ��i"},
		{gdp={0,102,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thi�n Ngh�a- Nguy�t Hoa Th�y B�i"},
		{gdp={0,102,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thi�n Ngh�a- C�u �u H�a Gi�i"},
		{gdp={0,102,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Thi�n Ngh�a- Ng�ng Ng�c Th� Ho�n"},
	}}
	local VuKhiThienNghia = {
		[2] = {item={{gdp={0,3,8894,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-L�u Ly Gi�i �ao"}}},
		[3] = {item={{gdp={0,8,8910,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Kinh L�i Thi�n Tr��ng"}}},
		[4] = {item={{gdp={0,0,8876,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-L�i �m Nang Th�"}}},
		[6] = {item={{gdp={0,1,8880,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-�m D��ng Xuy�n �nh"}}},
		[8] = {item={{gdp={0,2,8887,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-T� H�n �m Ki�m"}}},
		[9] = {item={{gdp={0,10,8919,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-C�u Ho�n B�i C�m"}}},
		[11] = {item={{gdp={0,0,8877,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Quy L�n H� Th�"}}},
		[12] = {item={{gdp={0,5,8901,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Tr�n Ng�o C�n"}}},
		[14] = {item={{gdp={0,2,8888,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Thu�n Phong Ki�m"}}},
		[15] = {item={{gdp={0,9,8915,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Tinh ��u Chuy�n B�t"}}},
		[17] = {item={{gdp={0,6,8904,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Ph� Qu�n Tr�n Th��ng"}}},
		[18] = {item={{gdp={0,4,8898,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Truy M�nh Cung"}}},
		[20] = {item={{gdp={0,7,8907,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Thi�p C�t Huy�t �ao"}}},
		[21] = {item={{gdp={0,11,8924,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Luy�n H�n Huy�t Tr�o"}}},
		[23] = {item={{gdp={0,2,8889,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Ng� Thi�n Phong Ki�m"}}},
		[25] = {item={{gdp={0,3,8895,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Th�n Di�m Thi�n �ao"}}},
		[26] = {item={{gdp={0,9,8916,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Th�n Phong Ph�n B�t"}}},
		[27] = {item={{gdp={0,11,8925,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Th�n Linh Ch� Tr�o"}}},
		[29] = {item={{gdp={0,13,8931,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-Linh Lung Chi"}}},
		[30] = {item={{gdp={0,12,8928,1,1,-1,-1,-1,-1,-1,-1,-1,7}, name="Thi�n Ngh�a-C�u Ti�u S�o"}}},
	}
	LIB_Award:AwardByBody(tbThienNghiaSet1)
	LIB_Award:Award(tbNgocBoiThienNghia)
	LIB_Award:AwardByRoute(VuKhiThienNghia)
end


function ChiTonNew_KichHoatKinhMach(nMeridianLevel)
	local nCurrentLevel = MeridianGetLevel() + 1
	for i=nCurrentLevel, nMeridianLevel do
		MeridianUpdateLevel()
	end
end


function ChiTonNew_VuKhiCuuChau()
	local tbVuKhiCuuChau = {
		[2] = {item={{gdp={0,3,8932,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-L�u Ly Gi�i �ao"}}},
		[4] = {item={{gdp={0,0,8933,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-L�i �m Nang Th�"}}},
		[3] = {item={{gdp={0,8,8934,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Kinh L�i Thi�n Tr��ng"}}},
		[6] = {item={{gdp={0,1,8935,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-�m D��ng Xuy�n �nh"}}},
		[8] = {item={{gdp={0,2,8936,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-T� H�n �m Ki�m"}}},
		[9] = {item={{gdp={0,10,8937,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u Ho�n B�i C�m"}}},
		[11] = {item={{gdp={0,0,8938,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Quy L�n H� Th�"}}},
		[12] = {item={{gdp={0,5,8939,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Tr�n Ng�o C�n"}}},
		[14] = {item={{gdp={0,2,8940,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Thu�n Phong Ki�m"}}},
		[15] = {item={{gdp={0,9,8941,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Tinh ��u Chuy�n B�t"}}},
		[17] = {item={{gdp={0,6,8942,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Qu�n Tr�n Th��ng"}}},
		[18] = {item={{gdp={0,4,8943,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Truy M�nh Cung"}}},
		[20] = {item={{gdp={0,7,8944,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Thi�p C�t Huy�t �ao"}}},
		[21] = {item={{gdp={0,11,8945,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Luy�n H�n Huy�t Tr�o"}}},
		[23] = {item={{gdp={0,2,8946,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng� Thi�n Phong Ki�m"}}},
--		[25] = {item={{gdp={0,3,8947,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Th�n Di�m Thi�n �ao"}}},
--		[26] = {item={{gdp={0,9,8948,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Th�n Phong Ph�n B�t"}}},
--		[27] = {item={{gdp={0,11,8949,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Th�n Linh Ch� Tr�o"}}},
		[29] = {item={{gdp={0,13,8950,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Linh Lung Chi"}}},
		[30] = {item={{gdp={0,12,8951,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u Ti�u S�o"}}},
	}
	LIB_Award:AwardByRoute(tbVuKhiCuuChau)
end


function ChiTonNew_NgocBoiCuuChau()
	local tbNgocBoiCuuChau = {
		[2] = {item={{gdp={0,102,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng�ng Ng�c Th� Ho�n"}, {gdp={0,102,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Huy�n Th�ch Kim Ng�c"}}},
		[3] = {item={{gdp={0,102,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng�ng Ng�c Th� Ho�n"}, {gdp={0,102,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}}},
		[4] = {item={{gdp={0,102,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}, {gdp={0,102,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}}},
		[6] = {item={{gdp={0,102,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}, {gdp={0,102,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Huy�n Th�ch Kim Ng�c"}}},
		[8] = {item={{gdp={0,102,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng�ng Ng�c Th� Ho�n"}, {gdp={0,102,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}}},
		[9] = {item={{gdp={0,102,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}, {gdp={0,102,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}}},
		[11] = {item={{gdp={0,102,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng�ng Ng�c Th� Ho�n"}, {gdp={0,102,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Huy�n Th�ch Kim Ng�c"}}},
		[12] = {item={{gdp={0,102,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}, {gdp={0,102,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}}},
		[14] = {item={{gdp={0,102,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}, {gdp={0,102,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}}},
		[15] = {item={{gdp={0,102,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}, {gdp={0,102,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}}},
		[17] = {item={{gdp={0,102,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng�ng Ng�c Th� Ho�n"}, {gdp={0,102,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Huy�n Th�ch Kim Ng�c"}}},
		[18] = {item={{gdp={0,102,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}, {gdp={0,102,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Huy�n Th�ch Kim Ng�c"}}},
		[20] = {item={{gdp={0,102,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}, {gdp={0,102,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}}},
		[21] = {item={{gdp={0,102,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}, {gdp={0,102,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}}},
		[23] = {item={{gdp={0,102,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Nguy�t Hoa Th�y B�i"}, {gdp={0,102,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}}},
		[25] = {item={{gdp={0,102,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}, {gdp={0,102,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Huy�n Th�ch Kim Ng�c"}}},
		[26] = {item={{gdp={0,102,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}, {gdp={0,102,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}}},
		[27] = {item={{gdp={0,102,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng�ng Ng�c Th� Ho�n"}, {gdp={0,102,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}}},
		[29] = {item={{gdp={0,102,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ph� Th�y M�c ��i"}, {gdp={0,102,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Huy�n Th�ch Kim Ng�c"}}},
		[30] = {item={{gdp={0,102,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-Ng�ng Ng�c Th� Ho�n"}, {gdp={0,102,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="C�u Ch�u-C�u �u H�a Gi�i"}}},
	}
	LIB_Award:AwardByRoute(tbNgocBoiCuuChau)
end


--====================== function chuyen sinh ================

function ChuyenSinhForm()
	local nChuyenSinhStep = ChiTonNew_GetStep()
	local nAwardIndex = ChiTonNew_GetAward()
	if nChuyenSinhStep ~= nAwardIndex then
		Talk(1,"","C�c h� h�y nh�n ph�n th��ng v�t ph�m tr��c, sau �� quay l�i ��y.")
		return 0
	end
	local tSay = {
		"V�n b�i mu�n tu luy�n theo h��ng Long T�!/#ChiTonNew_ChuyenSinh(1,"..nChuyenSinhStep..")",
		"V�n b�i mu�n tu luy�n theo h��ng H� T�!/#ChiTonNew_ChuyenSinh(2,"..nChuyenSinhStep..")",
		"V�n b�i mu�n tu luy�n theo h��ng Ph�ng T�!/#ChiTonNew_ChuyenSinh(4,"..nChuyenSinhStep..")",
		"V�n b�i mu�n tu luy�n theo h��ng �ng T�!/#ChiTonNew_ChuyenSinh(3,"..nChuyenSinhStep..")",
		"Gi�i thi�u c�c h��ng tu luy�n/view_info",
		"V�n b�i suy ngh� l�i ��./nothing",
	}
	Say(szNpcName.."H�n Nguy�n C�ng th�c ch�t c� 4 h��ng tu luy�n, ng��i mu�n theo h��ng n�o?",getn(tSay),tSay)
end


function ChiTonNew_ChuyenSinh(nType, nStep)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c chuy�n sinh")
		return
	end	
	if nType <= 0 then
		return
	end
	if GetTranslifeCount()	>= nStep then
		Talk(1,"","Ng��i �� luy�n th�nh b� k�p chuy�n sinh n�y, kh�ng th� luy�n l�i.")
		return
	end
	if gf_JudgeRoomWeight(5,300,szNpcName) == 0 then
		return
	end
	
	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))
	
	local nRoute = GetPlayerRoute()
	-- Set s� l�n chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, nStep)
	-- Set h��ng chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	local nTransCount = nStep
--	if GetTranslifeCount() == 1 then			
--		local nTransCount = GetTranslifeCount()	
	if nTransCount == 1 then
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nh�n ngo�i trang",0,1)
		end
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
		if GetStoreBoxPageCount() < 4 then
			SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		end
		SetTaskTrans()
		ResetProperty()
		SetLevel(90,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� nh�t...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 2 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
--	elseif GetTranslifeCount() == 2 then		
	elseif nTransCount  == 2 then		
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			gf_AddItemEx2({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1],"Chuyen Sinh","nh�n ngo�i trang",0,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
--		SetTaskTrans()
		ResetProperty()
		SetLevel(88,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� hai...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 4 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
--	elseif GetTranslifeCount() ==3 then
	elseif nTransCount  ==3 then
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, Pnew, nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"V�n S� Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
--		SetTaskTrans()
		ResetProperty()
		SetLevel(86,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� ba...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 6 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)	
--	elseif GetTranslifeCount() == 4 then
	elseif nTransCount == 4 then
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 570 + GetBody() - 1
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (561 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"Thi�n �m Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
--		SetTaskTrans()
		ResetProperty()
		SetLevel(84,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 8 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
--	elseif  GetTranslifeCount() == 5 and GetTaskTrans() == 36 then
	elseif  nTransCount == 5 then
--		local nTransCount = GetTranslifeCount()	
		gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
		for i=1, getn(tb_translife_cloth[nType][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 561 + GetBody()
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end
		RemoveTitle(tb_translife_tittle[nTransCount-1][nRoute][2], tb_translife_tittle[nTransCount-1][nRoute][3])
		AddTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		SetCurTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])
		
--		SetTaskTrans()
		ResetProperty()
		SetLevel(79,0)
		Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� t�...")
		AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 8 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
		WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
		DoWait(15,15,10)
	else
		Talk(1,"",szNpcName.."H�n Nguy�n C�ng qu� l� tuy�t th� v� c�ng c�a trung nguy�n!")
		return
	end	
end


function ChiTonNew_HoTroPhaiMoi()
	local nServerID = GetGlbValue(1023)
	if ChiTonNew_CheckNewServer() ~= 1 then
		return 0
	end
	local nRoute = GetPlayerRoute()
	if nRoute ~= 23 and nRoute ~= 29 and nRoute ~= 30 then
		Talk(1,"","H� tr� n�y ch� d�nh cho <color=yellow>C�n L�n Thi�n S�, Th�y Y�n V� Ti�n v� Th�y Y�n Linh N�<color>.")
		return 0
	end
	local tbSay = {}
	for i=1, getn(tbHoTroPhaiMoi) do
		tinsert(tbSay, "Nh�n h� tr� ��ng c�p "..tbHoTroPhaiMoi[i][1].."/#ChiTonNew_HoTroPhaiMoi_Nhan("..i..")")
	end
	tinsert(tbSay, "Ta ch�a mu�n nh�n/gf_DoNothing")
	Say("Ta mu�n chia s� kh� kh�n v�i m�t s� m�n ph�i c�n non tr� tr�n giang h�. Ng��i h�y nh�n l�y h� tr�, ��ng ng�i.", getn(tbSay), tbSay)
end


function ChiTonNew_HoTroPhaiMoi_Nhan(nIndex)
	if gf_GetTaskBit(TSK_CHITONNEW3, nIndex) == 1 then
		Talk(1,"","Ph�n h� tr� n�y ng��i �� nh�n r�i, kh�ng th� nh�n th�m l�n n�a.")
		return 0
	end
	if GetLevel() < tbHoTroPhaiMoi[nIndex][1] then
		Talk(1,"","��ng c�p hi�n t�i c�a ng��i ch�a th� nh�n h� tr�, h�y c� g�ng th�m.")
		return 0
	end
	if gf_Judge_Room_Weight(tbHoTroPhaiMoi[nIndex][3], tbHoTroPhaiMoi[nIndex][4]) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	LIB_Award:Award(tbHoTroPhaiMoi[nIndex][2])
	gf_SetTaskBit(TSK_CHITONNEW3, nIndex, 1, 0)
	Talk(1,"","Nh�n th�nh c�ng ph�n h� tr� m�n ph�i m�i.")
end


function ChiTonNew_ThuongTraiCay()
	for i = 30164, 30183 do
		AddItem(2,1,i,40)
	end
end


function ChiTonNew_NonDieuDuong()
	local tbItem = {
		[1] = {
			[2] = {item={{gdp={0,103,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� N�n T�n Gi� M�o"}}},
			[4] = {item={{gdp={0,103,3130,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� Ki�p T�n Gi� M�o"}}},
			[3] = {item={{gdp={0,103,3132,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� �ch T�n Gi� M�o"}}},
			[6] = {item={{gdp={0,103,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"}}},
			[11] = {item={{gdp={0,103,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"}}},
			[12] = {item={{gdp={0,103,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t C�n"}}},
			[14] = {item={{gdp={0,103,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Qu�n"}}},
			[15] = {item={{gdp={0,103,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"}}},
			[17] = {item={{gdp={0,103,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Kh�i"}}},
			[18] = {item={{gdp={0,103,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"}}},
			[20] = {item={{gdp={0,103,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n C�n"}}},
			[21] = {item={{gdp={0,103,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng C�n"}}},
			[23] = {item={{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n"}}},
			[25] = {item={{gdp={0,103,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"}}},
			[26] = {item={{gdp={0,103,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"}}},
			[27] = {item={{gdp={0,103,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Qu�n"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,103,3129,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� N�n T�n Gi� M�o"}}},
			[4] = {item={{gdp={0,103,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� Ki�p T�n Gi� M�o"}}},
			[3] = {item={{gdp={0,103,3133,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� �ch T�n Gi� M�o"}}},
			[6] = {item={{gdp={0,103,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"}}},
			[11] = {item={{gdp={0,103,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"}}},
			[12] = {item={{gdp={0,103,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t C�n"}}},
			[14] = {item={{gdp={0,103,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Qu�n"}}},
			[15] = {item={{gdp={0,103,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"}}},
			[17] = {item={{gdp={0,103,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Kh�i"}}},
			[18] = {item={{gdp={0,103,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"}}},
			[20] = {item={{gdp={0,103,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n C�n"}}},
			[21] = {item={{gdp={0,103,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng C�n"}}},
			[23] = {item={{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�t ��ng Ch�n Ti�n Qu�n"}}},
			[25] = {item={{gdp={0,103,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"}}},
			[26] = {item={{gdp={0,103,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"}}},
			[27] = {item={{gdp={0,103,3185,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Qu�n"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,103,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"}}},
			[8] = {item={{gdp={0,103,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t V�n Th�nh C� Tr�m"}}},
			[9] = {item={{gdp={0,103,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m"}}},
			[11] = {item={{gdp={0,103,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"}}},
			[12] = {item={{gdp={0,103,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t C�n"}}},
			[14] = {item={{gdp={0,103,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Qu�n"}}},
			[15] = {item={{gdp={0,103,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"}}},
			[17] = {item={{gdp={0,103,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Kh�i"}}},
			[18] = {item={{gdp={0,103,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"}}},
			[20] = {item={{gdp={0,103,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n C�n"}}},
			[21] = {item={{gdp={0,103,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng C�n"}}},
			[25] = {item={{gdp={0,103,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"}}},
			[26] = {item={{gdp={0,103,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"}}},
			[27] = {item={{gdp={0,103,3186,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Qu�n"}}},
			[29] = {item={{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-T� V�n Ti�n T� Tr�m"}}},
			[30] = {item={{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Phi H� Ti�n T� Tr�m"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,103,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Qu�n"}}},
			[8] = {item={{gdp={0,103,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t V�n Th�nh C� Tr�m"}}},
			[9] = {item={{gdp={0,103,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t Tr�n Th�nh C� Tr�m"}}},
			[11] = {item={{gdp={0,103,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i C�n"}}},
			[12] = {item={{gdp={0,103,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t C�n"}}},
			[14] = {item={{gdp={0,103,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Qu�n"}}},
			[15] = {item={{gdp={0,103,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Qu�n"}}},
			[17] = {item={{gdp={0,103,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Kh�i"}}},
			[18] = {item={{gdp={0,103,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Kh�i"}}},
			[20] = {item={{gdp={0,103,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n C�n"}}},
			[21] = {item={{gdp={0,103,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng C�n"}}},
			[25] = {item={{gdp={0,103,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n C�n"}}},
			[26] = {item={{gdp={0,103,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Qu�n"}}},
			[27] = {item={{gdp={0,103,3187,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Qu�n"}}},
			[29] = {item={{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-T� V�n Ti�n T� Tr�m"}}},
			[30] = {item={{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Phi H� Ti�n T� Tr�m"}}},
		}
	}
	local nBody = GetBody()
	LIB_Award:AwardByRoute(tbItem[nBody])
end


function ChiTonNew_AoDieuDuong()
	tbItem = {
		[1] = {
			[2] = {item={{gdp={0,100,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� N�n T�n Gi� B�o"}}},
			[4] = {item={{gdp={0,100,3130,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� Ki�p T�n Gi� B�o"}}},
			[3] = {item={{gdp={0,100,3132,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� �ch T�n Gi� B�o"}}},
			[6] = {item={{gdp={0,100,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Y"}}},
			[11] = {item={{gdp={0,100,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"}}},
			[12] = {item={{gdp={0,100,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Y"}}},
			[14] = {item={{gdp={0,100,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n B�o"}}},
			[15] = {item={{gdp={0,100,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n B�o"}}},
			[17] = {item={{gdp={0,100,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Gi�p"}}},
			[18] = {item={{gdp={0,100,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"}}},
			[20] = {item={{gdp={0,100,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Y"}}},
			[21] = {item={{gdp={0,100,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Y"}}},
			[23] = {item={{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�t ��ng Ch�n Ti�n B�o"}}},
			[25] = {item={{gdp={0,100,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"}}},
			[26] = {item={{gdp={0,100,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� B�o"}}},
			[27] = {item={{gdp={0,100,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng B�o"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,100,3129,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� N�n T�n Gi� B�o"}}},
			[4] = {item={{gdp={0,100,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� Ki�p T�n Gi� B�o"}}},
			[3] = {item={{gdp={0,100,3133,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� �ch T�n Gi� B�o"}}},
			[6] = {item={{gdp={0,100,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Y"}}},
			[11] = {item={{gdp={0,100,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"}}},
			[12] = {item={{gdp={0,100,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Y"}}},
			[14] = {item={{gdp={0,100,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n B�o"}}},
			[15] = {item={{gdp={0,100,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n B�o"}}},
			[17] = {item={{gdp={0,100,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Gi�p"}}},
			[18] = {item={{gdp={0,100,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"}}},
			[20] = {item={{gdp={0,100,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Y"}}},
			[21] = {item={{gdp={0,100,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Y"}}},
			[23] = {item={{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�t ��ng Ch�n Ti�n B�o"}}},
			[25] = {item={{gdp={0,100,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"}}},
			[26] = {item={{gdp={0,100,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� B�o"}}},
			[27] = {item={{gdp={0,100,3185,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng B�o"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,100,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Y"}}},
			[8] = {item={{gdp={0,100,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t V�n Th�nh C� Y"}}},
			[9] = {item={{gdp={0,100,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t Tr�n Th�nh C� Y"}}},
			[11] = {item={{gdp={0,100,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"}}},
			[12] = {item={{gdp={0,100,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Y"}}},
			[14] = {item={{gdp={0,100,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n B�o"}}},
			[15] = {item={{gdp={0,100,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n B�o"}}},
			[17] = {item={{gdp={0,100,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Gi�p"}}},
			[18] = {item={{gdp={0,100,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"}}},
			[20] = {item={{gdp={0,100,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Y"}}},
			[21] = {item={{gdp={0,100,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Y"}}},
			[25] = {item={{gdp={0,100,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"}}},
			[26] = {item={{gdp={0,100,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� B�o"}}},
			[27] = {item={{gdp={0,100,3186,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng B�o"}}},
			[29] = {item={{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-T� V�n Ti�n T� Y"}}},
			[30] = {item={{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Phi H� Ti�n T� Y"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,100,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Y"}}},
			[8] = {item={{gdp={0,100,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t V�n Th�nh C� Y"}}},
			[9] = {item={{gdp={0,100,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t Tr�n Th�nh C� Y"}}},
			[11] = {item={{gdp={0,100,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Y"}}},
			[12] = {item={{gdp={0,100,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Y"}}},
			[14] = {item={{gdp={0,100,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n B�o"}}},
			[15] = {item={{gdp={0,100,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n B�o"}}},
			[17] = {item={{gdp={0,100,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Gi�p"}}},
			[18] = {item={{gdp={0,100,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Gi�p"}}},
			[20] = {item={{gdp={0,100,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Y"}}},
			[21] = {item={{gdp={0,100,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Y"}}},
			[25] = {item={{gdp={0,100,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Y"}}},
			[26] = {item={{gdp={0,100,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� B�o"}}},
			[27] = {item={{gdp={0,100,3187,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng B�o"}}},
			[29] = {item={{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-T� V�n Ti�n T� Y"}}},
			[30] = {item={{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Phi H� Ti�n T� Y"}}},
		},
	}
	local nBody = GetBody()
	LIB_Award:AwardByRoute(tbItem[nBody])
end


function ChiTonNew_QuanDieuDuong()
	local tbItem = {
		[1] = {
			[2] = {item={{gdp={0,101,3128,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� N�n T�n Gi� Trang"}}},
			[4] = {item={{gdp={0,101,3130,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� Ki�p T�n Gi� Trang"}}},
			[3] = {item={{gdp={0,101,3132,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� �ch T�n Gi� Trang"}}},
			[6] = {item={{gdp={0,101,3134,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Trang"}}},
			[11] = {item={{gdp={0,101,3142,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"}}},
			[12] = {item={{gdp={0,101,3146,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Trang"}}},
			[14] = {item={{gdp={0,101,3150,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Trang"}}},
			[15] = {item={{gdp={0,101,3154,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Trang"}}},
			[17] = {item={{gdp={0,101,3158,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Trang"}}},
			[18] = {item={{gdp={0,101,3162,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"}}},
			[20] = {item={{gdp={0,101,3166,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Trang"}}},
			[21] = {item={{gdp={0,101,3170,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Trang"}}},
			[23] = {item={{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"}}},
			[25] = {item={{gdp={0,101,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"}}},
			[26] = {item={{gdp={0,101,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Trang"}}},
			[27] = {item={{gdp={0,101,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Trang"}}},
		},
		[2] = {
			[2] = {item={{gdp={0,101,3129,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� N�n T�n Gi� Trang"}}},
			[4] = {item={{gdp={0,101,3131,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� Ki�p T�n Gi� Trang"}}},
			[3] = {item={{gdp={0,101,3133,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� �ch T�n Gi� Trang"}}},
			[6] = {item={{gdp={0,101,3135,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Trang"}}},
			[11] = {item={{gdp={0,101,3143,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"}}},
			[12] = {item={{gdp={0,101,3147,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Trang"}}},
			[14] = {item={{gdp={0,101,3151,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Trang"}}},
			[15] = {item={{gdp={0,101,3155,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Trang"}}},
			[17] = {item={{gdp={0,101,3159,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Trang"}}},
			[18] = {item={{gdp={0,101,3163,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"}}},
			[20] = {item={{gdp={0,101,3167,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Trang"}}},
			[21] = {item={{gdp={0,101,3171,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Trang"}}},
			[23] = {item={{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�t ��ng Ch�n Ti�n Trang"}}},
			[25] = {item={{gdp={0,101,3177,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"}}},
			[26] = {item={{gdp={0,101,3181,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Trang"}}},
			[27] = {item={{gdp={0,101,3185,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Trang"}}},
		},
		[3] = {
			[6] = {item={{gdp={0,101,3136,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Trang"}}},
			[8] = {item={{gdp={0,101,3138,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"}}},
			[9] = {item={{gdp={0,101,3140,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"}}},
			[11] = {item={{gdp={0,101,3144,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"}}},
			[12] = {item={{gdp={0,101,3148,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Trang"}}},
			[14] = {item={{gdp={0,101,3152,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Trang"}}},
			[15] = {item={{gdp={0,101,3156,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Trang"}}},
			[17] = {item={{gdp={0,101,3160,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Trang"}}},
			[18] = {item={{gdp={0,101,3164,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"}}},
			[20] = {item={{gdp={0,101,3168,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Trang"}}},
			[21] = {item={{gdp={0,101,3172,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Trang"}}},
			[25] = {item={{gdp={0,101,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"}}},
			[26] = {item={{gdp={0,101,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Trang"}}},
			[27] = {item={{gdp={0,101,3186,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Trang"}}},
			[29] = {item={{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-T� V�n Ti�n T� Qu�n"}}},
			[30] = {item={{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Phi H� Ti�n T�"}}},
		},
		[4] = {
			[6] = {item={{gdp={0,101,3137,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Trang"}}},
			[8] = {item={{gdp={0,101,3139,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t V�n Th�nh C� Qu�n"}}},
			[9] = {item={{gdp={0,101,3141,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t Tr�n Th�nh C� Qu�n"}}},
			[11] = {item={{gdp={0,101,3145,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Trang"}}},
			[12] = {item={{gdp={0,101,3149,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t Trang"}}},
			[14] = {item={{gdp={0,101,3153,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n Trang"}}},
			[15] = {item={{gdp={0,101,3157,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n Trang"}}},
			[17] = {item={{gdp={0,101,3161,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Trang"}}},
			[18] = {item={{gdp={0,101,3165,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Trang"}}},
			[20] = {item={{gdp={0,101,3169,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n Trang"}}},
			[21] = {item={{gdp={0,101,3173,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Trang"}}},
			[25] = {item={{gdp={0,101,3179,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n Trang"}}},
			[26] = {item={{gdp={0,101,3183,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� Trang"}}},
			[27] = {item={{gdp={0,101,3187,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Trang"}}},
			[29] = {item={{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-T� V�n Ti�n T� Qu�n"}}},
			[30] = {item={{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Phi H� Ti�n T�"}}},
		},
	}
	local nBody = GetBody()
	LIB_Award:AwardByRoute(tbItem[nBody])
end


function ChiTonNew_VuKhiDieuDuong()
	local tbItem = {
		[2] = {item={{gdp={0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� N�n T�n Gi� Ph�t �ao"}}},
		[4] = {item={{gdp={0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� Ki�p T�n Gi� Ph�t Th�"}}},
		[3] = {item={{gdp={0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-�� �ch T�n Gi� Ph�t Tr��ng"}}},
		[6] = {item={{gdp={0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V�n Ki�p Th�nh Th� Tr�m"}}},
		[8] = {item={{gdp={0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t V�n Th�nh C� Li�n Ki�m"}}},
		[9] = {item={{gdp={0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ph�t Tr�n Th�nh C� C�m"}}},
		[11] = {item={{gdp={0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Tr�c Ph�ng Thi�n C�i Th�"}}},
		[12] = {item={{gdp={0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Du Long ��a Kh�t C�n"}}},
		[14] = {item={{gdp={0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-V� C�c Thi�n T�n T�c Ki�m"}}},
		[15] = {item={{gdp={0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�ch L�c Thi�n T�n B�t"}}},
		[17] = {item={{gdp={0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�m Thi�n ��u H�n Th��ng"}}},
		[18] = {item={{gdp={0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-��nh Thi�n Th�n Ngh� Cung"}}},
		[20] = {item={{gdp={0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Qu� X�c T� Th�n �ao"}}},
		[21] = {item={{gdp={0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Vu C�t ��c V��ng Tr�o"}}},
		[23] = {item={{gdp={0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-B�t ��ng Ch�n Ti�n Ki�m"}}},
		[25] = {item={{gdp={0,3,9007,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Nh�c Huy�t Cu�ng Chi�n �ao"}}},
		[26] = {item={{gdp={0,9,9008,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-C�u Thi�n Qu� Ph� B�t"}}},
		[27] = {item={{gdp={0,11,9009,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Ma �nh Th�n T�ng Tr�o"}}},
		[29] = {item={{gdp={0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-T� V�n Ti�n T� Phi�n"}}},
		[30] = {item={{gdp={0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-Phi H� Ti�n T� �u Lan Ti�u"}}},
	}
	LIB_Award:AwardByRoute(tbItem)
end


function ChiTonNew_HoanThanhPS1Part1()
	SetTask(TSK_CS6_COUNTA, 1501503030)
	SetTask(TSK_CS6_COUNTB, 1601503030)
	SetTask(TSK_CS6_TULINH,2)
	TaskTip("Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
end


function GetOnlineTime()
	if GetTask(IP_ONLINE_TIME) > IP_TIME_LIMIT then
		SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)
	end
	return GetTask(IP_ONLINE_TIME);
end


function SetOnlineTime(nSec,nType)
	if nType == 1 then
		if GetOnlineTime() + nSec < IP_TIME_LIMIT then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() + nSec)
		else
			SetTask(IP_ONLINE_TIME, IP_TIME_LIMIT)
		end	
	elseif nType == 2 then
		if GetTask(IP_ONLINE_TIME) - nSec >= 0 then
			SetTask(IP_ONLINE_TIME, GetOnlineTime() - nSec)
		end
	end
	return GetTask(IP_ONLINE_TIME);
end


function ChiTonNew_HoTroServerMoi()
	local nIndex = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT)*100 + GetLevel()
	if nIndex < 191 then
		Talk(1,"","Ta ch� h� tr� n�u c�c h� �� chuy�n sinh 1 c�p �� 91 tr� l�n. H�y c� g�ng th�m nh�.")
		return 0
	end
	if ChiTonNew_CheckNewServer() ~= 1 then
		Talk(1,"","�i�u ki�n nh�n th��ng kh�ng ph� h�p. H�y xem l�i qu�c t�ch ho�c �i�u ki�n k�ch ho�t Ch� T�n V��ng L�nh.")
		return 0
	end
	if gf_GetTaskBit(TSK_CHITONNEW3, 8) ~= 0 then
		Talk(1,"","Ph�n th��ng h�m nay �� ���c nh�n, ng��i h�y quay l�i sau nh�.")
		return 0
	end
	if GetOnlineTime() < 2*3600 then
		Talk(1,"","T�ch l�y online ch�a �� 2 gi�..")
		return 0
	end
	local tbAward = {nGold = 120000}
	local nBachCau1, nTamThanh1, nLucThan1, nTuLinh1 = 120, 120, 120, 120
	SetTask(2501, GetTask(2501) + nBachCau1)
	EatSanqin(1,120)
	EatLiushen(1,nLucThan1)
	SetTask(3105, GetTask(3105) + nTuLinh1, 8)
	LIB_Award:Award(tbAward)
	SetOnlineTime(2*3600,2)
	gf_SetTaskBit(TSK_CHITONNEW3,8,1,0)
end