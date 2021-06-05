Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

function CS6_Mission_Kill()
	local tbMobsList = {
		[1] = {"Ti�u Lam �ao Qu�", 	TSK_CS6_DaoQuy_XoaQuy, 	1},
		[2] = {"Ti�u Lam Xoa Qu�", 		TSK_CS6_DaoQuy_XoaQuy, 	2},
		[3] = {"Sa M�c H�nh Nh�n", 	TSK_CS6_SaMac_TamBao, 		1},
		[4] = {"T�m B�o Nh�n", 			TSK_CS6_SaMac_TamBao, 		2},
		[5] = {"Ki�m ti�n T�", 				TSK_CS6_KiemTien_DichTien, 	1},
		[6] = {"��ch ti�n T�", 				TSK_CS6_KiemTien_DichTien, 	2},
		[7] = {"Li�t Nhan Li Long", 		TSK_CS6_LiLong_HoaHo, 		1},
		[8] = {"X�ch Luy�n H�a H�", 	TSK_CS6_LiLong_HoaHo, 		2},
	}
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	local nIndex = 0
	for i=1, getn(tbMobsList) do
		if tbMobsList[i][1] == sName then
			nIndex = i
			break
		end
	end
	if nIndex == 0 then
		return 0
	end
	
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		CS6_MobKilled_Add(tbMobsList[nIndex][1], tbMobsList[nIndex][2], tbMobsList[nIndex][3])
	else
		local nOldIndex = PlayerIndex
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			CS6_MobKilled_Add(tbMobsList[nIndex][1], tbMobsList[nIndex][2], tbMobsList[nIndex][3])
		end
		PlayerIndex = nOldIndex
	end
end


function CS6_MobKilled_Add(szMobName, nMisstionTask, nPosition)
	local nTaskValue = GetTask(nMisstionTask)
	local nMobCount = floor(nTaskValue/10000)
	local nAddValue = 10000
	if nPosition ~= 1 then
		nMobCount = mod(nTaskValue,10000)
		nAddValue = 1
	end
	if GetTask(TSK_CS6_TULINH) == 4 and nMobCount < 9999 then
		nTaskValue = nTaskValue + nAddValue
		SetTask(nMisstionTask, nTaskValue)
		Msg2Player("Nhi�m v� T� Linh Ph�c Sinh: �� gi�t ���c ".. nMobCount  .."/9999 "..szMobName)
	end
end


function CS7_Mission_Kill()
	local tbMobsList = {
		[1] = {"Ki�m ti�n T�", 	2},
		[2] = {"Sa M�c H�nh Nh�n", 3},
		[3] = {"X�ch Luy�n H�a H�", 4},
		[4] = {"Ti�u Lam Xoa Qu�", 5},
	}
	local nNpcIdx,sMoban,sName = GetTriggeringUnit();
	local nIndex = 0
	for i=1, getn(tbMobsList) do
		if tbMobsList[i][1] == sName then
			nIndex = i
			break
		end
	end
	if tbMobsList[nIndex] == nil then
		return 0
	end
	if tbMobsList[nIndex][2] ~= PhucSinh2_GetDailyMission() then
		return 0
	end
	PhucSinh2_SetMissionPart()
end