Include("\\script\\lib\\globalfunctions.lua");
function OnUse()
	local selTab = {
				"V�ng, ta kh�ng th� ��i ���c n�a./use",
				"Th�i, �� sau h�y m�./nothing",
				}
	Say("B�n trong t�i qu� c� r�t nhi�u v�t ph�m, xin x�c nh�n h�nh trang �� kho�ng tr�ng v� s�c l�c, b�n mu�n m� kh�ng?",getn(selTab),selTab);
end;

function use()
	if gf_JudgeRoomWeight(6,300) ~= 1 then
		Talk(1,"","B�n kh�ng �� ch� ho�c kh�ng �� s�c l�c, h�y s�p x�p l�i v� m� bao l� x� b�nh �t.")
		return 0;
	end;
	if DelItem(2,1,966,1) == 1 then
		local nRand = random(1,100);
		if nRand <= 25 then
			if AddItem(2,1,390,100) == 1 then
				Msg2Player("B�n �� nh�n ���c 100 c�i b�nh �t nh�n tr�ng.");
			end;
		elseif nRand <= 50 then
			if AddItem(2,1,388,50) == 1 then
				Msg2Player("B�n �� nh�n ���c 50 c�i b�nh �t nh�n th�t.");
			end;
		elseif nRand <= 70 then
			if AddItem(2,1,391,50) == 1 then
				Msg2Player("B�n �� nh�n ���c 50 c�i b�nh �t th�p c�m.");
			end;
		elseif nRand <= 90 then
			if AddItem(2,1,389,50) == 1 then
				Msg2Player("B�n �� nh�n ���c 50 c�i b�nh �t m�t.");
			end;
		else
			if AddItem(2,1,392,5) == 1 then
				Msg2Player("B�n �� nh�n ���c 5 c�i b�nh �t gia h�ng.");
			end;
		end;
	end;
end;

function nothing()

end;