-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=70 then
		AddRecipe(871)
		AddRecipe(872)
		AddRecipe(873)
		AddRecipe(874)
		Msg2Player("B�n h�c ���c c�ch l�m: T� Ngh�a th��ng")
		DelItem(2,1,448,1)
		else
			Msg2Player("C�p 70 tr� l�n m�i h�c ���c k� n�ng ch� t�o h� gi�p, �i�u ki�n c�a b�n ch�a ��!")	
	end
end