Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")

szNPCName = "<color=green>Long Quang Ch�n Nh�n:<color> "
tbAllowItem = {
	[2]	= {
		[0] = {
			[504] = {8,"C�y B�t Nh� Nh�",10},	--	{QuestID, ItemName, ItemQty}
			[398] = {10,"C�y B�t Nh�",8},
			[1084] = {32,"Thi�n Qu�i Th�ch",1},
		},
		[1] = {
			[30087] = {6,"T�i H�t Gi�ng",2},
			[30269] = {12,"C�y T� Linh",8},
			[30270] = {14,"Thanh Long Qu�",30},
			[30273] = {15,"Huy�n V� C�n",30},
			[30272] = {16,"B�ch H� Di�p",30},
			[30271] = {17,"H�a Ph�ng Hoa",30},
			[30164] = {18,"Nh�n",29},
			[30165] = {18,"Ch�m Ch�m",29},
			[30166] = {18,"Cam",29},
			[30167] = {18,"D�a",29},
			[30168] = {18,"M�ng C�t",29},
			[30169] = {18,"B��i",29},
			[30170] = {18,"D�u",29},
			[30171] = {18,"Chu�i",29},
			[30172] = {18,"Xo�i",29},
			[30173] = {18,"��o",29},
			[30174] = {18,"M�n",29},
			[30175] = {18,"V�i",29},
			[30176] = {18,"T�o",29},
			[30177] = {18,"B�",29},
			[30178] = {18,"�u ��",29},
			[30179] = {18,"M�ng C�u",29},
			[30180] = {18,"Kh�m",29},
			[30181] = {18,"L�",29},
			[30182] = {18,"B�n Bon",29},
			[30183] = {18,"Kh�",29},
			[30132] = {26,"V� L�m B�o H�p",100},
			[30135] = {27,"Ch�a kh�a Thanh ��ng",1},
			[30134] = {28,"Ch�a kho� B�ch Ng�n",1},
			[30133] = {29,"Ch�a Kh�a V�ng",1},
			[30071] = {30,"Nh�n S�m V�n N�m",2},
			[30130] = {31,"Phi Y�n Th�ch",2},
			[30346] = {33,"M�nh B�ch Kim",10},
			[1009] = {34,"Thi�n Th�ch Tinh Th�ch",3},
			[9999] = {37,"Qu�n C�ng Ch��ng",3},
			[9998] = {38,"Qu�n C�ng ��i",2},
			[9977] = {39,"Qu�n C�ng Huy Ho�ng",1},
		},
		[2] = {
			[7] = {35,"M�nh Thi�n th�ch",20},
			[8] = {36,"Thi�n th�ch",20},
		},
	}
}
function OnPutinCheck(param, idx, genre, detail, particular)
	--local tbCheckList = GetPutinItem();
	if PhucSinh2_CheckActive() ~= 1 then
		return 0
	end
	if PhucSinh2_GetStatus() == 1 then
		return 0
	end
	
	if tbAllowItem[genre] == nil then
		Talk(1,"",szNPCName .. "Ta ch� nh�n ��ng v�t ph�m ta y�u c�u, nh�ng th� kh�c vui l�ng c�t �i.")
		return 0
	end
	if tbAllowItem[genre][detail] == nil then
		Talk(1,"",szNPCName .. "Ta ch� nh�n ��ng v�t ph�m ta y�u c�u, nh�ng th� kh�c vui l�ng c�t �i.")
		return 0
	end
	if tbAllowItem[genre][detail][particular] == nil then
		Talk(1,"",szNPCName .. "Ta ch� nh�n ��ng v�t ph�m ta y�u c�u, nh�ng th� kh�c vui l�ng c�t �i.")
		return 0
	end
	
	if tbAllowItem[genre][detail][particular][1] ~= PhucSinh2_GetDailyMission() then
		Talk(1,"",szNPCName .. "Ta ch� nh�n ��ng v�t ph�m ta y�u c�u, nh�ng th� kh�c vui l�ng c�t �i.")
		return 0
	end
	
	return 1
end


function OnPutinComplete(param)
	local tbItem = GetPutinItem();
	local nCount = 0
	local nG, nD, nP = tbItem[1][2], tbItem[1][3], tbItem[1][4]
	
	if GetItemCount(nG,nD,nP) < tbAllowItem[nG][nD][nP][3] then
		Talk(1,"",szNPCName.."Ng��i kh�ng c� �� "..tbAllowItem[nG][nD][nP][3].." "..tbAllowItem[nG][nD][nP][2]..", h�y chu�n b� th�m.")
		return 0
	end
	
	if PhucSinh2_GetStatus() == 0 then
		if DelItem(nG,nD,nP,tbAllowItem[nG][nD][nP][3]) == 1 then
			PhucSinh2_SetStatus(1)
--			DelItemByIndex(tbItem[1][1],-1)
		end
	end
	return 1
end
