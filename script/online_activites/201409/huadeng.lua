Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\globalvalue.lua")

DebugOutput = nothing;

HD_START = {2014, 09, 07, 0, 0, 0};
HD_END = {2014, 09, 16, 0, 0, 0};

HD_NPC_NAME = "��n Hoa ��ng"

HD_PK_STATE = {
	[0] = {
		[0] = -9,
	},
	[1] = {
		[0] = 0,
		[1] = 1,
		[2] = 2,
	},
	[2] = {
		[0] = 3,
	},
	[3] = {
		[0] = 4,
	},
}

HD_NPC_POS = {
	{303, 1548, 3247, "Nga My (193,202)"},
	{305, 1563, 3005, "���ng M�n (195,187)"},
	{209, 1480, 3243, "C�i Bang (185,202)"},
	{312, 1760, 3433, "V� �ang (219,214)"},
	{407, 1576, 3312, "Ng� ��c Gi�o (197,206)"},
	{219, 1684, 3268, "Thi�n Ba D��ng Ph� (211,204)"},
	{204, 1523, 3258, "Thi�u L�m Ph�i (190,203)"},
	{404, 1403, 2929, "Th�y Y�n (175,183)"},
}

HD_MISSION_ID = {67, 68, 69};
HD_TIMER_ID = {97, 98, 99};

HD_GV_ID = {GV_ID_HUADENG_MAP_ID_1, GV_ID_HUADENG_MAP_ID_2, GV_ID_HUADENG_MAP_ID_3};

HD_TASK_GROUP =  TaskManager:Create(10, 10);
HD_TASK_GROUP.DaySeq = 1; --����
HD_TASK_GROUP.Time = 2; 
HD_TASK_GROUP.Box = 3;
HD_TASK_GROUP.Limit = 4;
HD_TASK_GROUP.Flag = 5;

function hd_IsActivityOpen()
	return gf_CheckDuration(HD_START, HD_END);
end

--Relayˢ����
function hd_CreateLantern(nRandomSeed)
	if hd_IsActivityOpen() ~= 1 then
		return 0;
	end
	randomseed(nRandomSeed);
	local tPos = gf_Random(1, getn(HD_NPC_POS), 3);
	if getn(tPos) ~= 3 then
		DebugOutput("UDERROR: getn(tPos) ~= 3")
		return 0;
	end
	if tPos[1] < 1 or tPos[1] > getn(HD_NPC_POS) or
		tPos[2] < 1 or tPos[2] > getn(HD_NPC_POS) or
		tPos[3] < 1 or tPos[3] > getn(HD_NPC_POS) then
		DebugOutput("UDERROR: tPos[i] < 1 or tPos[i] > getn(HD_NPC_POS)");
		return 0;
	end
	Msg2Global(format("��n Hoa ��ng �� xu�t hi�n � b�n �� %s, %s, %s, c�c v� ��i hi�p h�y nhanh ch�ng �i tham gia n�o!", HD_NPC_POS[tPos[1]][4], HD_NPC_POS[tPos[2]][4], HD_NPC_POS[tPos[3]][4]))
	
	for i = 1, getn(tPos) do
		DebugOutput(tPos[i], SubWorldID2Idx(HD_NPC_POS[tPos[i]][1]))
		if SubWorldID2Idx(HD_NPC_POS[tPos[i]][1]) ~= -1 then
			local npcIndex = CreateNpc("��n K�o Qu�n", HD_NPC_NAME, HD_NPC_POS[tPos[i]][1], HD_NPC_POS[tPos[i]][2], HD_NPC_POS[tPos[i]][3]);
			if npcIndex > 0 then
				SetNpcScript(npcIndex, "\\script\\online_activites\\201409\\huadeng.lua");
				SetNpcLifeTime(npcIndex, 30 * 60);
				mf_OpenMission(HD_MISSION_ID[i], HD_NPC_POS[tPos[i]][1]);
				mf_SetMissionV(HD_MISSION_ID[i], 1, HD_NPC_POS[tPos[i]][1], HD_NPC_POS[tPos[i]][1]);
				mf_SetMissionV(HD_MISSION_ID[i], 2, npcIndex, HD_NPC_POS[tPos[i]][1]);
				mf_SetMissionV(HD_MISSION_ID[i], 3, GetTime(), HD_NPC_POS[tPos[i]][1]);
				SetGlbValue(HD_GV_ID[i], HD_NPC_POS[tPos[i]][1]);
			end
		end
	end
end

--�����Ƿ񼤻�
function hd_IsActivate(npcIndex)
	for i = 1, 5 do
		if GetNpcTempData(npcIndex, i - 1) == 0 then
			return 0;
		end
	end
	return 1;
end
	
--���ƶԻ�
function main()
	if hd_IsActivityOpen() ~= 1 then
		Say("Event �� h�t h�n", 0);
		return 0;
	end
	if gf_CheckBaseCondition(90) ~= 1 then
		return 0;
	end
	local targetNpc = GetTargetNpc();
	if GetNpcName(targetNpc) ~= HD_NPC_NAME then
		return 0;
	end
	if hd_IsActivate(targetNpc) ~= 1 then
		--û�м��� ��ɫ����ɫ����ɫpk�� ��ɱpk������pk
		local tSay = {};
		local namePK = {"PK m�u v�ng", "PK m�u t�m", "PK m�u l�c", "PK �� s�t", "PK bang ph�i"};
		local state = {
			[0] = "Ch�a k�ch ho�t", 
			[1] = "�� k�ch ho�t"
		};
		for i = 1, 5 do
			tinsert(tSay, format("K�ch ho�t %s(%s)/#hd_ActivatePK(%d)", namePK[i], state[GetNpcTempData(targetNpc, i - 1)], i))
		end
		tinsert(tSay, "�� ta suy ngh�/nothing");
		Say(format("<color=green>%s:<color>", HD_NPC_NAME).."<color=red>Ch�a k�ch ho�t, kh�ng th� nh�n th��ng!<color> (Sau khi k�ch ho�t m�i 3 ph�t s� nh�n ���c 690000 EXP)", getn(tSay), tSay);
	else
		--�Ѿ�����
		hd_DailyReset();
		local nTime = GetTime();
		if nTime - HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Time) > 180 then
			HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Time, nTime);
			gf_Modify("Exp", 690000);
			if HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Flag) == 0 then
				DoFireworks(832, 3);
				HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Flag, HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Flag) + 1);
			end
		else
			local nLast = 180 - nTime + HD_TASK_GROUP:GetTask(HD_TASK_GROUP.Time);
			Say(format("<color=green>%s:<color>", HD_NPC_NAME)..format("C�n %d ph�t %d gi�y m�i ���c nh�n ph�n th��ng l�n sau!", floor(nLast/ 60), mod(nLast, 60)), 0)
		end
	end
end

function hd_ActivatePK(nIndex)
	local targetNpc = GetTargetNpc();
	if GetNpcTempData(targetNpc, nIndex - 1) ~= 0 then
		Say(format("<color=green>%s:<color>", HD_NPC_NAME).."M�u PK n�y �� b� k�ch ho�t!", 0);
		return 0;
	end
	
	local nState, nPKFlag = GetPKFlag();
	DebugOutput("nState, nPKFlag =", nState, nPKFlag);
	if HD_PK_STATE[nState][nPKFlag] ~= nIndex - 1 then
		Say(format("<color=green>%s:<color>", HD_NPC_NAME).."M�u PK n�y kh�ng th� ho�n th�nh k�ch ho�t!", 0);
		return 0;
	end
		
	SetNpcTempData(targetNpc, nIndex - 1, 1);
	Say(format("<color=green>%s:<color>", HD_NPC_NAME)..format("K�ch ho�t th�nh c�ng!"), 0);
	
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(targetNpc,905,0,0);
end

--ÿ������
function hd_DailyReset()
	if HD_TASK_GROUP:GetTask(HD_TASK_GROUP.DaySeq) ~= zgc_pub_day_turn() then
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.DaySeq,zgc_pub_day_turn());
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Time,0);
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Box,0);
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Limit,0);
		HD_TASK_GROUP:SetTask(HD_TASK_GROUP.Flag,0);
	end
end