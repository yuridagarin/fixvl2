Include("\\script\\vng\\lib\\vnglib_function.lua");

szNpcName = "<color=green>C� L�o Ta<color>:"

tbSTVNconfig = { --TaskID, mission name, mission qty, TaskPosStart, TaskPosEnd
	[1] = {TSK_SINHTUVONGA1, "tr�ng c�y T� Linh", 16,2,1},
	[2] = {TSK_SINHTUVONGA1, "tr�ng c�y B�t Nh� nh�", 16,4,3},
	[3] = {TSK_SINHTUVONGA1, "tr�ng h�t gi�ng", 24,6,5},
	[4] = {TSK_SINHTUVONGA1, "L��ng S�n B�c", 3,7,7},
	[5] = {TSK_SINHTUVONGA1, "Thi�n M�n Tr�n", 3,8,8},
	[6] = {TSK_SINHTUVONGA1, "Th�y L�i", 3,9,9},
	[7] = {TSK_SINHTUVONGA3, "C�ng T�", 3,1,1},
}

tbSTVNDailyMissionConfig = { --TaskID, mission name, mission qty, TaskPosStart, TaskPosEnd
	[1] = {TSK_SINHTUVONGA3, "nh�n th��ng chi�n tr��ng b�o v� th�nh tr�", 1,2,2},
	[2] = {TSK_SINHTUVONGA3, "nh�n th��ng chi�n tr��ng Nh�n M�n Quan", 1,3,3},
	[3] = {TSK_SINHTUVONGA3, "ho�n th�nh nhi�m v� t�i nguy�n chi�n", 1,4,4},
	[4] = {TSK_SINHTUVONGA3, "nh�n th��ng Thi�n M�n Tr�n", 1,5,5},
}

tbActiveFee = {
	[0] = {{item={{gdp={2,1,30230,800}}}}},
	[1] = {{item={{gdp={2,1,30230,700}}}}},
	[2] = {{item={{gdp={2,1,30230,600}}}}},
	[3] = {{item={{gdp={2,1,30230,500}}}}},
	[4] = {{item={{gdp={2,1,30230,400}}}}},
	[5] = {{item={{gdp={2,1,30230,300}}}}, {item={{gdp={2,1,30490,2}}}, nGold=9990000}},
	[6] = {{item={{gdp={2,1,30490,1}}}, nGold=9990000}},
}

tb_translife_cloth_PS = {
										[1] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,5,639,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},		
										[2] = {
													{"Chuy�n Sinh Trang", {0,108,30005,1,4,6,302,6,102}}, 
													{"Chuy�n Sinh Trang", {0,109,30005,1,4,5,409,6,102}}, 
													{"Chuy�n Sinh Trang", {0,110,30005,1,4,5,79,5,80,6,102}},
											},
										[3] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,2,13075,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,6,306,6,102}},
											},	
										[4] = {
													 {"Chuy�n Sinh Trang", {0,108,30005,1,4,5,27,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,109,30005,1,4,5,342,6,102}}, 
													 {"Chuy�n Sinh Trang", {0,110,30005,1,4,4,292,4,293,6,102}},
											},
									}
									
function STVN_time_remain()
	local nSinhTu_End = GetTime()
	if nSinhTu_End - GetTask(TSK_SINHTUVONGA2) <= 5184000 then
		return 1
	end
	return 0
end


function STVN_MissionAccept()
	if STVN_GetStatus() ~= 0 then
		return 0
	end
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	SetTask(TSK_SINHTUVONGA2, GetTime())
	STVN_SetStatus(1)
	if nChuyenSinh < 599 then
		SetTask(TSK_SINHTUVONGA1,33241616)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)
		local szTalk = szNpcName.."C�c h� �� nh�n nhi�m v� Sinh T� V� Ng�. H�y nhanh ch�ng ho�n th�nh c�c th� th�ch sau �� k�ch ho�t:\n"
		szTalk = szTalk .. "- Tr�ng 16 c�y T� Linh\n"
		szTalk = szTalk .. "- Tr�ng 16 c�y B�t Nh� nh�\n"
		szTalk = szTalk .. "- Tr�ng 24 h�t gi�ng\n"
		szTalk = szTalk .. "- Ho�n th�nh 3 nhi�m v� L��ng S�n B�c\n"
		szTalk = szTalk .. "- Nh�n th��ng 3 l�n Thi�n M�n Tr�n"
		Talk(1,"",szTalk)
	elseif nChuyenSinh == 599 then
		SetTask(TSK_SINHTUVONGA1,333241616)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,3,1,1)
		local szTalk = szNpcName.."C�c h� �� nh�n nhi�m v� Sinh T� V� Ng�. H�y nhanh ch�ng ho�n th�nh c�c th� th�ch sau �� k�ch ho�t:\n"
		szTalk = szTalk .. "- Tr�ng 16 c�y T� Linh\n"
		szTalk = szTalk .. "- Tr�ng 16 c�y B�t Nh� nh�\n"
		szTalk = szTalk .. "- Tr�ng 24 h�t gi�ng\n"
		szTalk = szTalk .. "- Ho�n th�nh 3 nhi�m v� L��ng S�n B�c\n"
		szTalk = szTalk .. "- Nh�n th��ng 3 l�n Thi�n M�n Tr�n\n"
		szTalk = szTalk .. "- Ho�n th�nh 3 l�n nhi�m v� Th�y L�i\n"
		szTalk = szTalk .. "- Ho�n th�nh 3 l�n nhi�m v� C�ng T�"
		Talk(1,"",szTalk)
	else
--		VNG_SetTaskPos(TSK_SINHTUVONGA3,2,9,9)
		SetTask(TSK_SINHTUVONGA1,0)
		VNG_SetTaskPos(TSK_SINHTUVONGA3,0,1,1)
		Talk(1,"",szNpcName.."C�p �� c�c h� kh�ng c�n th�c hi�n nhi�m v�, h�y mau k�ch ho�t Sinh T� V� Ng�.")
	end
	return 1
end


function STVN_GetStatus()
	local nStatus = VNG_GetTaskPos(TSK_SINHTUVONGA3,9,9)
	local tbStatus = {
		[0] = "ch�a nh�n nhi�m v� Sinh T� V� Ng�",
		[1] = "�� nh�n nhi�m v�, ch�a k�ch ho�t Sinh T� V� Ng�",
		[2] = "�� k�ch ho�t th�nh c�ng Sinh T� V� Ng�",
		[3] = "�� h�t h�n nh�n th��ng",
	}
	if tbStatus[nStatus] == nil then
		nStatus = 0
	end
	return nStatus, tbStatus[nStatus]
end


function STVN_SetStatus(nIndex)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,nIndex,9,9)
end


function STVN_SubMissionComplete(nMissionID)
	if STVN_GetStatus() ~= 1 then
		return 0
	end
	local tbMission = tbSTVNconfig[nMissionID]
	local nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
	if nQty > 0 then
		VNG_SetTaskPos(tbMission[1], nQty - 1, tbMission[4], tbMission[5])
	end
	TaskTip("Sinh T� V� Ng�: ho�n th�nh 1 l�n nhi�m v� "..tbMission[2]..", c�n ho�n th�nh "..(nQty-1).." l�n �� k�ch ho�t.")
	if STVN_AllMissionComplete() == 1 then
		TaskTip("�� ho�n th�nh t�t c� nhi�m v�, h�y mau k�ch ho�t Sinh T� V� Ng�.")
	end
	return 1
end


function STVN_AllMissionComplete()
	local nMission1 = GetTask(TSK_SINHTUVONGA1)
	local nMission2 = VNG_GetTaskPos(TSK_SINHTUVONGA3,1,1)
	if (nMission1 + nMission2) == 0 then
		return 1
	else
		return 0
	end
end


function STVN_GetDailyAwardStatus()
	local nStatus = VNG_GetTaskPos(TSK_SINHTUVONGA3,6,6)
	local tbStatus = {
		[0] = "ch�a nh�n nhi�m v� h�ng ng�y",
		[1] = "ch�a ho�n th�nh nhi�m v�",
		[2] = "ch�a nh�n th��ng nhi�m v� h�ng ng�y",
		[3] = "�� nh�n th��ng nhi�m v� h�ng ng�y",
	}
	return nStatus, tbStatus[nStatus]
end


function STVN_SetDailyAwardStatus(nValue)
	VNG_SetTaskPos(TSK_SINHTUVONGA3,nValue,6,6)
end


function STVN_AllDailyMissionComplete()
	local nCheck = 0
	for i=1,getn(tbSTVNDailyMissionConfig) do
		nCheck = nCheck + VNG_GetTaskPos(TSK_SINHTUVONGA3,tbSTVNDailyMissionConfig[i][4],tbSTVNDailyMissionConfig[i][5])
	end
	if nCheck == 0 then
		return 1
	else
		return 0
	end
end


function STVN_DailyMissionComplete(nMissionID)
	if STVN_GetDailyAwardStatus() >= 2 then
		return 0
	end
	local tbMission = tbSTVNDailyMissionConfig[nMissionID]
	local nQty = VNG_GetTaskPos(tbMission[1], tbMission[4], tbMission[5])
	if nQty > 0 then
		VNG_SetTaskPos(tbMission[1], nQty - 1, tbMission[4], tbMission[5])
	end
	TaskTip("Nhi�m v� h�ng ng�y Sinh T� V� Ng�: ho�n th�nh 1 l�n nhi�m v� "..tbMission[2])
	if STVN_AllDailyMissionComplete() == 1 then
		TaskTip("�� ho�n th�nh t�t c� nhi�m v� h�ng ng�y, h�y mau nh�n th��ng.")
		STVN_SetDailyAwardStatus(2)
	end
	return 1
end


function STVN_DailyMissionView()
	local szMission = szNpcName .."Chi ti�t nhi�m v� h�ng Sinh T� V� Ng�:\n"
	for i=1, getn(tbSTVNDailyMissionConfig) do
		szMission = szMission .. tbSTVNDailyMissionConfig[i][2]..": c�n <color=red>".. VNG_GetTaskPos(TSK_SINHTUVONGA3,tbSTVNDailyMissionConfig[i][4],tbSTVNDailyMissionConfig[i][5]) .."<color> l�n.\n"
	end
	Talk(1,"",szMission)
end