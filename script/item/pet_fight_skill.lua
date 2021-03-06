Include("\\script\\lib\\globalfunctions.lua");

--提供宠物技能的物品配置表
g_PetSkillTable = {
	--1大类	2副类	3细类	4技能ID	5技能名称
	{2,	97,	8,	1257,	"жnh Ph骳"},
	{2,	97,	7,	1258,	"T? Gi秓"},
	{2,	97,	6,	1260,	"Uy Nhi誴"},
}

function GetPetSkillConfig(nItemIdx)
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nItemIdx);
	if ItemGen == nil or ItemDetail == nil or ItemParticular == nil then
		return 0;
	end
	
	for i=1,getn(g_PetSkillTable) do
		if g_PetSkillTable[i][1] == ItemGen and
		g_PetSkillTable[i][2] == ItemDetail and
		g_PetSkillTable[i][3] == ItemParticular then
			return i;
		end
	end

	return 0;
end;

function OnUse(nItemIdx)
	--获取配置信息
	local nConfigIdx = GetPetSkillConfig(nItemIdx);
	if nConfigIdx == 0 then
		return
	end;

	--获取武器扩展栏物品
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex <= 0) then
		Talk(1,"","Kh玭g c? th? c璶g, kh玭g th? d飊g v藅 ph萴 n祔!")
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Talk(1,"","Kh玭g c? th? c璶g, kh玭g th? d飊g v藅 ph萴 n祔!")
		return
	end
	
	if (IsPetCanFight(nPetItemIndex) == 0) then
		Talk(1, "", "Kh玭g ph秈 th? c璶g d筺g t蕁 c玭g, kh玭g th? h鋍 k? n╪g!")
		return
	end

	local nOldSkill = GetPetSkill(nPetItemIndex);
	if (nOldSkill <= 0) then
		yes(nConfigIdx);
	elseif (nOldSkill == g_PetSkillTable[nConfigIdx][4]) then
		Talk(1,"","Th? c璶g  h鋍 k? n╪g n祔!")
		return
	else
		Say("Th? c璶g  h鋍 1 k? n╪g, h鋍 k? n╪g m韎 s? thay th? cho k? n╪g hi謓 t筰. уng ? thay th??", 
			2, "ng/#yes(".. nConfigIdx ..")", "Sai/no")
	end;
end;

function yes(nConfigIdx)
	if (nConfigIdx <= 0 or nConfigIdx > getn(g_PetSkillTable)) then
		return
	end;
	if (g_PetSkillTable[nConfigIdx][4] <= 0) then
		return
	end;
	
	--物品数量
	local nItemCount = GetItemCount(g_PetSkillTable[nConfigIdx][1], g_PetSkillTable[nConfigIdx][2], g_PetSkillTable[nConfigIdx][3]);
	if (nItemCount == nil or nItemCount < 1) then
		return
	end;

	--获取武器扩展栏物品
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex <= 0) then
		Talk(1,"","Kh玭g c? th? c璶g, kh玭g th? d飊g v藅 ph萴 n祔!")
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Talk(1,"","Kh玭g c? th? c璶g, kh玭g th? d飊g v藅 ph萴 n祔!")
		return
	end
	
	if (IsPetCanFight(nPetItemIndex) == 0) then
		Talk(1, "", "Kh玭g ph秈 th? c璶g d筺g t蕁 c玭g, kh玭g th? h鋍 k? n╪g!")
		return
	end
	
	--设置新技能
	if (SetPetSkill(nPetItemIndex, g_PetSkillTable[nConfigIdx][4]) == 1) then
		DelItem(g_PetSkillTable[nConfigIdx][1], g_PetSkillTable[nConfigIdx][2], g_PetSkillTable[nConfigIdx][3], 1)
		Talk(1,"","Th? c璶g  h鋍 k? n╪g m韎: " .. g_PetSkillTable[nConfigIdx][5])
	end

	return
end

function no()
end