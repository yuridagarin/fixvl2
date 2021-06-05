Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbThuongUngNguyenSoai = {
	[0] = {
		[100] = {
			[30037] = {1,"Li�u Th��ng �ng So�i Gi�p", 0,100,30049},
			[30038] = {1,"Li�u Th��ng �ng So�i Gi�p", 0,100,30050},
			[30039] = {1,"Li�u Th��ng �ng So�i Gi�p", 0,100,30051},
			[30040] = {1,"Li�u Th��ng �ng So�i Gi�p", 0,100,30052},
			[30049] = {1,"T�ng Th��ng �ng So�i Gi�p", 0,100,30037},
			[30050] = {1,"T�ng Th��ng �ng So�i Gi�p", 0,100,30038},
			[30051] = {1,"T�ng Th��ng �ng So�i Gi�p", 0,100,30039},
			[30052] = {1,"T�ng Th��ng �ng So�i Gi�p", 0,100,30040},
		},
		[101] = {
			[30037] = {1,"Li�u Th��ng �ng So�i Trang", 0,101,30049},
			[30038] = {1,"Li�u Th��ng �ng So�i Trang", 0,101,30050},
			[30039] = {1,"Li�u Th��ng �ng So�i Trang", 0,101,30051},
			[30040] = {1,"Li�u Th��ng �ng So�i Trang", 0,101,30052},
			[30049] = {1,"T�ng Th��ng �ng So�i Trang", 0,101,30037},
			[30050] = {1,"T�ng Th��ng �ng So�i Trang", 0,101,30038},
			[30051] = {1,"T�ng Th��ng �ng So�i Trang", 0,101,30039},
			[30052] = {1,"T�ng Th��ng �ng So�i Trang", 0,101,30040},
		},
		[103] = {
			[30037] = {1,"Li�u Th��ng �ng So�i Kh�i", 0,103,30049},
			[30038] = {1,"Li�u Th��ng �ng So�i Kh�i", 0,103,30050},
			[30039] = {1,"Li�u Th��ng �ng So�i Kh�i", 0,103,30051},
			[30040] = {1,"Li�u Th��ng �ng So�i Kh�i", 0,103,30052},
			[30049] = {1,"T�ng Th��ng �ng So�i Kh�i", 0,103,30037},
			[30050] = {1,"T�ng Th��ng �ng So�i Kh�i", 0,103,30038},
			[30051] = {1,"T�ng Th��ng �ng So�i Kh�i", 0,103,30039},
			[30052] = {1,"T�ng Th��ng �ng So�i Kh�i", 0,103,30040},
		},
		[102] = {
			[30064] = {2,"Li�u Th��ng �ng So�i H�", 0,102,30100},
			[30068] = {2,"Li�u Th��ng �ng So�i L�nh", 0,102,30104},
			[30072] = {2,"Li�u Th��ng �ng So�i Ph�", 0,102,30108},
			[30076] = {2,"Li�u Th��ng �ng So�i K�", 0,102,30112},
			[30065] = {2,"Li�u Th��ng �ng So�i H�", 0,102,30101},
			[30069] = {2,"Li�u Th��ng �ng So�i L�nh", 0,102,30105},
			[30073] = {2,"Li�u Th��ng �ng So�i Ph�", 0,102,30109},
			[30077] = {2,"Li�u Th��ng �ng So�i K�", 0,102,30113},
			[30066] = {2,"Li�u Th��ng �ng So�i H�", 0,102,30102},
			[30070] = {2,"Li�u Th��ng �ng So�i L�nh", 0,102,30106},
			[30074] = {2,"Li�u Th��ng �ng So�i Ph�", 0,102,30110},
			[30078] = {2,"Li�u Th��ng �ng So�i Hi�u", 0,102,30114},
			[30067] = {2,"Li�u Th��ng �ng So�i H�", 0,102,30103},
			[30071] = {2,"Li�u Th��ng �ng So�i L�nh", 0,102,30107},
			[30075] = {2,"Li�u Th��ng �ng So�i Ph�", 0,102,30111},
			[30079] = {2,"Li�u Th��ng �ng So�i K�", 0,102,30115},
			------------ Tong
			[30100] = {2,"T�ng Th��ng �ng So�i H�", 0,102,30064},
			[30104] = {2,"T�ng Th��ng �ng So�i L�nh", 0,102,30068},
			[30108] = {2,"T�ng Th��ng �ng So�i Ph�", 0,102,30072},
			[30112] = {2,"T�ng Th��ng �ng So�i K�", 0,102,30076},
			[30101] = {2,"T�ng Th��ng �ng So�i H�", 0,102,30065},
			[30105] = {2,"T�ng Th��ng �ng So�i L�nh", 0,102,30069},
			[30109] = {2,"T�ng Th��ng �ng So�i Ph�", 0,102,30073},
			[30113] = {2,"T�ng Th��ng �ng So�i K�", 0,102,30077},
			[30102] = {2,"T�ng Th��ng �ng So�i H�", 0,102,30066},
			[30106] = {2,"T�ng Th��ng �ng So�i L�nh", 0,102,30070},
			[30110] = {2,"T�ng Th��ng �ng So�i Ph�", 0,102,30074},
			[30114] = {2,"T�ng Th��ng �ng So�i Hi�u", 0,102,30078},
			[30103] = {2,"T�ng Th��ng �ng So�i H�", 0,102,30067},
			[30107] = {2,"T�ng Th��ng �ng So�i L�nh", 0,102,30071},
			[30111] = {2,"T�ng Th��ng �ng So�i Ph�", 0,102,30075},
			[30115] = {2,"T�ng Th��ng �ng So�i K�", 0,102,30079},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbThuongUngNguyenSoai[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Th��ng �ng Nguy�n So�i.")
		return 0
	end
	if tbThuongUngNguyenSoai[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Th��ng �ng Nguy�n So�i.")
		return 0
	end
	if tbThuongUngNguyenSoai[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Th��ng �ng Nguy�n So�i.")
		return 0
	end
	
	if detail ~= 102 then
		if GetEquipAttr(idx,2) < 14 then
			Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 14 tr� l�n.")
			return 0
		end
	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbThuongUngNguyenSoai[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,1009,35}, name="Thi�n Th�ch Tinh Th�ch"}}, nGold = 50000000},
		[2] = {item={{gdp={2,1,1009,50}, name="Thi�n Th�ch Tinh Th�ch"}}, nGold = 50000000}
	}
	local nIndex = tbThuongUngNguyenSoai[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end

	LIB_Award.szLogTitle = "CHUYEN DOI TRANG BI THUONG UNG NGUYEN SOAI"
	LIB_Award.szLogAction = "th�nh c�ng"
	local nLevel = 14
	if nIndex ==2 then
		nLevel = 0
	end
	local tbNewItem = {item={{
			gdp={tbThuongUngNguyenSoai[nG][nD][nP][3],tbThuongUngNguyenSoai[nG][nD][nP][4],tbThuongUngNguyenSoai[nG][nD][nP][5],1,1, -1, -1, -1, -1, -1, -1, -1, nLevel},
			name = tbThuongUngNguyenSoai[nG][nD][nP][2]}}
		}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."Chuy�n ��i  th�nh c�ng, h�y nh�n l�y " .. tbThuongUngNguyenSoai[nG][nD][nP][2] .. " c�a ng��i.")
	return 1
end
