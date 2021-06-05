Include("\\script\\online\\chuyen_sinh\\translife_head.lua");
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\lib\\vnglib_textdata.lua");
Include("\\script\\vng\\lib\\vnglib_function.lua");
Include("\\script\\vng\\chitonvuonglenh\\chitonvuonglenh_newserver.lua");

TSK_CHITONNEW1 = 2667
TSK_CHITONNEW2 = 2668
TSK_CHITONNEW3 = 2669

szNPCName = "<color=green>Anh/Ch� Ch� Ph�ng M�y: <color>"
szLogTitle = "CHI TON VUONG LENH"
szLogTitle1 = "CHI TON VUONG LENH BK"
DEFINE_30_DAYS = 2592000
--EXT_POINT_CLTV = 5	--khai b�o ExtPoint
--TSK_CTVL_START = 2664  --khai b�o Task th�i h�n CTVL
--TSK_CTVL_ALL = 2665		--khai b�o task: 0987654321: 1:k�ch ho�t CTVL;	2: �� x�y d�ng bang trong tu�n	3: �� nh�n th��ng BHCT trong tu�n		4: nh�n th��ng t� ��i trong ng�y		65: check lev nh�n th��ng PS0 	7: nh�n trang b� HN	8: kich ho�t Bang h�i Ch� T�n		9: nh�n th��ng PS1 88	0: nh�n th��ng PS2 75
--TSK_CTVL_COUNT = 2666	--0987654321: 		321: b� ��m b��c nhi�m v�	4: tr�ng th�i ho�n th�nh nhi�m v�		65: l�u ID nhi�m v� m�i ng�y �ang th�c hi�n	7: s� l�n ho�n th�nh nhi�m v� trong ng�y		8: tr�ng th�i nh�n th� th�ch		9: nh�n th��ng m�i ng�y c�a old server
tbNewServer = {[83] = 1, [84] = 1, [85] = 1, [86] = 1, [87] = 1}

tb_award_ctvl_PS0 = 
{
				[79] = {1, "Qu�n C�ng Ch��ng", 2,1,9999, 1, 10000000, 100000,0},
				[80] = {2, "Qu�n C�ng Ch��ng", 2,1,9999, 1, 10000000, 100000,0},
				[81] = {3, "Qu�n C�ng Ch��ng", 2,1,9999, 1, 10000000, 100000,0},
				[82] = {4, "Qu�n C�ng Ch��ng", 2,1,9999, 2, 20000000, 100000,0},
				[83] = {5, "Qu�n C�ng Ch��ng", 2,1,9999, 2, 20000000, 100000,0},
				[84] = {6, "Qu�n C�ng Ch��ng", 2,1,9999, 2, 20000000, 100000,0},
				[85] = {7, "Qu�n C�ng Ch��ng", 2,1,9999, 3, 30000000, 100000,0},
				[86] = {8, "Qu�n C�ng Ch��ng", 2,1,9999, 3, 30000000, 100000,0},
				[87] = {9, "Qu�n C�ng Ch��ng", 2,1,9999, 3, 30000000, 100000,0},
				[88] = {10, "Qu�n C�ng ��i", 2,1,9998, 1, 50000000, 100000,0},
				[89] = {11, "Qu�n C�ng ��i", 2,1,9998, 1, 50000000, 100000,0},
				[90] = {12, "Qu�n C�ng ��i", 2,1,9998, 1, 50000000, 0, 5000},
				[91] = {13, "Qu�n C�ng ��i", 2,1,9998, 1, 50000000, 0, 5000},
				[92] = {14, "Qu�n C�ng ��i", 2,1,9998, 1, 50000000, 0, 5000},
				[93] = {15, "Qu�n C�ng ��i", 2,1,9998, 2, 100000000, 0, 10000},
				[94] = {16, "Qu�n C�ng ��i", 2,1,9998, 2, 100000000, 0, 10000},
				[95] = {17, "Qu�n C�ng Huy Ho�ng", 2,1,9977, 1, 300000000, 0, 20000},
				[96] = {18, "Qu�n C�ng Huy Ho�ng", 2,1,9977, 1, 300000000, 0, 20000},
				[97] = {19, "Qu�n C�ng Huy Ho�ng", 2,1,9977, 2, 500000000, 0, 20000},
				[98] = {20, "Qu�n C�ng Huy Ho�ng", 2,1,9977, 2, 500000000, 0, 20000},
				[99] = {21, "Qu�n C�ng Huy Ho�ng", 2,1,9977, 3, 1000000000, 0, 50000},
}
tbCTVLRate = {
	[1] = {[1] = 1, nRate = 2.50},	-- Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng N�ng Trang
	[2] = {[1] = 2, nRate = 2.50},	-- Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng N�ng Trang
	[3] = {[1] = 3, nRate = 2.50},	-- Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng L��ng Th�o
	[4] = {[1] = 4, nRate = 2.50},	-- Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng L��ng Th�o
	[5] = {[1] = 5, nRate = 2.50},	-- Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng Th�nh Tr�
	[6] = {[1] = 6, nRate = 2.50},	-- Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng Th�nh Tr�
	[7] = {[1] = 7, nRate = 2.50},	-- Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng Nh�n M�n
	[8] = {[1] = 8, nRate = 2.50},	-- Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng Nh�n M�n
	[9] = {[1] = 9, nRate = 2.50},	-- Ho�n th�nh 1 l�n nh�n th��ng T�i Nguy�n Chi�n
	[10] = {[1] = 10, nRate = 2.50},	-- Ho�n th�nh 2 l�n nh�n th��ng T�i Nguy�n Chi�n
	[11] = {[1] = 11, nRate = 2.50},	-- Ho�n th�nh 3 l�n nh�n th��ng T�i Nguy�n Chi�n
	[12] = {[1] = 12, nRate = 2.50},	-- Ho�n th�nh 4 l�n nh�n th��ng T�i Nguy�n Chi�n
	[13] = {[1] = 13, nRate = 2.50},	-- Ho�n th�nh 1 l�n nh�n th��ng Th�t N��ng
	[14] = {[1] = 14, nRate = 2.50},	-- Ho�n th�nh 2 l�n nh�n th��ng Th�t N��ng
	[15] = {[1] = 15, nRate = 2.50},	-- Ho�n th�nh 3 l�n nh�n th��ng Th�t N��ng
	[16] = {[1] = 16, nRate = 2.50},	-- Ho�n th�nh 4 l�n nh�n th��ng Th�t N��ng
	[17] = {[1] = 17, nRate = 2.50},	-- Ho�n th�nh 2 l�n nh�n th��ng chi�n th�ng Thi�n M�n Tr�n
	[18] = {[1] = 18, nRate = 2.50},	-- Ho�n th�nh 4 l�n nh�n th��ng chi�n th�ng Thi�n M�n Tr�n
	[19] = {[1] = 19, nRate = 2.50},	-- S� d�ng th�nh c�ng 10 ph�o hoa
	[20] = {[1] = 20, nRate = 2.50},	-- S� d�ng th�nh c�ng 20 ph�o hoa
	[21] = {[1] = 21, nRate = 2.50},	-- S� d�ng th�nh c�ng 40 ph�o hoa
	[22] = {[1] = 22, nRate = 2.50},	-- N�p 1 l�n C�ng T� - Tr� Qu�c B�nh Thi�n H�
	[23] = {[1] = 23, nRate = 2.50},	-- N�p 1 l�n Tr� An - Tr� Qu�c B�nh Thi�n H�
	[24] = {[1] = 24, nRate = 2.50},	-- N�p 1 l�n Th�y L�i - Tr� Qu�c B�nh Thi�n H�
	[25] = {[1] = 25, nRate = 2.50},	-- N�p 1 l�n Luy�n ��n - Tr� Qu�c B�nh Thi�n H�
	[26] = {[1] = 26, nRate = 2.50},	-- K�ch ho�t 1 h�t gi�ng
	[27] = {[1] = 27, nRate = 2.50},	-- K�ch ho�t 6 h�t gi�ng
	[28] = {[1] = 28, nRate = 2.50},	-- K�ch ho�t 24 h�t gi�ng
	[29] = {[1] = 29, nRate = 2.50},	-- K�ch ho�t 1 b�t nh� nh�
	[30] = {[1] = 30, nRate = 2.50},	-- K�ch ho�t 6 b�t nh� nh�
	[31] = {[1] = 31, nRate = 2.50},	-- K�ch ho�t 16 b�t nh� nh�
	[32] = {[1] = 32, nRate = 2.50},	-- K�ch ho�t 1 c�y T� Linh
	[33] = {[1] = 33, nRate = 2.50},	-- K�ch ho�t 6 c�y T� Linh
	[34] = {[1] = 34, nRate = 2.50},	-- K�ch ho�t 16 c�y T� Linh
	[35] = {[1] = 35, nRate = 2.50},	-- S� d�ng 20 N� Oa B�o H�p
	[36] = {[1] = 36, nRate = 2.50},	-- S� d�ng 50 N� Oa B�o H�p
	[37] = {[1] = 37, nRate = 2.50},	-- S� d�ng 100 N� Oa B�o H�p
	[38] = {[1] = 38, nRate = 2.50},	-- S� d�ng 5 Ng�i Sao May M�n
	[39] = {[1] = 39, nRate = 2.50},	-- S� d�ng 10 Ng�i Sao May M�n
	[40] = {[1] = 40, nRate = 2.50},	-- S� d�ng 16 Ng�i Sao May M�n
--	[19] = {[1] = 19, nRate = 2.10},	-- Ho�n th�nh 1 l�n v��t �i 7 T�ng Ki�m
--	[20] = {[1] = 20, nRate = 2.10},	-- Ho�n th�nh 2 l�n v��t �i 7 T�ng Ki�m
--	[21] = {[1] = 21, nRate = 2.10},	-- Ho�n th�nh 3 l�n v��t �i 7 T�ng Ki�m
--	[22] = {[1] = 22, nRate = 0.00},	-- Ho�n th�nh 1 l�n nhi�m v� L��ng S�n
--	[23] = {[1] = 23, nRate = 2.10},	-- Ho�n th�nh 2 l�n nhi�m v� L��ng S�n
--	[24] = {[1] = 24, nRate = 2.10},	-- Ho�n th�nh 3 l�n nhi�m v� L��ng S�n

--	[28] = {[1] = 28, nRate = 2.10},	-- Ho�n th�nh 1 l�n v��t �i Th�i H� thu ph�
--	[29] = {[1] = 29, nRate = 2.10},	-- Ho�n th�nh 2 l�n v��t �i Th�i H� thu ph�
--	[30] = {[1] = 30, nRate = 2.10},	-- Ho�n th�nh 3 l�n v��t �i Th�i H� thu ph�
--	[31] = {[1] = 31, nRate = 2.10},	-- Ho�n th�nh 1 l�n v��t �i Th�i H�
--	[32] = {[1] = 32, nRate = 2.10},	-- Ho�n th�nh 1 l�n Th�ng Thi�n ��nh
--	[33] = {[1] = 33, nRate = 2.10},	-- Tham gia 1 l�n V�n Ki�m Tr�ng
--	[34] = {[1] = 34, nRate = 2.10},	-- Tham gia 1 l�n ��a Huy�n Cung

--	[54] = {[1] = 54, nRate = 2.10},	-- Ti�u di�t 200 Ki�m Ti�n T�
--	[55] = {[1] = 55, nRate = 2.10},	-- Ti�u di�t 200 Sa M�c H�nh Nh�n
--	[56] = {[1] = 56, nRate = 2.10},	-- Ti�u di�t 200 X�ch Luy�n H�a H�
--	[57] = {[1] = 57, nRate = 2.10},	-- Ti�u di�t 200 Ti�u Lam Xoa Qu�
--	[1] = {[1] = 25, nRate = 25},	-- N�p 20 M�nh Thi�n Th�ch  					----d�ng �� test
--	[2] = {[1] = 26, nRate = 25},	-- N�p 20 Thi�n Th�ch
--	[3] = {[1] = 48, nRate = 25},	-- N�p 02 Qu�n C�ng ��i
--	[4] = {[1] = 49, nRate = 25},	-- N�p 01 Qu�n C�ng Huy Ho�ng
}

tbCTVLName = {
	[1] = {"Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng N�ng Trang", 1, 0},
	[2] = {"Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng N�ng Trang", 2, 0},
	[3] = {"Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng L��ng Th�o", 1, 0},
	[4] = {"Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng L��ng Th�o", 2, 0},
	[5] = {"Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng Th�nh Tr�", 1, 0},
	[6] = {"Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng Th�nh Tr�", 2, 0},
	[7] = {"Ho�n th�nh 1 l�n nh�n th��ng chi�n tr��ng Nh�n M�n", 1, 0},
	[8] = {"Ho�n th�nh 2 l�n nh�n th��ng chi�n tr��ng Nh�n M�n", 2, 0},
	[9] = {"Ho�n th�nh 1 l�n nh�n th��ng T�i Nguy�n Chi�n", 1, 0},		--done
	[10] = {"Ho�n th�nh 2 l�n nh�n th��ng T�i Nguy�n Chi�n", 2, 0},
	[11] = {"Ho�n th�nh 3 l�n nh�n th��ng T�i Nguy�n Chi�n", 3, 0},
	[12] = {"Ho�n th�nh 4 l�n nh�n th��ng T�i Nguy�n Chi�n", 4, 0},
	[13] = {"Ho�n th�nh 1 l�n nh�n th��ng Th�t N��ng", 1, 0},		--done
	[14] = {"Ho�n th�nh 2 l�n nh�n th��ng Th�t N��ng", 2, 0},
	[15] = {"Ho�n th�nh 3 l�n nh�n th��ng Th�t N��ng", 3, 0},
	[16] = {"Ho�n th�nh 4 l�n nh�n th��ng Th�t N��ng", 4, 0},
	[17] = {"Ho�n th�nh 2 l�n nh�n th��ng chi�n th�ng Thi�n M�n Tr�n", 2, 0},		--done
	[18] = {"Ho�n th�nh 4 l�n nh�n th��ng chi�n th�ng Thi�n M�n Tr�n", 4, 0},
	[19] = {"S� d�ng th�nh c�ng 10 ph�o hoa", 10, 0},			--done
	[20] = {"S� d�ng th�nh c�ng 20 ph�o hoa", 20, 0},
	[21] = {"S� d�ng th�nh c�ng 40 ph�o hoa", 40, 0},
	[22] = {"N�p 1 l�n C�ng T� - Tr� Qu�c B�nh Thi�n H�", 1, 0},		--done
	[23] = {"N�p 1 l�n Tr� An - Tr� Qu�c B�nh Thi�n H�", 1, 0},
	[24] = {"N�p 1 l�n Th�y L�i - Tr� Qu�c B�nh Thi�n H�", 1, 0},
	[25] = {"N�p 1 l�n Luy�n ��n - Tr� Qu�c B�nh Thi�n H�", 1, 0},
	[26] = {"K�ch ho�t 1 h�t gi�ng", 1, 0},		--done
	[27] = {"K�ch ho�t 6 h�t gi�ng", 6, 0},
	[28] = {"K�ch ho�t 24 h�t gi�ng", 24, 0},
	[29] = {"K�ch ho�t 1 b�t nh� nh�", 1, 0},		--done
	[30] = {"K�ch ho�t 6 b�t nh� nh�", 6, 0},
	[31] = {"K�ch ho�t 16 b�t nh� nh�", 16, 0},
	[32] = {"K�ch ho�t 1 c�y T� Linh", 1, 0},		--done
	[33] = {"K�ch ho�t 6 c�y T� Linh", 6, 0},
	[34] = {"K�ch ho�t 16 c�y T� Linh", 16, 0},
	[35] = {"S� d�ng 20 N� Oa B�o H�p", 20, 0},	--done
	[36] = {"S� d�ng 50 N� Oa B�o H�p", 50, 0},
	[37] = {"S� d�ng 100 N� Oa B�o H�p", 100, 0},
	[38] = {"S� d�ng 5 Ng�i Sao May M�n", 5, 0},		--done
	[39] = {"S� d�ng 10 Ng�i Sao May M�n", 10, 0},
	[40] = {"S� d�ng 16 Ng�i Sao May M�n", 16, 0},

--	[19] = {"Ho�n th�nh 1 l�n v��t �i 7 T�ng Ki�m", 1, 0},
--	[20] = {"Ho�n th�nh 2 l�n v��t �i 7 T�ng Ki�m", 2, 0},
--	[21] = {"Ho�n th�nh 3 l�n v��t �i 7 T�ng Ki�m", 3, 0},
--	[22] = {"Ho�n th�nh 1 l�n nhi�m v� L��ng S�n", 1, 0},
--	[23] = {"Ho�n th�nh 2 l�n nhi�m v� L��ng S�n", 2, 0},
--	[24] = {"Ho�n th�nh 3 l�n nhi�m v� L��ng S�n", 3, 0},

--	[28] = {"Ho�n th�nh 1 l�n v��t �i Th�i H� thu ph�", 1, 0},
--	[29] = {"Ho�n th�nh 2 l�n v��t �i Th�i H� thu ph�", 2, 0},
--	[30] = {"Ho�n th�nh 3 l�n v��t �i Th�i H� thu ph�", 3, 0},
--	[31] = {"Ho�n th�nh 1 l�n v��t �i Th�i H�", 1, 0},
--	[32] = {"Ho�n th�nh 1 l�n Th�ng Thi�n ��nh", 1, 0},
--	[33] = {"Tham gia 1 l�n V�n Ki�m Tr�ng", 1, 0},
--	[34] = {"Tham gia 1 l�n ��a Huy�n Cung", 1, 0},

--	[54] = {"Ti�u di�t 200 Ki�m Ti�n T�", 200, 0},
--	[55] = {"Ti�u di�t 200 Sa M�c H�nh Nh�n", 200, 0},
--	[56] = {"Ti�u di�t 200 X�ch Luy�n H�a H�", 200, 0},
--	[57] = {"Ti�u di�t 200 Ti�u Lam Xoa Qu�", 200, 0},
--	[25] = {"S� d�ng th�nh c�ng 1 N� Oa B�o H�p", 1, 0},		--d�ng �� test
--	[26] =  {"S� d�ng th�nh c�ng 2 N� Oa B�o H�p", 2, 0},
--	[48] =  {"S� d�ng th�nh c�ng 3 N� Oa B�o H�p", 3, 0},
--	[59] =  {"S� d�ng th�nh c�ng 4 N� Oa B�o H�p", 4, 0},
}

function CheckAccount_Active1()
	local nExtPoint = GetExtPoint(EXT_POINT_CLTV)
	local nKichhoat = mod(GetTask(TSK_CTVL_ALL), 10)
	if nExtPoint < 1 then
		Talk(1, "", "T�i kho�n c�a ��i hi�p ch�a nh�p code Ch� T�n V��ng L�nh.")
		return 0
	end
	if nKichhoat < 1 then
		Talk(1, "", "��i hi�p ch�a k�ch ho�t Ch� T�n V��ng L�nh.")
		return 0
	end
	if nKichhoat > 1 then
		Talk(1, "", "��i hi�p �� h�t th�i gian nh�n th��ng Ch� T�n V��ng L�nh.")
		return 0
	end
	return 1
end
function CheckAccount_Active()
	local nExtPoint = GetExtPoint(EXT_POINT_CLTV)
	local nCTVL_End = GetTime()
	if nExtPoint < 1 then
		Talk(1, "", "T�i kho�n c�a ��i hi�p ch�a nh�p code Ch� T�n V��ng L�nh.")
		return 0
	end

	if nCTVL_End - GetTask(TSK_CTVL_START) < DEFINE_30_DAYS then
		Msg2Player("Ch� T�n V��ng L�nh v�n c�n �ang hi�u l�c. ��i hi�p kh�ng th� k�ch ho�t th�m ���c n�a.")
		Talk(1, "", "<color=green>Ch� Ph�ng M�y<color>: Ch� T�n V��ng L�nh v�n c�n �ang hi�u l�c. ��i hi�p kh�ng th� k�ch ho�t th�m ���c n�a.")
		return 0
	end		
	return 1
end

function CTVL_SetDailyMission(nQuestID)
	local nMISSION_QTY = 3
	if CTVL_CountDailyMission() >= nMISSION_QTY then
		Talk(1,"",szNPCName.."Ng��i �� ho�n th�nh "..nMISSION_QTY.."/"..nMISSION_QTY.." nhi�m v�, kh�ng c�n ph�i l�m th�m.")
		return 0
	end
	local nMissionID = nQuestID
	if nQuestID == nil then
		nMissionID = LIB_Award:GetValueByRate(tbCTVLRate)
	end
	local nTaskValue = GetTask(TSK_CTVL_COUNT)
	SetTask(TSK_CTVL_COUNT, floor(nTaskValue/1000000)*1000000 + nMissionID*10000 + tbCTVLName[nMissionID][2])
	Talk(1,"", szNPCName.."Th� th�ch l�n n�y c�a ng��i l� <color=yellow>"..tbCTVLName[nMissionID][1].."<color>! H�y mau ch�ng ho�n th�nh.")
	TaskTip("Nh�n ���c m�t th� th�ch c�a Ch� T�n V��ng L�nh.")
end
function CTVL_CountDailyMission()
	local nCount = VNG_GetTaskPos(TSK_CTVL_COUNT, 7, 7)
	return nCount
end
function CTVL_AddCount()
	local nCount = CTVL_CountDailyMission()
	if nCount < 3 then
		nCount = nCount +1
	end
	VNG_SetTaskPos(TSK_CTVL_COUNT, nCount, 7, 7)
end
function CTVL_GetStatus()	-- L�y tr�ng th�i ho�n th�nh nhi�m v�. 0/1 = Ch�a ho�n th�nh/ ho�n th�nh
	local nStatus = VNG_GetTaskPos(TSK_CTVL_COUNT, 4, 4)
	return nStatus
end

function CTVL_SetStatus(nStatus)	-- Set tr�ng th�i ho�n th�nh nhi�m v�.
	nStatus = nStatus or 1
	if CTVL_GetStatus() == 0 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 1, 4, 4)
		CTVL_AddCount()
		return 1
	else
		return 0
	end
end
		--============================
function CTVL_SetMissionPart()
	local nPart = mod(GetTask(TSK_CTVL_COUNT),1000)
	if nPart >0 then
		nPart = nPart  - 1
		Msg2Player("Ho�n th�nh m�t l�n th� th�ch ph�c sinh 2, c�n "..nPart.." l�n n�a")
		SetTask(TSK_CTVL_COUNT, GetTask(TSK_CTVL_COUNT) - 1)
		if nPart == 0 then
			CTVL_SetStatus()
			Msg2Player("Ch�c m�ng b�n �� ho�n th�nh 1 nhi�m v� h�ng ng�y c�a Ch� T�n V��ng L�nh")
			CTVL_DeActive()			
		end
	end
end

function CTVL_GetMissionPart()
	return mod(GetTask(TSK_CTVL_COUNT), 1000)
end
--==============================

function CTVL_CheckActive() -- Ki�m tra tr�ng th�i nh�n th� th�ch: 1 = �� nh�n
	local nCheck = VNG_GetTaskPos(TSK_CTVL_COUNT, 8, 8)
	return nCheck
end

function CTVL_Active() -- Set tr�ng th�i nh�n th� th�ch: 1 = �� nh�n
	local nCheck = VNG_GetTaskPos(TSK_CTVL_COUNT, 8, 8)
	if nCheck < 1 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 1, 8, 8)
		return 1
	else
		return 0
	end
end
function CTVL_DeActive() -- Set tr�ng th�i nh�n th� th�ch: 0 = ch�a nh�n
	local nCheck = VNG_GetTaskPos(TSK_CTVL_COUNT, 8, 8)
	if nCheck == 1 then
		VNG_SetTaskPos(TSK_CTVL_COUNT, 0, 8, 8)
		return 1
	else
		return 0
	end
end

function CTVL_GetDailyMission()	-- L�y ID nhi�m v� �ang th�c hi�n
	local nTaskValue = VNG_GetTaskPos(TSK_CTVL_COUNT, 6, 5)
	return nTaskValue
end


--========================= ===========================================
--                                             Ch� T�n V��ng L�nh Newserver
--=====================================================================
tbMission = {
	[1] = {10,99, "Nh�n nhi�m v� ��ng c�p 10-99", 111401111},
	[2] = {191,199, "Nh�n nhi�m v� ��ng c�p 91-99 chuy�n sinh 1", 114033},
	[3] = {290,299, "Nh�n nhi�m v� ��ng c�p 90-99 chuy�n sinh 2", 1188},
	[4] = {390,399, "Nh�n nhi�m v� ��ng c�p 90-99 chuy�n sinh 3", 1391616},
	[5] = {490,499, "Nh�n nhi�m v� ��ng c�p 90-99 chuy�n sinh 4", 249},
	[6] = {586,586, "Nh�n nhi�m v� ��ng c�p 86 chuy�n sinh 5", 3},
	[7] = {587,587, "Nh�n nhi�m v� ��ng c�p 87 chuy�n sinh 5", 0},
	[8] = {588,588, "Nh�n nhi�m v� ��ng c�p 88 chuy�n sinh 5", 0},
	[9] = {589,589, "Nh�n nhi�m v� ��ng c�p 89 chuy�n sinh 5", 316},
	[10] = {590,590, "Nh�n nhi�m v� ��ng c�p 90 chuy�n sinh 5", 39},
	[11] = {591,591, "Nh�n nhi�m v� ��ng c�p 91 chuy�n sinh 5", 0},
	[12] = {592,592, "Nh�n nhi�m v� ��ng c�p 92 chuy�n sinh 5", 10},
	[13] = {593,593, "Nh�n nhi�m v� ��ng c�p 93 chuy�n sinh 5", 13916},
	[14] = {594,594, "Nh�n nhi�m v� ��ng c�p 94 chuy�n sinh 5", 16},
	[15] = {595,595, "Nh�n nhi�m v� ��ng c�p 95 chuy�n sinh 5", 100},
	[16] = {596,596, "Nh�n nhi�m v� ��ng c�p 96 chuy�n sinh 5", 100},
	[17] = {597,597, "Nh�n nhi�m v� ��ng c�p 97 chuy�n sinh 5", 1510050},
	[18] = {598,598, "Nh�n nhi�m v� ��ng c�p 98 chuy�n sinh 5", 8},
	[19] = {599,599, "Nh�n nhi�m v� ��ng c�p 99 chuy�n sinh 5", 1139},
--	[20] = {680,680, "Nh�n nhi�m v� ��ng c�p 80 Ph�c Sinh", 40100},
--	[21] = {688,699, "Nh�n nhi�m v� ��ng c�p 88-99 Ph�c Sinh", 0},
}

tbMissionPart = {
	[1] = {{"Thu ho�ch 1 b�t nh� nh�", 1,1}, {"Thu ho�ch 1 h�t gi�ng",2,2}, {"Thu ho�ch 1 c�y t� linh",3,3}, {"S� d�ng 1 n� oa b�o h�p",4,4}, {"S� d�ng 40 ph�o hoa",6,5}, {"Ho�n th�nh 1 l�n th�y l�i", 7,7}, {"Gia nh�p bang",8,8}, {"H�c khinh c�ng", 9,9}},
	[2] = {{"Thu ho�ch 3 b�t nh� nh�", 1,1}, {"Thu ho�ch 3 c�y t� linh",2,2}, {"S� d�ng 40 ph�o hoa",4,3}, {"Ho�n th�nh 1 l�n c�ng t�", 5,5}, {"S� h�u b�n ��ng h�nh c�p 1",6,6}},
	[3] = {{"Thu ho�ch 8 h�t gi�ng",1,1}, {"Thu ho�ch 8 c�y t� linh",2,2}, {"Ho�n th�nh 1 l�n c�ng t�", 3,3}, {"Th�c hi�n 1 t�ng d��ng sinh thu�t",4,4}},
	[4] = {{"Thu ho�ch 16 b�t nh� nh�", 2,1}, {"Thu ho�ch 16 h�t gi�ng",4,3}, {"S� d�ng 9 n� oa b�o h�p",5,5}, {"Ho�n th�nh 3 l�n th�y l�i", 6,6}, {"Tham gia 1 l�n Th�i h� huy�n c�nh", 7,7},},
	[5] = {{"S� d�ng 9 n� oa b�o h�p",1,1}, {"Ho�n th�nh 4 nhi�m v� T�i nguy�n chi�n",2,2}, {"S� d�ng 2 ng�i sao may m�n",3,3}},
	[6] = {{"Ho�n th�nh 3 l�n tr� an", 1,1}},
	[9] = {{"Thu ho�ch 16 c�y t� linh",2,1}, {"S� d�ng 3 ng�i sao may m�n",3,3}},
	[10] = {{"Thu ho�ch 39 b�t nh� nh�", 2,1}},
	[12] = {{"Th�c hi�n 10 l�n d��ng sinh thu�t",2,1}},
	[13] = {{"Thu ho�ch 16 c�y t� linh",2,1}, {"S� d�ng 39 n� oa b�o h�p",4,3}, {"Ho�n th�nh 1 l�n c�ng t�", 5,5}},
	[14] = {{"S� d�ng 16 ng�i sao may m�n",2,1}},
	[15] = {{"Thu ho�ch 100 h�t gi�ng",3,1}},
	[16] = {{"S� d�ng 100 n� oa b�o h�p",3,1}},
	[17] = {{"Thu ho�ch 50 h�t gi�ng",2,1}, {"S� d�ng 100 n� oa b�o h�p",5,3},{"Ho�n th�nh 15 nhi�m v� T�i nguy�n chi�n",7,6}},
	[18] = {{"Th�c hi�n 8 l�n d��ng sinh thu�t",1,1}},
	[19] = {{"S� d�ng 39 ng�i sao may m�n",2,1}, {"Nh�n nhi�m v� Ph�c Sinh",3,3}, {"S� d�ng 10 tr�i c�y m�i lo�i",4,4}},
--	[20] = {{"S� d�ng 100 n� oa b�o h�p",3,1}, {"S� d�ng 40 ph�o hoa",5,4}},
}

function ChiTonNew_GetStep()
	return VNG_GetTaskPos(TSK_CHITONNEW1, 2,1)
end


function ChiTonNew_SetMissionPart(nSubPart)
	local nStepID = ChiTonNew_GetStep()
	if tbMissionPart[nStepID][nSubPart] == nil then
		return 0
	end
	local nPart = VNG_GetTaskPos(TSK_CHITONNEW2, tbMissionPart[nStepID][nSubPart][2], tbMissionPart[nStepID][nSubPart][3])
	if nPart == 0 then
		return 0
	end
	nPart = nPart - 1
	VNG_SetTaskPos(TSK_CHITONNEW2, nPart, tbMissionPart[nStepID][nSubPart][2], tbMissionPart[nStepID][nSubPart][3])
	if nPart == 0 then
		TaskTip(tbMissionPart[nStepID][nSubPart][1]..": Ho�n th�nh.")
	else
		Msg2Player(tbMissionPart[nStepID][nSubPart][1]..": C�n "..nPart.." l�n.")
	end
end


function ChiTonNew_CheckNewServer()
	local nServerID = GetGlbValue(1023)
	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
	if nServerID ~= nNationality then
		return 0
	end
	local nKichhoat = mod(GetTask(TSK_CTVL_ALL), 10)
	if nKichhoat ~= 1 then
		return 0
	end
	if tbNewServer[nServerID] == 1 then
		return 1
	else
		return 0
	end
end


function ChiTonNew_ExpBonus(nExp)
	if ChiTonNew_CheckNewServer() == 1 then
		ModifyExp(nExp)
		Msg2Player("Th��ng Ch� T�n V��ng L�nh server m�i "..nExp.." �i�m kinh nghi�m.")
	end
end


function ChiTonNew_GetAward()
	return VNG_GetTaskPos(TSK_CHITONNEW1, 4,3)
end


function ChiTonNew_SetAward(nIndex)
	return VNG_SetTaskPos(TSK_CHITONNEW1, nIndex, 4,3)
end