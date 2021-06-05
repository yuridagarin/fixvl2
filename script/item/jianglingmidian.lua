Include("\\script\\lib\\globalfunctions.lua")

JLMD_TABLE = {
	[2] = {15, {5, 100000000, 500}, 0},
	[3] = {10, {10, 200000000, 1000}, 0},
	[4] = {4, {15, 400000000, 3000}, 0},
	[5] = {2, {20, 1000000000, 8000}, 1},
};

function OnUse(nItem)
	local nLevel = gf_GetPetSkillLevel();
	if nLevel < 1 then
		Say("Ng��i v�n ch�a h�c Gi�ng Linh Thu�t!", 0);
		return
	end
	if not JLMD_TABLE[nLevel + 1] then
		Say("T�m th�i ch�a m� t�nh n�ng l�nh ng� Gi�ng Linh Thu�t c�p hi�n t�i!", 0);
		return
	end
	local tCost = JLMD_TABLE[nLevel + 1][2];
	Say(format("��ng � ti�u hao <color=red>%s*%d, EXP %d, �i�m tu luy�n %d<color> �� l�nh ng� Gi�ng Linh Thu�t c�p cao h�n kh�ng?", "Gi�ng Linh B� �i�n", tCost[1], tCost[2], tCost[3]), 2, format("��ng �/#try_update_jinglingshu(%d)", nLevel + 1), "H�y b�/nothing");
end

function try_update_jinglingshu(nIndex)
	local tCost = JLMD_TABLE[nIndex][2];
	if not tCost then
		return 
	end
	if GetItemCount(2, 1, 30725) < tCost[1] then
		Say(format("S� l��ng <color=gold>%s<color> kh�ng �� <color=red>%d<color>", "Gi�ng Linh B� �i�n", tCost[1]), 0);
		return
	end
	if GetExp() < tCost[2] then
		Say(format("S� l��ng <color=gold>%s<color> kh�ng �� <color=red>%d<color>", "Kinh nghi�m", tCost[2]), 0);
		return
	end
	if GetPopur() < tCost[3] then
		Say(format("S� l��ng <color=gold>%s<color> kh�ng �� <color=red>%d<color>", "Luy�n", tCost[3]), 0);
		return
	end
	if DelItem(2, 1, 30725, tCost[1]) ~= 1 then
		return
	end
	
	AddRuntimeStat(28, 1, nIndex, 1);--���������X���Ĵ���
	AddRuntimeStat(28, 2, 0, tCost[1]); --���Ľ����ص�����
	
	ModifyExp(-tCost[2]);
	ModifyPopur(-tCost[3]);
	local rand = random(100);
	if rand <= JLMD_TABLE[nIndex][1] then
		gf_SetPetSkillLevel(nIndex);
		if JLMD_TABLE[nIndex][3] == 1 then
			Msg2Global(format("Ch�c m�ng [%s] s� d�ng Gi�ng Linh M�t T�ch l�nh ng� Gi�ng Linh Thu�t c�p %d", GetName(), nIndex));
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		Say("L�nh ng� th�t b�i Gi�ng Linh Thu�t c�p cao h�n!", 0);
	end
end