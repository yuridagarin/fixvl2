-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,6)
	if nGene==1 and nSKIllId==6 and nLevel>=80 then
		AddRecipe(1044)
		Msg2Player("B�n h�c ���c ph�i ch�: Thi�n V��ng B� T�m ��n")
		DelItem(2,1,3040,1)
		else
			Msg2Player("K� n�ng ch� thu�c tr�n c�p 80 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end