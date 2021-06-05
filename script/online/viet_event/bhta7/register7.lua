Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");

BHTA7_LOG_TITLE = "Bang Hoi Tinh Anh 8"
BHTA6_MAX_USE = 2400
BHTA6_MAX_USE_WEEK = 800
BHTA6_RECEIVE_EXP = 250000
MAXEXP = 2000000000

tb_bhta7_weeks =
{
	[1] = 111010,
	[2] = 111017,
	[3] = 111024,
}

bhta7 =
{
	fileName = "data/bhta8.txt",
	count = 0,
	listFormat = "(.+)	(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	bhta7.fileName = "data\\bhta8.txt"
else
	bhta7.fileName = "data/bhta8.txt"
end

function bhta7:load()
	local pf = openfile(self.fileName, "r")
	if not pf then 
		bhta7:save()
		return
	end
	
	local str =""	
	self.count  = 0
	self.tList = {}
	while 1 do
		str = read(pf, "*l")
		if not str then break end
		local _,_,szTongName, nVoted, nTypeMatch = strfind(str, self.listFormat)
		self.count = self.count + 1
		self.tList[self.count] = {tostring(szTongName), tonumber(nVoted), tonumber(nTypeMatch) }
	end

	closefile(pf);
end

function bhta7:save()
	local pf = openfile(self.fileName, "w")
	if not pf then return end

	for i = 1, getn(self.tList) do
		write(pf, format("%s	%d	%d\n", self.tList[i][1], self.tList[i][2], self.tList[i][3]))
		--Msg2Player("Gia tri 3 sau khi luu: "..self.tList[i][3])
	end
	closefile(pf);
end

function bhta7:register(nTypeMatch)
	self:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	tinsert(self.tList, {GetTongName(), 0, nTypeMatch})
--	Msg2Player("loai giai dau: "..nTypeMatch)
	self:save()
	gf_WriteLogEx(BHTA7_LOG_TITLE, szNation.." - bang h�i "..GetTongName().." ��ng k� th�nh c�ng lo�i "..nTypeMatch)
	Talk(1,"","C�c h� �� ��ng k� thi ��u th�nh c�ng cho bang h�i "..GetTongName())
	Msg2Player("��ng k� thi ��u th�nh c�ng cho bang h�i "..GetTongName())
	AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� b�o danh <color=yellow>Bang H�i Tinh Anh l�n 8<color> th�nh c�ng.")
end

function bhta7:vote(nID, nQuantity, nType)
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local szTongName = self.tList[nID][1]
	self.tList[nID] = {szTongName, nQuantity, nType}
	
	self:save()
	if nType == 1 then
		gf_WriteLogEx(BHTA7_LOG_TITLE, szNation.." - b�nh ch�n C� Linh Ng�c", nQuantity, szTongName)
	else
		gf_WriteLogEx(BHTA7_LOG_TITLE, szNation.." - b�nh ch�n C� Linh Th�ch", nQuantity, szTongName)
	end
	Talk(1,"","T�ng �i�m b�nh ch�n c�a bang h�i "..szTongName.." hi�n t�i l�:  "..nQuantity)
	Msg2Player("T�ng �i�m b�nh ch�n c�a bang h�i "..szTongName.." hi�n t�i l�:  "..nQuantity)
end

function show_list7(nTypeMatch)
	bhta7:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local tSaySC = {}
	local tSayCC = {}
	local szHeader = "<color=green>Long H� S�<color>: ��y l� k�t qu� b�nh ch�n t�nh ��n th�i �i�m hi�n t�i c�a "..szNation..":"
	for i = 1, getn(bhta7.tList) do
		if bhta7.tList[i][3] == 1 then
			tinsert(tSaySC, bhta7.tList[i][1].." ("..bhta7.tList[i][2].." �i�m t�ch l�y)/do_nothing")
		else
			tinsert(tSayCC, bhta7.tList[i][1].." ("..bhta7.tList[i][2].." �i�m t�ch l�y)/do_nothing")
		end
	end
	if nTypeMatch == 1 then
		Say(szHeader, getn(tSaySC), tSaySC)
	else
		Say(szHeader, getn(tSayCC), tSayCC)
	end
end
function show_list_regis7(nTypeMatch)
	bhta7:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local tSaySC = {}
	local tSayCC = {}
	local szHeader = "<color=green>Long H� S�<color>: ��y l� danh s�ch ��ng k� t�nh ��n th�i �i�m hi�n t�i c�a "..szNation..":"
	for i = 1, getn(bhta7.tList) do
		if bhta7.tList[i][3] == 1 then
			tinsert(tSaySC, bhta7.tList[i][1].."/do_nothing")
		else
			tinsert(tSayCC, bhta7.tList[i][1].."/do_nothing")
		end
	end
	if nTypeMatch == 1 then
		Say(szHeader, getn(tSaySC), tSaySC)
	else
		Say(szHeader, getn(tSayCC), tSayCC)
	end
end
function requirement_check(nType, nTypeMatch)
	local tbType = {25000, 10000}
	if nType == 1 then
		if IsTongMaster() == 0 then
			Talk(1,"","<color=green>Long H� S�<color>: Ch� c� bang ch� m�i ���c ��ng k�, h�nh nh� c�c h� hi�n t�i ch�a ph�i l� bang ch�.")
			return 0
		end
		if GetTongLevel() < 5 then
			Talk(1,"","<color=green>Long H� S�<color>: Bang h�i c�a c�c h� ch�a �� ��ng c�p �� ��ng k� thi ��u, y�u c�u ph�i c� bang h�i c�p 5 tr� l�n.")
			return 0
		end
--		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
--			Talk(1,"","<color=green>Long H� S�<color>: C�c h� kh�ng ph�i l� ng��i thu�c b�n qu�c, kh�ng th� ��ng k� thi ��u.")
--			return 0
--		end
		if IsRegisted() == 1 then
			Talk(1,"","<color=green>Long H� S�<color>: Bang h�i c�a c�c h� �� ��ng k� thi ��u r�i.")
			return 0
		end
		if GetPlayerRoute() == 0 then
			Talk(1,"","<color=green>Long H� S�<color>: Bang Ch� ph�i gia nh�p m�n ph�i r�i m�i c� th� ��ng k� thi ��u.")
			return 0
		end
		if GetLevel() < 79 then
			Talk(1,"","<color=green>Long H� S�<color>: Bang Ch� ph�i c� ��ng c�p 79 tr� l�n m�i ���c ph�p ��ng k� thi ��u.")
			return 0
		end
--		if GetItemCount(2, 1, 539) < 3 or GetItemCount(2, 1, 30362) < tbType[nTypeMatch] then
--			Talk(1,"","<color=green>Long H� S�<color>: L� ph� ��ng k� thi ��u l� 3 Ho�ng Kim H�ng Bao (c� v�ng) v� "..tbType[nTypeMatch].." Phi Phong Ho�ng Kim, c�c h� h�nh nh� ch�a mang �� trong ng��i.")
--			return 0
--		end

	elseif nType == 2 then
--		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
--			Talk(1,"","<color=green>Long H� S�<color>: C�c h� kh�ng ph�i l� ng��i thu�c b�n qu�c, kh�ng th� tham gia b�nh ch�n.")
--			return 0
--		end
		if GetPlayerRoute() == 0 then
			Talk(1,"","<color=green>Long H� S�<color>: C�c h� ph�i gia nh�p m�n ph�i r�i m�i c� th� tham gia b�nh ch�n.")
			return 0
		end
		if GetLevel() < 79 then
			Talk(1,"","<color=green>Long H� S�<color>: ��ng c�p 79 tr� l�n m�i ���c ph�p tham gia b�nh ch�n.")
			return 0
		end
	end
	return 1
end

function bhta7_register(nTypeMatch)
	bhta7:load()
	local tbType = {25000, 10000}
	if requirement_check(1, nTypeMatch) == 0 then
		return
	end
--	if DelItem(2, 1, 539, 3) == 1 and  DelItem(2, 1, 30362, tbType[nTypeMatch]) == 1 then
		bhta7:register(nTypeMatch)
--	end
end

function bhta7_vote(nTypeMatch)
	if requirement_check(2, 0) == 0 then
		return
	end
	bhta7:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	if bhta7.count == 0 then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n t�i ch�a c� bang h�i n�o ��ng k� thi ��u t�i "..szNation)
		return
	end
--	local tSay = {}
--	local szHeader = "<color=green>Long H� S�<color>: C�c h� h�y b�nh ch�n bang h�i m�nh y�u th�ch b�ng c�c lo�i Hoa H�ng. Hoa H�ng d�ng �� b�nh ch�n c� th� ki�m ���c th�ng qua ho�n th�nh nhi�m v� T�i Nguy�n Chi�n, m� T�i H�t Gi�ng, tr�ng c�y B�t Nh� nh�, nhi�m v� V� L�m S� Gi�, m� r��ng S�t Th� ���ng v� s� d�ng Ng�i Sao May M�n."
	local szHeader = "<color=green>Long H� S�<color>: C�c h� h�y b�nh ch�n bang h�i m�nh y�u th�ch b�ng C� Linh Ng�c ho�c C� Linh Th�ch."	
	local tSaySC = {}
	local tSayCC = {}
	for i = 1, getn(bhta7.tList) do
		if bhta7.tList[i][3] == 1 then
			tinsert(tSaySC, format("Ta mu�n b�nh ch�n cho bang h�i %s/#bhta7_choose(%d)", tostring(bhta7.tList[i][1]), tonumber(i)))
		else
			tinsert(tSayCC, format("Ta mu�n b�nh ch�n cho bang h�i %s/#bhta7_choose(%d)", tostring(bhta7.tList[i][1]), tonumber(i)))
		end
	end
	
	if nTypeMatch == 1 then
		tinsert(tSaySC, "Ta ch� gh� ngang/do_nothing")
		Say(szHeader, getn(tSaySC), tSaySC)
	else
		tinsert(tSayCC, "Ta ch� gh� ngang/do_nothing")
		Say(szHeader, getn(tSayCC), tSayCC)
	end	

end

function bhta7_choose(nID)	
	local tSay = {}
	local szHeader = "<color=green>Long H� S�<color>: C�c h� mu�n b�nh ch�n b�ng C� Linh Ng�c hay C� Linh Th�ch?"
	
	tinsert(tSay, format("D�ng C� Linh Ng�c/#bhta7_confirm_vote(%d, 1)", nID))
	tinsert(tSay, format("D�ng C� Linh Th�ch/#bhta7_confirm_vote(%d, 2)", nID))
	--tinsert(tSay, format("D�ng Phi Phong Ho�ng Kim/#bhta7_confirm_vote(%d)", nID))
--	tinsert(tSay, format("D�ng Hoa H�ng Ph�n/#bhta7_confirm_vote(%d, 1)", nID))
--	tinsert(tSay, format("D�ng Hoa H�ng V�ng/#bhta7_confirm_vote(%d, 2)", nID))
	tinsert(tSay, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function bhta7_confirm_vote(nID, nType)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, 0)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, GetTaskTemp(TSK_TMP_BHTA6_VOTE)+ nType)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, GetTaskTemp(TSK_TMP_BHTA6_VOTE) + (nID * 10))
	AskClientForNumber("do_vote", 1, 999, "S� l��ng Vote")
end

function do_vote(nCount)
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 121021 then
		Talk(1, "", "Th�i h�n b�nh ch�n Bang H�i Tinh Anh 8 �� h�t!")
		return
	end
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	bhta7:load()
	local nType = mod(GetTaskTemp(TSK_TMP_BHTA6_VOTE), 10)
	local nID = floor(GetTaskTemp(TSK_TMP_BHTA6_VOTE) / 10)
	SetTaskTemp(TSK_TMP_BHTA6_VOTE, 0)
	if nType == 1 then
		if GetItemCount(2, 1, 30369) < nCount then
			Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang �� C� Linh Ng�c �� tham gia b�nh ch�n.")
			return
		end
		if MAXEXP - GetExp() < nCount * 2000000 then
			Talk(1,"","<color=green>Long H� S�<color>: �i�m kinh nghi�m sau khi nh�n th��ng qu� nhi�u, ��i hi�p h�y s� d�ng b�t �i�m kinh nghi�m r�i ti�p t�c b�nh ch�n nha")
			return	
		end
		if DelItem(2, 1, 30369, nCount) == 1 then
			ModifyExp(nCount * 2000000)
			nCount = bhta7.tList[nID][2] + (nCount *10)
			nType = bhta7.tList[nID][3]
			bhta7:vote(nID, nCount, nType)
		end
	elseif nType == 2 then
		if GetItemCount(2, 1, 30368) < nCount then
			Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang �� C� Linh Th�ch �� tham gia b�nh ch�n.")
			return
		end
		if MAXEXP - GetExp() < nCount * 100000 then
			Talk(1,"","<color=green>Long H� S�<color>: �i�m kinh nghi�m sau khi nh�n th��ng qu� nhi�u, ��i hi�p h�y s� d�ng b�t �i�m kinh nghi�m r�i ti�p t�c b�nh ch�n nha")
			return	
		end
		if DelItem(2, 1, 30368, nCount) == 1 then
		--	bhta7_get_exp(nCount)
		--	local nWeekUse = mod(GetTask(TSK_BHTA6_2E8), 1000)
		--	if nWeekUse >= BHTA6_MAX_USE_WEEK then
		--		local nWasteCount = floor(GetTask(TSK_BHTA6_2E8) / 10000)
		--		if nWasteCount == 0 then
		--			nCount = bhta7.tList[nID][2] + (nCount * 15)
		--		else
		--			local nRemainCount = nCount - nWasteCount
		--			nCount = bhta7.tList[nID][2] + ((nWasteCount * 15) + (nRemainCount * 10))
		--		end
		--	else
		--			nCount = bhta7.tList[nID][2] + (nCount * 10)
		--	end
			ModifyExp(nCount * 100000)		
			nCount = bhta7.tList[nID][2] + nCount
			nType = bhta7.tList[nID][3]
			bhta7:vote(nID, nCount, nType)

		end
	end
end

-- S� d�ng hoa h�ng v�ng file CNDSK
function UseYellowRose()
	AskClientForNumber("DoVoteYellow", 1, 999, "S� Hoa H�ng V�ng.")
end

--  T�nh n�ng s� d�ng  hoa h�ng v�ng cho bang h�i kh�ng tham gia ��ng k� cu�c chi�n hoa h�ng
function DoVoteYellow(nCount)
	if CheckTongJoinRoseWar() ~= 1 then
		Talk(1,"","Qu�c gia c�a c�c h� kh�ng ���c ��i hoa h�ng v�ng t�i ��y, h�y tham gia b�nh ch�n Bang H�i Tinh Anh 5 � Long H� S�!")
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	if GetItemCount(2, 1, 30255) < nCount then
			Talk(1,""," Hi�n c�c h� kh�ng mang �� ".. nCount .." Hoa H�ng V�ng �� ��i �i�m kinh nghi�m.")
			return
	end
	
	local nYellowUsed = GetTask(TSK_BHTA6_6E8)
	if nYellowUsed >= BHTA6_MAX_USE then
		Msg2Player("C�c h� �� s� d�ng t�i gi�i h�n 600 tri�u �i�m kinh nghi�m!")
		return 
	end
	
	if nYellowUsed + nCount > BHTA6_MAX_USE then
		Msg2Player("C�c h� kh�ng th� nh�n nhi�u h�n 600 tri�u �i�m kinh nghi�m. Xin vui l�ng nh�p s� l��ng nh� h�n!")
		return
	end
	
	if DelItem(2, 1, 30255, nCount) == 1 then
		GetExpOddServer(nCount)
	end
end

function bhta7_exchange_rose()
	AskClientForNumber("bhta7_confirm_exchange_rose", 1, 999, "S� Phi Phong Ho�ng Kim:")
end

function bhta7_confirm_exchange_rose(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	if GetItemCount(2, 1, 30360) < nQuantity * 5 then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang �� V�i l�a cao c�p �� ��i.")
		return
	end
	if GetItemCount(2, 1, 30230) < nQuantity * 2 then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang ��  Xu �� ��i.")
		return
	end
	if DelItem(2, 1, 30360, nQuantity * 5) == 1 and DelItem(2, 1, 30230, nQuantity * 2) == 1 then
		gf_AddItemEx2({2, 1, 30362, nQuantity}, "Phi Phong Ho�ng Kim", BHTA7_LOG_TITLE, "��i phi phong ho�ng kim")
	end
end

function bhta7_exchange_rose2()
	AskClientForNumber("bhta7_confirm_exchange_rose2", 1, 999, "S� Phi Phong Ho�ng Kim:")
end

function bhta7_confirm_exchange_rose2(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	if GetItemCount(2, 1, 30360) < (nQuantity * 5) then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang �� V�i l�a cao c�p �� ��i.")
		return
	end
	if GetItemCount(2, 1, 30361) < nQuantity * 1 then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang ��  Ch� V�ng �� ��i.")
		return
	end
	if DelItem(2, 1, 30360, nQuantity * 5) == 1 and DelItem(2, 1, 30361, nQuantity * 1) == 1 then
		gf_AddItemEx2({2, 1, 30362, nQuantity}, "Phi Phong Ho�ng Kim", BHTA7_LOG_TITLE, "��i phi phong ho�ng kim")
	end
end

function IsRegisted()
	bhta7:load()
	local szTongName = GetTongName()
	for i = 1, getn(bhta7.tList) do
		if szTongName == bhta7.tList[i][1] then
			return 1
		end
	end
	return 0
end

function bhta7_get_exp(nCount)
	local nWasteCount = floor(GetTask(TSK_BHTA6_2E8) / 10000)
	SetTask(TSK_BHTA6_2E8, GetTask(TSK_BHTA6_2E8) - (nWasteCount * 10000))	
	if GetTask(TSK_BHTA6_6E8) >= BHTA6_MAX_USE then
		Msg2Player("B�n �� s� d�ng t�i 600 tri�u �i�m kinh nghi�m")
		return 
	end
	
	local nDate = tonumber(date("%y%m%d"))
	local nWeek = mod(floor(GetTask(TSK_BHTA6_2E8) / 1000), 10)
	local nGetCount = nCount
	
	if nDate < tb_bhta7_weeks[1] then
		if nWeek ~= 1 then
			SetTask(TSK_BHTA6_2E8, 1000)
		end
	elseif nDate < tb_bhta7_weeks[2] then
		if nWeek ~= 2 then
			SetTask(TSK_BHTA6_2E8, 2000)
		end
	elseif nDate < tb_bhta7_weeks[3] then
		if nWeek ~= 3 then
			SetTask(TSK_BHTA6_2E8, 3000)
		end
	end
	
	local nWeekUse = mod(GetTask(TSK_BHTA6_2E8), 1000)
	
	if nWeekUse >= BHTA6_MAX_USE_WEEK then
		Msg2Player("B�n �� s� d�ng t�i 200 tri�u �i�m kinh nghi�m trong tu�n")
		return 
	end
	
	local nExp = BHTA6_RECEIVE_EXP * nCount
	if nExp + (nWeekUse * BHTA6_RECEIVE_EXP) > 200000000 then
		nExp = 200000000 - (nWeekUse * BHTA6_RECEIVE_EXP)
		nGetCount = floor(nExp / BHTA6_RECEIVE_EXP)
		nWasteCount = nCount - nGetCount
	end
	
	-- L�u gi� tr� s� d�ng Hoa H�ng V�ng
	SetTask(TSK_BHTA6_2E8, GetTask(TSK_BHTA6_2E8) + nGetCount)
	SetTask(TSK_BHTA6_6E8, GetTask(TSK_BHTA6_6E8) + nGetCount)
	SetTask(TSK_BHTA6_2E8, GetTask(TSK_BHTA6_2E8) + (nWasteCount * 10000))
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m")
	gf_WriteLogEx(BHTA7_LOG_TITLE, "b�nh ch�n b�ng Hoa H�ng V�ng nh�n ���c "..nExp.." �i�m kinh nghi�m")
end

--  Ki�m tra bang h�i kh�ng tham gia cu�c chi�n hoa h�ng
function CheckTongJoinRoseWar()
	local tbServerBHTA7 =
	{
		22, 23, 24, 55, 60,
	}
	
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nNationality = gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR)
	
	for i = 1, getn( tbServerBHTA7) do
		if nNation ==  tbServerBHTA7[i] and nNationality == tbServerBHTA7[i] then
			return 1
		end
	end
	return 0
end

function GetExpOddServer(nCount)
	local nYellowUsed = GetTask(TSK_BHTA6_6E8)
	local nRemain = BHTA6_MAX_USE - (nYellowUsed + nCount)
	local nExp = BHTA6_RECEIVE_EXP * nCount
	-- L�u gi� tr� s� d�ng Hoa H�ng V�ng
	SetTask(TSK_BHTA6_6E8, GetTask(TSK_BHTA6_6E8) + nCount)
	ModifyExp(nExp)
	Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m. C�n ti�p t�c s� d�ng ���c "..nRemain.." Hoa H�ng V�ng.")
	gf_WriteLogEx(BHTA7_LOG_TITLE, "b�nh ch�n b�ng Hoa H�ng V�ng nh�n ���c "..nExp.." �i�m kinh nghi�m � server kh�ng tham gia")
end

function do_nothing()

end
