-------��������֮���׹��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=70 then
		AddRecipe(991)
		AddRecipe(992)
		AddRecipe(993)
		AddRecipe(994)
		Msg2Player("B�n h�c ���c: Xuy�n Gi�p cung")
		DelItem(2,1,1083,1)
		else
			Msg2Player("C�n k� n�ng ��c t�o binh kh� k� m�n c�p 70 tr� l�n m�i c� th� h�c, �i�u ki�n c�a b�n kh�ng ��!")	
	end
end