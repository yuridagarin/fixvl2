-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,2)
	if GetLifeSkillMaxLevel(1,2) >= 99 then
		Talk(1,"","B�n �� m� gi�i h�n k� n�ng n�y r�i, kh�ng th� d�ng ���c.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3002,1)
		LearnLifeSkill(1, 2, 79, 99, 1)
		Say("B�n �� xem qua 'Can T��ng Ch� Kinh', �� c� th� t�ng c�p ch� t�o binh kh� d�i!",0);
		else
		Say("K� n�ng binh kh� c�p 79 m�i h�c ���c s�ch n�y, b�n kh�ng �� �i�u ki�n!",0);
	end
end