-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=90 then
		AddRecipe(1034)
		Msg2Player("B�n h�c ���c ph�i ph��ng: B�t X� Chi X�")
		DelItem(2,1,3032,1)
		else
			Msg2Player("K� n�ng ch� t�o binh kh� k� m�n tr�n c�p 90 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end