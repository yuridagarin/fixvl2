-- ���˲ι�
-- 4Сʱ�������ؼ������ٶ�4����ʱ����ۻ�������Ͷ����Ϊ��ť������ʾ����ʾ
-- lizhi 2006-11-2 11:52

TASK_ID = 2505

function OnUse()
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))
	Say("D�ng ��i Nh�n s�m t�c �� tu luy�n m�t t�ch g�p 4 l�n trong 4 gi�, hi�n b�n c�n "..nHour.."h "..nMin.." ph�t, mu�n s� d�ng?",
		2,
		"��ng r�i./yes_use",
		"H�y b�./no_use"
		)
end

function yes_use()
	local nHave = GetItemCount(2,0,553)
	AskClientForNumber("use_cb", 1, tonumber(nHave), "D�ng bao nhi�u ��i Nh�n s�m?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASK_ID)
	if DelItem(2, 0, 553, nCount) == 1 then
		SetTask(TASK_ID, nTaskValue + 14400 * 18 * nCount)
		local nTime = floor(GetTask(TASK_ID) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		Msg2Player("B�n �� d�ng ��i Nh�n s�m, th�i gian cho t�c �� tu luy�n m�t t�ch g�p 4 l�n l�"..nHour.."h "..nMin.." ph�t ")
	end
end

function no_use()

end
