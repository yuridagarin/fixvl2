Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>Th��ng Nh�n B�o R��ng: <color>"
tbDieuDuong = {
	[0] = {
		[102] = {
			[3185] = 3190,
			[3186] = 3191,
			[3187] = 3192,
			[3188] = 3193, 
			[3189] = 3194,
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbDieuDuong[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ng�c b�i Di�u D��ng 6%.")
		return 0
	end
	if tbDieuDuong[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ng�c b�i Di�u D��ng 6%.")
		return 0
	end
	if tbDieuDuong[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ng�c b�i Di�u D��ng 6%.")
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
	if tbDieuDuong[nG][nD][nP] == nil then
		return 0
	end
	-------------------- Check material ----------------------------
	local tbMaterial = {item={{gdp={2,95,204,19}, name="Thi�n Cang L�nh"}, {gdp={2,1,30370,39}, name="Thi�n M�n Kim L�nh"},  {gdp={2,1,30230,777}, name="Xu V�t Ph�m"}}}
	local nCheck = LIB_Award:CheckMaterial(tbMaterial)
	if nCheck == 0 then
		return 0
	end
	local szItemName = GetItemName(0,102,tbDieuDuong[nG][nD][nP])
	local tbNewItem = {}
	tbNewItem = {item={{gdp={0,102,tbDieuDuong[nG][nD][nP],1,1,-1,-1,-1,-1,-1,-1,-1}, name= szItemName}}}
	LIB_Award.szLogTitle = "NANG CAP NGOC BOI DIEU DUONG"
	LIB_Award.szLogAction = "th�nh c�ng"
	LIB_Award:PayMaterial(tbMaterial)
	DelItemByIndex(nItemIndex,-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y ng�c b�i c�a ng��i.")
	return 1
end
