-------��ħ���֮ս�⵶�䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=70 then
		AddRecipe(955)
		AddRecipe(956)
		Msg2Player("B�n h�c ���c: Chi�n � �ao")
		DelItem(2,1,1071,1)
		else
			Msg2Player("C�n k� n�ng ��c t�o binh kh� ng�n c�p 70 tr� l�n m�i c� th� h�c, �i�u ki�n c�a b�n kh�ng ��!")	
	end
end