Include("\\script\\lib\\date.lua")
Include("\\script\\missions\\siling_trial\\slt_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--interface for vng
SLT_NPC_DIALOG = "Th� Luy�n T� Linh/main_slt";

SLT_NPC = "<color=green>B�c ��u L�o Nh�n:<color>"

function main()
	main_slt();
end

function main_slt()
	local tSay = {
		format("Tinh l�c tham d� (M�i ng��i ti�u hao %d tinh l�c)/slt_npc_join_1", SLT_COST_NUM_1),
		format("Thi�n Ki�u L�nh tham d� (��i tr��ng ti�u hao %d Thi�n Ki�u L�nh)/slt_npc_join_2", SLT_COST_NUM_2),
		"Ra kh�i/nothing",	
	}
	Say(SLT_NPC..format("C�p %d tr� l�n ��ng th�i s� h�u b�n ��ng h�nh ph�c sinh m�i c� t� c�ch tham gia Th� Luy�n T� Linh. Th� Luy�n T� Linh c�n %d ng��i tr� l�n t� ��i m�i ���c tham gia.", SLT_LIMIT_LEVEL, SLT_LIMIT_PLAYER), getn(tSay), tSay);
end

function slt_npc_join_1()
	local today = Date();
	local wday = today:week();
	if wday ~= 2 and wday ~= 5 and wday ~= 0 then
		Say("Th� Luy�n T� Linh ch� m� v�o th� 3, th� 6 v� ch� nh�t h�ng tu�n!", 0);
		return 0;
	end
	if slt_check_team(1) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nMapSeq, nAeraSeq = slt_GetRandMap(npcIndex);
	if nMapSeq == 0 or nAeraSeq == 0 then
		Say(SLT_NPC.."T�m th�i kh�ng c� khu v�c tr�ng �� ti�n h�nh Th� Luy�n T� Linh, xin h�y quay l�i sau!", 0);
		return 0;
	end
	gf_TeamOperateEX(ModifyEnergy, -SLT_COST_NUM_1, 1);
	slt_JoinAera(npcIndex, nMapSeq, nAeraSeq);
	AddRuntimeStat(26, 1, 0, 1);--������������
end

function slt_npc_join_2()
	local today = Date();
	local wday = today:week();
	if wday ~= 2 and wday ~= 5 and wday ~= 0 then
		Say("Th� Luy�n T� Linh ch� m� v�o th� 3, th� 6 v� ch� nh�t h�ng tu�n!", 0);
		return 0;
	end
	if slt_check_team(2) ~= 1 then
		return 0;
	end
	local npcIndex = GetTargetNpc();
	local nMapSeq, nAeraSeq = slt_GetRandMap(npcIndex);
	if nMapSeq == 0 or nAeraSeq == 0 then
		Say(SLT_NPC.."T�m th�i kh�ng c� khu v�c tr�ng �� ti�n h�nh Th� Luy�n T� Linh, xin h�y quay l�i sau!", 0);
		return 0;
	end
	if DelItem(2, 97, 236, SLT_COST_NUM_2) ~= 1 then
		return 0;
	end
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {2,97,236,SLT_COST_NUM_2})
	slt_JoinAera(npcIndex, nMapSeq, nAeraSeq);
	AddRuntimeStat(26, 1, 1, 1);--IB��������
	AddRuntimeStat(26, 4, 0, SLT_COST_NUM_2);--IB���ļ���
end

function slt_check_team(nType)
	if GetCaptainName() ~= GetName() then
		Say(SLT_NPC.."Ch� c� ��i tr��ng m�i c� th� b�o danh tham gia Th� Luy�n T� Linh!", 0);
		return 0
	end
		
	local nTeamSize = gf_GetTeamSize();
	if nTeamSize < SLT_LIMIT_PLAYER then
		Say(SLT_NPC..format("T� ��i kh�ng �� %d ng��i, kh�ng th� m� Th� Luy�n T� Linh.", SLT_LIMIT_PLAYER), 0);
		return 0;
	end
	
	if gf_CheckTeam(function () 
			if GetLevel() < SLT_LIMIT_LEVEL and gf_GetPlayerRebornCount() <= 0 then
				return 0
			end
			return 1;
		end, SLT_NPC..format("Th�nh vi�n d��i ��y kh�ng ��t c�p %d:\n", SLT_LIMIT_LEVEL)) ~= 1 then
		return 0;
	end
	
	if gf_CheckTeam(function () 
			if gf_IsWorkingPet() ~= 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."Nh�ng th�nh vi�n d��i ��y kh�ng c� b�n ��ng h�nh xu�t chi�n: \n") ~= 1 then
		return 0;
	end
	
	if gf_CheckTeam(function () 
			if CanNpcChangeModel(PIdx2NpcIdx()) ~= 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."Nh�ng th�nh vi�n d��i ��y c� th� � tr�ng th�i c��i ng�a,ngh�i thi�n, ��c,t��ng t�c n�n kh�ng th� bi�n th�n: \n") ~= 1 then
		return 0;
	end
	
	if gf_CheckTeam(function () 
			local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
			if bOk == 1 and SLT_CHANGE_PET ~= 0 then
				return 0;
			end
			return 1;
		end, SLT_NPC.."Nh�ng th�nh vi�n d��i ��y �� � tr�ng th�i b�n ��ng h�nh bi�n th�n: \n") ~= 1 then
		return 0;
	end
	
	if 1 == nType then
		if gf_CheckTeam(function () 
				if ModifyEnergy(0, 1) < SLT_COST_NUM_1 then
					return 0
				end
				return 1;
			end, SLT_NPC..format("Th�nh vi�n d��i ��y tinh l�c kh�ng �� %d �i�m\n", SLT_COST_NUM_1)) ~= 1 then
			return 0;
		end
	else
		if GetItemCount(2, 97, 236) < SLT_COST_NUM_2 then
			Say(SLT_NPC..format("Trong h�nh trang %s s� l��ng kh�ng �� %d", "Thi�n Ki�u L�nh", SLT_COST_NUM_2), 0);
			return 0
		end
	end
	
	return 1;	
end