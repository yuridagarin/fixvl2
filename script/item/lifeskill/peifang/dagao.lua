-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,7)
	if nGene==1 and nSKIllId==7 and nLevel>=80 then
		AddRecipe(1049)
		Msg2Player("B�n h�c ���c ph�i ph��ng: �� Cao")
		DelItem(2,1,3042,1)
		else
			Msg2Player("K� n�ng n�u n��ng tr�n c�p 80 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end