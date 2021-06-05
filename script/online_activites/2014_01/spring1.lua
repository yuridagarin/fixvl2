--���ڸ��2
Include("\\script\\lib\\globalfunctions.lua") --���������ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_201401_SPRING1_ACTIVITYID = 109;

VET_201401_SPRING1_MAIN = "T�t C� Truy�n/Vet_201401_sprint1_main";

VET_201401_SPRING1_TASK = TaskManager:Create(10, 7)
VET_201401_SPRING1_TASK.DaySeq = 1;
VET_201401_SPRING1_TASK.ACCEPT = 2;
VET_201401_SPRING1_TASK.AWARD = 3;
VET_201401_SPRING1_TASK.TEAM = 4;
VET_201401_SPRING1_TASK.KILLWILDPIG = 5;
VET_201401_SPRING1_TASK.TRIGGER = 6;
VET_201401_SPRING1_TASK.TeamCode = 7;

function Vet_201401_sprint1_main()
--	if gf_CheckBaseCondition(88, 1) ~= 1 and gf_GetPlayerRebornCount() <= 0 then
--		Talk(1,"","C�p 88 tr� l�n h�c h�t k� n�ng 55 ho�c �� chuy�n sinh m�i c� th� tham gia ho�t ��ng");
--		return 0;
--	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.DaySeq) ~= zgc_pub_day_turn() then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.DaySeq,zgc_pub_day_turn());
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.ACCEPT,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.AWARD,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TEAM,0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER,0);
	end
	local tSay = {
		"Nh�n nhi�m v� T�t C� Truy�n/Vet_201401_AcceptSprintTask",
		"Nh�n ph�n th��ng nhi�m v� T�t C� Truy�n/Vet_201401_GetAward",
		"Ph�n th��ng t� ��i/Vet_201401_OpenTeamAward",
		"T�i h� ch� xem qua th�i/nothing",
	}
	Say("B�o tr�c thanh trung nh�t tu� tr�, xu�n phong t�ng no�n nh�p �� t�!", getn(tSay), tSay);
end

function Vet_201401_AcceptSprintTask(bTag)
	local nKillWildPig = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG);
	if not bTag then
		Say(format("1: Ti�u hao 100 L� Dong + 100 ��u Xanh Th�t Heo + 10 V�ng\n2: ��nh b�i 100 con Heo R�ng (%d/%d)", nKillWildPig, 100),
			 2, "��ng �/#Vet_201401_AcceptSprintTask(1)", "tr� l�i/Vet_201401_sprint1_main");
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 0 then
		Talk(1,"","Nhi�m v� T�t C� Truy�n m�i ng�y ch� c� th� nh�n v� ho�n th�nh 1 l�n");
		return 0;
	end
	if GetItemCount(2, 1, 30619) < 100 then
		Talk(1,"",format("H�nh trang kh�ng gian %s kh�ng �� %d", "L� Dong", 100));
		return 0;
	end
	if GetItemCount(2, 1, 30620) < 100 then
		Talk(1,"",format("H�nh trang kh�ng gian %s kh�ng �� %d", "��u Xanh Th�t Heo", 100));
		return 0;
	end
	if GetCash() < 10*10000 then
		Talk(1,"",format("H�nh trang kh�ng gian %s kh�ng �� %d", "V�ng", 10).." Kim ");
		return 0;
	end
	if DelItem(2, 1, 30619, 100) ~= 1 or DelItem(2, 1, 30620, 100) ~= 1 or Pay(10*10000) ~= 1 then
		return 0;
	end
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.ACCEPT, 1);
	Msg2Player(format("Ti�u hao %s*%d", "L� Dong", 100));
	Msg2Player(format("Ti�u hao %s*%d", "��u Xanh Th�t Heo", 100));
	if nKillWildPig < 100 then
		Msg2Player("��i hi�p nhanh ch�ng �i t�m Heo R�ng v� ti�u di�t n�!");
	else
		Msg2Player("Nhanh nh�n ph�n th��ng �i!");
	end
end

function Vet_201401_Kill_WildPig(sName)
	if gf_CheckEventDateEx(VET_201401_SPRING1_ACTIVITYID) ~= 1 then
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 1 then
		return 0;
	end
	local nCount = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG);
	if nCount >= 100 then
		return 0;
	end
	if sName == "Heo r�ng" then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.KILLWILDPIG, nCount + 1);
		Msg2Player(format("Nhi�m v� T�t C� Truy�n: ��nh b�i %s%d/%d", sName, min(nCount + 1, 100), 100));
	end
end

function Vet_201401_GetAward()
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.AWARD) ~= 0 then
		Talk(1,"","Ng��i �� nh�n ph�n th��ng nhi�m v� T�t C� Truy�n r�i")
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.ACCEPT) ~= 1 then
		Talk(1,"","Ng��i v�n ch�a nh�n nhi�m v� T�t C� Truy�n");
		return 0;
	end
	if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.KILLWILDPIG) < 100 then
		Talk(1,"","Ng��i ch�a ho�n th�nh nhi�m v� ��nh b�i 100 con Heo R�ng");
		return 0;
	end
	if gf_Judge_Room_Weight(3, 10, " ") ~= 1 then
		return 0;
	end
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.AWARD, 1);
	gf_Modify("Exp", 20142014);
  gf_AddItemEx2({2,95,208,1,4}, "T� Ngh�a L�nh", "Event ph� 2 th�ng 1", "", 0, 1);
  gf_AddItemEx2({2,1,30409,1,4}, "Th�ng Thi�n L�nh", "Event ph� 2 th�ng 1", "", 0, 1);
  gf_AddItemEx2({2,1,30623,1,4}, "Bao L� X� n�m 2014", "Event ph� 2 th�ng 1", "", 24*3600, 1);
end

function Vet_201401_OpenTeamAward()
	if GetTeamSize() ~= 8 then
		Talk(1,"",format("Nh�n s� t� ��i kh�ng �� %d ng��i", 8));
		return 0;
	end
	if GetCaptainName() ~= GetName() then
		Talk(1,"","Ng��i kh�ng ph�i ��i tr��ng");
		return 0;
	end
	local oldPlayerIdx = PlayerIndex;
	local bIsShow = nil;
	local msg = "Th�nh vi�n �� s� d�ng ph�n th��ng t� ��i: \n"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TEAM) ~= 0 or GetTrigger(1535*2) > 0 then
			msg = msg.."<color=red>"..GetName().."<color>\n";
			bIsShow = 1;
		end
	end
	PlayerIndex = oldPlayerIdx;
	if bIsShow then
		Talk(1,"",msg);
		return 0;
	end
	local msg1 = "Th�nh vi�n kh�ng �� nguy�n li�u: \n"
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2,1,30623) < 1 or GetCash() < 2*10000 then
			msg1 = msg1.."<color=red>"..GetName().."<color>\n";
			bIsShow = 1;
		end
	end
	PlayerIndex = oldPlayerIdx;
	if bIsShow then
		Talk(1,"",msg1);
		return 0;
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2,1,30623,1) ~= 1 or Pay(2*10000) ~= 1 then
			PlayerIndex = oldPlayerIdx;
			return 0;
		end
	end
	PlayerIndex = oldPlayerIdx;
	SetCreateTeam(1);
	local nTeamCode = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TEAM, 1);
		nTeamCode = nTeamCode + tonumber(PlayerIndex);
	end
	PlayerIndex = oldPlayerIdx;
	local nTrigger = CreateTrigger(1, 1535, 1535*2);
	if nTrigger > 0 then
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER, 0);
		VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TeamCode, nTeamCode);
		ContinueTimer(nTrigger);
		gf_Msg2Team("M� th�nh c�ng ph�n th��ng t� ��i, kh�ng c�n ti�n h�nh thao t�c kh�c v� ��ng r�i m�ng");
	end
end

function Vet_201401_OnTimer()
	local oldPlayerIdx = PlayerIndex;
	local nTeamCode = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		nTeamCode = nTeamCode + tonumber(PlayerIndex);
	end
	PlayerIndex = oldPlayerIdx;
	if GetCaptainName() ~= GetName() or GetTeamSize() ~= 8 
		or VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TeamCode) ~= nTeamCode then
		RemoveTrigger(GetTrigger(1535*2));
		gf_Msg2Team("Ph�n th��ng t� ��i k�t th�c!");
		SetCreateTeam(0);
		return 0;
	end
	local nTimes = VET_201401_SPRING1_TASK:GetTask(VET_201401_SPRING1_TASK.TRIGGER);
	if nTimes > 40 then
		RemoveTrigger(GetTrigger(1535*2));
		gf_Msg2Team("Ph�n th��ng t� ��i k�t th�c!");
		SetCreateTeam(0);
		return 0;
	end
	gf_TeamOperateEX(function ()
		if gf_CheckBaseCondition(88, 1) == 1 or gf_GetPlayerRebornCount() > 0 then
			gf_ModifyExp(250000);
		end
	end)
	VET_201401_SPRING1_TASK:SetTask(VET_201401_SPRING1_TASK.TRIGGER, nTimes + 1);
end