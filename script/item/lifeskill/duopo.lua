-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,5)
	if nGene==1 and nSKIllId==5 and nLevel>=40 then
		AddRecipe(923)
		AddRecipe(924)
		AddRecipe(925)
		AddRecipe(926)
		Msg2Player("B筺 h鋍 頲 c竎h l祄: 箃 Ph竎h y")
		DelItem(2,1,461,1)
		else
			Msg2Player("C蕄 40 tr? l猲 m韎 h鋍 頲 k? n╪g ch? t筼 h? gi竝, 甶襲 ki謓 c馻 b筺 ch璦 !")	
	end
end