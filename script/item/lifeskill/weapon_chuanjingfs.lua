-------������ʦ֮�������䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,2)
	if nGene==1 and nSKIllId==2 and nLevel>=70 then
		AddRecipe(959)
		AddRecipe(960)
		Msg2Player("B�n h�c ���c: Thi�n T�nh tr��ng")
		DelItem(2,1,1073,1)
		else
			Msg2Player("C�n k� n�ng ��c t�o binh kh� d�i c�p 70 tr� l�n m�i c� th� h�c, �i�u ki�n c�a b�n kh�ng ��!")	
	end
end