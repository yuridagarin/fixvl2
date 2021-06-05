Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddActivity(KF_ACTIVITY_XIANFENG);
		KF_AddScore(KF_SCORE_XIANFENG);
	end
	SetMissionV(MV_BATTLE_XIANFENG_TAG_SONG, 2);
	SetMissionV(MV_BATTLE_XIANFENG_DEATHTIME_SONG, GetTime());
	SetNpcLifeTime(id, 0);
	Msg2MSAll(KF_MISSION_ID, format("%s ��t k�ch th�t b�i, lui v� ��i doanh %s.", "T�ng Ti�n Phong", "Qu�n T�ng"));
end