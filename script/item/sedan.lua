Include("\\script\\���\\marriage_head.lua");
function OnEquip(item)
	DesaltPlayer(1, 7)
	return 0
end

function OnUnEquip(item)
	DesaltPlayer(0)
	return 0
end

function OnUse()
	return 0;
end

function CanEquip()
	if GetSex() == 1 then
		Talk(1,"","Nam nh�n kh�ng th� l�n ki�u.");
		return 1;
	end;
	if GetTask(TASK_WEDDING_LOVER) == 0 then
		Talk(1,"","Ph�i c� h�n ��c m�i ���c l�n ki�u.");
		return 1;
	end;
	return 0;
end
