-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,9)
	if nGene==1 and nSKIllId==9 and nLevel>=90 then
		AddRecipe(1073)
		AddRecipe(1074)
		AddRecipe(1075)
		AddRecipe(1076)
		Msg2Player("B�n h�c ���c ph�i ph��ng: ti�u chu�n h� y c�p 9")
		Msg2Player("B�n h�c ���c ph�i ph��ng: kh�i ng� h� y c�p 9")
		Msg2Player("B�n h�c ���c ph�i ph��ng: h� y g�i c�m c�p 9")		
		Msg2Player("B�n h�c ���c ph�i ph��ng: h� y quy�n r� c�p 9")
		DelItem(2,1,3049,1)
		else
			Msg2Player("K� n�ng ch� t�o h� y t� c�p 90 tr� l�n m�i c� th� h�c ���c ph�i ph��ng n�y, b�n kh�ng �� �i�u ki�n!")	
	end
end