-- �����ͼ���NPC

Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\gongcheng\\personal_task\\task_head.lua")


tMap2CityMap =
{
	[889] = 300,
}

function main()
	Say("Th�n l� v� l�m nh�n s� kh�ng th� ch�i b� tr�ch nhi�m ch�ng gi�c ngo�i x�m, gi�p b�ch t�nh sinh s�ng y�n b�nh!",
		5,
		"Gi�i thi�u H�i Phong tr�i/hui_jieshao",
		"Ng�n c�n ti�p vi�n/start_task",
		"Ho�n th�nh nhi�m v�/complete_task",
		"R�i kh�i H�i Phong tr�i/leave_task",
		"K�t th�c ��i tho�i/no_say")
	init_fight()
end

function hui_jieshao()
	Say("H�i Phong tr�i l� n�i ��a th� hi�m tr�, s�ng ng�i ch�ng ch�t, ch� c� 3 c�y c�u �� qua, n�i n�y l� ph�ng tuy�n chi�n ��u cu�i c�ng c�a ��ch, x�y d�ng m�t h� th�ng li�n ho�n c�c c�ng tr�nh ti�p vi�n, Kho�ng tr��ng, tr�i ng�a, kho l��ng, l�y g�\nH�i Phong tr�i cao th� v� s�, to�n l�m chuy�n x�u xa. H�y ti�u di�t ch�ng �o�t c�c b� h� gi�p �� ch�ng minh n�ng l�c c�a ng��i. (T� ��i ti�u di�t ��u m�c ��i ph��ng, m�i th�nh vi�n��u nh�n ���c h� gi�p)",0)
end

function complete_task()
	Say("Th�n l� v� l�m nh�n s� kh�ng th� ch�i b� tr�ch nhi�m ch�ng gi�c ngo�i x�m, gi�p b�ch t�nh sinh s�ng y�n b�nh!",
		3,
		"Ng�n c�n ti�p vi�n-tr�i ng�a v� kho l��ng/complete_task_1",
		"Ng�n c�n ti�p vi�n-Kho�ng tr��ng v� khi ��n g�/complete_task_2",
		"C� h�i/no_say")
end

function complete_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask1 < 1 or nNow > nDate then
		Say("H�m nay ng��i ch�a nh�n nhi�m v� n�y.", 0)
		return
	end
	
	if nTask1 > 1 then
		Say("Ng��i �� ho�n th�nh nhi�m v� n�y.", 0)
		return
	end
	
	if _11 == 1 and _12 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", 2, _11, _12, nTask2, _21, _22, nDate)
			Say("Ng��i �� ho�n th�nh nhi�m v�, nh�n ���c m�t huy ch��ng.", 0)
			Msg2Player("Ho�n th�nh nhi�m v�: ng�n c�n ti�p vi�n-tr�i ng�a v� kho l��ng")
		end
	elseif _11 == 1 then
		Say("B�n �� ti�u di�t Th� v� tr�i ng�a, ph�i ti�u di�t lu�n <color=yellow>Th� v� kho l��ng<color> m�i c� th� ho�n th�nh nhi�m v� n�y",0)
	elseif _12 == 1 then
		Say("B�n �� ti�u di�t Th� v� kho l��ng, c�n ph�i ti�u di�t<color=yellow>Th� v� tr�i ng�a<color> m�i c� th� ho�n th�nh nhi�m v� n�y",0)
	else
		Say("B�n c�n ti�u di�t <color=yellow>Th� v� kho l��ng<color>v�<color=yellow>Th� v� tr�i ng�a<color> m�i c� th� ho�n th�nh nhi�m v� n�y.",0)
	end
end

function complete_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nTask2 < 1 or nNow > nDate then
		Say("H�m nay ng��i ch�a nh�n nhi�m v� n�y.", 0)
		return
	end
	
	if nTask2 > 1 then
		Say("Ng��i �� ho�n th�nh nhi�m v� n�y.", 0)
		return
	end
	
	if _21 == 1 and _22 == 1 then
		if Zgc_pub_goods_add_chk(1,1) == 1 then
			AddItem(2,0,765,1)
			CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1, _11, _12, 2, _21, _22, nDate)
			Say("Ng��i �� ho�n th�nh nhi�m v�, nh�n ���c m�t huy ch��ng.", 0)
			Msg2Player("B�n �� ho�n th�nh nhi�m v�: ng�n c�n ti�p vi�n-Kho�ng tr��ng v� M�c tr��ng")
		end
	elseif _21 == 1 then
		Say("B�n �� ti�u di�t Th� v� Kho�ng tr��ng, c�n ph�i ti�u di�t <color=yellow>Th� v� M�c tr��ng<color> m�i c� th� ho�n th�nh nhi�m v� n�y.",0)
	elseif _22 == 1 then
		Say("B�n �� ti�u di�t Th� v� M�c tr��ng, c�n ph�i ti�u di�t <color=yellow>Th� v� Kho�ng tr��ng<color> m�i c� th� ho�n th�nh nhi�m v� n�y.",0)
	else
		Say("B�n c�n ti�u di�t <color=yellow>Th� v� Kho�ng tr��ng<color>v�<color=yellow>Th� v� M�c tr��ng<color> m�i c� th� ho�n th�nh nhi�m v� n�y.",0)
	end
end

function start_task()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow > nDate then		-- ��������������
		CustomDataSave("tongcitywar_person_map_task", "ddddddd", 0, 0, 0, 0, 0, 0, nNow)
	end

	Say("Th�n l� v� l�m nh�n s� kh�ng th� ch�i b� tr�ch nhi�m ch�ng gi�c ngo�i x�m, gi�p b�ch t�nh sinh s�ng y�n b�nh!",
		3,
		"Ng�n c�n ti�p vi�n-tr�i ng�a v� kho l��ng/get_task_1",
		"Ng�n c�n ti�p vi�n-Kho�ng tr��ng v� khi ��n g�/get_task_2",
		"C� h�i/no_say")
end

function get_task_1()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("H�m nay ng��i �� nh�n nhi�m v� n�y.",0)
		return
	end
	Say("Ng�a v� l��ng th�o ch�nh l� n�n t�ng c� b�n �� chi�n ��u, h�y �i ��t s�ch kho l��ng v� tr�i ng�a c�a ��ch!",
		2,
		"Ti�p nh�n nhi�m v�/get_task_1_yes",
		"C� h�i/no_say")
end

function get_task_2()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("H�m nay ng��i �� nh�n nhi�m v� n�y.",0)
		return
	end
	Say("Gi� h�y �i ti�u di�t b�n l�nh canh g�c Kho�ng tr��ng v� M�c tr��ng.",
		2,
		"Ti�p nh�n nhi�m v�/get_task_2_yes",
		"C� h�i/no_say")
end

function get_task_1_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask1 >= 1 then
		Say("H�m nay ng��i �� nh�n nhi�m v� n�y.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", 1,0,0,nTask2,_21,_22,nNow)
	Msg2Player("Ti�p nh�n nhi�m v�: ng�n c�n ti�p vi�n-tr�i ng�a v� kho l��ng")
end

function get_task_2_yes()
	local nNow = tonumber(date("%y%j"))
	local nTask1, _11, _12, nTask2, _21, _22, nDate = CustomDataRead("tongcitywar_person_map_task")
	if nNow <= nDate and nTask2 >= 1 then
		Say("H�m nay ng��i �� nh�n nhi�m v� n�y.",0)
		return
	end
	CustomDataSave("tongcitywar_person_map_task", "ddddddd", nTask1,_11,_12,1,0,0,nNow)
	Msg2Player("Ti�p nh�n nhi�m v�: ng�n c�n ti�p vi�n-Kho�ng tr��ng v� M�c tr��ng")
end

function leave_task()
	uninit_fight()
	LeaveTeam()
	SetLogoutRV(0)
	NewWorld(300, 1732, 3540)
end

function no_say()
end