Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function main()
	local tSay = {}
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		tinsert(tSay, "M�i Ti�n Phong xu�t tr�n/order_xianfeng");
		tinsert(tSay, "M�i �� Th�ng ph�ng th�/order_duwei");
	end
	local tTemp = {
		[ALL_ID] = "Trung l�p",
		[CampOne_ID] = "T�ng qu�n chi�m l�nh",
		[CampTwo_ID] = "Li�u qu�n chi�m l�nh",	
	}
	--tinsert(tSay, "\n�뿪ս��/del_player_from_mision")
	tinsert(tSay, "\nTa suy ngh� l�i/nothing")
	Say("<color=green>Li�u Nguy�n So�i: <color>"..
		format("Cu�c chi�n v� c�ng kh�c li�t, c�c h� mu�n h� tr� g�? Ng��i c� qu�n h�m <color=%s>T��ng Qu�n<color> tr� l�n c� th� �i�u binh khi�n t��ng. Hi�n t�i t�nh h�nh c�c tr�n nh�n chi�m l�nh nh� sau:", (abs(GetTask(704)) >= KF_TITIL_JIANGJUN and "green") or "red")..
		format("C�nh M�n (%s), Di�t M�n (%s), Sinh M�n (%s), T� M�n (%s), ��i Tr�n K� (%s).", tTemp[GetMissionV(MV_BATTLE_FLAG_JM)], 
		tTemp[GetMissionV(MV_BATTLE_FLAG_MM)], tTemp[GetMissionV(MV_BATTLE_FLAG_SM)], tTemp[GetMissionV(MV_BATTLE_FLAG_SI)], tTemp[GetMissionV(MV_BATTLE_FLAG_DA)]),
		getn(tSay), tSay)
end

function check_title()
	if abs(GetTask(704)) >= KF_TITIL_JIANGJUN then
		return 1;
	else
		return 0;
	end
end

function order_xianfeng()
	if check_title() == 0 then
		Talk(1,"","Qu�n h�m c�a c�c h� kh�ng ��! Kh�ng th� tri�u h�i.")
		return 0;
	end
	local nCamp = KF_GetCamp();
	local tSay = KF_GetSayTale(nCamp, 1, 0);
	local nTime = KF_GetXianfengCD();
	local nCount = 1;
	if nTime > 0 then 
		nCount = 0;
	end
	Say("<color=green>Li�u Nguy�n So�i: <color>"..
		format("Ti�n Phong c� th� ph�i ��n m�t tr�n nh�n b�t k�, b�t k� tr�n nh�n �� c� ph�i l� phe ta chi�m l�nh hay kh�ng. Hi�n t�i phe ta ch� c� %d v� ti�n phong, c� %d ph�t th�i gian g�i l�i", nCount, ceil(nTime/60)), getn(tSay), tSay);
end

function order_duwei()
	if check_title() == 0 then
		Talk(1,"","Qu�n h�m c�a c�c h� kh�ng ��! Kh�ng th� tri�u h�i.")
		return 0;
	end
	local nCamp = KF_GetCamp();
	local tSay = KF_GetSayTale(nCamp, 2, 1);
	local nTime = KF_GetDuWeiCD();
	local nCount = 1;
	if nTime > 0 then 
		nCount = 0;
	end
	Say("<color=green>Li�u Nguy�n So�i: <color>"..
		format("�� �y ch� c� th� ��n Tr�n K� phe ta �� chi�m. Hi�n c� %d �� �y, th�i gian ch� %d ph�t", nCount, ceil(nTime/60)), getn(tSay), tSay);
end

function del_player_from_mision()
	local nCamp = KF_GetCamp();
	DelMSPlayer(KF_MISSION_ID, nCamp);
end
