-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=70 then
		AddRecipe(835)
		AddRecipe(836)
		AddRecipe(837)
		AddRecipe(838)
		Msg2Player("B�n h�c ���c c�ch l�m: B� ��c ph�c")
		DelItem(2,1,436,1)
		else
			Msg2Player("C�p 70 tr� l�n m�i h�c ���c k� n�ng ch� t�o h� gi�p, �i�u ki�n c�a b�n ch�a ��!")	
	end
end