--÷ׯ���ε�ͼ���ش���ű�
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
function main()
	local sName = gf_GetPlayerSexName();
	Say(format("<color=green>Th� v�: <color>%s c�n v�o Mai Trang ��a Lao kh�ng?",sName),2,"Ta mu�n v�o/entrance","Kh�ng c�n ��u/do_nothing");
end

function entrance()
	if IsHaveTaskOrCanGet2(46, 52) == 1 then
		NewWorld(6013,1606,3206);
		SetFightState(1);
		return 1;	
	end
	Talk(1,"","c�c h� kh�ng th� v�o khu v�c n�y.");	
end

function do_nothing()
end