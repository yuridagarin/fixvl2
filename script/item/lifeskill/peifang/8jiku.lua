-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,9)
	if nGene==1 and nSKIllId==9 and nLevel>=80 then
		AddRecipe(1061)
		AddRecipe(1062)
		AddRecipe(1063)
		AddRecipe(1064)
		AddRecipe(1085)
		AddRecipe(1086)
		AddRecipe(1087)
		AddRecipe(1088)
		Msg2Player("B�n h�c ���c ph�i ph��ng: Ti�u chu�n h� y c�p 8")
		Msg2Player("B�n h�c ���c ph�i ph��ng: kh�i ng� h� y c�p 8")
		Msg2Player("B�n h�c ���c ph�i ph��ng: h� y g�i c�m c�p 8")		
		Msg2Player("B�n h�c ���c ph�i ph��ng: h� y quy�n r� c�p 8")
		DelItem(2,1,3046,1)
		else
			Msg2Player("K� n�ng ch� t�o h� y kho�ng c�p 80 m�i h�c ���c ph�i ph��ng n�y, b�n kh�ng �� ��u ki�n!")	
	end
end