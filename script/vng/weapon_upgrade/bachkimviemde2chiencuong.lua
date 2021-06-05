Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong_head.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbBKVD = {
	[0] = {
		[100] = {
			[30013] = 1,[30014] = 1,[30015] = 1,[30016] = 1,
		},
		[101] = {
			[30013] = 1,[30014] = 1,[30015] = 1,[30016] = 1,
		},
		[103] = {
			[30013] = 1,[30014] = 1,[30015] = 1,[30016] = 1,
		},
	},
}


function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbBKVD[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� B�ch Kim Vi�m ��.")
		return 0
	end
	if tbBKVD[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� B�ch Kim Vi�m ��.")
		return 0
	end
	if tbBKVD[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� B�ch Kim Vi�m ��.")
		return 0
	end
	if GetEquipAttr(idx,2) < 13 then
		Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 13 tr� l�n.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nItemIndex, nG, nD, nP = tbUpgradeList[1][1], tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbBKVD[nG][nD][nP] == nil then
		return 0
	end
	-------------------- Check material ----------------------------
	local tbMaterial = {item={{gdp={2,95,204,1}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,1}, name="Thi�n M�n Kim L�nh"}, {gdp={2,1,1005,4}, name="Chi�n Th�n Ho�n"}, {gdp={2,1,30499,50}, name="Hu�n Ch��ng Anh H�ng"}}}
	local nCheck = LIB_Award:CheckMaterial(tbMaterial)
	if nCheck == 0 then
		return 0
	end
	
	local nLevel = 0
	if GetEquipAttr(nItemIndex,2) >= 14 then
		nLevel = 7
	end
	local nBody = GetBody()
	local nRoute = GetPlayerRoute()
	local tbNewItem = {}
	if tbTrangBiChienCuong[nD] == nil or tbTrangBiChienCuong[nD][nBody] == nil or tbTrangBiChienCuong[nD][nBody][nRoute] == nil then
		return 0
	end
	tbNewItem = tbTrangBiChienCuong[nD][nBody][nRoute]
	LIB_Award.szLogTitle = "NANG CAP BACH KIM VIEM DE  - CHIEN CUONG"
	LIB_Award.szLogAction = "th�nh c�ng"
	tbNewItem["item"][1]["gdp"][13] = nLevel
	LIB_Award:PayMaterial(tbMaterial)
	DelItemByIndex(nItemIndex,-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y trang b� Chi�n Cu�ng c�a ng��i.")
	return 1
end
