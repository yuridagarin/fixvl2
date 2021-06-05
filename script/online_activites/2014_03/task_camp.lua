Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

WN_201403_CAMPTASK_ID = 118

WN_201403_CAMPTASK_NPC = "<color=green>Th�i th� T��ng D��ng<color>:"

WN_201403_CAMPTASK_TASKGROUP = TaskManager:Create(10, 8)
WN_201403_CAMPTASK_TASKGROUP.DaySeq = 1
WN_201403_CAMPTASK_TASKGROUP.TaskStatus = 2 --0δ��ȡ1��ȡ����2����ɱ��3���
WN_201403_CAMPTASK_TASKGROUP.TaskStep1 = 3
WN_201403_CAMPTASK_TASKGROUP.TaskStep2 = 4
WN_201403_CAMPTASK_TASKGROUP.TaskStep3 = 5
WN_201403_CAMPTASK_TASKGROUP.TaskStep4 = 6
WN_201403_CAMPTASK_TASKGROUP.IsAward1 = 7
WN_201403_CAMPTASK_TASKGROUP.IsAward2 = 8
WN_201403_CAMPTASK_TASKGROUP.IsAward3 = 9

function WN_201403_CampTask_DailyReset()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.DaySeq, zgc_pub_day_turn())
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward2, 0)
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward3, 0)
	end
end

--KillNpc
function WN_201403_CampTask_Killer(sName)
	if gf_CheckEventDateEx(WN_201403_CAMPTASK_ID) ~= 1 then
		return
	end
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus) == 3 then
		return
	end
	local nMapID, nX, nY = GetWorldPos()
	gf_TeamOperateEX(function ()
		if %nMapID ~= GetWorldPos() then
			return
		end
		local nNum1 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1)
		if %sName == "Oa Qu�c L�ng Nh�n" and nNum1 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1,  nNum1 + 1)
			Msg2Player(format("Ti�u di�t %d/%d Oa qu�c l�ng nh�n",nNum1 + 1,300))
			nNum1 = nNum1 + 1
		end
		local nNum2 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2)
		if %sName == "H�i T�c" and nNum2 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2,  nNum2 + 1)			
			Msg2Player(format("Ti�u di�t  %d/%d H�i t�c",nNum2 + 1,300))
			nNum2 = nNum2 + 1
		end
		local nNum3 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3)
		if %sName == "Oa Qu�c �ao kh�ch" and nNum3 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3,  nNum3 + 1)			
			Msg2Player(format("Ti�u di�t %d/%d Oa qu�c �ao kh�ch",nNum3 + 1,300))
			nNum3 = nNum3 + 1
		end
		local nNum4 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4)
		if %sName == "S�t th� ngo�i t�c" and nNum4 < 300 then
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4,  nNum4 + 1)			
			Msg2Player(format("Ti�u di�t %d/%d Ngo�i t�c s�t th�",nNum4 + 1,300))
			nNum4 = nNum4 + 1
		end
		if nNum1 >= 300 and nNum2 >= 300 and nNum3 >= 300 and nNum4 >= 300 then
			Talk(1,"","b�n �� ho�n th�nh nhi�m v� qu�n doanh!")		
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 3)
			return
		end
	end)
end

--̫��
WN_201403_CAMPTASK_TASK = "Nh�n nhi�m v� qu�n doanh/WN_201403_CampTask_GetTask"

function WN_201403_CampTask_GetTask()
	WN_201403_CampTask_DailyReset()
	local nStatus = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus)
	if 1 == nStatus then
		Talk(1,"","B�n �� nh�n nhi�m v� qu�n doanh, mau ��n T��ng D��ng t�m ch� huy s� �� t�m hi�u t�nh h�nh �i!")
		return
	end
	if 2 == nStatus then
		Talk(1,"","B�n �� nh�n nhi�m v� qu�n doanh, Oa Kh�u xu�t hi�n � trung nguy�n, b�ch t�nh c�m ph�n, h�y �i t�m v� gi�t ch�ng �i!")
		return
	end
	if 3 == nStatus then
		Talk(1,"","b�n �� ho�n th�nh nhi�m v� qu�n doanh")
		return
	end
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 1)
	Talk(1,"","B�n �� nh�n nhi�m v� qu�n doanh, mau ��n T��ng D��ng t�m ch� huy s� �� t�m hi�u t�nh h�nh �i!")
	Msg2Player("B�n �� nh�n nhi�m v� qu�n doanh, mau ��n T��ng D��ng t�m ch� huy s� �� t�m hi�u t�nh h�nh �i!")
	TaskTip("B�n �� nh�n nhi�m v� qu�n doanh, mau ��n T��ng D��ng t�m ch� huy s� �� t�m hi�u t�nh h�nh �i!")
end

--����ָ��ʹ
function WN_201403_CampTask_DealTask()
	local nStatus = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus)
	if 1 == nStatus then
		Talk(1,"","B�n �� nh�n nhi�m v� qu�n doanh, Oa Kh�u xu�t hi�n � trung nguy�n, b�ch t�nh c�m ph�n, h�y �i t�m v� gi�t ch�ng �i!".."\n<color=red>Ti�u di�t 300 Oa qu�c l�ng nh�n(��ng h�i h�i t�n 2)\nTi�u di�t 300 h�i t�c (��ng h�i h�i taan2)\nTi�u di�t 300 Oa qu�c �ao kh�ch(Thanh �m ��ng 1)\nTi�u di�t 300 ngo�i t�c s�t th� (V��ng K� B� L�c)\n<color>")
		TaskTip("Ti�u di�t 300 Oa qu�c l�ng nh�n ( ��ng h�i h�i t�n 2)")
		TaskTip("Ti�u di�t  300 H�i t�c ( ��ng h�i h�i t�n 2)")
		TaskTip("Ti�u di�t 300 Oa qu�c �ao kh�ch (Thanh �m ��ng 1)")
		TaskTip("ti�u di�t300S�t th� ngo�i t�c (b� l�c V��ng K� )")
		WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 2)
		return 1
	end
	if 2 == nStatus then
		local nNum1 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep1)
		local nNum2 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep2)
		local nNum3 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep3)
		local nNum4 = WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStep4)
  	if nNum1 >= 300 and nNum2 >= 300 and nNum3 >= 300 and nNum4 >= 300 then
			Talk(1,"","b�n �� ho�n th�nh nhi�m v� qu�n doanh!".."Mau ��n T��ng D��ng t�m �� t� th� r�n L�u nh�n th��ng �i!")		
			WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus, 3)
			return 1
		end
		Talk(1,"","B�n �� nh�n nhi�m v� qu�n doanh, Oa Kh�u xu�t hi�n � trung nguy�n, b�ch t�nh c�m ph�n, h�y �i t�m v� gi�t ch�ng �i!".."\n<color=red>Ti�u di�t 300 Oa qu�c l�ng nh�n(��ng h�i h�i t�n 2)\nTi�u di�t 300 h�i t�c (��ng h�i h�i taan2)\nTi�u di�t 300 Oa qu�c �ao kh�ch(Thanh �m ��ng 1)\nTi�u di�t 300 ngo�i t�c s�t th� (V��ng K� B� L�c)\n<color>")
		Msg2Player(format("Ti�u di�t %d/%d Oa qu�c l�ng nh�n ( ��ng h�i h�i t�n 2)",nNum1,300))
		Msg2Player(format("Ti�u di�t %d/%d H�i t�c ( ��ng h�i h�i t�n 2)",nNum2,300))
		Msg2Player(format("Ti�u di�t %d/%d Oa qu�c �ao kh�ch (Thanh �m ��ng 1)",nNum3,300))
		Msg2Player(format("ti�u di�t%d/%dS�t th� ngo�i t�c (b� l�c V��ng K� )",nNum4,300))
		return 1
	end
	if 3 == nStatus then
		Talk(1,"","b�n �� ho�n th�nh nhi�m v� qu�n doanh!")
		return 1
	end
	return 0
end

--���������ӶԻ�
WN_201403_CAMPTASK_AWARD = "Qu�n doanh-t��ng s� t�i n�ng/WN_201403_CampTask_GetAward"

function WN_201403_CampTask_GetAward()
	WN_201403_CampTask_DailyReset()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.TaskStatus) ~= 3 then
		Talk(1,"","Ho�n th�nh nhi�m v� xong m�i ���c nh�n th��ng")
		return
	end
	local tSay = {
		"nh�n th��ng qu�n doanh/WN_201403_CampTask_GetAward_1",
		"��i qu�n c�ng ch��ng anh h�ng/WN_201403_CampTask_GetAward_2",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("<color=green>�� t� th� r�n L�u<color>: Ta l� �� t� gi�i nh�t c�a th� r�n L�u. Ta c� th� gi�p ng��i th�ng c�p trang b� linh kh� cao c�p. Ngo�i ra, n�u ng��i c� trang b� th��ng c� th�n kh� Ho�ng ��, ta c�ng c� th� th�i th�n kh� gi�p ng��i, l�m cho trang b� ph� h�p v�i ng��i h�n. <color=red>L�u �, n�u v� kh� c�a ng��i �� k�ch ho�t Linh Ph�ch, sau khi ta ti�n h�nh thao t�c, Linh Ph�ch s� b� hu�.<color>",
		getn(tSay), tSay)
end

function WN_201403_CampTask_GetAward_1()
	local tSay = {
			"mi�n ph� ( ti�u hao 07 gi� t�ch l�y online)/WN_201403_CampTask_GetAward_1_1",
			"ti�u ph� ( ti�u hao 07 gi� t�ch l�y online + 299 v�ng)/WN_201403_CampTask_GetAward_1_2",
			"VIP ( ti�u hao 07 gi� t�ch l�y online + 299 v�ng + 299 Xu v�t ph�m)/WN_201403_CampTask_GetAward_1_3",
			"T�i h� ch� xem qua th�i/nothing"
	}
	Say("<color=green>�� t� th� r�n L�u<color>: Ta l� �� t� gi�i nh�t c�a th� r�n L�u. Ta c� th� gi�p ng��i th�ng c�p trang b� linh kh� cao c�p. Ngo�i ra, n�u ng��i c� trang b� th��ng c� th�n kh� Ho�ng ��, ta c�ng c� th� th�i th�n kh� gi�p ng��i, l�m cho trang b� ph� h�p v�i ng��i h�n. <color=red>L�u �, n�u v� kh� c�a ng��i �� k�ch ho�t Linh Ph�ch, sau khi ta ti�n h�nh thao t�c, Linh Ph�ch s� b� hu�.<color>",
		getn(tSay), tSay)
end

VET_LOGINTIME_TASK = 2536 --��λ��min
function WN_201403_VetGetTime()
	return GetTask(VET_LOGINTIME_TASK) --�ۼƵ�½����min
end

function WN_201403_VetSetTime(nMinute)
	SetTask(VET_LOGINTIME_TASK, nMinute) --�����ۼ�ʱ��min
end

function WN_201403_CampTask_GetAward_1_1()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1) ~= 0 then
		Talk(1,"","M�t ng�y ch� nh�n ���c m�t l�n th��ng, h�n g�p l�i ng�y mai nh�!")
		return
	end
	if gf_Judge_Room_Weight(1, 100) ~= 1 then
		Talk(1,"",format("T�i kh�ng �� %d", 1))
		return
	end
	local nTime = WN_201403_VetGetTime()
	if nTime < 7 * 60 then
		Talk(1,"",format("Th�i gian t�ch l�y online kh�ng �� %d gi�", 7))
		return
	end
	WN_201403_VetSetTime(nTime - 7 * 60)
	--
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 1)
	gf_Modify("Exp", 30000000)
	gf_AddItemEx2({2, 1, 30499, 1, 4}, "Hu�n ch��ng anh h�ng", "2XU v�t ph�m", "nh�n qu�n c�ng t��ng", 0, 1)
end

function WN_201403_CampTask_GetAward_1_2()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1) ~= 0 then
		Talk(1,"","M�t ng�y ch� nh�n ���c m�t l�n th��ng, h�n g�p l�i ng�y mai nh�!")
		return
	end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"",format("T�i kh�ng �� %d", 2))
		return
	end
	if GetCash() < 2990000 then
		Talk(1,"",format("S� v�ng trong t�i kh�ng �� %d v�ng ", 299))
		return
	end
	local nTime = WN_201403_VetGetTime()
	if nTime < 7 * 60 then
		Talk(1,"",format("Th�i gian t�ch l�y online kh�ng �� %d gi�", 7))
		return
	end
	if Pay(2990000) ~= 1 then
		return
	end
	WN_201403_VetSetTime(nTime - 7 * 60)
	--
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 1)
	gf_Modify("Exp", 88000000)
	ahf_GetAFruits(18)
	gf_AddItemEx2({2, 1, 30499, 1, 4}, "Hu�n ch��ng anh h�ng", "2XU v�t ph�m", "nh�n qu�n c�ng t��ng", 0, 1)
end

function WN_201403_CampTask_GetAward_1_3()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1) ~= 0 then
		Talk(1,"","M�t ng�y ch� nh�n ���c m�t l�n th��ng, h�n g�p l�i ng�y mai nh�!")
		return
	end
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		Talk(1,"",format("T�i kh�ng �� %d", 2))
		return
	end
	if GetCash() < 2990000 then
		Talk(1,"",format("S� v�ng trong t�i kh�ng �� %d v�ng ", 299))
		return
	end
	if GetItemCount(2, 1, 30230) < 299 then
		Talk(1,"",format("S� Xu item trong t�i kh�ng �� %d", 299))
		return
	end
	local nTime = WN_201403_VetGetTime()
	if nTime < 7 * 60 then
		Talk(1,"",format("Th�i gian t�ch l�y online kh�ng �� %d gi�", 7))
		return
	end
	if Pay(2990000) ~= 1 then
		return
	end
	if DelItem(2, 1, 30230, 299) ~= 1 then
		return
	end
	WN_201403_VetSetTime(nTime - 7 * 60)
	--
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward1, 1)
	gf_Modify("Exp", 113114115)
	ahf_GetAFruits(39)
	gf_AddItemEx2({2, 1, 30499, 3, 4}, "Hu�n ch��ng anh h�ng", "2XU v�t ph�m", "nh�n qu�n c�ng t��ng", 0, 1)
end

function WN_201403_CampTask_GetAward_2()
	local tSay = {
			"��i 01 hu�n ch��ng anh h�ng (ti�u hao 150xu v�t ph�m+15 v�ng)/WN_201403_CampTask_GetAward_2_1",
			"��i 10 hu�n ch��ng anh h�ng(ti�u hao1500xu v�t ph�m + 150 v�ng)/WN_201403_CampTask_GetAward_2_2",
			"T�i h� ch� xem qua th�i/nothing"
	}
	Say("<color=green>�� t� th� r�n L�u<color>: Ta l� �� t� gi�i nh�t c�a th� r�n L�u. Ta c� th� gi�p ng��i th�ng c�p trang b� linh kh� cao c�p. Ngo�i ra, n�u ng��i c� trang b� th��ng c� th�n kh� Ho�ng ��, ta c�ng c� th� th�i th�n kh� gi�p ng��i, l�m cho trang b� ph� h�p v�i ng��i h�n. <color=red>L�u �, n�u v� kh� c�a ng��i �� k�ch ho�t Linh Ph�ch, sau khi ta ti�n h�nh thao t�c, Linh Ph�ch s� b� hu�.<color>",
		getn(tSay), tSay)
end

function WN_201403_CampTask_GetAward_2_1()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward2) ~= 0 then
		Talk(1,"","M�t ng�y ch� nh�n ���c m�t l�n th��ng, h�n g�p l�i ng�y mai nh�!")
		return
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return
	end
	if GetItemCount(2, 1, 30230) < 150 then
		Talk(1,"",format("S� Xu item trong t�i kh�ng �� %d", 150))
		return
	end
	if GetCash() < 150000 then
		Talk(1,"",format("S� v�ng trong t�i kh�ng �� %d v�ng ", 15))
		return
	end
	if Pay(150000) ~= 1 or DelItem(2, 1, 30230, 150) ~= 1 then
		return
	end
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward2, 1)
	gf_AddItemEx2({2, 1, 30499, 1, 4}, "Hu�n ch��ng anh h�ng", "2XU v�t ph�m", "��i hu�n ch��ng anh h�ng ", 0, 1)
end

function WN_201403_CampTask_GetAward_2_2()
	if WN_201403_CAMPTASK_TASKGROUP:GetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward3) ~= 0 then
		Talk(1,"","M�t ng�y ch� nh�n ���c m�t l�n th��ng, h�n g�p l�i ng�y mai nh�!")
		return
	end
	if gf_Judge_Room_Weight(1, 1, " ") ~= 1 then
		return
	end
	if GetItemCount(2, 1, 30230) < 1500 then
		Talk(1,"",format("S� Xu item trong t�i kh�ng �� %d", 1500))
		return
	end
	if GetCash() < 1500000 then
		Talk(1,"",format("S� v�ng trong t�i kh�ng �� %d v�ng ", 150))
		return
	end
	if Pay(1500000) ~= 1 or DelItem(2, 1, 30230, 1500) ~= 1 then
		return
	end
	WN_201403_CAMPTASK_TASKGROUP:SetTask(WN_201403_CAMPTASK_TASKGROUP.IsAward3, 1)
	gf_AddItemEx2({2, 1, 30499, 10, 4}, "Hu�n ch��ng anh h�ng", "2XU v�t ph�m", "��i hu�n ch��ng anh h�ng ", 0, 1)
end