Include("\\script\\missions\\kuafu_battle\\kf_define.lua")

function main()
	Msg2Global("Chi�n Tr��ng Li�n Server s�p m�, c�c ��i hi�p h�y nhanh ch�ng ��n Th�nh �� g�p NPC Li�n ��u Ti�p D�n Quan (231, 221) �� b�o danh tham gia");
	AddLocalCountNews("Chi�n Tr��ng Li�n Server s�p m�, c�c ��i hi�p h�y nhanh ch�ng ��n Th�nh �� g�p NPC Li�n ��u Ti�p D�n Quan (231, 221) �� b�o danh tham gia", 2);
	if SubWorldID2Idx(KF_MAP_TASK_TEMP_ID) ~= -1 then
		SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_CURR_OPEN_COUNT, 0);
		SetMapTaskTemp(KF_MAP_TASK_TEMP_ID, KF_LAST_OPEN_MAPID, 0);
	end
end;