Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\lib\\globalfunctions.lua");

function OnPutinCheck(param, idx, genre, detail, particular)
	local tbAllowItem = {
			[8055] = 1,
			[8056] = 1,
			[8057] = 1,
			[8058] = 1,
		}
	local nOrder = 0
	if  tbAllowItem[particular] == 1 then
		nOrder = 1
	end
	
	if genre ~= 0 or (detail ~= 100 and detail ~= 101 and detail ~= 103) or nOrder == 0 then
		Talk(1,"","Trang b� �em ��i kh�ng h�p l�.")
		return 0
	end
	
	if GetEquipAttr(idx,2) < 13 then
		Talk(1,"","M�c c��ng h�a kh�ng h�p l�.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbItemList = GetPutinItem();
	if getn(tbItemList) < 0 then
		return 0
	end
	local tbItem = tbItemList[1]
	
	if GetItemCount(2,1,30346) < 68 then
		Talk(1,"","C�c h� kh�ng �em �� <color=yellow>68<color> m�nh b�ch kim, sao ta c� th� gi�p?")
		return 0
	end
	
	if GetItemCount(2,1,1009) < 199 then
		Talk(1,"","C�c h� kh�ng �em �� <color=yellow>199<color> thi�n th�ch tinh th�ch, h�y l�y th�m nh�.")
		return 0
	end
	
	if GetCash() < 39990000 then
		Talk(1,"","H�y ��a ta �� <color=yellow>3999<color> v�ng, ta s� gi�p c�c h� n�ng c�p.")
		return 0
	end
	
	local tbBKVD_B1 = {item = {
			{gdp={0,tbItem[3],30013,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Trang b� B�ch Kim Vi�m ��"},
	}}
	local tbBKVD_B2 = {item = {
			{gdp={0,tbItem[3],30014,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Trang b� B�ch Kim Vi�m ��"},
	}}
	local tbBKVD_B3 = {item = {
			{gdp={0,tbItem[3],30015,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Trang b� B�ch Kim Vi�m ��"},
	}}
	local tbBKVD_B4 = {item = {
			{gdp={0,tbItem[3],30016,1,1,-1,-1,-1,-1,-1,-1,-1,0}, name = "Trang b� B�ch Kim Vi�m ��"},
	}}
	local tbBKVDSet = {
		[1] = tbBKVD_B1,
		[2] = tbBKVD_B2,
		[3] = tbBKVD_B3,
		[4] = tbBKVD_B4,
	}
	
	LIB_Award.szLogTitle = "NANG CAP BACH KIM VIEM DE"
	LIB_Award.szLogAction = "nh�n"
	
	if Pay(39990000) == 1 and DelItem(2,1,30346,68) == 1 and DelItem(2,1,1009,199) == 1 then
		DelItemByIndex(tbItem[1],-1)
		LIB_Award:AwardByBody(tbBKVDSet)
		Talk(1,"","N�ng c�p th�nh c�ng, trang b� B�ch Kim Vi�m �� n�y l� c�a c�c h�.")
	end
end
