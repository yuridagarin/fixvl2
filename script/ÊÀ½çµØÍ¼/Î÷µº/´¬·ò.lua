--��������ű�

Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Thuy�n phu:<color>%s c� vi�c c�n nh�?",sName),2,"Ta mu�n r�i kh�i T�y ��o/out_map","Kh�ng c�n ��u/do_nothing");
end

function out_map()
	NewWorld(104,1566,2974);
	SetFightState(1);
end

function do_nothing()
end