-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=40 then
		AddRecipe(851)
		AddRecipe(852)
		AddRecipe(853)
		AddRecipe(854)
		Msg2Player("B�n h�c ���c c�ch l�m: Ch�p B�t th��ng")
		DelItem(2,1,443,1)
		else
			Msg2Player("C�p 40 tr� l�n m�i h�c ���c k� n�ng ch� t�o h� gi�p, �i�u ki�n c�a b�n ch�a ��!")	
	end
end