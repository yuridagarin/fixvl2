
--add by lizhi
-- ǰ3������Ʒ���,��4λ��ʱ��,��5λ���ٶ� / 100 = ���ٱ�

-- ע�⣬��ʼ�������ƶ��� \script\global\autoexec.lua �У�
tItemInfo =
{
	{2, 1, 1064, 480, 1, "L�c Th�n ho�n"},
	{2, 1, 1065, 480, 2, "C��ng L�c Th�n ho�n"},
	{2, 1, 1066, 480, 3, "L�c Th�n Ti�n ��n"},
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
	if GetReputation() < 500 then
		Say("Danh v�ng c�a b�n kh�ng �� 500, kh�ng th� s� d�ng!"..tItemInfo[nTabIndex][6], 0)
		return
	end
	local UseLiushen = {
		"S� d�ng 1 "..tItemInfo[nTabIndex][6]..". C� th� nh�n ���c 8 gi� "..tItemInfo[nTabIndex][6]..". Trong tr�ng th�i �y th�c r�i m�ng b�n s� nh�n ���c �i�m danh v�ng.",
		"B�n ��ng � d�ng"..tItemInfo[nTabIndex][6].."?",
		"S� d�ng "..tItemInfo[nTabIndex][6].."/UseLiushen",
		"�� ta ngh� l�i/no"
	}
	Say(UseLiushen[1]..UseLiushen[2],2,UseLiushen[3],UseLiushen[4])
end

function UseLiushen()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3])
	AskClientForNumber("use_ls_cb", 1, tonumber(nHave), "S� d�ng bao nhi�u"..tItemInfo[nTabIndex][6].."?")
end

function use_ls_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3], nCount) == 1 then
		local nRet = EatLiushen(nTabIndex, tItemInfo[nTabIndex][4] * nCount)
		if nRet > 0 then
			Msg2Player("B�n nh�n ���c "..tItemInfo[nTabIndex][6].." c�"..tItemInfo[nTabIndex][6].." th�i gian "..nRet.." ph�t ")
			--cdkey
			if 1 == nTabIndex then
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemLiuShen()");
			end
		end
	end
end

function no_say()

end
