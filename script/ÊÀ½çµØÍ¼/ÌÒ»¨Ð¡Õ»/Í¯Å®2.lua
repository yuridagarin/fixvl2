--�һ�Сջ��ͼ��ͯ�ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>M�n ��ng: <color>%s mu�n r�i kh�i ��o Hoa Ti�u S�n?",sName),2,"R�i kh�i/leave","Kh�ng c�n ��u/do_nothing");
end

function leave()
		NewWorld(102,1456,3066);
		SetFightState(1);	
		return 1;		
end

function do_nothing()
end