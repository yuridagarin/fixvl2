-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=80 then
		AddRecipe(1015)
		Msg2Player("B�n h�c ���c ph�i ph��ng: Th�n Quy")
		DelItem(2,1,3013,1)
		else
			Msg2Player("K� n�ng ch� t�o binh kh� ng�n tr�n c�p 80 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end