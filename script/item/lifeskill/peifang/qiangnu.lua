-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,2)
	if nGene==1 and nSKIllId==2 and nLevel>=90 then
		AddRecipe(1032)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: Thng N?")
		DelItem(2,1,3030,1)
		else
			Msg2Player("K? n╪g ch? t筼 binh kh? d礽 tr猲 c蕄 90 m韎 c? th? h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end