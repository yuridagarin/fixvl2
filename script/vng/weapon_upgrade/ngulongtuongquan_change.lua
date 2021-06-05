Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbNguLongTuongQuan = {
	[0] = {
		[100] = {
			[30017] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30021},
			[30018] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30022},
			[30019] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30023},
			[30020] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30024},
			[30021] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30017},
			[30022] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30018},
			[30023] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30019},
			[30024] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30020},
		},
		[101] = {
			[30017] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30021},
			[30018] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30022},
			[30019] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30023},
			[30020] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30024},
			[30021] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30017},
			[30022] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30018},
			[30023] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30019},
			[30024] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30020},
		},
		[103] = {
			[30017] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30021},
			[30018] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30022},
			[30019] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30023},
			[30020] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30024},
			[30021] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30017},
			[30022] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30018},
			[30023] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30019},
			[30024] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30020},
		},
		[102] = {
			[30013] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30025},
			[30017] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30029},
			[30021] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30033},
			[30014] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30026},
			[30018] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30030},
			[30022] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30034},
			[30015] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30027},
			[30019] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30031},
			[30023] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30035},
			[30016] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30028},
			[30020] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30032},
			[30024] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30036},
			------------ Tong
			[30025] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30013},
			[30029] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30017},
			[30033] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30021},
			[30026] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30014},
			[30030] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30018},
			[30034] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30022},
			[30027] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30015},
			[30031] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30019},
			[30035] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30023},
			[30028] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30016},
			[30032] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30020},
			[30036] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30024},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	local nCuonghoa = GetTaskTemp(TSK_TMP_CHUYENDOITRANGBI)
	if tbNguLongTuongQuan[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Ng� Long T��ng Qu�n.")
		return 0
	end
	if tbNguLongTuongQuan[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Ng� Long T��ng Qu�n.")
		return 0
	end
	if tbNguLongTuongQuan[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Ng� Long T��ng Qu�n.")
		return 0
	end
	if nCuonghoa < 0 then
		if detail ~= 102 then
			Talk(1,"",szNpcName .. "C�c h� ch� ���c ��t v�o ng�c b�i T�ng/Li�u Ng� Long T��ng Qu�n.")
			return 0
		end
	else
		if detail == 102 then
			Talk(1,"",szNpcName .. "C�c h� ch� ���c ��t v�o trang b� T�ng/Li�u Ng� Long T��ng Qu�n.")
			return 0
		end
	end
	if detail ~= 102 then
		if GetEquipAttr(idx,2) < nCuonghoa then
			Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a "..nCuonghoa.." tr� l�n.")
			return 0
		end
	end
	return 1
end


function OnPutinComplete(param)
	local nCuonghoa = GetTaskTemp(TSK_TMP_CHUYENDOITRANGBI)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbNguLongTuongQuan[nG][nD][nP] == nil then
		return 0
	end

	-------------------- Check material ----------------------------
	local tbMaterial = {
		[1] = {item={{gdp={2,1,1009,5}, name="Thi�n Th�ch Tinh Th�ch"}}, nGold = 10000000},
		[2] = {item={{gdp={2,1,1009,10}, name="Thi�n Th�ch Tinh Th�ch"}}, nGold = 20000000}
	}
	local nIndex = tbNguLongTuongQuan[nG][nD][nP][1]
	local nCheck = LIB_Award:CheckMaterial(tbMaterial[nIndex])
	if nCheck == 0 then
		return 0
	end

	LIB_Award.szLogTitle = "CHUYEN DOI TRANG BI NGU LONG TUONG QUAN "..nCuonghoa
	LIB_Award.szLogAction = "th�nh c�ng"
	local nLevel = nCuonghoa
	if nIndex ==2 then
		nLevel = 0
	end
	local tbNewItem = {item={{
			gdp={tbNguLongTuongQuan[nG][nD][nP][3],tbNguLongTuongQuan[nG][nD][nP][4],tbNguLongTuongQuan[nG][nD][nP][5],1,1, -1, -1, -1, -1, -1, -1, -1, nLevel},
			name = tbNguLongTuongQuan[nG][nD][nP][2]}}
		}
	LIB_Award:PayMaterial(tbMaterial[nIndex])
	DelItemByIndex(tbUpgradeList[1][1],-1)
	LIB_Award:Award(tbNewItem)
	Talk(1,"",szNpcName.."Chuy�n ��i  th�nh c�ng, h�y nh�n l�y " .. tbNguLongTuongQuan[nG][nD][nP][2] .. " c�a ng��i.")
	return 1
end
