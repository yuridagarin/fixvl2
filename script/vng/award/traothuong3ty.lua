Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");

TB_EXT_TRAOTHUONG = {[1] = 1, [2] = 5, [3] = 6}

tbAward = {
		[1] = {fn="MatTichNgauNhien()"},
		[2] = {fn="TraiCayNgauNhien()"},
		[3] = {item={{gdp={2,1,30071,1}}}},

}
LIB_Award.szLogTitle = "TRAO THUONG 3 TY"
LIB_Award.szLogAction = "nh�n"


function TraoThuong2Ty_Menu()
	tbSay = {}
	local nHanhPhuc = GetExtPoint(TB_EXT_TRAOTHUONG[1])
	local nAnKhang = GetExtPoint(TB_EXT_TRAOTHUONG[2])
	local nThinhVuong = GetExtPoint(TB_EXT_TRAOTHUONG[3])
	tinsert(tbSay, "Nh�n gi�i H�nh Ph�c ("..nHanhPhuc.." gi�i)/#TraoThuong3Ty(1)")
	tinsert(tbSay, "Nh�n gi�i An Khang ("..nAnKhang.." gi�i)/#TraoThuong3Ty(2)")
	tinsert(tbSay, "Nh�n gi�i Th�nh V��ng ("..nThinhVuong.." gi�i)/#TraoThuong3Ty(3)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("C�c h� c� gi�i th��ng nh� 3 t�, c� th� ��n g�p ta �� nh�n.", getn(tbSay), tbSay)
end


function TraoThuong3Ty(nOption)
	if GetExtPoint(TB_EXT_TRAOTHUONG[nOption]) <= 0 then
		Talk(1,"","Kh�ng t�m th�y th�ng tin ph�n th��ng.")
		return 0
	end
	if gf_Judge_Room_Weight(1,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, h�y d�n d�p h�nh tranh.")
		return 0
	end
	VNG_PayExtPoint(TB_EXT_TRAOTHUONG[nOption], 1)
	LIB_Award:Award(tbAward[nOption])
	TraoThuong2Ty_Menu()
end


function TraiCayNgauNhien()
	if GetExtPoint(TB_EXT_TRAOTHUONG) <= 0 then
		return 0
	end
	local nRand = mod(random(0,10000),20)
	local tbAward = {item={{gdp={2,1,30164+nRand,10}}}}
	LIB_Award:Award(tbAward)
end


function MatTichNgauNhien()
	if GetExtPoint(TB_EXT_TRAOTHUONG) <= 0 then
		return 0
	end
	local tbMatTichCaoCap = {204,206,205,207,208,209,210,211,212,213,214,215,216,217,218,222,223}
	local nRand = mod(random(0,1000),17) + 1
	local tbAward = {item={{gdp={0,107,tbMatTichCaoCap[nRand],1}}}}
	LIB_Award:Award(tbAward)
end