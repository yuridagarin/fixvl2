--�������������Ƚű�
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>T�nh T�: <color>%s, A di �� ph�t.",sName),2,"Ta mu�n r�i kh�i Thi�u L�m Ngh� S� ���ng/out_map","Kh�ng c�n ��u/do_nothing");
end

function out_map()
	NewWorld(204,1682,3143);
	SetFightState(0);
end

function do_nothing()
end