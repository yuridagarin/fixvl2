Include("\\script\\online\\viet_event\\pet_instance\\head.lua")

function main()
	Say("B�n ��o ph�ng m�nh C�u Thi�n Huy�n N� ��n nh�n gian �� h�a m�i ng��i ��n Th�i H� Huy�n C�nh. Tr�n ���ng �i th� ch� c�n c� b�n ��ng h�nh �i k�m theo, ng��i c� c�n g� c�n h�i kh�ng?",
		3, 
		"L�m sao v�o ���c Th�i H� Huy�n C�nh c�ng b�n ��ng h�nh?/Ruhe",
		--"Ta mu�n mua T�i Th�c Ph�m (1 Xu)/buy_pet_food"),
		"Ta mu�n mua Th�i H� �a M�t Qu� (50 Xu)/buy_god_fruit",
--		"Xin ch�n nh�n d�n ���ng cho t�i h�!/EnterTx",  -- CloseFeature
		"Ta ch� h�i th�i!/no")
end

function CloseFeature()
	Talk(1,"","T�nh n�ng Th�i H� Huy�n C�nh c�ng b�n ��ng h�nh  �ang t�m ��ng, ��i hi�p h�y quay l�i sau !!!")
end

function buy_pet_food()
	if gf_JudgeRoomWeight(2, 100) == 0 then
		return
	end
	
	if GetItemCount(2,1,30230) < 1 then
		Talk(1, "", "Ng��i kh�ng mang theo �� ti�n th� sao mua ���c!")
		return
	end
	
	if DelItem(2,1,30230,1) == 1 then
		gf_AddItemEx2({2,1,30159,1}, "T�i th�c ph�m", "Bac Dau Lao Nhan", "mua")
	end
	main()
end

function buy_god_fruit()
	if gf_JudgeRoomWeight(2, 100) == 0 then
		return
	end
	
	if GetItemCount(2,1,30230) < 50 then
		Talk(1, "", "Ng��i kh�ng mang theo �� ti�n th� sao mua ���c!")
		return
	end
	
	if DelItem(2,1,30230,50) == 1 then
		gf_AddItemEx2({2,1,387,1}, "Th�i H� �a M�t Qu�", "Bac Dau Lao Nhan", "mua", 7 * 24 * 3600)
	end
	main()
end