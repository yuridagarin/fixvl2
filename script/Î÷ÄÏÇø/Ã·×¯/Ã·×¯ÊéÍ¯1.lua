--÷ׯ��ͼ��ͯ����ű�
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Mai Trang Th� ��ng:<color>%s mu�n v�o Mai Trang kh�ng?",sName),2,"Ta mu�n v�o/entrance","Kh�ng c�n ��u/do_nothing");
end

function entrance()
		NewWorld(6016,1490,3094);
		SetFightState(1)
end

function do_nothing()
end