-- ����ͳ���飬�����ռ���

TASK_IB_BOOK1 = 1737

tTab =
{
	{2,	1,	1028, "Qu�n d�ng-thu th�p th�", 2},
	{2,	1,	1029, "Qu�n d�ng-Th�ng tr� th�", 5},
}

function OnUse(nidx)
	local nDay = tonumber(date("%w"))
	if not (nDay == 5 or nDay == 6) then
		Say("Hi�n kh�ng c� v�t li�u qu�n d�ng, ��i th� 6, th� 7 m�i s� d�ng!", 0)
		return
	end
	
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	
	Say("B�n mu�n d�ng"..tTab[nTabIndex][4].."? N� c� th� gi�p b�n t�ng t� l� c� ���c v�t li�u qu�n d�ng"..tTab[nTabIndex][5].."l�n.", 2, "��ng/#yes_use("..nTabIndex..")", "Sai/no_use")
end

function yes_use(nTabIndex)

	local nValue = GetTask(TASK_IB_BOOK1)
	local nDate = mod(nValue, 1000000)
	local nProbability = floor(nValue / 1000000)
	local nNow = tonumber(date("%y%j"))
	
	if nDate >= nNow and nProbability == tTab[nTabIndex][5] then
		Say("H�m nay b�n �� s� d�ng"..tTab[nTabIndex][4].."Ng�y mai h�y quay l�i!", 0)
	elseif nDate >= nNow and nProbability < tTab[nTabIndex][5] then
		Say("B�n mu�n d�ng qu�n d�ng-th�ng tr� th�?", 2, "��ng/yes_use_2", "Sai/no_say")
	elseif nDate >= nNow and nProbability > tTab[nTabIndex][5] then
		Say("B�n �� d�ng qu�n d�ng-th�ng tr� th� kh�ng c�n d�ng qu�n d�ng-thu th�p th�.", 0)
	elseif nDate < nNow then
		if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
			local nDate = tonumber(date("%y%j"))
			SetTask(TASK_IB_BOOK1, tTab[nTabIndex][5] * 1000000 + nNow)
			Msg2Player("B�n �� s� d�ng 1 "..tTab[nTabIndex][4])
		end
	end
end

function yes_use_2()
	if DelItem(2, 1, 1029, 1) == 1 then
		local nDate = tonumber(date("%y%j"))
		SetTask(TASK_IB_BOOK1, 5 * 1000000 + nDate)
		Msg2Player("B�n �� s� d�ng 1 qu�n d�ng-th�ng tr� th�")
	end
end

function no_say()

end
