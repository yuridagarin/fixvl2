--=============================================
--Created by PhucBDB
--Upgrade weapon
--=============================================
tb_upgrade_nltq =
{
			[1] = {{0,103,30017}, "Ng� Long T�ng T��ng Qu�n Chi�n Kh�i"},
			[2] = {{0,103,30018}, "Ng� Long T�ng T��ng Qu�n Chi�n Kh�i"},
			[3] = {{0,103,30019}, "Ng� Long T�ng T��ng Qu�n Chi�n Kh�i"},
			[4] = {{0,103,30020}, "Ng� Long T�ng T��ng Qu�n Chi�n Kh�i"},
			[5] = {{0,103,30021}, "Ng� Long Li�u T��ng Qu�n Chi�n Kh�i"},
			[6] = {{0,103,30022}, "Ng� Long Li�u T��ng Qu�n Chi�n Kh�i"},
			[7] = {{0,103,30023}, "Ng� Long Li�u T��ng Qu�n Chi�n Kh�i"},
			[8] = {{0,103,30024}, "Ng� Long Li�u T��ng Qu�n Chi�n Kh�i"},
			[9] = {{0,100,30017}, "Ng� Long T�ng T��ng Qu�n Chi�n B�o"},
			[10] = {{0,100,30018}, "Ng� Long T�ng T��ng Qu�n Chi�n B�o"},
			[11] = {{0,100,30019}, "Ng� Long T�ng T��ng Qu�n Chi�n B�o"},
			[12] = {{0,100,30020}, "Ng� Long T�ng T��ng Qu�n Chi�n B�o"},
			[13] = {{0,100,30021}, "Ng� Long Li�u T��ng Qu�n Chi�n B�o"},
			[14] = {{0,100,30022}, "Ng� Long Li�u T��ng Qu�n Chi�n B�o"},
			[15] = {{0,100,30023}, "Ng� Long Li�u T��ng Qu�n Chi�n B�o"},
			[16] = {{0,100,30024}, "Ng� Long Li�u T��ng Qu�n Chi�n B�o"},
			[17] = {{0,101,30017}, "Ng� Long T�ng T��ng Qu�n Chi�n Trang"},
			[18] = {{0,101,30018}, "Ng� Long T�ng T��ng Qu�n Chi�n Trang"},
			[19] = {{0,101,30019}, "Ng� Long T�ng T��ng Qu�n Chi�n Trang"},
			[20] = {{0,101,30020}, "Ng� Long T�ng T��ng Qu�n Chi�n Trang"},
			[21] = {{0,101,30021}, "Ng� Long Li�u T��ng Qu�n Chi�n Trang"},
			[22] = {{0,101,30022}, "Ng� Long Li�u T��ng Qu�n Chi�n Trang"},
			[23] = {{0,101,30023}, "Ng� Long Li�u T��ng Qu�n Chi�n Trang"},
			[24] = {{0,101,30024}, "Ng� Long Li�u T��ng Qu�n Chi�n Trang"},
			[25] = {{0,102,30017}, "Ng� Long T�ng T��ng Qu�n L�nh K�"},
			[26] = {{0,102,30018}, "Ng� Long T�ng T��ng Qu�n L�nh K�"},
			[27] = {{0,102,30019}, "Ng� Long T�ng T��ng Qu�n L�nh K�"},
			[28] = {{0,102,30020}, "Ng� Long T�ng T��ng Qu�n L�nh K�"},
			[29] = {{0,102,30029}, "Ng� Long Li�u T��ng Qu�n L�nh K�"},
			[30] = {{0,102,30030}, "Ng� Long Li�u T��ng Qu�n L�nh K�"},
			[31] = {{0,102,30031}, "Ng� Long Li�u T��ng Qu�n L�nh K�"},
			[32] = {{0,102,30032}, "Ng� Long Li�u T��ng Qu�n L�nh K�"},
			[33] = {{0,102,30021}, "Ng� Long T�ng T��ng Qu�n L�nh Ph�"},
			[34] = {{0,102,30022}, "Ng� Long T�ng T��ng Qu�n L�nh Ph�"},
			[35] = {{0,102,30023}, "Ng� Long T�ng T��ng Qu�n L�nh Ph�"},
			[36] = {{0,102,30024}, "Ng� Long T�ng T��ng Qu�n L�nh Ph�"},
			[37] = {{0,102,30033}, "Ng� Long Li�u T��ng Qu�n L�nh Ph�"},
			[38] = {{0,102,30034}, "Ng� Long Li�u T��ng Qu�n L�nh Ph�"},
			[39] = {{0,102,30035}, "Ng� Long Li�u T��ng Qu�n L�nh Ph�"},
			[40] = {{0,102,30036}, "Ng� Long Li�u T��ng Qu�n L�nh Ph�"},
			[41] = {{0,102,30013}, "Ng� Long T�ng T��ng Qu�n L�nh B�i"},
			[42] = {{0,102,30014}, "Ng� Long T�ng T��ng Qu�n L�nh B�i"},
			[43] = {{0,102,30015}, "Ng� Long T�ng T��ng Qu�n L�nh B�i"},
			[44] = {{0,102,30016}, "Ng� Long T�ng T��ng Qu�n L�nh B�i"},
			[45] = {{0,102,30025}, "Ng� Long Li�u T��ng Qu�n L�nh B�i"},
			[46] = {{0,102,30026}, "Ng� Long Li�u T��ng Qu�n L�nh B�i"},
			[47] = {{0,102,30027}, "Ng� Long Li�u T��ng Qu�n L�nh B�i"},
			[48] = {{0,102,30028}, "Ng� Long Li�u T��ng Qu�n L�nh B�i"},
}

function upgrade_nltq_clothes()
	local tSay = {}
	tinsert(tSay, "N�ng c�p T�ng Li�u Ng� Long T��ng Qu�n Chi�n Kh�i/#Upgrade_NLTQ(0)")
	tinsert(tSay, "N�ng c�p T�ng Li�u Ng� Long T��ng Qu�n Chi�n B�o/#Upgrade_NLTQ(1)")
	tinsert(tSay, "N�ng c�p T�ng Li�u Ng� Long T��ng Qu�n Chi�n Trang/#Upgrade_NLTQ(3)")
	tinsert(tSay, "N�ng c�p T�ng Li�u Ng� Long T��ng Qu�n L�nh B�i , L�nh K�(��t trang s�c c�n n�ng c�p v�o � trang b�  ��u ti�n)/#Upgrade_NLTQ(4)")
	tinsert(tSay, "�� ta suy ngh� l�i/DoNothing")
	Say("C�c h� h�y ch�n lo�i ngo�i trang mu�n n�ng c�p:", getn(tSay), tSay)
end

function Upgrade_NLTQ(nCloth)
	if gf_JudgeRoomWeight(2,500,"<color=green>�� t� th� r�n L�u: <color>") == 0 then
		return 0;
	end
	
	local nG, nD, nP  = GetPlayerEquipInfo(nCloth)
	local cloth_index = GetPlayerEquipIndex(nCloth)
	
	if  cloth_index <= 0 then
		Talk(1,"","H�y mang trang b� tr�n ng��i tr��c r�i ��n t�m ta!")
		return
	end

	local nCheck = Check_GDP(nG, nD, nP)
	if nCheck <= 0 then
		Talk(1,"","Ngo�i trang n�ng c�p kh�ng ph� h�p!")
		return
	end
	
	local cloth_level = GetEquipAttr(cloth_index, 2)
	local	nDing = GetItemSpecialAttr(cloth_index,"DING7")
	if  nD ~= 102 and (nDing <= 0 or cloth_level < 7) then
		Talk(1,"","Trang b� c�i t�o ph�i c�p 7 tr� l�n v� c� ��nh H�n!")
		return
	end
	
	local cloth_name = GetItemName(cloth_index)
	if AbradeItem(cloth_index, 0) == 0 then
		Talk(1,"", cloth_name.." �� h�t �� b�n, kh�ng th� n�ng c�p!")
		return
	end
	
	local nResource1 = 30
	if nD == 102 then
		nResource1 = 45
	end	
	if GetItemCount(2,1,30302) < nResource1 then
		Talk(1,"","Trong h�nh trang c�a ��i hi�p kh�ng �� "..nResource1.." Ng� H�nh K� Th�ch")
		return
	end
	
	local nResource2 = 5
	if nD == 102 then
		nResource2 = 10
	end
	if GetItemCount(2,1,30321) < nResource2 then
		Talk(1,"","Trong h�nh trang c�a ��i hi�p kh�ng �� "..nResource2.." Thi�n Ngo�i L�u Tinh")
		return
	end
	
	if GetCash() < 5000000 then
		Talk(1,"","��i hi�p kh�ng �� 500 v�ng")
		return
	end
	
	UnEquipAtPosition(nCloth)
	if (DelItemByIndex(cloth_index, -1) == 1) and (DelItem(2, 1, 30302, nResource1) == 1) and (DelItem(2, 1, 30321, nResource2) == 1) and Pay(5000000) == 1 then
		local nRes, nIndex = 0, 0
		if nD ~= 102 then
			nRes, nIndex = gf_AddItemEx2({nG, nD, nP, 1,1,-1,-1,-1,-1,-1,-1,-1,7}, tb_upgrade_nltq[nCheck][2], "Cai tao trang bi Ngu Long Tuong Quan", "n�ng c�p ���c")
			if  nRes > 0 then
				SetItemSpecialAttr(nIndex,"DING7",nDing)
			end
		else
			nRes, nIndex = gf_AddItemEx2({nG, nD, nP, 1,1,-1,-1,-1,-1,-1,-1}, tb_upgrade_nltq[nCheck][2], "Cai tao trang bi Ngu Long Tuong Quan", "n�ng c�p ���c")
		end
		Talk(1,"","��i hi�p �� c�i t�o trang b� "..tb_upgrade_nltq[nCheck][2].." th�nh c�ng!")
	else
		Talk(1,"","C�i t�o trang b� th�t b�i !")
	end
end

function Check_GDP(nG, nD, nP)
	for i = 1, getn(tb_upgrade_nltq) do 
		if (tb_upgrade_nltq[i][1][1] == nG) and (tb_upgrade_nltq[i][1][2] == nD) and (tb_upgrade_nltq[i][1][3] == nP) then
			return i
		end
	end
	return 0
end

function DoNothing()

end