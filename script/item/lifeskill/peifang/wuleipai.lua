-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,8)
	if nGene==1 and nSKIllId==8 and nLevel>=80 then
		AddRecipe(1039)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: Ng? L玦 B礽")
		DelItem(2,1,3037,1)
		else
			Msg2Player("K? n╪g ch? ph? tr猲 c蕄 80 m韎 c? th? h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end