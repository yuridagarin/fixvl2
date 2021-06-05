-- Function to read/write data into text file
-- Created by Chimc
-- Created date 07/06/2012
-- Last Modify: 2013-10-09
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task_access_code_def.lua")

TSK_CS6_TULINH = 2687
TRANSLIFE_TASK_ID = 1538
TRANSLIFE_BYTE_COUNT = 1

LIB_Award = {
	szLogTitle = "",
	szLogAction = "",
}


---------------------- Award
--tbAwardTemplate = {
-- nCheckExp = 0
--	nFail = 1
--	item = {
--			{gdp = {g1, d1, p1, nCount}, nExpired = 7*24*60*60, nDinhhon = 1, name="item name"} 
--			{gpd = {g2,d2,p2, nCount}},
--	},
--	task = {{TaskID, nValue, szName}, {TaskID, nValue, szName}},
--	nChankhi = 10,
--	nQuancong = 1000,
--	nDanhvong = 10,
--	nExp = 1000000,
--	nSumon = 5,
--	nGold = 1000000,
--	nPetExp = 1200,
--	nPetLinhluc = 400,
--	nBachCau1 = 10,
--	nBachCau2 = 10,
--	nBachCau3 = 10,
--	nTamThanh1 = 10,
--	nTamThanh2 = 10,
--	nTamThanh3 = 10,
--	nLucThan1 = 10,
--	nLucThan2 = 10,
--	nLucThan3 = 10,
--	nTuLinh1 = 10,
--	nTuLinh2 = 10,
--	nTuLinh3 = 10,
--}
function LIB_Award:Award(tbAwardList)
--	local nResult = 0
	-- Award Kinh Nghiem
	if type(tbAwardList["nExp"])=="number" then
		if type(tbAwardList["nCheckExp"]) == "number" and tbAwardList["nCheckExp"] ~= 0  then
			if GetPlayerRebornParam(0) < 1 then
				if  tbAwardList["nExp"] > (2000000000 - GetExp()) then					
					Msg2Player("�i�m kinh nghi�m �� ��t gi�i h�n t�i �a n�n c�c h� kh�ng th� nh�n th�m!!!")
--					return 0
				end
			end
		end
		ModifyExp(tbAwardList["nExp"])
		Msg2Player("�i�m kinh nghi�m t�ng th�m " .. tbAwardList["nExp"] .. ".")
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nExp"], "Kinh nghi�m")
		end
	end
	-- Award Item
	if type(tbAwardList["item"])=="table" then
		local tbItemSet = tbAwardList["item"]
		for i=1,getn(tbItemSet) do
			local tbItem = tbItemSet[i]["gdp"]
			-- Add nhieu item co han su dung hoac co dinh hon
			if type(tbItemSet[i]["nExpired"])=="number" or type(tbItemSet[i]["nDinhhon"])=="number" then
				for j=1,tbItemSet[i]["gdp"][4] do
					local nRet, nItemIdx = 0, 0
					if tbItemSet[i]["gdp"][5] ~= nil then
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1, tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
					else
						nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], 1)
					end
					if nRet == 1 then
						--Talk(1,"","Item name: " .. tbItemSet[i]["name"])
						--Talk(1,"","Log Title: " .. self.szLogTitle)
						-- Set Expired date
						if type(tbItemSet[i]["nExpired"])=="number" then
							SetItemExpireTime(nItemIdx, tbItemSet[i]["nExpired"])
						end
						-- Set dinh hon
						if type(tbItemSet[i]["nDinhhon"])=="number" then
							Msg2Player("Set dinh hon: -- " .. tbItemSet[i]["nDinhhon"])
							if tbItemSet[i]["nDinhhon"] == 7 then
								SetItemSpecialAttr(nItemIdx, "DING7", 1)
							else
								SetItemSpecialAttr(nItemIdx, "DING10", 1)
							end
						end
					end
				end
			else
				-- Add nhieu item xep chong
				if tbItemSet[i]["gdp"][5] ~= nil then
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4], tbItem[5], tbItem[6], tbItem[7], tbItem[8], tbItem[9], tbItem[10], tbItem[11], tbItem[12], tbItem[13], tbItem[14]);
				else
					nRet, nItemIdx = AddItem(tbItem[1], tbItem[2], tbItem[3], tbItem[4])
				end
			end
			-- WriteLog
			if self.szLogTitle ~= "" then
				if tbItemSet[i]["name"] == nil then
					local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
					gf_WriteLogEx(self.szLogTitle, self.szLogAction, 1, szItemName)
					Msg2Player("B�n nh�n ���c " .. tbItemSet[i]["gdp"][4] .. " " .. szItemName .. ".")
				else
					gf_WriteLogEx(self.szLogTitle, self.szLogAction, 1, tbItemSet[i]["name"])
					Msg2Player("B�n nh�n ���c " .. tbItemSet[i]["gdp"][4] .. " " .. tbItemSet[i]["name"] .. ".")
				end
			end
		end
	end
-- Award Task
	if type(tbAwardList["task"])=="table" then
		local tbTaskSet = tbAwardList["task"]
		for i=1,getn(tbTaskSet) do
			SetTask(tbTaskSet[i][1], GetTask(tbTaskSet[i][1]) + tbTaskSet[i][2])
			if type(tbTaskSet[i][3]) == "string" then
				Msg2Player(tbTaskSet[i][3] .. " t�ng th�m " .. tbTaskSet[i][2] .. ".")
			end
			if self.szLogTitle ~= "" then
				gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbTaskSet[i][2], "Task " .. tbTaskSet[i][1])
			end
		end
	end
-- Award Chan Khi
	if type(tbAwardList["nChankhi"])=="number" then
		if MeridianGetLevel()>0 then
			local nRet = AwardGenuineQi(tbAwardList["nChankhi"])
			if self.szLogTitle ~= "" and nRet == 1 then
				gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nChankhi"], "Ch�n kh�")
			end
		end
	end
-- Award Quan Cong
	if type(tbAwardList["nQuancong"])=="number" then
		if GetTask(701) ~= 0 then
			if GetTask(701) > 0 then
				SetTask(701, GetTask(701) + tbAwardList["nQuancong"])
			elseif GetTask(701) < 0 then
				SetTask(701, GetTask(701) - tbAwardList["nQuancong"])
			end
			Msg2Player("�i�m c�ng tr�ng t�ng th�m " .. tbAwardList["nQuancong"] .. ".")
			if self.szLogTitle ~= "" then
				gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nQuancong"], "Qu�n c�ng")
			end
		end
	end
-- Award Danh Vong
	if type(tbAwardList["nDanhvong"])=="number" then
		ModifyReputation(tbAwardList["nDanhvong"], 0)
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nDanhvong"], "Danh v�ng")
		end
	end
-- Award Su Mon
	if type(tbAwardList["nSumon"])=="number" then
		SetTask(336, GetTask(336) + tbAwardList["nSumon"])
		Msg2Player("�i�m s� m�n t�ng th�m " .. tbAwardList["nSumon"] .. ".")
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nSumon"], "S� m�n")
		end
	end
-- Award Gold
	if type(tbAwardList["nGold"])=="number" then
		Earn(tbAwardList["nGold"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nGold"], "Ng�n l��ng")
		end
	end
-- Award Exp Pet
	if type(tbAwardList["nPetExp"])=="number" then
		if mod(GetTask(TASK_VNG_PET), 100) >= 1 then
			SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (tbAwardList["nPetExp"] * 100))
			Msg2Player("�i�m n�ng c�p b�n ��ng h�nh t�ng th�m "..tbAwardList["nPetExp"])
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nPetExp"], "�i�m n�ng c�p pet")
		end
	end
-- Award Linh luc Pet
	if type(tbAwardList["nPetLinhluc"])=="number" then
		if mod(GetTask(TASK_VNG_PET), 100) >= 2 then
			-- �i�m n�ng c�p, �i�m luy�n, v�ng, th�i d�ch, �i�m linh l�c c�n, �i�m linh l�c t�i �a, s� l�n luy�n linh l�c 1 ng�y
			tRequireElement = 	{
				[1] = {0, 7000, 1000000, 10, 0, 0,0},
				[2] = {300, 7000, 1000000, 20, 0, 200, 5},
				[3] = {600, 7000, 1000000, 30, 200, 600, 5},
				[4] = {1200, 7000, 1000000, 40, 600, 1500, 5},
			}
			if IsPlayerDeath() ~= 1 then
				local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
				local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
				local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
				if nCurGodPoint + tbAwardList["nPetLinhluc"] <= tRequireElement[nCurLevel][6] then
					nCurGodPoint = nCurGodPoint +tbAwardList["nPetLinhluc"]
					SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
					Msg2Player("�i�m linh l�c pet t�ng th�m "..tbAwardList["nPetLinhluc"])
					gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nPetLinhluc"], "�i�m linh l�c pet")
				else
					nCurGodPoint = tRequireElement[nCurLevel][6]
					SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
					Msg2Player("B�n ��ng H�nh �� ��t ���c �i�m Linh L�c t�i �a c�a c�p, kh�ng th� t�ng th�m.")
				end
			end
		end
	end
-- Award Bach Cau
	if type(tbAwardList["nBachCau1"])=="number" then
		SetTask(2501, GetTask(2501) + tbAwardList["nBachCau1"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau1"], "B�ch C�u Ho�n")
		end
	end
	if type(tbAwardList["nBachCau2"])=="number" then
		SetTask(2507, GetTask(2507) + tbAwardList["nBachCau2"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau2"], "��i B�ch C�u Ho�n")
		end
	end
	if type(tbAwardList["nBachCau3"])=="number" then
		SetTask(2508, GetTask(2508) + tbAwardList["nBachCau3"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nBachCau3"], "B�ch C�u Ti�n ��n")
		end
	end
-- Award Tam Thanh
	if type(tbAwardList["nTamThanh1"])=="number" then
		EatSanqin(1,tbAwardList["nTamThanh1"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh1"], "Tam Thanh Ho�n")
		end
	end
	if type(tbAwardList["nTamThanh2"])=="number" then
		EatSanqin(2,tbAwardList["nTamThanh2"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh2"], "��i Tam Thanh Ho�n")
		end
	end
	if type(tbAwardList["nTamThanh3"])=="number" then
		EatSanqin(3,tbAwardList["nTamThanh3"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTamThanh3"], "Tam Thanh Ti�n ��n")
		end
	end
-- Award Luc Than
	if type(tbAwardList["nLucThan1"])=="number" then
		EatLiushen(1,tbAwardList["nLucThan1"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan1"], "L�c Th�n Ho�n")
		end
	end
	if type(tbAwardList["nLucThan2"])=="number" then
		EatLiushen(2,tbAwardList["nLucThan2"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan2"], "��i L�c Th�n Ho�n")
		end
	end
	if type(tbAwardList["nLucThan3"])=="number" then
		EatLiushen(3,tbAwardList["nLucThan3"])
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nLucThan3"], "L�c Th�n Ti�n ��n")
		end
	end
-- Award Tu Linh
	if type(tbAwardList["nTuLinh1"])=="number" then
		SetTask(3105, GetTask(3105) + tbAwardList["nTuLinh1"],TASK_ACCESS_CODE_OFFLINELIVE)
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh1"], "T� Linh Ho�n")
		end
	end
	if type(tbAwardList["nTuLinh2"])=="number" then
		SetTask(3106, GetTask(3106) + tbAwardList["nTuLinh2"],TASK_ACCESS_CODE_OFFLINELIVE)
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh2"], "��i T� Linh Ho�n")
		end
	end
	if type(tbAwardList["nTuLinh3"])=="number" then
		SetTask(3107, GetTask(3107) + tbAwardList["nTuLinh3"],TASK_ACCESS_CODE_OFFLINELIVE)
		if self.szLogTitle ~= "" then
			gf_WriteLogEx(self.szLogTitle, self.szLogAction, tbAwardList["nTuLinh3"], "T� Linh Ti�n ��n")
		end
	end
-- Award Function
	if type(tbAwardList["fn"])=="string" then
		dostring(tbAwardList["fn"])
	end
	return 1
end


function LIB_Award:Punish(tbPunishList)
	-- Punish Item
	if type(tbPunishList["item"])=="table" then
		local tbItemSet = tbPunishList["item"]
		for i=1,getn(tbItemSet) do
			DelItem(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3], tbItemSet[i]["gdp"][4])
			Msg2Player("B�n b� m�t " .. tbItemSet[i]["gdp"][4] .. " " .. tbItemSet[i]["name"])
			gf_WriteLogEx(self.szLogTitle.." FAIL", "m�t", tbItemSet[i]["gdp"][4], tbItemSet[i]["name"])
		end
	end
	return 1
end

-------------------- Award by rate
--	tbTemplate = {
--							[1] = {[1] = {Set1}, nRate = 50},
--							[2] = {[1] = {Set2}, nRate = 50},
--						}
function LIB_Award:AwardByRate(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nRateTotal = 10000000
	local nRandom = random(1, nRateTotal)
	local nStep=0
	for i=1, getn(tbItemSet) do
		nStep = nStep + floor(tbItemSet[i]["nRate"] * nRateTotal/100);
		if(nRandom <= nStep) then
			return self:Award(tbItemSet[i][1])
		end
	end
end


function LIB_Award:AwardByBody(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nBody = GetBody()
	return self:Award(tbItemSet[nBody])
end


function LIB_Award:AwardByRoute(tbItemSet)
	if tbItemSet == nil then
		return 0
	end
	local nRoute = GetPlayerRoute()
	return self:Award(tbItemSet[nRoute])
end


--	tbTemplate = {
--							[1] = {[1] = {Set1}, nRate=50},
--							[2] = {[1] = {Set2}, nRate=50},
--						}
function LIB_Award:GetValueByRate(tbValue)
	if tbValue == nil then
		return 0
	end
	local nRateTotal = 10000000
	local nRandom = random(1, nRateTotal)
	local nStep=0
	for i=1, getn(tbValue) do
		nStep = nStep + floor(tbValue[i]["nRate"] * nRateTotal/100);
		if(nRandom <= nStep) then
			return tbValue[i][1]
		end
	end
end


function Pet_AddGP(nPoint)
	if IsPlayerDeath() == 1 then
		return
	end
	local nCurGodPoint = floor(GetTask(TASK_VNG_PET_GODPOINT)/100)
	local nQuestGPCount = mod(GetTask(TASK_VNG_PET_GODPOINT),100)
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	if nCurGodPoint + nPoint <= tRequireElement[nCurLevel][6] then
		nCurGodPoint = nCurGodPoint +nPoint
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
	else
		nCurGodPoint = tRequireElement[nCurLevel][6]
		SetTask(TASK_VNG_PET_GODPOINT,nCurGodPoint*100 + nQuestGPCount)
		Msg2Player("B�n ��ng H�nh �� ��t ���c �i�m Linh L�c t�i �a c�a c�p, kh�ng th� t�ng th�m.")
	end
end


--------------------- Award
--tbAwardTemplate = {
-- nCheckExp = 0
--	nFail = 1
--	item = {
--			{gdp = {g1, d1, p1, nCount}, nExpired = 7*24*60*60, nDinhhon = 1, name="item name"} 
--			{gpd = {g2,d2,p2, nCount}},
--	},
--	task = {{TaskID, nValue}, {TaskID, nValue}},
--	nChankhi = 10,
--	nQuancong = 1000,
--	nDanhvong = 10,
--	nExp = 1000000,
--	nSumon = 5,
--	nGold = 1000000,
--	nBachCau1 = 10,
--	nBachCau2 = 10,
--	nBachCau3 = 10,
--	nTamThanh1 = 10,
--	nTamThanh2 = 10,
--	nTamThanh3 = 10,
--	nLucThan1 = 10,
--	nLucThan2 = 10,
--	nLucThan3 = 10,
--	nTuLinh1 = 10,
--	nTuLinh2 = 10,
--	nTuLinh3 = 10,
--}
function LIB_Award:CheckMaterial(tbMaterialList, nOption)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	-- Check Kinh Nghiem
	if type(tbMaterialList["nExp"])=="number" then
		if GetExp() <  tbMaterialList["nExp"] then
			if nOption ~= 0 then
				Talk(1,"", "C�c h� kh�ng �� <color=yellow>"..tbMaterialList["nExp"].." �i�m kinh nghi�m<color>. H�y c� g�ng th�m.")
			end
			return 0
		end
	end
	-- Check Item
	if type(tbMaterialList["item"])=="table" then
		local tbItemSet = tbMaterialList["item"]
		for i=1,getn(tbItemSet) do
			if GetItemCount(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3]) < tbItemSet[i]["gdp"][4] then
				local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
				if nOption ~= 0 then
					Talk(1,"","C�c h� kh�ng �em �� <color=yellow>"..tbItemSet[i]["gdp"][4].." "..szItemName.."<color>. H�y chu�n b� th�m nh�.")
				end
				return 0
			end
		end
	end
-- Check Task
	if type(tbMaterialList["task"])=="table" then
		local tbTaskSet = tbMaterialList["task"]
		for i=1,getn(tbTaskSet) do
			if GetTask(tbTaskSet[i][1]) < tbTaskSet[i][2] then
				if nOption ~= 0 then
					Talk(1,"","C�c h� kh�ng �� <color=yellow>"..tbTaskSet[i][2].." "..tbTaskSet[i][3].."<color>, h�y ki�m tra l�i.")
				end
				return 0
			end
		end
	end
-- Check Quan Cong
	if type(tbMaterialList["nQuancong"])=="number" then
		if abs(GetTask(701)) < tbMaterialList["nQuancong"] then
			if nOption ~= 0 then
				Talk(1,"","<color=yellow>C�ng tr�ng<color> c�c h� kh�ng �� <color=yellow>"..tbMaterialList["nQuancong"].."<color>, h�y c� g�ng th�m.")
			end
			return 0
		end
	end
-- Check Danh Vong
	if type(tbMaterialList["nDanhvong"])=="number" then
		if GetReputation() < tbMaterialList["nDanhvong"] then
			if nOption ~= 0 then
				Talk(1,"","<color=yellow>Danh v�ng<color> c�c h� kh�ng �� <color=yellow>"..tbMaterialList["nDanhvong"].."<color>, h�y c� g�ng th�m.")
			end
			return 0
		end
	end
-- Check Su Mon
	if type(tbMaterialList["nSumon"])=="number" then
		if GetTask(336) < tbMaterialList["nSumon"] then
			if nOption ~= 0 then
				Talk(1,"","<color=yellow>Danh v�ng s� m�n<color> c�c h� kh�ng �� <color=yellow>"..tbMaterialList["nSumon"].."<color>, h�y c� g�ng th�m.")
			end
			return 0
		end
	end
-- Check Gold
	if type(tbMaterialList["nGold"])=="number" then
		if GetCash() < tbMaterialList["nGold"] then
			if nOption ~= 0 then
				Talk(1,"","C�c h� kh�ng �em �� <color=yellow> v�ng<color>, h�y chu�n b� th�m.")
			end
			return 0
		end
	end
-- Check Bach Cau
	if type(tbMaterialList["nBachCau1"])=="number" then
		if GetTask(2501) < tbMaterialList["nBachCau1"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>B�ch C�u Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nBachCau1"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nBachCau2"])=="number" then
		if GetTask(2507) < tbMaterialList["nBachCau2"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>��i B�ch C�u Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nBachCau2"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nBachCau3"])=="number" then
		if GetTask(2508) < tbMaterialList["nBachCau3"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>B�ch C�u Ti�n ��n<color> kh�ng �� <color=yellow>"..tbMaterialList["nBachCau3"].."<color> ph�t.")
			end
			return 0
		end
	end
-- Check Tam Thanh
	if type(tbMaterialList["nTamThanh1"])=="number" then
		if EatSanqin(1,0) < tbMaterialList["nTamThanh1"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>Tam Thanh Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nTamThanh1"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nTamThanh2"])=="number" then
		if EatSanqin(2,0) < tbMaterialList["nTamThanh2"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>��i Tam Thanh Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nTamThanh2"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nTamThanh3"])=="number" then
		if EatSanqin(3,0) < tbMaterialList["nTamThanh3"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>Tam Thanh Ti�n ��n<color> kh�ng �� <color=yellow>"..tbMaterialList["nTamThanh3"].."<color> ph�t.")
			end
			return 0
		end
	end
-- Check Luc Than
	if type(tbMaterialList["nLucThan1"])=="number" then
		if EatLiushen(1,0) < tbMaterialList["nLucThan1"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>L�c Th�n Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nLucThan1"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nLucThan2"])=="number" then
		if EatLiushen(2,0) < tbMaterialList["nLucThan2"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>��i L�c Th�n Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nLucThan2"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nLucThan3"])=="number" then
		if EatLiushen(3,0) < tbMaterialList["nLucThan3"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>L�c Th�n Ti�n ��n<color> kh�ng �� <color=yellow>"..tbMaterialList["nLucThan3"].."<color> ph�t.")
			end
			return 0
		end
	end
-- Check Tu Linh
	if type(tbMaterialList["nTuLinh1"])=="number" then
		if GetTask(3105) < tbMaterialList["nTuLinh1"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>T� Linh Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nTuLinh1"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nTuLinh2"])=="number" then
		if GetTask(3106) < tbMaterialList["nTuLinh2"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>��i T� Linh Ho�n<color> kh�ng �� <color=yellow>"..tbMaterialList["nTuLinh2"].."<color> ph�t.")
			end
			return 0
		end
	end
	if type(tbMaterialList["nTuLinh3"])=="number" then
		if GetTask(3107) < tbMaterialList["nTuLinh3"] then
			if nOption ~= 0 then
				Talk(1,"","Th�i gian �y th�c <color=yellow>T� Linh Ti�n ��n<color> kh�ng �� <color=yellow>"..tbMaterialList["nTuLinh3"].."<color> ph�t.")
			end
			return 0
		end
	end
	return 1
end


function LIB_Award:PayMaterial(tbMaterialList)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		return 0
	end
	-- Pay Kinh Nghiem
	if type(tbMaterialList["nExp"])=="number" then
		ModifyExp(-tbMaterialList["nExp"])
		Msg2Player("Ti�u hao "..tbMaterialList["nExp"].." �i�m kinh nghi�m.")
	end
	-- Pay Item
	if type(tbMaterialList["item"])=="table" then
		local tbItemSet = tbMaterialList["item"]
		for i=1,getn(tbItemSet) do
			local szItemName = GetItemName(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3])
			DelItem(tbItemSet[i]["gdp"][1], tbItemSet[i]["gdp"][2], tbItemSet[i]["gdp"][3], tbItemSet[i]["gdp"][4])
			Msg2Player("B�n m�t " .. tbItemSet[i]["gdp"][4] .. " " .. szItemName)
		end
	end
-- Pay Task
	if type(tbMaterialList["task"])=="table" then
		local tbTaskSet = tbMaterialList["task"]
		for i=1,getn(tbTaskSet) do
			SetTask(tbTaskSet[i][1], GetTask(tbTaskSet[i][1]) - tbTaskSet[i][2])
			Msg2Player("Ti�u hao "..tbTaskSet[i][2].." "..tbTaskSet[i][3])
		end
	end
-- Pay Quan Cong
	if type(tbMaterialList["nQuancong"])=="number" then
		if GetTask(701) > 0 then
			SetTask(701, GetTask(701) - tbMaterialList["nQuancong"])
			Msg2Player("Ti�u hao "..tbMaterialList["nQuancong"].." �i�m qu�n c�ng.")
		elseif GetTask(701) < 0 then
			SetTask(701, GetTask(701) + tbMaterialList["nQuancong"])
			Msg2Player("Ti�u hao "..tbMaterialList["nQuancong"].." �i�m qu�n c�ng.")
		end
	end
-- Pay Danh Vong
	if type(tbMaterialList["nDanhvong"])=="number" then
		ModifyReputation(-tbMaterialList["nDanhvong"], 0)
	end
-- Pay Su Mon
	if type(tbMaterialList["nSumon"])=="number" then
		SetTask(336, GetTask(336) - tbMaterialList["nSumon"])
		Msg2Player("Ti�u hao "..tbMaterialList["nSumon"].." �i�m danh v�ng s� m�n.")
	end
-- Pay Gold
	if type(tbMaterialList["nGold"])=="number" then
		Pay(tbMaterialList["nGold"])
	end
-- Check Bach Cau
	if type(tbMaterialList["nBachCau1"])=="number" then
		SetTask(2501, GetTask(2501) - tbMaterialList["nBachCau1"])
		Msg2Player("Ti�u hao "..tbMaterialList["nBachCau1"].." ph�t B�ch C�u Ho�n.")
	end
	if type(tbMaterialList["nBachCau2"])=="number" then
		SetTask(2507, GetTask(2507) - tbMaterialList["nBachCau2"])
		Msg2Player("Ti�u hao "..tbMaterialList["nBachCau2"].." ph�t ��i B�ch C�u Ho�n.")
	end
	if type(tbMaterialList["nBachCau3"])=="number" then
		SetTask(2508, GetTask(2508) - tbMaterialList["nBachCau3"])
		Msg2Player("Ti�u hao "..tbMaterialList["nBachCau3"].." ph�t B�ch C�u Ti�n ��n.")
	end
-- Pay Tam Thanh
	if type(tbMaterialList["nTamThanh1"])=="number" then
		EatSanqin(1,-tbMaterialList["nTamThanh1"])
		Msg2Player("Ti�u hao "..tbMaterialList["nTamThanh1"].." ph�t Tam Thanh Ho�n.")
	end
	if type(tbMaterialList["nTamThanh2"])=="number" then
		EatSanqin(2,-tbMaterialList["nTamThanh2"])
		Msg2Player("Ti�u hao "..tbMaterialList["nTamThanh2"].." ph�t ��i Tam Thanh Ho�n.")
	end
	if type(tbMaterialList["nTamThanh3"])=="number" then
		EatSanqin(3,-tbMaterialList["nTamThanh3"])
		Msg2Player("Ti�u hao "..tbMaterialList["nTamThanh3"].." ph�t Tam Thanh Ti�n ��n.")
	end
-- Pay Luc Than
	if type(tbMaterialList["nLucThan1"])=="number" then
		EatLiushen(1,-tbMaterialList["nLucThan1"])
		Msg2Player("Ti�u hao "..tbMaterialList["nLucThan1"].." ph�t L�c Th�n Ho�n.")
	end
	if type(tbMaterialList["nLucThan2"])=="number" then
		EatLiushen(2,-tbMaterialList["nLucThan2"])
		Msg2Player("Ti�u hao "..tbMaterialList["nLucThan2"].." ph�t ��i L�c Th�n Ho�n.")
	end
	if type(tbMaterialList["nLucThan3"])=="number" then
		EatLiushen(3,-tbMaterialList["nLucThan3"])
		Msg2Player("Ti�u hao "..tbMaterialList["nLucThan3"].." ph�t L�c Th�n Ti�n ��n.")
	end
-- Pay Tu Linh
	if type(tbMaterialList["nTuLinh1"])=="number" then
		SetTask(3105, GetTask(3105) - tbMaterialList["nTuLinh1"])
		Msg2Player("Ti�u hao "..tbMaterialList["nTuLinh1"].." ph�t T� Linh Ho�n.")
	end
	if type(tbMaterialList["nTuLinh2"])=="number" then
		SetTask(3106, GetTask(3106) - tbMaterialList["nTuLinh2"])
		Msg2Player("Ti�u hao "..tbMaterialList["nTuLinh2"].." ph�t ��i T� Linh Ho�n.")
	end
	if type(tbMaterialList["nTuLinh3"])=="number" then
		SetTask(3107, GetTask(3107) - tbMaterialList["nTuLinh3"])
		Msg2Player("Ti�u hao "..tbMaterialList["nTuLinh3"].." ph�t T� Linh Ti�n ��n.")
	end
	return 1
end
