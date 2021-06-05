-- ����ְ��

Include("\\script\\online\\zgc_public_fun.lua")

tCityName =
{
	[300] = "Th�nh ��",
	[100] = "Tuy�n Ch�u",
	[350] = "T��ng D��ng",
}

tMapTitleID =
{
	[300] = {51, 4},
	[100] = {51, 8},
	[350] = {51, 12},
}

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	if tMapTitleID[nItemMapID] == nil then
		Talk(1,"","<color=red>S� d�ng script [C�ng th�nh chi�n] b� nhi�m danh b� l�i! Xin h�y b�o l�i cho nh� ph�t h�nh!!<color>")
		return
	end
	local nMapID = GetWorldPos()
	if nItemMapID ~= nMapID then
		Say("Ch� � "..tCityName[nItemMapID].." m�i s� d�ng v�t ph�m n�y ", 0)
		return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
	local szTongName = GetCityWarInfo(nItemMapID, "base")
	if szTongName == nil or szTongName == "" then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
		return
	end
	if nJoinTime <= 604800 then
		Say("��i hi�p kh�ng th� b� nhi�m th�nh danh b�, xin h�y x�c nh�n �� gia nh�p v�o  "..szTongName.." 7 ng�y tr� l�n", 0)
		return
	end
	if Zgc_pub_goods_add_chk(1, 25) == 0 then		-- ����ж�Ҫ����
		return
	end
	local nRet = SetCityWarPlayerDuty(nItemMapID, 2)
	if nRet == -1 then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
	elseif nRet == 1 then
		local nCount = GetCityWarInfo(nItemMapID, "fighter")
		if nCount >= 4 then
			Say("C�c h� kh�ng th� b� nhi�m th�nh danh b�, "..szTongName.."�� c� �� 4 v� danh b� r�i", 0)
		else
			Say("C�c h� kh�ng th� b� nhi�m th�nh danh b�, xin h�y x�c nh�n v�n ch�a ��m nhi�m c�c ch�c v� kh�c", 0)
		end
	elseif nRet == 0 then
		if DelItem(2,1,1205,1) == 1 then
			-- �Ѷ����Ƹ��ɾ����
			local n = BigGetItemCount(2,1,1204)
			if n > 0 then
				BigDelItem(2,1,1204,n)
			end
			
			n = BigGetItemCount(2,1,1205)
			if n > 0 then
				BigDelItem(2,1,1205,n)
			end

			AddItem(2,1,1211,25,1)					-- �ɶ��Ѳ���
			AddTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			SetCurTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			Say("b�n ���c b� nhi�m l� "..tCityName[nItemMapID].." danh b�. \n<color=red>Ch� �:  Danh hi�u danh b� ph�i k�ch ho�t m�i c� ch�c n�ng c�a danh b�.<color>", 0)
			SendTongMessage(GetName().."S� d�ng danh b� ti�n c� th� tr� th�nh danh b�.")
			WriteLog("C�ng th�nh chi�n-Qu�n l�:"..szTongName.."-"..GetName().." tr� th�nh "..tCityName[nItemMapID].."Danh b�")
			SaveNow()
		end
	end
end

function no_say()
end