-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,6)
	if nGene==1 and nSKIllId==6 and nLevel>=90 then
		AddRecipe(1045)
		Msg2Player("B�n h�c ���c ph�i ph��ng: B�ch Luy�n Thi�n Ki�p �an")
		DelItem(2,1,3041,1)
		else
			Msg2Player("K� n�ng ch� thu�c tr�n c�p 90 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end