-------�ض��̿�֮�������䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=70 then
		AddRecipe(963)
		AddRecipe(964)
		AddRecipe(965)		
		AddRecipe(966)		
		Msg2Player("B�n h�c ���c: B� ��c ch�m")
		DelItem(2,1,1075,1)
		else
			Msg2Player("C�n k� n�ng ��c t�o binh kh� k� m�n c�p 70 tr� l�n m�i c� th� h�c, �i�u ki�n c�a b�n kh�ng ��!")	
	end
end