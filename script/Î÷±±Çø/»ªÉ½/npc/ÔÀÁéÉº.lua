--��ɽ��ͼ����ɺ�ű�
Include("\\script\\lib\\globalfunctions.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Nh�c Linh San: <color>%s mong ���c xu�ng n�i?",sName),2,"Ta mu�n r�i kh�i Hoa S�n/xiashan","Kh�ng c�n ��u/do_nothing");
end

function xiashan()
	NewWorld(500,1829,3260);
	SetFightState(0);
end

function do_nothing()
end