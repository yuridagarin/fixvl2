Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function CanEquip()
	return 0;
end;

function OnUse()
	local nMapCurrID, nMapID = gf_GetCurMapID();
	if nMapID ~= KF_MAP_ID then
		Msg2Player("Trong chi�n tr��ng li�n ��u m�i c� th� d�ng");
		return 1;	--���ܴ�
	end;
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0
end