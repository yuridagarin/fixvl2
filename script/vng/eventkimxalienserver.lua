Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
-- Task 2660
szLogTitle = "EVENT KIM XA LIEN SERVER"
nMAXPOINT = 50000

tbBang = {
		taiviemdo9x  = {[8] = {"oAPiBo0mBo0mB52",1}},
		hklbthanhlong  = {[7] = {"zIngoclinhcocoIz",2}},
		giaosi1 = {[4] = {"SHPediXeDap",3}},
		caothanhhaihcm  = {[7] = {"1028zNhokQuay",4}},
		honghoatientu2007  = {[3] = {"iStttSiThoTrang",5}},
		truongthanhhung1976  = {[63] = {"ThienQuangVuong",6}},
		ccc4990  = {[16] = {"zzMotConChuot",7}},
		thuanlong0503  = {[12] = {"xxTHUANLONGxx",8}},
		maisang1618  = {[09] = {"zzzSANGzzz",9}},
		thttsk40  = {[22] = {"thienkiem1",10}},
	}
	
	
tbNguyenLieuNop = {
	[1] = {1, {item={{gdp={2,2,8,5}, name="Thi�n Th�ch"}}, nGold = 10000}, "05 Thi�n Th�ch + 01 v�ng (1 �i�m)"},
	[2] = {3, {item={{gdp={2,2,7,1}, name="M�nh Thi�n Th�ch"}}, nGold = 10000}, "01 M�nh Thi�n Th�ch + 01 v�ng (3 �i�m)"},
	[3] = {30, {item={{gdp={2,1,1009,1}, name="Thi�n Th�ch Tinh Th�ch"}}}, "01 Thi�n Th�ch Tinh Th�ch (30 �i�m)"},
	[4] = {900, {item={{gdp={2,1,1068,1}, name="Thi�n Th�ch Linh Th�ch"}}}, "01 Thi�n Th�ch Linh Th�ch (900 �i�m)"},
	[5] = {1000, {item={{gdp={2,1,1067,1}, name="��nh H�n Thi�n Th�ch Th�n Th�ch"}}}, "01 ��nh H�n Thi�n Th�ch Th�n Th�ch (1,000 �i�m)"},
	[6] = {1200, {item={{gdp={2,1,1113,1}, name="��i ��nh H�n"}}}, "01 ��i ��nh H�n (1,200 �i�m)"},
	[7] = {1, {item={{gdp={2,1,30390,1}, name="M�nh Thi�n Cang"}}, nGold = 10000}, "01 M�nh Thi�n Cang + 01 V�ng (1 �i�m)"},
	[8] = {700, {item={{gdp={2,95,204,1}, name="Thi�n Cang L�nh"}}}, "01 Thi�n Cang L�nh (700 �i�m)"},
	[9] = {600, {item={{gdp={2,1,30370,1}, name="Thi�n M�n Kim L�nh"}}}, "01 Thi�n M�n Kim L�nh (600 �i�m)"},
	[10] = {3, {item={{gdp={2,1,30410,1}, name="M�nh Thi�n M�n"}}, nGold = 10000}, "01 M�nh Thi�n M�n + 01 V�ng (3 �i�m)"},
	[11] = {160, {item={{gdp={0,112,78,1}, name="L�ng Ba Vi B�"}, {gdp={2,1,199,1}, name = "��i Ng�n Phi�u"}}}, "01 L�ng Ba Vi B� + 01 ��i Ng�n Phi�u (160 �i�m)"},
	[12] = {80, {item={{gdp={2,1,30164,39}, name="Nh�n"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 Nh�n + 19 xu v�t ph�m (80 �i�m)"},
	[13] = {80, {item={{gdp={2,1,30165,39}, name="Ch�m Ch�m"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 Ch�m Ch�m + 19 xu v�t ph�m (80 �i�m)"},
	[14] = {80, {item={{gdp={2,1,30166,39}, name="Cam"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 Cam + 19 xu v�t ph�m (80 �i�m)"},
	[15] = {80, {item={{gdp={2,1,30167,39}, name="D�a"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 D�a + 19 xu v�t ph�m (80 �i�m)"},
	[16] = {80, {item={{gdp={2,1,30168,39}, name="M�ng C�t"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 M�ng C�t + 19 xu v�t ph�m (80 �i�m)"},
	[17] = {80, {item={{gdp={2,1,30169,39}, name="B��i"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 B��i + 19 xu v�t ph�m (80 �i�m)"},
	[18] = {80, {item={{gdp={2,1,30170,39}, name="D�u"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 D�u + 19 xu v�t ph�m (80 �i�m)"},
	[19] = {80, {item={{gdp={2,1,30171,39}, name="Chu�i"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 Chu�i + 19 xu v�t ph�m (80 �i�m)"},
	[20] = {80, {item={{gdp={2,1,30172,39}, name="Xo�i"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 Xo�i + 19 xu v�t ph�m (80 �i�m)"},
	[21] = {80, {item={{gdp={2,1,30173,39}, name="��o"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 ��o + 19 xu v�t ph�m (80 �i�m)"},
	[22] = {80, {item={{gdp={2,1,30174,39}, name="M�n"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 M�n + 19 xu v�t ph�m (80 �i�m)"},
	[23] = {80, {item={{gdp={2,1,30175,39}, name="V�i"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 V�i + 19 xu v�t ph�m (80 �i�m)"},
	[24] = {80, {item={{gdp={2,1,30176,39}, name="T�o"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 T�o + 19 xu v�t ph�m (80 �i�m)"},
	[25] = {80, {item={{gdp={2,1,30177,39}, name="B�"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 B� + 19 xu v�t ph�m (80 �i�m)"},
	[26] = {80, {item={{gdp={2,1,30178,39}, name="�u ��"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 �u �� + 19 xu v�t ph�m (80 �i�m)"},
	[27] = {80, {item={{gdp={2,1,30179,39}, name="M�ng C�u"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 M�ng C�u + 19 xu v�t ph�m (80 �i�m)"},
	[28] = {80, {item={{gdp={2,1,30180,39}, name="Kh�m"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 Kh�m + 19 xu v�t ph�m (80 �i�m)"},
	[29] = {80, {item={{gdp={2,1,30181,39}, name="L�"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 L� + 19 xu v�t ph�m (80 �i�m)"},
	[30] = {80, {item={{gdp={2,1,30182,39}, name="B�n Bon"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 B�n Bon + 19 xu v�t ph�m (80 �i�m)"},
	[31] = {80, {item={{gdp={2,1,30183,39}, name="Kh�"}, {gdp={2,1,30230,19}, name = "Xu V�t Ph�m"}}}, "39 Kh� + 19 xu v�t ph�m (80 �i�m)"},
	[32] = {6, {item={{gdp={2,1,149,1}, name="B�ng Th�ch"}}}, "01 B�ng Th�ch (6 �i�m)"},
	[33] = {60, {item={{gdp={2,1,30130,1}, name="Phi Y�n Th�ch"}}}, "01 Phi Y�n Th�ch (60 �i�m)"},
	[34] = {100, {item={{gdp={2,0,1084,1}, name="Thi�n Qu�i Th�ch"}}}, "01 Thi�n Qu�i Th�ch (100 �i�m)"},
	[35] = {15, {item={{gdp={2,1,30346,1}, name="M�nh B�ch Kim"}, {gdp={2,1,30230,1}, name="Xu V�t Ph�m"}}}, "01 M�nh B�ch Kim + 01 xu v�t ph�m (15 �i�m)"},
	[36] = {30, {item={{gdp={2,1,30342,1}, name="Kim R��ng"}}}, "01 Kim R��ng (30 �i�m)"},
	[37] = {150, {item={{gdp={2,1,30343,1}, name="B�ch Kim R��ng"}}}, "01 B�ch Kim R��ng (150 �i�m)"},
	[38] = {1350, {item={{gdp={2,1,30344,1}, name="Th�n T�i B�o R��ng"}}}, "01 Th�n T�i B�o R��ng (1,350 �i�m)"},
	[39] = {1500, {item={{gdp={2,1,30345,1}, name="Chuy�n Sinh ��n"}}}, "01 Chuy�n Sinh ��n (1,500 �i�m)"},
	[40] = {1000, {item={{gdp={2,1,1006,1}, name="C�u Thi�n V� C�c ��n"}, {gdp={2,1,199,1}, name = "��i Ng�n Phi�u"}}}, "01 C�u Thi�n V� C�c ��n + 01 ��i Ng�n Phi�u (1,000 �i�m)"},
	[41] = {200, {item={{gdp={2,1,30230,10}, name="Xu V�t Ph�m"}}, nExp = 100000000}, "100.000.000 �i�m kinh nghi�m + 10 xu v�t ph�m (200 �i�m)"},
}

tbKimXaTuongQuan = {
	[1] = {
		[1] = {
			[1] = {item={{gdp={0,153,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng T�ng T��ng Qu�n"}}},
			[2] = {item={{gdp={0,153,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng T�ng T��ng Qu�n"}}},
			[3] = {item={{gdp={0,153,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng T�ng T��ng Qu�n"}}},
			[4] = {item={{gdp={0,153,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng T�ng T��ng Qu�n"}}},
		},
		[2] = {
			[1] = {item={{gdp={0,152,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng T��ng Qu�n"}}},
			[2] = {item={{gdp={0,152,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng T��ng Qu�n"}}},
			[3] = {item={{gdp={0,152,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng T��ng Qu�n"}}},
			[4] = {item={{gdp={0,152,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng T��ng Qu�n"}}},
		},
		[3] = {
			[1] = {item={{gdp={0,154,10,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng T��ng Qu�n"}}},
			[2] = {item={{gdp={0,154,11,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng T��ng Qu�n"}}},
			[3] = {item={{gdp={0,154,12,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng T��ng Qu�n"}}},
			[4] = {item={{gdp={0,154,13,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng T��ng Qu�n"}}},
		},
	},
	[2] = {
		[1] = {
			[1] = {item={{gdp={0,153,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Li�u T��ng Qu�n"}}},
			[2] = {item={{gdp={0,153,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Li�u T��ng Qu�n"}}},
			[3] = {item={{gdp={0,153,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Li�u T��ng Qu�n"}}},
			[4] = {item={{gdp={0,153,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Li�u T��ng Qu�n"}}},
		},
		[2] = {
			[1] = {item={{gdp={0,152,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Li�u T��ng Qu�n"}}},
			[2] = {item={{gdp={0,152,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Li�u T��ng Qu�n"}}},
			[3] = {item={{gdp={0,152,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Li�u T��ng Qu�n"}}},
			[4] = {item={{gdp={0,152,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Li�u T��ng Qu�n"}}},
		},
		[3] = {
			[1] = {item={{gdp={0,154,18,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Li�u T��ng Qu�n"}}},
			[2] = {item={{gdp={0,154,19,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Li�u T��ng Qu�n"}}},
			[3] = {item={{gdp={0,154,20,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Li�u T��ng Qu�n"}}},
			[4] = {item={{gdp={0,154,21,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Li�u T��ng Qu�n"}}},
		},
	},
}

tbThoTrang = {item={{gdp={0,105,30038,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Nguy�t L��ng Th�"}}}
tbQuanCongHH = {item={{gdp={2,1,9977,9}, name="Qu�n C�ng Huy Ho�ng", nExpired=7*24*3600}}}

tbKimXa3sao = {
	[1] = {item={{gdp={0,152,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng H�a V�n"}}},
	[2] = {item={{gdp={0,152,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Kim Ch� ng� h�nh"}}},
	[3] = {item={{gdp={0,152,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng M�c Ch� ng� h�nh"}}},
	[4] = {item={{gdp={0,152,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Th�y Ch� ng� h�nh"}}},
	[5] = {item={{gdp={0,152,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng H�a Ch� ng� h�nh"}}},
	[6] = {item={{gdp={0,152,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng Th� Ch� ng� h�nh"}}},
	[7] = {item={{gdp={0,152,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng �m Ch� ng� h�nh"}}},
	[8] = {item={{gdp={0,153,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Ng�c Ch�"}}},
	[9] = {item={{gdp={0,153,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Kim Ch� ng� h�nh"}}},
	[10] = {item={{gdp={0,153,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng M�c Ch� ng� h�nh"}}},
	[11] = {item={{gdp={0,153,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Th�y Ch� ng� h�nh"}}},
	[12] = {item={{gdp={0,153,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng H�a Ch� ng� h�nh"}}},
	[13] = {item={{gdp={0,153,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng Th� Ch� ng� h�nh"}}},
	[14] = {item={{gdp={0,153,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy Ch��ng �m Ch� ng� h�nh"}}},
	[15] = {item={{gdp={0,154,3,1,1,-1,-1,-1,-1,-1,-1,-1}, name="B� Ch� Cao ��ng Ngoa"}}},
	[16] = {item={{gdp={0,154,4,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Kim Ch� ng� h�nh"}}},
	[17] = {item={{gdp={0,154,5,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i M�c Ch� ng� h�nh"}}},
	[18] = {item={{gdp={0,154,6,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Th�y Ch� ng� h�nh"}}},
	[19] = {item={{gdp={0,154,7,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i H�a Ch� ng� h�nh"}}},
	[20] = {item={{gdp={0,154,8,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i Th� Ch� ng� h�nh"}}},
	[21] = {item={{gdp={0,154,9,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i �m Ch� ng� h�nh"}}},
}

tbTop100AwardRate = {
	[1] = {[1] = 	tbKimXa3sao[1], nRate = 7},
	[2] = {[1] = 	tbKimXa3sao[2], nRate = 5},
	[3] = {[1] = 	tbKimXa3sao[3], nRate = 5},
	[4] = {[1] = 	tbKimXa3sao[4], nRate = 5},
	[5] = {[1] = 	tbKimXa3sao[5], nRate = 5},
	[6] = {[1] = 	tbKimXa3sao[6], nRate = 5},
	[7] = {[1] = 	tbKimXa3sao[7], nRate = 1},
	[8] = {[1] = 	tbKimXa3sao[8], nRate = 7},
	[9] = {[1] = 	tbKimXa3sao[9], nRate = 5},
	[10] = {[1] = 	tbKimXa3sao[10], nRate = 5},
	[11] = {[1] = 	tbKimXa3sao[11], nRate = 5},
	[12] = {[1] = 	tbKimXa3sao[12], nRate = 5},
	[13] = {[1] = 	tbKimXa3sao[13], nRate = 5},
	[14] = {[1] = 	tbKimXa3sao[14], nRate = 1.5},
	[15] = {[1] = 	tbKimXa3sao[15], nRate = 7},
	[16] = {[1] = 	tbKimXa3sao[16], nRate = 5},
	[17] = {[1] = 	tbKimXa3sao[17], nRate = 5},
	[18] = {[1] = 	tbKimXa3sao[18], nRate = 5},
	[19] = {[1] = 	tbKimXa3sao[19], nRate = 5},
	[20] = {[1] = 	tbKimXa3sao[20], nRate = 5},
	[21] = {[1] = 	tbKimXa3sao[21], nRate = 1.5},
}

tbDefaultAward = {item={{gdp={2,1,30536,66}, name="T�y T�m Th�ch Kho�ng"},{gdp={2,1,30537,66}, name="Luy�n L� Thi�t Kho�ng"}}}

tbTopNguyenLieu = {
	[1] = {item={{gdp={2,1,30490,10}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
	[2] = {item={{gdp={2,1,30490,8}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
	[3] = {item={{gdp={2,1,30490,6}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
	[4] = {item={{gdp={2,1,30490,2}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
}

tbTopAwardItem = {
	[1] = {{item={{gdp={2,1,30523,30}, name="C�p 3 T�y T�m Th�ch"}, {gdp={2,1,30529,30}, name="C�p 3 Luy�n L� Thi�t"}, {gdp={2,1,30535,30}, name="Thi�t Tinh c�p 3"}}}, 3},
	[2] = {{item={{gdp={2,1,30523,20}, name="C�p 3 T�y T�m Th�ch"}, {gdp={2,1,30529,20}, name="C�p 3 Luy�n L� Thi�t"}}}, 1},
}

tbPhanThuongCaNhan = {
	[1] = {item={{gdp={2,1,30340,999}, name = "M�c R��ng"}}, nExp = 50000000},
	[2] = {nDanhvong =2000, nSumon = 2000},
	[3] = {nChankhi = 10000},
	[4] = {item={{gdp={2,1,30536,150}, name = "T�y T�m Th�ch Kho�ng"}}},
	[5] = {item={{gdp={2,1,30537,150}, name = "Luy�n L� Thi�t Kho�ng"}}},
	[6] = {nQuancong = 15000},
	[7] = {item={{gdp={2,1,30071,200}, name = "Nh�n S�m V�n N�m"}}},
	[8] = {item={{gdp={2,1,30132,6000}, name = "V� L�m B�o H�p"}}},
	[9] = {item={{gdp={2,1,30133,3}, name = "Ch�a Kh�a V�ng	"}}},
	[10] = {item={{gdp={2,1,9998,6}, name = "Qu�n C�ng ��i", nExpired = 30*24*3600}}},
	[11] = {item={{gdp={2,1,30497,400}, name = "Ma Tinh"}, {gdp={2,1,30554,100}, name = "B�ng Tinh Th�ch"}}},
	[12] = {item={{gdp={2,1,9977,9}, name = "Qu�n C�ng Huy Ho�ng", nExpired = 30*24*3600}}},
	[13] = {fn="TrangBiKimXa3Sao(10)"},
	[14] = {item={{gdp={2,1,30535,80}, name = "Thi�t tinh c�p 3"}}},
	[15] = {item={{gdp={2,1,30529,68}, name = "C�p 3 Luy�n L� Thi�t"}}},
	[16] = {item={{gdp={2,1,30523,79}, name = "C�p 3 T�y T�m Th�ch"}}},
	[17] = {item={{gdp={2,1,30133,20}, name = "Ch�a Kh�a V�ng	"}}},
	[18] = {fn="TrangBiKimXaAmChe()"},
	[19] = {fn="MatTichMonPhai20_Menu()"},
	[20] = {item={{gdp={0,102,8844,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Huy Ho�ng Qu�t Kh�i"}, {gdp={0,102,8845,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Vinh D� Qu�t Kh�i"}}},
}

tbDieuKienNhanThuong = {
	[1] = {150, {item={{gdp={2,1,30230,1}, name = "Xu V�t Ph�m"}}}, "50.000.000 �i�m kinh nghi�m + 999 M�c R��ng",2,250},
	[2] = {200, {item={{gdp={2,1,30230,20}, name = "Xu V�t Ph�m"}}}, "2.000 danh v�ng + 2.000 s� m�n",0,250},
	[3] = {300, {item={{gdp={2,1,30230,30}, name = "Xu V�t Ph�m"}}}, "10.000 �i�m ch�n kh�",0,250},
	[4] = {500, {item={{gdp={2,1,30230,10}, name = "Xu V�t Ph�m"}}}, "150 T�y T�m Kho�ng Th�ch",2,250},
	[5] = {1000, {item={{gdp={2,1,30230,10}, name = "Xu V�t Ph�m"}}}, "150 Luy�n L� Kho�ng Th�ch",2,250},
	[6] = {1500, {item={{gdp={2,1,30230,50}, name = "Xu V�t Ph�m"}}}, "15.000 �i�m c�ng tr�ng",0,250},
	[7] = {2000, {item={{gdp={2,1,30230,20}, name = "Xu V�t Ph�m"}}}, "200 Nh�n S�m V�n N�m",3,250},
	[8] = {2500, {item={{gdp={2,1,30230,6}, name = "Xu V�t Ph�m"}}}, "6.000 v� l�m b�o h�p",7,250},
	[9] = {3000, {item={{gdp={2,1,30230,300}, name = "Xu V�t Ph�m"}}}, "03 Ch�a Kh�a V�ng",4,250},
	[10] = {3500, {item={{gdp={2,1,30230,60}, name = "Xu V�t Ph�m"}}}, "06 Qu�n C�ng ��i",7,250},
	[11] = {4000, {item={{gdp={2,1,30230,400}, name = "Xu V�t Ph�m"}}}, "400 Ma Tinh + 100 B�ng Tinh Th�ch",3,250},
	[12] = {5000, {item={{gdp={2,1,30230,800}, name = "Xu V�t Ph�m"}}}, "09 Qu�n C�ng Huy Ho�ng (h�n s� d�ng 30 ng�y)",10,250},
	[13] = {6000, {item={{gdp={2,1,30490,2}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "10 Kim X� c�p 3 sao ng�u nhi�n",11,250},
	[14] = {8000, {item={{gdp={2,1,30490,2}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "80 Thi�t Tinh C�p 3",8,250},
	[15] = {10000, {item={{gdp={2,1,30490,5}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "68 Luy�n L� Thi�t C�p 3",2,250},
	[16] = {12000, {item={{gdp={2,1,30490,5}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "79 T�y T�m Th�ch C�p 3",2,250},
	[17] = {15000, {item={{gdp={2,1,30490,6}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "20 Ch�a Kh�a V�ng",20,250},
	[18] = {20000, {item={{gdp={2,1,30490,3}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "04 b� Kim X� Ng� h�nh �m Ch� (�o cho�ng , gi�y , huy ch��ng)",12,250},
	[19] = {30000, {item={{gdp={2,1,30490,8}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "01 M�t T�ch m�n ph�i 70 cao c�p ��c bi�t",2,250},
	[20] = {50000, {item={{gdp={2,1,30490,10}, name = "Ho�ng Kim ��i Ng�n Phi�u"}}}, "01 C�p Huy Ho�ng - Vinh D� Qu�t Kh�i",3,250},
}

tbMatTich = {
		[2] = {0,107,204, 2,"Kim Cang B�t Nh� Ch�n Quy�n"},
		[4] = {0,107,205, 1,"Ti�m Long T�c Di�t Ch�n Quy�n"},
		[3] = {0,107,206, 1,"V� Tr�n B� �� Ch�n Quy�n"},
		[6] = {0,107,207, 2,"Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0,107,208, 1,"Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0,107,209, 1,"B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0,107,210, 2,"H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0,107,211, 2,"Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0,107,212, 1,"Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0,107,213, 2,"Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0,107,214, 2,"Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0,107,215, 2,"Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0,107,216, 2,"Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0,107,217, 1,"Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0,107,218,1,"C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0,107,222,2,"H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0,107,223,2,"Phong Hoa Thi�n Di�p Ch�n Quy�n"},
	}
	
szNpcName = "<color=green>La Sa<color>: "

function EventKimXaLienServer_Menu()
	local nDate = tonumber(date("%y%m%d"))
	local tbSay = {}
	tinsert(tbSay, "��ng k� tham gia Kim X� Nguy�n So�i/EventKimXaLienServer_DangKy")
	tinsert(tbSay, "Tham d� cu�c �ua bang h�i nh�n Kim X� Nguy�n So�i/EventKimXaLienServer_Vote_Menu")
	tinsert(tbSay, "Xem �i�m t�ch l�y b�n th�n/EventKimXaLienServer_XemDiem")
	tinsert(tbSay, "Xem �i�m t�ch l�y c�c bang h�i tham gia/EventKimXaLienServer_XemDiemBang")
	tinsert(tbSay, "Nh�n th��ng m�c t�ch l�y b�n th�n/EventKimXaLienServer_Award_Menu")
--	tinsert(tbSay, "Nh�n th��ng Kim X� Nguy�n So�i/")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNpcName.."�o�n k�t l� s�c m�nh, trang b� Kim X� ta mu�n d�nh cho nh�ng bang h�i th�c s� �o�n k�t.", getn(tbSay), tbSay)
end


function EventKimXaLienServer_DangKy()
	local tbMaterial = {item={{gdp={2,1,30490,3}, name="Ho�ng Kim ��i Ng�n Phi�u"}}}
	local szTong = GetTongName()
	local szAcc = GetAccount()
	local nTongLevel = IsTongMember()
	local szRole = GetName()
	if nTongLevel ~= 1 then
		Talk(1, "",szNpcName.."C�c h� kh�ng ph�i bang ch�. N�u mu�n ��ng k� tham gia, h�y m�i bang ch� c�c h� ��n g�p ta.");
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbMaterial)
	if nCheck ~= 1 then
		return 0
	end
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheckTongName = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szTong == LIB_txtData.tbTextData[i][1] then
			nCheckTongName = i
			break
		end
	end
	if nCheckTongName > 0 then
		Talk(1,"",szNpcName.."Bang h�i c�c h� �� ��ng k� th�nh c�ng, kh�ng c�n ��ng k� th�m l�n n�a.")
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial)
	local szLogAward = szTong.."	"..szAcc.."	"..szRole.."	0"
	local nResult = LIB_txtData:AddLine(szLogAward)
	Talk(1,"",szNpcName.."Bang h�i c�c h� ��ng k� th�nh c�ng v�o cu�c �ua gi�nh Kim Xa Nguy�n So�i, h�y b�o tin cho c�c th�nh vi�n bang h�i.")
	gf_WriteLogEx(szLogTitle, "nh�n", 1, "��ng k� th�nh c�ng")
end


function EventKimXaLienServer_Vote_Menu()
	local tbSay = {}
	tbSay[0] = szNpcName.."H�y ch�n bang h�i c�c h� mu�n �ng h�."
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	if getn(LIB_txtData.tbTextData) == 0 then
		Talk(1,"",szNpcName.."Hi�n t�i ch�a c� bang h�i n�o ��ng k� tranh gi�i, c�c h� h�y t�ch l�y t�i v�t ch� cu�c �ua b�t ��u.")
		return 0
	end
	for i=1, getn(LIB_txtData.tbTextData) do
		tinsert(tbSay, format(LIB_txtData.tbTextData[i][1].."/#EventKimXaLienServer_Vote(\"%s\")",LIB_txtData.tbTextData[i][2]))
	end
	gf_PageSay(tbSay, 1, 6)
end


function EventKimXaLienServer_Vote(szAccount)
	local tbSay = {}
	tbSay[0] = szNpcName.."C�c h� mu�n d�ng th� g� �� �ng h� bang h�i m�nh ch�n?"
	for i=1, getn(tbNguyenLieuNop) do
		if LIB_Award:CheckMaterial(tbNguyenLieuNop[i][2], 0) == 1 then
			tinsert(tbSay, format(tbNguyenLieuNop[i][3] .. "/#EventKimXaLienServer_Vote_Done(\"%s\",%d)",(szAccount or ""),i))
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function EventKimXaLienServer_Vote_Done(szAccount,nIndex)
	if  IsPlayerDeath() ~= 0 then
		return 0
	end
	if tbNguyenLieuNop[nIndex] == nil then
		return 0
	end
	local nPoint = tbNguyenLieuNop[nIndex][1]
	local tbAward = {task={{TSK_KIMXA_ALLSERVER_POINT, nPoint , "�i�m t�ch l�y"}}}
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieuNop[nIndex][2])
	if nCheck == 0 then
		return 0
	end
	LIB_Award:PayMaterial(tbNguyenLieuNop[nIndex][2])
	LIB_Award:Award(tbAward)
	-- Cong diem bang
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	local nBang = 0
	for i=1,getn(LIB_txtData.tbTextData) do
		if szAccount == LIB_txtData.tbTextData[i][2] then
			nBang = i
			break
		end
	end
	if  nBang == 0 then
		return 0
	end
	LIB_txtData.tbTextData[nBang][4] = LIB_txtData.tbTextData[nBang][4] + nPoint
	LIB_txtData:SaveMultiColumn()
	gf_WriteLogEx(szLogTitle, "nh�n", 1, "�ng h� "..tbNguyenLieuNop[nIndex][3])
	EventKimXaLienServer_Vote(szAccount)
end


function EventKimXaLienServer_XemDiem()
	local nPoint = GetTask(TSK_KIMXA_ALLSERVER_POINT)
	Talk(1,"","Ng��i �ang c� trong tay <color=yellow>".. nPoint  .." �i�m t�ch l�y<color>, hay mau ch�ng ��i ph�n th��ng.")
end


function EventKimXaLienServer_XemDiemBang()
	local tbData = {}
	tinsert(tbData,szNpcName.."K�t qu� hi�n t�i:\n")
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	for i=1,getn(LIB_txtData.tbTextData) do
		local nIndex = floor(i/10)+1
		if tbData[nIndex] == nil then
			tinsert(tbData, szNpcName.."K�t qu� hi�n t�i:\n")
		end
		tbData[nIndex] = tbData[nIndex] .. "<color=yellow>"..LIB_txtData.tbTextData[i][1].."<color>: <color=red>"..LIB_txtData.tbTextData[i][4].." �i�m<color>\n"
	end
	for i=1, getn(tbData) do
		Talk(1,"",tbData[i])
	end
end


function EventKimXaLienServer_Award_Menu()
	local tbSay = {}
	local nAwardIndex = GetTask(TSK_KIMXA_ALLSERVER_AWARD)
	local nPoint = GetTask(TSK_KIMXA_ALLSERVER_POINT)
	tbSay[0] = szNpcName.."��y l� danh s�ch c�c ph�n th��ng t��ng �ng v�i s� �i�m <color=red>"..nPoint.."<color> c�a c�c h�. H�y nhanh ch�ng nh�n th��ng."
	for i=1,getn(tbDieuKienNhanThuong) do
		if nAwardIndex < i and tbDieuKienNhanThuong[i][1] <= nPoint then
			tinsert(tbSay, tbDieuKienNhanThuong[i][3].."/#EventKimXaLienServer_Award_Done("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function EventKimXaLienServer_Award_Done(nIndex)
	local nAwardIndex = GetTask(TSK_KIMXA_ALLSERVER_AWARD)
	if nAwardIndex >= nIndex then
--		DelItem(2,1,30230,GetItemCount(2,1,30230))
--		Pay(GetCash())
-- 		Exit
		Talk(1, "", "B�n �� nh�n ph�n th��ng n�y r�i!!!!!")
		return 0
	end
	if gf_Judge_Room_Weight(tbDieuKienNhanThuong[nIndex][4], tbDieuKienNhanThuong[nIndex][5]) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbDieuKienNhanThuong[nIndex][2])
	if nCheck == 0 then
		return 0
	end
	
	if (nAwardIndex + 1) < nIndex then
		Talk(1,"",szNpcName.."C�c ph�n th��ng tr��c c�c h� ch�a nh�n, hay l� nh�n cho xong h�t �� nh�.")
		return 0
	end
--	local nPoint = GetTask(TSK_KIMXA_ALLSERVER_POINT)
	if nIndex ~= 13 and nIndex ~= 18 and nIndex ~= 19 then
		LIB_Award:PayMaterial(tbDieuKienNhanThuong[nIndex][2])
		SetTask(TSK_KIMXA_ALLSERVER_AWARD,nIndex)
	end
	LIB_Award:Award(tbPhanThuongCaNhan[nIndex])
	gf_WriteLogEx(szLogTitle, "nh�n", 1, tbDieuKienNhanThuong[nIndex][1].." �i�m: "..tbDieuKienNhanThuong[nIndex][3])
end


function TrangBiKimXa3Sao(nQty)
	LIB_Award:PayMaterial(tbDieuKienNhanThuong[13][2])
	SetTask(TSK_KIMXA_ALLSERVER_AWARD,13)
	for i=1,nQty do
		LIB_Award:AwardByRate(tbTop100AwardRate)
	end
	gf_WriteLogEx(szLogTitle, "nh�n", 1, tbDieuKienNhanThuong[13][1].." �i�m: "..tbDieuKienNhanThuong[13][3])
end


function MatTichMonPhai20_Menu()
	local tbSay = {}
	tbSay[0] = szNpcName.."Ta c� r�t nhi�u m�t t�ch, nh�ng ng��i h�y ch�n m�t t�ch n�o ng��i th�ch."
	for i=1, getn(tbMatTich) do
		if tbMatTich[i] ~= nil then
			tinsert(tbSay, tbMatTich[i][5].."/#EventKimXaLienServer_MatTichMonPhai20_Done("..i..")")
		end
	end
	gf_PageSay(tbSay, 1, 6)
end


function MatTichMonPhai20_Done(nIndex)
	LIB_Award:PayMaterial(tbDieuKienNhanThuong[19][2])
	SetTask(TSK_KIMXA_ALLSERVER_AWARD,19)
	local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
	if tbMatTich[nIndex][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx(szLogTitle, "nh�n", 1, tbDieuKienNhanThuong[19][1].." �i�m: "..tbDieuKienNhanThuong[19][3])
end


function TrangBiKimXaAmChe()
	LIB_Award:PayMaterial(tbDieuKienNhanThuong[18][2])
	SetTask(TSK_KIMXA_ALLSERVER_AWARD,18)
	for i=1,4 do
		LIB_Award:Award(tbKimXa3sao[7])
		LIB_Award:Award(tbKimXa3sao[14])
		LIB_Award:Award(tbKimXa3sao[21])
	end
	gf_WriteLogEx(szLogTitle, "nh�n", 1, tbDieuKienNhanThuong[18][1].." �i�m: "..tbDieuKienNhanThuong[18][3])
end


function EventKimXaLienServer_NhanThuong_Form()
	local szAcc = GetAccount()
	local szName =  GetName()
	local nServerID = GetGlbValue(1023)
	if tbBang[szAcc] == nil then
		Talk(1,"",szNpcName.."T�i kho�n c�c h� kh�ng ph�i t�i kho�n �� ��ng k� �ua top.")
		return 0
	end
	if tbBang[szAcc][nServerID] == nil then
		Talk(1,"",szNpcName.."Bang h�i ��t gi�i kh�ng � Server n�y.")
		return 0
	end
	if tbBang[szAcc][nServerID][1] ~= szName then
		Talk(1,"",szNpcName.."C�c h� kh�ng ph�i ng��i �� ��ng k� �ua top.")
		return 0
	end
	if gf_Judge_Room_Weight(30, 500) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheck = 0
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank > 10 then
		Talk(1,"",szNpcName.."Ph�n th��ng n�y kh�ng d�nh cho c�c h�.")
		return 0
	end
--	if nRank < 4 then
--		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[nRank])
--	elseif nRank >= 4 and nRank <= 10 then
--		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[4])
--	end
--	if nCheck == 0 then
--		return 0
--	end
	local tbSay = {}
	if nRank <= 10 then
		tinsert(tbSay, "Nh�n th��ng v�t ph�m/EventKimXaLienServer_NhanThuongTrangBi_Form")
	end
	if nRank <= 2 then
		tinsert(tbSay, "Nh�n th��ng m�t t�ch si�u c�p/MatTichMonPhai20_Menu")
	end
	tinsert(tbSay, "Ta c�n suy ngh� th�m/gf_DoNothing")
	Say("Bang h�i c�c h� �� r�t xu�t s�c trong cu�c �ua, h�y mau nh�n th��ng",getn(tbSay), tbSay)
end


function EventKimXaLienServer_NhanThuongTrangBi_Form()
	local szAcc = GetAccount()
	local szName =  GetName()
	local nServerID = GetGlbValue(1023)
	local tbSay = {}
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank <= 3 then
		tinsert(tbSay, "Ta l�y b� trang b� Nam Ti�u Chu�n/#EventKimXaLienServer_NhanThuong(1)")
		tinsert(tbSay, "Ta l�y b� trang b� Nam Kh�i Ng�/#EventKimXaLienServer_NhanThuong(2)")
		tinsert(tbSay, "Ta l�y b� trang b� N� G�i C�m/#EventKimXaLienServer_NhanThuong(3)")
		tinsert(tbSay, "Ta l�y b� trang b� Ki�u N�/#EventKimXaLienServer_NhanThuong(4)")
	elseif nRank > 3 and nRank <= 10 then
		tinsert(tbSay, "Nh�n ph�n th��ng/#EventKimXaLienServer_NhanThuong(0)")
	end
	tinsert(tbSay, "Ta c�n suy ngh� th�m/gf_DoNothing")
	Say("H�y ch�n ki�u h�nh c�c h� th�ch cho ph�n th��ng Kim X� Nguy�n So�i",getn(tbSay), tbSay)
end

function EventKimXaLienServer_NhanThuong(nBody)
	local szAcc = GetAccount()
	local szName =  GetName()
	local nServerID = GetGlbValue(1023)
	local nPhe = 1
	if GetTask(701) < 0 then
		nPhe = 2
	end
	if tbBang[szAcc] == nil then
		Talk(1,"",szNpcName.."T�i kho�n c�c h� kh�ng ph�i t�i kho�n �� ��ng k� �ua top.")
		return 0
	end
	if tbBang[szAcc][nServerID] == nil then
		Talk(1,"",szNpcName.."Bang h�i ��t gi�i kh�ng � Server n�y.")
		return 0
	end
	if tbBang[szAcc][nServerID][1] ~= szName then
		Talk(1,"",szNpcName.."C�c h� kh�ng ph�i ng��i �� ��ng k� �ua top.")
		return 0
	end
	if gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT,1) ~= 0 then
		Talk(1,"",szNpcName.."C�c h� �� nh�n ph�n th��ng n�y r�i, h�y ki�m tra l�i.")
		return 0
	end
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank < 4 then
		if gf_Judge_Room_Weight(30, 500) == 0 then
			Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
			return 0
		end
	else
		if gf_Judge_Room_Weight(42, 500) == 0 then
			Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
			return 0
		end
	end
	local nCheck = 0
	local nRank = tbBang[szAcc][nServerID][2] or 100
	if nRank < 4 then
		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[nRank])
	elseif nRank >= 4 and nRank <= 10 then
		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[4])
	end
	if nCheck == 0 then
		return 0
	end
	
	--================ Trao thuong
	if nRank < 4 then
		LIB_Award:PayMaterial(tbTopNguyenLieu[nRank])
	elseif nRank >= 4 and nRank <= 10 then
		LIB_Award:PayMaterial(tbTopNguyenLieu[4])
	end
	gf_SetTaskByte(TSK_KIMXA_ALLSERVER_POINT,1,1)
	if nRank <= 2 then
		gf_SetTaskByte(TSK_KIMXA_ALLSERVER_POINT,2, tbTopAwardItem [nRank][2])
	end
	if nRank == 1 then
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
		LIB_Award:Award(tbTopAwardItem [nRank][1])
	elseif nRank == 2 then
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
		LIB_Award:Award(tbTopAwardItem [nRank][1])
	elseif nRank == 3 then
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][1][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][2][nBody])
		LIB_Award:Award(tbTrangBiKimXa_NguyenSoai[nPhe][3][nBody])
	elseif nRank >3 and nRank <= 10 then
		TrangBiKimXa3Sao(40)
	end
end


function EventKimXaLienServer_MatTichMonPhai20_Done(nIndex)
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	if gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 1) ~= 1 then
		Talk(1,"", szNpcName.."H�y nh�n ph�n th��ng v�t ph�m tr��c, xong r�i quay l�i ��y.")
		return 0
	end
	if gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2) <= 0 then
		Talk(1,"", szNpcName.."C�c h� kh�ng c� ph�n th��ng n�y, ho�c �� nh�n h�t.")
		return 0
	end
	gf_SetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2, gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2) - 1)

	local _, nItemID = AddItem(tbMatTich[nIndex][1], tbMatTich[nIndex][2], tbMatTich[nIndex][3], 1)
	if tbMatTich[nIndex][4] == 1 then
		SetBookInfo(nItemID, nil, 3, 1, 20, 20, 20)
	else
		SetBookInfo(nItemID, nil, 3, 20, 1, 20, 20)
	end
	gf_WriteLogEx(szLogTitle, "nh�n", 1, tbDieuKienNhanThuong[19][1].." �i�m: "..tbDieuKienNhanThuong[19][3])
	Talk(1,"","C�c h� �� nh�n 1 m�t t�ch si�u c�p, c� th� nh�n ti�p "..gf_GetTaskByte(TSK_KIMXA_ALLSERVER_POINT, 2).." quy�n")
end


tbTrangBiKimXa_NguyenSoai = {
	[1] = {
		[1] = {
				[1] = {item={{gdp={0,153,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,153,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,153,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,153,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng T�ng Nguy�n So�i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,152,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,152,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,152,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o Cho�ng T�ng Nguy�n So�i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,14,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[2] = {item={{gdp={0,154,15,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[3] = {item={{gdp={0,154,16,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
				[4] = {item={{gdp={0,154,17,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n H�i T�ng Nguy�n So�i"}}},
			},
	},
	[2] = {
		[1] = {
				[1] = {item={{gdp={0,153,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,153,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,153,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,153,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Huy ch��ng Li�u Nguy�n So�i"}}},
			},
		[2] = {
				[1] = {item={{gdp={0,152,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,152,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,152,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,152,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="�o cho�ng Li�u Nguy�n So�i"}}},
			},
		[3] = {
				[1] = {item={{gdp={0,154,22,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[2] = {item={{gdp={0,154,23,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[3] = {item={{gdp={0,154,24,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
				[4] = {item={{gdp={0,154,25,1,1,-1,-1,-1,-1,-1,-1,-1}, name="Chi�n h�i Li�u Nguy�n So�i"}}},
			},
	},
}