--filename:danianshou_death.lua
--create date:2006-01-11
--author:yanjun
--describe:�����������ű�
Include("\\script\\online\\���ڻ\\newyear_head.lua")	
function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 30)
	SetNpcScript(npcIndex,"");
	local MapID,MapX,MapY = GetNpcWorldPos(npcIndex)
	for i=1,XIAONIANSHOU_COUNT do
		xnsIndex = CreateNpc("Ti�u Ni�n Th�","Ti�u Ni�n Th�",MapID,MapX,MapY,-1,1,1,2000)
		SetNpcScript(xnsIndex,"\\script\\online\\���ڻ\\xiaonianshou_death.lua")
		SetNpcLifeTime(xnsIndex,3600);	--ֻ����һСʱ
	end
end