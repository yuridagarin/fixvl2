-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nLevel=GetLifeSkillLevel(0,4)
	if GetLifeSkillMaxLevel(0,4) >= 99 then
		Talk(1,"","B筺  m? gi韎 h筺 k? n╪g n祔 r錳, kh玭g th? d飊g 頲.");
		return
	end
	if nLevel==79 then
		DelItem(2,1,3010,1)
		LearnLifeSkill(0, 4, 79, 99, 0)
		Say("B筺  xem qua 'Th莕 Y B秐 Th秓 Kinh'  c? th? t╪g c蕄 h竔 thu鑓!!",0);
		else
		Say("K? n╪g h竔 thu鑓 c蕄 79 m韎 h鋍 頲 s竎h n祔, b筺 kh玭g  甶襲 ki謓!",0);
	end
end