--=============================================
-- Created by TuanNA5
-- B�c ��u Truy�n C�ng Thu�t
-- B�c ��u D��ng Sinh Thu�t
--=============================================

Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\award\\feature_award.lua")

CALL_BACK_FILE = "\\script\\task\\shimenguanka\\trigger.lua"

nExpGetNo = 30000
nExpLoseNo = 90000
nExpMaxNo = 4200
nExpLoseMaxNo = 8100
nPracticeMaxNo = 120
nBchNo = 1
nBctdNo = 4

nExpGetSp = 68000
nExpLoseSp = 238000
nExpMaxSp = 9520
nExpLoseMaxSp = 33320
nPracticeMaxSp = 120
nBchSp = 4
nBctdSp = 10

tb_main_city = {100, 150, 200, 300, 350, 400, 500}
tb_main_city_truyencong = {
	[100] = 1, 
	[150] = 1, 
	[200] = 1, 
	[300] = 1, 
	[350] = 1, 
	[400] = 1, 
	[500] = 1,
}
tb_main_city_2 = {100,150}

-- �i�m kinh nghi�m, b�ch c�u ho�n, ��i b�ch c�u ho�n, b�ch c�u ti�n ��n
tb_Practice_No = 	{
						{40000,4,4,0},
						{50000,4,0,4},
						{70000,0,4,4},
						{80000,4,4,4},
					}

tb_Practice_Sp =	{
						{80000,10,10,0},
						{100000,10,0,10},
						{140000,0,10,10},
						{160000,10,10,10},
					}

tb_TASKID_TYPE_NO = {TSK_PRATICE_NEILI_EXP_TYPE_1, TSK_PRATICE_NEILI_EXP_TYPE_2,TSK_PRATICE_NEILI_EXP_TYPE_3,TSK_PRATICE_NEILI_EXP_TYPE_4}

tb_TASKID_TYPE_SP = {TSK_PRATICE_NEILI_EXP_TYPE_1_SP, TSK_PRATICE_NEILI_EXP_TYPE_2_SP,TSK_PRATICE_NEILI_EXP_TYPE_3_SP,TSK_PRATICE_NEILI_EXP_TYPE_4_SP}



function OnTimer()
	local nType = GetTaskTemp(TSK_TMP_PRACTICE_NEILI)
	local nSkillType = GetTaskTemp(TSK_TMP_NEILI_TYPE_SP)
		
	local nTaskGetExp = TSK_GET_NEILI_EXP
	local nTaskLoseExp = TSK_GIVE_NEILI_EXP
	local nExpGet = nExpGetNo
	local nExpLose = nExpLoseNo
	local nExpMax = nExpMaxNo
	local nExpLoseMax = nExpLoseMaxNo
	local nPracticeMax = nPracticeMaxNo
	local tb_Practice = tb_Practice_No
	local tb_TASKID_TYPE = tb_TASKID_TYPE_NO
	local nMinRequired = 4
	local nBch = nBchNo
	local nBctd = nBctdNo
	
	if nSkillType == 2 then
		nTaskGetExp = TSK_GET_NEILI_EXP_SP
		nTaskLoseExp = TSK_GIVE_NEILI_EXP_SP
		tb_Practice = tb_Practice_Sp
		tb_TASKID_TYPE = tb_TASKID_TYPE_SP
		nExpGet = nExpGetSp
		nExpLose = nExpLoseSp
		nExpMax = nExpMaxSp
		nExpLoseMax = nExpLoseMaxSp
		nPracticeMax = nPracticeMaxSp
		nMinRequired = 10
		nBch = nBchSp
		nBctd = nBctdSp
	end
	if nSkillType == 3 then
		nTaskGetExp = TSK_GET_DHTN 		--TSK_GET_NEILI_EXP_SP
		nTaskLoseExp = TSK_GIVE_DHTN		--TSK_GIVE_NEILI_EXP_SP
		nExpGet = 8900000
		nExpLose = 10000000
		nExpMax = 100000
		nExpLoseMax = 100000
		nMinRequired = 120
		nBch = 120
		nBctd = 120
	end
	
	if nType == 0 then
		local nTeamSize = GetTeamSize();
		if nTeamSize == 0 or nTeamSize == 1 then	
			StopTransfer()
			Talk(1,"","T� ��i ph�i c� 2 ng��i tr� l�n m�i c� th� k�ch ho�t truy�n c�ng!")		
			return
		end	
		if nSkillType == 3 then
			if nTeamSize >= 3 then	
				StopTransfer()
				Talk(1,"","T� ��i 2 ng��i m�i c� th� k�ch ho�t Di Hoa Ti�p Ng�c")		
				return
			end	
		end
		if GetName() ~= GetCaptainName() then
			StopTransfer()
			Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t truy�n c�ng!")		
			return
		end
		local nCheckCity = 0
		local nMapID1, nX1, nY1 = GetWorldPos()
		if tb_main_city_truyencong[nMapID1] ~= 1 then
			StopTransfer()
			Talk(1, "", "Ch� c� th� k�ch ho�t truy�n c�ng trong th�t ��i th�nh th�!");
			return
		end
--		for i = 1, getn(tb_main_city) do
--			if nMapID1 == tb_main_city[i] then
--				nCheckCity = 1
--				break
--			end
--		end
--		if nCheckCity == 0 then
--			StopTransfer()
--			Talk(1, "", "Ch� c� th� k�ch ho�t truy�n c�ng trong th�t ��i th�nh th�!");
--			return
--		end
		if IsPlayerDeath() == 1 then
			StopTransfer()
			Talk(1,"","Kh�ng th� truy�n c�ng khi tr�ng th��ng!")	
			return
		end
		if IsStalling() == 1 then
			StopTransfer()
			Talk(1,"","Tr�ng th�i b�y b�n kh�ng th� k�ch ho�t truy�n c�ng!")	
			return
		end
		if GetTask(2508) < nMinRequired then
			StopTransfer()
			Talk(1,"","Th�i gian �y th�c B�ch C�u Ti�n ��n kh�ng �� "..nMinRequired.." ph�t!")	
			return
		end
		local nDate, nTotal = TransNeiliGetTask(nTaskGetExp)
		if tonumber(date("%m%d")) ~= nDate then
			TransNeiliSetTask(nTaskGetExp,2,tonumber(date("%m%d")))
		end
		nDate, nTotal = TransNeiliGetTask(nTaskGetExp)
		
		if nTotal + (floor(nExpGet/10000) * (nTeamSize - 1)) > nExpMax then
			StopTransfer()
			Talk(1,"","H�m nay b�n �� nh�n �� s� kinh nghi�m, mai h�y ti�p t�c!")	
			return
		end	
		local nOldIndex = PlayerIndex;
		local nMemberOK = 0
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if GetName() ~= GetCaptainName() then
				local nMapID2, nX2, nY2 = GetWorldPos()
				if GetTaskTemp(TSK_TMP_TRANS_NEILI) == 1 then
					if IsStalling() == 0 and IsPlayerDeath() == 0 then
						if DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) >= 0 and DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) <= 8 then
							if GetTask(2501) >= 1 then
								local nDate, nTotal = TransNeiliGetTask(nTaskLoseExp)
								if tonumber(date("%m%d")) ~= nDate then
									TransNeiliSetTask(nTaskLoseExp,2,tonumber(date("%m%d")))
								end
								nDate, nTotal = TransNeiliGetTask(nTaskLoseExp)
								if nTotal + floor(nExpLose/10000) <= nExpLoseMax then
									if GetExp() >= nExpLose then
										ModifyExp(-nExpLose)
										nMemberOK = nMemberOK +1
										SetCurrentNpcSFX(PIdx2NpcIdx(),905,1,1)
										TransNeiliSetTask(nTaskLoseExp,1,floor(nExpLose/10000))
										SetTask(2501,GetTask(2501) - nBch)
										Msg2Player("B�n b� tr� "..nExpLose.." �i�m kinh nghi�m.")
										local szLogTitle = "Bac Dau Truyen Cong Thuat"
										if nSkillType == 2 then
											szLogTitle = szLogTitle.." Dac Biet"
										end
										if nSkillType == 3 then
											szLogTitle = szLogTitle.." Di Hoa Tiep Ngoc"
										end
										WriteLogEx(szLogTitle,"m�t", nExpLose,"�i�m kinh nghi�m")
									else
										SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
										Msg2Player("�i�m kinh nghi�m c�a b�n kh�ng ��.")
									end
								else
									SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
									Msg2Player("H�m nay b�n �� cho �� s� kinh nghi�m, mai h�y ti�p t�c!")
								end
							else
								SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
								if nSkillType == 1 then
									nMinRequired = 1
								end
								Msg2Player("Th�i gian �y th�c B�ch C�u Ho�n kh�ng �� "..nMinRequired.." ph�t!")
							end
						else
							SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
							Msg2Player("Kho�ng c�ch gi�a b�n v� ��i tr��ng qu� xa.")
						end
					else
						SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
						Msg2Player("Tr�ng th�i b�y b�n kh�ng th� truy�n c�ng.")
					end
				else
					SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
					Msg2Player("B�n kh�ng ��ng � tham gia truy�n c�ng.")
				end
			end	
		end
		PlayerIndex = nOldIndex
		if nMemberOK > 0 then
			SetTask(2508,GetTask(2508) - nBctd)
			TransNeiliSetTask(nTaskGetExp,1,floor(nExpGet/10000) * nMemberOK)
			ModifyExp(nExpGet * nMemberOK)
			SetCurrentNpcSFX(PIdx2NpcIdx(),901,1,1)
			Msg2Player("B�n nh�n ���c "..(nExpGet * nMemberOK).." �i�m kinh nghi�m.")
			local szLogTitle = "Bac Dau Truyen Cong Thuat"
			if nSkillType == 2 then
				szLogTitle = szLogTitle.." Dac Biet"
			end
			WriteLogEx(szLogTitle,"nh�n",nExpGet * nMemberOK,"�i�m kinh nghi�m")
		else
			StopTransfer()
			Talk(1,"","S� ng��i �� �i�u ki�n trong t� ��i l� 0, kh�ng th� ti�p t�c truy�n c�ng!")		
			return
		end
	elseif nType >= 1 and nType <= 4  then
		local nSelect = GetTaskTemp(TSK_TMP_TRANS_NEILI)
		local nTeamSize = GetTeamSize();
		local nMapID1, nX1, nY1= GetWorldPos()	
		local nCheckCity = 0
		for i = 1, getn(tb_main_city_2) do
			if nMapID1 == tb_main_city_2[i] then
				nCheckCity = 1
				break
			end
		end
		if nCheckCity == 0 then
			RemoveTrigger(GetTrigger(2509));		
			SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
			SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
			SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
			SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
			Talk(1, "", "Ch� c� th� k�ch ho�t luy�n c�ng � Tuy�n Ch�u v� D��ng Ch�u!");			
			return
		end
		if nSelect <= 0 then
			RemoveTrigger(GetTrigger(2509));		
			SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
			SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
			SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
			SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
			Talk(1,"","Kich ho�t luy�n c�ng kh�ng th�nh c�ng!")	
			return
		end
		if IsStalling() == 1 then
			RemoveTrigger(GetTrigger(2509));		
			SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
			SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
			SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
			SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
			Talk(1,"","Tr�ng th�i b�y b�n kh�ng th� k�ch ho�t luy�n c�ng!")	
			return
		end
		local nSmall = GetTask(2501)
		local nMed = GetTask(2507)
		local nBig = GetTask(2508)
		if nSmall < tb_Practice[nSelect][2] or nMed < tb_Practice[nSelect][3] or nBig < tb_Practice[nSelect][4] then	
			RemoveTrigger(GetTrigger(2509));		
			SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
			SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
			SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
			SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
			Talk(1,"","Th�i gian �y th�c kh�ng �� "..nMinRequired.." ph�t!")			
			return
		end
		local nTaskID = tb_TASKID_TYPE[nType]		
		local nDate, nTotal = PracticeGetTask(nTaskID)
		if tonumber(date("%y%m%d")) ~= nDate then
			PracticeSetTask(nTaskID,2,tonumber(date("%y%m%d")))
		end
		nDate, nTotal = PracticeGetTask(nTaskID)
		if nTotal >= nPracticeMax then
			RemoveTrigger(GetTrigger(2509));		
			SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
			SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
			SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
			SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
			Talk(1,"","H�m nay b�n �� nh�n �� s� kinh nghi�m c�a t�ng "..nType.."!")	
			return			
		end
		local nExp = tb_Practice[nSelect][1]
		SetTask(2501, nSmall -  tb_Practice[nSelect][2])
		SetTask(2507, nMed -  tb_Practice[nSelect][3])
		SetTask(2508, nBig -  tb_Practice[nSelect][4])
		PracticeSetTask(nTaskID,1, 1)
		ModifyExp(nExp)
		SetCurrentNpcSFX(PIdx2NpcIdx(),918,1,1)
		local nPlayerRoute = GetPlayerRoute()
		if GetSkillLevel(tMasterSkillInfo[nPlayerRoute]) >= 5 and GetSkillLevel(tMasterSkillInfo[nPlayerRoute]) < 10 then
			gf_SetTaskByte(TSK_MASTER_SKILL,1,gf_GetTaskByte(TSK_MASTER_SKILL,1) + 1)
			if mod(gf_GetTaskByte(TSK_MASTER_SKILL,1) ,100) == 0 then
				LevelUpSkill(tMasterSkillInfo[nPlayerRoute])
				Msg2Player("B�n �� l�nh h�i ���c 1 th�nh v� c�ng tr�n ph�i.")
			end			
		end
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m.")
		local szLogTitle = "Bac Dau Duong Sinh Thuat"
		if nSkillType == 2 then
			szLogTitle = szLogTitle.." Dac Biet"
		end
		WriteLogEx(szLogTitle,"nh�n",nExp,"�i�m kinh nghi�m")		
	elseif nType == 99 then
		SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
		local nCurCamp = 1
		local szCamp = "T�ng"
		local npcCamp = "dasong"
		if GetTask(704) < 0 then
			nCurCamp = 2
			szCamp = "Li�u"
			npcCamp = "daliao"
		end
		local nBossPos = 	{
										[1] = 	{
													{884, 1674, 3598},
													{884, 1620, 3643},
													{884, 1757, 3313},
												},
										[2] =  {
													{884, 1886, 3640},
													{884, 1828, 3601},
													{884, 1765, 3313},
												}										
									}
		for i=1, getn(nBossPos[nCurCamp]) do
			local nNpcIndex = CreateNpc("yingzi_viet",szCamp.." B�ch Th�ng Chi�n Th�n",nBossPos[nCurCamp][i][1], nBossPos[nCurCamp][i][2], nBossPos[nCurCamp][i][3])
			AddUnitStates(nNpcIndex,1,90000000)
			AddUnitStates(nNpcIndex,2,99999)
			AddUnitStates(nNpcIndex,3,99999)
			AddUnitStates(nNpcIndex,7,10)
			AddUnitStates(nNpcIndex,8,9999)
			SetNpcLifeTime(nNpcIndex,120)
			SetCampToNpc(nNpcIndex, npcCamp)
			SetNpcDeathScript(nNpcIndex,"\\script\\newbattles\\mainbattle\\npc_death.lua");			
			SetCurrentNpcSFX(nNpcIndex,945,1,1)
		end
		RemoveTrigger(GetTrigger(2509));
	end	
end

-- B�c ��u Truy�n C�ng Thu�t
function activate_transfer_neili(nSkillType)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr�ng th�i hi�n t�i kh�ng th� th�c hi�n truy�n c�ng thu�t.")
		return 0
	end
	local nTeamSize = GetTeamSize();
	local nMapID1, nX1, nY1= GetWorldPos()
	if GetTrigger(2509)~= 0 then
		Talk(1,"","B�n �� k�ch ho�t tr�ng th�i truy�n c�ng!")
		return
	end
	
	local nTaskGetExp = TSK_GET_NEILI_EXP
	local nTaskLoseExp = TSK_GIVE_NEILI_EXP
	local nExpGet = nExpGetNo
	local nExpLose = nExpLoseNo
	local nExpMax = nExpMaxNo
	local nExpLoseMax = nExpLoseMaxNo
	local nPracticeMax = nPracticeMaxNo
	local tb_Practice = tb_Practice_No
	local tb_TASKID_TYPE = tb_TASKID_TYPE_NO
	local nMinRequired = 1
	
	if nSkillType == 2 then
		nTaskGetExp = TSK_GET_NEILI_EXP_SP
		nTaskLoseExp = TSK_GIVE_NEILI_EXP_SP
		nExpGet = nExpGetSp
		nExpLose = nExpLoseSp
		nExpMax = nExpMaxSp
		nExpLoseMax = nExpLoseMaxSp
		nPracticeMax = nPracticeMaxSp
		tb_Practice = tb_Practice_Sp
		tb_TASKID_TYPE = tb_TASKID_TYPE_SP
		nMinRequired = 10
	end
	if nSkillType == 3 then
		nTaskGetExp = 	TSK_GET_DHTN	--TSK_GET_NEILI_EXP_SP
		nTaskLoseExp = TSK_GIVE_DHTN		--TSK_GIVE_NEILI_EXP_SP
		nExpGet = 8900000
		nExpLose = 10000000
		nExpMax = 100000
		nExpLoseMax = 100000
		nMinRequired = 120
	end
	if tb_main_city_truyencong[nMapID1] ~= 1 then
		Talk(1, "", "Ch� c� th� k�ch ho�t truy�n c�ng trong th�t ��i th�nh th�!");
		return
	end
	
--	local nCheckCity = 0
--	for i = 1, getn(tb_main_city) do
--		if nMapID1 == tb_main_city[i] then
--			nCheckCity = 1
--			break
--		end
--	end
--	if nCheckCity == 0 then
--		Talk(1, "", "Ch� c� th� k�ch ho�t truy�n c�ng trong th�t ��i th�nh th�!");
--		return
--	end
	if nTeamSize == 0 or nTeamSize == 1 then	
		Talk(1,"","T� ��i ph�i c� 2 ng��i tr� l�n m�i c� th� k�ch ho�t truy�n c�ng!")
		return
	end
	if nSkillType == 3 then
		if nTeamSize >= 3 then	
			Talk(1,"","T� ��i 2 ng��i m�i c� th� k�ch ho�t Di Hoa Ti�p Ng�c")		
			return
		end	
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t truy�n c�ng!")	
		return
	end
	if GetLevel() < 77 then
		Talk(1,"","��ng c�p 77 tr� l�n m�i c� th� k�ch ho�t truy�n c�ng!")	
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","Gia nh�p m�n ph�i m�i c� th� k�ch ho�t truy�n c�ng!")	
		return	
	end
	if IsStalling() == 1 then
		Talk(1,"","Tr�ng th�i b�y b�n kh�ng th� k�ch ho�t truy�n c�ng!")	
		return
	end
	if GetTask(2508) < nMinRequired then
		Talk(1,"","Th�i gian �y th�c B�ch C�u Ti�n ��n kh�ng �� "..nMinRequired.." ph�t!")	
		return
	end	
	local nDate, nTotal = TransNeiliGetTask(nTaskGetExp)
	if tonumber(date("%m%d")) ~= nDate then
		TransNeiliSetTask(nTaskGetExp,2,tonumber(date("%m%d")))
	end
	nDate, nTotal = TransNeiliGetTask(nTaskGetExp)
	Msg2Player("Gia tri : "..nExpMax)
	if nTotal >= nExpMax then
		Talk(1,"","H�m nay b�n �� nh�n �� s� kinh nghi�m, mai h�y ti�p t�c!")	
		return
	end	
	local nOldIndex = PlayerIndex;
	local nCheck = 1	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);		
		if GetName() ~= GetCaptainName() then
			if GetLevel() < 77 then
				Msg2Player("��ng c�p 77 tr� l�n m�i c� th� tham gia truy�n c�ng!")
				nCheck = 0
				break
			end
			if GetReputation() < 3000 then
				Msg2Player("3000 �i�m danh v�ng tr� l�n m�i c� th� tham gia truy�n c�ng!")
				nCheck = 0
				break
			end
			if CheckSkill() == 0 then
				Msg2Player("Ph�i c� k� n�ng 55 m�i c� th� tham gia truy�n c�ng!")
				nCheck = 0
				break
			end			
			local nMapID2, nX2, nY2 = GetWorldPos()
			if DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) > 8 or DistanceBetweenPoints(nMapID1, nX1, nY1, nMapID2, nX2, nY2) == -1 then
				Msg2Player("Kho�ng c�ch gi�a b�n v� ��i tr��ng qu� xa.")
				nCheck = 0
				break
			end
			if GetTask(2501) < nMinRequired then
				Msg2Player("Th�i gian �y th�c B�ch C�u Ho�n kh�ng �� "..nMinRequired.." ph�t.")
				nCheck = 0
				break
			end
			if GetExp() < nExpLose then					
				Msg2Player("�i�m kinh nghi�m c�a b�n kh�ng ��.")
				nCheck = 0
				break
			end
			if GetTrigger(2509)~= 0 then
				Msg2Player("B�n �� � trong tr�ng th�i truy�n c�ng!")
				nCheck = 0
				break
			end	
			if IsPlayerDeath() == 1 or IsStalling() == 1 then
				Msg2Player("Tr�ng th�i hi�n t�i kh�ng th� th�c hi�n truy�n c�ng thu�t.")
				nCheck = 0
				break
			end
		end
	end
	PlayerIndex = nOldIndex
	if nCheck <= 0 then
		Talk(1,"","Trong t� ��i c� ng��i kh�ng �� �i�u ki�n truy�n c�ng!")	
		return
	end	
	for i = 1, nTeamSize do
		PlayerTeamIdx = GetTeamMember(i);
		SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
		SetTaskTemp(TSK_TMP_NEILI_TYPE_SP, nSkillType)
		if PlayerIndex ~= PlayerIdx then
			SetPlayerScript(CALL_BACK_FILE,PlayerTeamIdx)			
			Say2SomeOne(PlayerTeamIdx,"��i tr��ng k�ch ho�t <color=yellow>B�c ��u Truy�n C�ng Thu�t<color>, b�n x�c nh�n mu�n tham gia?",2,"��ng �!/#confirm_trans_neili("..nSkillType..")","Ta kh�ng mu�n/nothing")
		end
	end
	CreateTrigger(1, 1107, 2509);
    	ContinueTimer(GetTrigger(2509));
    	local szLogTitle = "Bac Dau Truyen Cong Thuat"
	if nSkillType == 2 then
		szLogTitle = szLogTitle.." Dac Biet"
	end
    	WriteLogEx(szLogTitle,"k�ch ho�t th�nh c�ng",nTeamSize,"ng��i")
    	Say("B�n �� k�ch ho�t B�c ��u Truy�n C�ng Thu�t th�nh c�ng! N�u th�nh vi�n trong ��i ��ng �, 15 gi�y sau b�t ��u c� hi�u l�c.",0)    	
end

-- B�c ��u D��ng Sinh Thu�t
function confirm_active_pratice(nType,nSkillType,nSelect)
	if nType <= 0 or nSelect <= 0 then
		return
	end
	
	local nExpGet = nExpGetNo
	local nExpLose = nExpLoseNo
	local nExpMax = nExpMaxNo
	local nExpLoseMax = nExpLoseMaxNo
	local nPracticeMax = nPracticeMaxNo
	local tb_Practice = tb_Practice_No
	local tb_TASKID_TYPE = tb_TASKID_TYPE_NO
	local nMinRequired = 4
	
	if nSkillType == 2 then
		tb_Practice = tb_Practice_Sp
		tb_TASKID_TYPE = tb_TASKID_TYPE_SP
		nExpGet = nExpGetSp
		nExpLose = nExpLoseSp
		nExpMax = nExpMaxSp
		nExpLoseMax = nExpLoseMaxSp
		nPracticeMax = nPracticeMaxSp
		nMinRequired = 10
	end
	
	local nTeamSize = GetTeamSize();
	local nMapID1, nX1, nY1= GetWorldPos()
	if nType > 1 then
		if nTeamSize < nType then	
			Talk(1,"","T� ��i ph�i c� "..nType.." ng��i m�i c� th� k�ch ho�t luy�n c�ng!")
			return
		end
--		if GetName() ~= GetCaptainName() then
--			Talk(1,"","Ch� c� ��i tr��ng m�i c� th� k�ch ho�t luy�n c�ng!")	
--			return
--		end
	end
	if nType > 2 then
		local nOldIndex = PlayerIndex;
		local nCheck = 0	
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i);
			if gf_GetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT) >= 1 then
				nCheck = 1
				break
			end			
		end
		PlayerIndex = nOldIndex	
		if nCheck == 0 then			
			Talk(1,"","T� ��i ph�i c� ng��i chuy�n sinh l�n 1 m�i c� th� k�ch ho�t luy�n c�ng!")
			return			
		end
	end
	if GetTrigger(2509)~= 0 then
		Talk(1,"","B�n �� k�ch ho�t tr�ng th�i luy�n c�ng!")
		return
	end		
	local nCheckCity = 0
	for i = 1, getn(tb_main_city_2) do
		if nMapID1 == tb_main_city_2[i] then
			nCheckCity = 1
			break
		end
	end
	if nCheckCity == 0 then
		Talk(1, "", "Ch� c� th� k�ch ho�t luy�n c�ng � Tuy�n Ch�u v� D��ng Ch�u!");
		return
	end		
	if GetLevel() < 77 then
		Talk(1,"","��ng c�p 77 tr� l�n m�i c� th� k�ch ho�t luy�n c�ng!")	
		return
	end
	if GetPlayerRoute() == 0 then
		Talk(1,"","Gia nh�p m�n ph�i m�i c� th� k�ch ho�t luy�n c�ng!")	
		return
	end
	if CheckSkill() == 0 then
		Talk(1,"","Ph�i c� k� n�ng 55 m�i c� th� tham gia luy�n c�ng!")
		return
	end	
	if IsStalling() == 1 then
		Talk(1,"","Tr�ng th�i b�y b�n kh�ng th� k�ch ho�t luy�n c�ng!")	
		return
	end
	local nSmall = GetTask(2501)
	local nMed = GetTask(2507)
	local nBig = GetTask(2508)
	if nSmall < tb_Practice[nSelect][2] or nMed < tb_Practice[nSelect][3] or nBig < tb_Practice[nSelect][4] then	
		Talk(1,"","Th�i gian �y th�c kh�ng �� "..nMinRequired.." ph�t!")	
		return
	end
	local nTaskID = tb_TASKID_TYPE[nType]		
	local nDate, nTotal = PracticeGetTask(nTaskID)
	if tonumber(date("%y%m%d")) ~= nDate then
		PracticeSetTask(nTaskID,2,tonumber(date("%y%m%d")))
	end
	nDate, nTotal = PracticeGetTask(nTaskID)
	if nTotal >= nPracticeMax then
		Talk(1,"","H�m nay b�n �� nh�n �� s� kinh nghi�m c�a t�ng "..nType.."!")	
		return
	end	
	SetTaskTemp(TSK_TMP_TRANS_NEILI, nSelect)
	SetTaskTemp(TSK_TMP_PRACTICE_NEILI, nType)
	SetTaskTemp(TSK_TMP_NEILI_TYPE_SP, nSkillType)
	CreateTrigger(1, 1107, 2509);
  	ContinueTimer(GetTrigger(2509));     	
  	local szLogTitle = "Bac Dau Duong Sinh Thuat"
	if nSkillType == 2 then
		szLogTitle = szLogTitle.." Dac Biet"
	end
  	WriteLogEx(szLogTitle,"k�ch ho�t th�nh c�ng t�ng "..nType.." lo�i h�nh "..nSelect)
  	KichHoatBacDauDuongSinhThuat()
  	Say("B�n �� k�ch ho�t B�c ��u D��ng Sinh Thu�t th�nh c�ng! 15 gi�y sau b�t ��u c� hi�u l�c.",0)
end

function nothing()
	SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
	SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
end

function confirm_trans_neili(nSkillType)
	if GetReputation() < 3000 then
		Talk(1,"","3000 �i�m danh v�ng tr� l�n m�i c� th� tham gia truy�n c�ng!")		
		return
	end
	SetTaskTemp(TSK_TMP_TRANS_NEILI,1)
	SetTaskTemp(TSK_TMP_NEILI_TYPE_SP, nSkillType)
	Talk(1,"","Truy�n c�ng b�t ��u c� hi�u l�c!")
end

function StopTransfer()
	if GetTrigger(2509)~= 0 then	
		RemoveTrigger(GetTrigger(2509));
		local nOldIndex = PlayerIndex;
		local nTeamSize = GetTeamSize();
		if nTeamSize == 0 or nTeamSize == 1 then
			SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
			SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
			SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
			SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
		else
			for i = 1, nTeamSize do
				PlayerIndex = GetTeamMember(i);
				SetTaskTemp(TSK_TMP_TRANS_NEILI,0)
				SetTaskTemp(TSK_TMP_PRACTICE_NEILI,0)
				SetTaskTemp(TSK_TMP_NEILI_TYPE_SP,0)
				SetCurrentNpcSFX(PIdx2NpcIdx(),917,1,1)
			end
			PlayerIndex = nOldIndex		
		end
	end
end

function TransNeiliGetTask(nTaskID)
	return floor(GetTask(nTaskID)/1000000), mod(GetTask(nTaskID),1000000)
end

function TransNeiliSetTask(nTaskID,nType,nVal)
	local nTaskVal = GetTask(nTaskID)
	local nDate = floor(GetTask(nTaskID)/1000000)
	local nTotal = mod(GetTask(nTaskID),1000000)
	if nType == 1 then
		nTotal = nTotal + nVal
	elseif nType == 2 then
		nDate = nVal
		nTotal = 0
	end
	SetTask(nTaskID,nDate * 1000000 + nTotal)
end

function PracticeGetTask(nTaskID)
	return floor(GetTask(nTaskID)/1000), mod(GetTask(nTaskID),1000)
end

function PracticeSetTask(nTaskID,nType,nVal)
	local nTaskVal = GetTask(nTaskID)
	local nDate = floor(GetTask(nTaskID)/1000)
	local nTotal = mod(GetTask(nTaskID),1000)
	if nType == 1 then
		nTotal = nTotal + nVal
	elseif nType == 2 then
		nDate = nVal
		nTotal = 0
	end
	SetTask(nTaskID,nDate * 1000 + nTotal)
end


function DistanceBetweenPoints(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
	    local dx = MapX2 - MapX1;
	    local dy = MapY2 - MapY1;
	    local nDist = (dx * dx + dy * dy)^(1/2);
	    return nDist;
    end;
end

function CheckSkill()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 1 then
			return 1
		else
			return 0
		end;
	end;
end;
