-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(0,3)
	if GetLifeSkillMaxLevel(0,3) >= 99 then
		Talk(1,"","B�n �� m� gi�i h�n k� n�ng n�y r�i, kh�ng th� d�ng ���c.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3009,1)
		LearnLifeSkill(0, 3, 79, 99, 0)
		Say("B�n �� xem qua 'Th�y Kinh Ch�' �� c� th� t�ng c�p canh t�c!",0);
		else
		Say("K� n�ng canh t�c c�p 79 m�i h�c ���c s�ch n�y, b�n kh�ng �� �i�u ki�n!",0);
	end
end