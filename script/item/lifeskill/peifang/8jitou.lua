-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,10)
	if nGene==1 and nSKIllId==10 and nLevel>=80 then
		AddRecipe(1053)
		AddRecipe(1054)
		AddRecipe(1055)
		AddRecipe(1056)
		AddRecipe(1077)
		AddRecipe(1078)
		AddRecipe(1079)
		AddRecipe(1080)
		Msg2Player("B�n h�c ���c ph�i ph��ng: nam ti�u chu�n ��u c�p 8 ")
		Msg2Player("B�n h�c ���c ph�i ph��ng: nam kh�i ng� ��u c�p 8")
		Msg2Player("B�n h�c ���c ph�i ph��ng: ��u g�i c�m c�p 8")		
		Msg2Player("B�n h�c ���c ph�i ph��ng: ti�u ��u quy�n r� c�p 8")
		DelItem(2,1,3044,1)
		else
			Msg2Player("K� n�ng ch� t�o n�n tr�n c�p 80 m�i h�c ���c ph�i ph��ng n�y, b�n kh�ng �� ��u ki�n!")	
	end
end