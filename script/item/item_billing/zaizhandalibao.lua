Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 1 then
		local selTab = {
					format("��ng �/#use_yes(%d)",nItemIdx),
					"H�y b�/nothing",
					}
		Say("B�n mu�n m� T�i chi�n giang h�-��i l� bao?",getn(selTab),selTab);
	else
		Talk(1,"","B�n ph�i gia nh�p l�u ph�i m�i c� th� s� d�ng T�i chi�n giang h�-��i l� bao.");
	end;
end;

function use_yes(nIdx)
	if gf_JudgeRoomWeight(10,300) == 0 then
		Talk(1,"","Kho�ng tr�ng h�nh trang ho�c s�c l�c kh�ng ��, xin ki�m tra l�i!");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	if DelItemByIndex(nIdx,1) == 1 then
		Earn(10000000);
		nRetCode,nItemIdx = AddItem(2,1,1003,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 K� L�n ho�n");
		nRetCode,nItemIdx = AddItem(2,1,1056,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 N�ng Tang ph�");
		nRetCode,nItemIdx = AddItem(2,1,1068,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B�n nh�n ���c 1 Thi�n Th�ch linh th�ch");
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
		nRetCode,nItemIdx = AddItem(0,102,28,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("B�n nh�n ���c 1 s�i ��i L�c Th�n h�ng li�n");
		WriteLog("[T�i chi�n giang h�-��i l� bao]:"..GetName().." �� s� d�ng 1 T�i chi�n giang h�-��i l� bao")
	end;
end;

function nothing()

end;
