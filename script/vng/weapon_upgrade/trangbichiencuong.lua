Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");
DIEUDUONG2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\dieuduong2chiencuong.lua"
BKVD2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\bachkimviemde2chiencuong.lua"
DIEUDUONG2CHIENCUONG_FILE2 = "\\script\\vng\\weapon_upgrade\\dieuduong2chiencuong_3.lua"
NGULONG2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\ngulong2chiencuong.lua"
THUONGUNG2CHIENCUONG_FILE = "\\script\\vng\\weapon_upgrade\\thuongung2chiencuong.lua"



LIB_Award.szLogTitle = "TRANG BI CHIEN CUONG"
LIB_Award.szLogAction = "nh�n"

tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}

tbChienCuongNguyenLieu = {
	[1] = {item={{gdp={2,95,204,2}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,2}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,1005,6}, name="Chi�n Th�n Ho�n"}, {gdp={2,1,30499,50}, name="Hu�n Ch��ng Anh H�ng"}}},
	[2] = {item={{gdp={2,95,204,2}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,2}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,1005,6}, name="Chi�n Th�n Ho�n"}, {gdp={2,1,30499,50}, name="Hu�n Ch��ng Anh H�ng"}}},
	[3] = {item={{gdp={2,95,204,2}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,2}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,1005,6}, name="Chi�n Th�n Ho�n"}, {gdp={2,1,30499,50}, name="Hu�n Ch��ng Anh H�ng"}}},
	[4] = {item={{gdp={2,95,204,2}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,2}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,1005,9}, name="Chi�n Th�n Ho�n"}, {gdp={2,1,30499,50}, name="Hu�n Ch��ng Anh H�ng"}}},
}

function TrangBiChienCuong_Form()
	local nDate = tonumber(date("%Y%m%d"))
	local szTitle = "C�c h� c� th� ��i trang b� Chi�n Cu�ng b�ng nhi�u c�ch:\n"
	local tbSay = {}
	tinsert(tbSay, "��i b�ng Thi�n M�n Kim L�nh v� Thi�n Cang L�nh/TrangBiChienCuong_CongThuc1")
	tinsert(tbSay, "N�ng c�p t� trang b� Di�u D��ng nh�n Chi�n Cu�ng/TrangBiChienCuong_CongThuc2_Form")
	if nDate <= 20140412 then
		tinsert(tbSay, "N�ng c�p t� trang b� Di�u D��ng nh�n Chi�n Cu�ng +10/TrangBiChienCuong_CongThuc3_Form")
	end
	tinsert(tbSay, "��i b�ng trang b� B�ch Kim Vi�m ��/BKVD2ChienCuong_Form")
	tinsert(tbSay, "N�ng c�p t� trang b� Ng� Long T��ng Qu�n/NguLong2ChienCuong_Form")
	tinsert(tbSay, "N�ng c�p t� trang b� Th��ng �ng T��ng Qu�n/ThuongUng2ChienCuong_Form")

	tinsert(tbSay, "Ta ch�a mu�n n�ng c�p/gf_DoNothing")
	Say(szTitle, getn(tbSay), tbSay)
end

function NguLong2ChienCuong_Form()
	local szSay = "��i trang b� Chi�n Cu�ng +0 t� trang b� Ng� Long T��ng Qu�n c�n:\n"
	szSay = szSay .. "+ Trang b�: N�n, �o, qu�n Ng� Long T��ng Qu�n +11, 4 Chi�n Th�n Ho�n, 100 Huy Ch��ng D�ng S�.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ��ng � ��i/NguLong2ChienCuong")
	tinsert(tbSay, "Ta mu�n suy ngh� th�m/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end

function NguLong2ChienCuong()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i trang b� Chi�n Cu�ng.")
		return 0
	end
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", NGULONG2CHIENCUONG_FILE, 1)
end

function ThuongUng2ChienCuong_Form()
	local szSay = "��i trang b� Chi�n Cu�ng +10 t� trang b� Th��ng �ng T��ng Qu�n c�n:\n"
	szSay = szSay .. "+ Trang b�: N�n, �o, qu�n Th��ng �ng T��ng Qu�n +11, 3 Chi�n Th�n Ho�n, 100 Huy Ch��ng D�ng S�.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ��ng � ��i/ThuongUng2ChienCuong")
	tinsert(tbSay, "Ta mu�n suy ngh� th�m/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end

function ThuongUng2ChienCuong()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i trang b� Chi�n Cu�ng.")
		return 0
	end
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", THUONGUNG2CHIENCUONG_FILE, 1)
end

function TrangBiChienCuong_CongThuc1()
	local szTitle = "��i trang b� Chi�n Cu�ng c�n:\n- ��u Qu�n, Th��ng Y, H� Y: 2 Thi�n Cang L�nh + 2 Thi�n M�n Kim L�nh + 6 Chi�n Th�n Ho�n + 50 Hu�n Ch��ng Anh H�ng\n - V� kh�: 2 Thi�n Cang L�nh + 2 Thi�n M�n Kim L�nh + 9 Chi�n Th�n Ho�n + 50 Hu�n Ch��ng Anh H�ng"
	local tbSay = {
		"Ta mu�n l�y ��u Qu�n/#ChienCuong_DoiTrangBi(1)",
		"Ta mu�n l�y Th��ng Y/#ChienCuong_DoiTrangBi(2)",
		"Ta mu�n l�y H� Trang/#ChienCuong_DoiTrangBi(3)",
		"Ta mu�n l�y V� Kh�/#ChienCuong_DoiTrangBi(4)",
		"Ta ��n xem th�i/gf_DoNothing",
	}
	Say(szTitle, getn(tbSay), tbSay)
end

function TrangBiChienCuong_CongThuc2()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i trang b� Chi�n Cu�ng.")
		return 0
	end
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", DIEUDUONG2CHIENCUONG_FILE, 1)
end



function ChienCuong_DoiTrangBi(nOption)
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i trang b� Chi�n Cu�ng.")
		return 0
	end
	if tbChienCuongNguyenLieu[nOption] == nil then
		print("NGUYEN LIEU KHONG DUNG")
		return 0
	end
	if gf_Judge_Room_Weight(1, 250) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, c�c h� h�y s�p x�p l�i nh�.")
		return 0
	end
	local nCheck = 0
	nCheck = LIB_Award:CheckMaterial(tbChienCuongNguyenLieu[nOption])
	if nCheck ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbChienCuongNguyenLieu[nOption])
	local nBody = GetBody()
	if nOption == 1 then
		LIB_Award:AwardByRoute(tbTrangBiChienCuong[103][nBody])
	elseif nOption == 2 then
		LIB_Award:AwardByRoute(tbTrangBiChienCuong[100][nBody])
	elseif nOption == 3 then
		LIB_Award:AwardByRoute(tbTrangBiChienCuong[101][nBody])
	elseif nOption == 4 then
		LIB_Award:AwardByRoute(tbVuKhiChienCuong[nBody])
	end
end


function TrangBiChienCuong_CongThuc2_Form()
	local szSay = "��i trang b� Chi�n Cu�ng t� trang b� Di�u D��ng c�n:\n"
	szSay = szSay .. "+ Trang b�: N�n, �o, qu�n Di�u D��ng +13 tr� l�n, 1 Thi�n Cang L�nh, 1 Thi�n M�n Kim L�nh, 5 Chi�n Th�n Ho�n, 50 Hu�n Ch��ng Anh H�ng.\n"
	szSay = szSay .. "+ V� kh�: V� kh� Di�u D��ng +13 tr� l�n, 1 Thi�n Cang L�nh, 1 Thi�n M�n Kim L�nh, 7 Chi�n Th�n Ho�n, 50 Hu�n Ch��ng Anh H�ng.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ��ng � ��i/TrangBiChienCuong_CongThuc2")
	tinsert(tbSay, "Ta mu�n suy ngh� th�m/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end


function TrangBiChienCuong_CongThuc2()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i trang b� Chi�n Cu�ng.")
		return 0
	end
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", DIEUDUONG2CHIENCUONG_FILE, 1)
end


function TrangBiChienCuong_CongThuc3_Form()
	local szSay = "��i trang b� Chi�n Cu�ng +10 t� trang b� Di�u D��ng c�n:\n"
	szSay = szSay .. "+ Trang b�: N�n, �o, qu�n Di�u D��ng +13, 19 Thi�n Th�ch Tinh Th�ch, 19 Hu�n Ch��ng Anh H�ng, 6 Chi�n Th�n Ho�n.\n"
	szSay = szSay .. "+ V� kh�: V� kh� Di�u D��ng +13, 44 Thi�n Th�ch Tinh Th�ch, 44 Hu�n Ch��ng Anh H�ng, 11 Chi�n Th�n Ho�n.\n"
	local tbSay = {}
	tinsert(tbSay, "Ta ��ng � ��i/TrangBiChienCuong_CongThuc3")
	tinsert(tbSay, "Ta mu�n suy ngh� th�m/gf_DoNothing")
	Say(szSay, getn(tbSay), tbSay)
end


function TrangBiChienCuong_CongThuc3()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate > 20140412 then
		return 0
	end
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i trang b� Chi�n Cu�ng.")
		return 0
	end
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", DIEUDUONG2CHIENCUONG_FILE2, 1)
end


function BKVD2ChienCuong_Form()
	local nRoute = GetPlayerRoute()
	if tbRoute [nRoute] ~= 1 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� ��i trang b� Chi�n Cu�ng.")
		return 0
	end
	PutinItemBox("N�ng c�p trang b�" ,1 , "X�c nh�n mu�n th�c hi�n n�ng c�p?", BKVD2CHIENCUONG_FILE, 1)
end