-- �ͻ���Ҫ��ִ�еĽű�

TRADE_EXPORT_LOCK_ID = 825
AUTO_LOCK_TIME_ID = 827

Include("\\script\\global\\get_offline_point.lua")
--Include("\\script\\global\\wuxing.lua")
--Include("\\script\\lib\\define.lua")
--Include("\\script\\lib\\task_id_manage.lua")
Include("\\script\\task\\global_task\\gtask_data.lua");
function main(dwParam)
        if dwParam >= 65536 then
                code = floor(dwParam / 65536);
                dwParam = mod(dwParam, 65536);
                return dostring(format("func_%d(%d)",dwParam, code))
        end
        dostring("func_"..dwParam.."(0)")
end

function cancel()
end

--����ʱ��һ�����
function func_5()
	offline_exchange_talk_main();
end
function func_1()
	MPUpdate("\\script\\master_prentice\\some_op.lua", "create_task_r2s", 1)
end

function func_11(id)
	if not id or id < 0 or id > 16 then return end
	SetPlayerScript("\\settings\\static_script\\misc\\missionaward.lua");
	SendScript2VM("\\settings\\static_script\\misc\\missionaward.lua", format("MA_OnOpen(%d)",id));
end
function func_32() 	-- �콱
	tCampManage:ClearCampTaskID();
	SendScript2VM("\\script\\biwudahui\\wlzb_award.lua","exchange()");
end
function func_34()	-- ��ս
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnWant(%d,1)",PlayerIndex));
end
function func_35()	-- ��ս
	SendScript2VM("\\script\\biwudahui\\wlzb.lua",format("OnView(%d)",PlayerIndex));
end
-- �������׳�ʼ�Ի�
function func_2()
	Say("Kh�a giao d�ch: B�n c� th� ch�n th�i gian kh�a �� kh�a giao d�ch ho�c ch�n ch�c n�ng t� ��ng kh�a giao d�ch, gi�i thi�u c� th� sau ph�n ch�n ch�c n�ng c� gi�i thi�u chi ti�t. Khuy�n kh�ch s� d�ng ch�c n�ng kh�a giao d�ch t� ��ng c� th� b�o ��m an to�n cho t�i kho�n c�a b�n!",
	    4,
	    "Ta mu�n kh�a giao d�ch d��i 24 ti�ng/func_2_manual_24",
	    "Ta mu�n kh�a giao d�ch t� 24 ��n 48 ti�ng/func_2_manual_48",
	    "Ta mu�n thi�t l�p ch�c n�ng kh�a t� ��ng/func_2_auto",
	    "T�m th�i kh�ng th� kh�a/cancel");
end

-- �Զ���������
function func_2_auto()
	local nSec = GetTask(AUTO_LOCK_TIME_ID)
	if (nSec <= 0) then
		Say("Kh�a giao d�ch: B�n c� th� ch�n d�ng thi�t l�p t� ��ng kh�a �� ti�n h�nh kh�a giao d�ch t� ��ng. T� l�n ��ng nh�p sau n�u kh�ng c� thi�t l�p th�i gian kh�a giao d�ch ho�c th�i gian kh�a giao d�ch nh� h�n th�i gian d� ki�n kh�a giao d�ch th� IP m�y s� thay ��i. L�c n�y c�n c� v�o d�ng ch�n t� ��ng kh�a �� kh�a giao d�ch trong 1 kho�ng th�i gian.",
		    5,
		    "Sau khi online t� ��ng kh�a 5 ph�t/#auto_lock_confirm(5)",
		    "Sau khi online t� ��ng kh�a 15 ph�t/#auto_lock_confirm(15)",
		    "Sau khi online t� ��ng kh�a 30 ph�t/#auto_lock_confirm(30)",
		    "Sau khi online t� ��ng kh�a 60 ph�t/#auto_lock_confirm(60)",
		    "T�m th�i kh�ng th� kh�a/cancel")
	else
		local nAutoMin = floor(nSec / 60)
		Say("Kh�a giao d�ch: B�n �� ch�n kh�a t� ��ng "..nAutoMin.." ph�t. B�n c� th� ch�n s�a th�i gian kh�a t� ��ng c�ng c� th� t�m th�i h�y ch�c n�ng kh�a t� ��ng: ",
		    6,
		    "Sau khi online t� ��ng kh�a 5 ph�t/#auto_lock_confirm(5)",
		    "Sau khi online t� ��ng kh�a 15 ph�t/#auto_lock_confirm(15)",
		    "Sau khi online t� ��ng kh�a 30 ph�t/#auto_lock_confirm(30)",
		    "Sau khi online t� ��ng kh�a 60 ph�t/#auto_lock_confirm(60)",
		    "X�a ch�c n�ng kh�a t� ��ng/#auto_lock_confirm(0)",
		    "T�m th�i kh�ng s�a th�i gian kh�a/cancel")
	end
end

-- ȷ���Զ�������ʱ��
function auto_lock_confirm(nParam)
	if (nParam <= 0) then
		Say("Kh�a giao d�ch: B�n �� h�y ch�c n�ng kh�a giao d�ch, c� th� g�y nguy hi�m cho t�i kho�n c�a b�n, b�n x�c nh�n mu�n h�y?",
			2,
			"X�c nh�n/#auto_lock_confirm_2(0)",
			"T�m th�i kh�ng s�a th�i gian kh�a/cancel")
	else
		Say("Kh�a giao d�ch: B�n ch�n kh�a giao d�ch t� ��ng "..nParam.." ph�t, sau khi b�n ��ng nh�p, n�u kh�ng c� kh�a giao d�ch s� t� ��ng kh�a giao d�ch "..nParam.." ph�t. Khi b�n ��ng nh�p n�u th�i gian kh�a giao d�ch c�a b�n nh� h�n "..nParam.." ph�t c�ng s� t� ��ng kh�a giao d�ch "..nParam.." ph�t. B�n mu�n m� ch�c n�ng kh�a t� ��ng?",
			2,
			"��ng v�y/#auto_lock_confirm_2("..nParam..")",
			"T�m th�i kh�ng th� kh�a/cancel")
	end
end

function auto_lock_confirm_2(nParam)
	local nSec = nParam * 60
	SetTask(AUTO_LOCK_TIME_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[Kh�a giao d�ch]"..GetName().."Thi�t l�p kh�a giao d�ch, th�i gian kh�a l� "..nParam.." ph�t, IP ��ng nh�p "..nCurip..".");
	if (nParam <= 0) then
		Talk(1,"","Kh�a giao d�ch: B�n �� h�y ch�c n�ng kh�a giao d�ch!");
	else
		Talk(1,"","Kh�a giao d�ch: B�n �� ch�n thi�t l�p th�i gian kh�a giao d�ch t� ��ng <color=red>"..nParam.." ph�t<color>!");
	end
end

-- �ֶ���������ʱ�䣨24Сʱ���£�
function func_2_manual_24()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("Kh�a giao d�ch: B�n ch�n d�ng th�i gian kh�a �� thi�t l�p kh�a giao d�ch. Sau khi kh�a, <color=red>t� l�c b�t ��u kh�a ��n khi k�t th�c kh�a giao d�ch<color>, khi b�n ��ng nh�p l�i s� kh�ng th� giao d�ch c�c v�t ph�m nh� <color=red>ng�n l��ng, ng�n phi�u v� t�t c� c�c v�t ph�m<color> v�i ng��i kh�c, c�ng kh�ng th� v�t b� nh�ng v�n c� th� nh�n giao d�ch t� ng��i kh�c.",
			8,
			"Ta mu�n kh�a giao d�ch 2h/#confirm_1_time(2)",
			"Ta mu�n kh�a giao d�ch 4h/#confirm_1_time(4)",
			"Ta mu�n kh�a giao d�ch 8h/#confirm_1_time(8)",
			"Ta mu�n kh�a giao d�ch12h/#confirm_1_time(12)",
			"Ta mu�n kh�a giao d�ch 16h/#confirm_1_time(16)",
			"Ta mu�n kh�a giao d�ch 20h/#confirm_1_time(20)",
			"Ta mu�n kh�a giao d�ch 24h/#confirm_1_time(24)",
			"T�m th�i kh�ng th� kh�a/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("Kh�a giao d�ch: B�n �� kh�a giao d�ch. Hi�n t�i c�n d� <color=red>"..nLeftHour.."h "..nLeftMin.." ph�t<color>. Sau khi b�n ��ng nh�p l�i s� kh�ng th� giao d�ch <color=red>ng�n l��ng, ng�n phi�u v� t�t c� v�t ph�m<color> v�i ng��i kh�c c�ng kh�ng th� v�t b�. B�n c� mu�n thi�t l�p l�i thao t�c kh�a? H�y ch� � <color=red>Th�i gian kh�a giao d�ch m�i ch� c� th� l�n h�n th�i gian kh�a giao d�ch c�n l�i!<color>",
			8,
			"Ta mu�n kh�a giao d�ch 2h/#confirm_1_time(2)",
			"Ta mu�n kh�a giao d�ch 4h/#confirm_1_time(4)",
			"Ta mu�n kh�a giao d�ch 8h/#confirm_1_time(8)",
			"Ta mu�n kh�a giao d�ch12h/#confirm_1_time(12)",
			"Ta mu�n kh�a giao d�ch 16h/#confirm_1_time(16)",
			"Ta mu�n kh�a giao d�ch 20h/#confirm_1_time(20)",
			"Ta mu�n kh�a giao d�ch 24h/#confirm_1_time(24)",
			"T�m th�i kh�ng th� kh�a/cancel");		
	end
end

-- �ֶ���������ʱ�䣨24Сʱ - 48Сʱ��
function func_2_manual_48()
	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	if (nSec <= 0) then
		Say("Kh�a giao d�ch: B�n ch�n d�ng th�i gian kh�a �� thi�t l�p kh�a giao d�ch. Sau khi kh�a, <color=red>t� l�c b�t ��u kh�a ��n khi k�t th�c kh�a giao d�ch<color>, khi b�n ��ng nh�p l�i s� kh�ng th� giao d�ch c�c v�t ph�m nh� <color=red>ng�n l��ng, ng�n phi�u v� t�t c� c�c v�t ph�m<color> v�i ng��i kh�c, c�ng kh�ng th� v�t b� nh�ng v�n c� th� nh�n giao d�ch t� ng��i kh�c.",
			8,
			"Ta mu�n kh�a giao d�ch 1 ng�y 2h/#confirm_1_time(26)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 4h/#confirm_1_time(28)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 8h/#confirm_1_time(32)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 12h/#confirm_1_time(36)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 16h/#confirm_1_time(40)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 20h/#confirm_1_time(44)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 24h/#confirm_1_time(48)",
			"T�m th�i kh�ng th� kh�a/cancel");
	else
		local nLeftHour = floor(nSec / 3600)
		local nLeftMin = floor((nSec - nLeftHour * 3600) / 60)
		Say("Kh�a giao d�ch: B�n �� kh�a giao d�ch. Hi�n t�i c�n d� <color=red>"..nLeftHour.."h "..nLeftMin.." ph�t<color>. Sau khi b�n ��ng nh�p l�i s� kh�ng th� giao d�ch <color=red>ng�n l��ng, ng�n phi�u v� t�t c� v�t ph�m<color> v�i ng��i kh�c c�ng kh�ng th� v�t b�. B�n c� mu�n thi�t l�p l�i thao t�c kh�a? H�y ch� � <color=red>Th�i gian kh�a giao d�ch m�i ch� c� th� l�n h�n th�i gian kh�a giao d�ch c�n l�i!<color>",
			8,
			"Ta mu�n kh�a giao d�ch 1 ng�y 2h/#confirm_1_time(26)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 4h/#confirm_1_time(28)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 8h/#confirm_1_time(32)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 12h/#confirm_1_time(36)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 16h/#confirm_1_time(40)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 20h/#confirm_1_time(44)",
			"Ta mu�n kh�a giao d�ch 1 ng�y 24h/#confirm_1_time(48)",
			"T�m th�i kh�ng th� kh�a/cancel");		
	end
end

function confirm_1_time(nParam)

	local nSec = GetTask(TRADE_EXPORT_LOCK_ID)
	local nDesSec = nParam * 3600
	if (nDesSec < nSec) then
		Talk(1,"","Kh�a giao d�ch: Xin l�i! Th�i gian b�n ch�n kh�a giao d�ch nh� h�n th�i gian c�n l�i. V� th� kh�ng th� ti�n h�nh thao t�c kh�a l�i.");
		return
	end

	local month = tonumber(date("%m"))
	local day = tonumber(date("%d"))
	local hour = tonumber(date("%H"))
	local minute = tonumber(date("%M"))

	local month1 = month
	local day1 = day
	local hour1 = hour + nParam
	
	if (hour1 >= 24) then
		hour1 = hour1 - 24
		day1 = day1 + 1
		
		if (hour1 >= 24) then
			hour1 = hour1 - 24
			day1 = day1 + 1
		end
		
		if (day1 > 31 and (month1 == 1 or month1 == 3 or month1 == 5 or month1 == 7 or month1 == 8 or month1 == 10)) then
			day1 = day1 - 31
			month1 = month1 + 1
		end
		if (month1 == 12 and day1 > 31) then
			day1 = day1 - 31
			month1 = 1
		end
		if (month1 == 2 and day1 > 28) then
			day1 = day1 - 28
			month1 = 3
		end
		if (day1 > 30 and (month1 == 4 or month1 == 6 or month1 == 9 or month1 == 11)) then
			day1 = day1 - 30
			month1 = month1 + 1
		end
	end

	Say("Kh�a giao d�ch: B�n ch�n kh�a giao d�ch <color=red>"..nParam.."<color> gi�, t� <color=red>"..month.."Nguy�t"..day.."Nh�t"..hour.." �i�m"..minute.." ph�t ��n "..month1.."Nguy�t"..day1.."Nh�t"..hour1.." �i�m"..minute.." ph�t<color>, b�n x�c nh�n mu�n kh�a?",
		2,
		"\nX�c nh�n/#confirm_2_time("..nParam..")",
		"\nKh�ng c�n/cancel");
end

function confirm_2_time(nParam)
	Say("Kh�a giao d�ch: B�n ch�n kh�a giao d�ch <color=red>"..nParam.."<color> gi�, b�n x�c nh�n mu�n kh�a?",
		2,
		"\nX�c nh�n/#confirm_final_time("..nParam..")",
		"\nKh�ng c�n/cancel");
end

function confirm_final_time(nParam)
	local nSec = nParam * 3600
	SetTask(TRADE_EXPORT_LOCK_ID, nSec)
	local nLastip, nCurip = GetLoginIP()
	
	WriteLog("[Kh�a giao d�ch]"..GetName().."�� kh�a giao d�ch, th�i gian kh�a l� "..nParam.." gi�, IP ��ng nh�p l� "..nCurip..".");
	Talk(1,"","Kh�a giao d�ch: B�n ch�n kh�a giao d�ch <color=red>"..nParam.." gi�<color> th�nh c�ng!");
end
function func_40()
	local nRet = OpenGTask();
end

function func_41()
	local nRet = FinishGTask();
end

function func_42(nTaskID)
	if not nTaskID or nTaskID == 0 then return end
	SetPlayerScript("\\script\\task\\global_task\\gtask_head.lua");
	SendScript2VM("\\script\\task\\global_task\\gtask_head.lua", format("tGtNpcMain:cancel_main(%d)",nTaskID));	
end

function func_43()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_JJ_shop()");	
end

function func_44()
	SetPlayerScript("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua");
	SendScript2VM("\\settings\\static_script\\vip_feedback_system\\vfs_main.lua", "vfs_open_YJ_shop()");	
end

function func_45()
	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_week_award()");
end

function func_46()
	SetPlayerScript("\\script\\missions\\nvn\\3v3\\3v3award.lua");
	SendScript2VM("\\script\\missions\\nvn\\3v3\\3v3award.lua", "get_3v3_last_season_award()");
end

function func_47(nLotteryType)
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", format("_lb_DoAward(%d)", nLotteryType));
end

function func_48()
	SetPlayerScript("\\script\\function\\lucky_box\\lb_head.lua");
	SendScript2VM("\\script\\function\\lucky_box\\lb_head.lua", "_lb_UIChange_Clean()");
end
