-- ������ص���ؽű�

function OnArrive(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRank(szKey, nKey1, nKey2, 1)
	else
		BuildBWRank(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function OnArriveInfo(szKey, nKey1, nKey2, nCount, szInExistKey, nInExistKey1, nInExistKey2)
	if szKey ~= "" then
		BuildBWRankInfo(szKey, nKey1, nKey2, 1)
	else
		BuildBWRankInfo(szInExistKey, nInExistKey1, nInExistKey2, 0)
	end
end

function SyncZgPoint(nPoint)
	local nBodyPoint = GetTask(662)
	local nDiff = nPoint - nBodyPoint
	if nDiff > 0 then
		SetTask(662, nPoint, 21)
		Msg2Player("�i�m t� c�ch ��i h�i t� v� c�a b�n �� t�ng l�n "..nDiff.." �i�m, �i�m t� c�ch hi�n t�i l� "..nPoint.." Ph�t ")
	end
	WriteLog("[��i h�i t� v�] event=C�p nh�t �i�m t� c�ch name="..GetName().." "..nBodyPoint.." "..nPoint)
end