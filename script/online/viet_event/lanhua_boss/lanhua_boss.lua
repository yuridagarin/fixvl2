--File name:	lanhua_boss.lua
--Describe:		����BOSS��Ӣ��BOSS�����ű�
--Create Date:	2009-3-25 15:51
--Author:		chenbenqian

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")
end
