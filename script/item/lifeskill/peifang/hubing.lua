-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,7)
	if nGene==1 and nSKIllId==7 and nLevel>=90 then
		AddRecipe(1050)
		Msg2Player("B�n h�c ���c ph�i ph��ng: H� B�nh")
		DelItem(2,1,3043,1)
		else
			Msg2Player("K� n�ng ch� thu�c tr�n c�p 90 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end