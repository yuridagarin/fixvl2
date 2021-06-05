Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
szLogTitle = "TAI XUAT GIANG HO"
LIB_Award.szLogTitle = szLogTitle
LIB_Award.szLogAction = "nh�n"

tbTaiXuatAward = {
	[1] = {nBachCau1 = 168*60, nExp = 100000000},
	[2] = {nLucThan1 = 168*60, nExp = 100000000},
	[3] = {nTamThanh1 = 168*60, nExp = 100000000},
	[4] = {nTuLinh1 = 168*60, nExp = 100000000, fn="TrangBiHaoNguyet(103);"},
	[5] = {nGold = 168000, nExp = 100000000, fn="MatTichCaoCap(16);TrangBiHaoNguyet(100);"},
	[6] = {nGold = 168000, nExp = 100000000, fn="MatTichCaoCap(16);TrangBiHaoNguyet(101);"},
	[7] = {nExp = 200000000, item={
				{gdp={2,1,30408,3}}, -- Thi�n Huy�n Kh�c B�n 3
				{gdp={0,102,3175,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3177,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3179,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3181,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3183,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,105,15,1,4,-1,-1,-1,-1,-1,-1,-1}, nExpired = 90*24*3600},  -- Phi�u V�
			},
			fn="VuKhiHaoNguyet()",
		},
	[8] = {nExp = 500000000, nChankhi = 5000, fn="TrangBiDieuDuong(103);"},
	[9] = {nExp = 500000000, nChankhi = 5000, fn="TrangBiDieuDuong(100);"},
	[10] = {nExp = 500000000, nChankhi = 5000, fn="TrangBiDieuDuong(101);"},
	[11] = {nExp = 1000000000, nChankhi = 10000, item={
				{gdp={0,102,3176,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3178,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3180,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3182,1,4,-1,-1,-1,-1,-1,-1,-1}},
				{gdp={0,102,3184,1,4,-1,-1,-1,-1,-1,-1,-1}},
			},
		},
	[12] = {nExp = 1500000000, nChankhi = 15000, fn="VuKhiDieuDuong();"}
}

tbCondition = {	-- lo�i �i�u ki�n - �i�u ki�n - bit ph�n th��ng - h�nh trang - c�n n�ng
	[1] = {1, {TSK_TAIXUAT_MISSION1,2,1,18}, 2, 1, 100},
	[2] = {1, {TSK_TAIXUAT_MISSION1,4,3,18}, 3, 1, 100},
	[3] = {1, {TSK_TAIXUAT_MISSION1,6,5,18}, 4, 1, 100},
	[4] = {1, {TSK_TAIXUAT_MISSION1,8,7,18}, 5, 2, 100},
	[5] = {1, {TSK_TAIXUAT_MISSION2,2,1,18}, 6, 18, 100},
	[6] = {1, {TSK_TAIXUAT_MISSION2,4,3,18}, 7, 18, 100},
	[7] = {1, {TSK_TAIXUAT_MISSION2,6,5,20}, 8, 11, 200},
	[8] = {2, {item={{gdp={2,1,30230,3999}}}, nGold=39990000}, 9, 2, 100},
	[9] = {2, {item={{gdp={2,1,30230,3999}}}, nGold=39990000}, 10, 2, 100},
	[10] = {2, {item={{gdp={2,1,30230,3999}}}, nGold=39990000}, 11, 2, 100},
	[11] = {2, {item={{gdp={2,1,30230,4999}}}, nGold=49990000}, 12, 6, 100},
	[12] = {2, {item={{gdp={2,1,30230,5999}}}, nGold=59990000}, 13, 2, 100},
}


function TaiXuatGiangHo_Menu()
	local tbSay = {}
	if CheckTaiXuat() == 0 then
		Talk(1,"","N�m nay v� l�m nhi�u bi�n ��ng, c�c cao th� qui �n khi x�a c�ng kh�ng th� ng�i y�n, ��u chu�n b� t�i xu�t giang h�...")
		return 0
	end
	tinsert(tbSay,"Nh�n th��ng mi�n ph�/TaiXuat_Award_Free")
	tinsert(tbSay,"Nh�n th��ng t�n ph�/TaiXuat_Award_Fee")
	tinsert(tbSay,"Ta ch� gh� xem/gf_DoNothing")
	Say("Ng��i qui �n giang h� �� l�u, c�ng l�c c� ph�n gi�m s�t. H�y c� g�ng ho�n th�nh c�c th� th�ch c�a ta, ta s� t�ng c�c h� m�t �t b�u v�t �� b�n t�u giang h�.", getn(tbSay), tbSay)
end


function CheckTaiXuat()
	return gf_GetTaskBit(TSK_TAIXUAT_FLAG, 1)
end

function CheckAward(nIndex)
	return gf_GetTaskBit(TSK_TAIXUAT_FLAG, tbCondition[nIndex][3])
end


function TaiXuat_Award_Free()
	local tbSay = {}
	if CheckTaiXuat() == 0 then
		Talk(1,"","N�m nay v� l�m nhi�u bi�n ��ng, c�c cao th� qui �n khi x�a c�ng kh�ng th� ng�i y�n, ��u chu�n b� t�i xu�t giang h�...")
		return 0
	end
	local tbQty = {}
	for i=1,7 do
		local nQty = VNG_GetTaskPos(tbCondition[i][2][1], tbCondition[i][2][2], tbCondition[i][2][3])
		tbQty[i] = nQty.."/"..tbCondition[i][2][4]
	end
	tinsert(tbSay, "Nh�n th��ng Thi�n M�n Tr�n ("..tbQty[1]..")/#TaiXuat_NhanThuong(1)")
	tinsert(tbSay, "Nh�n th��ng T�i Nguy�n Chi�n ("..tbQty[2]..")/#TaiXuat_NhanThuong(2)")
	tinsert(tbSay, "Nh�n th��ng L��ng S�n B�c ("..tbQty[3]..")/#TaiXuat_NhanThuong(3)")
	tinsert(tbSay, "Nh�n th��ng Chi�n tr��ng n�ng trang ("..tbQty[4]..")/#TaiXuat_NhanThuong(4)")
	tinsert(tbSay, "Nh�n th��ng Chi�n tr��ng l��ng th�o ("..tbQty[5]..")/#TaiXuat_NhanThuong(5)")
	tinsert(tbSay, "Nh�n th��ng Chi�n tr��ng th�nh tr� ("..tbQty[6]..")/#TaiXuat_NhanThuong(6)")
	tinsert(tbSay, "Nh�n th��ng Chi�n tr��ng Nh�n M�n Quan ("..tbQty[7]..")/#TaiXuat_NhanThuong(7)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("Ng��i qui �n giang h� �� l�u, c�ng l�c c� ph�n gi�m s�t. H�y c� g�ng ho�n th�nh c�c th� th�ch c�a ta, ta s� t�ng c�c h� m�t �t b�u v�t �� b�n t�u giang h�.", getn(tbSay), tbSay)
end


function TaiXuat_Award_Fee()
	local tbSay = {}
	if CheckTaiXuat() == 0 then
		Talk(1,"","N�m nay v� l�m nhi�u bi�n ��ng, c�c cao th� qui �n khi x�a c�ng kh�ng th� ng�i y�n, ��u chu�n b� t�i xu�t giang h�...")
		return 0
	end
	tinsert(tbSay, "Nh�n th��ng Thi�n M�n Tr�n/#TaiXuat_NhanThuong(8)")
	tinsert(tbSay, "Nh�n th��ng T�i Nguy�n Chi�n/#TaiXuat_NhanThuong(9)")
	tinsert(tbSay, "Nh�n th��ng L��ng S�n B�c/#TaiXuat_NhanThuong(10)")
	tinsert(tbSay, "Nh�n th��ng Chi�n tr��ng nh�/#TaiXuat_NhanThuong(11)")
	tinsert(tbSay, "Nh�n th��ng Chi�n tr��ng Nh�n M�n Quan/#TaiXuat_NhanThuong(12)")
	tinsert(tbSay, "Ta ch� gh� xem/gf_DoNothing")
	Say("Ng��i qui �n giang h� �� l�u, trang, v� kh� ��u h� m�n c� k�. N�u gi�u c�, ta s� b�n cho c�c h� m�t v�i b�o b�i.", getn(tbSay), tbSay)
end


function VuKhiHaoNguyet()
	local tbVuKhiHaoNguyet = {
		[2] = {item={{gdp={0,3,8972,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[4] = {item={{gdp={0,0,8973,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[3] = {item={{gdp={0,8,8974,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[6] = {item={{gdp={0,1,8975,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[8] = {item={{gdp={0,2,8976,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[9] = {item={{gdp={0,10,8977,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[11] = {item={{gdp={0,0,8978,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[12] = {item={{gdp={0,5,8979,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[14] = {item={{gdp={0,2,8980,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[15] = {item={{gdp={0,9,8981,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[17] = {item={{gdp={0,6,8982,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[18] = {item={{gdp={0,4,8983,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[20] = {item={{gdp={0,7,8984,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[21] = {item={{gdp={0,11,8985,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[23] = {item={{gdp={0,2,8986,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[29] = {item={{gdp={0,13,8990,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[30] = {item={{gdp={0,12,8991,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
	}
	LIB_Award:AwardByRoute(tbVuKhiHaoNguyet)
end


function TrangBiHaoNguyet(nD)
	local tbTrangBiHaoNguyet = {
		[2] = {3064, 3065},
		[3] = {3068, 3069},
		[4] = {3066, 3067},
		[6] = {3070, 3071, 3072, 3073},
		[8] = {nil, nil, 3074, 3075},
		[9] = {nil, nil, 3076, 3077},
		[11] = {3078, 3079, 3080, 3081},
		[12] = {3082, 3083, 3084, 3085},
		[14] = {3086, 3087, 3088, 3089},
		[15] = {3090, 3091, 3092, 3093},
		[17] = {3094, 3095, 3096, 3097},
		[18] = {3098, 3099, 3100, 3101},
		[20] = {3102, 3103, 3104, 3105},
		[21] = {3106, 3107, 3108, 3109},
		[23] = {3110, 3111},
		[29] = {nil, nil, 3124, 3125},
		[30] ={nil, nil, 3126, 3127},
	}
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local tbAward = {item={{gdp={0,nD,tbTrangBiHaoNguyet[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}
	LIB_Award:Award(tbAward)
end


function MatTichCaoCap(nQty)
	local tbMatTich = {
		[2] = 204, [4] = 205, [3] = 206, [6] = 207, [8] = 208, [9] = 209, [11] = 210, [12] = 211, [14] = 212,
		[15] = 213, [17] = 214, [18] = 215, [20] = 216, [21] = 217, [23] = 218, [29] = 222, [30] = 223,
	}
	local nRoute = GetPlayerRoute()
	local tbAward = {item={{gdp={0,107,tbMatTich[nRoute],nQty}}}}
	LIB_Award:Award(tbAward)
end


function TrangBiDieuDuong(nD)
	local tbTrangBiDieuDuong = {
		[2] = {3128, 3129},
		[3] = {3132, 3133},
		[4] = {3130, 3131},
		[6] = {3134, 3135, 3136, 3137},
		[8] = {nil, nil, 3138, 3139},
		[9] = {nil, nil, 3140, 3141},
		[11] = {3142, 3143, 3144, 3145},
		[12] = {3146, 3147, 3148, 3149},
		[14] = {3150, 3151, 3152, 3153},
		[15] = {3154, 3155, 3156, 3157},
		[17] = {3158, 3159, 3160, 3161},
		[18] = {3162, 3163, 3164, 3165},
		[20] = {3166, 3167, 3168, 3169},
		[21] = {3170, 3171, 3172, 3173},
		[23] = {3174, 3175},
		[29] = {nil, nil, 3188, 3189},
		[30] = {nil, nil, 3190, 3191},
	}
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local tbAward = {item={{gdp={0,nD,tbTrangBiDieuDuong[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}}
	LIB_Award:Award(tbAward)
end


function VuKhiDieuDuong()
	tbVukhiDieuDuong = {
		[2]={item={{gdp={0,3,8992,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[4]={item={{gdp={0,0,8993,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[3]={item={{gdp={0,8,8994,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[6]={item={{gdp={0,1,8995,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[8]={item={{gdp={0,2,8996,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[9]={item={{gdp={0,10,8997,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[11]={item={{gdp={0,0,8998,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[12]={item={{gdp={0,5,8999,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[14]={item={{gdp={0,2,9000,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[15]={item={{gdp={0,9,9001,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[17]={item={{gdp={0,6,9002,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[18]={item={{gdp={0,4,9003,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[20]={item={{gdp={0,7,9004,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[21]={item={{gdp={0,11,9005,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[23]={item={{gdp={0,2,9006,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[29]={item={{gdp={0,13,9010,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
		[30]={item={{gdp={0,12,9011,1,1,-1,-1,-1,-1,-1,-1,-1,0}}}},
	}
	LIB_Award:AwardByRoute(tbVukhiDieuDuong)
end


function TaiXuat_NhanThuong(nIndex)
	if CheckTaiXuat() ~= 1 then
		return 0
	end
	if CheckAward(nIndex) ~= 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i, vui l�ng ki�m tra l�i.")
		return 0
	end
	if gf_Judge_Room_Weight(tbCondition[nIndex][4],tbCondition[nIndex][5]) ~= 1 then
		Talk(1,"","H�nh trang ph�i c� t�i thi�u <color=yellow>"..tbCondition[nIndex][4].."<color> � tr�ng, <color=yellow>"..tbCondition[nIndex][5].."<color> �� n�ng.")
		return 0
	end
	if tbCondition[nIndex][1] == 1 then
		local nMissionQty = VNG_GetTaskPos(tbCondition[nIndex][2][1],tbCondition[nIndex][2][2],tbCondition[nIndex][2][3])
		if nMissionQty < tbCondition[nIndex][2][4] then
			Talk(1,"","S� l�n ho�n th�nh th� th�ch ch�a ��, c�c h� h�y c� g�ng th�m.")
			return 0
		end
	else
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbCondition[nIndex][2])
		if nCheck ~= 1 then
			return 0
		end
		LIB_Award:PayMaterial(tbCondition[nIndex][2])
	end
	gf_SetTaskBit(TSK_TAIXUAT_FLAG, tbCondition[nIndex][3], 1, 0)
	LIB_Award:Award(tbTaiXuatAward[nIndex])
end