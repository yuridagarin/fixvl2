-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=40 then
		AddRecipe(839)
		AddRecipe(840)
		Msg2Player("B�n h�c ���c c�ch l�m: Thanh T�m T� Y")
		DelItem(2,1,437,1)
		else
			Msg2Player("C�p 40 tr� l�n m�i h�c ���c k� n�ng ch� t�o h� gi�p, �i�u ki�n c�a b�n ch�a ��!")	
	end
end