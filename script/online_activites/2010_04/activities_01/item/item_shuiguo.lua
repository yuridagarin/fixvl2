Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

MAX_FRUITUSE_PER_DAY = 10
MAX_FRUITEXP_PER_DAY = 80000000
EXP_PER_FRUIT = 200000

tbFruitUseList =
{
	[1] = {"Nh�n", 30164, 1, TSK_USEFRUIT_FLAG_1},
	[2] = {"Ch�m Ch�m", 30165, 100, TSK_USEFRUIT_FLAG_1},
	[3] = {"Cam", 30166, 10000, TSK_USEFRUIT_FLAG_1},
	[4] = {"D�a", 30167, 1000000, TSK_USEFRUIT_FLAG_1},
	[5] = {"M�ng c�t", 30168, 100000000, TSK_USEFRUIT_FLAG_1},
	[6] = {"B��i", 30169, 1, TSK_USEFRUIT_FLAG_2},
	[7] = {"D�u", 30170, 100, TSK_USEFRUIT_FLAG_2},
	[8] = {"Chu�i", 30171, 10000, TSK_USEFRUIT_FLAG_2},
	[9] = {"Xo�i", 30172, 1000000, TSK_USEFRUIT_FLAG_2},
	[10] = {"��o", 30173, 100000000, TSK_USEFRUIT_FLAG_2},
	[11] = {"M�n", 30174, 1, TSK_USEFRUIT_FLAG_3},
	[12] = {"V�i", 30175, 100, TSK_USEFRUIT_FLAG_3},
	[13] = {"T�o", 30176, 10000, TSK_USEFRUIT_FLAG_3},
	[14] = {"B�", 30177, 1000000, TSK_USEFRUIT_FLAG_3},
	[15] = {"�u ��", 30178, 100000000, TSK_USEFRUIT_FLAG_3},
	[16] = {"M�ng C�u", 30179, 1, TSK_USEFRUIT_FLAG_4},
	[17] = {"Kh�m", 30180, 100, TSK_USEFRUIT_FLAG_4},
	[18] = {"L�", 30181, 10000, TSK_USEFRUIT_FLAG_4},
	[19] = {"B�n Bon", 30182, 1000000, TSK_USEFRUIT_FLAG_4},
	[20] = {"Kh�", 30183, 100000000, TSK_USEFRUIT_FLAG_4},
}

function OnUse(nItemIdx)
	if GetLevel() < 73 then
		Talk(1, "", "��ng c�p 73 tr� l�n m�i c� th� s� d�ng tr�i c�y!")
		return
	end
	local _nG, _nD, nP = GetItemInfoByIndex(nItemIdx)
	local nNum = GetFruitNum(nP)
	if nNum == 0 then
		Msg2Player("Ph�t sinh l�i, kh�ng th� s� d�ng!")
		return
	end
	local nDate = tonumber(date("%y%m%d"))
	if GetTask(TSK_USEFRUIT_DATE) ~= nDate then
		SetTask(TSK_USEFRUIT_DATE, nDate)
		SetTask(TSK_USEFRUIT_EXP, 0)
		SetTask(TSK_USEFRUIT_FLAG_1, 0)
		SetTask(TSK_USEFRUIT_FLAG_2, 0)
		SetTask(TSK_USEFRUIT_FLAG_3, 0)
		SetTask(TSK_USEFRUIT_FLAG_4, 0)
	end
	
	local nUsedExp = GetTask(TSK_USEFRUIT_EXP)
	if nUsedExp >= MAX_FRUITEXP_PER_DAY then
		Talk(1, "", "��i hi�p �� nh�n t�i �a s� �i�m kinh nghi�m s� d�ng tr�i c�y trong ng�y h�m nay, kh�ng th� s� d�ng th�m!")
		return
	end
	
	local nUsed = mod(floor(GetTask(tbFruitUseList[nNum][4]) / tbFruitUseList[nNum][3]), 100)
	if nUsed >= MAX_FRUITUSE_PER_DAY then
		Talk(1, "", "��i hi�p �� s� d�ng t�i �a s� "..tbFruitUseList[nNum][1].." trong ng�y h�m nay, kh�ng th� s� d�ng th�m!")
		return
	end

	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(TSK_USEFRUIT_EXP, GetTask(TSK_USEFRUIT_EXP) + EXP_PER_FRUIT)
		SetTask(tbFruitUseList[nNum][4], GetTask(tbFruitUseList[nNum][4]) + tbFruitUseList[nNum][3])
		ModifyExp(EXP_PER_FRUIT)
		Msg2Player("B�n nh�n ���c "..EXP_PER_FRUIT.." �i�m kinh nghi�m!")
		--=============== Chu�i nhi�m v� Ph�c Sinh 2 =============
		if nUsed == (MAX_FRUITUSE_PER_DAY - 1) then
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 19 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
		end
		--====================================================
	end
end

function GetFruitNum(nP)
	for i = 1, getn(tbFruitUseList) do
		if nP == tbFruitUseList[i][2] then
			return i
		end
	end
	return 0
end
