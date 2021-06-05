Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local tSay = {
		"\nSao c� th� ���c, ta s� chi�n ��u ��n c�ng./nothing",
		"\nR�i kh�i chi�n tr��ng/leave_battle",	
	}
	Say("<color=green>T�ng Qu�n Th��ng Binh<color>:".."C�c h� mu�n r�i kh�i chi�n tr��ng sao? Th�t ��ng ti�c.", getn(tSay), tSay);
end

function leave_battle()
	local tSay = {
		"\n�� ta suy ngh� l�i/nothing",
	}

	if GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_PEACE and
	GetMissionV(MV_BATTLE_STATE) ~= MS_STATE_READY then
		tinsert(tSay, 1, "\nX�c nh�n/sure");
	end
	Say("<color=green>T�ng Qu�n Th��ng Binh<color>:".."C�c h� x�c ��nh mu�n r�i kh�i chi�n tr��ng?", getn(tSay), tSay);
end

function sure()
	local nCamp = KF_GetCamp();
	DelMSPlayer(KF_MISSION_ID, nCamp);
end