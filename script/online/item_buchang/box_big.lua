Include("\\script\\online\\item_buchang\\ibc_head.lua")
Include("\\script\\online_activites\\activity_head.lua")

function main()
	if GetLevel() < 90 and gf_GetPlayerRebornCount() == 0 then
		Say(format("��ng c�p kh�ng �� %d c�p kh�ng th� nh�n th��ng!", 90), 0)
		return 0;
	end
	if GetTime() - IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.BigBoxTime) < 3600 then
		Say("Ng��i �� nh�n ph�n th��ng b�o r��ng, h�y quay l�i sau!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.BigBoxTime, GetTime());
	gf_ModifyExp(10000000);
	local tAward = {
		{1, 100, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 1, 4}, 0},
		{1, 200, "Thi�t Tinh c�p 1", {2, 1, 30533, 1, 4}, 0},
		{1, 100, "Thi�t Tinh c�p 2", {2, 1, 30534, 1, 4}, 0},
		{1, 100, "L�i Vi�m Th�ch", {2, 1, 30683, 1}, 0},
		{1, 10, "B�ch C�u Ti�n ��n", {2, 1, 1008, 1, 4}, 7 * 24 * 3600},
		{1, 10, "Tam Thanh Ti�n ��n", {2, 1, 1099, 1, 4}, 7 * 24 * 3600},
		{1, 10, "L�c Th�n Ti�n ��n", {2, 1, 1066, 1, 4}, 7 * 24 * 3600},
		{1, 10, "Th�n N�ng ��n", {2, 1, 343, 1, 4}, 7 * 24 * 3600},
		{1, 10, "��i Nh�n s�m", {2, 0, 553, 1, 4}, 7 * 24 * 3600},
		{1, 15, "Qu�n C�ng Ch��ng", {2, 1, 9999, 1, 4}, 7 * 24 * 3600},
		{1, 20, "Qu�n C�ng ��i", {2, 1, 9998, 1, 4}, 7 * 24 * 3600},
		{1, 30, "Thi�n Ki�u L�nh", {2, 97, 236, 1, 4}, 0, 0, 0, 1},
		{1, 10, "L�ng Ba Vi B�", {0, 112, 78, 1, 4, -1, -1, -1, -1, -1, -1}, 0, 0, 0, 1},
		{31, 30, "ahf_GetGaojiZhenjuan(1,1,1)", 1},
		{1, 30, "C�y B�t Nh� nh�", {2, 0, 504, 1, 4}, 7 * 24 * 3600},
		{1, 30, "C�y B�t Nh�", {2, 0, 398, 1, 4}, 7 * 24 * 3600},
		{1, 30, "B�ng th�ch", {2, 1, 149, 1}, 0},
		{1, 70, "Ti�u Nh�n s�m qu�", {2, 0, 552, 1, 4}, 7 * 24 * 3600},
		{1, 100, "V� Ti�u Y ��ng", {2, 1, 30493, 1, 4}, 0},
		{1, 50, "V� Ti�u Y B�c", {2, 1, 30492, 1, 4}, 0},
		{1, 30, "V� Ti�u Y V�ng", {2, 1, 30491, 1, 4}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "��n b� hack item", "R��ng V�ng ��n B�");
end