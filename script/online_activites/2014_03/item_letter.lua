--3/8����
Include("\\script\\online_activites\\head\\activity_normal_head.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\lib\\talktmp.lua")

function OnUse(nItem)
	if gf_CheckEventDateEx(115) ~= 1 then
		Talk(1,"","V�t ph�m �� qu� h�n s� d�ng")
		return
	end
	local tempSay = {};
	tempSay.msg = format("S� d�ng <color=green>%s<color> ��i ph�n th��ng, hi�n t�i c� <color=green>%d<color> c�i", "8/3 t�n v�t", GetItemCount(2, 1, 30636))
	tempSay.sel = {
		{"500000 �i�m kinh nghi�m"..format("(ti�u hao %d )", 1), "#do_exchange_letter(1)"},
		{"1000000000 �i�m kinh nghi�m"..format("(ti�u hao %d )", 999), "#do_exchange_letter(2)"},
		{"N�ng th�n ��n *1"..format("(ti�u hao %d )", 10), "#do_exchange_letter(3)"},
		{"Ti�u ki�p t�n *1"..format("(ti�u hao %d )", 9), "#do_exchange_letter(4)"},
		{"M�t t�ch s� m�n cao c�p c�p 70*7"..format("(ti�u hao %d )", 100), "#do_exchange_letter(5)"},
		{"qu�n c�ng ch��ng*1"..format("(ti�u hao %d )", 29), "#do_exchange_letter(6)"},
		{"v� ti�u y v�ng*1"..format("(ti�u hao %d )", 2000), "#do_exchange_letter(7)"},
		{"v� ti�u y b�c*1"..format("(ti�u hao %d )", 250), "#do_exchange_letter(8)"},
		{"v� ti�u y ��ng*1"..format("(ti�u hao %d )", 30), "#do_exchange_letter(9)"},
		{"��i qu�n c�ng ch��ng*1"..format("(ti�u hao %d )", 150), "#do_exchange_letter(10)"},
		{"qu�n c�ng ch��ng huy ho�ng*1"..format("(ti�u hao %d )", 750), "#do_exchange_letter(11)"},
		{"ma tinh*100"..format("(ti�u hao %d )", 300), "#do_exchange_letter(12)"},
		{"thi�n th�ch linh thach*1"..format("(ti�u hao %d )", 5900), "#do_exchange_letter(13)"},
		{"��nh h�n thi�n th�ch th�n th�ch*1"..format("(ti�u hao %d )", 5900), "#do_exchange_letter(14)"},
		{"��i ��nh h�n thi�n th�ch th�n th�ch*1"..format("(ti�u hao %d )", 5900), "#do_exchange_letter(15)"},
		{"t�ng v� kh� di�u d��ng theo m�n ph�i*1"..format("(ti�u hao %d )", 6996), "#do_exchange_letter(16)"},
		{"chuy�n sinh ��n*1"..format("(ti�u hao %d )", 3900), "#do_exchange_letter(17)"},
		{"s�ch pet t�nh n�ng c�p 2 ng�u nhi�n*1"..format("(ti�u hao %d )", 200), "#do_exchange_letter(18)"},
		{"s�ch pet t�nh n�ng c�p 3 ng�u nhi�n*1"..format("(ti�u hao %d )", 300), "#do_exchange_letter(19)"},
		{"s�ch pet t�nh n�ng c�p 4 ng�u nhi�n*1"..format("(ti�u hao %d )", 800), "#do_exchange_letter(20)"},
		{"\nK�t th�c ��i tho�i", "nothing"}
	}
	temp_Talk(tempSay);
end

function do_exchange_letter(nIndex)
	local tAward = {
		[1] = {2, 1, 500000, 1},
		[2] = {2, 999, 1000000000, 1},
		[3] = {1, 10, "Th�n N�ng ��n", {2, 1, 343, 1}, 7 * 24 * 3600},
		[4] = {1, 9, "Ti�u Ki�p t�n", {2, 0, 141, 1}, 7 * 24 * 3600},
		[5] = {31, 100, "ahf_Get70GaojiMiji(1, 7, 1)", 1},
		[6] = {1, 29, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
		[7] = {1, 2000, "V� Ti�u Y V�ng", {2, 1, 30491, 1}, 7 * 24 * 3600},
		[8] = {1, 250, "V� Ti�u Y B�c", {2, 1, 30492, 1}, 7 * 24 * 3600},
		[9] = {1, 30, "V� Ti�u Y ��ng", {2, 1, 30493, 1}, 7 * 24 * 3600},
		[10] = {1, 150, "Qu�n C�ng ��i", {2, 1, 9998, 1}, 7 * 24 * 3600},
		[11] = {1, 750, "Qu�n C�ng Huy Ho�ng", {2, 1, 9977, 1}, 7 * 24 * 3600},
		[12] = {1, 300, "Ma Tinh", {2, 1, 30497, 100}, 0},
		[13] = {1, 5900, "Thi�n Th�ch linh th�ch", {2, 1, 1068, 1}, 15 * 24 * 3600},
		[14] = {1, 5900, "��nh H�n Thi�n Th�ch Th�n Th�ch", {2, 1, 1067, 1}, 15 * 24 * 3600},
		[15] = {1, 5900, "��i ��nh H�n ", {2, 1, 1113, 1}, 15 * 24 * 3600},
		[16] = {31, 6996, "ahf_GetYaoYangWeaponRand(1)", 1},
		[17] = {1, 3900, "Chuy�n Sinh ��n ", {2, 1, 30345, 1}, 60 * 24 * 3600},
		[18] = {31, 200, "ahf_GetPetBook(2)", 1},
		[19] = {31, 300, "ahf_GetPetBook(3)", 1},
		[20] = {31, 800, "ahf_GetPetBook(4)", 1},
	}
	if not nIndex or nIndex < 1 or nIndex > getn(tAward) then
		return
	end 
	if gf_Judge_Room_Weight(7, 200, "") ~= 1 then
		return
	end
	if GetItemCount(2, 1, 30636) < tAward[nIndex][2] then
		Talk(1,"",format("trong t�i %s s� l��ng kh�ng �� %d", "8/3 t�n v�t", tAward[nIndex][2]))
		return
	end
	if DelItem(2, 1, 30636, tAward[nIndex][2]) ~= 1 then
		return
	end
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "2XU v�t ph�m", "s� d�ng t�n v�t 8/3", nIndex)
end