Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\task_access_code_def.lua")

--interface for viet----------
function _vjw_SetTaixu()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
	if nTimes < 2 then
		gf_SetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Tham gia Th�i H� Huy�n C�nh", nTimes + 1, 2));
	end
end

function _vjw_SetZyz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Ho�n th�nh T�i Nguy�n Chi�n", nTimes + 1, 1));
	end
end
-------------------------------

function _vjw_SetWjz()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 3);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 3, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Ho�n th�nh nhi�m v� V�n Ki�m Tr�ng", nTimes + 1, 1));
	end
end

function _vjw_SetLs()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		return 0;
	end
	local nTimes = gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 4);
	if nTimes < 1 then
		gf_SetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 4, nTimes + 1, TASK_ACCESS_CODE_VJW);
		Msg2Player(format("Nhi�m v� k�ch ho�t c�nh gi�i V� T�n: %s (%d/%d)", "Ho�n th�nh nhi�m v� L��ng S�n B�c", nTimes + 1, 1));
	end
end

function vjw_GetTaixu()
	return gf_GetMyTaskBit(TASKID_IB_ACT_WUZUN_TASK, 1, 2);
end

function vjw_GetWjz()
	return gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 3);
end

function vjw_GetLs()
	return gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 4);
end

function vjw_GetZyz()
	return gf_GetTaskBit(TASKID_IB_ACT_WUZUN_TASK, 5);
end

function vjw_GetTimes()
	return gf_GetTaskByte(TASKID_IB_ACT_WUZUN_TASK, 4);
end

function vjw_SetTimes()
	local nTimes = gf_GetTaskByte(TASKID_IB_ACT_WUZUN_TASK, 4);
	if nTimes >= 3 then
		return 0;
	end
	gf_SetTaskByte(TASKID_IB_ACT_WUZUN_TASK, 4, nTimes + 1, TASK_ACCESS_CODE_VJW);
end

function vjw_MerdianIBActivate()
	if gf_GetPlayerRebornCount() < 6 or GetLevel() < 90 then
		Say("<color=green>Nh�c B�t Qu�n:<color> Nh�n v�t ch�a ��t chuy�n sinh 6 c�p 90, kh�ng th� tham gia nhi�m v� k�ch ho�t V� T�n!", 0);
		return 0;
	end
	vjw_DailyReset();
	local msg = "<color=green>Nh�c B�t Qu�n:<color>"..format("Sau khi ho�n th�nh nh�ng nhi�m v� h�ng ng�y sau, %s c� th� nh�n ���c %d c� h�i th�ng c�p c�nh gi�i V� T�n.\n", gf_GetPlayerSexName(), 3);
	local nFinish = 1;
	local tColor = {
		[1] = {"<color=green>", "<color>"},
		[2] = {"<color=white>", "<color>"},
	}
	local tGoal = {
		{"Tham gia Th�i H� Huy�n C�nh", vjw_GetTaixu, 2},
		{"Ho�n th�nh nhi�m v� V�n Ki�m Tr�ng", vjw_GetWjz, 1},
		{"Ho�n th�nh nhi�m v� L��ng S�n B�c", vjw_GetLs, 1},
		{"Ho�n th�nh T�i Nguy�n Chi�n", vjw_GetZyz, 1},
	}
	for i = 1, getn(tGoal) do
		local nc = 0;
		if tGoal[i][2]() >= tGoal[i][3] then
			nc = 1;
		else
			nc = 2;
			nFinish = 0;
		end
		msg = msg..format("%s- %s(%d/%d)%s\n", tColor[nc][1], tGoal[i][1], tGoal[i][2](), tGoal[i][3], tColor[nc][2]);
	end
	local tSay = {};
	if nFinish == 1 then
		tinsert(tSay, format("Ta mu�n k�ch ho�t c�nh gi�i V� T�n (C�n %d l�n)/vjw_ActivateWZ", max(3 - vjw_GetTimes(), 0)));
		tinsert(tSay, format("Kh�ng c�n ��u/nothing"));
	else
		tinsert(tSay, format("Ho�n th�nh nhi�m v� r�i quay l�i/nothing"));
	end
	Say(msg, getn(tSay), tSay);
end

function vjw_DailyReset()
	local nDay = gf_TodayDate();
	if GetTask(TASKID_IB_ACT_WUZUN_TIME) ~= nDay then
		SetTask(TASKID_IB_ACT_WUZUN_TIME, nDay, TASK_ACCESS_CODE_VJW);
		SetTask(TASKID_IB_ACT_WUZUN_TASK, 0, TASK_ACCESS_CODE_VJW);
	end
end

function vjw_ActivateWZ()
	local msg = "<color=green>Nh�c B�t Qu�n:<color>"..format("Nguy�n li�u c�n ti�u hao �� k�ch ho�t c�nh gi�i V� T�n: <color=gold>%d B�n Long B�ch, %d XU ��o c�, %d N� Oa Tinh Th�ch<color>, k�ch ho�t c� x�c su�t th�t b�i, khi th�t b�i s� m�t m�t s� ��o c�", 8, 600, 3);
	Say(msg, 2, "��ng �/vjw_ActivateWZ_try", "H�y b�/nothing");
end

function vjw_ActivateWZ_try()
	if vjw_GetTimes() >= 3 then
		Say("<color=green>Nh�c B�t Qu�n:<color>"..format("H�m nay �� d�ng h�t s� l�n k�ch ho�t, ng�y mai h�y quay l�i!"), 0);
		return 0;
	end
	if GetItemCount(2, 1, 1000) < 8 then
		Say("<color=green>Nh�c B�t Qu�n:<color>"..format("H�nh trang kh�ng gian %s kh�ng �� %d", "B�n Long b�ch", 8), 0);
		return 0;
	end
	if GetItemCount(2, 1, 30230) < 600 then
		Say("<color=green>Nh�c B�t Qu�n:<color>"..format("H�nh trang kh�ng gian %s kh�ng �� %d", "XU ��o c�", 600), 0);
		return 0;
	end
	if GetItemCount(2, 1, 504) < 3 then
		Say("<color=green>Nh�c B�t Qu�n:<color>"..format("H�nh trang kh�ng gian %s kh�ng �� %d", "N� Oa Tinh Th�ch", 3), 0);
		return 0;
	end
	vjw_SetTimes();
	local nRand = random(100);
	if nRand > 92 then
		if DelItem(2, 1, 1000, 8) ~= 1 then
			return 0;
		end
		if DelItem(2, 1, 30230, 600) ~= 1 then
			return 0;
		end
		if DelItem(2, 1, 504, 3) ~= 1 then
			return 0;
		end
		local nMeridianLevel = MeridianGetLevel();
		if nMeridianLevel == 3 then
			MeridianUpdateLevel();
			PlaySound("\\sound\\sound_i016.wav");
			SetCurrentNpcSFX(PIdx2NpcIdx(),901,0,0);
		end
		local str = format("Ch�c m�ng %s%s k�ch ho�t V� T�n th�nh c�ng!", GetName(), gf_GetPlayerSexName());
		Say("<color=green>Nh�c B�t Qu�n:<color>"..str, 0);
		Msg2Global(msg);
	else
		local tLost = {
			{1, 70, {2, 1, 504, 1}},
			{2, 20, {2, 1, 1000, 6}},
			{3, 10, {2, 1, 30230, 100}},
		}
		local nIndex = gf_GetRandItemByTable(tLost, gf_SumRandBase(tLost), 1);
		DelItem(gf_UnPack(tLost[nIndex][3]));
		Msg2Player(format("K�ch ho�t th�t b�i! M�t �i %s*%d", GetItemName(tLost[nIndex][3][1], tLost[nIndex][3][2], tLost[nIndex][3][3]), tLost[nIndex][3][4]));
		Say("<color=green>Nh�c B�t Qu�n:<color>".."R�t ti�c, k�ch ho�t th�t b�i! L�n sau h�y quay l�i", 0);
	end
end