-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,6)
	if GetLifeSkillMaxLevel(1,6) >= 99 then
		Talk(1,"","B�n �� m� gi�i h�n k� n�ng n�y r�i, kh�ng th� d�ng ���c.");
		return
	end	
	if nLevel==79 then
		DelItem(2,1,3006,1)
		LearnLifeSkill(1, 6, 79, 99, 1)
		Say("B�n �� xem qua 'Thang Nang Th� T�n Thi�n' �� c� th� t�ng c�p ch� thu�c!",0);	
		else
		Say("K� n�ng ch� thu�c c�p79 m�i h�c ���c s�ch n�y, b�n kh�ng �� �i�u ki�n!",0);	
	end
end