--���ޱ���
Include("\\script\\online\\spring2014\\sp_head.lua")

function OnUse(nItem)
	if sp_IsOpenActivity() ~= 1 then
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	gf_ModifyExp(600000);
	AwardGenuineQi(1000);
	if SP_TASK_GROUP:GetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4) >= 15 then
		SP_TASK_GROUP:SetMyTaskByte(SP_TASK_GROUP.UseTimes, 3, 4, 0);
		Add_ShiMenZhenJuan();
		return 1;
	end
	local tAward = {
		{1, 200, "Thi�n Huy�n Kh�c B�n c�p 1 ", {2, 1, 30406, 1, 4}, 0},
		{1, 200, "Thi�n Huy�n Kh�c B�n c�p 2", {2, 1, 30407, 1, 4}, 0},
		{1, 100, "Thi�n Huy�n Kh�c B�n c�p 3", {2, 1, 30408, 1, 4}, 0},
		{1, 200, "C�y B�t Nh� nh�", {2, 0, 504, 1, 4}, 0},
		{1, 100, "C�y B�t Nh�", {2, 0, 398, 1, 4}, 0},
		{1, 300, "Luy�n L� Thi�t Kho�ng", {2, 1, 30537, 1, 4}, 0},
		{1, 300, "T�y T�m Th�ch Kho�ng", {2, 1, 30536, 1, 4}, 0},
		{1, 600, "C�p 1 T�y T�m Th�ch", {2, 1, 30521, 1, 4}, 0},
		{1, 600, "C�p 1 Luy�n L� Thi�t", {2, 1, 30527, 1, 4}, 0},
		{1, 200, "C�p 2 T�y T�m Th�ch", {2, 1, 30522, 1, 4}, 0},
		{1, 200, "C�p 2 Luy�n L� Thi�t", {2, 1, 30528, 1, 4}, 0},
		{1, 200, "Thi�n th�ch", {2, 2, 8, 1, 4}, 0},
		{1, 1500, "Thi�t Tinh c�p 1", {2, 1, 30533, 1, 4}, 0},
		{1, 1000, "Thi�t Tinh c�p 2", {2, 1, 30534, 1, 4}, 0},
		{1, 500, "Ti�u L�c Th�n Ho�n", {2, 1, 30309, 1, 4}, 0},
		{1, 800, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1, 4}, 0},
		{1, 100, "B�ch C�u Ho�n", {2, 1, 270, 1, 4}, 0},
		{1, 100, "Tam Thanh ho�n", {2, 1, 1097, 1, 4}, 0},
		{1, 100, "L�c Th�n ho�n", {2, 1, 1064, 1, 4}, 0},
		{1, 295, "Th�n N�ng ��n", {2, 1, 343, 1, 4}, 0},
		{1, 100, "��i Nh�n s�m", {2, 0, 553, 1, 4}, 0},
		{1, 100, "M�nh Thi�n th�ch", {2, 2, 7, 1, 4}, 0},
		{1, 100, " T� Quang M�t B�a", {2, 0, 761, 1, 4}, 0},
		{1, 100, "T� Quang L�nh", {2, 0, 763, 1, 4}, 0},
		{1, 100, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1, 4}, 0},
		{1, 100, "Qu�n C�ng ��i", {2, 1, 9998, 1, 4}, 0},
		{31, 500, "ModifyYinJuan(10,1)", 1},
		{31, 500, "ModifyYinJuan(100,1)", 1},
		{31, 300, "ModifyYinJuan(1000,1)", 1},
		{1, 1, "L�ng Ba Vi B�", {0, 112, 78, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{31, 4, "Add_ShiMenZhenJuan()", 1},
		{31, 500, "Add_WuXing_Equip()", 1},
	};
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�")
end

function Add_ShiMenZhenJuan()
	local tBook = {
		[2] = {0, 107, 204, 1, "Kim Cang B�t Nh� Ch�n Quy�n "},
		[3] = {0, 107, 206, 1, "V� Tr�n B� �� Ch�n Quy�n"},
		[4] = {0, 107, 205, 1, "Ti�m Long T�c Di�t Ch�n Quy�n"},
		[6] = {0, 107, 207, 1, "Thi�n La Li�n Ch�u Ch�n Quy�n"},
		[8] = {0, 107, 208, 1, "Nh� � Kim ��nh Ch�n Quy�n"},
		[9] = {0, 107, 209, 1, "B�ch H�i Tuy�t �m Ch�n Quy�n"},
		[11] = {0, 107, 210, 1, "H�n ��n Tr�n Nh�c Ch�n Quy�n"},
		[12] = {0, 107, 211, 1, "Qu� Thi�n Du Long Ch�n Quy�n"},
		[14] = {0, 107, 212, 1, "Huy�n �nh M� T�ng Ch�n Quy�n"},
		[15] = {0, 107, 213, 1, "Qu�n T� ��i Phong Ch�n Quy�n"},
		[17] = {0, 107, 214, 1, "Tr�n Qu�n Phi Long Th��ng Ch�n Quy�n"},
		[18] = {0, 107, 215, 1, "Xuy�n V�n L�c H�ng Ch�n Quy�n"},
		[20] = {0, 107, 216, 1, "Huy�n Minh Phong Ma Ch�n Quy�n"},
		[21] = {0, 107, 217, 1, "Linh C� Huy�n T� Ch�n Quy�n"},
		[23] = {0, 107, 218, 1, "C�u Thi�n Phong L�i Ch�n Quy�n"},
		[29] = {0, 107, 222, 1, "H�ng Tr�n T�y M�ng Ch�n Quy�n"},
		[30] = {0, 107, 223, 1, "Phong Hoa Thi�n Di�p Ch�n Quy�n"},	
	}
	local nRoute = GetPlayerRoute();
	if tBook[nRoute] then
		gf_AddItemEx2({tBook[nRoute][1],tBook[nRoute][2],tBook[nRoute][3],tBook[nRoute][4],4}, tBook[nRoute][5], "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�", 0, 1);
	end
end

function Add_WuXing_Equip()
	local tEquip = {
		{1, 12, "�o Cho�ng T�o B�",	 {0, 152, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "�o Cho�ng C�m �o�n",	 {0, 152, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "�o Cho�ng H�a V�n",	 {0, 152, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Gi�y V�i Th�",		 {0, 154, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Tinh Tr� B� H�i",	 {0, 154, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "B� Ch� Cao ��ng Ngoa",{0, 154, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch��ng ��ng Ch�",	 {0, 153, 1, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch��ng Thi�t Ch�",	 {0, 153, 2, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
		{1, 11, "Huy Ch��ng Ng�c Ch�",	 {0, 153, 3, 1, 4, -1, -1, -1, -1, -1, -1}, 0},
	}
	gf_EventGiveRandAward(tEquip, gf_SumRandBase(tEquip), 1, "Event T�t Kingsoft", "Ho�t ��ng ��nh Ni�n Th�");
end