-------���߷��䷽ѧϰ�ű�--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,9)
	if GetLifeSkillMaxLevel(1,9) >= 99 then
		Talk(1,"","B�n �� m� gi�i h�n k� n�ng n�y r�i, kh�ng th� d�ng ���c.");
		return
	end	
	if nLevel==79 then
		DelItem(2,1,3051,1)
		LearnLifeSkill(1, 9, 79, 99, 1)
		Say("B�n �� xem qua 'Luy T� T�m Kinh', �� c� th� t�ng c�p ch� t�o h� y!",0);
		else
		Say("K� n�ng ch� t�o h� y c�p 79 m�i h�c ���c s�ch n�y, b�n kh�ng �� �i�u ki�n!",0);
	end
end