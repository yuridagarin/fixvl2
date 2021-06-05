Include("\\script\\vng\\lib\\vnglib_award.lua")

szLogTitle = "NHIEM VU PHUC SINH 2"
szNPCName = "<color=green>B�ch Ti�n Sinh:<color> "
nMISSION_QTY = 50
nSoLuongNhiemVuNgay = 5
tbPhucSinh2Rate = {
	[1] = {[1] = 1, nRate = 2.10},	-- S� d�ng th�nh c�ng 40 Ph�o Hoa
	[2] = {[1] = 2, nRate = 2.10},	-- Ti�u di�t 200 Ki�m Ti�n T�
	[3] = {[1] = 3, nRate = 2.10},	-- Ti�u di�t 200 Sa M�c H�nh Nh�n
	[4] = {[1] = 4, nRate = 2.10},	-- Ti�u di�t 200 X�ch Luy�n H�a H�
	[5] = {[1] = 5, nRate = 2.10},	-- Ti�u di�t 200 Ti�u Lam Xoa Qu�
	[6] = {[1] = 6, nRate = 2.10},	-- N�p 02 T�i H�t Gi�ng
	[7] = {[1] = 7, nRate = 2.10},	-- Thu ho�ch th�nh c�ng 10 H�t Gi�ng
	[8] = {[1] = 8, nRate = 2.10},	-- N�p 10 b�t nh� nh�
	[9] = {[1] = 9, nRate = 2.10},	-- Thu ho�ch th�nh c�ng 10 b�t nh� nh�
	[10] = {[1] = 10, nRate = 2.10},	-- N�p 08 b�t nh� l�n
	[11] = {[1] = 11, nRate = 2.10},	-- Thu ho�ch th�nh c�ng 10 b�t nh� l�n
	[12] = {[1] = 12, nRate = 2.10},	-- N�p 08 c�y t� linh
	[13] = {[1] = 13, nRate = 2.10},	-- Thu ho�ch th�nh c�ng 10 c�y t� linh
	[14] = {[1] = 14, nRate = 2.10},	-- N�p 30 Thanh long qu�
	[15] = {[1] = 15, nRate = 2.10},	-- N�p 30 Huy�n V� C�n
	[16] = {[1] = 16, nRate = 2.10},	-- N�p 30 B�ch H� Di�p
	[17] = {[1] = 17, nRate = 2.10},	-- N�p 30 H�a Ph�ng Qu�
	[18] = {[1] = 18, nRate = 20.20},	-- N�p 29 tr�i c�y b�t k� c�ng lo�i (1 trong 20 lo�i)
	[19] = {[1] = 19, nRate = 2.10},	-- S� d�ng 20 lo�i tr�i c�y , m�i lo�i 10 tr�i
	[20] = {[1] = 20, nRate = 2.10},	-- Tham gia 01 l�n Th�i H� (mi�n ph�)
	[21] = {[1] = 21, nRate = 2.10},	-- Tham gia 01 l�n Th�i H� (thu ph�)
	[22] = {[1] = 22, nRate = 0.00},	-- V��t �i 7 T�ng Ki�m S�n trang 01 l�n
	[23] = {[1] = 23, nRate = 2.10},	-- Ho�n th�nh 01 l�n nhi�m v� Thi�n m�n tr�n
	[24] = {[1] = 24, nRate = 2.10},	-- Ho�n th�nh 01 l�n nhi�m v� T�i Nguy�n Chi�n
	[25] = {[1] = 25, nRate = 0.00},	-- Ho�n th�nh 01 l�n nhi�m v� Th�ng Thi�n ��nh
	[26] = {[1] = 26, nRate = 2.10},	-- N�p 100 V� l�m b�o h�p
	[27] = {[1] = 27, nRate = 2.10},	-- N�p 01 Ch�a Kh�a ��ng
	[28] = {[1] = 28, nRate = 2.10},	-- N�p 01 Ch�a Kh�a B�c
	[29] = {[1] = 29, nRate = 2.10},	-- N�p 01 Ch�a Kh�a V�ng
	[30] = {[1] = 30, nRate = 2.10},	-- N�p 02 Nh�n S�m V�n N�m
	[31] = {[1] = 31, nRate = 2.10},	-- N�p 02 Phi Y�n Th�ch
	[32] = {[1] = 32, nRate = 2.10},	-- N�p 01 Thi�n Qu�i Th�ch
	[33] = {[1] = 33, nRate = 2.10},	-- N�p 10 M�nh B�ch Kim
	[34] = {[1] = 34, nRate = 2.10},	-- N�p 03 Thi�n Th�ch Tinh Th�ch
	[35] = {[1] = 35, nRate = 2.10},	-- N�p 20 M�nh Thi�n Th�ch
	[36] = {[1] = 36, nRate = 2.15},	-- N�p 20 Thi�n Th�ch
	[37] = {[1] = 37, nRate = 2.10},	-- N�p 03 Qu�n C�ng Ch��ng
	[38] = {[1] = 38, nRate = 2.10},	-- N�p 02 Qu�n C�ng ��i
	[39] = {[1] = 39, nRate = 2.10},	-- N�p 01 Qu�n C�ng Huy Ho�ng
	[40] = {[1] = 40, nRate = 2.10},	-- S� d�ng 100 N� oa B�o h�p
	[41] = {[1] = 41, nRate = 2.10},	-- S� d�ng 16 Ng�i Sao May M�n
}
tbPhucSinh2Name = {
	[1] = {"S� d�ng th�nh c�ng 40 Ph�o Hoa", 40, 0},		-- {Quest name, Quest ID, Quest Type}; Type = 1: nop item; Type = 2: danh quai
	[2] = {"Ti�u di�t 200 Ki�m Ti�n T�", 200, 2},
	[3] = {"Ti�u di�t 200 Sa M�c H�nh Nh�n", 200, 2},
	[4] = {"Ti�u di�t 200 X�ch Luy�n H�a H�", 200, 2},
	[5] = {"Ti�u di�t 200 Ti�u Lam Xoa Qu�", 200, 2},
	[6] = {"N�p 02 T�i H�t Gi�ng", 1,1},
	[7] = {"Thu ho�ch th�nh c�ng 10 H�t Gi�ng", 10, 0},
	[8] = {"N�p 10 b�t nh� nh�", 1, 1},
	[9] = {"Thu ho�ch th�nh c�ng 10 b�t nh� nh�", 10, 0},
	[10] = {"N�p 08 b�t nh� l�n", 1, 1},
	[11] = {"Thu ho�ch th�nh c�ng 10 b�t nh� l�n", 10, 0},
	[12] = {"N�p 08 c�y t� linh", 1, 1},
	[13] = {" Thu ho�ch th�nh c�ng 10 c�y t� linh", 10, 0},
	[14] = {"N�p 30 Thanh long qu�", 1, 1},
	[15] = {"N�p 30 Huy�n V� C�n", 1, 1},
	[16] = {"N�p 30 B�ch H� Di�p", 1, 1},
	[17] = {"N�p 30 H�a Ph�ng Qu�", 1, 1},
	[18] = {"N�p 29 tr�i c�y b�t k� c�ng lo�i (1 trong 20 lo�i)", 1, 1},
	[19] = {"S� d�ng 20 lo�i tr�i c�y, m�i lo�i 10 tr�i", 20},
	[20] = {"Tham gia 01 l�n Th�i H� (mi�n ph�)", 1, 0},
	[21] = {"Tham gia 01 l�n Th�i H� (thu ph�)", 1, 0},
	[22] = {"V��t �i 7 T�ng Ki�m S�n trang 01 l�n", 1, 0},
	[23] = {"Ho�n th�nh 01 l�n nhi�m v� Thi�n m�n tr�n", 1, 0},
	[24] = {"Ho�n th�nh 01 l�n nhi�m v� T�i Nguy�n Chi�n", 1, 0},
	[25] = {"Ho�n th�nh 01 l�n nhi�m v� Th�ng Thi�n ��nh", 1, 0},
	[26] = {"N�p 100 V� l�m b�o h�p", 1, 1},
	[27] = {"N�p 01 Ch�a Kh�a ��ng", 1, 1},
	[28] = {"N�p 01 Ch�a Kh�a B�c", 1, 1},
	[29] = {"N�p 01 Ch�a Kh�a V�ng", 1, 1},
	[30] = {"N�p 02 Nh�n S�m V�n N�m", 1, 1},
	[31] = {"N�p 02 Phi Y�n Th�ch", 1, 1},
	[32] = {"N�p 01 Thi�n Qu�i Th�ch", 1, 1},
	[33] = {"N�p 10 M�nh B�ch Kim", 1, 1},
	[34] = {"N�p 03 Thi�n Th�ch Tinh Th�ch", 1, 1},
	[35] = {"N�p 20 M�nh Thi�n Th�ch", 1, 1},
	[36] = {"N�p 20 Thi�n Th�ch", 1, 1},
	[37] = {"N�p 03 Qu�n C�ng Ch��ng", 1, 1},
	[38] = {"N�p 02 Qu�n C�ng ��i", 1, 1},
	[39] = {"N�p 01 Qu�n C�ng Huy Ho�ng", 1, 1},
	[40] = {"S� d�ng 100 N� oa B�o h�p", 100},
	[41] = {"S� d�ng 16 Ng�i Sao May M�n", 16},
}

tbNguyenLieuThuThap = {
	[1] = {1,1,19,666, "T�y B�c V�ng", 17},		-- {nG, nD, nP, nQty, szItemName, nBit}
	[2] = {1,1,17,666, "Minh Nguy�t D�", 18},
	[3] = {1,1,15, 1999, "B�nh B�t v�ng", 19},
	[4] = {2,2,8,3999, "Thi�n th�ch", 20},
	[5] = {2,2,7, 3999, "M�nh Thi�n th�ch", 21},
--	[6] = {2,1,1009,299, "Thi�n Th�ch Tinh Th�ch", 22},
	[6] = {2,1,1005,6, "Chi�n Th�n Ho�n", 22},
	[7] = {2,1,30499,200, "Hu�n Ch��ng Anh H�ng", 23},
}
	
function PhucSinh2_CheckActive() -- Ki�m tra tr�ng th�i nh�n th� th�ch: 1 = �� nh�n
	local nCheck = gf_GetTaskByte(TSK_PHUCSINH2,1)
	return nCheck
end

function PhucSinh2_Active() -- Set tr�ng th�i nh�n th� th�ch: 1 = �� nh�n
	if gf_GetTaskByte(TSK_PHUCSINH2,1) < 1 then
		gf_SetTaskByte(TSK_PHUCSINH2, 1, 1)
		return 1
	else
		return 0
	end
end

function PhucSinh2_DeActive() -- Set tr�ng th�i nh�n th� th�ch: 0 = ch�a nh�n
	if GetTask(TSK_PHUCSINH2) == 1 then
		gf_SetTaskByte(TSK_PHUCSINH2, 1, 0)
		return 1
	else
		return 0
	end
end

function PhucSinh2_CheckFinishMission()
	if gf_GetTaskByte(TSK_PHUCSINH2, 2) == nMISSION_QTY and gf_GetTaskByte(TSK_PHUCSINH2, 3) == 127 then	--63
		return 1
	else
		return 0
	end
end

function PhucSinh2_Award_GetStatus()
	return gf_GetTaskByte(TSK_PHUCSINH2, 4)
end

function PhucSinh2_Award_SetStatus()
	if PhucSinh2_Award_GetStatus() == 0 then
		gf_SetTaskByte(TSK_PHUCSINH2, 4, 1)
	end
end


--==========================
function PhucSinh2_GetCount()	-- ��m s� l��ng nhi�m v� ho�n th�nh
	return gf_GetTaskByte(TSK_PHUCSINH2,2)
end

function PhucSinh2_AddCount(nValue)	-- Th�m s� l�n ho�n th�nh nhi�m v�
	nValue = nValue or 1
	local nMissionCount = PhucSinh2_GetCount() + nValue
	if nMissionCount > nMISSION_QTY then
		return 0
	end
	gf_SetTaskByte(TSK_PHUCSINH2, 2, nMissionCount)
	TaskTip("Ho�n th�nh nhi�m v� th� th�ch Ph�c Sinh 2 m�i ng�y. Mau v� g�p B�ch Ti�n Sinh nh�n nhi�m v� m�i.")
	gf_WriteLogEx(szLogTitle,"ho�n th�nh",1,"Ho�n th�nh nhi�m v� th� "..nMissionCount.."/"..nMISSION_QTY)
end

--===========================
function PhucSinh2_GetDailyMission()	-- L�y ID nhi�m v� �ang th�c hi�n
	local nTaskValue = GetTask(TSK_PHUCSINH2_COUNT)
	return mod(floor(nTaskValue/10000),100)
end

function PhucSinh2_SetDailyMission(nQuestID)	-- Set ID nhi�m v� �ang th�c hi�n
	if PhucSinh2_GetCount() >= nMISSION_QTY then
		Talk(1,"",szNPCName.."Ng��i �� ho�n th�nh "..nMISSION_QTY.."/"..nMISSION_QTY.." nhi�m v�, kh�ng c�n ph�i l�m th�m.")
		return 0
	end
	local nMissionID = nQuestID
	if nQuestID == nil then
		nMissionID = LIB_Award:GetValueByRate(tbPhucSinh2Rate)
	end
	local nTaskValue = GetTask(TSK_PHUCSINH2_COUNT)
	SetTask(TSK_PHUCSINH2_COUNT, floor(nTaskValue/1000000)*1000000 + nMissionID*10000 + tbPhucSinh2Name[nMissionID][2])
	Talk(1,"", szNPCName.."Th� th�ch l�n n�y c�a ng��i l� <color=yellow>"..tbPhucSinh2Name[nMissionID][1].."<color>! H�y mau ch�ng ho�n th�nh.")
	TaskTip("Nh�n ���c m�t th� th�ch Ph�c Sinh 2.")
	if PhucSinh2_GetDailyMission() == 19 then
		PhucSinh2_FruitCheck()
	end
end

function PhucSinh2_CountDailyMission()
	return floor(GetTask(TSK_PHUCSINH2_COUNT)/1000000)
end

function PhucSinh2_GetStatus()	-- L�y tr�ng th�i ho�n th�nh nhi�m v�. 0/1 = Ch�a ho�n th�nh/ ho�n th�nh
	return mod(floor(GetTask(TSK_PHUCSINH2_COUNT)/1000),10)
end

function PhucSinh2_SetStatus(nStatus)	-- Set tr�ng th�i ho�n th�nh nhi�m v�.
	nStatus = nStatus or 1
	if PhucSinh2_GetStatus() == 0 then
		SetTask(TSK_PHUCSINH2_COUNT, GetTask(TSK_PHUCSINH2_COUNT) + 1001000)
		
		PhucSinh2_AddCount()
		return 1
	else
		return 0
	end
end

--============================
function PhucSinh2_SetMissionPart()
	local nPart = mod(GetTask(TSK_PHUCSINH2_COUNT),1000)
	if nPart >0 then
		nPart = nPart  - 1
		Msg2Player("Ho�n th�nh m�t l�n th� th�ch ph�c sinh 2, c�n "..nPart.." l�n n�a")
		SetTask(TSK_PHUCSINH2_COUNT, GetTask(TSK_PHUCSINH2_COUNT) - 1)
		if nPart == 0 then
			PhucSinh2_SetStatus()
		end
	end
end

function PhucSinh2_GetMissionPart()
	return mod(GetTask(TSK_PHUCSINH2_COUNT), 1000)
end


--==============================
function PhucSinh2_FruitCheck()
	local tbFruitTask = {TSK_USEFRUIT_FLAG_1, TSK_USEFRUIT_FLAG_2, TSK_USEFRUIT_FLAG_3, TSK_USEFRUIT_FLAG_4}
	local nCount = 0
	for i=1, getn(tbFruitTask) do
		local nTaskValue = GetTask(tbFruitTask[i])
		for j=1,5 do
			if mod(nTaskValue,100) == 10 then
				nCount = nCount + 1
			end
			nTaskValue = floor(nTaskValue/100)
		end
	end
	if nCount >= 20 then
		PhucSinh2_SetStatus()
	else
		SetTask(TSK_PHUCSINH2_COUNT, floor(GetTask(TSK_PHUCSINH2_COUNT)/1000)*1000 + (20 - nCount))
	end
end


function PhucSinh2_ThuThapNguyenLieu(nIndex)
	if tbNguyenLieuThuThap[nIndex] == nil then
		return 0
	end
	if gf_GetTaskBit(TSK_PHUCSINH2, tbNguyenLieuThuThap[nIndex][6]) == 1 then
		return 0
	end
	if GetItemCount(tbNguyenLieuThuThap[nIndex][1], tbNguyenLieuThuThap[nIndex][2], tbNguyenLieuThuThap[nIndex][3]) < tbNguyenLieuThuThap[nIndex][4] then
		Talk(1,"",szNPCName .."C�c h� kh�ng c� �� <color=yellow>"..tbNguyenLieuThuThap[nIndex][4].." "..tbNguyenLieuThuThap[nIndex][5].."<color>.")
		return 0
	end
	if DelItem(tbNguyenLieuThuThap[nIndex][1], tbNguyenLieuThuThap[nIndex][2], tbNguyenLieuThuThap[nIndex][3], tbNguyenLieuThuThap[nIndex][4]) == 1 then
		gf_SetTaskBit(TSK_PHUCSINH2, tbNguyenLieuThuThap[nIndex][6], 1, 0)
		Talk(1,"",szNPCName .."Ta �� nh�n �� <color=yellow>"..tbNguyenLieuThuThap[nIndex][4].." "..tbNguyenLieuThuThap[nIndex][5].."<color> c�a c�c h�.")
	end
end