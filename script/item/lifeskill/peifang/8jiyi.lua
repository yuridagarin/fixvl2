-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=80 then
		AddRecipe(1057)
		AddRecipe(1058)
		AddRecipe(1059)
		AddRecipe(1060)
		AddRecipe(1081)
		AddRecipe(1082)
		AddRecipe(1083)
		AddRecipe(1084)
		Msg2Player("B�n h�c ���c ph�i ph��ng: ti�u chu�n nam y c�p 8")
		Msg2Player("B�n h�c ���c ph�i ph��ng: kh�i ng� nam y c�p 8")
		Msg2Player("B�n h�c ���c ph�i ph��ng: y ph�c g�i c�m c�p 8")		
		Msg2Player("B�n h�c ���c ph�i ph��ng: n�i y quy�n r� c�p 8")
		DelItem(2,1,3045,1)
		else
			Msg2Player("K� n�ng ch� t�o h� gi�p t� c�p 80 tr� l�n m�i h�c ���c ph�i ph��ng n�y, b�n kh�ng �� ��u ki�n!")	
	end
end