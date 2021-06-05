Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
szLogTitle = "EVENT TRANG BI KIM XA"
tbBanhTrungThu = {
	[1] = {item={{gdp={2,1,30569,1}, name="B�nh Trung Cam"}}},
	[2] = {item={{gdp={2,1,30570,1}, name="B�nh Trung D�u"}}},
	[3] = {item={{gdp={2,1,30571,1}, name="B�nh Trung S� c� la"}}},
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
	[1] = {item={{gdp={2,1,30490,15}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
	[2] = {item={{gdp={2,1,30490,10}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
	[3] = {item={{gdp={2,1,30490,5}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
	[4] = {item={{gdp={2,1,30490,1}, name="Ho�ng Kim ��i Ng�n Phi�u"}}},
}

szNpcName = "<color=green>La Sa<color>: "

function EventTrangBiKimXa_Menu()
	local nDate = tonumber(date("%y%m%d"))
	local tbSay = {}
	tinsert(tbSay, "H� tr� nguy�n li�u l�m b�nh/HoTroNguyenLieu_Menu")
	if nDate >= 130924 and nDate <= 130930 then
		tinsert(tbSay, "Tham d� cu�c �ua l�m b�nh/NopBanh_Menu")
		tinsert(tbSay, "C�p nh�t th� h�ng hi�n t�i/EventKimXa_XemXepHang")
	end
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say(szNpcName.."Trang b� Kim X� ta kh�ng thi�u, nh�ng ta ch� mu�n trao cho ai c� kh� n�ng l�m b�nh gi�i h�n ta...", getn(tbSay), tbSay)
end


function HoTroNguyenLieu_Menu()
	local tbSay = {}
	tinsert(tbSay, "Ta c� 39 xu v�t ph�m/#HoTroNguyenLieu_Done(1)")
	tinsert(tbSay, "Ta c� 99 v�ng v� 99 v� l�m b�o h�p/#HoTroNguyenLieu_Done(2)")
	tinsert(tbSay, "Quay l�i/EventTrangBiKimXa_Menu")
	Say(szNpcName.."N�u thi�u nguy�n li�u l�m b�nh, c�c h� c� th� h�i ta.", getn(tbSay), tbSay)
end


function HoTroNguyenLieu_Done(nOption)
	local tbNguyenLieu = {
		[1] = {item={{gdp={2,1,30230,39}, name="Xu V�t Ph�m"}}},	
		[2] = {item={{gdp={2,1,30132,99}, name="V� L�m B�o H�p"}}, nGold = 990000},
	}
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbNguyenLieu[nOption])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbNguyenLieu[nOption])
	AddItem(2,1,30567	,1000)
	if nOption == 1 then
		gf_WriteLogEx(szLogTitle, "nh�n", 1, "Mua 1000 b�t th�ch rau c�u (39 xu v�t ph�m)")
	else
		gf_WriteLogEx(szLogTitle, "nh�n", 1, "Mua 1000 b�t th�ch rau c�u (99 v�ng + VLBH)")
	end
end


function NopBanh_Menu()
	local tbSay = {}
	for i=1, getn(tbBanhTrungThu) do
		tinsert(tbSay, "Ta mu�n n�p "..tbBanhTrungThu[i]["item"][1]["name"].."/#NopBanh_Done("..i..")")
	end
	tinsert(tbSay,"Xem �i�m t�ch l�y/EventKimXa_XemTichLuy")
	tinsert(tbSay, "Quay l�i/EventTrangBiKimXa_Menu")
	Say(szNpcName.."Sao r�i, c�c h� �� l�m ���c b�nh g� ��a ta xem?", getn(tbSay), tbSay)
end


function NopBanh_Done(nOption)
	local tbAward = {
		nCheckExp = 0,
		item = {{gdp={2,1,30390,1}, name="M�nh Thi�n Cang"}},
		nExp = 390000,
		task = {{TSK_EVENTKIMXA,1,"�i�m l�m b�nh"}},
	}
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbBanhTrungThu[nOption])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbBanhTrungThu[nOption])
	LIB_Award:Award(tbAward)
	gf_WriteLogEx(szLogTitle, "n�p", 1, "N�p"..tbBanhTrungThu[nOption]["item"][1]["name"])
	if GetTask(TSK_EVENTKIMXA) == 1000 then
		gf_WriteLogEx(szLogTitle, "n�p", 1, "N�p 1000 b�nh c�c lo�i")
	end
	NopBanh_Menu()	
end

function EventKimXa_XemTichLuy()
	Talk(1,"",szNpcName.."S� �i�m hi�n t�i c�a ng��i l� <color=yellow>"..GetTask(TSK_EVENTKIMXA).."<color>")
end


function EventKimXa_XemXepHang()
	local nRank = 0
	local nPoint = GetTask(TSK_EVENTKIMXA)
	if nPoint < 1000 then
		Talk(1,"",szNpcName.."Ng��i v�n ch�a �� 1000 �i�m n�n ch�a ���c v�o danh s�ch top 100..")
		return 0	
	end
	
	local szName = GetName()
	local tbRecord = {nPoint, szName}
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	local nCheckRank = 0
	for i=1, getn(LIB_txtData.tbTextData) do
		if LIB_txtData.tbTextData[i][2] == szName then
			LIB_txtData.tbTextData[i][1] = nPoint
			nCheckRank = i
		end
	end
	if nCheckRank == 0 then
		tinsert(LIB_txtData.tbTextData, tbRecord)
	end
	sort(LIB_txtData.tbTextData, function(x,y) return tonumber(x[1]) > tonumber(y[1]) end)
	for i=1, getn(LIB_txtData.tbTextData) do
		if LIB_txtData.tbTextData[i][2] == szName then
			nRank = i
			break
		end
	end
	
	if nRank == 0 or nRank == 101 then
		Talk(1,"",szNpcName.."R�t ti�c, ng��i v�n c�n thua nhi�u ng��i, hi�n ch�a l�t v�o danh s�ch 100 ng��i d�n ��u.")
		return 0	
	end
	
	local tbNewRank = {}
	for i=1,100 do
		tinsert(tbNewRank, LIB_txtData.tbTextData[i])
	end
	LIB_txtData.tbTextData = tbNewRank
	LIB_txtData:SaveMultiColumn()
	local szResult = ""
	if nRank >=2 and nRank <= 99 then
		szResult = "\nHi�n t�i ng��i �ang ��ng h�ng <color=red>"..nRank.."<color> trong danh s�ch, v�i s� �i�m l� <color=yellow>"..LIB_txtData.tbTextData[nRank][1].."<color>\n"
		szResult = szResult .. "Ng��i �ang b�m theo <color=green>"..LIB_txtData.tbTextData[(nRank-1)][2].."<color> v�i <color=yellow>"..LIB_txtData.tbTextData[(nRank-1)][1].."<color>\n"
		szResult = szResult .. "<color=green>"..LIB_txtData.tbTextData[(nRank+1)][2].."<color> b�m s�t ng��i v�i s� �i�m l� <color=yellow>"..LIB_txtData.tbTextData[(nRank+1)][1].."<color>"
	else
		szResult = "Hi�n t�i ng��i �ang ��ng h�ng <color=yellow>"..nRank.."<color> trong danh s�ch, v�i s� �i�m l� "..LIB_txtData.tbTextData[nRank][1]
	end
	Talk(1,"",szNpcName..szResult)
end


function NhanThuongTop()
	if gf_Judge_Room_Weight(20, 300) == 0 then
		Talk(1,"", szNpcName.."S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	if GetTask(TSK_EVENTKIMXA_NHANTHUONG) == 1 then
		Talk(1,"","Ng��i �� nh�n th��ng, c�n mu�n nh�n n�a sao?");
		return 0
	end
	local nQuanCong = GetTask(701)
	local nPhe = 0
	if nQuanCong >= 0 then
		nPhe = 1
	else
		nPhe = 2
	end
	if nPhe == 0 then
		Talk(1,"","Ng��i ch�a gia nh�p phe T�ng/Li�u, kh�ng th� ��i trang b� n�y.");
		return 0
	end
	local tbSay = {}
	tinsert(tbSay, "Ta mu�n nh�n trang b� Nam Ti�u Chu�n/#NhanThuongTop_Confirm(1)")
	tinsert(tbSay, "Ta mu�n nh�n trang b� Nam Kh�i Ng�/#NhanThuongTop_Confirm(2)")
	tinsert(tbSay, "Ta mu�n nh�n trang b� N� G�i C�m/#NhanThuongTop_Confirm(3)")
	tinsert(tbSay, "Ta mu�n nh�n trang b� Ki�u N�/#NhanThuongTop_Confirm(4)")
	tinsert(tbSay, "Ta ch�a mu�n nh�n/gf_DoNothing")
	Say("Ng��i c� th� ch�n trang b� theo ki�u nh�n v�t h�nh t�y �. H�y ch�n ki�u h�nh ng��i th�ch.\n<color=red>L�u �:<color> Ki�u h�nh ch� c� t�c d�ng v�i ph�n th��ng h�ng nh�t, nh�, ba.", getn(tbSay), tbSay)
end


function NhanThuongTop_Confirm(nBody)
	if GetTask(TSK_EVENTKIMXA_NHANTHUONG) == 1 then
		Talk(1,"","Ng��i �� nh�n th��ng, c�n mu�n nh�n n�a sao?");
		return 0
	end
	local nQuanCong = GetTask(701)
	if nQuanCong == 0 then
		Talk(1,"",szNpcName.."Ng��i ch�a gia nh�p phe T�ng/Li�u, kh�ng th� ��i trang b� n�y.");
		return 0
	end
	local nPhe = 0
	if nQuanCong >= 0 then
		nPhe = 1
	else
		nPhe = 2
	end
	local szName = GetName()
--	local nPoint = GetTask(TSK_EVENTKIMXA)
	LIB_txtData:Init("eventkimxa.txt")
	LIB_txtData:LoadMultiColumn()
	local nRank = 101
	for i=1, getn(LIB_txtData.tbTextData) do
--		Msg2Player(i..": "..LIB_txtData.tbTextData[i][2].." = " .. szName)
		if tostring(LIB_txtData.tbTextData[i][2]) == tostring(szName) then
			nRank = i
			break
		end
	end
	
	local nCheck = 0
	if nRank < 4 then
		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[nRank])
	elseif nRank < 21 then
		nCheck = LIB_Award:CheckMaterial(tbTopNguyenLieu[4])
	else
		nCheck = 1
	end
	if nCheck ~= 1 then
		return 0
	end
	
	if nRank < 4 then
		LIB_Award:PayMaterial(tbTopNguyenLieu[nRank])
	elseif nRank < 21 then
		LIB_Award:PayMaterial(tbTopNguyenLieu[4])
	end
	
	Msg2Player(nRank)
	if nRank == 1 then
		LIB_Award:Award(tbKimXaTuongQuan[nPhe][1][nBody])
		LIB_Award:Award(tbKimXaTuongQuan[nPhe][2][nBody])
		LIB_Award:Award(tbKimXaTuongQuan[nPhe][3][nBody])
		gf_WriteLogEx(szLogTitle, "nh�n", 1, "Ph�n th��ng h�ng 1")
	elseif nRank == 2 then
		LIB_Award:Award(tbKimXaTuongQuan[nPhe][1][nBody])
		LIB_Award:Award(tbKimXaTuongQuan[nPhe][3][nBody])
			gf_WriteLogEx(szLogTitle, "nh�n", 1, "Ph�n th��ng h�ng 2")
	elseif nRank == 3 then
		LIB_Award:Award(tbKimXaTuongQuan[nPhe][2][nBody])
		gf_WriteLogEx(szLogTitle, "nh�n", 1, "Ph�n th��ng h�ng 3")
	elseif nRank < 21 then
		LIB_Award:Award(tbThoTrang)
		gf_WriteLogEx(szLogTitle, "nh�n", 1, "Ph�n th��ng h�ng 4-20")
	elseif nRank <101 then
		LIB_Award:Award(tbQuanCongHH)
		gf_WriteLogEx(szLogTitle, "nh�n", 1, "Ph�n th��ng h�ng 21-100")
	else
		Talk(1,"",szNpcName.."R�t ti�c, ng��i kh�ng c� t�n trong danh s�ch nh�n th��ng.");
		return 0
	end
	for i=1,6 do
		LIB_Award:AwardByRate(tbTop100AwardRate)
	end
	LIB_Award:Award(tbDefaultAward)
	SetTask(TSK_EVENTKIMXA_NHANTHUONG,1)
	gf_WriteLogEx(szLogTitle, "nh�n", 1, "Ph�n th��ng chung top 100")
end