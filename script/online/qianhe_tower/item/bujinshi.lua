Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	Say("D�ng 3 m�nh H� ph� v� 1 B� Kim Th�ch ��i 1 Kim H� ph�?",2,"��ng �/ensure","H�y b�/nothing");
end

function ensure()
	local nNum1 = min(floor(GetItemCount(2,1,30435) / 3), GetItemCount(2,1,30439))
	local nNum2 = GetFreeItemRoom();
	AskClientForNumber("ensure_do", 0, min(nNum1, nNum2), "H�y nh�p s� l��ng v�o", "");
end

function ensure_do(nNum)
	for i = 1, nNum do
		if GetItemCount(2,1,30435) < 3 then
			Msg2Player("M�nh H� ph� kh�ng �� 3 c�i ");
			return
		end
		if GetItemCount(2,1,30439) < 1 then
			Msg2Player("S� l��ng B� Kim Th�ch kh�ng �� 1 c�i");
			return 
		end
		if gf_Judge_Room_Weight(1,1) ~= 1 then
			Msg2Player("Kh�ng gian h�nh trang kh�ng ��");
			return 
		end
		if DelItem(2,1,30435,3) == 1 and DelItem(2,1,30439,1) == 1 then
			gf_AddItemEx2({2,1,30438,1}, "Kim H� ph�", "C�ng chi�n Thi�n T�m Th�p", "��i B� Kim Th�ch", 0, 1);
		end
	end
end