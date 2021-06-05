Include("\\script\\online_activites\\201409\\huadeng.lua")

function main()
	hd_DailyReset();
	if HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Box) > 6 then
		Say(format("<color=green>%s:<color>", HD_NPC_NAME)..format("M�i ng�y, m�i ng��i nh�n ���c t�i �a %d l�n ph�n th��ng", 6), 0);
		return 0;
	end
	local nTime = GetTime();
	if nTime - HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Limit) < 600 then
		local nLast = 600 - nTime + HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Limit);
		Say(format("<color=green>%s:<color>", "Th� C��i Nh�")..format("C�n %d ph�t %d gi�y c� th� nh�p v�o r��ng ti�p theo", floor(nLast / 60), mod(nLast, 60)), 0);
		return 0;
	end
	if GetNpcName(GetTargetNpc()) ~= "Th� C��i Nh�" then
		return 0;
	end
	gf_Modify("Exp", 5000000);
	gf_AddItemEx2({2,1,30721,1}, "B�o R��ng Th� C�ng", "Ho�t ��ng 09/2014", "H�i ��n Hoa Trung Thu", 0, 1);
	SetNpcLifeTime(GetTargetNpc(), 0);
	HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Limit, nTime);
	HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Box, HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Box) + 1)
end