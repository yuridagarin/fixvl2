Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\online_activites\\reborn\\tongban\\head.lua")
Include("\\script\\vng\\lib\\vnglib_function.lua");
tbNoel69 = {
	[1] = {[1] = {nExp = 50000000}, nRate = 45},
	[2] = {[1] = {nExp = 60000000}, nRate = 15},
	[3] = {[1] = {nExp = 70000000}, nRate = 10},
	[4] = {[1] = {nExp = 80000000}, nRate = 10},
	[5] = {[1] = {nExp = 90000000}, nRate = 10},
	[6] = {[1] = {nExp = 100000000}, nRate = 5},
	[7] = {[1] = {nExp = 200000000}, nRate = 4.46},
	[8] = {[1] = {fn="TrangBiDieuDuong_NgauNhien()"}, nRate = 0.1},
	[9] = {[1] = {item={{gdp={2,1,30470,1}, nExpired = 7*24*3600}}}, nRate = 0.1},
	[10] = {[1] = {item={{gdp={2,1,30497 ,300}}}}, nRate = 0.1},
	[11] = {[1] = {item={{gdp={2,95,204,1}}}}, nRate = 0.1},
	[12] = {[1] = {item={{gdp={2,1,30370,1}}}}, nRate = 0.1},
	[13] = {[1] = {item={{gdp={2,1,1068,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
	[14] = {[1] = {item={{gdp={2,1,1067,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
	[15] = {[1] = {item={{gdp={2,1,1113,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
	[16] = {[1] = {item={{gdp={2,1,504,1}, nExpired = 7*24*3600}}}, nRate = 0.01},
}

tbNoel690 = {
	[1] = {[1] = {nExp = 300000000}, nRate = 24},
	[2] = {[1] = {nExp = 400000000}, nRate = 25},
	[3] = {[1] = {nExp = 500000000}, nRate = 25},
	[4] = {[1] = {fn="TrangBiDieuDuong_NgauNhien()"}, nRate = 25},
	[5] = {[1] = {item={{gdp={2,1,30345,1}, nExpired = 30*24*3600}}}, nRate = 1},
}

tbAward = {
	nCheckExp = 0,
	item = {{gdp={2,0,1082,8}, name ="Th�i D�ch H�n Nguy�n ��"}},
	nExp = 200000,
	nChankhi = 6,
	nPetExp = 3,
	nPetLinhluc = 1,
}
tbFinalAward = {
	nChankhi = 20000,
	nPetExp = 2000,
	nPetLinhluc = 500,
}

tbExpMaterial = {
	[1] = {{item={{gdp={2,95,204,1}, name="Thi�n Cang L�nh"}}}, {nCheckExp = 0, nExp = 555000000}, "Nh�n 555000000 Exp (ti�u hao 1 Thi�n Cang L�nh)"},
	[2] = {{item={{gdp={2,1,30370,1}, name="Thi�n M�n Kim L�nh"}}}, {nCheckExp = 0, nExp = 470000000}, "Nh�n 470000000 Exp (ti�u hao 1 Thi�n M�n Kim L�nh)"},
	[3] = {{item={{gdp={2,1,1009,1}, name="Thi�n Th�ch Tinh Th�ch"}}}, {nCheckExp = 0, nExp = 2900000}, "Nh�n 2900000 Exp (ti�u hao 1 Thi�n Th�ch Tinh Th�ch)"},	
}


tbAward2a = {
	nCheckExp = 0,
	nExp = 3000000,
	item = {{gdp={2,1,30191,3}, name ="Ng�i sao may m�n", nExpired = 15*24*3600}, {gdp={2,1,30154,30}, name ="N� Oa B�o H�p", nExpired = 15*24*3600}},
}

tbAward2b = {
	nCheckExp = 0,
	nExp = 6000000,
	item = {{gdp={2,1,30351,6}, name ="B�i Nguy�n ��n", nExpired = 15*24*3600}, {gdp={2,1,30352,6}, name ="T� Linh Quy Nguy�n ��n", nExpired = 15*24*3600}, {gdp={2,1,30191,6}, name ="Ng�i sao may m�n", nExpired = 15*24*3600}},
}

tbExpMaterial2 = {
	[1] = {{{2,1,1068,1}}, tbAward2a, "��i 01 Thi�n th�ch linh th�ch l�y nhu y�u ph�m"},
	[2] = {{{2,1,1067,1}}, tbAward2b, "��i 01 ��nh h�n thi�n th�ch th�n th�ch �� nh�n l�y nhu y�u ph�m"},
}

tbExpMaterialQuanDung = {
	[1] = {{{2,0,307,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "��i 7.900.000: c�n 240 Kho�ng Th�ch Qu�n D�ng, 24 v�ng, 5 xu v�t ph�m"},
	[2] = {{{2,0,308,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "��i 7.900.000: c�n 240 G� Qu�n D�ng, 24 v�ng, 5 xu v�t ph�m"},
	[3] = {{{2,0,309,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "��i 7.900.000: c�n 240 L�a M�ch Qu�n D�ng, 24 v�ng, 5 xu v�t ph�m"},
	[4] = {{{2,0,310,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "��i 7.900.000: c�n 240 Thu�c Da Qu�n D�ng, 24 v�ng, 5 xu v�t ph�m"},
	[5] = {{{2,0,311,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "��i 7.900.000: c�n 240 T� T�m Qu�n D�ng, 24 v�ng, 5 xu v�t ph�m"},
	[6] = {{{2,0,312,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "��i 7.900.000: c�n 240 D��c Th�o Qu�n D�ng, 24 v�ng, 5 xu v�t ph�m"},
	[7] = {{{2,0,313,240}, {2,1,30230,5}, 240000}, {nCheckExp = 0, nExp = 7900000}, "��i 7.900.000: c�n 240 Linh Huy�t Qu�n D�ng, 24 v�ng, 5 xu v�t ph�m"},
}

tbAward60Event = {
	nCheckExp = 0,
	nExp = 30000000,
	nChankhi = 3000,
	nGold = 3000000,
	item = {{gdp={2,1,30230,30}, name = "xu v�t ph�m"}},
}
tbExpMaterialEventT5 = {
	[1] = {{{2,1,30517,60}}, tbAward60Event, "N�p 60 Sir� Ng� S�c"},
	[2] = {{{2,1,30518,60}}, tbAward60Event, "N�p 60 Kem Que C�u V�ng"},
}

tbRandomAward = {
	[1] = {[1] = {item={{gdp={2,1,30424,1}, name = "C��ng H�a ph� c�p 12", nExpired = 7*24*3600}}},nRate = 1.00},
	[2] = {[1] = {item={{gdp={2,1,30425,1}, name = "C��ng H�a ph� c�p 13", nExpired = 7*24*3600}}},nRate = 1.00},
	[3] = {[1] = {item={{gdp={2,1,30426,1}, name = "C��ng H�a ph� c�p 14", nExpired = 7*24*3600}}},nRate = 1.00},
	[4] = {[1] = {item={{gdp={2,1,30427,1}, name = "C��ng H�a ph� c�p 15", nExpired = 7*24*3600}}},nRate = 1.00},
	[5] = {[1] = {item={{gdp={2,1,30428,1}, name = "Ma �ao th�ch c�p 1", nExpired = 7*24*3600}}}, nRate = 1.00},
	[6] = {[1] = {item={{gdp={2,1,30429,1}, name = "Ma �ao th�ch c�p 2", nExpired = 7*24*3600}}}, nRate = 1.00},
	[7] = {[1] = {item={{gdp={2,1,30430,1}, name = "Ma �ao th�ch c�p 3", nExpired = 7*24*3600}}}, nRate = 1.00},
	[8] = {[1] = {item={{gdp={2,1,3380,1}, name = "T�i C�u Chuy�n", nExpired = 7*24*3600}}}, nRate = 2.00},
	[9] = {[1] = {item={{gdp={2,1,536,1}, name = "T� Kim H�ng Bao (Tr�ng)", nExpired = 7*24*3600}}}, nRate = 6.00},
	[10] = {[1] = {item={{gdp={2,1,538,1}, name = "Ho�ng Kim H�ng Bao (Tr�ng)", nExpired = 7*24*3600}}}, nRate = 6.00},
	[11] = {[1] = {item={{gdp={2,1,30228,1}, name = "B�ch Kim H�ng Bao (Tr�ng)", nExpired = 7*24*3600}}}, nRate = 6.00},
	[12] = {[1] = {item={{gdp={2,1,30491,1}, name = "V� Ti�u Y (V�ng)", nExpired = 7*24*3600}}}, nRate = 2.00},
	[13] = {[1] = {item={{gdp={2,1,30492,1}, name = "V� Ti�u Y (B�c)", nExpired = 7*24*3600}}}, nRate = 3.00},
	[14] = {[1] = {item={{gdp={2,1,30493,1}, name = "V� Ti�u Y (��ng)", nExpired = 7*24*3600}}}, nRate = 3.00},
	[15] = {[1] = {item={{gdp={2,1,30305,1}, name = "Linh Th�ch bao c�p 7", nExpired = 7*24*3600}}}, nRate = 12.00},
	[16] = {[1] = {item={{gdp={2,1,30458,1}, name = "T� Linh Ho�n", nExpired = 7*24*3600}}}, nRate = 4.00},
	[17] = {[1] = {item={{gdp={2,1,30459,1}, name = "��i T� Linh Ho�n", nExpired = 7*24*3600}}}, nRate = 3.00},
	[18] = {[1] = {item={{gdp={2,1,30460,1}, name = "T� Linh Ti�n ��n", nExpired = 7*24*3600}}}, nRate = 1.00},
	[19] = {[1] = {nExp = 500000}, nRate = 6.00},
	[20] = {[1] = {nExp = 1000000}, nRate = 15.00},
	[21] = {[1] = {nExp = 10000000}, nRate = 6.00},
	[22] = {[1] = {fn = "RandomBook()"}, nRate = 18.00},
}

function Trade_Material2Exp_Menu()
	local tbSay = {}
--	if GetTask(TSK_DOINGUYENLIEU) >= 500 and floor(GetTask(TSK_DOINGUYENLIEU)/1000) == 0 then
--		tinsert(tbSay, "Nh�n th��ng ��i 500 l�n/TradeMaterial_FilnalAward")
--	end
	for i=1, getn(tbExpMaterial) do
		tinsert(tbSay, tbExpMaterial[i][3].."/#TradeMaterial_Done("..i..")")
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("N�u c�c h� ki�m cho ta nh�ng nguy�n li�u ta c�n, ta s� s� c� h�u t� x�ng ��ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done(nOption)
--	if GetTask(TSK_DOINGUYENLIEU) >= 500 then
--		Talk(1,"","C�c h� �� ��i 500 l�n, ta ch�ng c�n �� ph�n th��ng cho c�c h� n�a.")
--		return 0
--	end
	if gf_JudgeRoomWeight(2,100) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbExpMaterial[nOption][1])
	if nCheck == 0 then
		return
	end
	if LIB_Award:PayMaterial(tbExpMaterial[nOption][1]) == 1 then
		LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 12"
		LIB_Award.szLogAction = "��i th�nh c�ng"
		gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "��i nguy�n li�u d�ng "..nOption)
		LIB_Award:Award(tbExpMaterial[nOption][2])
	end	
	Trade_Material2Exp_Menu()
end


function TradeMaterial_FilnalAward()
	if mod(GetTask(TSK_DOINGUYENLIEU),1000) < 500 then
		Talk(1,"","C�c h� ch�a ��i �� 500 l�n, sao �� mu�n nh�n th��ng?")
		return 0
	end
	if floor(GetTask(TSK_DOINGUYENLIEU)/1000) > 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	SetTask(TSK_DOINGUYENLIEU, GetTask(TSK_DOINGUYENLIEU) + 1000)
	LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 5"
	LIB_Award.szLogAction = "th�nh c�ng"
	LIB_Award:Award(tbFinalAward)
	TradeMaterial_PetBonus(tbFinalAward)
	Talk(1,"","Nh�n ph�n th��ng ��i nguy�n li�u 500 l�n th�nh c�ng.")
	gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "Ph�n th��ng cu�i")
end


function RandomBook()
	local tbBook = {
		[1] = {[1] = {item={{gdp={0,107,204,1}, name="Kim Cang B�t Nh� Ch�n Quy�n"}}}, nRate = 7.00},
		[2] = {[1] = {item={{gdp={0,107,205,1}, name="Ti�m Long T�c Di�t Ch�n Quy�n"}}}, nRate = 8.00},
		[3] = {[1] = {item={{gdp={0,107,206,1}, name="V� Tr�n B� �� Ch�n Quy�n"}}}, nRate = 7.00},
		[4] = {[1] = {item={{gdp={0,107,207,1}, name="Thi�n La Li�n Ch�u Ch�n Quy�n"}}}, nRate = 7.00},
		[5] = {[1] = {item={{gdp={0,107,208,1}, name="Nh� � Kim ��nh Ch�n Quy�n"}}}, nRate = 7.00},
		[6] = {[1] = {item={{gdp={0,107,209,1}, name="B�ch H�i Tuy�t �m Ch�n Quy�n"}}}, nRate = 8.00},
		[7] = {[1] = {item={{gdp={0,107,210,1}, name="H�n ��n Tr�n Nh�c Ch�n Quy�n"}}}, nRate = 7.00},
		[8] = {[1] = {item={{gdp={0,107,211,1}, name="Qu� Thi�n Du Long Ch�n Quy�n"}}}, nRate = 7.00},
		[9] = {[1] = {item={{gdp={0,107,212,1}, name="Huy�n �nh M� T�ng Ch�n Quy�n"}}}, nRate = 7.00},
		[10] = {[1] = {item={{gdp={0,107,213,1}, name="Qu�n T� ��i Phong Ch�n Quy�n"}}}, nRate = 7.00},
		[11] = {[1] = {item={{gdp={0,107,214,1}, name="Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"}}}, nRate = 7.00},
		[12] = {[1] = {item={{gdp={0,107,215,1}, name="Xuy�n V�n L�c H�ng Ch�n Quy�n"}}}, nRate = 7.00},
		[13] = {[1] = {item={{gdp={0,107,216,1}, name="Huy�n Minh Phong Ma Ch�n Quy�n"}}}, nRate = 7.00},
		[14] = {[1] = {item={{gdp={0,107,217,1}, name="Linh C� Huy�n T� Ch�n Quy�n"}}}, nRate = 7.00},
		[15] = {[1] = {item={{gdp={0,107,218,1}, name="C�u Thi�n Phong L�i Ch�n Quy�n"}}}, nRate = 0},
		[16] = {[1] = {item={{gdp={0,107,222,1}, name="H�ng Tr�n T�y M�ng Ch�n Quy�n"}}}, nRate = 0},
		[17] = {[1] = {item={{gdp={0,107,223,1}, name="Phong Hoa Thi�n Di�p Ch�n Quy�n"}}}, nRate = 0},						
	}
	LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 5"
	LIB_Award.szLogAction = "th�nh c�ng"
	LIB_Award:AwardByRate(tbBook)
end


function TradeMaterial_PetBonus(tbAwardList)
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	-- Award Exp Pet
	if type(tbAwardList["nPetExp"])=="number" then
		if nCurPetLevel >= 1 then
			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (tbAwardList["nPetExp"] * 100))
			Msg2Player("B�n nh�n ���c "..tbAwardList["nPetExp"].." �i�m n�ng c�p b�n ��ng h�nh")
			gf_WriteLogEx("DOI NGUYEN LIEU THANG 5", "th�nh c�ng", tbAwardList["nPetExp"], "�i�m n�ng c�p pet")
		end
	end
	-- Award Linh luc Pet
	if type(tbAwardList["nPetLinhluc"])=="number" then
		if nCurPetLevel >= 2 then
			Pet_AddGP(tbAwardList["nPetLinhluc"])
			Msg2Player("B�n nh�n ���c "..tbAwardList["nPetLinhluc"].." �i�m linh l�c pet")
			gf_WriteLogEx("DOI NGUYEN LIEU THANG 5", "th�nh c�ng", tbAwardList["nPetLinhluc"], "�i�m linh l�c pet")
		end
	end
end


-- ��i nguy�n li�u ���ng Minh Th�nh
function Trade_Material_Menu2()
	local tbSay = {}
	for i=1, getn(tbExpMaterial2) do
		tinsert(tbSay, tbExpMaterial2[i][3].."/#TradeMaterial_Done2("..i..")")
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("N�u c�c h� ki�m cho ta nh�ng nguy�n li�u ta c�n, ta s� s� c� h�u t� x�ng ��ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done2(nOption)
	if gf_JudgeRoomWeight(33,100) == 0 then
		Talk(1,"","H�nh trang c�n 33 �, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbNguyenLieu = tbExpMaterial2[nOption]
	for i=1,getn(tbNguyenLieu[1]) do
		if type(tbNguyenLieu[1][i]) == "table" then
			if GetItemCount(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3]) < tbNguyenLieu[1][i][4] then
				Talk(1,"","C�c h� kh�ng �em �� nguy�n li�u, vui l�ng ki�m tra l�i.")
				return 0
			end
		elseif type(tbNguyenLieu[1][i]) == "number" then
			if GetCash() < tbNguyenLieu[1][i] then
				Talk(1,"","C�c h� kh�ng �em �� v�ng, vui l�ng ki�m tra l�i.")
				return 0
			end
		end
	end
	
	LIB_Award.szLogTitle = "DOI NGUYEN LIEU THANG 5"
	LIB_Award.szLogAction = "th�nh c�ng"
	tbAward = tbNguyenLieu[2]
	if LIB_Award:Award(tbAward) == 1 then
		gf_WriteLogEx(LIB_Award.szLogTitle, LIB_Award.szLogAction, 1, "���ng Minh Th�nh c�ng th�c "..nOption)
		for i=1,getn(tbNguyenLieu[1]) do
			if type(tbNguyenLieu[1][i]) == "table" then
				DelItem(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3],tbNguyenLieu[1][i][4])
			elseif type(tbNguyenLieu[1][i]) == "number" then
				Pay(tbNguyenLieu[1][i])
			end
		end
	end
	Trade_Material_Menu2()
end


-- ��i nguy�n li�u Th��ng Nh�n Th�n B� - Bi�n Kinh
function Trade_Material_Menu3()
	local tbSay = {}
	for i=1, getn(tbExpMaterialQuanDung) do
		tinsert(tbSay, tbExpMaterialQuanDung[i][3].."/#TradeMaterial_Done3("..i..")")
	end
	tinsert(tbSay,"Nh�n ph�n th��ng n�p 30 l�n/TradeMaterial_Done3_FinalAward")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("N�u c�c h� ki�m cho ta nh�ng nguy�n li�u ta c�n, ta s� s� c� h�u t� x�ng ��ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done3(nOption)
	local nCount = mod(floor(GetTask(TSK_THUQUANDUNG)/10),100)
	if nCount >= 30 then
		Talk(1,"","H�m nay c�c h� ch� ���c ��i 30 l�n, mai h�y quay l�i nh�!")
		return 0
	end
	
	if TradeMaterial_Core(nOption, tbExpMaterialQuanDung[nOption], "THU DOI QUAN DUNG") == 1 then
		nCount = (nCount + 1)*10 + mod(GetTask(TSK_THUQUANDUNG),10)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/1000)*1000 + nCount)
		gf_WriteLogEx("THU DOI QUAN DUNG", "th�nh c�ng", 1, "Th��ng Nh�n Th�n B�")
		Trade_Material_Menu3()
	end
end


function TradeMaterial_Done3_FinalAward()
	local nSoLanNop = mod(floor(GetTask(TSK_THUQUANDUNG)/10),100)
	if nSoLanNop < 30 then
		Talk(1,"","H�m nay c�c h� ch�a n�p �� 30 l�n, h�y c� g�ng th�m nh�!")
		return 0
	end
	
	local nCount = mod(GetTask(TSK_THUQUANDUNG),10)
	if nCount > 0 then
		Talk(1,"","Ph�n th��ng h�m nay c�c h� �� nh�n r�i.!")
		return 0
	end
	
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	 
	tbAward = {
		nCheckExp = 0,
		nExp = 33000000,
		nChankhi = 330,
	}
	LIB_Award.szLogTitle = "THU DOI QUAN DUNG PHAN THUONG CUOI"
	LIB_Award.szLogAction = "th�nh c�ng"
	if LIB_Award:Award(tbAward) == 1 then
		AddItem(2,1,30164 + mod(random(0,1000),20), 33)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/10)*10 + 1)
		gf_WriteLogEx("THU DOI QUAN DUNG PHAN THUONG CUOI", "th�nh c�ng", 1, "Th��ng Nh�n Th�n B�")
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng n�p 30 l�n nguy�n li�u qu�n d�ng.")
	end
end


-- N�p event th�ng 5
function Trade_Material_Menu4()
	local tbSay = {}
	for i=1, getn(tbExpMaterialEventT5) do
		local nHeso = 10^(i+2)
		local nCount  = mod(floor(GetTask(TSK_THUQUANDUNG)/nHeso),10)
		tinsert(tbSay, tbExpMaterialEventT5[i][3].."("..nCount.."/6)/#TradeMaterial_Done4("..i..")")
	end
	tinsert(tbSay,"Nh�n ph�n th��ng n�p 6 l�n c� 2 lo�i/TradeMaterial_Done4_FinalAward")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("N�u c�c h� ki�m cho ta nh�ng nguy�n li�u ta c�n, ta s� s� c� h�u t� x�ng ��ng.", getn(tbSay), tbSay)
end


function TradeMaterial_Done4(nOption)
	if GetTask(2813) < 2000 or GetTask(2814) < 2000 then
		Talk(1,"","C�c h� ch�a s� d�ng �� 2000 v�t ph�m event m�i lo�i.")
		return 0
	end
	
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	
	local nHeso = 10^(nOption+2)
	local nCount  = mod(floor(GetTask(TSK_THUQUANDUNG)/nHeso),10)
	if nCount >= 6 then
		Talk(1,"","C�c h� ch� ���c ��i 6 l�n cho lo�i v�t ph�m n�y.")
		return 0
	end
	
	if TradeMaterial_Core(nOption, tbExpMaterialEventT5[nOption], "MO RONG EVENT THANG 5") == 1 then
		nCount = (nCount + 1)*nHeso + mod(GetTask(TSK_THUQUANDUNG),nHeso)
		SetTask(TSK_THUQUANDUNG, floor(GetTask(TSK_THUQUANDUNG)/(nHeso*10))*nHeso*10 + nCount)
		if nOption == 1 then
			gf_WriteLogEx("MO RONG EVENT THANG 5", "th�nh c�ng", 1, "Siro Ng� S�c")
		else
			gf_WriteLogEx("MO RONG EVENT THANG 5", "th�nh c�ng", 1, "Kem Que C�u V�ng")
		end
		Trade_Material_Menu4()
	end
end


function TradeMaterial_Done4_FinalAward()
	local nSoLanNop = mod(floor(GetTask(TSK_THUQUANDUNG)/1000),100)
	if nSoLanNop < 66 then
		Talk(1,"","C�c h� ch�a n�p �� 6 l�n cho m�i lo�i v�t ph�m, h�y c� g�ng th�m nh�!")
		return 0
	end
	
	local nCount = mod(floor(GetTask(TSK_THUQUANDUNG)/100000),10)
	if nCount > 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i!")
		return 0
	end
	
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	
	tbAward = {
		nCheckExp = 0,
		nExp = 500000000,
		item = {
			{gdp={2,95,204,2}, name = "Thi�n Cang L�nh"}, 
			{gdp={2,1,30370,2}, name = "Thi�n M�n Kim L�nh"},
		},
	}
	LIB_Award.szLogTitle = "MO RONG EVENT THANG 5 PHAN THUONG CUOI"
	LIB_Award.szLogAction = "th�nh c�ng"
	if LIB_Award:Award(tbAward) == 1 then
		SetTask(TSK_THUQUANDUNG, GetTask(TSK_THUQUANDUNG) + 100000)
		gf_WriteLogEx("MO RONG EVENT THANG 5 PHAN THUONG CUOI", "th�nh c�ng", 1, "Th��ng Nh�n Th�n B�")
		Talk(1,"","Nh�n th�nh c�ng ph�n th��ng n�p 6 l�n Event.")
	end
end


function TradeMaterial_Core(nOption, tbNguyenLieu, szLogTitle)
	for i=1,getn(tbNguyenLieu[1]) do
		if type(tbNguyenLieu[1][i]) == "table" then
			if GetItemCount(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3]) < tbNguyenLieu[1][i][4] then
				Talk(1,"","C�c h� kh�ng �em �� nguy�n li�u, vui l�ng ki�m tra l�i.")
				return 0
			end
		elseif type(tbNguyenLieu[1][i]) == "number" then
			if GetCash() < tbNguyenLieu[1][i] then
				Talk(1,"","C�c h� kh�ng �em �� v�ng, vui l�ng ki�m tra l�i.")
				return 0
			end
		end
	end
	
	LIB_Award.szLogTitle = szLogTitle
	LIB_Award.szLogAction = "th�nh c�ng"
	tbAward = tbNguyenLieu[2]
	if LIB_Award:Award(tbAward) == 1 then
		for i=1,getn(tbNguyenLieu[1]) do
			if type(tbNguyenLieu[1][i]) == "table" then
				DelItem(tbNguyenLieu[1][i][1], tbNguyenLieu[1][i][2], tbNguyenLieu[1][i][3],tbNguyenLieu[1][i][4])
			elseif type(tbNguyenLieu[1][i]) == "number" then
				Pay(tbNguyenLieu[1][i])
			end
		end
	end
	return 1
end

--N�p Event th�ng 8
function Event_Phu_Thang8()
	local tbSay = {}

	tinsert(tbSay,"Nh�n 19 tri�u �i�m kinh nghi�m (ti�u hao 1 Thi�n th�ch tinh th�ch + 1 xu v�t ph�m)/#change_nguyenlieu_thang8(1)")
	tinsert(tbSay,"Nh�n 390.000 �i�m kinh nghi�m (ti�u hao 1 M�nh thi�n th�ch + 1 xu v�t ph�m)/#change_nguyenlieu_thang8(2)")
	tinsert(tbSay,"Nh�n 290.000 �i�m kinh nghi�m (ti�u hao 1 Thi�n th�ch + 1 xu v�t ph�m)/#change_nguyenlieu_thang8(3)")
	tinsert(tbSay,"Nh�n 1 B�nh Trung Thu Socola (ti�u hao 1 M�nh thi�n th�ch + 2 Thi�n th�ch + 1 v�ng )/change_banhtrungthu")
--	tinsert(tbSay,"N�p 1 Sinh T� Th�p C�m/#submit_nguyenlieu(1)")
--	tinsert(tbSay,"Nh�n th��ng n�p 2000 Sinh T� Th�p C�m (30.000 �i�m ch�n kh�/#get_award_thang7(1)")
--	tinsert(tbSay,"N�p 1 Tr�i C�y D�m/#submit_nguyenlieu(2)")
--	tinsert(tbSay,"Nh�n th��ng n�p 2000 Tr�i C�y D�m (30.000 �i�m ch�n kh�/#get_award_thang7(2)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("N�u c�c h� ki�m cho ta nh�ng nguy�n li�u ta c�n, ta s� s� c� h�u t� x�ng ��ng.", getn(tbSay), tbSay)
end
function change_nguyenlieu_thang8(nType)
	local tNguyenlieu = {
										[1] = {2,1,1009,1," Thi�n th�ch tinh th�ch", 1, 19000000},
										[2] = {2,2,7,1," M�nh thi�n th�ch", 1, 390000},
										[3] = {2,2,8,1," Thi�n th�ch", 1, 290000},
							}
	if GetItemCount(tNguyenlieu[nType][1],tNguyenlieu[nType][2],tNguyenlieu[nType][3]) < tNguyenlieu[nType][4] then
		Talk(1,"","B�n kh�ng mang theo �� "..tNguyenlieu[nType][4]..tNguyenlieu[nType][5])
		return
	end
	if GetItemCount(2,1,30230) < tNguyenlieu[nType][6] then
		Talk(1,"","B�n kh�ng mang theo �� "..tNguyenlieu[nType][6].." xu v�t ph�m")
		return
	end
	if DelItem(tNguyenlieu[nType][1],tNguyenlieu[nType][2],tNguyenlieu[nType][3],tNguyenlieu[nType][4]) == 1 and DelItem(2,1,30230,tNguyenlieu[nType][6]) == 1 then
		ModifyExp(tNguyenlieu[nType][7])
		Msg2Player("��i th�nh c�ng "..tNguyenlieu[nType][7].." �i�m kinh nghi�m")
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "n�p th�nh c�ng", 1, "��i th�nh c�ng 1"..tNguyenlieu[nType][5])
		WriteLogEx("LOG XU VAT PHAM","��i nguy�n li�u th�ng 8 lo�i "..tNguyenlieu[nType][5])
	else
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "n�p kh�ng th�nh c�ng", 1, "Kh�ng th�nh c�ng lo�i"..tNguyenlieu[nType][5])
	end
	Event_Phu_Thang8()
end
function change_banhtrungthu()
	if gf_JudgeRoomWeight(2,10) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	if GetItemCount(2,2,7) < 1 or GetItemCount(2,2,8) < 2 or GetCash() < 10000 then
		Talk(1,"","B�n kh�ng mang theo �� nguy�n li�u �� ��i B�nh Trung Thu Socola")
		return
	end
	if DelItem(2,2,7,1) == 1 and DelItem(2,2,8,2) == 1 then
		Pay(10000)
		gf_AddItemEx2({2,1,30571 ,1}, "��i b�nh socola th�ng 8", "EVENT PHU THEM THANG 8 BK", "��i b�nh Trung thu Socola")
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "n�p th�nh c�ng", 1, "��i b�nh trung thu Socola th�nh c�ng")
	else
		gf_WriteLogEx("EVENT PHU THEM THANG 8", "n�p kh�ng th�nh c�ng", 1, "��i b�nh trung thu Socola kh�ng th�nh c�ng")
	end
	Event_Phu_Thang8()
end

function submit_nguyenlieu(nType)
	local nCout_sinhto = mod(GetTask(2713),10000)
	local nCout_traicay = floor(GetTask(2713)/10000)
	if nType == 1 then
		if GetItemCount(2,1,30552) < 1 then
			Talk(1,"","C�c h� kh�ng �em Sinh T� Th�p C�m, vui l�ng ki�m tra l�i.")
			return 0
		end
		DelItem(2,1,30552,1)
		ModifyExp(550000)
		AwardGenuineQi(10)
		if nCout_sinhto < 2000 then
			SetTask(2713, GetTask(2713)+1)
		end		
		nCout_sinhto = mod(GetTask(2713),10000)
		if nCout_sinhto == 2000 then
			local nCheck_sinhto = gf_GetTaskByte(2731, 2)
			if nCheck_sinhto< 2 then
				gf_SetTaskByte(2731, 2, 1)
			end
		end
		gf_WriteLogEx("EVENT PHU THEM THANG 7", "n�p th�nh c�ng", 1, "n�p th�nh c�ng 1 sinh t�")
		Msg2Player("N�p th�nh c�ng 1 Sinh T� Th�p C�m: "..nCout_sinhto.."/2000")

	elseif nType == 2 then
		if GetItemCount(2,1,30553) < 1 then
			Talk(1,"","C�c h� kh�ng �em Tr�i C�y D�m, vui l�ng ki�m tra l�i.")
			return 0
		end
		DelItem(2,1,30553,1)
		ModifyExp(550000)
		AwardGenuineQi(10)
		if nCout_traicay < 2000 then
			SetTask(2713, nCout_sinhto + (nCout_traicay+1)*10000)
		end		
		nCout_traicay = floor(GetTask(2713)/10000)
		if nCout_traicay == 2000 then
			local nCheck_traicay = gf_GetTaskByte(2731, 3)
			if nCheck_traicay < 2 then
				gf_SetTaskByte(2731, 3, 1)
			end
		end
		gf_WriteLogEx("EVENT PHU THEM THANG 7", "n�p th�nh c�ng", 1, "n�p th�nh c�ng 1 tr�i c�y d�m")
		Msg2Player("N�p th�nh c�ng 1 Tr�i C�y D�m: "..nCout_traicay.."/2000")

	end
	Event_Phu_Thang8()
end
function get_award_thang7(nType)
 	local nCheckKinhMach = MeridianGetLevel()
 	if nCheckKinhMach < 1 then
		Talk(1,"","��i hi�p ch�a k�ch ho�t kinh m�ch n�n kh�ng th� nh�n th��ng !!!!")
		return 0
	end	
	if nType == 1 then
		 local nCheck_sinhto = gf_GetTaskByte(2731, 2)
		 if nCheck_sinhto < 1 then
		 	Talk(1,"","C�c h� ch�a n�p �� 2000 Sinh T� Th�p C�m.")
			return 0
		 end		 
		 if nCheck_sinhto > 1 then
		 	Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
			return 0
		 end
		 
		 gf_SetTaskByte(2731, 2, 2)
		 AwardGenuineQi(30000)
		 gf_WriteLogEx("EVENT PHU THEM THANG 7", "th�nh c�ng", 1, "Nh�n th��ng m�c 2000 Sinh T�")
	elseif nType == 2 then
		local nCheck_traicay = gf_GetTaskByte(2731, 3)
		 if nCheck_traicay < 1 then
		 	Talk(1,"","C�c h� ch�a n�p �� 2000 Tr�i C�y D�m.")
			return 0
		 end		 		
		if nCheck_traicay > 1 then
			Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i.")
			return 0
		end
		gf_SetTaskByte(2731, 3, 2)
		 AwardGenuineQi(30000)
		 gf_WriteLogEx("EVENT PHU THEM THANG 7", "th�nh c�ng", 1, "Nh�n th��ng m�c 2000 Tr�i c�y")
	end

end

function noel_get_1_time()
	local nCount = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 5, 4)
	local nCountAll = mod(GetTask(TSK_NOEL_DIEUDUONG), 1000)
	if GetItemCount(2,1,30611) < 1 then
		Talk(1,"","��i hi�p kh�ng c� 1 H�p Qu� Gi�ng Sinh.")
		return 0
	end
	if nCount >= 69 then
		Talk(1,"","H�m nay ��i hi�p �� n�p �� 69 h�p Qu� Gi�ng Sinh.")
		return 0
	end
	if nCountAll >= 690 then
		Talk(1,"","��i hi�p �� n�p �� 690 h�p Qu� Gi�ng Sinh.")
		return 0
	end
	if DelItem(2,1,30611,1) == 1 then
		ModifyExp(690000)
		AwardGenuineQi(4)
		if nCountAll < 690 then
			SetTask(TSK_NOEL_DIEUDUONG, GetTask(TSK_NOEL_DIEUDUONG)+1)
			VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, nCount+1, 5, 4)
		end
		gf_WriteLogEx("NOEL DOI DIEU DUONG", "th�nh c�ng", 1, "N�p 1 h�p qu�")
	else
		gf_WriteLogEx("NOEL DOI DIEU DUONG", "th�nh c�ng", 1, "N�p 1 h�p qu� th�t b�i")
	end
	 
end

function noel_get_1_day()
	local nCheck = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 6, 6)
	local nCount = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 5, 4)
	if nCheck == 1 then
		Talk(1,"","H�m nay ��i hi�p �� nh�n th��ng r�i, h�y quay l�i v�o ng�y mai")
		return 0
	end
	if nCount < 69 then
		Talk(1,"","H�m nay ��i hi�p ch�a n�p �� 69 h�p qu� gi�ng sinh")
		return 0
	end
	if gf_Judge_Room_Weight(4, 100," ") ~= 1 then
        	return
    end
	--Add ph�n th��ng
	LIB_Award.szLogTitle = "DOI EVENT NHAN DIEU DUONG 69"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRate(tbNoel69)
	----------
	VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 1, 6, 6)
	gf_WriteLogEx("NOEL DOI DIEU DUONG", "th�nh c�ng", 1, "Nh�n th��ng n�p 69 h�p m�i ng�y")	
end

function noel_get_all()
	local nCheck = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 7, 7)
	local nCount = mod(GetTask(TSK_NOEL_DIEUDUONG), 1000)
	if nCheck == 1 then
		Talk(1,"","��i hi�p �� nh�n th��ng r�i !!!!")
		return 0
	end
	if nCount < 690 then
		Talk(1,"","��i hi�p ch�a n�p �� 690 h�p qu� gi�ng sinh")
		return 0
	end
	if gf_Judge_Room_Weight(4, 100," ") ~= 1 then
        	return
    end
	--Add ph�n th��ng
	LIB_Award.szLogTitle = "DOI EVENT NHAN DIEU DUONG 690"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:AwardByRate(tbNoel690)
	AwardGenuineQi(10000)
	if GetTask(701) >= 0 then
		SetTask(701,GetTask(701) + 10000)
	else
		SetTask(701,GetTask(701) - 10000)
	end
	Msg2Player("B�n nh�n ���c 10000 �i�m c�ng tr�ng")
	----------
	VNG_SetTaskPos(TSK_NOEL_DIEUDUONG, 1, 7, 7)
	gf_WriteLogEx("NOEL DOI DIEU DUONG", "th�nh c�ng", 1, "Nh�n th��ng n�p 690")	
end

function show_noel_get_info()
	local nCount = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 5, 4)
	local nCountAll = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 3, 1)
	local nGetDaily = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 6, 6)
	local nGetFinal = VNG_GetTaskPos(TSK_NOEL_DIEUDUONG, 7, 7)

	Talk(1, "", "Th�ng tin chi ti�t n�p v�t ph�m:\n T�ng s� l�n �� n�p: "..nCountAll.."\n S� l�n n�p trong ng�y: "..nCount)
end

function TrangBiDieuDuong_NgauNhien()
	local tbDieuDuongRandom = {
		 [1] = {[1] = {item={{gdp={0,100,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [2] = {[1] = {item={{gdp={0,100,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [3] = {[1] = {item={{gdp={0,100,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [4] = {[1] = {item={{gdp={0,100,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [5] = {[1] = {item={{gdp={0,100,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [6] = {[1] = {item={{gdp={0,100,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [7] = {[1] = {item={{gdp={0,100,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [8] = {[1] = {item={{gdp={0,100,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [9] = {[1] = {item={{gdp={0,100,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [10] = {[1] = {item={{gdp={0,100,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [11] = {[1] = {item={{gdp={0,100,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [12] = {[1] = {item={{gdp={0,100,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [13] = {[1] = {item={{gdp={0,100,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [14] = {[1] = {item={{gdp={0,100,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [15] = {[1] = {item={{gdp={0,100,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [16] = {[1] = {item={{gdp={0,100,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [17] = {[1] = {item={{gdp={0,100,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [18] = {[1] = {item={{gdp={0,100,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [19] = {[1] = {item={{gdp={0,100,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [20] = {[1] = {item={{gdp={0,100,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [21] = {[1] = {item={{gdp={0,100,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [22] = {[1] = {item={{gdp={0,100,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [23] = {[1] = {item={{gdp={0,100,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [24] = {[1] = {item={{gdp={0,100,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [25] = {[1] = {item={{gdp={0,100,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [26] = {[1] = {item={{gdp={0,100,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [27] = {[1] = {item={{gdp={0,100,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [28] = {[1] = {item={{gdp={0,100,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [29] = {[1] = {item={{gdp={0,100,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [30] = {[1] = {item={{gdp={0,100,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [31] = {[1] = {item={{gdp={0,100,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [32] = {[1] = {item={{gdp={0,100,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [33] = {[1] = {item={{gdp={0,100,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [34] = {[1] = {item={{gdp={0,100,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [35] = {[1] = {item={{gdp={0,100,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [36] = {[1] = {item={{gdp={0,100,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [37] = {[1] = {item={{gdp={0,100,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [38] = {[1] = {item={{gdp={0,100,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [39] = {[1] = {item={{gdp={0,100,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [40] = {[1] = {item={{gdp={0,100,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [41] = {[1] = {item={{gdp={0,100,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.59},
		 [42] = {[1] = {item={{gdp={0,100,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [43] = {[1] = {item={{gdp={0,100,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [44] = {[1] = {item={{gdp={0,100,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [45] = {[1] = {item={{gdp={0,100,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [46] = {[1] = {item={{gdp={0,100,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [47] = {[1] = {item={{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [48] = {[1] = {item={{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [49] = {[1] = {item={{gdp={0,100,3176,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [50] = {[1] = {item={{gdp={0,100,3177,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [51] = {[1] = {item={{gdp={0,100,3178,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [52] = {[1] = {item={{gdp={0,100,3179,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [53] = {[1] = {item={{gdp={0,100,3180,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [54] = {[1] = {item={{gdp={0,100,3181,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [55] = {[1] = {item={{gdp={0,100,3182,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [56] = {[1] = {item={{gdp={0,100,3183,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [57] = {[1] = {item={{gdp={0,100,3184,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [58] = {[1] = {item={{gdp={0,100,3185,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [59] = {[1] = {item={{gdp={0,100,3186,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [60] = {[1] = {item={{gdp={0,100,3187,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [61] = {[1] = {item={{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [62] = {[1] = {item={{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [63] = {[1] = {item={{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [64] = {[1] = {item={{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [65] = {[1] = {item={{gdp={0,103,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [66] = {[1] = {item={{gdp={0,103,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [67] = {[1] = {item={{gdp={0,103,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [68] = {[1] = {item={{gdp={0,103,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [69] = {[1] = {item={{gdp={0,103,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [70] = {[1] = {item={{gdp={0,103,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [71] = {[1] = {item={{gdp={0,103,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [72] = {[1] = {item={{gdp={0,103,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [73] = {[1] = {item={{gdp={0,103,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [74] = {[1] = {item={{gdp={0,103,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [75] = {[1] = {item={{gdp={0,103,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [76] = {[1] = {item={{gdp={0,103,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [77] = {[1] = {item={{gdp={0,103,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [78] = {[1] = {item={{gdp={0,103,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [79] = {[1] = {item={{gdp={0,103,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [80] = {[1] = {item={{gdp={0,103,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [81] = {[1] = {item={{gdp={0,103,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [82] = {[1] = {item={{gdp={0,103,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [83] = {[1] = {item={{gdp={0,103,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [84] = {[1] = {item={{gdp={0,103,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [85] = {[1] = {item={{gdp={0,103,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [86] = {[1] = {item={{gdp={0,103,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [87] = {[1] = {item={{gdp={0,103,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [88] = {[1] = {item={{gdp={0,103,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [89] = {[1] = {item={{gdp={0,103,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [90] = {[1] = {item={{gdp={0,103,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [91] = {[1] = {item={{gdp={0,103,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [92] = {[1] = {item={{gdp={0,103,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [93] = {[1] = {item={{gdp={0,103,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [94] = {[1] = {item={{gdp={0,103,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [95] = {[1] = {item={{gdp={0,103,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [96] = {[1] = {item={{gdp={0,103,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [97] = {[1] = {item={{gdp={0,103,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [98] = {[1] = {item={{gdp={0,103,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [99] = {[1] = {item={{gdp={0,103,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [100] = {[1] = {item={{gdp={0,103,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [101] = {[1] = {item={{gdp={0,103,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [102] = {[1] = {item={{gdp={0,103,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [103] = {[1] = {item={{gdp={0,103,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [104] = {[1] = {item={{gdp={0,103,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [105] = {[1] = {item={{gdp={0,103,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [106] = {[1] = {item={{gdp={0,103,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [107] = {[1] = {item={{gdp={0,103,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [108] = {[1] = {item={{gdp={0,103,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [109] = {[1] = {item={{gdp={0,103,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [110] = {[1] = {item={{gdp={0,103,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [111] = {[1] = {item={{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [112] = {[1] = {item={{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [113] = {[1] = {item={{gdp={0,103,3176,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [114] = {[1] = {item={{gdp={0,103,3177,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [115] = {[1] = {item={{gdp={0,103,3178,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [116] = {[1] = {item={{gdp={0,103,3179,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [117] = {[1] = {item={{gdp={0,103,3180,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [118] = {[1] = {item={{gdp={0,103,3181,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [119] = {[1] = {item={{gdp={0,103,3182,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [120] = {[1] = {item={{gdp={0,103,3183,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [121] = {[1] = {item={{gdp={0,103,3184,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [122] = {[1] = {item={{gdp={0,103,3185,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [123] = {[1] = {item={{gdp={0,103,3186,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [124] = {[1] = {item={{gdp={0,103,3187,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [125] = {[1] = {item={{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [126] = {[1] = {item={{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [127] = {[1] = {item={{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [128] = {[1] = {item={{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [129] = {[1] = {item={{gdp={0,101,3128,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [130] = {[1] = {item={{gdp={0,101,3129,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [131] = {[1] = {item={{gdp={0,101,3130,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [132] = {[1] = {item={{gdp={0,101,3131,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [133] = {[1] = {item={{gdp={0,101,3132,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [134] = {[1] = {item={{gdp={0,101,3133,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [135] = {[1] = {item={{gdp={0,101,3134,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [136] = {[1] = {item={{gdp={0,101,3135,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [137] = {[1] = {item={{gdp={0,101,3136,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [138] = {[1] = {item={{gdp={0,101,3137,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [139] = {[1] = {item={{gdp={0,101,3138,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [140] = {[1] = {item={{gdp={0,101,3139,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [141] = {[1] = {item={{gdp={0,101,3140,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [142] = {[1] = {item={{gdp={0,101,3141,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [143] = {[1] = {item={{gdp={0,101,3142,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [144] = {[1] = {item={{gdp={0,101,3143,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [145] = {[1] = {item={{gdp={0,101,3144,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [146] = {[1] = {item={{gdp={0,101,3145,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [147] = {[1] = {item={{gdp={0,101,3146,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [148] = {[1] = {item={{gdp={0,101,3147,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [149] = {[1] = {item={{gdp={0,101,3148,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [150] = {[1] = {item={{gdp={0,101,3149,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [151] = {[1] = {item={{gdp={0,101,3150,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [152] = {[1] = {item={{gdp={0,101,3151,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [153] = {[1] = {item={{gdp={0,101,3152,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [154] = {[1] = {item={{gdp={0,101,3153,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [155] = {[1] = {item={{gdp={0,101,3154,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [156] = {[1] = {item={{gdp={0,101,3155,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [157] = {[1] = {item={{gdp={0,101,3156,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [158] = {[1] = {item={{gdp={0,101,3157,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [159] = {[1] = {item={{gdp={0,101,3158,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [160] = {[1] = {item={{gdp={0,101,3159,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [161] = {[1] = {item={{gdp={0,101,3160,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [162] = {[1] = {item={{gdp={0,101,3161,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [163] = {[1] = {item={{gdp={0,101,3162,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [164] = {[1] = {item={{gdp={0,101,3163,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [165] = {[1] = {item={{gdp={0,101,3164,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [166] = {[1] = {item={{gdp={0,101,3165,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [167] = {[1] = {item={{gdp={0,101,3166,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [168] = {[1] = {item={{gdp={0,101,3167,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [169] = {[1] = {item={{gdp={0,101,3168,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [170] = {[1] = {item={{gdp={0,101,3169,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [171] = {[1] = {item={{gdp={0,101,3170,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [172] = {[1] = {item={{gdp={0,101,3171,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [173] = {[1] = {item={{gdp={0,101,3172,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [174] = {[1] = {item={{gdp={0,101,3173,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [175] = {[1] = {item={{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [176] = {[1] = {item={{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [177] = {[1] = {item={{gdp={0,101,3176,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [178] = {[1] = {item={{gdp={0,101,3177,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [179] = {[1] = {item={{gdp={0,101,3178,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [180] = {[1] = {item={{gdp={0,101,3179,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [181] = {[1] = {item={{gdp={0,101,3180,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [182] = {[1] = {item={{gdp={0,101,3181,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [183] = {[1] = {item={{gdp={0,101,3182,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [184] = {[1] = {item={{gdp={0,101,3183,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [185] = {[1] = {item={{gdp={0,101,3184,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [186] = {[1] = {item={{gdp={0,101,3185,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [187] = {[1] = {item={{gdp={0,101,3186,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [188] = {[1] = {item={{gdp={0,101,3187,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0},
		 [189] = {[1] = {item={{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [190] = {[1] = {item={{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [191] = {[1] = {item={{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [192] = {[1] = {item={{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [193] = {[1] = {item={{gdp={0,100,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [194] = {[1] = {item={{gdp={0,100,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [195] = {[1] = {item={{gdp={0,100,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [196] = {[1] = {item={{gdp={0,100,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [197] = {[1] = {item={{gdp={0,100,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [198] = {[1] = {item={{gdp={0,100,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [199] = {[1] = {item={{gdp={0,103,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [200] = {[1] = {item={{gdp={0,103,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [201] = {[1] = {item={{gdp={0,103,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [202] = {[1] = {item={{gdp={0,103,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [203] = {[1] = {item={{gdp={0,103,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [204] = {[1] = {item={{gdp={0,103,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [205] = {[1] = {item={{gdp={0,101,3174,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [206] = {[1] = {item={{gdp={0,101,3175,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [207] = {[1] = {item={{gdp={0,101,3188,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [208] = {[1] = {item={{gdp={0,101,3189,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [209] = {[1] = {item={{gdp={0,101,3190,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
		 [210] = {[1] = {item={{gdp={0,101,3191,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}, nRate = 0.57},
	}
	LIB_Award:AwardByRate(tbDieuDuongRandom)
end