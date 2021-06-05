Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddActivity(KF_ACTIVITY_JIANGJUN);
		KF_AddScore(GetMissionV(KF_SCORE_JIANGJUN));
	else
		KF_AddScore(GetMissionV(KF_SCORE_JIANGJUN), CampOne_ID, f);
	end
	SetNpcLifeTime(id, 0);
	Msg2MSAll(KF_MISSION_ID, format("%s b� ��nh b�i, lui v� ��i doanh %s.", "Li�u T��ng Qu�n", "Qu�n Li�u"));
end