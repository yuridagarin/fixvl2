--=============================================
--create by xiongyizhi 2010.11.2
--describe:Խ�ϰ�2010��12�»1 �ַ����ļ�
--=============================================

VET_201012_01_STR_LOG_TITLE = "Hoat dong thang 12 nam 2010";--���λ��־����

VET_201012_01_TB_LOG_ACTION_LIST = {
    [1] = "��i H�p Qu� Gi�ng Sinh",
    [2] = "��i ��ng ti�n v�ng",
    [3] = "Ph�n th��ng kinh nghi�m t�ng th�m t� H�p Qu� Gi�ng Sinh",
    [4] = "Ph�n th��ng v�t ph�m t� H�p Qu� Gi�ng Sinh",
    [5] = "Ph�n th��ng v�t ph�m ��c th� t� H�p Qu� Gi�ng Sinh",
    [6] = "Nh�n ���c ph�n th��ng max event",
    [7] = "Nh�n ���c ph�n th��ng �i�m kinh nghi�m t� H�p Qu� Gi�ng Sinh",
};

VET_201012_01_TB_STRING_LIST = {
    [1] = "<color=yellow>Ho�t ��ng m�ng Gi�ng Sinh<color> b�t ��u t� <color=red>ng�y 10/12/2010 ��n ng�y 09/01/2011<color>. N�i dung chi ti�t vui l�ng t�m hi�u t�i trang ch� <color=green>http://volam2.zing.vn<color>",
    [2] = "\n��i H�p Qu� Gi�ng Sinh (c�n 5 chu�ng gi�ng sinh + 2 v�t ph�m xu)",
    [3] = "Nh�n ph�n th��ng s� d�ng t�i �a Qu� Gi�ng Sinh",
    [4] = "Ch�n h�nh th�c nh�n th��ng",
    [5] = "��i 100 v�t ph�m xu (c�n 1 ��i Ng�n Phi�u)",
    [6] = "K�ch ho�t l�a tr�i s��i �m",
    [7] = "Mua c�i (20 v�ng)",
    [8] = "Nguy�n li�u mang theo kh�ng ��",
    [9] = "S� l��ng H�p Qu� Gi�ng Sinh �� s� d�ng: <color=red>[%d/%d]<color>",
    [10] = "C�c h� �� nh�n ph�n th��ng n�y r�i",
    [11] = "Vui l�ng ch�n h�nh th�c nh�n th��ng",
    [12] = "K�ch ho�t nh�n th��ng kh�ng nh�n v�t ph�m (t�ng th�m 25% kinh nghi�m)",
    [13] = "K�ch ho�t nh�n th��ng nh�n v�t ph�m",
    [14] = "K�t th�c ��i tho�i",
    [15] = "Hi�n �ang k�ch ho�t nh�n th��ng kh�ng v�t ph�m (t�ng 25% kinh nghi�m)",
    [16] = "Hi�n �ang k�ch ho�t K�ch ho�t nh�n th��ng nh�n v�t ph�m",
    [17] = "C�c h� kh�ng mang theo ��i Ng�n Phi�u",
    [18] = "C�n t� ��i tr�n 2 ng��i ��ng th�i mang theo c�i tr�n ng��i m�i c� th� k�ch ho�t",
    [19] = "L��ng ti�n mang theo kh�ng ��",
    [20] = "Ph�n th��ng 20.000.000 Exp v� v�t ph�m",
    [21] = "Ph�n th��ng 20 �i�m n�ng c�p b�n ��ng h�nh v� v�t ph�m",
    [22] = "Ph�n th��ng 1 �i�m Linh L�c b�n ��ng h�nh v� v�t ph�m ",
    [23] = "Ch�n 1 ph�n th��ng",
    [24] = "C�c h� �� nh�n ph�n th��ng n�y",
};

VET_201012_01_TB_ITEM_LIST = {
    [1] = {"Chu�ng Gi�ng Sinh", 2, 1, 30265},
    [2] = {"H�p qu� gi�ng sinh", 2, 1, 30266},
    [3] = {"H�t Gi�ng B�ch Kim", 2, 1, 30268},
    [4] = {"C�m nang ho�t ��ng", 2, 1, 30267},
    [5] = {"Xu", 2, 1, 30230},
    [6] = {"��i ng�n phi�u", 2, 1, 199},
};

VET_201012_01_TB_ITEM_LOGINGIVE_LIST = {
    [1] = {"C�m Nang ��i S� Ki�n", 2, 1, 30045},
};

-- Phan thuong tung hop qua giang sinh
VET_201012_TB_XMAS_BOX_NOMAL_AWARD = {
    {1, 100, "Thi�n th�ch", {2, 2, 8, 1}, 0},
    {1, 60, "M�nh Thi�n th�ch", {2, 2, 7, 1}, 0},
    {1, 5, "Th� Th�n ph�", {2, 0, 556, 1}, 7 * 24 * 3600},
    {1, 20, "B�t Nh� Ch�ng Th�", {2, 1, 30114, 1}, 7 * 24 * 3600},
    {1, 20, "C�y B�t Nh� nh�", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 10, "C�y B�t Nh�", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 5, "Thi�n H� M�t t�ch", {0, 107, 64, 1}, 0},
    {1, 5, "T� H� M�t t�ch", {0, 107, 65, 1}, 0},
    {1, 5, "Chi�m Y Ph�", {0, 107, 66, 1}, 0},
    {1, 20, "Tu Ch�n Y�u Quy�t", {2, 0, 554, 1}, 7 * 24 * 3600},   -- xac xuat 2% - 7 ng�y
    {1, 10, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
    {1, 5, "��i Nh�n s�m", {2, 0, 553, 1}, 7 * 24 * 3600},
    {1, 10, "�� Nguy�t Th�n Sa", {2, 1, 3332, 1}, 0},
    {1, 130, "X�ch Thi�t Tinh", {2, 1, 2652, 1}, 0},
    {3, 255, 10000, 1}, -- 1 vang 25.5%
    {4, 200, 10, 1},  -- diem danh vong 20%
    {5, 140, 10, 1},  -- diem su mon  14%
};

-- su dung hop qua giang sinh tai cac moc 20,40,60,80
VET_201012_TB_XMAS_BOX_SP_AWARD = {
    {1, 600, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1}, 7 * 24 * 3600},
    {1, 300, "S� tay s�ng", {2, 19, 1, 1}, 7 * 24 * 3600},
    {1, 300, "C� quan nh�n", {2, 1, 1011, 1}, 7 * 24 * 3600},
    {1, 500, "V� Ng�n Th�y", {2, 1, 503, 1}, 7 * 24 * 3600},
    {1, 500, "T�y T�y ��n", {2, 0, 136, 1}, 7 * 24 * 3600},
    {1, 100, "T�y T�y linh ��n", {2, 0, 137, 1}, 7 * 24 * 3600},
    {1, 2149, "��u h�n", {2, 1, 1157, 1}, 7 * 24 * 3600},						-- 21.49%
    {1, 2000, "��ng ti�n v�ng", { 2, 1, 30094, 1 }, 0},				-- dong tien vang 20 %
    
    --{1, 1000, "Th�i H� �a M�t Qu� ", {2, 1, 387, 1}, 7 * 24 * 3600},
    --{1, 1009, "T�ng Ki�m anh h�ng thi�p", {2, 0, 31, 1}, 7 * 24 * 3600},
    --{1, 1000, "R��ng B� K�p", {2, 1, 30093, 1}, 7 * 24 * 3600},
    
    {1, 1, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 50, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 400, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 400, "Nguy�t Hoa Chi Tinh", {2, 1, 3219, 1}, 0},
    {8, 900, 60, 1},				-- 60 phut Uy thac bach cau tien don --> search trong globalfunction gf_EventGiveCustomAward
    {15, 900, 60, 1},			-- 60 phut Uy thac tam thanh tien don --> search trong globalfunction gf_EventGiveCustomAward
    {12, 900, 60, 1},			-- 60 phut Uy thach luc than tien don --> search trong globalfunction gf_EventGiveCustomAward
};

--����������,ȫ�����,����û���������ж�,ֱ�Ӹ�������ʷ�ű�,Ҫ�õĻ���Ҫ���������6��-1���Բ���
VET_201012_01_BFY_WEAPON = {
				[1]  = {675, "Ph� Y�n �ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1}},
				[2]  = {675, "Ph� Y�n tr��ng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {675, "H�m Y�n th�",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {675, "T�ng Y�n ch�m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1}},
				[5]  = {675, "Phi Y�n ki�m",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {675, "V�n Y�n c�m",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1}},
				[7] = {675, "V�n Y�n th�",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1}},
				[8] = {675, "L�u Y�n c�n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1}},
				[9] = {675, "Huy�n Y�n ki�m",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1}},
				[10] = {675, "V� Y�n b�t",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {675, "H� Ti�m Th��ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {675, "H�nh Y�n Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1}},
				[13] = {625, "Tr�c Y�n nh�n",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {600, "Y�u Y�n tr�o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {675, "Ph� Y�n C�n",{0, 5, 6002, 1,1,-1,-1,-1,-1,-1,-1}},
};

-- su dung hop qua giang sinh toi da (nhan 20 mil exp + 20 diem nang cap ban dong hanh + 1 diem linh luc )
VET_201012_TB_XMAS_BOX_FINAL_AWARD = { 	
    --{1, 300, "Ch�m Ch�m ", {2, 1, 30165, 50}, 0},
    -- {3, 50, 5000000, 1},								-- vang (type=3-1)    
    
    {1, 1, "Thi�n Qu�i Th�ch", {2, 0, 1084, 1}, 0},
    {1, 100, "Chi�n Th�n ho�n", {2, 1, 1005, 1}, 7 * 24 * 3600},
    {1, 10, "Phi Y�n Th�ch", {2, 1, 30130, 1}, 0},
    {1, 10, "T� Quang Th�n Th�ch", {2, 1, 30131, 1}, 0},
    {1, 5, "B�ch Kim H�ng Bao (tr�ng)", {2, 1, 30228, 1}, 7 * 24 * 3600},
    {1, 5, "Ho�ng Kim ��i H�ng Bao (tr�ng)", {2, 1, 538, 1}, 7 * 24 * 3600},
    {1, 10, "T� Kim H�ng Bao (tr�ng)", {2, 1, 536, 1}, 7 * 24 * 3600},
    {1, 400, "Nh�n S�m V�n N�m", {2, 1, 30071, 2}, 0},				-- 40%     - 2 item Nhan sam van niem
    {1, 1, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 7 * 24 * 3600},    
    {1, 20, "Thi�n Th�ch Tinh Th�ch", {2, 1, 1009, 1}, 0},			-- 2%
    {1, 5, "Thi�n Th�ch Linh Th�ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
    {1, 1, "L�ng Ba Vi B�", {0, 112, 78, 1}, 0},
    {1, 10, "R��ng Y�u Quy�t Cao C�p", {2,1,30112, 1}, 7 * 24 * 3600},        
    {32, 382, 7000, 1},	-- 7000 diem quan cong
    {1, 10, "Long T� B�i", { 2, 1, 30155, 1 }, 0 },
    {1, 10, "Ph�ng T� B�i", { 2, 1, 30156, 1 }, 0 },
    {1, 10, "�ng T� B�i", { 2, 1, 30158, 1 }, 0 },
    {31, 5, "get_bpy_weapon_201012()" },
    {31, 5, "get_faction_armor_201012()" },   -- lat xem lai
};

VET_201012_08_EQUIP  = {	
	{"B�ch v� thu�ng ng�y ��c y", 2, {0, 100, 21219, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B�ch v� thu�ng ng�y ��c y", 2, {0, 100, 21229, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"B�ch v� thu�ng ng�y ��c y", 2, {0, 100, 21239, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B�ch v� thu�ng ng�y ��c y", 2, {0, 100, 21249, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"Thi�n long b�t b� kh�i gi�p", 2, {0, 100, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thi�n long b�t b� kh�i gi�p", 2, {0, 100, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"V� l��ng ph�p t�n thi�n ��nh b�o", 2, {0, 100, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"V� l��ng ph�p t�n thi�n ��nh b�o", 2, {0, 100, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"B�t b�o la h�n ��i th�a kh�i gi�p", 2, {0, 100, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B�t b�o la h�n ��i th�a kh�i gi�p", 2, {0, 100, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"Thi�n c� s� gi� th�n tri�u c�n", 2, {0, 100, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thi�n c� s� gi� th�n tri�u c�n", 2, {0, 100, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thi�n c� s� gi� th�n tri�u c�n", 2, {0, 100, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thi�n c� s� gi� th�n tri�u c�n", 2, {0, 100, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"B�ch li�n ti�n t� b�o �n y", 2, {0, 100, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B�ch li�n ti�n t� b�o �n y", 2, {0, 100, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"Ng�c v�n ti�n t� huy�n h�n y", 2, {0, 100, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Ng�c v�n ti�n t� huy�n h�n y", 2, {0, 100, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		
	{"Long ��u th�n c�i ��ng v�n y", 2, {0, 100, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long ��u th�n c�i ��ng v�n y", 2, {0, 100, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long ��u th�n c�i ��ng v�n y", 2, {0, 100, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long ��u th�n c�i ��ng v�n y", 2, {0, 100, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Kh�t thi�n th�n c�i v�n du y", 2, {0, 100, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Kh�t thi�n th�n c�i v�n du y", 2, {0, 100, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Kh�t thi�n th�n c�i v�n du y", 2, {0, 100, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Kh�t thi�n th�n c�i v�n du y", 2, {0, 100, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Chu�ng kinh thanh quang b�o", 2, {0, 100, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Chu�ng kinh thanh quang b�o", 2, {0, 100, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Chu�ng kinh thanh quang b�o", 2, {0, 100, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Chu�ng kinh thanh quang b�o", 2, {0, 100, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Th�i �t t�n nh�n h�o nhi�n ph�c", 2, {0, 100, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Th�i �t t�n nh�n h�o nhi�n ph�c", 2, {0, 100, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Th�i �t t�n nh�n h�o nhi�n ph�c", 2, {0, 100, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Th�i �t t�n nh�n h�o nhi�n ph�c", 2, {0, 100, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Long t��ng ngao kh� chi�n kh�i", 2, {0, 100, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long t��ng ngao kh� chi�n kh�i", 2, {0, 100, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long t��ng ngao kh� chi�n kh�i", 2, {0, 100, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long t��ng ngao kh� chi�n kh�i", 2, {0, 100, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"H� d�c m�nh s� chi�n kh�i", 3, {0, 100, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"H� d�c m�nh s� chi�n kh�i", 3, {0, 100, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"H� d�c m�nh s� chi�n kh�i", 3, {0, 100, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"H� d�c m�nh s� chi�n kh�i", 3, {0, 100, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},			
	
	{"U minh qu� s�t tu la huy�t y", 3, {0, 100, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"U minh qu� s�t tu la huy�t y", 3, {0, 100, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"U minh qu� s�t tu la huy�t y", 3, {0, 100, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"U minh qu� s�t tu la huy�t y", 3, {0, 100, 2034, 1, 1, -1, -1, -1, -1, -1, -1}},		
}
