Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbAllowItem = {8001, 8002, 8003, 8004}
	local nBody = GetBody()
	local nOrder = 0
	for i=1,getn(tbAllowItem) do
		if particular == tbAllowItem[i] then
			nOrder = i
			break
		end
	end
	
	if genre ~= 0 or (detail ~= 100 and detail ~= 101 and detail ~= 103) or nOrder == 0 then
		Talk(1,"","Trang b? ?em ??i kh?ng h?p l?.")
		return 0
	end
	
	if GetEquipAttr(idx,2) < 7 then
		Talk(1,"","Trang b? ph?i ???c c??ng h?a 7 tr? l?n.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbMaterial = {item={{gdp={2,1,30230,100}}}}
	local tbAllowItem = {8001, 8002, 8003, 8004}
	local nCheck = 0
	local szItem = "C?c v?t ph?m ???c ??i:\n"
	local tbChangeList = GetPutinItem();
	for i=1, getn(tbChangeList) do
		if tbChangeList[i][3] == 100 then
			nCheck = nCheck + 1
		elseif tbChangeList[i][3] == 101 then
			nCheck = nCheck + 10
		elseif tbChangeList[i][3] == 103 then
			nCheck = nCheck + 100
		end
	end
	
	if nCheck ~= 111 then
		Talk(1,"","C?c h? kh?ng ??a ?? b? trang b? Vi?m ?? g?m n?n, ?o, qu?n, ta s? kh?ng ??i cho c?c h?")
		return 0
	end
	
	local nCheckMaterial = 0
	nCheckMaterial = LIB_Award:CheckMaterial(tbMaterial)
	if nCheckMaterial ~= 1 then
		return 0
	end
	LIB_Award:PayMaterial(tbMaterial)
	VNG_SetTaskPos(TSK_TC_BK_VD,2,1,1)

	local tbViemDe_B1 = {item = {
			{gdp={0,100,8055,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8055,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8055,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDe_B2 = {item = {
			{gdp={0,100,8056,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8056,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8056,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDe_B3 = {item = {
			{gdp={0,100,8057,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8057,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8057,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDe_B4 = {item = {
			{gdp={0,100,8058,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,103,8058,1,1,-1,-1,-1,-1,-1,-1,-1,0}},
			{gdp={0,101,8058,1,1,-1,-1,-1,-1,-1,-1,-1,0}},}
	}
	local tbViemDeAll = {
		[1] = tbViemDe_B1,
		[2] = tbViemDe_B2,
		[3] = tbViemDe_B3,
		[4] = tbViemDe_B4,
	}
	
	LIB_Award.szLogTitle = "DOI VIEM DE - THIEN CHI VIEM DE"
	LIB_Award.szLogAction = "nh?n"
	
	for i=1, getn(tbChangeList) do
		DelItemByIndex(tbChangeList[i][1],-1)
	end
	LIB_Award:AwardByBody(tbViemDeAll)
	Talk(1,"","Trao ??i th?nh c?ng, c?c h? h?y ki?m tra b? trang b? m?i.")
	gf_WriteLogEx("NHAN NV DOI VD 2 TCVD", "th?nh c?ng", 1, "ho?n th?nh nhi?m v?")
end
