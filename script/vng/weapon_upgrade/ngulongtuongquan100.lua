Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbNguLongTuongQuan = {
	[0] = {
		[100] = {
			[3020] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30021},
			[3021] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30022},
			[3022] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30023},
			[3023] = {1,"Li�u Ng� Long T��ng Qu�n Gi�p", 0,100,30024},
			[3016] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30017},
			[3017] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30018},
			[3018] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30019},
			[3019] = {1,"T�ng Ng� Long T��ng Qu�n Gi�p", 0,100,30020},
		},
		[101] = {
			[3020] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30021},
			[3021] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30022},
			[3022] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30023},
			[3023] = {1,"Li�u Ng� Long T��ng Qu�n Trang", 0,101,30024},
			[3016] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30017},
			[3017] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30018},
			[3018] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30019},
			[3019] = {1,"T�ng Ng� Long T��ng Qu�n Trang", 0,101,30020},
		},
		[103] = {
			[3020] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30021},
			[3021] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30022},
			[3022] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30023},
			[3023] = {1,"Li�u Ng� Long T��ng Qu�n Kh�i", 0,103,30024},
			[3016] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30017},
			[3017] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30018},
			[3018] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30019},
			[3019] = {1,"T�ng Ng� Long T��ng Qu�n Kh�i", 0,103,30020},
		},
		[102] = {
			[3044] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30025},
			[3048] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30029},
			[3052] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30033},
			[3045] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30026},
			[3049] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30030},
			[3053] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30034},
			[3046] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30027},
			[3050] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30031},
			[3054] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30035},
			[3047] = {2,"Li�u Ng� Long T��ng Qu�n L�nh B�i", 0,102,30028},
			[3051] = {2,"Li�u Ng� Long T��ng Qu�n L�nh K�", 0,102,30032},
			[3055] = {2,"Li�u Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30036},
			------------ Tong
			[3032] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30013},
			[3036] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30017},
			[3040] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30021},
			[3033] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30014},
			[3037] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30018},
			[3041] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30022},
			[3034] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30015},
			[3038] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30019},
			[3042] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30023},
			[3035] = {2,"T�ng Ng� Long T��ng Qu�n L�nh B�i", 0,102,30016},
			[3039] = {2,"T�ng Ng� Long T��ng Qu�n L�nh K�", 0,102,30020},
			[3043] = {2,"T�ng Ng� Long T��ng Qu�n L�nh Ph�", 0,102,30024},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbNguLongTuongQuan[genre] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Thi�n Chi T��ng Qu�n.")
		return 0
	end
	if tbNguLongTuongQuan[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Thi�n Chi T��ng Qu�n.")
		return 0
	end
	if tbNguLongTuongQuan[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta ch� nh�n ��i trang b� T�ng/Li�u Thi�n Chi T��ng Qu�n.")
		return 0
	end
	
	if detail ~= 102 then
		if GetEquipAttr(idx,2) < 7 then
			Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 7 tr� l�n.")
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
	if tbNguLongTuongQuan[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Check material ----------------------------
	local nThienThachLinhThach, nTieuDinhHon, nDaiDinhHon, nGold = 2,1,1,5000
	if  tbNguLongTuongQuan[nG][nD][nP][1] ~= 1 then
		nThienThachLinhThach, nTieuDinhHon, nDaiDinhHon, nGold = 2,2,1,5000
	end
	if GetItemCount(2,1,1068) < nThienThachLinhThach then
		Talk(1,"",szNpcName.."Ta c�n "..nThienThachLinhThach.." Thi�n Th�ch Linh Th�ch, r�t ti�c c�c h� kh�ng c� ��.")
		return 0
	end
	if GetItemCount(2,1,1067) < nTieuDinhHon then
		Talk(1,"",szNpcName.."Ta c�n "..nTieuDinhHon.." ��nh H�n Thi�n Th�ch Th�n Th�ch, r�t ti�c c�c h� kh�ng c� ��.")
		return 0
	end
	if GetItemCount(2,1,1113) < nDaiDinhHon then
		Talk(1,"",szNpcName.."Ta c�n "..nDaiDinhHon.." ��i ��nh H�n, r�t ti�c c�c h� kh�ng c� ��.")
		return 0
	end
	if GetCash() < nGold*10000 then
		Talk(1,"",szNpcName.."Ta c�n "..nGold.." v�ng, r�t ti�c c�c h� kh�ng c� ��.")
		return 0
	end
	
	local nLevel = 0
	LIB_Award.szLogTitle = "NANG CAP TRANG BI TUONG QUAN"
	LIB_Award.szLogAction = "th�nh c�ng"
	local tbNewItem = {item={{
			gdp={tbNguLongTuongQuan[nG][nD][nP][3],tbNguLongTuongQuan[nG][nD][nP][4],tbNguLongTuongQuan[nG][nD][nP][5],1,1, -1, -1, -1, -1, -1, -1, -1, nLevel},
			name = tbNguLongTuongQuan[nG][nD][nP][2]}}
		}
	if DelItem(2,1,1068,nThienThachLinhThach) == 1 and DelItem(2,1,1067,nTieuDinhHon) == 1 and DelItem(2,1,1113,nDaiDinhHon) == 1 and Pay(nGold*10000) then
		DelItemByIndex(tbUpgradeList[1][1],-1)
		LIB_Award:Award(tbNewItem)
		Talk(1,"",szNpcName.."Chuy�n ��i  th�nh c�ng, h�y nh�n l�y " .. tbNguLongTuongQuan[nG][nD][nP][2] .. " c�a ng��i.")
	else
		Talk(1,"",szNpcName.."C�c h� kh�ng �� v�t ph�m y�u c�u, kh�ng th� ti�n h�nh n�ng c�p.")
	end
	return 1
end
