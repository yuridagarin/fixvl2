--07ʥ������ֱ���ű�
--by vivi
--2007/12/17

g_szThisFile = "\\script\\item\\wulinbaodian.lua";

tGaojiMiji = { --ԭ����2��Ϊ�߼��·� ����ȡ����
	[2] = {{"Kim Cang B�t Nh� Kinh",0,107,166},{"Kim Cang B�t Nh� Kinh",0,107,166},{"Kim Cang Ph�c Ma kinh",0,107,1},{"Kim Cang Ph�c Ma T�m Ph�p",0,107,2}},
	[3] = {{"V� Tr�n B� �� Kinh",0,107,168},{"V� Tr�n B� �� Kinh",0,107,168},{"V� Tr�n M�t t�ch",0,107,5},{"V� Tr�n T�m Ph�p",0,107,6}},
	[4] = {{"Ti�m Long T�ch Di�t Kinh",0,107,167},{"Ti�m Long T�ch Di�t Kinh",0,107,167},{"Ti�m Long M�t t�ch",0,107,3},{"Ti�m Long T�m Ph�p",0,107,4}},
	[6] = {{"Thi�n La Li�n Ch�u L�c",0,107,169},{"Thi�n La Li�n Ch�u L�c",0,107,169},{"Thi�n La M�t T�ch",0,107,7},{"Thi�n La T�m Ph�p",0,107,8}},
	[8] = {{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"Nh� � Kim ��nh M�t T�ch",0,107,170},{"Nh� � M�t T�ch",0,107,9},{"Nh� � T�m Ph�p",0,107,10}},
	[9] = {{"B�ch H�i Tuy�t �m Ph�",0,107,171},{"B�ch H�i Tuy�t �m Ph�",0,107,171},{"B�ch H�i Ph�",0,107,11},{"B�ch H�i T�m Ph�p",0,107,12}},
	[11] = {{"H�n ��n Tr�n Nh�c M�t T�ch"	,0,107,172},{"H�n ��n Tr�n Nh�c M�t T�ch"	,0,107,172},{"H�n ��n M�t t�ch"	,0,107,13},{"H�n ��n T�m Ph�p",0	,107,14}},
	[12] = {{"Qu� Thi�n Du Long M�t T�ch",0	,107,173},{"Qu� Thi�n Du Long M�t T�ch",0	,107,173},{"Qu� Thi�n M�t t�ch",0	,107,15},{"Qu� Thi�n T�m Ph�p",0	,107,16}},
	[14] = {{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Huy�n �nh M� Tung M�t T�ch",0,107,174},{"Huy�n �nh M�t t�ch",0,107,17},{"Huy�n �nh T�m Ph�p",0,107,18}},
	[15] = {{"Qu�n T� Ti�t Phong M�t T�ch",0	,107,175},{"Qu�n T� Ti�t Phong M�t T�ch",0	,107,175},{"Qu�n T� M�t t�ch",0	,107,19},{"Qu�n T� T�m Ph�p",0,107,20}},
	[17] = {{"Tr�n Qu�n Phi Long Th��ng Ph�"	,0,107,176},{"Tr�n Qu�n Phi Long Th��ng Ph�"	,0,107,176},{"Tr�n Qu�n M�t t�ch"	,0,107,21},{"Tr�n Qu�n T�m Ph�p",0,107,22}},
	[18] = {{"Xuy�n V�n L�c H�ng M�t T�ch",0	,107,177},{"Xuy�n V�n L�c H�ng M�t T�ch",0	,107,177},{"Xuy�n V�n M�t t�ch",0	,107,23},{"Xuy�n V�n T�m Ph�p",0	,107,24}},
	[20] = {{"U Minh Phong Ma L�c",0,107,178},{"U Minh Phong Ma L�c",0,107,178},{"U Minh Qu� L�c",0,107,25},{"U Minh T�m Ph�p",0,107,26}},
	[21] = {{"Linh C� Huy�n T� L�c",0,107,179},{"Linh C� Huy�n T� L�c",0,107,179},{"Linh C� M�t t�ch",0,107,27},{"Linh C� T�m Ph�p",0,107,28}}
};

function OnUse()
	local strtab = {
		"D�ng 5 Ng� H�nh M�t T�ch ��i 1 Ng� H�nh M�t T�ch to�n t�p (T�t nhi�n c� th� s�a ��n t�ng 10)/#change_miji(1)",
		"D�ng 1 L�ng Ba Vi B� ��i 1 L�ng Ba Vi B� to�n t�p (T�t nhi�n c� th� s�a ��n t�ng 10)/#change_miji(2)",
		"Ta mu�n d�ng M�t t�ch s� m�n s� c�p (t�m ph�p) ��i M�t t�ch s� m�n cao c�p/#change_miji(3)",
		"Ta ch� ��n xem th�/nothing"
			}
	Say("B�n �� tra V� L�m B�o �i�n, ph�t hi�n c� th� so�n th�nh M�t T�ch m�i",
		getn(strtab),
		strtab)
end

function change_miji(nType)
	if nType == 1 then
		Say("B�n x�c ��nh d�ng 5 Ng� H�nh M�t T�ch ��i 1 Ng� H�nh M�t T�ch to�n t�p? (T�t nhi�n C� th� s�a ��n t�ng 10). V� L�m B�o �i�n s� bi�n m�t.",
			2,
			"��ng �/#confirm_change_miji(1)",
			"Kh�ng, ta nh�m!/nothing");
	elseif nType == 2 then
		Say("B�n x�c ��nh d�ng 1 L�ng Ba Vi B� ��i 1 L�ng Ba Vi B� to�n t�p (T�t nhi�n C� th� s�a ��n t�ng 10) ch�? V� L�m B�o �i�n c�ng s� b� m�t!",
			2,
			"��ng �/#confirm_change_miji(2)",
			"Kh�ng, ta nh�m!/nothing");
	elseif nType == 3 then
		local nRoute = GetPlayerRoute();
		if nRoute == 0 or nRoute == 1 or nRoute == 5 or nRoute == 7 or nRoute == 10 or nRoute == 13 or nRoute ==16 or nRoute == 19 then
			Talk(1,"","<color=green>V� L�m B�o �i�n<color>: Hay l� thi�u hi�p v�o l�u ph�i tr��c r�i ��n ��i M�t t�ch s� m�n.");
			return 0;
		end		
		PutinItemBox("Giao M�t t�ch" ,1, "B�n c� mu�n ��i M�t t�ch n�y kh�ng?",g_szThisFile,1);	
	end		
end

function confirm_change_miji(nType)
	if nType == 1 then
		if GetItemCount(0,107,155) < 5 then
			Talk(1,"","Trong ng��i b�n kh�ng c� 5 Ng� H�nh M�t T�ch ");
			return
		end;
		if GetItemCount(2,1,3206) < 1 then
			Talk(1,"","Trong ng��i b�n kh�ng c� 1 V� L�m B�o �i�n ");
			return
		end;		
		if DelItem(0,107,155,5) == 1 and DelItem(2,1,3206,1) == 1 then
		local add_flag = AddItem(0,107,157,1);
		if add_flag == 1 then
			Msg2Player("Ch�c m�ng B�n nh�n ���c 1 Ng� H�nh M�t T�ch to�n t�p ");
			Msg2Global("Ng��i ch�i"..GetName().."D�ng V� L�m B�o �i�n h�y s�a ch�a ph�c h�i Ng� H�nh M�t T�ch th�nh Ng� H�nh M�t T�ch to�n t�p!");
			WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."D�ng V� L�m B�o �i�n nh�n ���c 1 Ng� H�nh M�t T�ch to�n t�p.");
		else
			WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."D�ng V� L�m B�o �i�n thu v� Ng� H�nh M�t T�ch to�n t�p th�t b�i:"..add_flag);
		end
		else
			Talk(1,"","Ph�i c� 5 Ng� H�nh M�t T�ch v� 1 V� L�m B�o �i�n m�i c� th� ��i 1 Ng� H�nh M�t T�ch to�n t�p.");
		end
	elseif nType == 2 then
	  if GetItemCount(0,112,78) < 1 then
	    Talk(1,"","Trong ng��i b�n kh�ng c� L�ng Ba Vi B�");
	    return
	  end
		if GetItemCount(2,1,3206) < 1 then
			Talk(1,"","Trong ng��i b�n kh�ng c� 1 V� L�m B�o �i�n ");
			return
		end;	  
 	  if DelItem(0,112,78,1) == 1 and DelItem(2,1,3206,1) == 1 then
 	 		local add_flag = AddItem(0,112,158,1); 
 	 		if add_flag == 1 then
 	 			Msg2Player("Ch�c m�ng B�n nh�n ���c 1 L�ng Ba Vi B� to�n t�p");
 	 			Msg2Global("Ng��i ch�i"..GetName().."D�ng V� L�m B�o �i�n h�y s�a ch�a ph�c h�i L�ng Ba Vi B� th�nh L�ng Ba Vi B� to�n t�p!");
 	 			WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."D�ng V� L�m B�o �i�n nh�n ���c 1 L�ng Ba Vi B� to�n t�p.");
 	 		else
 	 			WriteLog("07 Ho�t ��ng Gi�ng sinh: Ng��i ch�i "..GetName().."D�ng V� L�m B�o �i�n thu v� L�ng Ba Vi B� to�n t�p th�t b�i:"..add_flag);
 	 		end
 	 	else
 	 		Talk(1,"","Ph�i c� 1 L�ng Ba Vi B� v� 1 V� L�m B�o �i�n m�i c� th� ��i 1 L�ng Ba Vi B� to�n t�p.");
 	 	end
	end
end

function nothing()

end

function OnPutinCheck(nParam,nItemIdx,nID1,nID2,nID3)
	-- �����Ĳ��ý�
	if GetItemSpecialAttr(nItemIdx, "LOCK") > 0 then
		Say("<color=green>V� L�m B�o �i�n<color>: ��y l� v�t ph�m thi�u hi�p r�t qu�, thi�u hi�p �� kh�a, kh�ng th� ��i, n�u mu�n ��i th� h�y m� kh�a.", 0)
		return 0;
	end	
	local nRoute = GetPlayerRoute();
	if (nID1 == tGaojiMiji[nRoute][3][2] and nID2 == tGaojiMiji[nRoute][3][3] and nID3 == tGaojiMiji[nRoute][3][4]) or (nID1 == tGaojiMiji[nRoute][4][2] and nID2 == tGaojiMiji[nRoute][4][3] and nID3 == tGaojiMiji[nRoute][4][4])	then
		return 1
	end	

	Say("<color=green>V� L�m B�o �i�n<color>: ��y kh�ng ph�i l� v�t ta c�n, th� ta c�n l� <color=yellow>"..tGaojiMiji[nRoute][3][1].." ho�c "..tGaojiMiji[nRoute][4][1].."<color>, ng��i h�y xem k� l�i.",0);
	return 0
end

function OnPutinComplete(nParam)
	local nRoute = GetPlayerRoute();
	local tbDelItemInfo = GetPutinItem();
	local nCherk = 0;
	local nDelflag = 0;

	if (tbDelItemInfo[1][2] == tGaojiMiji[nRoute][3][2] and tbDelItemInfo[1][3] == tGaojiMiji[nRoute][3][3] and tbDelItemInfo[1][4] == tGaojiMiji[nRoute][3][4]) or (tbDelItemInfo[1][2] == tGaojiMiji[nRoute][4][2] and tbDelItemInfo[1][3] == tGaojiMiji[nRoute][4][3] and tbDelItemInfo[1][4] == tGaojiMiji[nRoute][4][4])	then
		nCherk = 1;
	end

	if nCherk ~= 1 then
		Talk(1,"","<color=green>V� L�m B�o �i�n<color>: V�t ng��i giao h�nh nh� c� ch�t v�n ��, phi�n ng��i xem l�i gi�p.");
		return 0;
	end		
	if DelItemByIndex(tbDelItemInfo[1][1],-1) == 1 and DelItem(2,1,3206,1) == 1 then
		local nAddFlag = AddItem(tGaojiMiji[nRoute][1][2],tGaojiMiji[nRoute][1][3],tGaojiMiji[nRoute][1][4],1);
		if nAddFlag == 1 then
			Talk(1,"","<color=green>V� L�m B�o �i�n<color>: Ch�c m�ng ng��i �� ��i "..tGaojiMiji[nRoute][1][1].."Th�nh c�ng.");
			WriteLog("V� L�m B�o �i�n: Ng��i ch�i"..GetName().." �� ��i ���c m�t t�ch"..tGaojiMiji[nRoute][1][1]);
		else
			WriteLog("V� L�m B�o �i�n: Ng��i ch�i"..GetName().."��i m�t t�ch"..tGaojiMiji[nRoute][1][1].." th�t b�i, k� hi�u:"..nAddFlag);
		end
	else
		Talk(1,"","<color=green>V� L�m B�o �i�n<color>: V�t ng��i giao h�nh nh� c� ch�t v�n ��, phi�n ng��i xem l�i gi�p.");
	end
end