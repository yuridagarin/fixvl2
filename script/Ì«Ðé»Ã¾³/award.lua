Include("\\script\\vng\\lib\\vnglib_award.lua");

tPai =
{
	[469] = {"D�ng 1 B�t Qu�i b�i - C�n ��i 30 v�n kinh nghi�m, m�i ng�y ��i ���c t�i �a 20 l�n", "GiveExp(300000, 20)"		},
	[470] = {"D�ng 1 B�t Qu�i b�i - Kh�n ��i 5 �i�m danh v�ng, m�i ng�y ��i ���c t�i �a 20 l�n", "GiveReputation(5, 20)"   },
	[471] = {"D�ng 1 B�t Qu�i b�i - Kh�m ��i 3 Thi�n th�ch, m�i ng�y ��i ���c t�i �a 20 l�n", "GiveYuntie(3, 20)"          },
	[472] = {"D�ng 1 B�t Qu�i b�i - �o�i ��i nguy�n li�u c�p 76, m�i ng�y ��i ���c t�i �a 30 l�n", "GiveWeaponMaterial(30)"   },
	[473] = {"D�ng 1 B�t Qu�i b�i - Ly t�ng 500000 �i�m kinh nghi�m, m�i ng�y ��i t�i �a 10 l�n", "GiveExp3(500000, 10)"       },
	[474] = {"D�ng 1 B�t Qu�i b�i - Ch�n ��i ng�a c�p 70, m�i ng�y ��i ���c t�i �a 5 l�n", "GiveHorse(5)"            },
	[475] = {"D�ng 1 B�t Qu�i b�i - C�n ��i Th�i H� B�t Qu�i b�i, m�i ng�y ��i ���c t�i �a 10 l�n", "GiveOtherPai(10)"         },
	[476] = {"D�ng 1 B�t Qu�i b�i - T�n ��i 500 v�n kinh nghi�m, m�i ng�y ��i ���c t�i �a 5 l�n", "GiveExp2(5000000, 5)"       },
}

-- �����ֵ�Ժ�̫���������仯�Ժ�Ҫ�޸�
MAX_ITEM_COUNT = 8

function GetAwardPai()
	-- �������ϵ�̫�������
	local nCount = 1
	local tItem = {}
	for index, value in tPai do
		if GetItemCount(2, 1, index) > 0 then
			tItem[nCount] = value[1].."/#UsePaiGetAward("..index..")"
			nCount = nCount + 1
		end
	end
	tItem[nCount] = "Kh�ng ��i/end_say"
	if nCount <= MAX_ITEM_COUNT then
		Say("Ng��i mu�n d�ng Th�i H� B�t Qu�i lo�i n�o ��i ph�n th��ng?", getn(tItem), tItem)
	else
		tinsert(tItem, 1, "D�ng m�t b� Th�i H� B�t Qu�i b�i ��i trang s�c Th�i H�/UseAllGetAward")
		tinsert(tItem, 2, "D�ng m�t b� Th�i H� B�t Qu�i b�i ��i ph�n th��ng/UseAllGetAward_new")
		Say("Ng��i �� c� m�t b� Th�i H� B�t Qu�i b�i c� th� ch�n ��i 1 m�n trang s�c Th�i H� ho�c d�ng t�ng m�n ��i ph�n th��ng.", getn(tItem), tItem)
	end
end

function UsePaiGetAward(nIndex)
	if tPai[nIndex] == nil then
		return
		WriteLog("**Th�i H� Huy�n C�nh "..GetName().."���ng d�n ��i B�t Qu�i b�i phi ph�p, th�i gian : "..date("%H%M"))
	end
	
	if GetItemCount(2, 1, nIndex) <= 0 then
		Say("Ng��i kh�ng mang <color=yellow>"..tPai[nIndex].."<color>, kh�ng th� ��i th��ng.", 0)
		return
	end
	
	dostring(tPai[nIndex][2])
end

function UseAllGetAward()
	local tRing = 
	{
		"Th�i H� Huy�n Ng�c (s�c m�nh)/#GiveTaixuRing(29)",
		"Th�i H� Huy�n ��i (th�n ph�p)/#GiveTaixuRing(30)",
		"Th�i H� Huy�n Ho�n (g�n c�t)/#GiveTaixuRing(31)",
		"Th�i H� Huy�n B�i (n�i c�ng)/#GiveTaixuRing(32)",
		"Th�i H� Huy�n Gi�i (Linh ho�t)/#GiveTaixuRing(33)",
		"Th�i H� Huy�n ��i (��c)/#GiveTaixuRing(34)",
		"Th�i H� Huy�n Th�ch (s�t th��ng)/#GiveTaixuRing(35)",
		"Quay l�i sau!/end_say"
	}
	Say("Ng��i mu�n ��i trang s�c n�o? Tr��c khi ��i xem l�i h�nh trang v� s�c l�c!", getn(tRing), tRing)
end

function GiveTaixuRing(nIndex)
	local tName =
	{
		[29] = "B�n mu�n ��i <color=yellow>Th�i H� Huy�n ng�c (s�c m�nh)<color> ch�?",
		[30] = "B�n mu�n ��i <color=yellow>Th�i H� Huy�n ��i (th�n ph�p)<color> ch�?",
		[31] = "B�n mu�n ��i <color=yellow>Th�i H� Huy�n ho�n (g�n c�t)<color> ch�?",
		[32] = "B�n mu�n ��i <color=yellow>Th�i H� Huy�n b�i (n�i c�ng)<color> ch�?",
		[33] = "B�n mu�n ��i <color=yellow>Th�i H� Huy�n gi�i (Linh ho�t)<color> ch�?",
		[34] = "B�n mu�n ��i <color=yellow>Th�i H� Huy�n ��i (��c)<color> ch�?",
		[35] = "B�n mu�n ��i <color=yellow>Th�i H� Huy�n th�ch (s�t th��ng)<color> ch�?",
	}
	Say("<color=green>Th�n Du Ch�n Nh�n<color>:"..tName[nIndex], 2, "��ng/#GiveTaixuRing_yes("..nIndex..")", "�� ta suy ngh� l�i/UseAllGetAward")
end

function GiveTaixuRing_yes(nIndex)
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, h�y s�p x�p l�i h�nh trang.")
		return 0
	end
	
	local nMax = 1
	local nChance = gf_GetTaskByte(TSK_THAIHU_DOITHUONG, 1)
	
	if nChance >= nMax then
		Talk(1,"", "Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n trang s�c Th�i H�, ng�y mai h�y quay l�i!")
		return 0
	end

	local nCount = 1
	for index, value in tPai do
		if GetItemCount(2, 1, index) > 0 then
			nCount = nCount + 1
		end
	end
	if nCount <= MAX_ITEM_COUNT then
		Talk(1,"", "Ng��i kh�ng �� m�t b� Th�i H� B�t Qu�i b�i, kh�ng th� ��i trang s�c Th�i H�.")
		return 0
	end

	for index, value in tPai do
		DelItem(2, 1, index, 1)
	end	
	
	nChance = nChance + 1
	gf_SetTaskByte(TSK_THAIHU_DOITHUONG, 1, nChance)
	
	local nRet = 0
	nRet = AddItem(0, 102, nIndex, 1, 1, -1, -1, -1, -1, -1, -1)
	if nRet == 0 then
		WriteLog("**Th�i H� Huy�n C�nh "..GetName().."Nh�n trang s�c Th�i H� th�t b�i, th�i gian : "..date("%H%M"))
	else
		local tName =
		{
			[29] = "Th�i H� Huy�n Ng�c",
			[30] = "Th�i H� Huy�n ��i ",
			[31] = "Th�i H� Huy�n Ho�n",
			[32] = "Th�i H� Huy�n B�i",
			[33] = "Th�i H� Huy�n Gi�i",
			[34] = "Th�i H� Huy�n ��i",
			[35] = "Th�i H� Huy�n Th�ch",
		}
		gf_WriteLogEx("DOI THUONG THAI HU HUYEN CANH", "nh�n", 1, tName[nIndex])
--		WriteLog("**Th�i H� Huy�n C�nh "..GetName().."�� ��i 1"..tName[nIndex]..", th�i gian : "..date("%H%M"))
	end
end


function UseAllGetAward_new()
	if gf_Judge_Room_Weight(1, 100) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, h�y s�p x�p l�i h�nh trang.")
		return 0
	end
	local nMax = 1
	local nChance = gf_GetTaskByte(TSK_THAIHU_DOITHUONG, 2)
	
	if nChance >= nMax then
		Talk(1,"", "Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n ph�n th��ng Th�i H�, ng�y mai h�y quay l�i!")
		return 0
	end

	local nCount = 1
	for index, value in tPai do
		if GetItemCount(2, 1, index) > 0 then
			nCount = nCount + 1
		end
	end
	if nCount <= MAX_ITEM_COUNT then
		Talk(1,"", "Ng��i kh�ng �� m�t b� Th�i H� B�t Qu�i b�i, kh�ng th� ��i trang s�c Th�i H�.")
		return 0
	end

	nChance = nChance + 1

	local tbAward = {
		item = {{gdp={2,1,30341,2}, name="T�ng R��ng"}},
		--nExp = 10000000,
		nQuancong = 200,
		nChankhi = 200,
		nSumon = 20,
		nDanhvong = 20,
	}
	LIB_Award.szLogTitle = "DOI THUONG THAI HU HUYEN CANH"
	LIB_Award.szLogAction = "nh�n"
	if LIB_Award:Award(tbAward) == 1 then
		ModifyExp(10000000)
		gf_SetTaskByte(TSK_THAIHU_DOITHUONG, 2, nChance)	
		for index, value in tPai do
			DelItem(2, 1, index, 1)
		end
	end
end


-- ��¼��ȡÿ����ȡ��������������÷���������˵��λ��ʾʮ���Ƶ�λ
-- ��3λ��ʾ��ȡʱ��Ϊ����ĵڼ��죬������ǰ��λ��ʾ�꣬����ǰ��λ��ʾ��ȡ����
function GiveExp(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1786)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n 30 v�n kinh nghi�m, ng�y mai h�y quay l�i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 469, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1786, nValue)
		ModifyExp(nExp)
		WriteLog("**Th�i H� Huy�n C�nh"..GetName().."�� nh�n "..nExp.." �i�m kinh nghi�m, th�i gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveExp2(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1788)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n 500 v�n kinh nghi�m, ng�y mai h�y quay l�i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 476, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1788, nValue)
		ModifyExp(nExp)
		Msg2Player("B�n nh�n ���c "..nExp.." �i�m kinh nghi�m")
		WriteLog("**Th�i H� Huy�n C�nh "..GetName().."�� nh�n "..nExp.." �i�m kinh nghi�m, th�i gian :  : "..date("%H%M"))
	end
end

function GiveExp3(nExp, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1791)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.."nh�n 500000 �i�m kinh nghi�m r�i, ng�y mai l�i ��n nh�!", 0)
		return
	end
	local nRet = DelItem(2, 1, 473, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1791, nValue)
		ModifyExp(nExp)
		WriteLog("**Th�i H� Huy�n C�nh"..GetName().."�� nh�n "..nExp.." �i�m kinh nghi�m, th�i gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveReputation(nReputation, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1787)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.."danh v�ng, ng�y mai h�y quay l�i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 470, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1787, nValue)
		ModifyReputation(nReputation, 0)
		Talk(1,"", "B�n nh�n ���c "..nReputation.." �i�m danh v�ng")
		WriteLog("**Th�i H� Huy�n C�nh"..GetName().."�� nh�n "..nReputation.." �i�m danh v�ng, th�i gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveYuntie(nCount, nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1789)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))

	if gf_Judge_Room_Weight(5, 100) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, h�y s�p x�p l�i h�nh trang.")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n Thi�n th�ch, ng�y mai h�y quay l�i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 471, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1789, nValue)
		
		AddItem(2, 2, 8, nCount, 1)
		WriteLog("**Th�i H� Huy�n C�nh"..GetName().."�� nh�n "..nCount.." Thi�n th�ch, th�i gian : "..date("%H%M"))
		GetAwardPai()
	end
end

function GiveWeaponMaterial(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1790)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	if gf_Judge_Room_Weight(7, 100) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, h�y s�p x�p l�i h�nh trang.")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n nguy�n li�u c�p 76, ng�y mai h�y quay l�i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 472, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1790, nValue)
	
		local nCount = 0
		for i = 66, 69 do
			nCount = mod(random(25677), 4) + 1
			AddItem(2, 2, i, nCount, 1)
		end
		GetAwardPai()
	end
end

function GiveHorse(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1792)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	if gf_Judge_Room_Weight(2, 100) == 0 then
		Talk(1,"", "S�c l�c ho�c h�nh trang kh�ng ��, h�y s�p x�p l�i h�nh trang.")
		return 0
	end	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n ng�a c�p 70, ng�y mai h�y quay l�i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 474, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1792, nValue)
		
		local nArea = random(1, 100)
		local nRet = 0
		if nArea <= 40 then
			nRet = AddItem(0, 105, 9, 1, 1, -1, -1, -1, -1, -1, -1)
		elseif nArea <= 80 then
			nRet = AddItem(0, 105, 11, 1, 1, -1, -1, -1, -1, -1, -1)
		else
			nRet = AddItem(0, 105, 12, 1, 1, -1, -1, -1, -1, -1, -1)
		end
		if nRet == 0 then
			WriteLog("**Th�i H� Huy�n C�nh "..GetName().."��i ng�a c�p 60 th�t b�i, th�i gian : "..date("%H%M"))
		else
			WriteLog("**Th�i H� Huy�n C�nh "..GetName().."��i ng�a c�p 60 th�nh c�ng, th�i gian : "..date("%H%M"))
		end
		GetAwardPai()
	end
end

function GiveOtherPai(nMaxChance)
	if nMaxChance == nil then
		nMaxChance = 1
	end
	local nResult = 0
	local nValue = GetTask(1793)
	local nChance = floor(nValue / 10000000)
	local nDateRecord = mod(nValue, 10000000)
	local nDateNow = tonumber(date("%Y%j"))
	
	if nDateNow < nDateRecord then
		nResult = 1
	elseif nDateNow == nDateRecord and nChance >= nMaxChance then
		nResult = 1
	elseif nDateNow == nDateRecord then
		nResult = 0
	elseif nDateNow > nDateRecord then
		nResult = 0
		nChance = 0
	end
	
	if nResult == 1 then
		Say("Xin l�i! H�m nay ng��i �� ��i"..nChance.." l�n Th�i H� B�t Qu�i b�i, ng�y mai h�y quay l�i!", 0)
		return
	end
	local nRet = DelItem(2, 1, 475, 1)
	if nRet == 1 then
		nChance = nChance + 1
		nValue = tonumber(nChance..nDateNow)
		SetTask(1793, nValue)
		
		local nArea = random(1, 100)
		local nRet = 0
		if nArea <= 20 then
			nRet = AddItem(2, 1, 469, 1, 1)
		elseif nArea <= 40 then
			nRet = AddItem(2, 1, 470, 1, 1)
		elseif nArea <= 55 then
			nRet = AddItem(2, 1, 471, 1, 1)
		elseif nArea <= 70 then
			nRet = AddItem(2, 1, 472, 1, 1)
		elseif nArea <= 85 then
			nRet = AddItem(2, 1, 473, 1, 1)
		elseif nArea <= 90 then
			nRet = AddItem(2, 1, 474, 1, 1)
		elseif nArea <= 95 then
			nRet = AddItem(2, 1, 475, 1, 1)
		else
			nRet = AddItem(2, 1, 476, 1, 1)
		end
		if nRet == 0 then
			WriteLog("**Th�i H� Huy�n C�nh "..GetName().."��i Th�i H� B�t Qu�i th�t b�i, th�i gian : "..date("%H%M"))
		else
			WriteLog("**Th�i H� Huy�n C�nh"..GetName().."��i Th�i H� B�t Qu�i th�nh c�ng, th�i gian : "..date("%H%M"))
		end
		GetAwardPai()
	end
end


function end_say()
end
