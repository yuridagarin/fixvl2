--��ľ�������½�ͽ�ű�

Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green> <color>%s c� vi�c c�n nh�?",sName),2,"Ta mu�n r�i kh�i H�c M�c Nhai/out_map","Kh�ng c�n ��u/do_nothing");
end

function out_map()
	NewWorld(504,1283,2826);
	SetFightState(1);
	SetCampToPlayer("")
end

function do_nothing()
end