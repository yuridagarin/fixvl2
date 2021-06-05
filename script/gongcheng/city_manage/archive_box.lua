-- �ɶ�֮ӡ

tCityName =
{
	[300] = "Th�nh ��",
	[100] = "Tuy�n Ch�u",
	[350] = "T��ng D��ng",
}

function replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end

function OnUse(idx)
	local nItemIdx = tonumber(idx)
	if GetTeamSize() == 0 then
		Say("Tr��c khi s� d�ng Th�nh �� �n xin h�y t� ��i v�i ng��i c�n thao t�c!", 0)
		return
	end
	local nshi = GetItemParam(nItemIdx, 1)
	local nti = GetItemParam(nItemIdx, 2)
	
	Say("B�n mu�n nh�n ch�c v� � th�nh n�o?\nC� th� nh�n ch�c <color=yellow>"..(1 - nshi).."<color> Qu�n S� v� <color=yellow>"..(4 - nti).." <color> Danh B�\n<color=green>Qu�n S�<color>: Qu�n S� c� th� thay ��i thu� su�t v� l�nh thu�.\n<color=green>Danh B�<color>: c� th� truy n� ng��i ch�i c� tr� PK!", 3, "B� nhi�m Qu�n S�/#renming_shi_ye("..nItemIdx..")", "B� nhi�m Danh B�/#renming_ti_xia("..nItemIdx..")", "Kh�ng l�m/no_say")
end

function renming_shi_ye(nItemIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Th�nh �� �n ch� t�i "..tCityName[nItemMapID].."S� d�ng ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng��i kh�ng ph�i l� �� t� "..tCityName[nItemMapID].." Th�nh Ch�, kh�ng th� s� d�ng Th�nh �� �n!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 1)
	if nCount == 1 then
		Say("M�t th�nh th� ch� c� th� b� nhi�m 1 Qu�n S�", 0)
		return
	end
	local szMyName = GetName()
	local szCityTongName = GetCityWarInfo(nItemMapID, "base")
	local nOldPlayer = PlayerIndex
	local nIndex = 1
	tTab = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			local szName = GetName()
			if szName ~= szMyName and GetTongName() == szCityTongName then
				szName = replace(szName, "/" ,"-")
				szName = replace(szName, "|" ,"-")
				szName = replace(szName, ":" ,"-")
				tTab[nIndex] = szName.."/#yes_renming_shi_ye("..nItemIdx..","..i..")"
				nIndex = nIndex + 1
			end
		end
	end
	tTab[nIndex] = "Kh�ng l�m/no_say"
	PlayerIndex = nOldPlayer
	Say("C�c h� ��nh b� nhi�m ai l�m Qu�n S�?\nCh� �:  T�n ng��i ch�i c� k� t� ��c bi�t s� ��i th�nh <color=yellow>\"-\"<color>", getn(tTab), tTab)
end

function yes_renming_shi_ye(nItemIdx, nTeamIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nExpireTime = GetItemExpireTime(nItemIdx)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Th�nh �� �n ch� t�i "..tCityName[nItemMapID].."S� d�ng ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng��i kh�ng ph�i l� �� t� "..tCityName[nItemMapID].." Th�nh Ch�, kh�ng th� s� d�ng Th�nh �� �n!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 1)
	if nCount == 1 then
		Say("M�t th�nh th� ch� c� th� b� nhi�m 1 Qu�n S�", 0)
		return
	end
	
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(nTeamIdx)
	if PlayerIndex > 0 then
		local szName = GetName()
		local nTargetMapID = GetCityWarDutyFlag()
		local nJoinTime = GetTime() - GetJoinTongTime()
		local szTongName = GetTongName()
		if nTargetMapID > 0 or nJoinTime <= 604800 then		-- ����ְλ����ﲻ��7���߲��ܸ���
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			PlayerIndex = nOldPlayer
			Talk(1,"","Kh�ng th� nh�n ch�c <color=yellow>"..szName.."<color> th�nh Qu�n S�, xin m�i x�c nh�n."..szName.."Hi�n ch�a c� ch�c v� ho�c nh�p bang ch�a �� 7 ng�y")
			return
		end
		local nRet, nShiyeItemIndex = AddItem(2,1,1204,1,1)
		if nRet == 1 then
			SetItemParam(nShiyeItemIndex, 0, nItemMapID)		-- �ĸ����е�
			SetItemExpireTime(nShiyeItemIndex, nExpireTime)		-- ��Ʒ����ʱ��
			SaveNow()											-- �õ���Ʒ���˱���һ��
			WriteLog("C�ng th�nh chi�n-Qu�n l�:"..GetTongName().."-"..szName.." �� ���c b� nhi�m th�nh Qu�n S�")
			PlayerIndex = nOldPlayer
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			SetItemParam(nItemIdx, 1, 1)
			Talk(1,"","B�n nh�n ch�c "..szName.." Qu�n S�")
			SendTongMessage(GetName().."��m"..szName.." b� nhi�m th�nh Qu�n S�")
			-- ����Ѿ����������������ˣ���ɾ���Լ�
			local nshi = GetItemParam(nItemIdx, 1)
			local nti = GetItemParam(nItemIdx, 2)
			if nshi == 1 and nti == 4 then
				BigDelItem(2, 1, 1207, 1)
			end
			SaveNow()											-- ����Ʒ����Ҳ����һ��
		else
			Talk(1,"","H�nh trang �� ��y ho�c s�c l�c kh�ng ��")
		end
	end
end

function renming_ti_xia(nItemIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Th�nh �� �n ch� t�i "..tCityName[nItemMapID].."S� d�ng ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng��i kh�ng ph�i l� �� t� "..tCityName[nItemMapID].." Th�nh Ch�, kh�ng th� s� d�ng Th�nh �� �n!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 2)
	if nCount == 4 then
		Say("M�t th�nh th� ch� ���c b� nhi�m 4 Danh B�", 0)
		return
	end
	local szMyName = GetName()
	local szCityTongName = GetCityWarInfo(nItemMapID, "base")
	local nOldPlayer = PlayerIndex
	local nIndex = 1
	tTab = {}
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex > 0 then
			local szName = GetName()
			if szName ~= szMyName and GetTongName() == szCityTongName then
				szName = replace(szName, "/" ,"-")
				szName = replace(szName, "|" ,"-")
				szName = replace(szName, ":" ,"-")
				tTab[nIndex] = szName.."/#yes_renming_ti_xia("..nItemIdx..","..i..")"
				nIndex = nIndex + 1
			end
		end
	end
	tTab[nIndex] = "Kh�ng l�m/no_say"
	PlayerIndex = nOldPlayer
	Say("C�c h� ��nh b� nhi�m ai l�m Danh B�?\nCh� �: T�n ng��i ch�i c� k� t� ��c bi�t s� ��i th�nh <color=yellow>\"-\"<color>", getn(tTab), tTab)	
end

function yes_renming_ti_xia(nItemIdx, nTeamIdx)
	local nItemMapID = GetItemParam(nItemIdx, 0)
	local nExpireTime = GetItemExpireTime(nItemIdx)
	local nNowMapID = GetWorldPos()
	if nNowMapID ~= nItemMapID then
		Say("Th�nh �� �n ch� t�i "..tCityName[nItemMapID].."S� d�ng ", 0)
		return
	end
	local nMapID, nDuty = GetCityWarDutyFlag()
	if nMapID ~= nItemMapID or nDuty ~= 0 then
		Say("Ng��i kh�ng ph�i l� �� t� "..tCityName[nItemMapID].." Th�nh Ch�, kh�ng th� s� d�ng Th�nh �� �n!", 0)
		return
	end
	local nCount = GetItemParam(nItemIdx, 2)
	if nCount == 4 then
		Say("M�t th�nh th� ch� ���c b� nhi�m 4 Danh B�", 0)
		return
	end
	
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(nTeamIdx)
	if PlayerIndex > 0 then
		local szName = GetName()
		local nTargetMapID = GetCityWarDutyFlag()
		local nJoinTime = GetTime() - GetJoinTongTime()
		if nTargetMapID > 0 or nJoinTime <= 604800 then		-- ����ְλ����ﲻ��7���߲��ܸ���
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			PlayerIndex = nOldPlayer
			Talk(1,"","Kh�ng th� nh�n ch�c <color=yellow>"..szName.."<color> th�nh Danh B�, xin m�i x�c nh�n"..szName.."Hi�n ch�a c� ch�c v� ho�c nh�p bang ch�a �� 7 ng�y")
			return
		end
		local nRet, nTixiaItemIndex = AddItem(2,1,1205,1,1)
		if nRet == 1 then
			SetItemParam(nTixiaItemIndex, 0, nItemMapID)		-- �ĸ����е�
			SetItemExpireTime(nTixiaItemIndex, nExpireTime)		-- ��Ʒ����ʱ��
			SaveNow()											-- �õ���Ʒ���˱���һ��
			WriteLog("C�ng th�nh chi�n-Qu�n l�:"..GetTongName().."-"..szName.." ���c b� nhi�m l�m Danh B�")
			PlayerIndex = nOldPlayer
			szName = replace(szName, "/" ,"-")
			szName = replace(szName, "|" ,"-")
			szName = replace(szName, ":" ,"-")
			nCount = nCount + 1
			SetItemParam(nItemIdx, 2, nCount)
			Talk(1,"","B�n nh�n ch�c "..szName.." l� Danh B�")
			SendTongMessage(GetName().."��m"..szName.." b� nhi�m l� Danh B�")
			-- ����Ѿ����������������ˣ���ɾ���Լ�
			local nshi = GetItemParam(nItemIdx, 1)
			local nti = GetItemParam(nItemIdx, 2)
			if nshi == 1 and nti == 4 then
				BigDelItem(2, 1, 1207, 1)
			end
			SaveNow()											-- ����Ʒ����Ҳ����һ��
		else
			Talk(1,"","H�nh trang �� ��y ho�c s�c l�c kh�ng ��")
		end
	end
end

function no_say()
end