-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,6)
	if nGene==1 and nSKIllId==6 and nLevel>=80 then
		AddRecipe(1044)
		Msg2Player("B筺 h鋍 頲 ph鑙 ch?: Thi猲 Vng B? T﹎ n")
		DelItem(2,1,3040,1)
		else
			Msg2Player("K? n╪g ch? thu鑓 tr猲 c蕄 80 m韎 c? th? h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end