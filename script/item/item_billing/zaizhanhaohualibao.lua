Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 1 then
		local selTab = {
					format("��ng �/#use_yes(%d)",nItemIdx),
					"H�y b�/nothing",
					}
		Say("B�n mu�n m� T�i chi�n giang h�-H�o hoa l� bao?",getn(selTab),selTab);
	else
		Talk(1,"","B�n ph�i gia nh�p l�u ph�i m�i c� th� s� d�ng T�i chi�n giang h�-H�o hoa l� bao.");
	end;
end;

function use_yes(nIdx)
	if gf_JudgeRoomWeight(16,400) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	if DelItemByIndex(nIdx,1) == 1 then
		Earn(20000000);		
		nRetCode,nItemIdx = AddItem(2,1,1002,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 Long Huy�t ho�n");
		nRetCode,nItemIdx = AddItem(2,1,1003,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 K� L�n ho�n");	
		nRetCode,nItemIdx = AddItem(2,1,1004,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 Ph�ng Huy�t ho�n");
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
		nRetCode,nItemIdx = AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("B�n nh�n ���c 1 ��ng Ph��ng Long Ch�u");
		local nRand = random(38,40)
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
		WriteLog("[T�i chi�n giang h�-��i l� bao]:"..GetName().." �� s� d�ng 1 T�i chi�n giang h�-H�o hoa l� bao")
	end;
end;

function nothing()

end;
