-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=90 then
		AddRecipe(1069)
		AddRecipe(1070)
		AddRecipe(1071)
		AddRecipe(1072)
		Msg2Player("B�n h�c ���c ph�i ph��ng: ti�u chu�n nam y c�p 9")
		Msg2Player("B�n h�c ���c ph�i ph��ng: kh�i ng� nam y c�p 9")
		Msg2Player("B�n h�c ���c ph�i ph��ng: y ph�c g�i c�m c�p 9")		
		Msg2Player("B�n h�c ���c ph�i ph��ng: n�i y quy�n r� c�p 9")
		DelItem(2,1,3048,1)
		else
			Msg2Player("K� n�ng ch� t�o h� gi�p tr�n c�p 90 m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end