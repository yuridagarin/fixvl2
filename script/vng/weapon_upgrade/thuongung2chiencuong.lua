Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\weapon_upgrade\\chiencuong10_head.lua");

szNpcName = "<color=green>Th��ng Nh�n B�o R��ng: <color>"
tbThuongUng = {
	[0] = {
		[100] = {
			[30033] = 1,
			[30034] = 1,
			[30035] = 1,
			[30036] = 1,
			[30045] = 1,
			[30046] = 1,
			[30047] = 1,
			[30048] = 1,
		},
		[101] = {
			[30033] = 1,
			[30034] = 1,
			[30035] = 1,
			[30036] = 1,
			[30045] = 1,
			[30046] = 1,
			[30047] = 1,
			[30048] = 1,
		},
		[103] = {
			[30033] = 1,
			[30034] = 1,
			[30035] = 1,
			[30036] = 1,
			[30045] = 1,
			[30046] = 1,
			[30047] = 1,
			[30048] = 1,
		},
	},
}


function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbThuongUng[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� Th��ng �ng T��ng Qu�n.")
		return 0
	end
	if tbThuongUng[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� Th��ng �ng T��ng Qu�n.")
		return 0
	end
	if tbThuongUng[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� Th��ng �ng T��ng Qu�n.")
		return 0
	end
	if GetEquipAttr(idx,2) < 11 then
		Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 11 tr� l�n.")
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
	if tbThuongUng[nG][nD][nP] == nil then
		return 0
	end
	-------------------- Check material ----------------------------
	local tbMaterial = {
		item={{gdp={2,1,1005,3}, name="Chi�n Th�n Ho�n"}, {gdp={2,1,30498,100}, name="Huy Ch��ng D�ng S�"}},
	}
	
	local nCheck = LIB_Award:CheckMaterial(tbMaterial)
	if nCheck == 0 then
		return 0
	end
	
	local nBody = GetBody()
	local nRoute = GetPlayerRoute()
	if tbTrangBiChienCuong10[nD] == nil or tbTrangBiChienCuong10[nD][nBody] == nil or tbTrangBiChienCuong10[nD][nBody][nRoute] == nil then
		return 0
	end

	LIB_Award.szLogTitle = "NANG CAP THUONG UNG  - CHIEN CUONG"
	LIB_Award.szLogAction = "th�nh c�ng"
	LIB_Award:PayMaterial(tbMaterial)
	DelItemByIndex(nItemIndex,-1)
	LIB_Award:Award(tbTrangBiChienCuong10[nD][nBody][nRoute])
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y trang b� Chi�n Cu�ng c�a ng��i.")
	return 1
end
