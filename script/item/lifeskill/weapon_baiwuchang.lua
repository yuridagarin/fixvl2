-------白无常之诡毒爪配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=70 then
		AddRecipe(999)
		AddRecipe(1000)
		AddRecipe(1001)
		AddRecipe(1002)
		Msg2Player("B筺 h鋍 頲: Ng魕 чc tr秓")
		DelItem(2,1,1085,1)
		else
			Msg2Player("C莕 k? n╪g c t筼 binh kh? k? m玭 c蕄 70 tr? l猲 m韎 c? th? h鋍, 甶襲 ki謓 c馻 b筺 kh玭g !")	
	end
end