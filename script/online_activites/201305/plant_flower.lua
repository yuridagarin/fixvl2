Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\online\\zgc_public_fun.lua")

VET_PLANT_FLOWER_ID = 88;

VET_BUY_COST = 33;

VET_TIME_MAX = 10 * 60;

VET_ABLE_DIS = 18;

VET_NPC_FLOWER = {
	[1] = {"Hoa h�ng ��", "Hoa h�ng ��"},
	[2] = {"Hoa h�ng v�ng", "Hoa h�ng v�ng"},
}

VET_EXP_TABLE = {
	[2] = {60000, 100000},
	[3] = {63000, 105000},
	[4] = {66000, 110000},
	[5] = {69000, 115000},
	[6] = {72000, 120000},
	[7] = {78000, 130000},
	[8] = {96000, 160000},
}

VET_BUY_FLOWER_DIALOG = {
	"K�ch ho�t tr�ng hoa/vet_plant_flower",
	format("Mua m�m hoa (%d v�ng/c�y)/vet_201305_sale_flower", VET_BUY_COST),
};

VET_201305_ROSE_TaskGroup = TaskManager:Create(8,5)
VET_201305_ROSE_TaskGroup.DaySeq = 1
VET_201305_ROSE_TaskGroup.ActiveTimes = 2
VET_201305_ROSE_TaskGroup.NpcIndex = 3
VET_201305_ROSE_TaskGroup.UseLimit = 4
VET_201305_ROSE_TaskGroup.TableIndex = 5
VET_201305_ROSE_TaskGroup.nMapId = 6
VET_201305_ROSE_TaskGroup.nX = 7
VET_201305_ROSE_TaskGroup.nY = 8
VET_201305_ROSE_TaskGroup.TeamSize = 9

--function VET_201305_AdditionDialog(tbSayDialog,szSayHead)
function VET_201305_AdditionDialog()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Th�ng tin chi ti�t c�c ho�t ��ng ��ng ��o c� th� xem tr�n trang ch� <color=green>http://volam2.zing.vn<color>."
	if gf_CheckEventDateEx(VET_PLANT_FLOWER_ID) == 1 then
		for i = 1, getn(VET_BUY_FLOWER_DIALOG) do
			tinsert(tbSayDialog, VET_BUY_FLOWER_DIALOG[i]);
		end
	end
	tinsert(tbSayDialog, "Tho�t/do_nothing");
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end

function vet_201305_sale_flower()
	local nFreeRoom = GetFreeItemRoom();
	local nCount = floor(GetCash() / (VET_BUY_COST * 10000));
	AskClientForNumber("sale_flower", 0, min(nFreeRoom, nCount),"title","");
end

function sale_flower(nNum)
	if nNum <= 0 then return 0; end
	if Pay(nNum * VET_BUY_COST * 10000) ==  1 then
		gf_AddItemEx2({2, 1, 30519, nNum}, "M�m hoa ", "HOA HONG THANG 5", "Mua m�m hoa", 24 *3600, 1);
	end
end

function vet_plant_flower()
    local nDate = tonumber(date("%y%m%d"))
    local nTeamSize = GetTeamSize()
	local nMapId = GetWorldPos();
	if gf_MapIsAllow({200, 300, 100, 150, 350, 400, 500}, nMapId) ~= 1 then
		Talk(1,"","Ch� ���c k�ch ho�t tr�ng hoa t�i c�c th�nh th� l�n (Bi�n Kinh, Th�nh ��, Tuy�n Ch�u, T��ng D��ng, D��ng Ch�u, ��i L�, Ph��ng T��ng).");
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"","Ch� ��i tr��ng m�i c� th� k�ch ho�t tr�ng hoa ");
		return 0;
	end
	if GetTeamSize() < 2 then
		Talk(1,"",format("T� ��i tr�n %d ng��i c� th� k�ch ho�t tr�ng hoa", 2));
		return 0;
	end
		
	local OldPlayerIndex = PlayerIndex;
	local msg = "Nh�ng th�nh vi�n sau kh�ng c� m�m hoa, kh�ng th� k�ch ho�t tr�ng hoa: \n";
--	local msg1 = "\n���ж�Ա������ȼ��������ƣ�\n";
	local nFlag = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetItemCount(2, 1, 30519) < 1 then
			msg = msg..GetName().."  ";
			nFlag = 1;
		end
--		if gf_CheckBaseCondition(55, 1) ~= 1 then
--			msg1 = msg1..GetName().."  ";
--			nFlag = 1;
--		end
	end
	PlayerIndex = OldPlayerIndex;
	if nFlag == 1 then
		Talk(1,"",msg);
		return 0;
	end
	--��������
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);	
		if VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.DaySeq) ~= nDate then
			VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.DaySeq, nDate);
			VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.ActiveTimes, 0);
			VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.NpcIndex, 0);
			VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.UseLimit, 0);
		end
	end
	PlayerIndex = OldPlayerIndex;
	
	if VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.NpcIndex) ~= 0 then
		Talk(1,"","ch� c� th� c�ng l�c k�ch ho�t 1 m�t hoa.");
		return 0;
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.UseLimit) >= 8 then
			Talk(1,"",format("M�i ng�y m�i nh�n v�t ch� ���c tham gia ho�t ��ng %d l�n.", 8));
			return 0;
		end
	end
	PlayerIndex = OldPlayerIndex;
	--ɾ������
	nFlag = 0;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if DelItem(2, 1, 30519, 1) ~= 1 then
			nFlag = 1;
			break 
		end
	end
	PlayerIndex = OldPlayerIndex;
	if nFlag == 1 then
		return 0;
	end
	local nIndex = random(1,100);
	if nIndex > 61 then
		plant_flower(2, nTeamSize);
	else
		plant_flower(1, nTeamSize);
	end
	
end

function plant_flower(nIndex, nTeamSize)
	local nMapId , nX, nY = GetWorldPos();
	local npcIndex = CreateNpc(VET_NPC_FLOWER[nIndex][1], VET_NPC_FLOWER[nIndex][2], nMapId , nX, nY);
	if not npcIndex or npcIndex <= 0 then  return 0; end
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.TableIndex, nIndex);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.NpcIndex, npcIndex);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.ActiveTimes, 0);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.nMapId, nMapId);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.nX, nX);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.nY, nY);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.TeamSize, GetTeamSize());

	--------
	local nOldPlayer = PlayerIndex
	for i = 1, nTeamSize do
	     PlayerIndex = GetTeamMember(i)
		VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.UseLimit, VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.UseLimit) + 1);
	end
	PlayerIndex = nOldPlayer
	--------
	if VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.UseLimit) == 8 then
		 gf_WriteLogEx("HOA HONG THANG 5", "kick ho�t th�nh c�ng", 1, "S� d�ng �� 8 l�n")
	end
	gf_WriteLogEx("HOA HONG THANG 5", "kick ho�t th�nh c�ng", 1, "S� d�ng hoa h�ng")
	--����������
	if GetTrigger(3010*2) == 0 then
		CreateTrigger(3, 3010, 3010*2);
	end
	if GetTrigger(1530*2) == 0 then
		CreateTrigger(1, 1530, 1530*2);
		ContinueTimer(GetTrigger(1530*2));
	end
end

function Leave_Game()
	plant_flower_over();
end

function OnTimer()
	local nTeamSize = GetTeamSize();
	if nTeamSize < 2 then
		Talk(1,"",format("T� ��i tr�n %d ng��i c� th� k�ch ho�t tr�ng hoa", 2));
		plant_flower_over();
		return 0;
	end
	if VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.TeamSize) < nTeamSize then
		Talk(1,"","Th�nh vi�n trong ��i ng� c� thay ��i, nh�n th��ng k�t th�c.")
		plant_flower_over();
		return 0;
	end
	local nActiveTimes = VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.ActiveTimes);
	if nActiveTimes * 10 > VET_TIME_MAX then
		plant_flower_over();
		return 0;
	end
	local nIndex = VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.TableIndex);
	if nIndex ~= 1 and nIndex ~= 2 then return 0;  end
	local tExp = VET_EXP_TABLE[nTeamSize];
	if not tExp then return 0; end
	local nMapId = VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.nMapId);
	local nX = VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.nX);
	local nY = VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.nY);
	local OldPlayerIndex = PlayerIndex;
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nMapP,nXP,nYP = GetWorldPos();
		if nMapP == nMapId and gf_GetDistance(nX,nY,nXP,nYP) < VET_ABLE_DIS then
			ModifyExp(tExp[nIndex]);
			SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0, 3*18);
		end
	end
	PlayerIndex = OldPlayerIndex;
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.ActiveTimes, nActiveTimes + 1);
end

function plant_flower_over()
	local npcIndex = VET_201305_ROSE_TaskGroup:GetTask(VET_201305_ROSE_TaskGroup.NpcIndex);
	if GetNpcName(npcIndex) == "Hoa h�ng ��" or GetNpcName(npcIndex) == "Hoa h�ng v�ng" then
		SetNpcLifeTime(npcIndex, 0);
	end
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.TableIndex, 0);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.NpcIndex, 0);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.ActiveTimes, 0);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.nMapId, 0);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.nX, 0);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.nY, 0);
	VET_201305_ROSE_TaskGroup:SetTask(VET_201305_ROSE_TaskGroup.TeamSize, 0);
	if GetTrigger(3010*2) ~= 0 then
		RemoveTrigger(GetTrigger(3010*2));
	end
	if GetTrigger(1530*2) ~= 0 then
		RemoveTrigger(GetTrigger(1530*2));
	end
end
function do_nothing()

end