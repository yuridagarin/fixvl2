TASKVAL_BAIJUWAN	= 2501		-- �������������׾����ʣ��ʱ�䣨���ӣ�
TASKVAL_BAIJUWAN1 	= 2507		-- ��׾����ʱ��
TASKVAL_BAIJUWAN2 	= 2508		-- �׾��ɵ���ʱ��
BAIJUWAN_TIME		= 8 * 60	-- һ���׾����ʱ����8��Сʱ����λ�Ƿ��ӣ�

tTab =
{
	{2, 1, 270, "B�ch C�u Ho�n", 2501},
	{2, 1, 1007, "��i B�ch C�u ho�n", 2507},
	{2, 1, 1008, "B�ch C�u Ti�n ��n", 2508},
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
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
	
	SetTaskTemp(25, nTabIndex)
	local val = tTab[nTabIndex][5]
	local UseBaiju = {
		"S� d�ng 1 "..tTab[nTabIndex][4]..". C� th� nh�n ���c 8 gi� "..tTab[nTabIndex][4]..". �y th�c r�i m�ng t�ng kinh nghi�m.",
		" Hi�n b�n c�n ".. GetTask(val) .." ph�t "..tTab[nTabIndex][4]..". B�n mu�n s� d�ng"..tTab[nTabIndex][4].."?",
		"S� d�ng "..tTab[nTabIndex][4].."/UseBaiJuWan",
		"�� ta ngh� l�i/no"
	}
	Say(UseBaiju[1]..UseBaiju[2],2,UseBaiju[3],UseBaiju[4])
end

function UseBaiJuWan()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3])
	AskClientForNumber("use_bj_cb", 1, tonumber(nHave), "S� d�ng bao nhi�u"..tTab[nTabIndex][4].."?")
end

function use_bj_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], nCount) == 1 then
		local value = GetTask(tTab[nTabIndex][5]) + BAIJUWAN_TIME * nCount
		SetTask(tTab[nTabIndex][5], value)
		Say("Th�i gian s� d�ng"..tTab[nTabIndex][4].."c�a b�n c�n <color=yellow>" .. value .. "<color> ph�t !", 0)
		--cdkey
		if 1 == nTabIndex then
			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemBaiJu()");
		end
	end
end

function no()
end
