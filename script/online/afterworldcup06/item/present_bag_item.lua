Include("\\script\\class\\ktabfile.lua")
tabLVEXP = new(KTabFile, "\\settings\\uplevel.txt");
Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");

function OnUse()
	local selTab = {
				"V�ng, ta kh�ng th� ��i ���c n�a./confirm",
				"Sau n�y h�y m�/nothing",
				}
	Say("M� l� bao s� ���c nhi�u v�t ph�m, xin x�c nh�n h�nh trang b�n c�n ch� tr�ng v� s�c l�c c�n �� �� tr�nh t�n th�t ��ng ti�c. B�n x�c nh�n mu�n m� l� bao?",getn(selTab),selTab);
end;

function confirm()
	if DelItem(tItemOther["present_bag"][2],tItemOther["present_bag"][3],tItemOther["present_bag"][4],1) == 1 then
		local nRandomNum = 0;
		local nRow = tonumber(tabLVEXP:selectRowNum("C�p",GetLevel()+1))
		local nExp = tonumber(tabLVEXP:getCell(nRow,"Kinh nghi�m ��ng c�p nh�n v�t"))
		local nRetCode = 0;
		if nExp < 0 or nExp > 1950000000 then	--��С��0�������99�����辭��Ϊ�쳣
			WriteLog("[L�i ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c ph�n th��ng �i�m kinh nghi�m ��c bi�t, tr� s� l�:"..nExp);
			return 0;
		end;
		nExp = floor(nExp/100);
		if nExp < 500000 then
			nExp = 500000;
		end;
		ModifyExp(nExp);
		Msg2Player("B�n nh�n ���c 1% �i�m kinh nghi�m");
		WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c 1% �i�m kinh nghi�m:"..nExp);
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRow = tonumber(tabLVEXP:selectRowNum("C�p",GetLevel()+1))
			nExp = tonumber(tabLVEXP:getCell(nRow,"Kinh nghi�m ��ng c�p nh�n v�t"))
			if nExp < 0 or nExp > 1950000000 then	--��С��0�������99�����辭��Ϊ�쳣
				WriteLog("[L�i ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c ph�n th��ng �i�m kinh nghi�m ��c bi�t, tr� s� l�:"..nExp);
				return 0;
			end;
			nExp = floor(nExp/100)*4;
			if nExp < 2000000 then
				nExp = 2000000;
			end;
			ModifyExp(nExp);
			Msg2Player("B�n nh�n ���c 4% �i�m kinh nghi�m");	
			WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c 4% �i�m kinh nghi�m:"..nExp);
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRetCode = AddItem(1,1,19,32);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c 32 T�y B�c V�ng");
				WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c 32 T�y B�c V�ng");
			else
				WriteLog("[L�i ho�t ��ng c�p th� gi�i]:"..GetName().."L�i m� l� bao nh�n ���c T�y B�c V�ng, tr� quay l�i AddItem:"..nRetCode);
			end;
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRetCode = AddItem(1,1,15,32);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c 32 b�nh B�t v�ng");
				WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c 32 b�nh B�t v�ng");
			else
				WriteLog("[L�i ho�t ��ng c�p th� gi�i]:"..GetName().."L�i m� l� bao nh�n ���c b�nh B�t v�ng, tr� quay l�i AddItem:"..nRetCode);
			end;
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 10 then
			nRetCode = AddItem(1,1,17,32);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c 32 c�i Nh� Th�p T� Ki�u Minh Nguy�t D�");
				WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c 32 Nh� Th�p T� Ki�u Minh Nguy�t D�");
			else
				WriteLog("[L�i ho�t ��ng c�p th� gi�i]:"..GetName().."L�i m� l� bao nh�n ���c 32 Nh� Th�p T� Ki�u Minh Nguy�t D�, tr� quay l�i AddItem:"..nRetCode);
			end;
		end;
		nRandomNum = random(1,100);
		if nRandomNum <= 50 then
			nRetCode = AddItem(tItemOther["transformer_card"][2],tItemOther["transformer_card"][3],tItemOther["transformer_card"][4],1);
			if nRetCode == 1 then
				Msg2Player("B�n nh�n ���c 1 "..tItemOther["transformer_card"][1]);
				WriteLog("[Vui ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c 1 "..tItemOther["transformer_card"][1]);
			else
				WriteLog("[L�i ho�t ��ng c�p th� gi�i]:"..GetName().."M� l� bao nh�n ���c "..tItemOther["transformer_card"][1].."C� l�i, tr� quay l�i AddItem:"..nRetCode);
			end;
		end;
	end;
end;

function nothing()

end;