--File name:boss_npc.lua 
--Describe:�����������߻�BOSS�Ի�NPC�ű�
--Create Date:2006-8-22
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function main()
	local seltab = {
					"Ta mu�n ��i/get_award",
					"L�m phi�n r�i!/nothing",
					}
	local sNpcName = GetTargetNpcName();
	Say("<color=green>"..sNpcName.."<color>: ",getn(selTab),selTab);
end;

function get_award()
	
end;