--�����νű�
--by vivi
--2008/06/18

Include("\\script\\online\\aoyun08\\aoyun_head.lua")

function OnEquip(item)
	CleanInteractive();
	InteractiveEnable(0);
	return 0
end

function OnUnEquip(item)
	InteractiveEnable(1);
	return 0
end

function OnUse()
	return 0;
end

function CanEquip()
	if GetTask(547) ~= 0 and GetTask(TASK_AOYUN_HUOJU_NUM) ~= 0 then
		return 0;
	else
		Talk(1,"","Ch� c� ng��i r��c �u�c m�i c� th� m�c ��ng ph�c n�y.")
		return 1;
	end
end