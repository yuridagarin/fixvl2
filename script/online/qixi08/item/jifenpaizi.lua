--������ 
--by vivi
--2008/11/06

function OnUse()
	local nPoint = GetTask(1351);
	if nPoint >= 200 then
		Talk(1,"","D�ng T�ch l�y b�i ��i 10 �i�m t�ch l�y, nhi�u nh�t l� 200 �i�m, hi�n gi� ng��i �� �� 200 �i�m, kh�ng th� s� d�ng n�a.");
		return 0;
	end
	Say("D�ng T�ch l�y b�i ��i 10 �i�m t�ch l�y, nhi�u nh�t l� 200 �i�m, �i�m hi�n gi� c�a ng��i l�: <color=yellow>"..GetTask(1351).."<color>, ng��i x�c nh�n mu�n s� d�ng ch�?",
		2,
		"\n��ng/ask_use_num",
		"\nKh�ng c�n/nothing");
end

function ask_use_num()
	local nPoint = GetTask(1351);
	local nNum = ceil((200-nPoint)/10);
	local nPai = GetItemCount(2,0,1089);
	AskClientForNumber("confirm_give_jifen", 1, min(nNum,nPai), "Ng��i mu�n d�ng bao nhi�u T�ch l�y b�i?");
end

function confirm_give_jifen(nCount)
	if GetItemCount(2,0,1089) < nCount then
		Talk(1,"","T�ch l�y b�i tr�n ng��i ng��i kh�ng ��.");
		return 0;
	end
	if DelItem(2,0,1089,nCount) == 1 then
		SetTask(1351,GetTask(1351)+nCount*10);
		if GetTask(1351) >= 200 then
			SetTask(1351,200);
			Msg2Player("B�n nh�n ���c "..(nCount*10).."�i�m t�ch l�y ho�t ��ng");
			Msg2Player("�i�m c�a ng��i �� �� 200, m�i ng��i nhi�u nh�t ch� c� th� t�ch l�y 200 �i�m.");
		else
			Msg2Player("B�n nh�n ���c "..(nCount*10).."�i�m t�ch l�y ho�t ��ng");
		end
	end
end

function nothing()

end