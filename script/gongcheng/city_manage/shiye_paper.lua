-- ��ʦְ��

tCityName =
{
	[300] = "Th�nh ��",
	[100] = "Tuy�n Ch�u",
	[350] = "T��ng D��ng",
}

tMapTitleID =
{
	[300] = {51, 3},
	[100] = {51, 7},
	[350] = {51, 11},
}

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	if tMapTitleID[nItemMapID] == nil then
		Talk(1,"","<color=red>S� d�ng script [C�ng th�nh chi�n] b� nhi�m qu�n s� l�i! Xin h�y b�o l�i cho nh� ph�t h�nh!!<color>")
		return
	end
	local nMapID = GetWorldPos()
	if nItemMapID ~= nMapID then
		Say("Ch� � "..tCityName[nItemMapID].." m�i s� d�ng v�t ph�m n�y ", 0)
		return
	end
	local szTongName = GetCityWarInfo(nItemMapID, "base")
	if szTongName == nil or szTongName == "" then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
		return
	end
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 604800 then
		Say("Ng��i kh�ng th� b� nhi�m th�nh qu�n s�, xin h�y x�c nh�n �� gia nh�p  "..szTongName.." 7 ng�y tr� l�n", 0)
		return
	end

	local nRet = SetCityWarPlayerDuty(nItemMapID, 1)
	if nRet == -1 then
		Say("Th�nh n�y hi�n ch�a c� bang h�i chi�m l�nh", 0)
	elseif nRet == 1 then
		local nCount = GetCityWarInfo(nItemMapID, "manager")
		if nCount >= 1 then
			Say("Ng��i kh�ng th� b� nhi�m th�nh qu�n s�, xin h�y x�c nh�n �� gia nh�p "..szTongName.."�� t�n t�i 1 v� qu�n s� r�i.", 0)
		else
			Say("��i hi�p kh�ng th� b� nhi�m th�nh qu�n s�, h�y x�c nh�n ch�a ��m nhi�m ch�c v� kh�c", 0)
		end
	elseif nRet == 0 then
		if DelItem(2,1,1204,1) == 1 then
			-- �Ѷ����Ƹ��ɾ����
			local n = BigGetItemCount(2,1,1204)
			if n > 0 then
				BigDelItem(2,1,1204,n)
			end
			
			n = BigGetItemCount(2,1,1205)
			if n > 0 then
				BigDelItem(2,1,1205,n)
			end
			
			AddTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			SetCurTitle(tMapTitleID[nItemMapID][1], tMapTitleID[nItemMapID][2])
			Say("b�n ���c b� nhi�m l� "..tCityName[nItemMapID].."Qu�n s�", 0)
			SetTask(2546, 1);--���þ�ʦ��ȡ�����ı��
			SendTongMessage(GetName().."S� d�ng qu�n s� ti�n c� tr� th�nh qu�n s�.")
			WriteLog("C�ng th�nh chi�n-Qu�n l�:"..szTongName.."-"..GetName().." tr� th�nh "..tCityName[nItemMapID].."Qu�n s�")
			SaveNow()
		end
	end
end

function no_say()
end