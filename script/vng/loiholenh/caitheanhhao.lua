Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\platinum_card\\platinum_head.lua");

szLogTitle = "LOI HO LENH - CAI THE ANH HAO"
szLogAction = "nh�n"
LIB_Award.szLogTitle = szLogTitle
LIB_Award.LogAction = szLogAction

tbDieuKien = {
	[74] = {nQuancong = 50000, nDanhvong = 3000, nSumon = 4000},
	[75] = {nQuancong = 50000, nDanhvong = 3000, nSumon = 4000},
	[76] = {nQuancong = 50000, nDanhvong = 3000, nSumon = 4000},
	[77] = {nQuancong = 50000, nDanhvong = 5000, nSumon = 5000},
	[78] = {nQuancong = 55000, nDanhvong = 5000, nSumon = 5000},
	[79] = {nQuancong = 55000, nDanhvong = 5000, nSumon = 5000},
	[80] = {nQuancong = 60000, nDanhvong = 6000, nSumon = 6000},
	[81] = {nQuancong = 65000, nDanhvong = 7000, nSumon = 7000},
	[82] = {nQuancong = 70000, nDanhvong = 8000, nSumon = 8000},
	[83] = {nQuancong = 75000, nDanhvong = 9000, nSumon = 9000},
	[84] = {nQuancong = 80000, nDanhvong = 10000, nSumon = 10000},
	[85] = {nQuancong = 80000, nDanhvong = 10000, nSumon = 10000},
	[86] = {nQuancong = 81000, nDanhvong = 10500, nSumon = 10500},
	[87] = {nQuancong = 82000, nDanhvong = 11000, nSumon = 11000},
	[88] = {nQuancong = 100000, nDanhvong = 12000, nSumon = 12000},
	[89] = {nQuancong = 100000, nDanhvong = 13500, nSumon = 13500},
	[90] = {nQuancong = 100000, nDanhvong = 15000, nSumon = 15000},
	[91] = {nQuancong = 150000, nDanhvong = 15500, nSumon = 15500},
	[92] = {nQuancong = 150000, nDanhvong = 15500, nSumon = 15500},
	[93] = {nQuancong = 175000, nDanhvong = 15500, nSumon = 15500},
	[94] = {nQuancong = 200000, nDanhvong = 15500, nSumon = 15500},
	[95] = {nQuancong = 250000, nDanhvong = 18000, nSumon = 18000},
	[96] = {nQuancong = 275000, nDanhvong = 20000, nSumon = 20000},
	[97] = {nQuancong = 300000, nDanhvong = 21000, nSumon = 21000},
	[98] = {nQuancong = 320000, nDanhvong = 21000, nSumon = 21000},
	[99] = {nQuancong = 390000, nDanhvong = 26000, nSumon = 26000},
	[696] = {nQuancong = 700000, nDanhvong = 30000, nSumon = 30000},
}

tbMaterial = {
	[81] = {nExp = 15000000, nDanhvong = 300, nSumon = 300},
	[86] = {nExp = 20000000, nDanhvong = 300, nSumon = 300},
	[88] = {nExp = 30000000, nDanhvong = 300, nSumon = 300},
	[90] = {nExp = 50000000, nDanhvong = 300, nSumon = 300},
	[93] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu V�t Ph�m"}}},
	[94] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu V�t Ph�m"}}},
	[95] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu V�t Ph�m"}}},
	[96] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu V�t Ph�m"}}},
	[97] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu V�t Ph�m"}}},
	[98] = {nExp = 100000000, nDanhvong = 1000, nSumon = 1000, item={{gdp={2,1,30230,1000}, name="Xu V�t Ph�m"}}},
	[99] = {nExp = 2000000000, item={{gdp={2,1,1001,2}, name="H�a Th� B�ch"}, {gdp={2,1,30490,2}, name="Ho�ng Kim ��i Ng�n Phi�u"}, {gdp={2,1,30344,2}, name="Th�n T�i B�o R��ng"}, {gdp={2,1,504,2}, name="N� Oa Tinh Th�ch"}}},
	[696] = {nExp = 3000000000, item={{gdp={2,1,1001,3}, name="H�a Th� B�ch"}, {gdp={2,1,30490,3}, name="Ho�ng Kim ��i Ng�n Phi�u"}, {gdp={2,1,30344,3}, name="Th�n T�i B�o R��ng"}, {gdp={2,1,504,3}, name="N� Oa Tinh Th�ch"}}},
}

tbAwardByLevel = {
	[74] = {item={
				{gdp={2,0,553,3}, name="��i Nh�n s�m", nExpired = 7*24*3600},
				{gdp={2,0,554,15}, name="Tu Ch�n Y�u Quy�t", nExpired = 7*24*3600},
				{gdp={0,107,64,1}, name="Thi�n H� M�t t�ch"},
				{gdp={0,107,65,1}, name="T� H� M�t t�ch"},
				{gdp={0,107,66,1}, name="Chi�m Y Ph�"},
				{gdp={0,107,60,1}, name="Tu La M�t T�ch"},
				{gdp={0,107,59,1}, name="Kim Thi�n Ph�"},
				{gdp={0,107,61,1}, name="B� Th�ch M�t T�ch"},
				{gdp={0,107,62,1}, name="B� Kim M�t T�ch"},
	}},
	[75] = {item={{gdp={2,1,9977,7}, name="Qu�n C�ng Huy Ho�ng", nExpired = 7*24*3600},},
			fn="NgoaiTrangDoThong()",
	},
	[76] = {item={
				{gdp={2,2,7,100}, name="M�nh Thi�n Th�ch"},
				{gdp={2,2,8,100}, name="Thi�n Th�ch"},
	}},
	[77] = {fn="TraoThuongUngDoThong(100);TraoThuongUngDoThong(101);TraoThuongUngDoThong(103);PhongThuongLenh()"},
	[78] = {fn="NhanRuongYeuQuyet(3);MatTichSuMon45(3)"},
	[79] = {item={{gdp={2,1,30340,800}, name="M�c R��ng"}}, fn="MatTichSuMon70(3)"},
	[80] = {item={{gdp={2,0,554,15,4}, name="Tu Ch�n Y�u Quy�t", nExpired = 7*24*3600}},
			fn="MatTichSuMon70CaoCap(3);KichHoatKinhMach(1);",
	},
	[81] = {item={{gdp={2,1,1068,1}, name="Thi�n Th�ch Linh Th�ch", nExpired = 15*24*3600}}},
	[82] = {fn="ThuongUngTienPhong(1)"},
	[83] = {fn="ThuongUngTienPhong(2)"},
	[84] = {fn="MatTichTranPhai()"},
	[85] = {item={{gdp={2,1,30369,88}, name="C� Linh Ng�c"}, {gdp={2,1,30368,88}, name="C� Linh Th�ch"}}},
	[86] = {item={{gdp={2,1,1068,1}, name="Thi�n Th�ch Linh Th�ch", nExpired = 15*24*3600}}, fn="MatTichSuMon70CaoCap(3);"},
	[87] = {item={{gdp={2,1,30408,3}, name="Thi�n Huy�n Kh�c B�n c�p 3"}, {gdp={2,1,30491,7}, name="V� Ti�u Y V�ng", nExpired = 15*24*3600}}},
	[88] = {item={{gdp={2,1,1067,1}, name="��nh H�n Thi�n Th�ch Th�n Th�ch", nExpired = 15*24*3600}}},
	[89] = {item={{gdp={2,1,30497,500}, name="Ma Tinh"}}},
	[90] = {item={{gdp={2,1,1113,1}, name="��i ��nh H�n", nExpired = 15*24*3600}}, fn="KichHoatKinhMach(2);"},
	[91] = {item={{gdp={2,1,1009,44}, name="Thi�n Th�ch Tinh Th�ch"}}},
	[92] = {item={{gdp={0,112,78,3}, name="L�ng Ba Vi B�"}}, nChankhi = 77000},
	[93] = {item={{gdp={2,1,1067,1}, name="��nh H�n Thi�n Th�ch Th�n Th�ch", nExpired = 15*24*3600}}},
	[94] = {item={{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n", nExpired = 60*24*3600}}, fn="NonDieuDuong();"},
	[95] = {item={{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n", nExpired = 60*24*3600}}, fn="AoDieuDuong();"},
	[96] = {item={{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n", nExpired = 60*24*3600}, {gdp={2,1,504,11}, name="N� Oa Tinh Th�ch", nExpired = 15*24*3600}}},
	[97] = {item={{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n", nExpired = 60*24*3600}}, fn="QuanDieuDuong();"},
	[98] = {item={{gdp={2,1,1113,1}, name="��i ��nh H�n", nExpired = 15*24*3600}}},
	[99] = {item={
				{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n", nExpired = 60*24*3600},
				{gdp={2,1,30523,77}, name="C�p 3 T�y T�m Th�ch"},
				{gdp={2,1,30529,77}, name="C�p 3 Luy�n L� Thi�t"},
				{gdp={2,1,30535,111}, name="Thi�t Tinh c�p 3"},
				{gdp={0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng �m Ch� ng� h�nh"},
				{gdp={0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng �m Ch� ng� h�nh"},
				{gdp={0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i �m Ch� ng� h�nh"},
				{gdp={2,1,30497,200}, name="Ma Tinh"},
				{gdp={2,1,1068,1}, name="Thi�n Th�ch Linh Th�ch", nExpired = 15*24*3600},
				{gdp={2,1,1067,2}, name="��nh H�n Thi�n Th�ch Th�n Th�ch", nExpired = 15*24*3600},
			},
			fn="DanhHieuCaiTheAnhHao()",
	},
	[696] ={item={
				{gdp={0,105,30024,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Lam Mao Ng�u B�o B�o"},
				{gdp={0,102,3176,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng- � L�n B�o Gi�i"},
				{gdp={0,102,3178,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng- T� Giao Ng�c B�i"},
				{gdp={0,102,3180,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng-  V�n H� L�nh"},
				{gdp={0,102,3182,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng- X�ch T��c Ho�n"},
				{gdp={0,102,3184,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Di�u D��ng- B�ch Quy Li�n"},
			},
			nChankhi = 100000,
			fn="VuKhiDieuDuong(); KichHoatKinhMach(3); DanhHieuChienCuong();",
	},
}

tbAwardIndex = {
	-- Level, Slot, Weight
	[1] = {74, 26, 100},
	[2] = {75, 9, 100},
	[3] = {76, 3, 300},
	[4] = {77, 5, 300},
	[5] = {78, 20, 100},
	[6] = {79, 5, 100},
	[7] = {80, 20, 100},
	[8] = {81, 2, 100},
	[9] = {82, 2, 100},
	[10] = {83, 2, 100},
	[11] = {84, 2, 100},
	[12] = {85, 3, 100},
	[13] = {86, 5, 100},
	[14] = {87, 9, 100},
	[15] = {88, 2, 100},
	[16] = {89, 2, 100},
	[17] = {90, 2, 100},
	[18] = {91, 2, 100},
	[19] = {92, 4, 100},
	[20] = {93, 2, 100},
	[21] = {94, 3, 100},
	[22] = {95, 3, 100},
	[23] = {96, 13, 100},
	[24] = {97, 3, 100},
	[25] = {98, 2, 100},
	[26] = {99, 23, 100},
	[27] = {696, 8, 100},
}

function LHL_menu_award()
	local tbSay = {};
	tbSay[0] = "Nh�n th��ng C�i Th� Anh H�o theo ��ng c�p:"
	local nCurrentIndex = VNG_GetTaskPos(TSK_BKLB_FLAG, 2,1)
	for i = (nCurrentIndex+1), getn(tbAwardIndex) do
		if tbAwardIndex[i] ~= nil then
			local nLevel = mod(tbAwardIndex[i][1],100)
			local szPhucsinh = ""
			if tbAwardIndex[i][1] > 100 then
				szPhucsinh = "Ph�c Sinh "
			end
			tinsert(tbSay, "Nh�n ph�n th��ng "..szPhucsinh.."c�p �� "..nLevel.."/#CaiTheAnhHao_LevelAward("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function CaiTheAnhHao_LevelAward(nAwardIndex)
	if tbAwardIndex[nAwardIndex] == nil then
		return 0
	end
	local nChuyenSinh = gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) + GetPlayerRebornParam(0)
	local nLevel = nChuyenSinh*100 + GetLevel()
	local nIndex = tbAwardIndex[nAwardIndex][1]
	local nCurrentIndex = VNG_GetTaskPos(TSK_BKLB_FLAG, 2,1)

	if CheckActivatedExt_BKL() ~= 1 then
		Talk(1,"","C�c h� kh�ng ph�i C�i Th� Anh H�o, kh�ng th� nh�n ph�n th��ng n�y.")
		return 0
	end
	
	if nLevel < nIndex then
		Talk(1,"","��ng c�p c�c h� ch�a �� nh�n th��ng.")
		return 0
	end
	
	if gf_Check55MaxSkill() == 0 then
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: V� c�ng h� ph�i ch�a h�c ��y ��, kh�ng th� nh�n th��ng.");
		return
	end
	
	if (nCurrentIndex + 1) < nAwardIndex then
		Talk(1,"","C�c h� ch�a nh�n ph�n th��ng tr��c n�n kh�ng th� nh�n ph�n th��ng n�y..")
		return 0
	end
	
	if VNG_GetTaskPos(TSK_BKLB_FLAG,2,1) >= nAwardIndex then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbDieuKien[nIndex])
	if nCheck == 0 then
		return 0
	end
	
	if tbMaterial[nIndex] ~= nil then
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
		if nCheck == 0 then
			return 0
		end
	end
	
	if gf_JudgeRoomWeight(tbAwardIndex[nAwardIndex][2],tbAwardIndex[nAwardIndex][3],"") == 0 then
		Talk(1,"","H�nh trang c�n <color=yellow>".. tbAwardIndex[nAwardIndex][2] .."<color> � tr�ng, <color=yellow>".. tbAwardIndex[nAwardIndex][3] .."<color> �� n�ng, vui l�ng s�p x�p l�i")
		return 0
	end
	--================= Trao thuong ================
	if tbMaterial[nIndex] ~= nil then
		LIB_Award:PayMaterial(tbMaterial[nIndex])
	end
	VNG_SetTaskPos(TSK_BKLB_FLAG, nAwardIndex, 2,1)
	LIB_Award:Award(tbAwardByLevel[nIndex])
	Talk(1,"","C�c h�n �� nh�n th�nh c�ng ph�n th��ng C�i Th� Anh H�o ��ng c�p "..nIndex..".")
end


function VukhiDieuDuong()
	local tbVukhiDieuDuong = {
		[2]={item={{gdp={0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� N�n T�n Gi� Ph�t �ao"}}},
		[4]={item={{gdp={0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� Ki�p T�n Gi� Ph�t Th�"}}},
		[3]={item={{gdp={0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-�� �ch T�n Gi� Ph�t Tr��ng"}}},
		[6]={item={{gdp={0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V�n Ki�p Th�nh Th� Tr�m"}}},
		[8]={item={{gdp={0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t V�n Th�nh C� Li�n Ki�m"}}},
		[9]={item={{gdp={0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Ph�t Tr�n Th�nh C� C�m"}}},
		[11]={item={{gdp={0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Tr�c Ph�ng Thi�n C�i Th�"}}},
		[12]={item={{gdp={0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Du Long ��a Kh�t C�n"}}},
		[14]={item={{gdp={0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-V� C�c Thi�n T�n T�c Ki�m"}}},
		[15]={item={{gdp={0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�ch L�c Thi�n T�n B�t"}}},
		[17]={item={{gdp={0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-C�m Thi�n ��u H�n Th��ng"}}},
		[18]={item={{gdp={0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-��nh Thi�n Th�n Ngh� Cung"}}},
		[20]={item={{gdp={0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Qu� X�c T� Th�n �ao"}}},
		[21]={item={{gdp={0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Vu C�t ��c V��ng Tr�o"}}},
		[23]={item={{gdp={0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-B�t ��ng Ch�n Ti�n Ki�m"}}},
		[29]={item={{gdp={0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-T� V�n Ti�n T� Phi�n"}}},
		[30]={item={{gdp={0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Di�u D��ng-Phi H� Ti�n T� �u Lan Ti�u"}}},
	}
	LIB_Award:AwardByRoute(tbVukhiDieuDuong)
end


function HoTroPhucSinh()
	if GetTask(TSK_CS6_TULINH) == 1 then
		SetTask(TSK_CS6_TULINH,2)
		TaskTip("Ta �� truy�n th� ph�n ��u c�a b� k�p T� Linh Ph�c Sinh cho ��i hi�p r�i, b�y gi� ��i hi�p h�y �i t�m Vi�n Quan Tho�i Nhi�m �� l�nh gi�o ph�n c�n l�i !!!!")
	end
end

-- Check level skill tr�n ph�i
function TopCheckSkill(nSkillLevel)
	tb_Skill_ID = {
		[0] = 0,
		[1] = 0,
		[2] = 32,
		[3] = 57,
		[4] = 44,
		[5] = 0,
		[6] = 74,
		[7] = 0,
		[8] = 89,
		[9] = 102,
		[10] = 0,
		[11] = 113,
		[12] = 124,
		[13] = 0,
		[14] = 146,
		[15] = 159,
		[16] = 0,
		[17] = 732,
		[18] = 745,
		[19] = 0,
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
	}
	local nRoute = GetPlayerRoute();
	local nSkillID = tb_Skill_ID[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= nSkillLevel then
			return 1
		else
			return 0
		end;
	end;
end;


function MatTichSuMon70(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,166, nQty}, name="Kim Cang B�t Nh� Kinh"}}},
		[4] = {item={{gdp={0,107,167, nQty}, name="Ti�m Long T�ch Di�t Kinh"}}},
		[3] = {item={{gdp={0,107,168, nQty}, name="V� Tr�n B� �� Kinh"}}},
		[6] = {item={{gdp={0,107,169, nQty}, name="Thi�n La Li�n Ch�u L�c"}}},
		[8] = {item={{gdp={0,107,170, nQty}, name="Nh� � Kim ��nh M�t T�ch"}}},
		[9] = {item={{gdp={0,107,171, nQty}, name="B�ch H�i Tuy�t �m Ph�"}}},
		[11] = {item={{gdp={0,107,172, nQty}, name="H�n ��n Tr�n Nh�c M�t T�ch"}}},
		[12] = {item={{gdp={0,107,173, nQty}, name="Qu� Thi�n Du Long M�t T�ch"}}},
		[14] = {item={{gdp={0,107,174, nQty}, name="Huy�n �nh M� Tung M�t T�ch"}}},
		[15] = {item={{gdp={0,107,175, nQty}, name="Qu�n T� Ti�t Phong M�t T�ch"}}},
		[17] = {item={{gdp={0,107,176, nQty}, name="Tr�n Qu�n Phi Long Th��ng Ph�"}}},
		[18] = {item={{gdp={0,107,177, nQty}, name="Xuy�n V�n L�c H�ng M�t T�ch"}}},
		[20] = {item={{gdp={0,107,178, nQty}, name="U Minh Phong Ma L�c"}}},
		[21] = {item={{gdp={0,107,179, nQty}, name="Linh C� Huy�n T� L�c"}}},
		[23] = {item={{gdp={0,107,198, nQty}, name="C�u Thi�n Phong L�i Quy�t"}}},
		[29] = {item={{gdp={0,107,202, nQty}, name="H�ng Tr�n T�y M�ng Ph�"}}},
		[30] = {item={{gdp={0,107,203, nQty}, name="Phong Hoa Thi�n Di�p Ph�"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end


function MatTichSuMon70CaoCap(nQty)
	local tbMatTich = {
		[2] = {item={{gdp={0,107,204, nQty}, name ="Kim Cang B�t Nh� Ch�n Quy�n"}}},
		[4] = {item={{gdp={0,107,205, nQty}, name ="Ti�m Long T�c Di�t Ch�n Quy�n"}}},
		[3] = {item={{gdp={0,107,206, nQty}, name ="V� Tr�n B� �� Ch�n Quy�n"}}},
		[6] = {item={{gdp={0,107,207, nQty}, name ="Thi�n La Li�n Ch�u Ch�n Quy�n"}}},
		[8] = {item={{gdp={0,107,208, nQty}, name ="Nh� � Kim ��nh Ch�n Quy�n"}}},
		[9] = {item={{gdp={0,107,209, nQty}, name ="B�ch H�i Tuy�t �m Ch�n Quy�n"}}},
		[11] = {item={{gdp={0,107,210, nQty}, name ="H�n ��n Tr�n Nh�c Ch�n Quy�n"}}},
		[12] = {item={{gdp={0,107,211, nQty}, name ="Qu� Thi�n Du Long Ch�n Quy�n"}}},
		[14] = {item={{gdp={0,107,212, nQty}, name ="Huy�n �nh M� T�ng Ch�n Quy�n"}}},
		[15] = {item={{gdp={0,107,213, nQty}, name ="Qu�n T� ��i Phong Ch�n Quy�n"}}},
		[17] = {item={{gdp={0,107,214, nQty}, name ="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"}}},
		[18] = {item={{gdp={0,107,215, nQty}, name ="Xuy�n V�n L�c H�ng Ch�n Quy�n"}}},
		[20] = {item={{gdp={0,107,216, nQty}, name ="Huy�n Minh Phong Ma Ch�n Quy�n"}}},
		[21] = {item={{gdp={0,107,217, nQty}, name ="Linh C� Huy�n T� Ch�n Quy�n"}}},
		[23] = {item={{gdp={0,107,218,nQty}, name ="C�u Thi�n Phong L�i Ch�n Quy�n"}}},
		[29] = {item={{gdp={0,107,222,nQty}, name ="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}},
		[30] = {item={{gdp={0,107,223,nQty}, name ="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}},
	}
	LIB_Award:AwardByRoute(tbMatTich)
end


function KichHoatKinhMach(nMeridianLevel)
	local nCurrentLevel = MeridianGetLevel() + 1
	for i=nCurrentLevel, nMeridianLevel do
		MeridianUpdateLevel()
	end
end


function ThuongUngTienPhong(nOption)
	local tbThuongUngTienPhong = {
		Tong = {
			[1] = {
				[1] = {item={{gdp={0,102,30044,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30048,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u Ph�"}}},
			},
			[2] = {
				[1] = {item={{gdp={0,102,30045,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30049,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u Ph�"}}},
			},
			[3] = {
				[1] = {item={{gdp={0,102,30046,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30050,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u Ph�"}}},
			},
			[4] = {
				[1] = {item={{gdp={0,102,30047,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30051,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng T�ng Ti�n Phong Hi�u Ph�"}}},
			},
		},
		Lieu = {
			[1] = {
				[1] = {item={{gdp={0,102,30080,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30084,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u Ph�"}}},
			},
			[2] = {
				[1] = {item={{gdp={0,102,30081,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30085,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u Ph�"}}},
			},
			[3] = {
				[1] = {item={{gdp={0,102,30082,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30086,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u Ph�"}}},
			},
			[4] = {
				[1] = {item={{gdp={0,102,30083,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u K�"}}},
				[2] = {item={{gdp={0,102,30087,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Th��ng �ng Li�u Ti�n Phong Hi�u Ph�"}}},
			},
		},
	}
	local szPhe = "Tong"
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	local nBody = GetBody()
	LIB_Award:Award(tbThuongUngTienPhong[szPhe][nBody][nOption])
end


function MatTichTranPhai()
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


function NonDieuDuong()
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


function AoDieuDuong()
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


function QuanDieuDuong()
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


function VuKhiDieuDuong()
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


function DanhHieuCaiTheAnhHao()
	AddTitle(22, 12)
	SetTitleTime(22, 12, GetTime() + 30*24*3600)
	SetCurTitle(22, 12)
end


function DanhHieuChienCuong()
	AddTitle(65, 3)
	SetTitleTime(65, 3, GetTime() + 30*24*3600)
	SetCurTitle(65, 3)
end


function TraoThuongUngDoThong(nGenre)
	local szItemName = "Th��ng �ng �� Th�ng "
	local nID = 30028
	local szPhe = "T�ng "
	if GetTask(701) < 0 then
		nID = 30040
		szPhe = "Li�u "
	end
	if nGenre == 100 then
		szItemName = szPhe .. szItemName .. "Gi�p"
	elseif nGenre == 101 then
		szItemName = szPhe .. szItemName .. "Trang"
	elseif nGenre == 103 then
		szItemName = szPhe .. szItemName .. "Kh�i"
	end
	local nBody = GetBody()
	local tbAward = {item = {{gdp={0,nGenre,nID+nBody,1,1,-1,-1,-1,-1,-1,-1,-1,10}, name = szItemName}}}
	LIB_Award:Award(tbAward)
end


function PhongThuongLenh()
	local tbAward = {
		[1] = {item={{gdp={2,1,9988,1}, name="Phong th��ng l�nh_T�ng (�� Th�ng)", nExpired = 30*24*3600}}},
		[2] = {item={{gdp={2,1,9987,1}, name="Phong th��ng l�nh_Li�u (�� Th�ng)", nExpired = 30*24*3600}}},
	}
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	LIB_Award:Award(tbAward[nPhe])
end


function NgoaiTrangDoThong()
	local tbAward = {
		Tong = {
			[1] = {item={{gdp={0,109,992,1}, name="T�ng qu�n trang(Nam ti�u chu�n)", nExpired = 60*24*3600}}},
			[2] = {item={{gdp={0,109,993,1}, name="T�ng qu�n trang (Nam Kh�i ng�)", nExpired = 60*24*3600}}},
			[3] = {item={{gdp={0,109,994,1}, name="T�ng qu�n trang (N� g�i c�m )", nExpired = 60*24*3600}}},
			[4] = {item={{gdp={0,109,995,1}, name="T�ng qu�n trang (Ki�u n� )", nExpired = 60*24*3600}}},
		},
		Lieu = {
			[1] = {item={{gdp={0,109,996,1}, name="Li�u qu�n trang(Nam ti�u chu�n)", nExpired = 60*24*3600}}},
			[2] = {item={{gdp={0,109,997,1}, name="Li�u qu�n trang (Nam Kh�i ng�)", nExpired = 60*24*3600}}},
			[3] = {item={{gdp={0,109,998,1}, name="Li�u qu�n trang (N� g�i c�m )", nExpired = 60*24*3600}}},
			[4] = {item={{gdp={0,109,999,1}, name="Li�u qu�n trang (Ki�u n� )", nExpired = 60*24*3600}}},
		},
	}
	local szPhe = "Tong"
	if GetTask(701) < 0 then
		szPhe = "Lieu"
	end
	LIB_Award:AwardByBody(tbAward[szPhe])
end


function NhanRuongYeuQuyet(nQty)
	local tbRuongYeuQuyet = {
		[2] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m"}}},
		[4] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m"}}},
		[3] = {item={{gdp={2,0,607,1}, name="T�i b� ki�p Thi�u L�m"}}},
		[6] = {item={{gdp={2,0,608,1}, name="T�i b� ki�p ���ng M�n"}}},
		[8] = {item={{gdp={2,0,609,1}, name="T�i b� ki�p Nga My"}}},
		[9] = {item={{gdp={2,0,609,1}, name="T�i b� ki�p Nga My"}}},
		[11] = {item={{gdp={2,0,610,1}, name="T�i b� ki�p C�i Bang"}}},
		[12] = {item={{gdp={2,0,610,1}, name="T�i b� ki�p C�i Bang"}}},
		[14] = {item={{gdp={2,0,611,1}, name="T�i b� ki�p V� �ang"}}},
		[15] = {item={{gdp={2,0,611,1}, name="T�i b� ki�p V� �ang"}}},
		[17] = {item={{gdp={2,0,612,1}, name="T�i b� ki�p D��ng M�n"}}},
		[18] = {item={{gdp={2,0,612,1}, name="T�i b� ki�p D��ng M�n"}}},
		[20] = {item={{gdp={2,0,613,1}, name="T�i b� ki�p Ng� ��c"}}},
		[21] = {item={{gdp={2,0,613,1}, name="T�i b� ki�p Ng� ��c"}}},
		[23] = {fn="NhanBiKipConLon()"},
		[29] = {fn="NhanBiKipThuyYen()"},
		[30] = {fn="NhanBiKipThuyYen()"},
	}
	for i=1,nQty do
		LIB_Award:AwardByRoute(tbRuongYeuQuyet)
	end
end


function NhanBiKipConLon()
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
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipConLon)
	end
end


function NhanBiKipThuyYen()
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
	for i=1,5 do
		LIB_Award:AwardByRate(tbBiKipThuyYen)
	end
end


function MatTichSuMon45(nQty)
	local tbMatTich45 = {
		[0] = {
			[2] = {item={{gdp={0,107,1,1}, name="Kim Cang Ph�c Ma kinh"}}},
			[4] = {item={{gdp={0,107,3,1}, name="Ti�m Long M�t t�ch"}}},
			[3] = {item={{gdp={0,107,5,1}, name="V� Tr�n M�t t�ch"}}},
			[6] = {item={{gdp={0,107,7,1}, name="Thi�n La M�t T�ch"}}},
			[8] = {item={{gdp={0,107,9,1}, name="Nh� � M�t T�ch"}}},
			[9] = {item={{gdp={0,107,11,1}, name="B�ch H�i Ph�"}}},
			[11] = {item={{gdp={0,107,13,1}, name="H�n ��n M�t t�ch"}}},
			[12] = {item={{gdp={0,107,15,1}, name="Qu� Thi�n M�t t�ch"}}},
			[14] = {item={{gdp={0,107,17,1}, name="Huy�n �nh M�t t�ch"}}},
			[15] = {item={{gdp={0,107,19,1}, name="Qu�n T� M�t t�ch"}}},
			[17] = {item={{gdp={0,107,21,1}, name="Tr�n Qu�n M�t t�ch"}}},
			[18] = {item={{gdp={0,107,23,1}, name="Xuy�n V�n M�t t�ch"}}},
			[20] = {item={{gdp={0,107,25,1}, name="U Minh Qu� L�c"}}},
			[21] = {item={{gdp={0,107,27,1}, name="Linh C� M�t t�ch"}}},
			[23] = {item={{gdp={0,107,180,1}, name="Kinh Phong M�t T�ch"}}},
			[29] = {item={{gdp={0,107,188,1}, name="T�y M�ng M�t T�ch"}}},
			[30] = {item={{gdp={0,107,190,1}, name="Ph�n Hoa M�t T�ch"}}},
		},
		[1] = {
			[2] = {item={{gdp={0,107,2,1}, name="Kim Cang Ph�c Ma T�m Ph�p"}}},
			[4] = {item={{gdp={0,107,4,1}, name="Ti�m Long T�m Ph�p"}}},
			[3] = {item={{gdp={0,107,6,1}, name="V� Tr�n T�m Ph�p"}}},
			[6] = {item={{gdp={0,107,8,1}, name="Thi�n La T�m Ph�p"}}},
			[8] = {item={{gdp={0,107,10,1}, name="Nh� � T�m Ph�p"}}},
			[9] = {item={{gdp={0,107,12,1}, name="B�ch H�i T�m Ph�p"}}},
			[11] = {item={{gdp={0,107,14,1}, name="H�n ��n T�m Ph�p"}}},
			[12] = {item={{gdp={0,107,16,1}, name="Qu� Thi�n T�m Ph�p"}}},
			[14] = {item={{gdp={0,107,18,1}, name="Huy�n �nh T�m Ph�p"}}},
			[15] = {item={{gdp={0,107,20,1}, name="Qu�n T� T�m Ph�p"}}},
			[17] = {item={{gdp={0,107,22,1}, name="Tr�n Qu�n T�m Ph�p"}}},
			[18] = {item={{gdp={0,107,24,1}, name="Xuy�n V�n T�m Ph�p"}}},
			[20] = {item={{gdp={0,107,26,1}, name="U Minh T�m Ph�p"}}},
			[21] = {item={{gdp={0,107,28,1}, name="Linh C� T�m Ph�p"}}},
			[23] = {item={{gdp={0,107,181,1}, name="Kinh Phong T�m Ph�p"}}},
			[29] = {item={{gdp={0,107,189,1}, name="T�y M�ng T�m Ph�p"}}},
			[30] = {item={{gdp={0,107,191,1}, name="Ph�n Hoa T�m Ph�p"}}},
		},
	}
	for i = 1,nQty do
		local nIndex = mod(random(0,1000),2)
		LIB_Award:AwardByRoute(tbMatTich45[nIndex])
	end
end
