
--add by lizhi
-- ǰ3������Ʒ���,��4λ��ʱ��,��5λ���ٶ� / 100 = ���ٱ�

-- ע�⣬��ʼ�������ƶ��� \script\global\autoexec.lua �У�
tItemInfo =
{
	{2, 1, 1097, 480, 1, "Tam Thanh ho�n"},
	{2, 1, 1098, 480, 2, "C��ng Tam Thanh ho�n"},
	{2, 1, 1099, 480, 3, "Tam Thanh Ti�n ��n"},
}

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nTabIndex = 0
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break;
		end
	end

	if nTabIndex == 0 then
		return
	end
	
	SetTaskTemp(25, nTabIndex)
	local tUseSanqing = {
		"S� d�ng 1 "..tItemInfo[nTabIndex][6]..". C� th� nh�n ���c 8 gi� "..tItemInfo[nTabIndex][6]..". � tr�ng th�i �y th�c r�i m�ng b�n c� th� nh�n ���c �� c�ng hi�n s� m�n.",
		"B�n ��ng � d�ng"..tItemInfo[nTabIndex][6].."?",
		"S� d�ng "..tItemInfo[nTabIndex][6].."/UseSanqing",
		"�� ta ngh� l�i/no"
	}
	Say(tUseSanqing[1]..tUseSanqing[2],2,tUseSanqing[3],tUseSanqing[4])
end

function UseSanqing()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3])
	AskClientForNumber("use_sq_cb", 1, tonumber(nHave), "S� d�ng bao nhi�u"..tItemInfo[nTabIndex][6].."?")
end

function use_sq_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3], nCount) == 1 then
		local nRet = EatSanqin(nTabIndex, tItemInfo[nTabIndex][4] * nCount)
		if nRet > 0 then
			Msg2Player("B�n nh�n ���c "..tItemInfo[nTabIndex][6].." c�"..tItemInfo[nTabIndex][6].." th�i gian "..nRet.." ph�t ")
			--cdkey
			if 1 == nTabIndex then
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemSanQing()");
			end
		end
	end
end

function no_say()

end
