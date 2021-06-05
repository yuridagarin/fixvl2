--Event 2010 May - TriHM

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua");
Include("\\script\\online\\viet_event\\nationality\\head.lua");
--
--tFruitAwardJune2010 =
--{
--	[1] = {9880, 	30, 		30, 		30,		30, 		{2,1,30164,1}, "Nh�n"},
--	[2] = {30, 		9880, 	30, 		30,	 	30,		{2,1,30165,1}, "Ch�m Ch�m"},
--	[3] = {30, 		30, 		9880, 	30, 		30,		{2,1,30166,1}, "Cam"},
--	[4] = {30, 		30, 		30, 		9880, 	30,		{2,1,30167,1}, "D�a"},
--	[5] = {30, 		30, 		30, 		30, 		9880,		{2,1,30168,1}, "M�ng C�t"},
--	[6] = {9880, 		30, 		30, 		30, 		30,	{2,1,30169,1}, "B��i"},
--	[7] = {30, 	9880, 		30, 		30,		30, 		{2,1,30170,1}, "D�u"},
--	[8] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30171,1}, "Chu�i"},
--	[9] = {30, 		30, 		30, 	9880, 		30,		{2,1,30172,1}, "Xo�i"},
--	[10] = {30, 		30, 		30, 		30, 	9880,			{2,1,30173,1}, "��o"},
--	[11] = {9880, 		30, 		30, 		30, 		30,	{2,1,30174,1}, "M�n"},
--	[12] = {30, 	9880, 		30, 		30,		30, 		{2,1,30175,1}, "V�i"},
--	[13] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30176,1}, "T�o"},
--	[14] = {30, 		30, 		30, 	9880, 		30,		{2,1,30177,1}, "B�"},
--	[15] = {30, 		30, 		30, 		30, 	9880,			{2,1,30178,1}, "�u ��"},
--	[16] = {9880, 		30, 		30, 		30, 		30,	{2,1,30179,1}, "M�ng C�u"},
--	[17] = {30, 	9880, 		30, 		30,		30, 		{2,1,30180,1}, "Kh�m"},
--	[18] = {30, 		30, 	9880, 		30,	 	30,		{2,1,30181,1}, "L�"},
--	[19] = {30, 		30, 		30, 	9880, 		30,		{2,1,30182,1}, "B�n bon"},
--	[20] = {30, 		30, 		30, 		9880, 	30,		{2,1,30183,1}, "Kh�"},
--}
--
--tFruitAwardServerGroup =
--{
--	[1] = {4,26,63,},
--	[2] = {17,50,},
--	[3] = {19,52,},
--	[4] = {11,38,73,},
--	[5] = {5,28,66,},
--	[6] = {20,53,},
--	[7] = {13,43,},
--	[8] = {15,47,},
--	[9] = {1,23,59},
--	[10] = {14,46},
--	[11] = {7,32,68,},
--	[12] = {2,24,60,},
--	[13] = {3,25,62,},
--	[14] = {22,58,},
--	[15] = {12,39,74,},
--	[16] = {6,29,67,},
--	[17] = {9,35,71,},
--	[18] = {8,33,70,},
--	[19] = {21,55,},
--	[20] = {10,36,72,},
--}
function main()
	if GetPlayerRoute() == 0 then
		Msg2Player("B�n ch�a gia nh�p m�n ph�i n�n kh�ng th� nh�t v�t ph�m n�y!")
		return
	end
	if GetLevel() < 73 then
		Msg2Player("B�n ch�a ��t c�p 73 n�n kh�ng th� nh�t v�t ph�m n�y!")
		return
	end
	
	local nSelfIndex = GetTargetNpc()
	if GetUnitCurStates(nSelfIndex, 6) > 1 then
		return
	else
		AddUnitStates(nSelfIndex, 6, 1)
		SetNpcLifeTime(nSelfIndex, 0)		
		
		--local nGroup = fruitcheckserver()
		--gf_AddItemEx2({tFruitAwardJune2010[nGroup][6][1], tFruitAwardJune2010[nGroup][6][2], tFruitAwardJune2010[nGroup][6][3], 1}, tFruitAwardJune2010[nGroup][7], "Bat Nha Lon", "nh�n")
		gf_EventGiveCustomAward(2,10000,0,"Bat Nha Lon","nh�n")
	end
end
--	
--function fruitcheckserver()
--	local nServerID = GetGlbValue(GLB_TSK_SERVER_ID)
--	for i = 1, getn(tFruitAwardServerGroup) do
--		for j = 1, getn(tFruitAwardServerGroup[i]) do
--			if nServerID == tFruitAwardServerGroup[i][j] then
--				return i
--			end
--		end	
--	end
--	return 4
--end

function ExchangeFruit()
--	local szNpcName = "<color=green>���ng Minh Th�nh:<color> "
--	local nNationality = GetByte(GetTask(TSK_SERVER_ID), TSK_SERVER_ID_CUR)
--	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
--	local nGroup = fruitcheckserver()
--	if nNationality ~= nNation then
--		Talk(1, "", szNpcName.."Kh�ng ph�i ng��i c�a b�n qu�c n�n kh�ng th� ��i tr�i c�y!")
--		return
--	end
--	local tSay = {}
--	local szHeader = szNpcName.."C�c h� h�y l�a ch�n lo�i tr�i c�y m�nh mu�n ��i"
--	
--	if nGroup == 1 then
--		tinsert(tSay, "Ta mu�n ��i 10 L� l�y 10 M�ng C�t (14 v�ng)/#ConfirmExchange(1, 1)")
--	elseif nGroup == 2 then
--		tinsert(tSay, "Ta mu�n ��i 10 B�n Bon l�y 10 ��o (14 v�ng)/#ConfirmExchange(2, 2)")
--	elseif nGroup == 3 then
--		tinsert(tSay, "Ta mu�n ��i 10 Kh� l�y 10 M�n (14 v�ng)/#ConfirmExchange(3, 3)")
--	elseif nGroup == 4 then
--		tinsert(tSay, "Ta mu�n ��i 10 Kh�m l�y 10 V�i (14 v�ng)/#ConfirmExchange(4, 4)")
--	elseif nGroup == 5 then
--		tinsert(tSay, "Ta mu�n ��i 10 L� l�y 10 B�(14 v�ng)/#ConfirmExchange(1, 5)")
--		tinsert(tSay, "Ta mu�n ��i 10 B�n Bon l�y 10 B� (14 v�ng)/#ConfirmExchange(2, 5)")
--		tinsert(tSay, "Ta mu�n ��i 10 Kh� l�y 10 B� (14 v�ng)/#ConfirmExchange(3, 5)")
--		tinsert(tSay, "Ta mu�n ��i 10 Kh�m l�y 10 B� (14 v�ng)/#ConfirmExchange(4, 5)")
--	elseif nGroup == 6 then
--		tinsert(tSay, "Ta mu�n ��i 10 B� l�y 10 Nh�n (14 v�ng)/#ConfirmExchange(5, 6)")	
--	end
--	tinsert(tSay, "�� ta suy ngh� l�i/DoNothing")
--	
--	Say(szHeader, getn(tSay), tSay)
end

function ConfirmExchange(nType1, nType2)
	local tList1 = {
		[1] = {{2,1,30181,10}, "L�"},
		[2] = {{2,1,30182,10}, "B�n Bon"},
		[3] = {{2,1,30183,10}, "Kh�"},
		[4] = {{2,1,30180,10}, "Kh�m"},
		[5] = {{2,1,30177,10}, "B�"},		
	}
	
	local tList2 = {
		[1] = {{2,1,30168,10}, "M�ng C�t"},
		[2] = {{2,1,30173,10}, "��o"},
		[3] = {{2,1,30174,10}, "M�n"},
		[4] = {{2,1,30175,10}, "V�i"},
		[5] = {{2,1,30177,10}, "B�"},
		[6] = {{2,1,30164,10}, "Nh�n"},		
	}
	
	if GetCash() < 140000 then
		Talk(1, "", "Kh�ng �� 14 v�ng �� ��i tr�i c�y!")
		return
	end
	if GetItemCount(tList1[nType1][1][1], tList1[nType1][1][2], tList1[nType1][1][3]) < 10 then
		Talk(1, "", "Kh�ng �� 10 "..tList1[nType1][2].." �� ��i!")
		return
	end
	
	if DelItem(tList1[nType1][1][1], tList1[nType1][1][2], tList1[nType1][1][3], tList1[nType1][1][4]) == 1 then
		Pay(140000)
		gf_AddItemEx2(tList2[nType2][1], tList2[nType2][2], "Doi Dac San", "��i th�nh c�ng")
	end
end

function DoNothing()

end