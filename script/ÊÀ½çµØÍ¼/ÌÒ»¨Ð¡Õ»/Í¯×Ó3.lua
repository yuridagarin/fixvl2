--�һ�Сջ��ͼ��ͯ����ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>M�n ��ng: <color>%s mu�n v�o ��o Hoa Ti�u S�n kh�ng?",sName),2,"Ta mu�n v�o/entrance","Kh�ng c�n ��u/do_nothing");
end

function entrance()
	--���������������ĵ�ͼ
	if IsHaveTaskOrCanGet2(21, 52) == 1 then
		NewWorld(6009,1579,3218);
		SetFightState(0);
		return 1;
	end
	if IsHaveTaskOrCanGet2(53, 61) == 1 then
		NewWorld(6010,1579,3218);
		SetFightState(0);
		return 1;
	end
	if IsHaveTaskOrCanGet2(62, 65) == 1 then
		NewWorld(6011,1579,3218);
		SetFightState(0);
		return 1;
	end
	Talk(1,"","c�c h� kh�ng th� v�o khu v�c n�y.");
	return 0;
end

function do_nothing()
end