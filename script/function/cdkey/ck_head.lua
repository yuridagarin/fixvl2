--�������ĵ����ֶ�����ʧȥ�����ĵĸϽţ���Ҫ���������ˣ���дһ����
Include("\\script\\function\\cdkey\\ck_define.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\talktmp.lua")
Include("\\script\\lib\\date.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\task\\global_task\\gtask_data.lua")
Include("\\script\\online_activites\\activity_head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_head.lua")

CK_TASK_GROUP = TaskManager:Create(CK_TASK_GROUP[1], CK_TASK_GROUP[2]);
CK_TASK_GROUP.Task1 = 1 --1,2,3λ�ֱ��ʾ�������㣬��ս�ѣ���Ծ��,4-11λ����ֱǰ���񣬰�սɱ������12-16��¼,17-21���,��ս��������22-26��¼��27-31��ȡ
CK_TASK_GROUP.Task2 = 2 --��ս��������1-5�ɽ���6-10��ɣ�--��սPVP����11-17��¼��18-24��ȡ��25-31�ɽ�
CK_TASK_GROUP.Task3 = 3 --��սPVP����1-7���,8-10ɱ�ּӳɣ�11-13�����ӳɣ�14-16pvp�ӳ�, 17+����ս�پ�����
CK_TASK_GROUP.Task4 = 4 --������
CK_TASK_GROUP.Task5 = 5 --���������������
CK_TASK_GROUP.Score = 6 --��Ծ��
CK_TASK_GROUP.Award = 7 --��λ��ǽ���

CK_NPC_NAME = "<color=green> ��i S� ho�t ��ng: <color>";
CK_NPC_TITLE = "H�y nhanh ch�ng m�i b�n b� ��n c�ng ch�i tr� ch�i n�o! B�n b� c�ng nhi�u th� s� c� th�m nhi�u ni�m vui!";

CK_NPC_DIALOG = {
	"Gi�i thi�u ho�t ��ng/ck_ActInfo",
	"K�ch ho�t danh hi�u/ck_ActTilte",
	"Nhi�m v� D�ng C�m Ti�n T�i/ck_TaskForward",
	"Nhi�m v� Tr�m Tr�n Tr�m Th�ng/ck_BaiZhanBuDai",
	"Nhi�m v� T�c Chi�n T�c Th�ng/ck_FastTask",
	"Nhi�m v� ��i Ph� �ng/ck_ZiloTask",
	"Xem �i�m n�ng ��ng/ck_QueryScore",
	"Ki�m tra thi�n ki�u l�nh/cdk_QueryUseTianJiaoLingNum",
	"�i�m n�ng ��ng ��i ph�n th��ng/ck_ScoreAward",
}

function cdk_QueryUseTianJiaoLingNum()
	Say(CK_NPC_NAME..format("%s t�ng s� thi�n ki�u l�nh �� s� d�ng<color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCostIB()), 0);	
end

--��Ƿ���
function ck_IsOpen()
	return gf_CheckDuration(CK_START_TIME, CK_END_TIME);		
end

function ck_IsStatus()
		local nExtPoint = GetExtPoint(EXT_CDKEY)
		if GetBit(nExtPoint,2) == 1 or GetBit(nExtPoint,4) == 1 or GetBit(nExtPoint,6) == 1 then
			--Talk(1, "", "Hi�n t�i kh�ng c� ho�t ��ng n�o")
			return 0
		end
		return 1
end
--ÿ������
function ck_DailyReset()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	--���ð�ս��������
	for i = 12, 31 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task2, 0); 
	for i = 1, 16 do
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
	end
	--ɾ����ս����������
	for i = 234, 238 do
		DirectDeleteTask(i)
	end
end

--��õ�������
function ck_GetRandIndex(nMax)
	local today = Date();
	local wDay = today:week();
	if wDay == 0 then wDay = 7 end
	return mod(wDay, nMax) + 1;	
end

--��ȡ����
function ck_GetTitleType()
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) == 1 then
		return 1;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) == 1 then
		return 2;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) == 1 then
		return 3;
	end
	return 0;
end

--��ù��׶�
function ck_GetCkScore()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score);
end

--���ӻ���
function ck_AddCkScore(nAdd)
	if not nAdd or nAdd < 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Score, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score) + nAdd);
	Msg2Player(format("�i�m n�ng ��ng t�ng %d, t�ng �i�m l� %d", nAdd, CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Score)));
end

--�����
function ck_ActInfo(nIndex)
	local strTitle = 	{
		"Trong th�i gian ho�t ��ng, ng��i ch�i s� nh�n ���c danh hi�u ph� h�p v�i �i�u ki�n c�a b�n th�n. T�t c� danh hi�u ��u c� hi�u l�c l� 2 th�ng, v� khi nh�n v�t th�p s�ng danh hi�u th� kh�ng t�t c� s� t�ng 10 �i�m. Ng��i ch�i ph�i k�ch ho�t danh hi�u m�i c� th� nh�n nhi�m v�. Nhi�m v� Tr�m Tr�n Tr�m Th�ng, m�i ng�y ch� ���c l�m 1 l�n. Nhi�m v� T�c Chi�n T�c Th�ng v� ��i Ph� �ng th� trong th�i gian ho�t ��ng ch� ���c ho�n th�nh 1 l�n. Nhi�m v� Tr�m Tr�n Tr�m Th�ng c� th� ho�n th�nh theo c� nh�n v� t� ��i, n�u t� ��i th� ph�n th��ng s� cao h�n. Ho�n th�nh c�c m�c nhi�m v� s� nh�n ���c �i�m kinh nghi�m v� �� n�ng ��ng. T�ch l�y �� n�ng ��ng c� th� ��i ph�n th��ng phong ph�.",
		"L�o Chi�n H�u v� Ng��i N�ng ��ng t� ��i tham gia nhi�m v� Tr�m Tr�n Tr�m Th�ng s� ���c gi�i cao nh�t.",
		"Nhi�m v� D�ng C�m Ti�n T�i ch� xu�t hi�n t�i server m�i,trong server m�i gamer c�p 10 v� �� k�ch ho�t danh hi�u V� L�m T�n T� m�i ���c nh�n nhi�m v�.Ho�n th�nh xong nhi�m v� n�y v� ��t ��n c�p 90, gamer V� L�m T�n T� m�i ���c ti�p nh�n nhi�m v� Tr�m Tr�n Tr�m Th�ng,T�c Chi�n T�c Th�ng v� ��i Ph� �ng.",
	}
	local tbSay = {};
	nIndex = nIndex or 1;
	local Msg = strTitle[nIndex]; 
	if Msg then
		tbSay.msg = CK_NPC_NAME..Msg;
		tbSay.sel = {
			{"\n r�t lui", "nothing"},
		};
		if strTitle[nIndex + 1] then
			tinsert(tbSay.sel, 1, {"Trang k�", format("#ck_ActInfo(%d)", nIndex + 1)})
		end
		temp_Talk(tbSay);
	end
end

--����ƺ�
function ck_ActTilte()
	local tSay = {}
	local nCheckServer = GetGlbValue(GLB_TSK_SERVER_ID)
	if nCheckServer == 92 then	-- or nCheckServer == 91
		tinsert(tSay,"V� L�m T�n T�/ck_ActTilte_1");
	else
		tinsert(tSay,"L�o Chi�n H�u/ck_ActTilte_2");
		tinsert(tSay,"Ng��i N�ng ��ng/ck_ActTilte_3");
	end
	tinsert(tSay,"T�i ch� xem xem th�i/nothing");
	local msg = format("Th�i gian k�t th�c k�ch ho�t l� %d/%d/%d", CK_START_ACT[3], CK_START_ACT[2], CK_START_ACT[1]);
	Say(CK_NPC_NAME..format("%s mu�n k�ch ho�t danh hi�u n�o?<color=red>%s<color>", gf_GetPlayerSexName(), msg), getn(tSay), tSay);
end

function ck_CanAct()
	return gf_CheckDuration(CK_START_TIME, CK_START_ACT);		
end

function ck_ActTilte_1()
	local nExtPoint = GetExtPoint(EXT_CDKEY)
	if GetBit(nExtPoint,9) == 1 then
		Talk(1,"",CK_NPC_NAME .."T�i kho�n c�c h� �� ���c k�ch ho�t r�i.")
		return 0
	end
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Th�i gian k�ch ho�t �� k�t th�c,kh�ng th� k�ch ho�t danh hi�u n�a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "V� L�m T�n T�"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "L�o Chi�n H�u"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "Ng��i N�ng ��ng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(1), GetExtPoint(2))
--	local nExtPoint = GetExtPoint(EXT_CDKEY)
	--if GetExtPoint(1) == 1 and GetExtPoint(2) ~= 1 then
	if GetBit(nExtPoint,5) == 1 and GetBit(nExtPoint,6) ~= 1 then
		if CK_ES_SWITCH == 0 then
			Say(CK_NPC_NAME.."M�y ch� n�y t�m th�i kh�ng m� nh�n danh hi�u <color=gold>V� L�m T�n T�<color>!", 0);
			return 0;
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 1, 1);
--		PayExtPoint(1, 1);
		AddTitle(68, 1);
		SetTitleTime(68, 1, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("Nh�n ���c danh hi�u [%s]", "V� L�m T�n T�"))
		Say(CK_NPC_NAME..format("Nh�n ���c danh hi�u <color=gold>[%s]<color>", "V� L�m T�n T�"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 1)");
		CDKEY_SetExtBit(EXT_CDKEY,9,1)
		return 1;
	end
	Say(CK_NPC_NAME.."Nh�n v�t n�y kh�ng �� �i�u ki�n, kh�ng th� nh�n danh hi�u!", 0);
end

function ck_ActTilte_2()
	local nExtPoint = GetExtPoint(EXT_CDKEY)
	if GetBit(nExtPoint,7) == 1 then
		Talk(1,"",CK_NPC_NAME .."T�i kho�n c�c h� �� ���c k�ch ho�t r�i.")
		return 0
	end
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Th�i gian k�ch ho�t �� k�t th�c,kh�ng th� k�ch ho�t danh hi�u n�a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "V� L�m T�n T�"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "L�o Chi�n H�u"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "Ng��i N�ng ��ng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(3), GetExtPoint(4))
--	local nExtPoint = GetExtPoint(EXT_CDKEY)
	--if GetExtPoint(1) == 1 and GetExtPoint(2) ~= 1 then
	if GetBit(nExtPoint,1) == 1 and GetBit(nExtPoint,2) ~= 1 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 2, 1);
--		PayExtPoint(3, 1);
		AddTitle(68, 2);
		SetTitleTime(68, 2, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("Nh�n ���c danh hi�u [%s]", "L�o Chi�n H�u"))
		Say(CK_NPC_NAME..format("Nh�n ���c danh hi�u <color=gold>[%s]<color>", "L�o Chi�n H�u"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 2)");
		CDKEY_SetExtBit(EXT_CDKEY,7,1)
		return 1;
	end
	Say(CK_NPC_NAME.."Nh�n v�t n�y kh�ng �� �i�u ki�n, kh�ng th� nh�n danh hi�u!", 0);
end

function ck_ActTilte_3()
	local nExtPoint = GetExtPoint(EXT_CDKEY)
	if GetBit(nExtPoint,8) == 1 then
		Talk(1,"",CK_NPC_NAME .."T�i kho�n c�c h� �� ���c k�ch ho�t r�i.")
		return 0
	end
	if ck_CanAct() ~= 1 then
		Say(CK_NPC_NAME.."Th�i gian k�ch ho�t �� k�t th�c,kh�ng th� k�ch ho�t danh hi�u n�a", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "V� L�m T�n T�"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 2) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "L�o Chi�n H�u"), 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 3) ~= 0 then
		Say(CK_NPC_NAME..format("�� nh�n danh hi�u <color=gold>[%s]<color> r�i", "Ng��i N�ng ��ng"), 0)
		return 0;
	end
	DebugOutput(GetExtPoint(5), GetExtPoint(6))
--	local nExtPoint = GetExtPoint(EXT_CDKEY)
	--if GetExtPoint(1) == 1 and GetExtPoint(2) ~= 1 then
	if GetBit(nExtPoint,3) == 1 and GetBit(nExtPoint,4) ~= 1 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 3, 1);
--		PayExtPoint(5, 1);
		AddTitle(68, 3);
		SetTitleTime(68, 3, GetTime() + (60 * 24 * 3600));
		Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Ng��i N�ng ��ng"))
		Say(CK_NPC_NAME..format("Nh�n ���c danh hi�u <color=gold>[%s]<color>", "Ng��i N�ng ��ng"), 0)
		gf_WriteLogEx("CDKEY", "ck_ActTilte", "AddTitle(68, 3)");
		CDKEY_SetExtBit(EXT_CDKEY,8,1)
		return 1;
	end
	Say(CK_NPC_NAME.."Nh�n v�t n�y kh�ng �� �i�u ki�n, kh�ng th� nh�n danh hi�u!", 0);
end

--Task1:4-11λ����ֱǰ����
function ck_TaskForward()
	if CK_ES_SWITCH == 0 then
		Say(CK_NPC_NAME.."M�y ch� n�y t�m th�i kh�ng m� chu�i nhi�m v� <color=red>D�ng C�m Ti�n T�i<color>", 0)
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 1) ~= 1 then
		Say(CK_NPC_NAME..format("Ch� c� <color=gold>[%s]<color> m�i ���c nh�n nhi�m v� n�y", "V� L�m T�n T�"), 0)
		return 0;
	end
	if GetLevel() >= 90 or gf_GetPlayerRebornCount() > 0 then
		Say(CK_NPC_NAME.."Gamer 90 c�p tr� l�n ho�c �� chuy�n sinh kh�ng th� tham gia nhi�m v� n�y!",0);
		return 0;
	end
	local tSay = {}
	local tMsg = {"Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh"}
	for i = 1, getn(CK_TASK_FORWARD) do
		local nType = 0;
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i + 3) == 1 then
			nType = 4;
		else
			if tGtTask:check_cur_task(CK_TASK_FORWARD[i][2]) == 0 then
				nType = 1;
			else
				if DirectIsTaskFinish(CK_TASK_FORWARD[i][2]) then
					nType = 3;
				else
					nType = 2;
				end
			end
		end
		if tMsg[nType] then
			tinsert(tSay, CK_TASK_FORWARD[i][1]..format("(%s)/#ck_TaskFoward_do(%d, %d)", tMsg[nType], CK_TASK_FORWARD[i][2], i + 3));
		end
	end
	tinsert(tSay, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."Nhi�m v� D�ng C�m Ti�n T�i c� th� gi�p ng��i nhanh ch�ng t�ng c�p!",getn(tSay), tSay);
end

function ck_TaskFoward_do(nTaskID, nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
		Say(CK_NPC_NAME.."Nhi�m v� n�y �� ho�n th�nh!", 0);
		return 0;
	end
	if nTaskIndex > 4 and CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex - 1) ~= 1 then
		Say(CK_NPC_NAME.."Ch�a ho�n th�nh nhi�m v� tr��c ��", 0);
		return 0;
	end
	if tGtTask:check_cur_task(nTaskID) == 0 then
		DirectGetGTask(nTaskID, 1)
	else
		if DirectIsTaskFinish(nTaskID) then
			if 1 == DirectFinishGTask(nTaskID, 2) then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
				Msg2Player("�� ho�n th�nh nhi�m v�!")
			else
				Msg2Player("Nhi�m v� kh�c th��ng, kh�ng th� ho�n th�nh!");
			end
		else
			Say(CK_NPC_NAME.."Nhi�m v� v�n ch�a ho�n th�nh!", 0);
		end
	end
end

--����ֱǰ����(����)
function ck_TaskForward_Award()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
		local nExp = GetExp()
		ModifyExp(-nExp)
		SetLevel(90, 1);
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		Say(CK_NPC_NAME..format("��ng c�p nh�n v�t �� n�ng cao ��n %d c�p, xin ��ng nh�p l�i!", 90), 1, "��ng nh�p l�i/ExitGame");
	end
end

function ck_CheckCondition()
	local nKind = ck_GetTitleType();
	if nKind == 0 then
		Say(CK_NPC_NAME.."V�n ch�a nh�n v� k�ch ho�t danh hi�u n�o, kh�ng th� tham gia nhi�m v�!", 0);
		return 0;
	end
	if GetLevel() < 90 and gf_GetPlayerRebornCount() <= 0 then
		Say(CK_NPC_NAME..format("��ng c�p nh�n v�t kh�ng �� %d c�p, kh�ng th� tham gia nhi�m v� !", 90), 0);
		return 0;
	end
	return 1;
end

function ck_BaiZhanBuDai()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhi�m v� ��nh qu�i/ck_BZBD_Kill",
		"\nNhi�m v� ph� b�n/ck_BZBD_Raid",
		"\nNhi�m v� PVP/ck_BZBD_PVP",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.."Nhi�m v� <color=gold>Tr�m Tr�n Tr�m Th�ng<color>, nh�n ng�u nhi�n h�ng ng�y, nh�n ���c nhi�u kinh nghi�m v� �� n�ng ��ng!", getn(tSay), tSay);	
end

--Task3���ӳ�
function ck_BZBD_GetType(nIndex1, nIndex2, nIndex3)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2) == 1 then
		return 0.8;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1) == 1 then
		return 0.2;
	end
	return 0;
end

function ck_BZBD_SetType(nIndex1, nIndex2, nIndex3)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 0)
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 0)
	local nSize = gf_GetTeamSize();
	if nSize <= 1 then
		return 0;
	end
	--print("nSize =", nSize)
	local oldPlayerIndex = PlayerIndex;
	local nSelfType = ck_GetTitleType();
	if nSelfType == 0 then
		return 0;
	end
	--print("nSelfType =", nSelfType)
	if nSelfType == 1 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 1 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex3, 1)
					return 1;
				end
			end
		end
	end
	if nSelfType == 2 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
					return 1;
				end
			end
		end
	end	
	if nSelfType == 3 then
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= oldPlayerIndex then
				if ck_GetTitleType() == 3 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex1, 1)
				end
				if ck_GetTitleType() == 2 then
					PlayerIndex = oldPlayerIndex
					CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nIndex2, 1)
				end
			end
		end
	end
	PlayerIndex = oldPlayerIndex;		
	--print("nIndex1 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex1))
	--print("nIndex2 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex2))
	--print("nIndex3 =", CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nIndex3))	
end

--��ս����ɱ������
--Task1:12-16��¼,17-21���
function ck_BZBD_Kill()
	--û����������������������
	local nCount = 0;
	local nTaskIndex1 = 0;
	local nTaskIndex2 = 0;
	for i = 12, 16 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) == 1 then
			if nTaskIndex1 == 0 then
				nTaskIndex1 = i - 11;
			elseif nTaskIndex2 == 0 then
				nTaskIndex2 = i - 11;
			end
			nCount = nCount + 1;
		end
	end
	if nCount ~= 2 then
		for i = 12, 21 do
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0)
		end
		nCount = ck_GetRandIndex(getn(CK_TASK_BZ_KILL));
		nTaskIndex1 = nCount;
		if 0 ~= mod(nCount + 3, 5) then
			nTaskIndex2 = mod(nCount + 3, 5);
		else
			nTaskIndex2 = 5;
		end
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex1, 1);
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 11 + nTaskIndex2, 1);
	end
	DebugOutput("nTaskIndex1, nTaskIndex2 =", nTaskIndex1, nTaskIndex2);
	--���Ի�
	local tSay = {}
	local tMsg = {"Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh"}
	local tTask = {nTaskIndex1, nTaskIndex2};
	for i = 1, getn(tTask) do
		local nType = 0;
		DebugOutput("tTask[i] =", tTask[i])
		local nType = 0;
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 16 + tTask[i]) == 1 then
			nType = 4;
		else
			if tGtTask:check_cur_task(CK_TASK_BZ_KILL[tTask[i]][2]) == 0 then
				nType = 1;
			else
				if DirectIsTaskFinish(CK_TASK_BZ_KILL[tTask[i]][2]) then
					nType = 3;
				else
					nType = 2;
				end
			end
		end
		if tMsg[nType] then
			tinsert(tSay, format("\n%s(%s)/#ck_BZBD_Kill_do(%d, %d)", CK_TASK_BZ_KILL[tTask[i]][1], tMsg[nType], CK_TASK_BZ_KILL[tTask[i]][2], 16 + tTask[i]));
		end
	end
	tinsert(tSay, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."Tr�m Tr�n Tr�m Th�ng-Nhi�m v� ��nh qu�i!",getn(tSay), tSay);
end

function ck_BZBD_Kill_do(nTaskID, nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex) ~= 0 then
		Say(CK_NPC_NAME.."Nhi�m v� n�y �� ho�n th�nh!", 0);
		return 0;
	end
	if tGtTask:check_cur_task(nTaskID) == 0 then
		DirectGetGTask(nTaskID, 1)
	else
		DebugOutput(nTaskID, DirectIsTaskFinish(nTaskID))
		if DirectIsTaskFinish(nTaskID) then
			if 1 == DirectFinishGTask(nTaskID, 2) then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, nTaskIndex, 1);
				Msg2Player("�� ho�n th�nh nhi�m v�!")
			else
				Msg2Player("Nhi�m v� kh�c th��ng, kh�ng th� ho�n th�nh!");
			end
		else
			Say(CK_NPC_NAME.."Nhi�m v� v�n ch�a ho�n th�nh!", 0);
		end
	end
end

--ɱ��������(����)
function ck_BZBD_Kill_Award()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	local nParam = ck_BZBD_GetType(8, 9, 10);
	gf_ModifyExp(floor(3000000*(1 + nParam)));
	ck_AddCkScore(floor(10 * (1 + nParam)));
end

--ɱ���������ӿ�
--�����üӳ�ϵ��
function _ck_BZBD_Kill_Set()
	--print("_ck_BZBD_Kill_Set()")
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 12, 16 do 
			--print(i, CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i))
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 11;
			end
		end
		--print("nCount =", nCount)
		if nCount ~= 2 then
			return 0;
		end
		ck_BZBD_SetType(8, 9, 10);
	end);
end

--��ս������������
--Task1:22-26��¼��27-31��ȡ
--Task2:1-5�ɽ���6-10���
function ck_BZBD_Raid()
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 22, 26 do 
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 21;
		end
	end
	if nCount ~= 1 then
		for i = 22, 31 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, i, 0);
		end
		for i = 1, 10 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		nTaskIndex = ck_GetRandIndex(getn(CK_TASK_BZ_RAID));
--		--�ر�̫һ������-------
--		if nTaskIndex == 5 then
--			nTaskIndex = 3;
--		end
--		-----------------------
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 21 + nTaskIndex, 1);
	end
	local tMsg = {"Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	DebugOutput(CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex)
	local tSay = {
		format("%s(%s)/#ck_BZBD_Raid_do(%d)",	CK_TASK_BZ_RAID[nTaskIndex], tMsg[nType], nTaskIndex),
		"\nT�i ch� xem xem th�i/nothing",
	}
	Say(CK_NPC_NAME.."Tr�m Tr�n Tr�m Th�ng-Nhi�m v� ph� b�n!", getn(tSay), tSay);
end

function ck_BZBD_Raid_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task1, 26 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("�� nh�n nhi�m v� <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch�a ho�n th�nh nhi�m v� <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 5 + nTaskIndex, 1);
				--������
				ck_BZBD_Raid_Award();
			else
				Say(CK_NPC_NAME..format("�� ho�n th�nh nhi�m v� <color=gold>%s<color>", CK_TASK_BZ_RAID[nTaskIndex]), 0);
			end
		end
	end	
end

--��ս��������������
function ck_BZBD_Raid_Award()
	local nParam = ck_BZBD_GetType(11, 12, 13);
	gf_ModifyExp(floor(5000000*(1 + nParam)));
	ck_AddCkScore(floor(15 * (1 + nParam)));
end

--�����������ӿ�
function _ck_BZBD_Raid_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 22, 26 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task1, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 21;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex) ~= 1 then
			ck_BZBD_SetType(11, 12, 13);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_RAID[nTaskIndex]));
		end
	end);
end

--��ս����PVP����
--Task2:11-17��¼��18-24��ȡ��25-31�ɽ�
--Task3:1-7���
function ck_BZBD_PVP()
	
--	if GetGlbValue(1023) == 92 then
--		local tSay = {
--			"Ta mu�n nh�n th��ng nhi�m v� PVP/ck_BZBD_PVP_Award",
--			"\nT�i ch� xem xem th�i/nothing",
--		}
--		Say(CK_NPC_NAME.."Tr�m Tr�n Tr�m Th�ng-Nhi�m v� PVP!", getn(tSay), tSay);
--		return
--	end	
	
	local nCount = 0;
	local nTaskIndex = 0;
	for i = 11, 17 do 
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
			nCount = nCount + 1;
			nTaskIndex = i - 10;
		end
	end
	if nCount ~= 1 then
		for i = 18, 31 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, i, 0);
		end
		for i = 1, 7 do 
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, i, 0);
		end
		nTaskIndex = random(7);
		--����3v3-------------
--		if nTaskIndex == 2 then
--			nTaskIndex = nTaskIndex + 1;
--		elseif nTaskIndex == 7 then
--			nTaskIndex = nTaskIndex - 1;
--		end
		----------------------
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 10 + nTaskIndex, 1);
	end
	local tMsg = {"Ch�a nh�n", "Ch�a ho�n th�nh", "C� th� giao", "�� ho�n th�nh"}
	local nType = 0;
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		nType = 1;
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			nType = 2;
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				nType = 3;
			else
				nType = 4;
			end
		end
	end
	local tSay = {
		format("%s(%s)/#ck_BZBD_PVP_do(%d)",	CK_TASK_BZ_PVP[nTaskIndex], tMsg[nType], nTaskIndex),
		"\nT�i ch� xem xem th�i/nothing",
	}
	Say(CK_NPC_NAME.."Tr�m Tr�n Tr�m Th�ng-Nhi�m v� PVP!", getn(tSay), tSay);
end

function ck_BZBD_PVP_do(nTaskIndex)
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex) == 0 then
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 17 + nTaskIndex, 1);
		Say(CK_NPC_NAME..format("�� nh�n <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
	else
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) == 0 then
			Say(CK_NPC_NAME..format("Ch�a ho�n th�nh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
		else
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex) == 0 then
				CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, nTaskIndex, 1);
				--������
				ck_BZBD_PVP_Award();
			else
				Say(CK_NPC_NAME..format("�� ho�n th�nh <color=gold>%s<color>", CK_TASK_BZ_PVP[nTaskIndex]), 0);
			end
		end
	end	
	--===========
	if nTaskIndex == 1 or nTaskIndex == 2 or nTaskIndex == 7 then
		local nTaskIndex = 0;
		for i = 11, 17 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
--				nCount = nCount + 1;
				nTaskIndex = i - 10;
			end
		end
--		if nCount ~= 1 then
--			return 0;
--		end
--		if tonumber(%nCurIndex) ~= nTaskIndex then
--			return 0;
--		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			--ck_BZBD_SetType(14, 15, 16);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end	
	end
	--===========
end

function ck_BZBD_PVP_Award()
	if GetGlbValue(1023) == 92 then
		if gf_GetTaskByte(TSK_NHIEMVUCDKEY,1) == 1 then
			Talk(1,"","C�c h� �� nh�n ph�n th��ng ng�y h�m nay r�i. Xin vui l�ng quay l�i ng�y h�m sau!")
			return
		end
		gf_ModifyExp(14400000);
		ck_AddCkScore(36);
	
		--Set nh�n th��ng m�i ng�y
		gf_SetTaskByte(TSK_NHIEMVUCDKEY,1,1)
		return
	end
	
	local nParam = 0.8; --ck_BZBD_GetType(14, 15, 16);
	gf_ModifyExp(floor(8000000*(1 + nParam)));
	ck_AddCkScore(floor(20 * (1 + nParam)));
end

--PVP�������ӿ�
function _ck_BZBD_PVP_Set(nCurIndex)
	gf_TeamOperateEX(function()
		if ck_IsOpen() ~= 1 then
			return 0;
		end
		if ck_GetTitleType() == 0 then
			return 0;
		end
		local nCount = 0;
		local nTaskIndex = 0;
		for i = 11, 17 do 
			if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, i) ~= 0 then
				nCount = nCount + 1;
				nTaskIndex = i - 10;
			end
		end
		if nCount ~= 1 then
			return 0;
		end
		if tonumber(%nCurIndex) ~= nTaskIndex then
			return 0;
		end
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex) ~= 1 then
			--ck_BZBD_SetType(14, 15, 16);
			CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task2, 24 + nTaskIndex, 1);
			Msg2Player(format("�� ho�n th�nh nhi�m v� %s", CK_TASK_BZ_PVP[nTaskIndex]));
		end
	end);
end

function ck_FastTask()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhi�m v� bang h�i/ck_FastTask_Tong",
		"\nNhi�m v� h��ng d�n/ck_FastTask_Guide",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.."Nhi�m v� <color=gold>T�c Chi�n T�c Th�ng<color>, trong th�i gian ho�t ��ng ch� ���c ho�n th�nh 1 l�n, nh�n ���c nhi�u kinh nghi�m v� �� n�ng ��ng!", getn(tSay), tSay);		
end

function ck_FastTask_Tong()
	local tSay = {
		"\nGia nh�p bang h�i/ck_FastTask_Tong_1",
		"\nT�i chi�n Th�n Th�/ck_FastTask_Tong_2",
		"\nN��ng th�t bang ph�i/ck_FastTask_Tong_3",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.."<color=gold>T�c Chi�n T�c Th�ng<color>-Nhi�m v� bang h�i!", getn(tSay), tSay);		
end

--Task3��17λ�Ƿ����
function ck_FastTask_Tong_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Tong_1(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"Gia nh�p bang h�i", "Gia nh�p m�t bang h�i b�t k�, tr� th�nh m�t th�nh vi�n trong bang", "Gia nh�p bang h�i, c�ng v�i th�nh vi�n kh�c c� g�ng �� gi�p bang h�i ng�y c�ng l�n m�nh", 3000000, 100);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 17) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if IsTongMember() <= 0 then
		Say(CK_NPC_NAME.."Kh�ng th�a �i�u ki�n, kh�ng th� ho�n th�nh nhi�m v�!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 17, 1);
	--����
	gf_ModifyExp(3000000);
	ck_AddCkScore(100);	
	Msg2Player("Nhi�m v� ho�n th�nh!");
end

--Task3��18λ�Ƿ����
function ck_FastTask_Tong_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Tong_2(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"T�i chi�n Th�n Th�", "N�p 300 �i�m t�ch l�y t� quang", "Tham gia T� Quang C�c ��nh b�i T� Quang Th�n Th� s� nh�n ���c �i�m t�ch l�y t� quang", 5000000, 200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 18) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	--���Ϲ����
	local TSK_POINT = 652;			--��¼��Ҹ��˹ؿ�����
	if GetTask(TSK_POINT) < 300 then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y t� quang kh�ng �� <color=red>%d<color> �i�m", 300), 0);
		return 0;
	end
	SetTask(TSK_POINT, GetTask(TSK_POINT) - 300);
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 18, 1);
	--����
	gf_ModifyExp(5000000);
	ck_AddCkScore(200);
	Msg2Player("Nhi�m v� ho�n th�nh!");
end

--Task3��19λ�Ƿ����
function ck_FastTask_Tong_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Tong_3(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"N��ng th�t bang ph�i", "Tham d� t�nh n�ng N��ng th�t bang ph�i n�p 10 M�nh L�nh B�i Bang Ph�i", "Ho�t ��ng N��ng th�t bang ph�i v� c�ng th� v�, mau �i thu th�p M�nh L�nh B�i Bang Ph�i n�o!", 8000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 19) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	--����Ƭ
	if DelItem(2, 1, 30588, 10) ~= 1 then
		Say(CK_NPC_NAME..format("<color=red>%s<color> trong t�i kh�ng �� <color=red>%d<color> c�i", "M�nh L�nh B�i Bang H�i", 10), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 19, 1);
	--����
	gf_ModifyExp(8000000);
	ck_AddCkScore(300);
	Msg2Player("Nhi�m v� ho�n th�nh!");
end

function ck_FastTask_Guide()
	local tSay = {
		"\nTh� th�ng/ck_FastTask_Guide_1",
		"\nThu�c vi�n/ck_FastTask_Guide_2",
		"\nC�y B�t Nh� Nh�/ck_FastTask_Guide_3",
		"\nN� Oa B�o H�p v� Ng�i Sao May M�n/ck_FastTask_Guide_4",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.."<color=gold>T�c Chi�n T�c Th�ng<color>-Nhi�m v� h��ng d�n!", getn(tSay), tSay);	
end

--Task3��20λ�Ƿ����
function ck_FastTask_Guide_1(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_1(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"Th� Th�ng", "K�ch ho�t th� th�ng VIP v� l�m", "K�ch ho�t th� th�ng, ch�i tr� ch�i nh� nh�ng h�n", 8000000, 1200);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 20) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if IsActivatedVipCard() ~= 1 then
		Say(CK_NPC_NAME.."V�n ch�a k�ch ho�t th� th�ng, kh�ng th� ho�n th�nh nhi�m v�!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 20, 1);
	--����
	gf_ModifyExp(8000000);
	ck_AddCkScore(1200);
	Msg2Player("Nhi�m v� ho�n th�nh!");
end

--Task3��21,22,23,24λ
function ck_FastTask_Guide_2(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_2(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"Thu�c vi�n", "Ph�n bi�t s� d�ng 1 l�n B�ch C�u Ho�n, Tam Thanh Ho�n v� L�c Th�n Ho�n", "S� d�ng c�c lo�i thu�c s� gi�p b�n m�t tay", 5000000, 300);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 24) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 21) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "B�ch C�u Ho�n"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 22) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "Tam Thanh ho�n"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 23) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "L�c Th�n ho�n"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 24, 1);
	--����
	gf_ModifyExp(5000000);
	ck_AddCkScore(300);
	Msg2Player("Nhi�m v� ho�n th�nh!");
end

--ʹ�ð׾���
function _ck_UseItemBaiJu()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 21, 1);
end

--ʹ��������
function _ck_UseItemSanQing()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 22, 1);
end

--ʹ��������
function _ck_UseItemLiuShen()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 23, 1);
end

--Task3��25,26λ
function ck_FastTask_Guide_3(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_3(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"C�y B�t Nh� nh�", "Tr�ng 1 C�y B�t Nh� Nh�", "Tr�ng C�y B�t Nh� Nh�, nh�n ���c ph�n th��ng kinh nghi�m", 5000000, 600);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 26) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 25) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a tr�ng <color=red>%s<color>", "C�y B�t Nh� nh�"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 26, 1);
	--����
	gf_ModifyExp(5000000);
	ck_AddCkScore(600);
	Msg2Player("Nhi�m v� ho�n th�nh!");
end

--��ֲС��������
function _ck_PlantSmallBanRuo()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 25, 1);	
end

--Task3��27,28,29λ
function ck_FastTask_Guide_4(nFlag)
	if not nFlag then
		local tSay = {
			"\nHo�n th�nh nhi�m v�/#ck_FastTask_Guide_4(1)",
			"\nT�i ch� xem xem th�i/nothing",	
		}
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",
			"N� Oa B�o H�p v� Ng�i Sao May M�n", "S� d�ng 1 l�n N� Oa B�o H�p v� Ng�i Sao May M�n", "N� Oa B�o H�p v� Ng�i Sao May M�n l� b�o v�t, m� ra xem th� b�n trong c� ph�n th��ng kh�ng", 5000000, 900);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 29) ~= 0 then
		Say(CK_NPC_NAME.."�� ho�n th�nh nhi�m v� n�y!", 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 27) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "N� Oa B�o H�p"), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task3, 28) ~= 1 then
		Say(CK_NPC_NAME..format("V�n ch�a s� d�ng b�t k� <color=red>%s<color>", "Ng�i sao may m�n"), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 29, 1);
	--����
	gf_ModifyExp(5000000);
	ck_AddCkScore(900);
	Msg2Player("Nhi�m v� ho�n th�nh!");
end

--ʹ��Ů洱���
function _ck_UseItemNvWa()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 27, 1);	
end

--ʹ��������
function _ck_UseItemLuckyStart()
	if ck_IsOpen() ~= 1 then
		return 0;
	end
	if ck_GetTitleType() == 0 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task3, 28, 1);		
end

function ck_ZiloTask()
	if ck_CheckCondition() ~= 1 then
		return 0;
	end
	local tSay = {
		"\nNhi�m v� t�ch l�y thu�c t�nh/ck_ZiloTask_1",
		"\nNhi�m v� ti�u ph� �i/ck_ZiloTask_2",
		"\nT�i ch� xem xem th�i/nothing",	
	}
	Say(CK_NPC_NAME.."Nhi�m v� <color=gold>��i Ph� �ng<color>, trong th�i gian ho�t ��ng ch� ���c ho�n th�nh 1 l�n, c� th� nh�n ���c nhi�u kinh nghi�m v� �� n�ng ��ng!", getn(tSay), tSay);		
end

--Task4��1-7������
function ck_ZiloTask_1(bTalk)
	local nTaskIndex = 0;
	for i = CK_TASK_ZILON_ATRR_BEGIN, getn(CK_TASK_ZILON_ATRR) do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Ch�c m�ng %s �� ho�n th�nh to�n b� <color=gold>nhi�m v� t�ch l�y thu�c t�nh<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_ZILON_ATRR[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa mu�n ho�n th�nh/#ck_ZiloTask_1(1)",
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Str = format("Nh�n v�t �� ��t chuy�n sinh %d c�p %d, t�ch l�y %d �i�m danh v�ng, %d �i�m s� m�n, %d �i�m c�ng tr�ng", tCell[2][1], tCell[2][2], tCell[2][3], tCell[2][4], tCell[2][5]);
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d",	tCell[1], Str, "N� l�c t�ch l�y s� gi�p b�n th�n ng�y c�ng l�n m�nh", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if gf_GetPlayerRebornCount() < tCell[2][1] then
		Say(CK_NPC_NAME..format("C�p chuy�n sinh c�a %s kh�ng �� <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][1]), 0);
		return 0;
	end
	if GetLevel() < tCell[2][2] and gf_GetPlayerRebornCount() <= tCell[2][1] then
		Say(CK_NPC_NAME..format("��ng c�p c�a %s kh�ng �� <color=red>%d<color>", gf_GetPlayerSexName(), tCell[2][2]), 0);
		return 0;
	end
	if GetReputation() < tCell[2][3] then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y danh v�ng c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][3]), 0);
		return 0;
	end
	if GetTask(336) < tCell[2][4] then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y s� m�n c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][4]), 0);
		return 0;
	end
	if abs(GetTask(701)) < tCell[2][5] then
		Say(CK_NPC_NAME..format("�i�m t�ch l�y c�ng tr�ng c�a %s kh�ng �� <color=red>%d<color> �i�m", gf_GetPlayerSexName(), tCell[2][5]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, nTaskIndex, 1);
	--����
	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);
	Msg2Player("Nhi�m v� ho�n th�nh!")
	ck_ZiloTask_1();
end

--Task4��8-12������
function ck_ZiloTask_2(bTalk)
	local nTaskIndex = 0;
	for i = CK_TASK_IB_COST_BEGIN, CK_TASK_IB_COST_BEGIN+getn(CK_TASK_IB_COST)-1 do
		if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Task4, i) ~= 1 then
			nTaskIndex = i - CK_TASK_IB_COST_BEGIN + 1;
			break;
		end
	end
	if nTaskIndex == 0 then
		Say(CK_NPC_NAME..format("Ch�c m�ng %s �� ho�n th�nh to�n b� <color=gold>nhi�m v� ti�u ph�<color>!", gf_GetPlayerSexName()), 0)
		return 0;
	end
	local tCell = CK_TASK_IB_COST[nTaskIndex];
	if not tCell then  return 0; end
	if not bTalk then
		local tSay = {
			"\nTa mu�n ho�n th�nh/#ck_ZiloTask_2(1)",
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Str = format("Trong �i b�t k� c�a ��a Huy�n Cung, V�n Ki�m Tr�ng, L��ng S�n v� Th�i Nh�t Th�p t�ch l�y s� d�ng %d Thi�n Ki�u L�nh �� m� r��ng", tCell[2]);
		local Msg = format("T�n nhi�m v�: <color=gold>%s<color>\n�i�u ki�n nhi�m v�:\n  %s\nH��ng d�n nhi�m v�:\n  %s\nPh�n th��ng nhi�m v�:\n�i�m kinh nghi�m: %d, �� n�ng ��ng: %d", tCell[1], Str, "D�ng Thi�n Ki�u L�nh �� m� r��ng s� nh�n ���c ph�n th��ng phong ph�", tCell[3][1], tCell[3][2]);
		Say(CK_NPC_NAME..Msg, getn(tSay), tSay);
		return 0;
	end
	if ck_GetCostIB() < tCell[2] then
		Say(CK_NPC_NAME..format("� �i hi�n t�i, s� l��ng Thi�n Ki�u L�nh do %s ti�u ph� kh�ng �� <color=red>%d<color> c�i", gf_GetPlayerSexName(), tCell[2]), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Task4, CK_TASK_IB_COST_BEGIN + nTaskIndex - 1, 1);
	--����
	gf_ModifyExp(tCell[3][1]);
	ck_AddCkScore(tCell[3][2]);
	Msg2Player("Nhi�m v� ho�n th�nh!")
	ck_ZiloTask_2();
end

--�ؿ������콾��Task5
function ck_GetCostIB()
	return CK_TASK_GROUP:GetTask(CK_TASK_GROUP.Task5);
end

--�ؿ����Ѷ���ӿ�Task5
function _ck_SetCostIB(nNum)
	if ck_IsOpen() ~= 1 then
		--print("SetCostIB",nNum,"not open")
		return 0;
	end
	if ck_GetTitleType() == 0 then
		--print("SetCostIB",nNum,"no titile")
		return 0;
	end
	nNum = nNum or 1;
	--print("GetCostIB",ck_GetCostIB(),CK_TASK_GROUP.Task5)
	CK_TASK_GROUP:SetTask(CK_TASK_GROUP.Task5, ck_GetCostIB() + tonumber(nNum));
end

function ck_QueryScore()
	Say(CK_NPC_NAME..format("%s b�y gi� �i�m n�ng ��ng l� <color=gold>%d<color>!", gf_GetPlayerSexName(), ck_GetCkScore()), 0);	
end

function ck_ScoreAward()
	cd_tbRoute = {[2] = 1, [4] = 1, [3] = 1, [6] = 1, [8] = 1, [9] = 1, [11] = 1, [12] = 1, [14] = 1, [15] = 1, [17] = 1, [18] = 1, [20] = 1, [21] = 1, [23] = 1, [29] = 1,[30] = 1,}
	local nRoute = GetPlayerRoute()
	if cd_tbRoute [nRoute] ~= 1 then
		Talk(1, "", CK_NPC_NAME.." Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return 0
	end
	local nScore = ck_GetCkScore();
	local tMsg = {
		[0] = "Ch�a ho�n th�nh",
		[1] = "�� ho�n th�nh",
	}
	local tSay = {};
	for i = 1, getn(CK_SCROE_AWARD_TABLE) do
		local nType = CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, i);
		tinsert(tSay, format("%d gi�i th��ng �i�m n�ng ��ng (%s)/#ck_ScoreAward_func_%d(%d, %d)", CK_SCROE_AWARD_TABLE[i], tMsg[nType], i, nScore, CK_SCROE_AWARD_TABLE[i]));
	end
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(CK_NPC_NAME..format("%s b�y gi� �i�m n�ng ��ng l� <color=gold>%d<color>,h�y nh�n gi�i th��ng!", gf_GetPlayerSexName(), nScore), getn(tSay), tSay);
end

function ck_ScoreAward_func_1(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_1(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 1000000, 100, 100, 1000, 10000)..",".."�� th�ng c�nh gi�i V� Hi�n"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 1) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("��ng c�p ng��i kh�ng �� %d c�p, kh�ng ���c nh�n th��ng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 1, 1);
	gf_Modify("Exp", 1000000);
	gf_Modify("Rep", 100);
	gf_Modify("ShiMen", 100);
	gf_Modify("JunGong", 1000);
	local nLevel = MeridianGetLevel()
	if nLevel < 1 then
		for i = nLevel + 1, 1 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 1000000);
	end
	gf_Modify("ZhenQi", 10000);
end

function ck_ScoreAward_func_2(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_2(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 2000000, 160, 160, 1400, 0)..",".."N�n Di�u D��ng (Theo ki�u h�nh, l�u ph�i)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 2) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 2, 1);
	gf_Modify("Exp", 2000000);
	gf_Modify("Rep", 160);
	gf_Modify("ShiMen", 160);
	gf_Modify("JunGong", 1400);
--==============
--	if gf_GetPlayerRebornCount() < 1 then
--		gf_SetTaskByte(1538, 1, 1); 			--1ת
--		SetLevel(90, 1);								  --90��
--		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 2000000);
--	end
--===============
	ahf_GetYaoYangByRouteBody(VET_YAOYANG_CAP);
end

function ck_ScoreAward_func_3(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_3(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 3000000, 220, 220, 1800, 15000)..",".."�� th�ng c�nh gi�i V� T��ng"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 3) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("��ng c�p ng��i kh�ng �� %d c�p, kh�ng ���c nh�n th��ng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 3, 1);
	gf_Modify("Exp", 3000000);
	gf_Modify("Rep", 220);
	gf_Modify("ShiMen", 220);
	gf_Modify("JunGong", 1800);
	local nLevel = MeridianGetLevel()
	if nLevel < 2 then
		for i = nLevel + 1, 2 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 3000000);
	end	
	gf_Modify("ZhenQi", 15000);
end

function ck_ScoreAward_func_4(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_4(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 4000000, 280, 280, 2200, 0)..",".."�o Di�u D��ng (Theo ki�u h�nh, l�u ph�i)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 4) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 4, 1);
	gf_Modify("Exp", 4000000);
	gf_Modify("Rep", 280);
	gf_Modify("ShiMen", 280);
	gf_Modify("JunGong", 2200);
--	if gf_GetPlayerRebornCount() < 2 then
--		gf_SetTaskByte(1538, 1, 2); 			--1ת
--		SetLevel(90, 1);								  --90��
--		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 4000000);
--	end
	ahf_GetYaoYangByRouteBody(VET_YAOYANG_CLOTH);
end

function ck_ScoreAward_func_5(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_5(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 5000000, 340, 340, 2600, 25000)..",".."�� th�ng c�nh gi�i V� V��ng"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 5) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetLevel() < 90 then
		Say(CK_NPC_NAME..format("��ng c�p ng��i kh�ng �� %d c�p, kh�ng ���c nh�n th��ng!", 90), 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 5, 1);
	gf_Modify("Exp", 5000000);
	gf_Modify("Rep", 340);
	gf_Modify("ShiMen", 340);
	gf_Modify("JunGong", 2600);
	local nLevel = MeridianGetLevel()
	if nLevel < 3 then
		for i = nLevel + 1, 3 do
			MeridianUpdateLevel()
		end
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	else
		gf_Modify("Exp", 5000000);
	end	
	gf_Modify("ZhenQi", 25000);
end

function ck_ScoreAward_func_6(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_6(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 6000000, 400, 400, 3000, 0)..",".."Qu�n Di�u D��ng (Theo ki�u h�nh, l�u ph�i)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 6) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 6, 1);
	gf_Modify("Exp", 6000000);
	gf_Modify("Rep", 400);
	gf_Modify("ShiMen", 400);
	gf_Modify("JunGong", 3000);
--	if gf_GetPlayerRebornCount() < 3 then
--		gf_SetTaskByte(1538, 1, 3); 			--1ת
--		SetLevel(90, 1);								  --90��
--		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 6000000);
--	end
	ahf_GetYaoYangByRouteBody(VET_YAOYANG_SHOE);
end

function ck_ScoreAward_func_7(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_7(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 7000000, 460, 460, 3400, 30000)..",".."Huy Ch��ng Ng� H�nh (T� ch�n)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 7) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_JS_HUIZHANG) do
		DebugOutput(CK_JS_HUIZHANG[i][1], i)
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_7_Do(%d)", CK_JS_HUIZHANG[i][1], i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);	
end

function  ck_ScoreAward_func_7_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 7, 1);
	gf_Modify("Exp", 7000000);
	gf_Modify("Rep", 460);
	gf_Modify("ShiMen", 460);
	gf_Modify("JunGong", 3400);
	gf_Modify("ZhenQi", 30000);
	gf_AddItemEx2(CK_JS_HUIZHANG[nIndex][2], CK_JS_HUIZHANG[nIndex][1], "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_8(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_8(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 8000000, 520, 520, 3800, 0)..",".."U�n Linh C�p 4"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 8) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	ck_ScoreAward_func_8_Do()
--	local tDialog = {}
--	for i = 1, getn(CK_YAOYANG_JIEZI_1) do
--		tinsert(tDialog, format("%s/#ck_ScoreAward_func_8_Do(%d)", CK_YAOYANG_JIEZI_1[i][1], i));
--	end
--	tinsert(tDialog, "\n��ֻ�ǿ�������/nothing");
--	Say(CK_NPC_NAME.."��ѡ������Ҫ�����ͣ�", getn(tDialog), tDialog);		
end

function ck_ScoreAward_func_8_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 8, 1);
	gf_Modify("Exp", 8000000);
	gf_Modify("Rep", 520);
	gf_Modify("ShiMen", 520);
	gf_Modify("JunGong", 3800);
--	if gf_GetPlayerRebornCount() < 4 then
--		gf_SetTaskByte(1538, 1, 4); 			--1ת
--		SetLevel(90, 1);								  --90��
--		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
--	else
--		gf_Modify("Exp", 10000000);
--	end
	gf_AddItemEx2({2, 1, 30614, 1, 1}, "L�i H� Tinh Ph�ch", "CDKEY", "CDKEY", 0, 1);
	--gf_AddItemEx2(CK_YAOYANG_JIEZI_1[nIndex][2], CK_YAOYANG_JIEZI_1[nIndex][1], "CDKEY", "CDKEY", 0, 1);
	--4������
	local nRandIndex = random(getn(CK_4_LEVEL_YUNLING));
	gf_AddItemEx2(CK_4_LEVEL_YUNLING[nRandIndex][2], CK_4_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
end

function ck_ScoreAward_func_9(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_9(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 9000000, 580, 580, 4200, 0)..",".."Chuy�n sinh 5 c�p 90"..",".."V� Kh� Di�u D��ng (Theo ki�u h�nh, l�u ph�i)"..",".."L�i H� Tinh Ph�ch*1"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 9) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	if GetPlayerRoute() == 0 then
		Talk(1, "", CK_NPC_NAME.." Ch�a gia nh�p h� ph�i, kh�ng th� nh�n th��ng.");
		return 0
	end
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
--	gf_Modify("Exp", 9000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
	if gf_GetPlayerRebornCount() < 5 or (gf_GetPlayerRebornCount() == 5 and GetLevel() < 90) then
--		gf_SetTaskByte(1538, 1, 5); 			--1ת
--		SetLevel(90, 1);								  --90��
--		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		ck_chuyensinh()
	else
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
		gf_Modify("Exp", 13000000); --exp bonus n�u �� CS r�i
		gf_Modify("Exp", 9000000);
		gf_Modify("Rep", 580);
		gf_Modify("ShiMen", 580);
		gf_Modify("JunGong", 4200);		
		ahf_GetYaoYangWeaponRand(1);
		gf_AddItemEx2({2, 1, 30614, 1}, "L�i H� Tinh Ph�ch", "CDKEY", "CDKEY", 0, 1);
	end
--	ahf_GetYaoYangWeaponRand(1);
--	gf_AddItemEx2({2, 1, 30614, 1}, "L�i H� Tinh Ph�ch", "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_10(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_10(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 10000000, 580, 580, 4200, 0)..",".."N�n Chi�n Cu�ng (Theo ki�u h�nh, l�u ph�i)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 10) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 10, 1);
	gf_Modify("Exp", 10000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	--ս��ͷ��
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CAP);
end

function ck_ScoreAward_func_11(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_11(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 11000000, 580, 580, 4200, 0)..",".."�o Kho�c Ng� H�nh (T� ch�n)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 11) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_JS_GUAIYI) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_11_Do(%d)", CK_JS_GUAIYI[i][1], i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);	
end

function ck_ScoreAward_func_11_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 11, 1);
	gf_Modify("Exp", 11000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2(CK_JS_GUAIYI[nIndex][2], CK_JS_GUAIYI[nIndex][1], "CDKEY", "CDKEY", 0, 1);
end

function ck_ScoreAward_func_12(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_12(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 12000000, 580, 580, 4200, 0)..",".."Chi�n H�i Ng� H�nh (T� ch�n)"..",".."T� ch�n �� trang s�c c�p 2 Di�u D��ng"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 12) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_JS_SHOE) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_12_Do(%d)", CK_JS_SHOE[i][1], i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);	
end

function ck_ScoreAward_func_12_Do(nIndex)
	local tDialog = {}
	for i = 1, getn(CK_YAOYANG_JIEZI_2) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_12_Do2(%d,%d)", CK_YAOYANG_JIEZI_2[i][1], nIndex,i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);
end

function ck_ScoreAward_func_12_Do2(nIndex1,nIndex2)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 12, 1);
	gf_Modify("Exp", 12000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2(CK_JS_SHOE[nIndex1][2], CK_JS_SHOE[nIndex1][1], "CDKEY", "CDKEY", 0, 1)
	gf_AddItemEx2(CK_YAOYANG_JIEZI_2[nIndex2][2], CK_YAOYANG_JIEZI_2[nIndex2][1], "CDKEY", "CDKEY", 0, 1)
end

function ck_ScoreAward_func_13(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_13(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 18000000, 580, 580, 4200, 0)..",".."U�n Linh C�p 5"..",".."�o Chi�n Cu�ng (Theo ki�u h�nh, l�u ph�i)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 13) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	
    if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 13, 1);
	gf_Modify("Exp", 18000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	--5������
	local nRandIndex = random(getn(CK_5_LEVEL_YUNLING));
	gf_AddItemEx2(CK_5_LEVEL_YUNLING[nRandIndex][2], CK_5_LEVEL_YUNLING[nRandIndex][1], "CDKEY", "CDKEY", 0, 1)
	
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_CLOTH);
end

--function ck_ScoreAward_func_13_Do(nIndex)

--end

function ck_ScoreAward_func_14(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_14(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 28000000, 580, 580, 4200, 0)..",".."T� ch�n �� trang s�c c�p 2 Di�u D��ng"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 14) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	local tDialog = {}
	for i = 1, getn(CK_YAOYANG_JIEZI_2) do
		tinsert(tDialog, format("%s/#ck_ScoreAward_func_14_Do(%d)", CK_YAOYANG_JIEZI_2[i][1], i));
	end
	tinsert(tDialog, "\nT�i ch� xem xem th�i/nothing");
	Say(CK_NPC_NAME.."H�y ch�n lo�i c�n:", getn(tDialog), tDialog);	
	
end

function ck_ScoreAward_func_14_Do(nIndex)
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 14, 1);
	gf_Modify("Exp", 28000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	
	gf_AddItemEx2(CK_YAOYANG_JIEZI_2[nIndex][2], CK_YAOYANG_JIEZI_2[nIndex][1], "CDKEY", "CDKEY", 0, 1)
	
end

function ck_ScoreAward_func_15(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_15(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 32000000, 580, 580, 4200, 0)..",".."Qu�n Chi�n Cu�ng  (Theo ki�u h�nh, l�u ph�i)"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 15) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 15, 1);
	gf_Modify("Exp", 32000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	--ս�����
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_SHOE);
end

function ck_ScoreAward_func_16(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_16(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 36000000, 580, 580, 4200, 0)..",".."6 chuy�n 90 c�p"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 16) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	-----------------
--	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
--	gf_Modify("Exp", 36000000);
--	gf_Modify("Rep", 580);
--	gf_Modify("ShiMen", 580);
--	gf_Modify("JunGong", 4200);
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()			
	if nChuyenSinh < 690 then
--		gf_SetTaskByte(1538, 1, 5); 			--1ת
--		PlayerReborn(1,random(1,4))
--		SetLevel(90, 1);								  --90��
--		Msg2Player("Th�ng c�p chuy�n sinh th�nh c�ng!");
--		PlaySound("\\sound\\sound_i016.wav");
--		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
		ck_phucsinh1()
	else
		gf_Modify("Exp", 30000000);
		gf_Modify("Exp", 36000000);
		gf_Modify("Rep", 580);
		gf_Modify("ShiMen", 580);
		gf_Modify("JunGong", 4200);
		CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
	end
end

function ck_ScoreAward_func_17(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_17(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 40000000, 580, 580, 4200, 0)..",".."V� kh� Chi�n Cu�ng(theo d�ng ng��i l�u ph�i)"..",".."Tr�ng Linh Th�-Trung"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 17) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 100, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 17, 1);
	gf_Modify("Exp", 40000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2({2, 1, 30727, 1, 4}, "Tr�ng Linh Th�-Trung", "CDKEY", "CDKEY", 0, 1)
	ahf_GetEquipByRouteBody(VET_ZHANKUANG_WEAPON)
end

function ck_ScoreAward_func_18(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_18(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 44000000, 580, 580, 4200, 0)..",".."Ng�u nhi�n �� qu� c�p 4~6"..",".."Tr�ng Linh Th�-Trung"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 18) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	if gf_Judge_Room_Weight(3, 200, " ") ~= 1 then
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 18, 1);
	gf_Modify("Exp", 44000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	gf_AddItemEx2({2, 1, 30727, 1, 4}, "Tr�ng Linh Th�-Trung", "CDKEY", "CDKEY", 0, 1)
	ck_GiveRandGem456()
end

function ck_ScoreAward_func_19(nCurScore, nNeedScore, bTalk)
	if not bTalk then
		local tSay = {
			format("\n Nh�n ph�n th��ng/#ck_ScoreAward_func_19(%d,%d,1)", nCurScore, nNeedScore),
			"\nT�i ch� xem xem th�i/nothing",
		}
		local Msg = format("Kinh nghi�m %s, danh v�ng %d, �i�m s� m�n %d, �i�m c�ng tr�ng %d, �i�m ch�n kh� %d", 48000000, 580, 580, 4200, 0)..",".."Danh hi�u [Nhi�m V� ��t Nh�n]"
		Say(CK_NPC_NAME..format("Hi�n t�i c� th� nh�n ph�n th��ng:\n   <color=green>%s<color>\n<color=red>Khi kh�ng th� cho th�m ph�n th��ng th� s� d�ng �i�m kinh nghi�m �� thay th�<color>", Msg), getn(tSay), tSay);
		return 0;
	end
	if tonumber(nCurScore) < tonumber(nNeedScore) then
		Say(CK_NPC_NAME..format("�i�m n�ng ��ng ch�a ��t <color=red>%d<color>, kh�ng th� nh�n th��ng!", tonumber(nNeedScore)), 0);
		return 0;
	end
	if CK_TASK_GROUP:GetTaskBit(CK_TASK_GROUP.Award, 19) ~= 0 then
		Say(CK_NPC_NAME.."�� nh�n ph�n th��ng n�y r�i!", 0);
		return 0;
	end
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 19, 1);
	gf_Modify("Exp", 48000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	AddTitle(68, 4);
	SetTitleTime(68, 4, GetTime() + 60 * 24 * 3600);
	Msg2Player(format("Nh�n ���c danh hi�u [%s]", "Nhi�m V� ��t Nh�n"))
end


function ck_chuyensinh()
	local tSay = 	{
							"Tu luy�n theo h��ng Long T�!/#ck_select_translife(1)",
							"Tu luy�n theo h��ng H� T�!/#ck_select_translife(2)",
							"Tu luy�n theo h��ng Ph�ng T�!/#ck_select_translife(4)",
							"Tu luy�n theo h��ng �ng T�!/#ck_select_translife(3)",
							"Ta suy ngh� l�i ��/nothing",
						}
	Say("H�n Nguy�n C�ng th�c ch�t c� 4 h��ng tu luy�n, ng��i mu�n theo h��ng n�o?",getn(tSay),tSay)
end

function ck_select_translife(nType)
	if  IsPlayerDeath() ~= 0 then
		Talk(1,"","Ng��i ch�i c�n s�ng m�i ���c chuy�n sinh")
		return
	end	
	local nRoute = GetPlayerRoute()
	if gf_GetPlayerRebornCount() < 5 and gf_GetPlayerRebornCount() > 0 then
		local nTransCount_1 = GetTranslifeCount()	
		RemoveTitle(ck_tb_translife_tittle[nTransCount_1][nRoute][2], ck_tb_translife_tittle[nTransCount_1][nRoute][3])
	end
	-- Set s� l�n chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_COUNT, 5) --5 l�n chuy�n sinh
	-- Set h��ng chuy�n sinh
	gf_SetTaskByte(TRANSLIFE_TASK_ID, TRANSLIFE_BYTE_FACTION, nType)
	local nTransCount = GetTranslifeCount()	
--	for i=1,4 do	
--		RemoveTitle(ck_tb_translife_tittle[i][nRoute][2], ck_tb_translife_tittle[i][nRoute][3])
--	end
	AddTitle(ck_tb_translife_tittle[nTransCount][nRoute][2], ck_tb_translife_tittle[nTransCount][nRoute][3])	
--	SetTaskTrans()
	SetTask(TRANSLIFE_MISSION_ID,36)
	ResetProperty()
	SetLevel(90,0)
	Msg2Player("�ang tu luy�n H�n Nguy�n C�ng chi�u th�c th� nh�t...")
	AddGlobalNews("Tin ��n ch�n ��ng giang h�: nghe n�i Cao Th� V� L�m <color=green>"..GetName().."<color> tu luy�n theo h��ng <color=yellow>"..tb_translife_seal[nType][3].."<color> �� l�nh h�i ���c 2 th�nh <color=green>H�n Nguy�n C�ng<color>!")	
	WriteLogEx("Chuyen Sinh","th�nh c�ng l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
	--====ph�n th��ng c�a c�p ��i th��ng � tr�n
	gf_Modify("Exp", 9000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);
	ahf_GetYaoYangWeaponRand(1);
	gf_AddItemEx2({2, 1, 30614, 1}, "L�i H� Tinh Ph�ch", "CDKEY", "CDKEY", 0, 1);	
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 9, 1);
	--========
	DoWait(15,15,10)		
end

function CDKEY_SetExtBit(nExtPoint, nBit, nBitValue)
	if nBit < 1 or nBit > 15 then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "Out of range")
		return 0
	end
	local nValue = GetExtPoint(nExtPoint)
	local nNewValue = SetBit(nValue, nBit, nBitValue)
	PayExtPoint(nExtPoint, GetExtPoint(nExtPoint))
	AddExtPoint(nExtPoint, nNewValue)
	if GetExtPoint(nExtPoint) == nNewValue then
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "success", 1, "From "..nValue.." to "..nNewValue)
		return 1
	else
		gf_WriteLogEx("CHANGE EXT POINT "..nExtPoint, "fail", 1, "From "..nValue.." to "..GetExtPoint(nExtPoint))
		return 0
	end
end

function ck_phucsinh1()
	local tSay = 	{
							"Tu luy�n theo h��ng Long T�!/#ck_select_translife_ps(1)",
							"Tu luy�n theo h��ng H� T�!/#ck_select_translife_ps(2)",
							"Tu luy�n theo h��ng Ph�ng T�!/#ck_select_translife_ps(4)",
							"Tu luy�n theo h��ng �ng T�!/#ck_select_translife_ps(3)",
							"Ta suy ngh� l�i ��/nothing",
						}
	Say("H�n Nguy�n C�ng th�c ch�t c� 4 h��ng tu luy�n, ng��i mu�n theo h��ng n�o?",getn(tSay),tSay)
end

function ck_select_translife_ps(nType)
	local nChuyenSinh = (GetTranslifeCount() + GetPlayerRebornParam(0)) * 100 + GetLevel()
	local nRoute = GetPlayerRoute()
	local tbType = {"Long T�", "H� T�", "�ng T�", "Ph�ng T�"}
	if IsPlayerDeath() ~= 0 then 
		Talk(1, "", "Hi�n t�i kh�ng th� nh�n th��ng!!!")
		return
	end	
--	if nChuyenSinh < 599 then -- b�t chuy�n sinh 7
--		Talk(1,"","<color=green>L�c Tr�c �ng: <color>Kinh nghi�m chuy�n sinh c�a ��i hi�p kh�ng ��, ta kh�ng th� gi�p g� ���c c� !!!!")
--		return 0	
--	end	
	if nChuyenSinh >= 690 then -- b�t chuy�n sinh 7
		Talk(1,"","<color=green>L�c Tr�c �ng: <color>Kinh nghi�m chuy�n sinh c�a ��i hi�p qu� cao, ta kh�ng th� gi�p g� ���c c� !!!!")
		return 0	
	end
--	if MeridianGetLevel() < 2 then	
--		Talk(1,"","Kinh m�ch c�a ��i hi�p ch�a ��t c�p �� V� T��ng !!!!")
--		return 0			
--	end
	DelItem(2,0,1083,2)
	DelItem(2,1,30345,2)

	BigDelItem(2,0,30002, BigGetItemCount(2,0,30002))
	BigDelItem(2,0,30003, BigGetItemCount(2,0,30003))
	BigDelItem(2,0,30005, BigGetItemCount(2,0,30005))
	BigDelItem(2,0,30006, BigGetItemCount(2,0,30006))	
	local nType_cs5 = GetTranslifeFaction()	
	local nTransCount = GetTranslifeCount()	
		for i=1, getn(tb_translife_cloth[nType_cs5][nTransCount]) do
			local G,D,P,nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3  = gf_UnPack(tb_translife_cloth[nType_cs5][nTransCount][i][2])
			P = P + GetBody() - 1
			Pnew = 30000 + GetBody()
			Pnew1 = 561 + GetBody()			
			Pnew2 = 565 + GetBody()		
			lvatt3 = lvatt3 or 0
			att3 = att3 or 0
			BigDelItem(G,D,P,BigGetItemCount(G,D,P))
			BigDelItem(G,D,Pnew,BigGetItemCount(G,D,Pnew))
			BigDelItem(G,D,Pnew1,BigGetItemCount(G,D,Pnew1))			
			BigDelItem(G,D,Pnew2,BigGetItemCount(G,D,Pnew2))					
--			gf_AddItemEx2({G, D, (30000 + GetBody()), nCount,4, lvatt1, att1, lvatt2, att2, lvatt3, att3},"T� Linh Vi�t Trang","Chuyen Sinh","nh�n ngo�i trang",120*24*3600,1)
		end

	RemoveTitle(tb_translife_tittle[nTransCount][nRoute][2], tb_translife_tittle[nTransCount][nRoute][3])	

	local tbVanSu = {"V�n S� ngo�i trang",0,108,570,188}
	local nPVanSu = tbVanSu[4]  + GetBody() - 1
	for i = 0, 2 do
		BigDelItem(0, 108 + i, nPVanSu, BigGetItemCount(0, 108 + i, nPVanSu))	
	end
	gf_AddItemEx(tb_translife_seal_cs6[nType][2], tb_translife_seal_cs6[nType][1])
	PlayerReborn(1,nType) -- Chuy�n Sinh 6 th�nh c�ng		
	SetLevel(90,0)
	AddTitle(61,05)
--	SetTask(TSK_CS6_TULINH,5)		--ho�n th�nh nh�m v� chuy�n sinh
--	VNG_SetTaskPos(TSK_THANGTIEN_PHUCSINH, 2, 1, 1)
 	gf_WriteLogEx("CD KEY", "chuy�n sinh th�nh c�ng", 1, "CD KEY phan thuong 16")	
 	local nGetExp = GetExp()
	local nTime = floor(nGetExp/2000000000)
	if nTime >= 1 then
		for i = 1, nTime do
			ModifyExp(-2000000000)
		end
	end
	ModifyExp(-GetExp())
	--====ph�n th��ng c�a c�p ��i th��ng � tr�n
	gf_Modify("Exp", 36000000);
	gf_Modify("Rep", 580);
	gf_Modify("ShiMen", 580);
	gf_Modify("JunGong", 4200);	
	CK_TASK_GROUP:SetTaskBit(CK_TASK_GROUP.Award, 16, 1);
	--
	Msg2Player("Ch�c m�ng ��i hi�p �� Ph�c Sinh th�nh c�ng theo h��ng "..tbType[nType])
	Say("Ch�c m�ng ��i hi�p �� l�nh ng� th�nh c�ng b� k�p gia truy�n T� Linh Ph�c Tinh! H�y ��ng nh�p l�i.",1,"Tho�t!/nothing")
end