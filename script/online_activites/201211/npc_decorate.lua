Include("\\script\\online_activites\\201211\\item_christmas_tree.lua")

VET_201211_LASTTIME_AWARD = {
	{1, 8, "V� Noel th�n k�", {2, 1, 30466, 10}, 0},
	{1, 8, "M� Tu�n L�c", {2, 1, 30467, 10}, 0},
	{4, 16, 10, 1},
	{5, 16, 10, 1},
  	{27, 16, 1000, 1},
  	{3, 18, 100000, 1},
  	{31, 6, "get_christmas_furits_award()", ""},
  	{32, 6, 100, 1},
  	{28, 6, 100, 1},
}

VET_201211_FINAL_AWARD = {
	{1, 25, "C� Linh Th�ch", {2, 1, 30368, 3}, 0},
	{1, 25, "C� Linh Ng�c", {2, 1, 30369, 3}, 0},
	{2, 25, 10000000, 1},
	{31, 25, "get_christmas_zhenqi_award()", ""},
}

function get_christmas_furits_award()
	local tFruits = {
		[1] = {2,1,30164},
		[2] = {2,1,30165},
		[3] = {2,1,30166},
		[4] = {2,1,30167},
		[5] = {2,1,30168},
		[6] = {2,1,30169},
		[7] = {2,1,30170},
		[8] = {2,1,30171},
		[9] = {2,1,30172},
		[10] = {2,1,30173},
		[11] = {2,1,30174},
		[12] = {2,1,30175},
		[13] = {2,1,30176},
		[14] = {2,1,30177},
		[15] = {2,1,30178},
		[16] = {2,1,30179},
		[17] = {2,1,30180},
		[18] = {2,1,30181},
		[19] = {2,1,30182},
		[20] = {2,1,30183},
	}
	local nSize = getn(tFruits);
	local nIndex = mod(random(1,1000),nSize)+1
--	for i = 1, 100 do
		AddItem(tFruits[nIndex][1],tFruits[nIndex][2],tFruits[nIndex][3],100);
--	end
end

function get_christmas_zhenqi_award()
	AwardGenuineQi(600);
end

function main()
	if VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.npcIndex) ~= GetTargetNpc() then
		Talk(1,"","<color=green>C�y Noel:<color>Gi�ng sinh vui v�!");
		return
	end
	Say("<color=green>C�y Noel:<color>Qu� gi�ng sinh ��u?", 3, "Ta c�n trang tr� c�y th�ng Noel/decorate_tree", "Ta mu�n nh�n ph�n th��ng/christmas_tree_award", "T�i h� ch� xem qua th�i/nothing")	
end

function decorate_tree()
	if GetTime() - VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.CreateTime) <= 60 then
		Talk(1,"","Gi�n c�ch th�i gian trang tr� l� 1 ph�t");
		return
	end
	if GetItemCount(2, 0, 351) < VET_201211_NEED_LUSHUI then
		Talk(1,"","Kh�ng �� l� th�y");
		return
	end
	if VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.AwardTag) == 1 then
		Talk(1,"","Ph�n th��ng trang tr� c�y th�ng Noel tr��c v�n ch�a nh�n");
		return
	end
	local npcIndex = VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.npcIndex);
	local nIndex = find_christmas_tree(GetNpcName(npcIndex));
	if nIndex > 0 and  nIndex < getn(VET_201211_TREENPC_NAME) and DelItem(2, 0, 351, VET_201211_NEED_LUSHUI) == 1 then
		local nMapId ,nX, nY = GetNpcWorldPos(npcIndex);
		SetNpcLifeTime(npcIndex, 0);
		local npcIndexTemp = CreateNpc(VET_201211_TREENPC_NAME[nIndex+1][1], VET_201211_TREENPC_NAME[nIndex+1][2], nMapId, nX, nY);
		SetNpcScript(npcIndexTemp, "\\script\\online_activites\\201211\\npc_decorate.lua");
		SetNpcLifeTime(npcIndexTemp, 3 * 60);
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.npcIndex, npcIndexTemp);
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.CreateTime, GetTime());
		VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.AwardTag, 1);
	else
	 Talk(1,"","<color=green>C�y Noel:<color>Gi�ng sinh vui v�!");
	end
end

function christmas_tree_award()
	if VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.AwardTag) == 0 then
		Talk(1,"","C�c h� �� nh�n ph�n th��ng r�i");
		return
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return
	end
	local nIndex = find_christmas_tree(GetNpcName(GetTargetNpc()));
	if nIndex > 0 then
		if nIndex == getn(VET_201211_TREENPC_NAME) then
			--���һ��װ�ν���
			gf_Modify("Exp", 2000000);
			gf_EventGiveRandAward(VET_201211_LASTTIME_AWARD, 100, 1, "TRANG TRI CAY THONG", "Trang tr� c�y th�ng");
			--���⽱��
			if VET_201211_DECORATE_TREE_TASK:GetTask(VET_201211_DECORATE_TREE_TASK.UseTime) == VET_201211_USETIME_MAX then
				gf_EventGiveRandAward(VET_201211_FINAL_AWARD, 100, 1, "TRANG TRI CAY THONG", "Trang tr� c�y th�ng th� 10");
			end
		else
			gf_Modify("Exp", 800000);
		end
	end
	VET_201211_DECORATE_TREE_TASK:SetTask(VET_201211_DECORATE_TREE_TASK.AwardTag, 0);
end