--filename:danianshou_death.lua
--create date:2006-01-11
--author:yanjun
--describe:大年兽死亡脚本
Include("\\script\\online\\春节活动\\newyear_head.lua")	
function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30)
	SetNpcScript(npcIndex,"");
	local MapID,MapX,MapY = GetNpcWorldPos(npcIndex)
	for i=1,XIAONIANSHOU_COUNT do
		xnsIndex = CreateNpc("Ti觰 Ni猲 Th?","Ti觰 Ni猲 Th?",MapID,MapX,MapY,-1,1,1,2000)
		SetNpcScript(xnsIndex,"\\script\\online\\春节活动\\xiaonianshou_death.lua")
		SetNpcLifeTime(xnsIndex,3600);	--只存在一小时
	end
end