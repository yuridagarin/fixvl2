-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,4)
	if nGene==1 and nSKIllId==4 and nLevel>=80 then
		AddRecipe(1033)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: Vi猲 б")
		DelItem(2,1,3031,1)
		else
			Msg2Player("K? n╪g ch? t筼 binh kh? k? m玭 tr猲 c蕄 80 m韎 c? th? h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end