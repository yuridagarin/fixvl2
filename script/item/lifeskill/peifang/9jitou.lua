-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,10)
	if nGene==1 and nSKIllId==10 and nLevel>=90 then
		AddRecipe(1065)
		AddRecipe(1066)
		AddRecipe(1067)
		AddRecipe(1068)
		Msg2Player("B�n h�c ���c ph�i ph��ng: nam ti�u chu�n ��u c�p 9")
		Msg2Player("B�n h�c ���c ph�i ph��ng: nam kh�i ng� ��u c�p 9")
		Msg2Player("B�n h�c ���c ph�i ph��ng: ��u g�i c�m c�p 9")		
		Msg2Player("B�n h�c ���c ph�i ph��ng: ti�u ��u quy�n r� c�p 9")
		DelItem(2,1,3047,1)
		else
			Msg2Player("K� n�ng ch� t�o n�n tr�n c�p 90 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end