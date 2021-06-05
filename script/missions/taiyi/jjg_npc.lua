Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\misc\\observer\\observer_head.lua")

g_NpcName = "<color=green>Thanh Thanh C� N��ng:<color>";

tNonsense = {
	"Hi hi, cu�i c�ng c�ng �� �u�i ���c huynh �� nh� h� Ng� �i r�i, t� nay ��y s� l� ��a b�n c�a ta!",
	"Th� c��i c�a ta ��y, ��p kh�ng? N� l� T�ch T� Th�n Th� ��.",
	"N�i nh� cho ng��i bi�t: Th�i Nh�t Th�p v� ta c� quan h� r�t l�n ��y.",
	"��n Th�i Nh�t Th�p nh�t ��nh ph�i mang theo Ph�t Mu�i Mu�i.",
	"Ph�i nghe k� cu�c ��i tho�i c�a M�c Qu� Anh v� D��ng T�n B�o!",
	"V��t �i th�t b�i c� th� khi�u chi�n l�i, kh�ng c�n tho�t ra ��ng nh�p l�i.",
};

function main()
	local strTab = {
		"\n r�i �i/JJG_ConfirmLeave",
		"\nTa mu�n quay l�i chi�n tr��ng (C�n ["..TYT_IB_ITEM[1].."]x1)/JJG_Back2Fight",
		"\nK�t th�c ��i tho�i/nothing",
	};
	local nIdx = random(1, getn(tNonsense));
	Say(g_NpcName..tNonsense[nIdx], getn(strTab), strTab);
end

function JJG_ConfirmLeave()
	local strtab = {
			"\n ��ng n�i nhi�u l�i, t�i h� ph�i �i/JJG_Leave",
			"\n ng�i quan s�t ch� th�ng quan/nothing",
		};
	Say(g_NpcName.."Thi�u hi�p kh�ng n�n d� d�ng b� cu�c.",
		getn(strtab),
		strtab)
end

function JJG_Leave()
	LeaveTeam(1);
	local nMapId = GetMissionV(MV_RETURN_MAP_ID);
	TY_ClearAllGodState();
	NewWorld(nMapId, tExitPos[nMapId][1], tExitPos[nMapId][2]);
	if GetMSPlayerCount(tTY.missionID) == 0 then
		CloseMission(tTY.missionID);
	end
end

function JJG_AddGodState()
	if 1 == GetMissionV(tTY.mv_03) then	--����ģʽ
		TY_AddGodState();
	end
	local nType = 1;
	if 1 ~= _JX2WZ then nType = 2; end
	local nRoute = GetPlayerRoute();
	if tRouteList[nRoute] and tRouteList[nRoute][2][nType] > 0 then
		RemoveState(10010);
		Msg2Player(format("T�n c�ng +%d%%, duy tr� 5 ph�t", tRouteList[nRoute][2][nType]));
		CastState("state_attack_npc_add_spec", tRouteList[nRoute][2][nType], 5*60*18, 1, 10010);
	end
end

function JJG_Back2Fight()
	local nCurStageId = GetMissionV(MV_STAGE);
	if not tPlayerPos[nCurStageId] then
		WriteLog(format("[Th�i Nh�t Th�p] [StageId = %d, Quay v� t�a �� ban ��u c�a chi�n tr��ng b� l�i]\n", nCurStageId));
		return 0;
	end
	
	if 1 ~= DelItem(TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1) then
		Talk(1, "", g_NpcName.."Mang theo tr�n ng��i"..TYT_IB_ITEM[1].."Kh�ng ��!");
		return 0;
	end
	SetFightState(1);
	JJG_AddGodState();
	RestoreAll();
	TY_SetPlayerPos(tPlayerPos[nCurStageId][1]);
	local nMSType = GetMissionV(1);
	local nTaskID = tTaskID.ConsumeTaskID[nMSType];
	SetTask(nTaskID, GetTask(nTaskID) + 2);
	AddRuntimeStat(18, 5, GetMissionV(2)-1, 1);
	local nMapId = GetWorldPos();
	SetTempRevPos(nMapId, tDeathPos[1]*32, tDeathPos[2]*32);
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1})
end