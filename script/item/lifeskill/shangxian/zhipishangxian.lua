-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(0,2)
	if GetLifeSkillMaxLevel(0,2) >= 99 then
		Talk(1,"","B筺  m? gi韎 h筺 k? n╪g n祔 r錳, kh玭g th? d飊g 頲.");
		return
	end	
	if nLevel==79 then
		DelItem(2,1,3008,1)
		LearnLifeSkill(0, 2, 79, 99, 0)
		Say("B筺  xem qua'V筺 Th? Ph?'  c? th? t╪g c蕄 Thu閏 da!",0);
		else
		Say("K? n╪g thu閏 daca61p 79 m韎 h鋍 頲 s竎h n祔, b筺 kh玭g  甶襲 ki謓!",0);
	end
end