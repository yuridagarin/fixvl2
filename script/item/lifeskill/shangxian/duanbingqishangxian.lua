-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(1,3)
	if GetLifeSkillMaxLevel(1,3) >= 99 then
		Talk(1,"","B筺  m? gi韎 h筺 k? n╪g n祔 r錳, kh玭g th? d飊g 頲.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3001,1)
		LearnLifeSkill(1, 3, 79, 99, 1)
		Say("B筺  xem qua ' D? T? Ch? Kinh',  c? th? t╪g c蕄 ch? t筼 binh kh? ng緉!",0);	
		else
		Say("K? n╪g ch? t筼 binh kh? ng緉 c蕄 79 m韎 h鋍 頲 s竎h n祔, b筺 kh玭g  甶襲 ki謓!",0);	
	end
end