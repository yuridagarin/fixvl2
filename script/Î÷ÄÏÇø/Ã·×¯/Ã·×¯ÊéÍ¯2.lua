--÷ׯ��ͼ������ͯ�ű�
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Th� ��ng:<color>%s mu�n r�i kh�i Mai Trang kh�ng?",sName),2,"R�i kh�i/leave","Kh�ng c�n ��u/do_nothing");
end

function leave()
	NewWorld(106,1300,3110);
	SetFightState(1);
end

function do_nothing()
end