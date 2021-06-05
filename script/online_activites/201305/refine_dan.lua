Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

RD_ACTIVITY_ID = 90
RD_DIALOG_TITLE = "Luy�n Th�n T�n ��n/Vet_201305_Refine_Dan";
RD_REFINE_COST = 39
RD_REFINE_MAX = 10
RD_USE_MAX = 10
RD_TEAM_SIZE_MIN = 4
RD_TOTAL_COUNT = 20
RD_EXP_AWARD = 50000

RD_EXP_CAP_AWARD = {
	[2] = 600000,
	[3] = 612000,
	[4] = 630000,
	[5] = 660000,
	[6] = 690000,
	[7] = 720000,
	[8] = 810000,	
}

VET_201305_RD_TASKGROUP = TaskManager:Create(1, 13);
VET_201305_RD_TASKGROUP.DaySeq = 1;
VET_201305_RD_TASKGROUP.RefineTimes = 2;
VET_201305_RD_TASKGROUP.UseTimes = 3;
VET_201305_RD_TASKGROUP.TriggerCount = 4;
VET_201305_RD_TASKGROUP.TeamSize = 5;

function Vet_201305_Refine_Dan()
	if gf_CheckEventDateEx(RD_ACTIVITY_ID) ~= 1 then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if GetItemCount(2,1,30230) < RD_REFINE_COST then
		Talk(1,"",format("C�n <color=red>%d<color>XU m�i c� th� luy�n ch� Th�n T�n ��n", RD_REFINE_COST));
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i c� th� k�ch ho�t luy�n Th�n T�n ��n");
		return 0;
	end
	if GetTeamSize() < RD_TEAM_SIZE_MIN then
		Talk(1,"",format("T� ��i tr�n <color=red>%d<color> ng��i c� th� luy�n ch� Th�n T�n ��n", RD_TEAM_SIZE_MIN));
		return 0;
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.DaySeq, zgc_pub_day_turn());
		for i = 2, 10 do
			VET_201305_RD_TASKGROUP:SetTask(i, 0);
		end
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.RefineTimes) >= RD_REFINE_MAX then
		Talk(1,"",format("M�i ng�y m�i nh�n v�t c� th� luy�n %d Th�n T�n ��n",RD_REFINE_MAX));
		return 0;
	end
	DoWait(115, 116, 3*60);
end

function Vet_201305_Refine_Dan_Suc()
	if gf_CheckEventDateEx(RD_ACTIVITY_ID) ~= 1 then
		Talk(1,"","Event v�n ch�a kh�i ��ng");
		return 0;
	end
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh�ng gian h�nh trang kh�ng ��");
		return 0;
	end
	if GetItemCount(2,1,30230) < RD_REFINE_COST then
		Talk(1,"",format("C�n <color=red>%d<color>XU m�i c� th� luy�n ch� Th�n T�n ��n", RD_REFINE_COST));
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i c� th� k�ch ho�t luy�n Th�n T�n ��n");
		return 0;
	end
	if GetTeamSize() < RD_TEAM_SIZE_MIN then
		Talk(1,"",format("T� ��i tr�n <color=red>%d<color> ng��i c� th� luy�n ch� Th�n T�n ��n", RD_TEAM_SIZE_MIN));
		return 0;
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.DaySeq) ~= zgc_pub_day_turn() then
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.DaySeq, zgc_pub_day_turn());
		for i = 2, 10 do
			VET_201305_RD_TASKGROUP:SetTask(i, 0);
		end
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.RefineTimes) >= RD_REFINE_MAX then
		Talk(1,"",format("M�i ng�y m�i nh�n v�t c� th� luy�n %d Th�n T�n ��n",RD_REFINE_MAX));
		return 0;
	end
	if DelItem(2,1,30230, RD_REFINE_COST) == 1 then
		gf_AddItemEx2({2,1,30520,1}, "Th�n T�n ��n", "EVENT THAN TAN DON 2013", "Luy�n Th�n T�n ��n", 15*24*3600, 1);
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.RefineTimes, VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.RefineTimes) + 1);
	end
end


--��ɢ��ʹ�ýű�
function OnUse(nItem)
    	local nDate = tonumber(date("%y%m%d"))
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.DaySeq) ~= nDate then
		VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.DaySeq, nDate);
		for i = 2, 10 do
			VET_201305_RD_TASKGROUP:SetTask(i, 0);
		end
	end
	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.UseTimes) >= RD_USE_MAX then
		Talk(1,"",format("M�i ng�y m�i nh�n v�t c� th� s� d�ng %d Th�n T�n ��n",RD_USE_MAX));
		return 0;
	end
	if GetTeamSize() < 2 then
		Talk(1,"","T� ��i tr�n 2 ng��i c� th� s� d�ng Th�n T�n ��n")
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i c� th� k�ch ho�t luy�n Th�n T�n ��n");
		return 0;
	end
	if GetTrigger(1531*2) ~= 0 then
		Talk(1,"","Kh�ng th� s� d�ng l�i Th�n T�n ��n");
		return 0;
	end
	if DelItemByIndex(nItem, 1) ~= 1 then
		return 0;
	end
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.TeamSize, GetTeamSize());
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.TriggerCount, 0);
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.UseTimes, VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.UseTimes) + 1);
	CreateTrigger(1, 1531, 1531*2);
	ContinueTimer(GetTrigger(1531*2));
end

function OnTimer()
	local nCount = VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.TriggerCount);
	if nCount >= RD_TOTAL_COUNT then
		RemoveTrigger(GetTrigger(1531*2));
		Msg2Player("T�c d�ng c�a Th�n T�n ��n k�t th�c");
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		RemoveTrigger(GetTrigger(1531*2));
		Talk(1,"","Ch� c� ��i tr��ng m�i nh�n ���c hi�u qu� Th�n T�n ��n");
		return 0;
	end
--	if VET_201305_RD_TASKGROUP:GetTask(VET_201305_RD_TASKGROUP.TeamSize) < GetTeamSize() then
--		RemoveTrigger(GetTrigger(1531*2));
--		Msg2Player("Th�nh vi�n trong t� ��i c� s� thay ��i".."T�c d�ng c�a Th�n T�n ��n k�t th�c");
--		return 0;
--	end
	VET_201305_RD_TASKGROUP:SetTask(VET_201305_RD_TASKGROUP.TriggerCount, nCount + 1);
	local OldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if OldPlayerIndex == PlayerIndex then
			if RD_EXP_CAP_AWARD[GetTeamSize()] then
				ModifyExp(RD_EXP_CAP_AWARD[GetTeamSize()]);
				Msg2Player(format("Th�n T�n ��n: c�c h� nh�n ���c %d kinh nghi�m [%d/%d]", RD_EXP_CAP_AWARD[GetTeamSize()], nCount, RD_TOTAL_COUNT));
			end
		else
			ModifyExp(RD_EXP_AWARD);
			Msg2Player(format("Th�n T�n ��n: c�c h� nh�n ���c %d kinh nghi�m [%d/%d]", RD_EXP_AWARD, nCount, RD_TOTAL_COUNT));
		end
	end
	PlayerIndex = OldPlayerIndex;
end