-------行者服配方学习脚本--------
function OnUse()
	local nGene
	local nSKIllId
	local nLevel
	nGene,nSKIllId = GetMainLifeSkill()
	nLevel=GetLifeSkillLevel(1,10)
	if nGene==1 and nSKIllId==10 and nLevel>=90 then
		AddRecipe(1065)
		AddRecipe(1066)
		AddRecipe(1067)
		AddRecipe(1068)
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: nam ti猽 chu萵 u c蕄 9")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: nam kh玦 ng? u c蕄 9")
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: u g頸 c秏 c蕄 9")		
		Msg2Player("B筺 h鋍 頲 ph鑙 phng: ti觰 u quy課 r? c蕄 9")
		DelItem(2,1,3047,1)
		else
			Msg2Player("K? n╪g ch? t筼 n鉵 tr猲 c蕄 90 m韎 c? th? h鋍 頲 ph鑙 phng n祔, b筺 kh玭g  甶襲 ki謓!")	
	end
end