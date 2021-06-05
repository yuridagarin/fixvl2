Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online_activites\\head\\acitivity_additional_head.lua")
Include("\\script\\online\\zgc_public_fun.lua")

WN_201403_ACTIVITY_ID = 117

WN_201403_NPC_MAIN = "<color=green>V� N��ng<color>:"
WN_201403_NPC = "<color=green>Ph�ng ��ng Nhi<color>:"

WN_201403_DIALOG = {
	"nh�n nhi�m v� truy t�m �n t�n/WN_201403_GetTask",
	"nh�n ph�n th��ng ho�n th�nh nhi�m v� /WN_201403_FinishTask",
	"T�i h� ch� xem qua th�i/nothing",	
}

WN_201403_TASKGROUP = TaskManager:Create(9, 8)
WN_201403_TASKGROUP.DaySeq = 1
WN_201403_TASKGROUP.TaskStatus = 2 --0δ��ȡ1��һ��2�ڶ���3������4���5���콱
WN_201403_TASKGROUP.TaskStep1_1 = 3
WN_201403_TASKGROUP.TaskStep1_2 = 4
WN_201403_TASKGROUP.TaskStep1_3 = 5
WN_201403_TASKGROUP.TaskStep2_1 = 6
WN_201403_TASKGROUP.TaskStep2_2 = 7
WN_201403_TASKGROUP.TaskStep2_3 = 8
WN_201403_TASKGROUP.TaskStep3_1 = 9

function WN_201403_DailyReset()
	if WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus) == 4 then
		return
	end
	if WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.DaySeq, zgc_pub_day_turn())
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_1, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_2, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_3, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_1, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_2, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_3, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep3_1, 0)
	end
end

function WN_201403_GetTask()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus == 3 then
		Talk(1,"",WN_201403_NPC_MAIN.."b�n �� nh�n ���c nhi�m v� truy t�m �n t�n \n"..format("H�y �i %s t�m %s ho�n th�nh nhi�m v�!", "Thi�n s� b� c�nh", "�� T� C�n L�n"))
		return
	end
	if nTaskStatus == 2 then
		Talk(1,"",WN_201403_NPC_MAIN.."b�n �� nh�n ���c nhi�m v� truy t�m �n t�n \n"..format("H�y �i %s t�m %s ho�n th�nh nhi�m v�!", "D��c V��ng c�c", "L�u Tam "))
		return
	end
	if nTaskStatus == 1 then
		Talk(1,"",WN_201403_NPC_MAIN.."b�n �� nh�n ���c nhi�m v� truy t�m �n t�n \n"..format("H�y �i %s t�m %s ho�n th�nh nhi�m v�!", "Th�nh ��", "Chu U�t Ly"))
		return
	end
	if nTaskStatus == 4 then
		Talk(1,"",WN_201403_NPC_MAIN.."B�n �� ho�n th�nh nhi�m v� truy t�m �n t�n, mau �i l�nh th��ng �i#")
		return
	end
	if nTaskStatus == 5 then
		Talk(1,"",WN_201403_NPC_MAIN.."B�n �� ho�n th�nh v� nh�n ph�n th��ng nhi�m v�, h�n g�p l�i ng�y mai nh�#")
		return
	end
	if nTaskStatus ~= 0 then
		Talk(1,"",WN_201403_NPC_MAIN.."Kh�ng th� nh�n nhi�m v�")
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 1)
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_1, 0)
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_2, 0)
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep1_3, 0)
	local msg = format("H�y �i %s t�m %s ho�n th�nh nhi�m v�!", "Th�nh ��", "Chu U�t Ly")
	Msg2Player(msg)
	Talk(1,"",msg)
	TaskTip(msg)
end

--ɱ��
function WN_201403_KillNpc(sName)
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) ~= 1 then
		return
	end
	local nStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nStatus ~= 1 and nStatus ~= 2 and nStatus ~= 3 then
		return
	end
	local nMapID, nX, nY = GetWorldPos()
	gf_TeamOperateEX(function ()
		if %nMapID ~= GetWorldPos() then
			return
		end
		local tbKill = {
			[1] = WN_201403_KILL_1,
			[2] = WN_201403_KILL_2,
			[3] = WN_201403_KILL_3,
		}
		local tbTask = {
			[1] = {3, 4, 5},
			[2] = {6, 7, 8},
			[3] = {9, 9, 9},
		}
		local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
		local tbKillSub = tbKill[nTaskStatus]
		if not tbKillSub then
			return
		end
		local tbTaskSub = tbTask[nTaskStatus]
		if not tbTaskSub then
			return
		end
		local nIndex = WN_201403_GetKind()
		local tbKillSub1 = tbKillSub[nIndex]
		if not tbKillSub1 then
			return
		end
		for i=1, getn(tbKillSub1) do
			if tbKillSub1[i][2] == %sName then
				local nNum = WN_201403_TASKGROUP:GetTask(tbTaskSub[i])
				if nNum < tbKillSub1[i][1] then
					WN_201403_TASKGROUP:SetTask(tbTaskSub[i], nNum + 1)
					if nNum + 1 == tbKillSub1[i][1] then
						Msg2Player(format("ti�u di�t%s %d/%d", %sName, nNum + 1, tbKillSub1[i][1]).."(Ho�n th�nh)")
					else
						Msg2Player(format("ti�u di�t%s %d/%d", %sName, nNum + 1, tbKillSub1[i][1]))
					end
				end
			end
		end
		local nIsCompelte = 1
		for i=1, getn(tbKillSub1) do
			if WN_201403_TASKGROUP:GetTask(tbTaskSub[i]) < tbKillSub1[i][1] then
				nIsCompelte = 0
			end
		end
		if nIsCompelte == 1 then
			local tName = {
				[1] = "Chu U�t Ly",
				[2] = "L�u Tam ",
				[3] = "�� T� C�n L�n",
			}
			Talk(1,"","B�n �� ho�n th�nh nhi�m v�!")
			Msg2Player("B�n �� ho�n th�nh nhi�m v�!"..format("Mau ch�ng �i t�m %s ho�n th�nh nhi�m v�", tName[nTaskStatus]))
		end
	end)
end

function WN_201403_GetKind()
	local nLevel = gf_GetPlayerRebornCount()
	local nKind = 1
	if nLevel <= 0 then
		return nKind
	end
	if nLevel > 0 and nLevel <= 5 then
		nKind = 2
	end
	if nLevel > 5 then
		nKind = 3
	end
	return nKind
end

WN_201403_KILL_1 =
{
	[1] = {
		{399, "T� B� Ti�n T�", "��ng V��ng M�u t�ng 1"},
		{399, "Tr� M�u H� V�", "Thi�n t�m th�p t�ng 1"},
		{399, "Tr� �ao H� V�", "Thi�n t�m th�p t�ng 1"},
	},
	[2] = {
		{500, "T�n Ti�n T�", "��ng V��ng M�u t�ng 2"},
		{500, "Ki�m ti�n T�", "��ng V��ng M�u t�ng 3"},
		{500, "Thi�n T�m Ph�p T�ng", "Thi�n t�m th�p t�ng 2"},
	},
	[3] = {
		{690, "��ch ti�n T�", "��ng V��ng M�u t�ng 3"},
		{690, "T�y H� D�ng S�", "D��c V��ng c�c"},
	},
}

--�����������Ի�
function WN_201403_Talk1()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus ~= 1 then
		return 0
	end
	local nKillNum1 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep1_1)
	local nKillNum2 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep1_2)
	local nKillNum3 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep1_3)
	local tbKillNum = {nKillNum1, nKillNum2, nKillNum3}
	local nIndex = WN_201403_GetKind()
	local tbKill = WN_201403_KILL_1[nIndex]
	if not tbKill then return end
	if 0 == nKillNum1 and 0 == nKillNum2 and 0 == nKillNum3 then
		for i =1, getn(tbKill) do
			local msg = format("Ti�u di�t %dcon%s(%s)", tbKill[i][1], tbKill[i][2], tbKill[i][3])
			Msg2Player(msg)
			TaskTip(msg)
		end
		Talk(1,"","�c t�c xu�t hi�n, gi�p ch�ng ta ti�u di�t ch�ng")
		return 1
	end
	local bIsComplete = 1
	local tbMsg = {}
	for i =1, getn(tbKill) do
		tinsert(tbMsg, format("Ti�u di�t%d/%dcon%s(%s)", tbKillNum[i], tbKill[i][1], tbKill[i][2], tbKill[i][3]))
		if tbKillNum[i] < tbKill[i][1] then
			bIsComplete = 0
		end
	end
	for i =1, getn(tbMsg) do
		Msg2Player(tbMsg[i])
		if bIsComplete ~= 1 then
			TaskTip(tbMsg[i])
		end
	end
	if bIsComplete == 1 then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 2)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_1, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_2, 0)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep2_3, 0)
		local msg = "Nhi�m v� ho�n th�nh!"..format("Mau �i%st�m%s�i!", "D��c V��ng c�c", "L�u Tam ")
		Msg2Player(msg)
		Talk(1,"",msg)
		TaskTip(msg)
	end
	return 1
end

WN_201403_KILL_2 =
{
	[1] = {
		{399, "Cung t��ng", "Ho�ng l�ng m� th�t t�ng 1"},
		{399, "K� ��o m�", "Ho�ng l�ng m� th�t t�ng 1"},
	},
	[2] = {
		{399, "T��ng binh m� H� V�", "Ho�ng l�ng m� th�t t�ng 1"},
		{399, "Cung t��ng", "Ho�ng l�ng m� th�t t�ng 1"},
		{399, "T��ng binh m� V� V�", "Ho�ng l�ng m� th�t t�ng 1"},
	},
	[3] = {
		{690, "Th��ng t��ng", "Ho�ng l�ng m� th�t t�ng 2"},
		{690, "T�m B�o Nh�n", "M� cung sa m�c"},
	},
}

--ҩ��������������Ի�
function WN_201403_Talk2()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus ~= 2 then
		return 0
	end
	local nKillNum1 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep2_1)
	local nKillNum2 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep2_2)
	local nKillNum3 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep2_3)
	local tbKillNum = {nKillNum1, nKillNum2, nKillNum3}
	local nIndex = WN_201403_GetKind()
	local tbKill = WN_201403_KILL_2[nIndex]
	if not tbKill then return end
	if 0 == nKillNum1 and 0 == nKillNum2 and 0 == nKillNum3 then
		for i =1, getn(tbKill) do
			local msg = format("Ti�u di�t %dcon%s(%s)", tbKill[i][1], tbKill[i][2], tbKill[i][3])
			Msg2Player(msg)
			TaskTip(msg)
		end
		Talk(1,"","T�n Th�y Ho�ng l�ng c� r�t nhi�u b�u v�t, h�y v�o ti�u di�t qu�i v�t v� l�y b�u v�t ra ��y!")
		return 1
	end
	local bIsComplete = 1
	local tbMsg = {}
	for i =1, getn(tbKill) do
		tinsert(tbMsg, format("Ti�u di�t%d/%dcon%s(%s)", tbKillNum[i], tbKill[i][1], tbKill[i][2], tbKill[i][3]))
		if tbKillNum[i] < tbKill[i][1] then
			bIsComplete = 0
		end
	end
	for i =1, getn(tbMsg) do
		Msg2Player(tbMsg[i])
		if bIsComplete ~= 1 then
			TaskTip(tbMsg[i])
		end
	end
	if bIsComplete == 1 then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 3)
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStep3_1, 0)
		local msg = "Nhi�m v� ho�n th�nh!"..format("Mau �i%st�m%s�i!", "Thi�n s� b� c�nh", "�� T� C�n L�n")
		Msg2Player(msg)
		Talk(1,"",msg)
		TaskTip(msg)
	end
	return 1
end

WN_201403_KILL_3 =
{
	[1] = {
		{555, "Huy�t C� L�u", "Thi�n s� b� c�nh"},
	},
	[2] = {
		{555, "Huy�t C� L�u", "Thi�n s� b� c�nh"},
	},
	[3] = {
		{555, "Huy�t C� L�u", "Thi�n s� b� c�nh"},
	},
}

--��ʦ�ؾ����ص��ӵ�����Ի�
function WN_201403_Talk3()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus ~= 3 then
		return 0
	end
	local nKillNum1 = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStep3_1)
	local tbKillNum = {nKillNum1, nKillNum1, nKillNum1}
	local nIndex = WN_201403_GetKind()
	local tbKill = WN_201403_KILL_3[nIndex]
	if not tbKill then return end
	if 0 == nKillNum1 and 0 == nKillNum2 and 0 == nKillNum3 then
		for i =1, getn(tbKill) do
			local msg = format("Ti�u di�t %dcon%s(%s)", tbKill[i][1], tbKill[i][2], tbKill[i][3])
			Msg2Player(msg)
			TaskTip(msg)
		end
		Talk(1,"","�n t�n??? qu�n r�i, gi�p t�i gi�t Huy�t C� L�u, c� l� s� gi�p ta kh�i ph�c l�i tr� nh�")
		return 1
	end
	local bIsComplete = 1
	local tbMsg = {}
	for i =1, getn(tbKill) do
		tinsert(tbMsg, format("Ti�u di�t%d/%dcon%s(%s)", tbKillNum[i], tbKill[i][1], tbKill[i][2], tbKill[i][3]))
		if tbKillNum[i] < tbKill[i][1] then
			bIsComplete = 0
		end
	end
	for i =1, getn(tbMsg) do
		Msg2Player(tbMsg[i])
		if bIsComplete ~= 1 then
			TaskTip(tbMsg[i])
		end
	end
	if bIsComplete == 1 then
		WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 4)
		local msg = "Nhi�m v� ho�n th�nh!"..format("Mau �i t�m%s t�m%s nh�n th��ng �i!", "Th�nh ��", "V� N��ng")
		Msg2Player(msg)
		Talk(1,"",msg)
		TaskTip(msg)
	end
	return 1
end

function WN_201403_FinishTask()
	WN_201403_DailyReset()
	local nTaskStatus = WN_201403_TASKGROUP:GetTask(WN_201403_TASKGROUP.TaskStatus)
	if nTaskStatus == 5 then
		Talk(1,"",WN_201403_NPC_MAIN.."H�m nay b�n �� nh�n ph�n th��ng n�y r�i, ng�y mai h�y ��n ti�p nh�#")
		return
	end
	if nTaskStatus == 3 then
		Talk(1,"",WN_201403_NPC_MAIN.."B�n ch�a ho�n th�nh nhi�m v� truy t�m �n t�n\n"..format("H�y �i %s t�m %s ho�n th�nh nhi�m v�!", "Thi�n s� b� c�nh", "�� T� C�n L�n"))
		return
	end
	if nTaskStatus == 2 then
		Talk(1,"",WN_201403_NPC_MAIN.."B�n ch�a ho�n th�nh nhi�m v� truy t�m �n t�n\n"..format("H�y �i %s t�m %s ho�n th�nh nhi�m v�!", "D��c V��ng c�c", "L�u Tam "))
		return
	end
	if nTaskStatus == 1 then
		Talk(1,"",WN_201403_NPC_MAIN.."B�n ch�a ho�n th�nh nhi�m v� truy t�m �n t�n\n"..format("H�y �i %s t�m %s ho�n th�nh nhi�m v�!", "Th�nh ��", "Chu U�t Ly"))
		return
	end
	if nTaskStatus == 0 then
		Talk(1,"",WN_201403_NPC_MAIN.."B�n ch�a nh�n nhi�m v� truy t�m �n t�n ")
		return
	end
	if nTaskStatus ~= 4 then
		Talk(1,"",WN_201403_NPC_MAIN.."B�n tr�a ho�n th�nh nhi�m v� truy t�m �n t�n, kh�ng th� nh�n th��ng ")
		return
	end
	local tSay = {
		"Ph�n th��ng ph� th�ng#mi�n ph�#/WN_201403_GetAward1",
		"ph�n th��ng �u ��i#ti�u hao 399 v�ng +39 ng�c ti�u dao#/WN_201403_GetAward2",
		"ph�n th��ng si�u c�p#ti�u hao 606 v�ng +203 ng�c ti�u dao#/WN_201403_GetAward3",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say(WN_201403_NPC_MAIN.."h�y ch�n c�ch nh�n ph�n th��ng:",getn(tSay),tSay)
end

function WN_201403_GetAward1()
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 5)
	gf_Modify("Exp", 100000000)
	gf_Modify("Rep", 19)
	gf_EventGiveCustomAward(4, 19, 1, "Event ph� 1 th�ng 3");
	ahf_GetPetBook(1)
end

function WN_201403_GetAward2()
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
		return
	end
	if GetCash() < 3990000 then
		Talk(1,"",WN_201403_NPC..format("S� v�ng trong t�i kh�ng �� %d v�ng ", 399))
		return
	end
	if GetItemCount(2, 1, 30603) < 39 then
		Talk(1,"",WN_201403_NPC..format("s� ng�c ti�u dao trong t�i kh�ng �� %d c�i ", 39))
		return
	end
	if Pay(3990000) ~= 1 or DelItem(2, 1, 30603, 39) ~= 1 then
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 5)
	gf_Modify("Exp", 399399399)
	gf_Modify("Rep", 55)
	AwardGenuineQi(55);
	ahf_GetPetBook(2)
	ahf_GetPetBook(2)
end

function WN_201403_GetAward3()
	if gf_Judge_Room_Weight(6, 200, " ") ~= 1 then
		return
	end
	if GetCash() < 6060000 then
		Talk(1,"",WN_201403_NPC..format("S� v�ng trong t�i kh�ng �� %d v�ng ", 606))
		return
	end
	if GetItemCount(2, 1, 30603) < 203 then
		Talk(1,"",WN_201403_NPC..format("s� ng�c ti�u dao trong t�i kh�ng �� %d c�i ", 203))
		return
	end
	if Pay(6060000) ~= 1 or DelItem(2, 1, 30603, 203) ~= 1 then
		return
	end
	WN_201403_TASKGROUP:SetTask(WN_201403_TASKGROUP.TaskStatus, 5)
	gf_Modify("Exp", 1234567890)
	gf_Modify("Rep", 500)
	gf_EventGiveCustomAward(4, 200, 1, "Event ph� 1 th�ng 3");
	ahf_GetPetBook(3)
	ahf_GetPetBook(4)
	AddItem(2, 1, 30632, 2000)
	AddItem(2, 1, 30633, 2000)
	gf_AddItemEx2({2, 1, 30497, 100, 4}, "Ma Tinh", "Event ph� 1 th�ng 3","si�u c�p nh�n th��ng ", 0, 1)
	gf_AddItemEx2({2, 1, 9977, 1, 4}, "Qu�n C�ng Huy Ho�ng", "Event ph� 1 th�ng 3","si�u c�p nh�n th��ng ", 7 * 24 * 3600, 1)
end