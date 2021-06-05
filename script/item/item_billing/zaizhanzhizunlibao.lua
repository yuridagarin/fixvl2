Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 1 then
		local selTab = {
					format("��ng �/#use_yes(%d)",nItemIdx),
					"H�y b�/nothing",
					}
		Say("B�n mu�n m� T�i chi�n giang h�-Ch� t�n l� bao?",getn(selTab),selTab);
	else
		Talk(1,"","B�n ph�i gia nh�p l�u ph�i m�i c� th� s� d�ng T�i chi�n giang h�-Ch� t�n l� bao.");
	end;
end;

tBFYWeapon = 
{
[2]  = {{"Ph� Y�n �ao",0,3,6001},{"Ph� Y�n c�n",0,5,6002}},
[3]  = {{"Ph� Y�n tr��ng",0,8,6003}},
[4]  = {{"H�m Y�n th�",0,0,6004}},
[6]  = {{"T�ng Y�n ch�m",0,1,6005}},
[8]  = {{"Phi Y�n ki�m",0,2,6006}},
[9]  = {{"V�n Y�n c�m",0,10,6007}},
[11] = {{"V�n Y�n th�",0,0,6008}},
[12] = {{"L�u Y�n c�n",0,5,6009}},
[14] = {{"Huy�n Y�n ki�m",0,2,6010}},
[15] = {{"V� Y�n b�t",0,9,6011}},
[17] = {{"H� Ti�m Th��ng",0,6,6012}},
[18] = {{"H�nh Y�n Cung",0,4,6013}},
[20] = {{"Tr�c Y�n nh�n",0,7,6014}},
[21] = {{"Y�u Y�n tr�o",0,11,6015}},
}

function use_yes(nIdx)
	if gf_JudgeRoomWeight(20,600) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m l�i!");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	if DelItemByIndex(nIdx,1) == 1 then
		Earn(50000000);		
		nRetCode,nItemIdx = AddItem(2,1,1002,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 Long Huy�t ho�n");
		nRetCode,nItemIdx = AddItem(2,1,1003,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 K� L�n ho�n");	
		nRetCode,nItemIdx = AddItem(2,1,1004,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 Ph�ng Huy�t ho�n");
		nRetCode,nItemIdx = AddItem(2,1,1005,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 Chi�n Th�n ho�n");
		nRetCode,nItemIdx = AddItem(2,1,1056,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 N�ng Tang ph�");
		nRetCode,nItemIdx = AddItem(2,1,1068,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 Thi�n Th�ch linh th�ch");
		nRetCode,nItemIdx = AddItem(2,1,1067,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 ��nh H�n Thi�n Th�ch linh th�ch");
		nRetCode,nItemIdx = AddItem(2,1,1051,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 bao Thi�n Th�ch tinh th�ch");
		nRetCode,nItemIdx = AddItem(2,1,1059,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 b�o r��ng T�ng Ki�m ��u qu�n");
		nRetCode,nItemIdx = AddItem(2,1,1060,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 b�o r��ng T�ng Ki�m y gi�p");
		nRetCode,nItemIdx = AddItem(2,1,1061,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 b�o r��ng T�ng Ki�m hoa kh�");
		nRetCode,nItemIdx = AddItem(2,1,1062,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 b�o r��ng T�ng Ki�m trang s�c");
		nRetCode,nItemIdx = AddItem(2,1,1063,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 b�o r��ng v� kh� T�ng Ki�m");
		local nRand = 0;
		nRand = random(38,40)
		if nRand == 38 then
			nRetCode,nItemIdx = AddItem(0,102,nRand,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("B�n nh�n ���c 1 T�ng Ki�m b�o ch�u");		
		elseif nRand == 39 then
			nRetCode,nItemIdx = AddItem(0,102,nRand,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("B�n nh�n ���c 1 T�ng Ki�m k� th�ch");			
		else
			nRetCode,nItemIdx = AddItem(0,102,nRand,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("B�n nh�n ���c 1 T�ng Ki�m kim �n");			
		end;
		local nSex = GetSex();
		nRand = random(1,2);
		if nSex == 1 then
			if nRand == 1 then
				nRetCode,nItemIdx = AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B�n nh�n ���c 1 ��ng Ph��ng Long Ch�u");				
			else
				nRetCode,nItemIdx = AddItem(0,102,43,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B�n nh�n ���c 1 H�u Ngh� L�c Nh�t Ho�n");				
			end;
		else
			if nRand == 1 then
				nRetCode,nItemIdx = AddItem(0,102,42,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B�n nh�n ���c 1 H�ng Nga Nguy�t V� ��i");				
			else
				nRetCode,nItemIdx = AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B�n nh�n ���c 1 ��ng Ph��ng Long Ch�u");			
			end;		
		end;
		local nBody = GetBody();
		nRand = random(1,3);
		if nRand == 1 then
				nRetCode,nItemIdx = AddItem(0,103,94+nBody,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B�n nh�n ���c 1 T�ng Ki�m T� Kim m�o");			
		elseif nRand == 2 then
				nRetCode,nItemIdx = AddItem(0,100,94+nBody,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B�n nh�n ���c 1 T�ng Ki�m Kim L� th��ng");			
		else
				nRetCode,nItemIdx = AddItem(0,101,94+nBody,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B�n nh�n ���c 1 T�ng Ki�m � kim trang");			
		end;
		local nRoute = GetPlayerRoute();
		local nRandWeapon = random(1,getn(tBFYWeapon[nRoute]));
		local nId1 = tBFYWeapon[nRoute][nRandWeapon][2];
		local nId2 = tBFYWeapon[nRoute][nRandWeapon][3];
		local nId3 = tBFYWeapon[nRoute][nRandWeapon][4];
		local szWeaponName = tBFYWeapon[nRoute][nRandWeapon][1];
		nRetCode,nItemIdx = AddItem(nId1,nId2,nId3,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("B�n nh�n ���c "..tostring(szWeaponName).."1 ");				
		WriteLog("[T�i chi�n giang h�-��i l� bao]:"..GetName().." �� s� d�ng 1 T�i chi�n giang h�-Ch� t�n l� bao")
	end;
end;

function nothing()

end;
