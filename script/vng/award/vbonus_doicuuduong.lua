Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbAllowItem = {3034, 3040, 3046, 3052, 3037, 3043, 3049, 3055}
	local nBody = GetBody()
	local nOrder = 0
	for i=1,getn(tbAllowItem) do
		if particular == tbAllowItem[i] then
			nOrder = i
			break
		end
	end
	
	if genre ~= 0 or (detail ~= 100 and detail ~= 101 and detail ~= 103) or nOrder == 0 then
		Talk(1,"","Trang b� �em ��i kh�ng h�p l�.")
		return 0
	end
	
	if GetEquipAttr(idx,2) ~= 11 then
		Talk(1,"","M�c c��ng h�a kh�ng h�p l�.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbAllowItem = {3034, 3040, 3046, 3052, 3037, 3043, 3049, 3055}
	local nCheck = 0
	local szItem = "C�c v�t ph�m ���c ��i:\n"
	local tbChangeList = GetPutinItem();
	for i=1, getn(tbChangeList) do
		if tbChangeList[i][3] == 100 and tbChangeList[i][4] == tbChangeList[1][4] then
			nCheck = nCheck + 1
		elseif tbChangeList[i][3] == 101 and tbChangeList[i][4] == tbChangeList[1][4]  then
			nCheck = nCheck + 10
		elseif tbChangeList[i][3] == 103 and tbChangeList[i][4] == tbChangeList[1][4]  then
			nCheck = nCheck + 100
		end
	end
	
	if nCheck ~= 111 then
		Talk(1,"","C�c h� kh�ng ��a �� b� trang b� Thi�n Ngh�a g�m n�n, �o, qu�n, ta s� kh�ng ��i cho c�c h�")
		return 0
	end
	
	
	local tbThienNghia1_B1 = {item = {
			{gdp={0,100,3034,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3034,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3034,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B2 = {item = {
			{gdp={0,100,3040,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3040,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3040,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B3 = {item = {
			{gdp={0,100,3046,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3046,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3046,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghia1_B4 = {item = {
			{gdp={0,100,3052,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng H�a Y"},
			{gdp={0,103,3052,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Nh�t Qu�n"},
			{gdp={0,101,3052,1,1,-1,-1,-1,-1,-1,-1,-1,11}, name = "Thi�n Ngh�a-C�u D��ng Long Trang"},}
	}
	local tbThienNghiaSet1 = {
		[1] = tbThienNghia1_B1,
		[2] = tbThienNghia1_B2,
		[3] = tbThienNghia1_B3,
		[4] = tbThienNghia1_B4,
	}
	
	LIB_Award.szLogTitle = "DOI PHAN THUONG VBONUS"
	LIB_Award.szLogAction = "nh�n"
	
	local nVB = GetExtPoint(1)
	nVB = SetBit(nVB,8,1)
	PayExtPoint(1,GetExtPoint(1))
	AddExtPoint(1, nVB)
	
	for i=1, getn(tbChangeList) do
		DelItemByIndex(tbChangeList[i][1],-1)
	end
	LIB_Award:AwardByBody(tbThienNghiaSet1)
	Talk(1,"","Trao ��i th�nh c�ng, c�c h� h�y ki�m tra b� trang b� m�i.")
end
