-- С�˲ι�
-- 4Сʱ�������ؼ������ٶ�2����ʱ����ۻ�������Ͷ����Ϊ��ť������ʾ����ʾ
-- lizhi 2006-11-2 11:53

TASK_ID = 2506

function OnUse()
	local nLeftTime = GetTask(TASK_ID)
	nLeftTime = floor(nLeftTime / 18 / 60)
	local nHour = floor(nLeftTime / 60)
	local nMin = floor(mod(nLeftTime, 60))
	Say("D�ng ti�u Nh�n s�m qu� c� th� nh�n ���c t�c ��c tu luy�n m�t t�ch g�p 4 l�n trong 4 gi�, b�n c�n "..nHour.."h "..nMin.." ph�t, mu�n d�ng kh�ng?",
		2,
		"��ng r�i./yes_use",
		"H�y b�./no_use"
		)
end

function yes_use()
	local nHave = GetItemCount(2,0,552)
	AskClientForNumber("use_cb", 1, tonumber(nHave), "Mu�n d�ng m�y ti�u Nh�n s�m qu�?")
end

function use_cb(nCount)
	local nTaskValue = GetTask(TASK_ID)
	if DelItem(2, 0, 552, nCount) == 1 then
		SetTask(TASK_ID, nTaskValue + 14400 * 18 * nCount)
		local nTime = floor(GetTask(TASK_ID) / 18 / 60)
		local nHour = floor(nTime / 60)
		local nMin = floor(mod(nTime, 60))
		Msg2Player("B�n �� d�ng Ti�u Nh�n s�m qu�, th�i gian tu luy�n m�t t�ch g�p 4 l�n c�n"..nHour.."h "..nMin.." ph�t ")
	end
end

function no_use()

end
