Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	Say("C� mu�n m� ra kh�ng?",2,"��ng �/ensure","H�y b�/nothing")
end

function ensure()
	if gf_Judge_Room_Weight(1,1) ~= 1 then
		Msg2Player("Kh�ng gian h�nh trang kh�ng ��");
		return
	end
	if GetItemCount(2,1,30441) < 1 then
		Msg2Player("Kh�ng ph�t hi�n B� Kim Th�ch bao l�n c� th� m� ra");
		return
	end
	if DelItem(2,1,30441,1) == 1 then
		gf_AddItemEx2({2,1,30439,50}, "B� Kim Th�ch bao l�n", "C�ng chi�n Thi�n T�m Th�p", "M� B� Kim Th�ch bao l�n", 0, 1);
	end	
end