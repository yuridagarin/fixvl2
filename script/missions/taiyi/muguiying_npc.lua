Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\script\\missions\\taiyi\\tyfunctions.lua");
Include("\\script\\system_switch_config.lua")

g_szNpcName = "<color=green>Ti�n Phong M�c Qu� Anh:<color>";

function main()
	if _check_subsystem_open(SYS_SWITCH_TAIYI, 2) ~= 1 then
		return 0;
	end
	local szName;
	local strTab = {
		format("Ta mu�n tham gia Ph�n Thi�n L�m-Anh H�ng (T�n %s)/Talk_1", "Tinh L�c*"..TYT_JOIN_COST_JINGLI[1][2]),
		format("Ta mu�n tham gia Ph�n Thi�n L�m-Anh H�ng (��i tr��ng t�n %s)/Talk_1_IB", TYT_JOIN_COST_ITEM[1][2][2].."*"..TYT_JOIN_COST_ITEM[1][2][1][4]),
		--format("��Ҫ�μ�Ӣ���Ѷȵ�̫һ��(����%s)/Talk_2", "����*"..TYT_JOIN_COST_JINGLI[2][2]),
		--format("��Ҫ�μ�Ӣ���Ѷȵ�̫һ��(�ӳ�����%s)/Talk_2_IB", TYT_JOIN_COST_ITEM[2][2][2].."*"..TYT_JOIN_COST_ITEM[2][2][1][4]),
		--"̫һ��ϵ�йؿ�Ӣ���ѶȲμ�����/Talk_5",
		"�i Th�i Nh�t Th�p c�ng th�m s�t th��ng/Talk_6",
		"H�y b�/nothing",
	};
	
	if GetSex() == 1 then
		szName = "��i hi�p";
	elseif GetSex() == 2 then
		szName = "N� hi�p ";
	end
	Say(format(g_szNpcName.."Tr�n chi�n Kim Sa Than, D��ng L�nh C�ng b� gian th�n Phan M� b�n ��ng n�n �� d��i tay c�a qu�n li�u, v� hi sinh n�i ��t Li�u.Sau khi bi�t tin D��ng Nghi�p ���c an t�ng t�i n�i c� t�n l� Th�i Nh�t Th�p, th� ta v� Qu� Anh ph�ng l�nh x�ng v�o Th�i Nh�t Th�p �� t�m h�i c�t v� b�i �ao Hoang H�a L�u Kim c�a L�nh C�ng. Th�i Nh�t Th�p n�y c� quan tr�ng tr�ng, %s �� s�n s�ng ch�a?", szName), getn(strTab), strTab);
end

function Talk_1()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.HARD) then return 0; end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph�n Thi�n L�m �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	SetGlbValue(GLB_TASKID, GetGlbValue(GLB_TASKID) + 1);
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 2, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 42, GetPlayerRoute(), 1);		
	end);
end

function Talk_1_IB()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.FOREST, eDifType.HARD) then return 0; end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Ph�n Thi�n L�m �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.FOREST, eDifType.HARD) then
		return 0;
	end
	
	SetGlbValue(GLB_TASKID, GetGlbValue(GLB_TASKID) + 1);
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.FOREST, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
	
	AddRuntimeStat(18, 1, 0, 1);
	AddRuntimeStat(18, 3, 0, 1);
	if gf_GetRouteCount() >= 8 then
		AddRuntimeStat(18, 4, 0, 1);
	end
	gf_TeamOperateEX(function ()
		AddRuntimeStat(18, 42, GetPlayerRoute(), 1);		
	end);
end

function _checkOpenTime()
	--do return 1 end--�������
	
	local nWeekDay = tonumber(date("%w"))
	if nWeekDay~=3 and nWeekDay~=6 and nWeekDay~=0 then
		Talk(1, "", g_szNpcName..format("Th�i Nh�t Th�p_Anh H�ng m� th� [%s] h�ng tu�n", "Th� 4, th� 7, ch� nh�t"));
		return 0
	end
	return 1
end

function TY_ChargeTicket()
	SetTask(TASKID_TAIYI_TICKET, GetTask(TASKID_TAIYI_TICKET) - 1);
end

function Talk_2()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Th�i Nh�t Th�p �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostJingLi(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
end

function Talk_2_IB()
	if 1~=_checkOpenTime() then return 0 end
	if 1 ~= TY_EnterCondCheck(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 0 == TY_CheckMapCountLimit(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.HARD, 1) then
		return 0;
	end
	
	local nMapId = tTY:Create();
	if 0 == nMapId then
		Talk(1, "", g_szNpcName.."Th�i Nh�t Th�p �ang r�t ch�t ch�i, h�y quay l�i sau!");
		return 0;
	end
	
	if 1 ~= TY_CheckAndCostItem(g_szNpcName, eMSName.TOWER, eDifType.HARD) then
		return 0;
	end
	
	mf_SetMissionV(tTY.missionID, tTY.mv_01, eMSName.TOWER, nMapId);
	mf_SetMissionV(tTY.missionID, tTY.mv_02, eDifType.HARD, nMapId);
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetBeginPos({%d,%d})", tPlayerPos[0][1][1], tPlayerPos[0][1][2]));
	SendScript2VM("\\script\\missions\\taiyi\\mission.lua", format("TY_SetPKFlag(%d, %d)", 1, 1));
	tTY:TeamEnter(nMapId, 1);
end

function TY_Enter(nCamp)
	self.msOption:check(nCamp);
	local m,x,y = self.msPosition:getEntryPos(nCamp);
	CleanInteractive();--��NewWorldǰ��ɢ˫�˻�������
	NewWorld(nMapId, tPlayerPos[4][1], tPlayerPos[4][2]);
end

function Talk_6()
	local msg = "";
	tRouteList.n = nil;
	
	if 1 == _JX2WZ then
		for k,v in tRouteList do
			msg = msg..format("%-16s s�t th��ng c�ng th�m: <color=yellow>%d%%<color>\n",tList[k], tRouteList[k][2][1]);
		end
	else
		for k,v in tRouteList do
			if k <= 21 or k == 31 or k == 32 or k == 23 then
				msg = msg..format("%-16s s�t th��ng c�ng th�m: <color=yellow>%d%%<color>\n",tList[k], tRouteList[k][2][2]);
			end
		end
	end
	suTalk("main", g_szNpcName.."�i Th�i Nh�t Th�p s�t th��ng c�c ph�i c�ng th�m nh� sau\n"..msg);
end

function Talk_5()
	suSay(g_szNpcName.."Trong Th�i Nh�t Th�p ch�c c� c� quan tr�ng tr�ng, r�t nguy hi�m, ��i hi�p �� chu�n b� s�n s�ng ch�a? �i�u ki�n �i v�o c�a �i bao g�m: \n	  c�n t� ��i �i v�o, th�nh vi�n t� ��i l� 4-8 ng��i; \n	  s� l�u ph�i t� ��i >= 4; \n	  ��ng c�p t�t c� gamer trong t� ��i >=90; \n	  t�t c� gamer trong t� ��i �� gia nh�p m�n ph�i;", 2, "tr� l�i/main", "K�t th�c/nothing");
end
