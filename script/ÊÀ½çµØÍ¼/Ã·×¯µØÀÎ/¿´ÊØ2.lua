--÷ׯ���ε�ͼ���ؽű�
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Th� v�: <color>%s mu�n r�i kh�i Mai Trang ��a Lao?",sName),2,"R�i kh�i/leave","Kh�ng c�n ��u/do_nothing");
end

function leave()
	NewWorld(6016,1586,3140);
	SetFightState(1);
end

function do_nothing()
end