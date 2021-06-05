Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	local selTab = {
				format("��ng �/#use_yes(%d)",nItemIdx),
				"H�y b�/nothing",
				}
	Say("Hi�n gi� ng��i c� mu�n m� T�n Qu� L� Bao kh�ng? C� th� ng��i s� nh�n ���c nh�ng v�t ph�m sau: 200 danh v�ng, t�i nh� Ng� Hoa Ng�c L� ho�n, t�i nh� Sinh Sinh H�a T�n, ng�a cao c�p (th�i h�n 7 ng�y), 10 b�ch c�u ho�n, 10 ��i b�ch c�u ho�n, bao m�nh Thi�n Th�ch, K� L�n ho�n<, Long Huy�t ho�n, t� nh� (th�i h�n 7 ng�y), Trang b� Ho�ng Kim m�i. Ch�c ng��i may m�n!",
		getn(selTab),
		selTab);
end;

function use_yes(nItemIdx)
	if gf_JudgeRoomWeight(16,300) == 0 then
		Talk(1,"","Kh�ng �� ch� tr�ng, s�p x�p l�i tr��c r�i h�n m�.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody();
		ModifyReputation(200,0);
		AddItem(2,1,481,1,4);
		Msg2Player("B�n nh�n ���c 1 Ng� Hoa Ng�c L� ho�n");
		AddItem(2,1,483,1,4);
		Msg2Player("B�nh nh�n ���c 1 Sinh Sinh H�a T�n");
		local nRand = random(1,100);
		local nFlag = 0;
		local nAddIdx = 0;
		if nRand <= 40 then
			nFlag,nAddIdx = AddItem(0,105,11,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng��i nh�n ���c 1 con Tr�o Ho�ng Phi �i�n");
		elseif nRand <= 80 then
			nFlag,nAddIdx = AddItem(0,105,9,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng��i nh�n ���c 1 con X�ch Th�");
		elseif nRand <= 95 then
			nFlag,nAddIdx = AddItem(0,105,12,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng��i nh�n ���c 1 con H�t L�i B�c");
		else
			nFlag,nAddIdx = AddItem(0,105,13,1,4,-1,-1,-1,-1,-1,-1);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng��i nh�n ���c 1 con B� C�nh");
		end 
		
		nRand = random(1,100);
		if nRand <= 98 then
			nFlag,nAddIdx = AddItem(2,1,1069,1,4);
			SetItemExpireTime(nAddIdx,60*60*24*7);
			Msg2Player("Ng��i nh�n ���c 1 t� nh�");
		else
			AddItem(0,110,89+nBody-1,1,4);
			Msg2Player("B�n nh�n ���c 1 Ho�ng kim gi�p kh� t�");
			AddItem(0,109,277+nBody-1,1,4);
			Msg2Player("B�n nh�n ���c 1 Ho�ng kim gi�p y ph�c");
		end
		
		nRand = random(1,10000);
		if nRand <= 6000 then
			AddItem(2,1,270,10,4);
			Msg2Player("B�n nh�n ���c 10 B�ch C�u ho�n");
		elseif nRand <= 9800 then
			AddItem(2,1,1007,10,4);
			Msg2Player("B�n nh�n ���c 10 ��i B�ch C�u ho�n");
		elseif nRand <= 9990 then
			AddItem(2,1,1049,1,4);
			Msg2Player("B�n nh�n ���c bao m�nh Thi�n Th�ch");
		elseif nRand <= 9995 then
			AddItem(2,1,1003,1,4);
			Msg2Player("B�nh nh�n ���c K� L�n ho�n");
			Msg2Global(GetName().."D�ng t�i kho�n t�n qu�, m� T�n Qu� L� Bao s� nh�n ���c ph�n th��ng K� L�n ho�n cao c�p c� gi� tr� li�n th�nh.");
			WriteLog("[T�n Qu� L� Bao]:"..GetName().."M� bao nh�n ���c 1 K� L�n ho�n.");
		else
			AddItem(2,1,1002,1,4);
			Msg2Player("B�n nh�n ���c Long Huy�t ho�n");
			Msg2Global(GetName().."D�ng t�i kho�n t�n qu�, m� T�n Qu� L� Bao s� nh�n ���c ph�n th��ng Long Huy�t ho�n cao c�p c� gi� tr� li�n th�nh.");
			WriteLog("[T�n Qu� L� Bao]:"..GetName().."M� bao nh�n ���c 1 Long Huy�t ho�n.");		
		end;
		WriteLog("[T�n Qu� L� Bao]:"..GetName().."D�ng 1 T�n Qu� L� Bao");
	end;
end;

function nothing()

end;