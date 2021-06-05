Include("\\script\\online\\item_buchang\\ibc_head.lua")

function main()
	local npcIndex = GetTargetNpc();
	if GetLevel() < 90 and gf_GetPlayerRebornCount() == 0 then
		Say(format("��ng c�p kh�ng �� %d c�p kh�ng th� nh�n th��ng!", 90), 0)
		return 0;
	end
	if GetTime() - IBC_TASK_MANAGE:GetTask(IBC_TASK_MANAGE.SmallBoxTime) < 60 then
		Say("Ng��i �� nh�n ph�n th��ng b�o r��ng, h�y quay l�i sau!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return 0;
	end
	IBC_TASK_MANAGE:SetTask(IBC_TASK_MANAGE.SmallBoxTime, GetTime());
	
	gf_ModifyExp(1000000);
	local tAward1 = {
		{1, 50, "L�i Vi�m Th�ch", {2, 1, 30683, 1}, 0},
		{31, 50, "nothing()", 1},
	}
	gf_EventGiveRandAward(tAward1, gf_SumRandBase(tAward1), 1, "��n b� hack item", "R��ng Nh� ��n B�");
	
	local tAward = {
		{1, 20, "Hu�n ch��ng anh h�ng", {2, 1, 30499, 1, 4}, 0},
		{1, 20, "Thi�t Tinh c�p 1", {2, 1, 30533, 1, 4}, 0},
		{1, 20, "Thi�t Tinh c�p 2", {2, 1, 30534, 1, 4}, 0},
		{1, 20, "L�i Vi�m Th�ch", {2, 1, 30683, 1}, 0},
		{1, 15, "V� Ti�u Y ��ng", {2, 1, 30493, 1, 4}, 0},
		{1, 5, "V� Ti�u Y B�c", {2, 1, 30492, 1, 4}, 0},
	}
	gf_EventGiveRandAward(tAward, gf_SumRandBase(tAward), 1, "��n b� hack item", "R��ng Nh� ��n B�");
	SetNpcLifeTime(npcIndex, 0);
end