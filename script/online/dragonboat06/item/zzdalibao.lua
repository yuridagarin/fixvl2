Include("\\script\\lib\\globalfunctions.lua");
function OnUse()
	local selTab = {
				"V�ng, ta kh�ng th� ��i ���c n�a./use",
				"Th�i, �� sau h�y m�./nothing",
				}
	Say("Trong bao l� x� b�nh �t c� r�t nhi�u v�t ph�m, h�y s�p x�p l�i h�nh trang, �� tr�nh nh�ng t�n th�t kh�ng ��ng c�, b�n c� mu�n m� bao l� x� b�nh �t kh�ng?",getn(selTab),selTab);
end;

function use()
	if gf_JudgeRoomWeight(6,300) ~= 1 then
		Talk(1,"","B�n kh�ng �� ch� ho�c kh�ng �� s�c l�c, h�y s�p x�p l�i v� m� bao l� x� b�nh �t.")
		return 0;
	end;
	if DelItem(2,1,393,1) == 1 then
		if AddItem(2,1,390,100) == 1 then
			Msg2Player("B�n �� nh�n ���c 100 c�i b�nh �t nh�n tr�ng.");
		end;
		if AddItem(2,1,388,50) == 1 then
			Msg2Player("B�n �� nh�n ���c 50 c�i b�nh �t nh�n th�t.");
		end;
		if AddItem(2,1,389,50) == 1 then
			Msg2Player("B�n �� nh�n ���c 50 c�i b�nh �t m�t.");
		end;
		if AddItem(2,1,391,50) == 1 then
			Msg2Player("B�n �� nh�n ���c 50 c�i b�nh �t th�p c�m.");
		end;
		if AddItem(2,1,392,5) == 1 then
			Msg2Player("B�n �� nh�n ���c 5 c�i b�nh �t gia h�ng.");
		end;
		WriteLog("[Bao l� x� b�nh �t]:"..GetName().."M� bao l� x� b�nh �t.");
	end;
end;

function nothing()

end;