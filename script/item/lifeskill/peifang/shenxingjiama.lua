-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,8)
	if nGene==1 and nSKIllId==8 and nLevel>=90 then
		AddRecipe(1040)
		Msg2Player("B�n h�c ���c ph�i ph��ng: Th�n H�nh Gi�p M�")
		DelItem(2,1,3038,1)
		else
			Msg2Player("K� n�ng ch� ph� tr�n c�p 90 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end