Include("\\script\\vng\\lib\\vnglib_award.lua");
szNpcName = "<color=green>H�c tr� th� r�n L�u: <color>"
tbVuKhiNangCap = {
	[0] = {
		[0] = {
			[14] = {86,"Th�n Quy", 0,0,15},
			[15] = {96,"�m D��ng �n", 0,0,16},
		},
		[1] = {
			[53] = {86,"Khoa Ph�", 0,1,54},
			[54] = {96,"Kh�ng C�", 0,1,55},
		},
		[2] = {
			[36] = {86,"H�a �nh", 0,2,37},
			[37] = {96,"Nha C�u", 0,2,38},
		},
		[3] = {
			[64] = {86,"L�u C�nh", 0,3,65},
			[65] = {96,"Ngh�ch L�n", 0,3,66},
		},
		[4] = {
			[119] = {86,"Vi�n ��", 0,4,120},
			[120] = {96,"B�t X� Chi X�", 0,4,121},
		},
		[5] = {
			[40] = {86,"Ng�c Tr�", 0,5,41},
			[41] = {96,"Th�n Ch�m", 0,5,42},
		},
		[6] = {
			[108] = {86,"C�u Long To�n K�ch", 0,6,109},
			[109] = {96,"Th��ng N�", 0,6,110},
		},
		[7] = {
			[12] = {86,"B�ch Th�y", 0,7,13},
			[13] = {96,"Thi�n T�n", 0,7,14},
		},
		[8] = {
			[97] = {86,"M�c Ki�n Li�n Tr��ng", 0,8,98},
			[98] = {96,"D��c S� Tr��ng", 0,8,99},
		},
		[9] = {
			[86] = {86,"Toan D�", 0,9,87},
			[87] = {96,"Th�i H�", 0,9,88},
		},
		[10] = {
			[75] = {86,"��i Th�nh Di �m", 0,10,76},
			[76] = {96,"Kh� M�c Long Ng�m", 0,10,77},
		},
		[11] = {
			[12] = {86,"V� Ng�n", 0,11,13},
			[13] = {96,"Thanh Long", 0,11,14},
		},
	},
}

function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if tbVuKhiNangCap[genre] == nil then
		Talk(1,"",szNpcName .. "Ta kh�ng nh�n r�n lo�i trang b� n�y, h�y ��a ��ng lo�i y�u c�u nh�.")
		return 0
	end
	if tbVuKhiNangCap[genre][detail] == nil then
		Talk(1,"",szNpcName .. "Ta kh�ng nh�n r�n lo�i trang b� n�y, h�y ��a ��ng lo�i y�u c�u nh�.")
		return 0
	end
	if tbVuKhiNangCap[genre][detail][particular] == nil then
		Talk(1,"",szNpcName .. "Ta kh�ng nh�n r�n lo�i trang b� n�y, h�y ��a ��ng lo�i y�u c�u nh�.")
		return 0
	end
	
	if GetEquipAttr(idx,2) < 11 then
		Talk(1,"",szNpcName .. "Trang b� ph�i ���c c��ng h�a 11 tr� l�n.")
		return 0
	end
	return 1
end


function OnPutinComplete(param)
	if gf_JudgeRoomWeight(2,500) == 0 then
		Talk(1,"",szNpcName.."H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local tbUpgradeList = GetPutinItem();
	local nG, nD, nP = tbUpgradeList[1][2], tbUpgradeList[1][3], tbUpgradeList[1][4]
	if tbVuKhiNangCap[nG][nD][nP] == nil then
		return 0
	end
	
	-------------------- Get option ID -------------------------------
	local nOp1, nLv1 = GetItemAttr(tbUpgradeList[1][1],1)
	local nOp2, nLv2 = GetItemAttr(tbUpgradeList[1][1],2)
	local nOp3, nLv3 = GetItemAttr(tbUpgradeList[1][1],3)
	
	-------------------- Check material ----------------------------
	local nThienThach, nManhThienThach, nTTTT = 390, 290, 79
	if  tbVuKhiNangCap[nG][nD][nP][1] ~= 86 then
		nThienThach, nManhThienThach, nTTTT = 390, 290, 99
	end
	if GetItemCount(2,2,8) < nThienThach then
		Talk(1,"",szNpcName.."C�c h� kh�ng c� �� "..nThienThach.." Thi�n Th�ch ta c�n.")
		return 0
	end
	if GetItemCount(2,2,7) < nManhThienThach then
		Talk(1,"",szNpcName.."C�c h� kh�ng c� �� "..nManhThienThach.." M�nh Thi�n Th�ch ta c�n.")
		return 0
	end
	if GetItemCount(2,1,1009) < nTTTT then
		Talk(1,"",szNpcName.."C�c h� kh�ng c� �� "..nTTTT.." Thi�n Th�ch Tinh Th�ch ta c�n.")
		return 0
	end
--	Talk(1,"","Item ID: "..tbUpgradeList[1][1].."\nOption ID:\n" .. nOp1 .. " - " .. nLv1 .. "\n" .. nOp2 .. " - " .. nLv2 .. "\n" .. nOp3 .. " - " .. nLv3)

	LIB_Award.szLogTitle = "NANG CAP CAP DO VU KHI"
	LIB_Award.szLogAction = "th�nh c�ng"
	local tbNewItem = {item={{
			gdp={tbVuKhiNangCap[nG][nD][nP][3],tbVuKhiNangCap[nG][nD][nP][4],tbVuKhiNangCap[nG][nD][nP][5],1,1,nLv1, nOp1, nLv2, nOp2, nLv3, nOp3, -1, 0}, 
			name = tbVuKhiNangCap[nG][nD][nP][2]}}
		}
	if DelItem(2,2,8,nThienThach) == 1 and DelItem(2,2,7,nManhThienThach) == 1 and DelItem(2,1,1009,nTTTT) == 1 then
		DelItemByIndex(tbUpgradeList[1][1],-1)
		LIB_Award:Award(tbNewItem)
		Talk(1,"",szNpcName.."N�ng c�p th�nh c�ng, h�y nh�n l�y " .. tbVuKhiNangCap[nG][nD][nP][2] .. " c�a ng��i.")
	else
		Talk(1,"",szNpcName.."C�c h� kh�ng �� v�t ph�m y�u c�u, kh�ng th� ti�n h�nh n�ng c�p.")
	end
	return 1
end
