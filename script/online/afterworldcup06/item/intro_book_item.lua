Include("\\script\\online\\afterworldcup06\\hand_in_hand_head.lua");
function OnUse()
	local selTab = {
				"Xem c�n bao nhi�u th�i gian m�i c� th� n�m tay/c�ng c��i ng�a/see_time1",
				"Xem c�n bao nhi�u th�i gian c� th� nh�n ph�n th��ng/see_time2",
				"Xem h�m bay c�n bao nhi�u c� h�i nh�n th�/see_get_card_times",
				"Xem th�i gian sinh t�n c�n l�i c�a th� c�ng/see_pet_life",
				"B� th� c�ng/kill_follower",
				"��ng h��ng d�n/nothing",
				}
	if Is_HandInHand_Open() == 1 then
		Say("<color=green>H��ng d�n ho�t ��ng c�p th� gi�i<color>: Ho�t ��ng c�p th� gi�i ti�n h�nh t� <color=yellow>ng�y 14 th�ng 7 ��n 23 th�ng 7<color>.",getn(selTab),selTab);
	else
		for i=1,3 do
			tremove(selTab,1);
		end;
		Say("<color=green>H��ng d�n ho�t ��ng c�p th� gi�i<color>: Ho�t ��ng c�p th� gi�i �� k�t th�c, ng��i ch�i ch�a nh�n ph�n th��ng tr��c ng�y <color=yellow>6 th�ng 8<color> ��n g�p ��a b� b�n c�nh D� T�u ��i th��ng.",getn(selTab),selTab);
	end;
end;

function see_pet_life()
	local nSecLeft = 60*60*24-GetTime()+GetTask(TASK_GOTPET_TIME);
	if GetTask(TASK_GOTPET_TIME) == 0 then
		Talk(1,"OnUse","Hi�n b�n kh�ng c� th� c�ng");
	else
		if nSecLeft < 0 then
			nSecLeft = 0;
		end;
		local nHour = floor(nSecLeft/3600)
		local nMin = 0;
		local nSec = mod(nSecLeft,60);
		local sStrTime = "";
		if nHour >= 1 then
			sStrTime = nHour.."h ";
		end;
		nMin = floor((mod(nSecLeft,3600))/60);
		if nMin >= 1 then
			sStrTime = sStrTime..nMin.." ph�t "..nSec.." Gi�y ";
		else
			sStrTime = sStrTime..nSec.." Gi�y ";
		end;
		Talk(1,"OnUse","Th�i gian sinh t�n th� c�ng c�a b�n c�n <color=yellow>"..sStrTime.."<color>.");
	end;
end;

function see_get_card_times()
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(TASK_GOTCARD_DATE) < nDate then
		SetTask(TASK_GOTCARD_COUNT,0);
	end;
	Talk(1,"OnUse","H�m nay b�n c�n c� th� nh�n th� <color=yellow>"..(6-GetTask(TASK_GOTCARD_COUNT)).."<color> l�n");
end;

function see_time1()
	local nSecLeft = WAIT_TIME-GetTime()+GetTask(TASK_GOTCARD_TIME);
	if GetTask(TASK_GOTCARD_TIME) == 0 then
		Talk(1,"OnUse","Kho�ng c�ch th�i gian l�n n�m tay/c�ng c��i ng�a k� ti�p c�n <color=yellow>0 gi�y<color>");
	else
		if nSecLeft < 0 then
			nSecLeft = 0;
		end;
		local nMin = floor(nSecLeft/60);
		local nSec = mod(nSecLeft,60);
		local sStrTime = "";
		if nMin >= 1 then
			sStrTime = nMin.." ph�t "..nSec.." Gi�y ";
		else
			sStrTime = nSec.." Gi�y ";
		end;
		Talk(1,"OnUse","Th�i gian n�m tay/c�ng c��i th� k� ti�p c�n <color=yellow>"..sStrTime.."<color>");
	end;
end;

function see_time2()
	local nSecLeft = GET_AWARD_INTERVAL-GetTime()+GetTask(TASK_GOTAWARD_TIME);
	if GetTask(TASK_GOTAWARD_TIME) == 0 then
		Talk(1,"OnUse","Th�i gian ��i ph�n th��ng k� ti�p c�n <color=yellow>0<color> gi�y");
	else
		if nSecLeft < 0 then
			nSecLeft = 0;
		end;
		local nMin = floor(nSecLeft/60);
		local nSec = mod(nSecLeft,60);
		local sStrTime = "";
		if nMin >= 1 then
			sStrTime = nMin.." ph�t "..nSec.." Gi�y ";
		else
			sStrTime = nSec.." Gi�y ";
		end;
		Talk(1,"OnUse","Th�i gian �� ��i ph�n th��ng k� ti�p c�n <color=yellow>"..sStrTime.."<color>");
	end;
end;

function kill_follower()
	local selTab = {
				"��ng v�y! Phi�n ph�c qu�!/confirm_to_kill",
				"Kh�ng c�n/nothing",
				}
	Say("B�n mu�n b� th� c�ng?",getn(selTab),selTab);
end;

function confirm_to_kill()
	KillFollower();
	SetTask(TASK_GOTPET_TIME,0);
end;