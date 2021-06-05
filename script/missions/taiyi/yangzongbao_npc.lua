Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\system_switch_config.lua")

g_szNpcName = "<color=green>Ti�n Phong D��ng T�n B�o:<color>";

function main()
	if _check_subsystem_open(SYS_SWITCH_TAIYI, 2) ~= 1 then
		return 0;
	end
	local szName;
	local strTab = {
		format("Ta mu�n tham gia Ph�n Thi�n L�m-Th��ng (T�n %s)/Talk_1_1", "Tinh L�c*"..TYT_JOIN_COST_JINGLI[1][1]),
		format("Ta mu�n tham gia Ph�n Thi�n L�m-Th��ng (��i tr��ng t�n %s)/Talk_1_1_IB", TYT_JOIN_COST_ITEM[1][1][2].."*"..TYT_JOIN_COST_ITEM[1][1][1][4]),
		--format("��Ҫ�μ���ͨ�Ѷȵ�̫һ��(����%s)/Talk_1_2", "����*"..TYT_JOIN_COST_JINGLI[2][1]),
		--format("��Ҫ�μ���ͨ�Ѷȵ�̫һ��(�ӳ�����%s)/Talk_1_2_IB", TYT_JOIN_COST_ITEM[2][1][2].."*"..TYT_JOIN_COST_ITEM[2][1][1][4]),
		--"�ؿ���ͨ������ȡ/Talk_1_6",
		"H�y b�/nothing",
	};
	
	if GetSex() == 1 then
		szName = "��i hi�p";
	elseif GetSex() == 2 then
		szName = "N� hi�p ";
	end
	Say(format(g_szNpcName.."Tr�n chi�n Kim Sa Than, D��ng L�nh C�ng b� gian th�n Phan M� b�n ��ng n�n �� d��i tay c�a qu�n li�u, v� hi sinh n�i ��t Li�u.Sau khi bi�t tin D��ng Nghi�p ���c an t�ng t�i n�i c� t�n l� Th�i Nh�t Th�p, th� ta v� Qu� Anh ph�ng l�nh x�ng v�o Th�i Nh�t Th�p �� t�m h�i c�t v� b�i �ao Hoang H�a L�u Kim c�a L�nh C�ng. Th�i Nh�t Th�p n�y c� quan tr�ng tr�ng, %s �� s�n s�ng ch�a?", szName), getn(strTab), strTab);
end

function Talk_1_1()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph�n Thi�n L�m �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 2, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey�
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
end

function Talk_1_1_IB()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph�n Thi�n L�m �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 3, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 40, GetPlayerRoute(), 1);		
	end);
	
	--cdkey�
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(5)");	
	end);
end

function Talk_1_2()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph�n Thi�n L�m �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_2_IB()
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end

	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph�n Thi�n L�m �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.NORMAL) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.NORMAL, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 0, 0));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_1_6()
	local strTab = {
		"Nh�n l�y ph�n th��ng./Talk_1_6_1",
		"H�y b�/nothing",
	};
	local msg = "�� b�y t� l�ng bi�t �n ��i v�i nh�ng hi�p s� ��u ti�n v��t qua Th�i Nh�t Th�p-Anh H�ng �� �o�t l�i tro c�t c�a Gia Gia, t�t c� ng��i ch�i tr�n c�p 80 ��u nh�n ���c 1 ph�n th��ng L�n ��u Qua �i";
	msg = msg..""
	Say(g_szNpcName..msg, getn(strTab), strTab);
end

function Talk_1_6_1()
--	local nDate = tonumber(date("%Y%m%d"));
--	local szGroupName = GetRelayGroup();
--	if 1 == _JX2WZ then
--		szGroupName = "wz"..szGroupName;
--	elseif 1 == _JX2PAY then
--		szGroupName = "pay"..szGroupName;
--	elseif 1 == _JX2IB then
--		szGroupName = "free"..szGroupName;
--	end
--	
--	if nDate < 20120331 or nDate > 20120405 then
--		Talk(1, "", g_szNpcName.."��ͨ�������ȡʱ��Ϊ2012��3��31��-2012��4��05�ա�");
--		return 0;
--	end
--
--	if GetLevel() < 80 then
--		Talk(1, "", "ֻ��80�����ϵ���Ҳ�����ȡ��");
--		return 0;
--	end
--	
--	local tSpecGroup = {
--		["wz1-1"] = 1,
--		["wz3-1"] = 1,
--		["free100-8"] = 1,
--		["pay1-3"] = 1,
--	};
--	if 0 == GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
--		if tSpecGroup[szGroupName] then
--			if 1 ~= gf_Judge_Room_Weight(13, 100, g_szNpcName) then
--				return 0;
--			end
--		else
--			if 1 ~= gf_Judge_Room_Weight(7, 100, g_szNpcName) then
--				return 0;
--			end
--		end
--	end
--	
--	if 0 ~= GetTask(TASKID_TAIYI_SHOUTUI_PRIZE) then
--		Talk(1, "", g_szNpcName.."�˽���������ȡ��");
--		return 0;
--	end
--	SetTask(TASKID_TAIYI_SHOUTUI_PRIZE, nDate);
--	
--	WriteLog(format("[̫һ�����ƽ���] [%s ��ȡ����, Account:%s]", GetName(), GetAccount()));
--	if tSpecGroup[szGroupName] then
--		gf_Modify("Exp", (10000000 + 1000000*(GetLevel()-80)) * 2);
--		gf_AddItemEx({2, 95, 1506, 10, 4}, "�����Ƭ");
--		gf_AddItemEx({2, 0, 553, 2, 4}, "���˲ι�");
--		gf_AddItemEx({2, 1, 270, 10, 4}, "�׾���");
--	else
--		gf_Modify("Exp", 10000000 + 1000000*(GetLevel()-80));
--		gf_AddItemEx({2, 95, 1506, 5, 4}, "�����Ƭ");
--		gf_AddItemEx({2, 0, 553, 1, 4}, "���˲ι�");
--		gf_AddItemEx({2, 1, 270, 5, 4}, "�׾���");
--	end
end
