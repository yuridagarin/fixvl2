Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");

BHTA4_LOG_TITLE = "Bang Hoi Tinh Anh 4"

bhta4 =
{
	fileName = "data/bhta4.txt",
	count = 0,
	listFormat = "(.+)	(.+)",
	tList = {},
}

if strlower(strsub(getenv("os") or "",1,3)) == 'win' then
	bhta4.fileName = "data\\bhta4.txt"
else
	bhta4.fileName = "data/bhta4.txt"
end

function bhta4:load()
	local pf = openfile(self.fileName, "r")
	if not pf then 
		bhta4:save()
		return
	end
	
	local str =""	
	self.count  = 0
	self.tList = {}
	while 1 do
		str = read(pf, "*l")
		if not str then break end
		local _,_,szTongName, nVoted = strfind(str, self.listFormat)
		self.count = self.count + 1
		self.tList[self.count] = {tostring(szTongName), tonumber(nVoted)}
	end

	closefile(pf);
end

function bhta4:save()
	local pf = openfile(self.fileName, "w")
	if not pf then return end

	for i = 1, getn(self.tList) do
		write(pf, format("%s	%d\n", self.tList[i][1], self.tList[i][2]))
	end
	closefile(pf);
end

function bhta4:register()
	self:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	tinsert(self.tList, {GetTongName(), 0})
	self:save()
	gf_WriteLogEx(BHTA4_LOG_TITLE, szNation.." - bang h�i "..GetTongName().." ��ng k� th�nh c�ng")
	Talk(1,"","C�c h� �� ��ng k� thi ��u th�nh c�ng cho bang h�i "..GetTongName())
	Msg2Player("��ng k� thi ��u th�nh c�ng cho bang h�i "..GetTongName())
	AddGlobalNews("Ch�c m�ng ��i hi�p <color=yellow>"..GetName().."<color> �� b�o danh <color=yellow>Bang H�i Tinh Anh l�n 4<color> th�nh c�ng.")
end

function bhta4:vote(nID, nQuantity, nType)
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local szTongName = self.tList[nID][1]
	self.tList[nID] = {szTongName, nQuantity}
	
	self:save()
	if nType == 1 then
		gf_WriteLogEx(BHTA4_LOG_TITLE, szNation.." - b�nh ch�n Hoa H�ng ��", nQuantity, szTongName)
	else
		gf_WriteLogEx(BHTA4_LOG_TITLE, szNation.." - b�nh ch�n Hoa H�ng Ph�n", nQuantity, szTongName)
	end
	Talk(1,"","C�c h� �� b�nh ch�n "..nQuantity.." �i�m Hoa H�ng cho bang h�i "..szTongName)
	Msg2Player("B�nh ch�n "..nQuantity.." �i�m Hoa H�ng cho bang h�i "..szTongName)
end

function show_list()
	bhta4:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	local tSay = {}
	local szHeader = "<color=green>Long H� S�<color>: ��y l� k�t qu� b�nh ch�n t�nh ��n th�i �i�m hi�n t�i c�a "..szNation..":"
	for i = 1, getn(bhta4.tList) do
		tinsert(tSay, bhta4.tList[i][1].." ("..bhta4.tList[i][2].." �i�m Hoa H�ng)/do_nothing")
	end
	
	Say(szHeader, getn(tSay), tSay)
end

function requirement_check(nType)
	if nType == 1 then
		if IsTongMaster() == 0 then
			Talk(1,"","<color=green>Long H� S�<color>: Ch� c� bang ch� m�i ���c ��ng k�, h�nh nh� c�c h� hi�n t�i ch�a ph�i l� bang ch�.")
			return 0
		end
		if GetTongLevel() < 5 then
			Talk(1,"","<color=green>Long H� S�<color>: Bang h�i c�a c�c h� ch�a �� ��ng c�p �� ��ng k� thi ��u, y�u c�u ph�i c� bang h�i c�p 5 tr� l�n.")
			return 0
		end
		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
			Talk(1,"","<color=green>Long H� S�<color>: C�c h� kh�ng ph�i l� ng��i thu�c b�n qu�c, kh�ng th� ��ng k� thi ��u.")
			return 0
		end
		if IsRegisted() == 1 then
			Talk(1,"","<color=green>Long H� S�<color>: Bang h�i c�a c�c h� �� ��ng k� thi ��u r�i.")
			return 0
		end
		if GetPlayerRoute() == 0 then
			Talk(1,"","<color=green>Long H� S�<color>: C�c h� ph�i gia nh�p m�n ph�i r�i m�i c� th� ��ng k� thi ��u.")
			return 0
		end
		if GetLevel() < 77 then
			Talk(1,"","<color=green>Long H� S�<color>: ��ng c�p 77 tr� l�n m�i ���c ph�p ��ng k� thi ��u.")
			return 0
		end
		if GetItemCount(2, 1, 537) < 48 then
			Talk(1,"","<color=green>Long H� S�<color>: L� ph� ��ng k� thi ��u l� 48 T� Kim H�ng Bao (c� v�ng), c�c h� h�nh nh� ch�a mang �� trong ng��i.")
			return 0
		end
	elseif nType == 2 then
		if gf_GetTaskByte(TSK_SERVER_ID, TSK_SERVER_ID_CUR) ~= GetGlbValue(GLB_TSK_SERVER_ID) then
			Talk(1,"","<color=green>Long H� S�<color>: C�c h� kh�ng ph�i l� ng��i thu�c b�n qu�c, kh�ng th� tham gia b�nh ch�n.")
			return 0
		end
		if GetPlayerRoute() == 0 then
			Talk(1,"","<color=green>Long H� S�<color>: C�c h� ph�i gia nh�p m�n ph�i r�i m�i c� th� tham gia b�nh ch�n.")
			return 0
		end
		if GetLevel() < 77 then
			Talk(1,"","<color=green>Long H� S�<color>: ��ng c�p 77 tr� l�n m�i ���c ph�p tham gia b�nh ch�n.")
			return 0
		end
	end
	return 1
end

function bhta4_register()
	bhta4:load()
	if requirement_check(1) == 0 then
		return
	end
	if DelItem(2, 1, 537, 48) == 1 then
		bhta4:register()
	end
end

function bhta4_vote()
	if requirement_check(2) == 0 then
		return
	end
	bhta4:load()
	local szNation = get_nationality_name(GetGlbValue(GLB_TSK_SERVER_ID))
	if bhta4.count == 0 then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n t�i ch�a c� bang h�i n�o ��ng k� thi ��u t�i "..szNation)
		return
	end
	local tSay = {}
	local szHeader = "<color=green>Long H� S�<color>: C�c h� h�y b�nh ch�n bang h�i m�nh y�u th�ch b�ng c�c lo�i Hoa H�ng. Hoa H�ng d�ng �� b�nh ch�n c� th� ki�m ���c th�ng qua ho�n th�nh nhi�m v� T�i Nguy�n Chi�n, m� T�i H�t Gi�ng, tr�ng c�y B�t Nh� nh� v� s� d�ng N� Oa B�o H�p."
	
	for i = 1, getn(bhta4.tList) do
		tinsert(tSay, format("Ta mu�n b�nh ch�n cho bang h�i %s/#bhta4_choose(%d)", tostring(bhta4.tList[i][1]), tonumber(i)))
	end
	
	tinsert(tSay, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function bhta4_choose(nID)	
	local tSay = {}
	local szHeader = "<color=green>Long H� S�<color>: C�c h� mu�n b�nh ch�n b�ng lo�i hoa h�ng n�o?"
	
	tinsert(tSay, format("D�ng Hoa H�ng ��/#bhta4_confirm_vote(%d, 1)", nID))
	tinsert(tSay, format("D�ng Hoa H�ng Ph�n/#bhta4_confirm_vote(%d, 2)", nID))
	tinsert(tSay, "Ta ch� gh� ngang/do_nothing")
	
	Say(szHeader, getn(tSay), tSay)
end

function bhta4_confirm_vote(nID, nType)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, 0)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, GetTaskTemp(TSK_TMP_BHTA4_VOTE) + nType)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, GetTaskTemp(TSK_TMP_BHTA4_VOTE) + (nID * 10))
	AskClientForNumber("do_vote", 1, 999, "S� Hoa H�ng:")
end

function do_vote(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	bhta4:load()
	local nType = mod(GetTaskTemp(TSK_TMP_BHTA4_VOTE), 10)
	local nID = floor(GetTaskTemp(TSK_TMP_BHTA4_VOTE) / 10)
	SetTaskTemp(TSK_TMP_BHTA4_VOTE, 0)
	if nType == 1 then
		if GetItemCount(2, 0, 1162) < nCount then
			Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang �� Hoa H�ng �� �� tham gia b�nh ch�n.")
			return
		end
		if DelItem(2, 0, 1162, nCount) == 1 then
			nCount = bhta4.tList[nID][2] + nCount
			bhta4:vote(nID, nCount, nType)
		end
	elseif nType == 2 then
		if GetItemCount(2, 0, 1164) < nCount then
			Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang �� Hoa H�ng ph�n �� tham gia b�nh ch�n.")
			return
		end
		if DelItem(2, 0, 1164, nCount) == 1 then
			nCount = bhta4.tList[nID][2] + (nCount * 10)
			bhta4:vote(nID, nCount, nType)
		end
	end
end

function bhta4_exchange_rose()
	AskClientForNumber("bhta4_confirm_exchange_rose", 1, 999, "S� Hoa H�ng Ph�n:")
end

function bhta4_confirm_exchange_rose(nCount)
	if nCount == nil then
		return
	end
	local nQuantity = tonumber(nCount)
	if nQuantity < 1 or nQuantity > 999 then
		Talk(1, "", "S� l��ng nh�p v�o kh�ng h�p l�, xin vui l�ng nh�p l�i!")
		return
	end
	if GetItemCount(2, 0, 1162) < nQuantity * 5 then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang �� Hoa H�ng �� �� ��i.")
		return
	end
	if GetItemCount(2, 1, 30230) < nQuantity * 2 then
		Talk(1,"","<color=green>Long H� S�<color>: Hi�n c�c h� kh�ng mang ��  Xu �� ��i.")
		return
	end
	if DelItem(2, 0, 1162, nQuantity * 5) == 1 and DelItem(2, 1, 30230, nQuantity * 2) == 1 then
		gf_AddItemEx2({2, 0, 1164, nQuantity}, "Hoa H�ng ph�n", BHTA4_LOG_TITLE, "��i hoa h�ng")
	end
end

function IsRegisted()
	bhta4:load()
	local szTongName = GetTongName()
	for i = 1, getn(bhta4.tList) do
		if szTongName == bhta4.tList[i][1] then
			return 1
		end
	end
	return 0
end

function do_nothing()

end