-------���޳�֮�Ͷ����䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,3)
	if nGene==1 and nSKIllId==3 and nLevel>=70 then
		AddRecipe(995)
		AddRecipe(996)
		AddRecipe(997)
		AddRecipe(998)
		Msg2Player("B�n h�c ���c: M�nh ��c �ao")
		DelItem(2,1,1084,1)
		else
			Msg2Player("C�n k� n�ng ��c t�o binh kh� ng�n c�p 70 tr� l�n m�i c� th� h�c, �i�u ki�n c�a b�n kh�ng ��!")	
	end
end