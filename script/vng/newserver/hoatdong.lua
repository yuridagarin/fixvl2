Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\online\\viet_event\\top_server\\head_top.lua");
LIB_Award.szLogTitle = "HOAT DONG NGOA LONG"
LIB_Award.szLogAction = "nh�n"

tbTrangBiHaoNguyet = {
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

tbNgocBoi_HaoNguyet = {item={
		{gdp={0,102,3175,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3177,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3179,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3181,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3183,1,4,-1,-1,-1,-1,-1,-1,-1}},
	},
	nExp = 100000000,
}

tbVuKhiHaoNguyet = {
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
	
tbTrangBiDieuDuong = {
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
	
tbNgocBoi_DieuDuong = {item={
		{gdp={0,102,3176,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3178,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3180,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3182,1,4,-1,-1,-1,-1,-1,-1,-1}},
		{gdp={0,102,3184,1,4,-1,-1,-1,-1,-1,-1,-1}},
	},
	nExp = 1000000000,
	nChankhi = 10000,
}

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

function NewServer_HoatDong_Menu()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nRoute = GetPlayerRoute()
	if nRoute == 0 then
		Talk(1,"","C�c h� ch�a gia nh�p h� ph�i, kh�ng th� tham gia t�nh n�ng n�y,")
		return 0
	end
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	
	local nTNC = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 2,1)
	local nLSB = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 4,3)
	local nTMT = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 6,5)
	local nNMQ = VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 8,7)
	
	local tbSay = {}
	tinsert(tbSay,"Nh�n th��ng m�i ng�y/NewServer_DailyReward")
	tinsert(tbSay,"Nhi�m v� t�i nguy�n chi�n ("..nTNC.."/30)/NewServer_TaiNguyenChien_NhanThuong_Menu")
	tinsert(tbSay,"Nhi�m v� L��ng S�n B�c ("..nLSB.."/30)/NewServer_LuongSonBac_NhanThuong_Menu")
	tinsert(tbSay,"Nhi�m v� Thi�n M�n Tr�n ("..nTMT.."/30)/NewServer_ThienMonTran_NhanThuong_Menu")
	tinsert(tbSay,"Chi�n tr��ng Nh�n M�n Quan ("..nNMQ.."/30)/NewServer_NhanMonQuan_NhanThuong_Menu")
	tinsert(tbSay,"Ta ch� gh� xem/gf_DoNothing")
	Say("", getn(tbSay), tbSay)
end


function NewServer_TaiNguyenChien_NhanThuong_Menu()
	local tbSay = {}
	tinsert(tbSay,"N�n H�o Nguy�t +0 (ho�n th�nh 30 l�n t�i nguy�n chi�n)/#NewServer_TaiNguyenChien_NhanThuong_NhanThuong(1)")
	tinsert(tbSay,"N�n Di�u D��ng +0 (3999 xu v�t ph�m + 3999 v�ng)/#NewServer_TaiNguyenChien_NhanThuong_NhanThuong(2)")
	tinsert(tbSay,"Ta ch� gh� xem/gf_DoNothing")
	Say("H�y ch�n ph�n th��ng ho�t ��ng t�i nguy�n chi�n", getn(tbSay), tbSay)
end

function NewServer_TaiNguyenChien_NhanThuong_NhanThuong(nOption)
	local nMission = 30
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	if nRoute == 0 then
		return 0
	end
	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	if gf_GetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,2) ~= 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n l�i.")
		return 0
	end
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	if nOption == 1 then
		if VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 2,1) < nMission then
			Talk(1,"","�i�u ki�n ho�n th�nh nhi�m v� ch�a ��, c�c h� h�y c� g�ng th�m.")
			return 0
		end
	else
		local tbMaterial = {item={{gdp={2,1,30230,3999}}}, nGold = 39990000}
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbMaterial)
		if nCheck ~= 1 then
			return 0
		end
		LIB_Award:PayMaterial(tbMaterial)
	end
	local tbAward = {
		[1] = {item={{gdp={0,103,tbTrangBiHaoNguyet[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}, nExp = 50000000},
		[2] = {item={{gdp={0,103,tbTrangBiDieuDuong[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}, nExp = 500000000, nChankhi = 5000},
	}
	gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,2,1,0)
	LIB_Award:Award(tbAward[nOption])
end


function NewServer_LuongSonBac_NhanThuong_Menu()
	local tbSay = {}
	tinsert(tbSay,"�o H�o Nguy�t +0 (ho�n th�nh 30 l�n L��ng S�n B�c)/#NewServer_LuongSonBac_NhanThuong_NhanThuong(1)")
	tinsert(tbSay,"�o Di�u D��ng +0 (3999 xu v�t ph�m + 3999 v�ng)/#NewServer_LuongSonBac_NhanThuong_NhanThuong(2)")
	tinsert(tbSay,"Ta ch� gh� xem/gf_DoNothing")
	Say("H�y ch�n ph�n th��ng ho�t ��ng L��ng S�n B�c", getn(tbSay), tbSay)
end

function NewServer_LuongSonBac_NhanThuong_NhanThuong(nOption)
	local nMission = 30
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	if nRoute == 0 then
		return 0
	end
	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	if gf_GetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,3) ~= 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n l�i.")
		return 0
	end
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	if nOption == 1 then
		if VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 4,3) < nMission then
			Talk(1,"","�i�u ki�n ho�n th�nh nhi�m v� ch�a ��, c�c h� h�y c� g�ng th�m.")
			return 0
		end
	else
		local tbMaterial = {item={{gdp={2,1,30230,3999}}}, nGold = 39990000}
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbMaterial)
		if nCheck ~= 1 then
			return 0
		end
		LIB_Award:PayMaterial(tbMaterial)
	end
	local tbAward = {
		[1] = {item={{gdp={0,100,tbTrangBiHaoNguyet[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}, nExp = 60000000},
		[2] = {item={{gdp={0,100,tbTrangBiDieuDuong[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}, nExp = 600000000, nChankhi = 6000},
	}
	gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,3,1,0)
	LIB_Award:Award(tbAward[nOption])
end


function NewServer_ThienMonTran_NhanThuong_Menu()
	local tbSay = {}
	tinsert(tbSay,"Qu�n H�o Nguy�t +0 (ho�n th�nh 30 l�n Thi�n M�n Tr�n)/#NewServer_ThienMonTran_NhanThuong_NhanThuong(1)")
	tinsert(tbSay,"Qu�n Di�u D��ng +0 (3999 xu v�t ph�m + 3999 v�ng)/#NewServer_ThienMonTran_NhanThuong_NhanThuong(2)")
	tinsert(tbSay,"Ta ch� gh� xem/gf_DoNothing")
	Say("H�y ch�n ph�n th��ng ho�t ��ng Thi�n M�n Tr�n", getn(tbSay), tbSay)
end

function NewServer_ThienMonTran_NhanThuong_NhanThuong(nOption)
	local nMission = 30
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	if nRoute == 0 then
		return 0
	end
	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	if gf_GetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,4) ~= 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n l�i.")
		return 0
	end
	if gf_Judge_Room_Weight(2,100) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	if nOption == 1 then
		if VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 6,5) < nMission then
			Talk(1,"","�i�u ki�n ho�n th�nh nhi�m v� ch�a ��, c�c h� h�y c� g�ng th�m.")
			return 0
		end
	else
		local tbMaterial = {item={{gdp={2,1,30230,3999}}}, nGold = 39990000}
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbMaterial)
		if nCheck ~= 1 then
			return 0
		end
		LIB_Award:PayMaterial(tbMaterial)
	end
	local tbAward = {
		[1] = {item={{gdp={0,101,tbTrangBiHaoNguyet[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}, nExp = 60000000},
		[2] = {item={{gdp={0,101,tbTrangBiDieuDuong[nRoute][nBody],1,1,-1,-1,-1,-1,-1,-1,-1,0}}}, nExp = 700000000, nChankhi = 7000},
	}
	gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,4,1,0)
	LIB_Award:Award(tbAward[nOption])
end


function NewServer_NhanMonQuan_NhanThuong_Menu()
	local tbSay = {}
	tinsert(tbSay,"Ng�c b�i H�o Nguy�t + v� kh�+0 (ho�n th�nh 30 l�n Nh�n M�n Quan)/#NewServer_NhanMonQuan_NhanThuong_NhanThuong(1)")
	tinsert(tbSay,"Ng�c b�i Di�u D��ng + v� kh�+0 (5999 xu v�t ph�m + 5999 v�ng)/#NewServer_NhanMonQuan_NhanThuong_NhanThuong(2)")
	tinsert(tbSay,"Ta ch� gh� xem/gf_DoNothing")
	Say("H�y ch�n ph�n th��ng ho�t ��ng chi�n tr��ng Nh�n M�n Quan", getn(tbSay), tbSay)
end

function NewServer_NhanMonQuan_NhanThuong_NhanThuong(nOption)
	local nMission = 30
	local nRoute = GetPlayerRoute()
	local nBody = GetBody()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	if nRoute == 0 then
		return 0
	end
	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	if gf_GetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,5) ~= 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i, kh�ng th� nh�n l�i.")
		return 0
	end
	if gf_Judge_Room_Weight(7,500) ~= 1 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, vui l�ng s�p x�p l�i.")
		return 0
	end
	if nOption == 1 then
		if VNG_GetTaskPos(TSK_HOATDONGNEWSERVER, 8,7) < nMission then
			Talk(1,"","�i�u ki�n ho�n th�nh nhi�m v� ch�a ��, c�c h� h�y c� g�ng th�m.")
			return 0
		end
	else
		local tbMaterial = {item={{gdp={2,1,30230,5999}}}, nGold = 59990000}
		local nCheck = 0
		nCheck = LIB_Award:CheckMaterial(tbMaterial)
		if nCheck ~= 1 then
			return 0
		end
		LIB_Award:PayMaterial(tbMaterial)
	end
	gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,5,1,0)
	if nOption == 1 then
		LIB_Award:Award(tbNgocBoi_HaoNguyet)
		LIB_Award:AwardByRoute(tbVuKhiHaoNguyet)
	else
		LIB_Award:Award(tbNgocBoi_DieuDuong)
		LIB_Award:AwardByRoute(tbVukhiDieuDuong)
	end
end


function NewServer_DailyReward()
	local nDieuKienOnline = 5*60*60
	local nOnline = GetTask(IP_ONLINE_TIME)
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	-- Check qu�c t�ch
	if nNationality ~= nNation then
		Talk(1, "", "Ng��i kh�ng ph�i l� th�n d�n b�n qu�c n�n kh�ng th� nh�n th��ng!")
		return
	end
	if nOnline < nDieuKienOnline then
		Talk(1,"","Th�i gian t�ch l�y tr�n m�ng kh�ng �� 5 gi�.")
		return 0
	end
	if gf_GetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,1) ~= 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng n�y r�i, mai h�y quay l�i nh�.")
		return 0
	end
	SetTask(IP_ONLINE_TIME, GetTask(IP_ONLINE_TIME) - nDieuKienOnline)
	Msg2Player("Th�i gian t�ch l�y online gi�m 300 ph�t")
	local tbAward = {nExp = 5000000, nQuancong = 500, nDanhvong = 50, nChankhi = 500, nSumon = 50}
	gf_SetTaskBit(TSK_HOATDONGNEWSERVER_NHANTHUONG,1,1,0)
	LIB_Award:Award(tbAward)
end